Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D2C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r2Xn9Oh7pnBWDirUE0pyEjDwsfdPFlcNad3ZBGW7dY=; b=gUls8PnbQAWJS9lkNIUM4/DSzK
	77uK5Bdgs98yZVdC6lcR7OaejHf/5WvBuBVR8rd2iu8pX9erbAUS3eNQF2j4bG8H9QxaVArdqJpDO
	m5kzOGANm7jYBYZhel2hZmV1RKkwFMOH07skxG247dESlCe2x99xWuV6TgqN3Xfu0McNsEoy4fVUF
	d9qk7Bg1nwwOPRPOzGK2zjw3bpHTkxtylOIHtWrneQsmRyOG9s9/Ud1829pxpGtgL2NxcJ6MfoZld
	//5XxrGgd6is/YrBmDHPZ343MMWrQ/jGY2OVR3ZX3NlPvkHUfJVWb+YCRo1NYGNBaZIGGfTK8jEPu
	6Gp+9Qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39yj-0000000D3wP-0730;
	Fri, 11 Apr 2025 08:43:13 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37DD-0000000Cb4x-00j4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 05:46:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 55F281380264;
	Fri, 11 Apr 2025 01:45:58 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 11 Apr 2025 01:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744350358;
	 x=1744436758; bh=2r2Xn9Oh7pnBWDirUE0pyEjDwsfdPFlcNad3ZBGW7dY=; b=
	Eb0uxLN+O72VQ+q7KFJ3YlgWIdkWmATJpMozu2JDxUE7FtJaRKB351qHfpXSFkr8
	nVd/XM+D9+Anxp1C+LScXKMX8WL5RY/R38tf21Ma+RU0sdM4XHu3HUNSXHA5y9sy
	F+i5xIK6wk73+NKsAesaHmewB0pDVQT11V8t+03Y3iK61wD+dzT+CTAO4a1tV+6J
	BJVd6qOtbzVtIA3bOe3jHpDzkIn9D6hZBsH8N8yrX4MmL7I1V6MMybtazUGly8zn
	sJyJ2LkTi63cia+nPXE8nqzULX+nFD+n1yPTvYeQTVcC6BaS5Scrvl3KRQwkj5TC
	TOFS4Ou08SdZXWV96P3q3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744350358; x=
	1744436758; bh=2r2Xn9Oh7pnBWDirUE0pyEjDwsfdPFlcNad3ZBGW7dY=; b=i
	zazvTElxv8CI8vOmns6RjFlqtcmY2/93bgV8Nsmkg8CEIBw0D20onSN5Y0pVsPaB
	kbOsm8c6/t7Dmx1AmAE4RysQGbuwBWhMs0Nr2ocA6hxgcF7GlFNyzE7BXGeUA7Pt
	QjYBDYHPvk9/HWscq97fIKP+xrKZ0FMF/aWND9XNgOGG+pSsO2QR7yXqM8QAl65X
	/4/VSpmzkTTKqo8PkJgnHpKcnikjbIMvvtKnUx0izzLGVYizGdoQPSRFXYy5lH1o
	no94/F3S5w3Ll16qcsFCNhUyTBa0cDRHrW7kuGxNL3P4y3PszMxVztz0Xg3lL2E4
	Ok3bDdE155/M8bxYH396A==
X-ME-Sender: <xms:laz4ZyE-WfziFgzEyIzFgM6Xz73tdB0Cchr7CG82eMKKAtKnTbQZPw>
    <xme:laz4ZzU2M8zmAq88YWf9g6Cj9eG4z54rMpmC_0HD-m4uF4Kr0ipf_vWmXGrYFtMUe
    VmMAGtqBv6eSgjrRNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddutdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrg
    hilhdrtghomhdprhgtphhtthhopegrughrihgrnhdrhhhunhhtvghrsehinhhtvghlrdgt
    ohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshh
    grfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuhhlfhdrhhgrnhhsshho
    nheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhi
    shhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehsfedvsehngihprdgtohhmpdhrtg
    hpthhtohephhgrihgsohdrtghhvghnsehngihprdgtohhm
X-ME-Proxy: <xmx:laz4Z8IKvtoJqP56ctv3tQyAKSd7BtieQ4tgLLVIy6ByyFoPpgyhLg>
    <xmx:laz4Z8FMUExgb0xf-CacLLzo4AEApBXcGmKJe8X8TsUhI4ltZrXxOQ>
    <xmx:laz4Z4XYVf-VFMExVq50OsEBUVVkTPtr92r2gO4wrxJDvP5PUb7TXQ>
    <xmx:laz4Z_NKl0ld5HPAIfhWc_Fa218TVCWTr-81H6Ld-os7JUziAEO1KA>
    <xmx:lqz4Zx8I5GdkKpQsOWsXl2aMlcHCLE_dZPMN1vZ11m1-Zw3x16RxVP9r>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B19172220073; Fri, 11 Apr 2025 01:45:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Taf7f561cc211b9f6
Date: Fri, 11 Apr 2025 07:45:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Haibo Chen" <haibo.chen@nxp.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Luke Wang" <ziniu.wang_1@nxp.com>
Cc: "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>,
 "Josua Mayer" <josua@solid-run.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 "NXP S32 Linux Team" <S32@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <cda876c9-7dbf-4af1-9fc1-cbd9f379252d@app.fastmail.com>
In-Reply-To: <DU0PR04MB9496EAB4A567BDA8948D434690B62@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250410140921.849213-1-arnd@kernel.org>
 <DU0PR04MB9496EAB4A567BDA8948D434690B62@DU0PR04MB9496.eurprd04.prod.outlook.com>
Subject: Re: [PATCH] mmc: esdhc-imx: convert to modern PM_OPS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_224559_119184_C1444743 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, Apr 11, 2025, at 04:45, Bough Chen wrote:
>> From: Arnd Bergmann <arnd@kernel.org>
>> drivers/mmc/host/sdhci-esdhc-imx.c:1586:13: error: unused function
>> 'sdhc_esdhc_tuning_save' [-Werror,-Wunused-function]
>>  1586 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
>>       |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-esdhc-imx.c:1608:13: error: unused function
>> 'sdhc_esdhc_tuning_restore' [-Werror,-Wunused-function]
>>  1608 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> Remove the #ifdef checks and instead use the better macros that silently drop
>> the unused functions when PM is disabled.
>
> Thanks for this catching.
>
> How about add __maybe_unused to define this tuning_save/retore function?

That sounds counterproductive.

The new macros were introduced to allow removing all the pointless
__maybe_unused annotations, I see no reason to stick with the
legacy helpers here.

I did make a small mistake and ran into another warning later,
but this fixup should address that:

--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2112,7 +2112,7 @@ static struct platform_driver sdhci_esdhc_imx_driver = {
                .name   = "sdhci-esdhc-imx",
                .probe_type = PROBE_PREFER_ASYNCHRONOUS,
                .of_match_table = imx_esdhc_dt_ids,
-               .pm     = &sdhci_esdhc_pmops,
+               .pm     = pm_ptr(&sdhci_esdhc_pmops),
        },
        .probe          = sdhci_esdhc_imx_probe,
        .remove         = sdhci_esdhc_imx_remove,


     Arnd

