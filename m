Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC18C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bmXdjhA3HTwHbyEK6JtJWrwrPDwDFR73RowlJS9lG4=; b=mz3ieMgmcS8V7suVbMXr5YmqKQ
	+iDVxjROUNVJ7e7vOz7QNC7IPnrih2+hBYFXrDdFSVG+mSOfOj8a6ovj5NOFYmnoZp/GI6oDaP9VQ
	sGHwruAhhVE8j5RDjsOAFiAsOnaYuQtxka+vWdVBo482HlVuAU2Vt4kVCVWCZKXnhmp5mEQaIF3Dd
	k2Knwtkvk58aoHAVpmLAI6hD6iHp06Wmq4wsVBXjyrU4F9k8FRxzj+J8hVgFwCdU4Lfisb8pIr7B3
	fcmID+QmSUkLpVrrPlC+/2SN1pk7YrgYqkdS0/UFXbeggQ7kHGvixsbToIK7uc7GYKXJGubcRaMaK
	/nvD4tBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwpX-0000000ElQp-3PsS;
	Thu, 23 Jul 2026 17:03:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwpI-0000000ElOj-03jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:03:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954afac04bso9332495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784826194; x=1785430994; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bmXdjhA3HTwHbyEK6JtJWrwrPDwDFR73RowlJS9lG4=;
        b=MeXhmeMT/EZA3PZP134Qw0Hf7kcKp5DYdDtzr4yXpC/5rOu51l+Df0APdjYfcsKFbt
         2AN/OJvNUz3H0OzDvDOhxjs3l42Pp38oRiZ87D+O+zIpsKN89uv2mFCJI06bQ+26AbbS
         v61EqwH20yhmOMzFqioRSCQC9vV925EuTyvedowbEV06vJ1VAJnP+j2ulkKiem+XdBUQ
         kx45LPZCNlZHJjUj0J08jYmfyLFAXX/0QFmAs8o16T58TFELN2vgvHVvuD6OExBrXGDa
         TJ/JkOAdVqyivf/VPCul/RoV6/1x1+KWNR3Wd4kDu2yRghyeq6/VEO3FweMy4gUCJwJ5
         esdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826194; x=1785430994;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3bmXdjhA3HTwHbyEK6JtJWrwrPDwDFR73RowlJS9lG4=;
        b=gNiwzHmBULNkQ3ssOBN4B8/hHEMTVNoN6JXHExxFW/geySNvrT+2PFsqxrW+yKlxki
         ioAtINhrfyd9PO9eR95Cpzr4s1zzZfIg7hmpBwWx3AoScBS2VzxXEe9kZKhtChPtpXzL
         u76tbvgqj2daIkmDefpUadWpo/l5FK/v8xZLf8inBjCjlI5K2diBNp+Q1ujzo9fcKDdl
         ByAITsOwwSekvrrcbBNtO92sBYmSllHXECIOa372U1xbEjJP/miAyHyK5amc8PdoB9Yt
         fcInuYBvfsRTgk4aiylfKrH/FyDHlzarfOsh1/DAPNxgWwgmh0fsdZfW0pAEtRylMbvh
         xcdA==
X-Forwarded-Encrypted: i=1; AHgh+RrRj8YKwqu2IrdhIpqikSMXYYNfYHI0mCc/+WrGG10shOyhi9fkJifG/4eHdZjqIYE/DN0AQ2wmejf5FyF8j46L@lists.infradead.org
X-Gm-Message-State: AOJu0YzgoIB+vl2WyM0csZu4hfQED3KSv46lbXmZAJCX7ee/GKd+y4KC
	EIKoBEbO09xZ4WV87j/IiDE/YfGXnwmNAaeCU+9EdkjCQ7X4gt/84o3EV/paE/VoCwU=
