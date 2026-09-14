Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17113C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnU53wfby+bYoNHfYaRp6LT4I0e91gGtMuqCVelrtEA=; b=i8VfE7nxGBvLXzY7BBn/QtakNm
	9UODFMbCGuWM5Anxf3q7MXE9QyKMS0d+iqJZjsmqsDTC5VIMBqtW0HkbkqOPumEgtV3WYSqMyCDjY
	9w+PAGBS87iVUSd2+AwyOgJTpX4nZvhXT43DKcRevIbHR766VBlZssSS3Zihd3DjhAZtoraoFpHEC
	ixk3dq9awEL50Kk9PZxHWnra6dkp0ApW2oTamAazbWWBbjrSPCAbRVoYgfRd5JL2NK0OEqm5ie61c
	VJ7FjgKvQipyekSXoxjPN4BDV67AOvBa7/pf2Gu/fO8jd6GA/Tn8ktiFnEVL/hrvfILSH1N/kqYoD
	pFLA5Cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6C0W-00000004Vea-48f0;
	Mon, 14 Sep 2026 19:06:24 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6C0T-00000004Ve3-2sTs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 19:06:23 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 5ECD11D000C6;
	Mon, 14 Sep 2026 15:06:16 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 14 Sep 2026 15:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789412775;
	 x=1789499175; bh=vnU53wfby+bYoNHfYaRp6LT4I0e91gGtMuqCVelrtEA=; b=
	Ped3ttLvpiBljGiwS7PDo7eJvFIXZTqN2SQ1gQAHWmty5XKclpMURIG2Y3+bCNH6
	oplraayaMbKpANCAGNJVWzdzFLsoDpqg//uyWBGTaYGMMdRmBqnzXEvnc55hi+z4
	/KBcty9JhHUmHkfomv8KBY1s/N5sgSamkaygdZQ60uXaSuvwHrKY4mDOH9kpG2yD
	/odgwsn8seJcdoc5/0sxvzDm+77gZxVRjKm5UH+kqw4/KvEFnJVORxqAWXwEn7D1
	fLpDef8JeRq+q65XGv5sbUQ/F0NwV1vpz8ozFv2DhpU4QpbLB0m7jDZlp+WlMpGa
	rF9/uETu6hvs/jXMalvGRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789412775; x=
	1789499175; bh=vnU53wfby+bYoNHfYaRp6LT4I0e91gGtMuqCVelrtEA=; b=Q
	rqMZ07YmB3YOx/JdV9nK4CUajrvzaU8rXAXViZ1fktY8coHEWc5zrCywVmYGCeW3
	VMsvrQDBwcbD2+kfplhT3xrkKeL7CMUTcfKvR1iliewHHaHXyyYAZ9Ielr46v4UD
	jx7ILGN3K4rspT5iUY2ZXL3zKty+XCFh+t5K5YXkq0LnZuuRfqvoxQp4NuQeJugQ
	3Vdx4DlAU8FFyoSPTLsy/2vHOgNTs6k9W8I19/LLKfXP9hJjDdpA66jAEgl94ZgR
	bvmzUBt2rJY6kZxcuvgaXdni74zmVRG15bS5mzUiCBACUMFch1WZ582aoSTIVn8v
	39LgwspRzmR11jZbjxF6g==
X-ME-Sender: <xms:pEWoagdvV-n8b-XG8fSUX6ctGcPszKjSlsjHTzexI8NyBCZcUz7Caw>
    <xme:pEWoatBj_S-4RSK5RPRm-N_HtvlIUw-iKCkih0a6-aXkTiI-NUECTD9CoU5CDcm2m
    HQsrzjX2o1FVGGjTRWBZKABxsCMhqP0uf2HuXImfY0bOrRNMWlM_cU>