X-Gm-Gg: AR+sD13trU02ki9yqlFjWgxhX3cX3j3OW+1UzVt+g68t+m4NM7x+PAANWPOCEYPdQtU
	ptz5XDGjvQ+YqaW6c/5ZYs033QDtvdevDm6Mc97bQOsHGgRcJhTId85vgADp2D7in4X3mvN55VT
	QKUQNyg536TStyja87UF1XR18Zvs1va/OseTupDwiCW0QnanrREkuucbewBff27+U2mSq01fW4F
	qN263OrknOS7PrGWCx5/tnJnDYI619TiSJCM9Dl1rd1Bo+pFNokMhc1f14ljUs8Jh0ATuQgD5Gq
	3mW7q3Z3h09XXSwweAsVOUrYBgwKPKeBfhr8ILXaBXLL7FsO71bT9H1bPll+6uEjjhCcKvSgzhM
	Q5Fz3XMHkjoztJobLtW4Vv5/oTjhvhhh64KpBdutoIOhvgY+2u4+InJfDxG1zsGWEO8vEGCWgAj
	djiZR3DJAhgAM=
X-Received: by 2002:a05:600c:4ed1:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-49573d11690mr46042655e9.28.1784826194117;
        Thu, 23 Jul 2026 10:03:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5f98:8c28:3e2c:1c72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af16f72sm8890055e9.0.2026.07.23.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:03:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
In-Reply-To: <amIn3DO_65uyItS_@redhat.com> (Brian Masney's message of "Thu, 23
	Jul 2026 10:40:28 -0400")
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
	<amIn3DO_65uyItS_@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 19:03:11 +0200
Message-ID: <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100316_098493_E10C56F8 
X-CRM114-Status: GOOD (  30.71  )
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

On jeu. 23 juil. 2026 at 10:40, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
>> clk_hw_get_clk() lets a provider get a struct clk for one of its own
>> struct clk_hw.
>> 
>> When a struct clk is created, the module usage count of the provider
>> is unconditionally increased. For a self-consuming provider, this means
>> it pins itself and the module can never be unloaded.
>> 
>> Increasing the module usage count should only be done when the consumer
>> lives in a different module from the provider. Use THIS_MODULE to
>> capture caller's module and increase the module usage count accordingly.
>> 
>> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
>> pass a NULL owner. As a result, any provider module will get pinned,
>> same as before.
>> 
>> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> This issue has been present for a while. Virtually all users of
>> clk_hw_get_clk() are affected. The majority are compiled as builtins
>> according to the defconfigs. It is not problem in this case but it is
>> if the configuration is changed to module.
>> 
>> The following modules are using clk_hw_get_clk() and are compiled as
>> module with some shipped defconfigs:
>> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
>> * drivers/phy/cadence/phy-cadence-sierra.c
>> * drivers/pwm/pwm-meson.c
>> * sound/soc/codecs/lpass-va-macro.c
>> 
>> Currently those module cannot be unloaded once they have been loaded.
>> 
>> """
>> rmmod: ERROR: Module blabla-module is in use
>> """
>> 
>> With this applied, we can get back to removing the direct usage
>> of the struct clk in struct clk_hw and eventually remove this
>> struct member entirely.
>> ---
>> Changes in v2:
>> - Update comment in __clk_register()
>> - Add missing documention for the new parameter of clk_hw_create_clk()
>> - No functional change
>> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This looks good to me. I'm planning to send Stephen a pull next week for
> content that I think is ready during this development cycle, however I'm
> not going to include this. I suspect he's going to want a kunit test for
> this and I know it's going to be complicated. My suggestion is to post
> some kind of rough test scenario for this, even if it's initially not in
> kunit. As I get some spare time at work, I can help you to see if we can
> get a kunit test together for this.
>
> Brian

I understand but I'm not adding an new API, I'm fixing a real problem in
an existing one in the kernel now. The related API is already used in
some kunit, so there is some coverage already.

The problem was known (as the comment in __clk_register() was showing) and
there was no kunit then ... so it is a bit strange to delay fixing the
problem because there is not kunit associated with it now.

That said, I'll check was I can do. acutally loading and unloading
module in kunit does not really feasible. Maybe poking the owner
field with __clk_hw_get_clk(). This is not really supposed to used
directly (which is why I did not add the documentation around it)
and it's bit fake but I do not really a way around it.

-- 
Jerome