X-ME-Proxy-Cause: dmFkZTFNa3S4J/GFpbrVacXRbUI6vm1/NTnkmp4LSPnJEWv+jf2Vy8C2rIqPEmOx2weu1L
    JJaTSuEwcXroy8WznwNPDD7MlSv2k7dKZEIjHdq/UX5O+vx2LzY69gBUg7HpdpjTus81Hr
    Q4FYhPfJpmvNNHlqkg9TJL/z4sGnzOGAgeJtcBNU8RIXMF+V9p9vs80lPvEwnNwhMG1c5b
    xVz5e3+FgvfODQy6dWCKjwxWEDcOkbYTfZhgEAQCT/1Pvwa9ABL1Ps9LiRCg7GVgrivfly
    uUnY+8w/Gci583OS1PmbuGaG23liWsuLelUHdclpg0pY8ZhyYFYNFX6BZ6D2Nu3IxY+DlO
    BY1Z6x/DXGYLTg+J6/5bN0o79j1Ky2Yh140owEKCVGfjU0bqq5gZaAvu6MC1q9+f5UtAZe
    pDBbsj5XvHBwIaeZ/KoW3TdlhmQLrnKg7NFnBnng0on+/Vt26hFvyEx6CQTcjAco7JoJly
    psMC+e415AqYnXOpX1yKGqgH0Kcb/y6CRUcEuCNmTVn9GkgCUyJQQPX4jFtYm+Eprdtrnp
    Hh7ND5LphJ9MqJxQGD8C14+geNPXslJuEWqA3a2U4q0UUmoRL48YMuTQ1eWTRlHMDqnOzq
    +839H9vU9rCHZqFS0UGdTCiMryjH2VAahtL7/wCEOTWbE1//7OkmbCkF04cw
X-ME-Proxy: <xmx:pUWoauZNqdUkifxi6EpYG5vdREWww26Ff4PNnx1q1md1cuUC6mwfhw>
    <xmx:pUWoapJS5UEfSzMl1NpY1-5BVQatwTVHMLENOnjCSTotlST3LY-eow>
    <xmx:pUWoasDPzDttJ7Fjy0gTCxO31RApI5dDVb5SKJ5OLY2pylp8Clde_Q>
    <xmx:pUWoaup1bIiJu8VUGFlRCJTRxNvdNFtClqnVeY_YhCLj_wOFM9Hsaw>
    <xmx:p0WoamCM7dTy3kgYY0ck-a7fl6RsC6k00GMwYzqtnm11rLd-IspLraRY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9550032A007E; Mon, 14 Sep 2026 15:06:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbSIagy_KWTg
Date: Mon, 14 Sep 2026 21:05:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <93ff364a-06d8-41e9-95e9-d305ad10480d@app.fastmail.com>
In-Reply-To: <202609150228.bNYnpbc7-lkp@intel.com>
References: <202609150228.bNYnpbc7-lkp@intel.com>
Subject: Re: [soc:board-remove-7.3] BUILD SUCCESS WITH UNVERIFIED WARNING
 1982025236bc9eee5a8895ee4d9743f989e20abf
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_120622_033765_6B2A9326 
X-CRM114-Status: GOOD (  10.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2026, at 20:09, kernel test robot wrote:
> tree/branch: 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> board-remove-7.3
> branch HEAD: 1982025236bc9eee5a8895ee4d9743f989e20abf  power: supply: 
> sbs-battery: remove platform_data based probing
>
> Unverified Warning (likely false positive, kindly check if interested):
>
>     arch/arm/mach-omap2/id.c:101:12: warning: variable 'tap_prod_id' 
> set but not used [-Wunused-but-set-global]
>

I folded in this change now:

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 3e731dd21311..4539a50c42dd 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -98,7 +98,6 @@ EXPORT_SYMBOL(omap_type);
 #define read_tap_reg(reg)	readl_relaxed(tap_base  + (reg))
 
 static void __iomem *tap_base;
-static u16 tap_prod_id;
 
 static void omap_get_die_id(struct omap_die_id *odi)
 {
@@ -656,12 +655,6 @@ void __init omap2_set_globals_tap(u32 class, void __iomem *tap)
 {
 	omap_revision = class;
 	tap_base = tap;
-
-	/* XXX What is this intended to do? */
-	if (soc_is_omap34xx())
-		tap_prod_id = 0x0210;
-	else
-		tap_prod_id = 0x0208;
 }
 
 #ifdef CONFIG_SOC_BUS

       Arnd

