Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E77C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfgBeWsuQ4lR9xWJ1ew13FUpmpSq+gQ4RYVq3UXp+Eg=; b=31Sk+EoPvwvvKyn5qltQjlJjvr
	aYX9fNsaE8ZbvRSIgL5q34HfvxFC7rAc1DGFXqNcCMLZqGDAQhbDHulmtAqa9oMpdMJ71G6BUPriG
	++LMge38cG5RBJAS+30jwiAe0z4Um5VHy+ZXW8F6xRRA6nz3K1bEn7+qDum9BP8lK8tpSylDQcjPj
	5FQDTb8mztzliidpkdob2+SVJtInRSlVmC+ciV7fhc6s3ykF59r1aD8zkWHlgnSdakJpp8icciaPK
	P9bBZrikPRYjmoMwRkkP6rJ2WIAtoHm7tggQ5u/RC3qh234wWUhZg1de0t6QMBAEr2NDSFa2S4Ppa
	zIlG5GJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfmr-0000000DP2D-0Vzu;
	Tue, 11 Aug 2026 06:16:33 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfmo-0000000DP1t-2exD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:16:31 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81eaf3709b4so35322817b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786428988; cv=none;
        d=google.com; s=arc-20260327;
        b=OOSng4uEmu2J3GH0S/4+vjZ/WYWJZO49bQuO6qf9WknsQewCy5Pwfm9/AUVc2x0BYo
         cT8R7bK2wtySu5Sdksz1TS6wSZaxVO3Qg8S4mKc3CFaqR5ED5a4V3vRGIoIsqg1Av0+q
         U36Z1nCZhm+P5nbetiiSwN17WxXo3fNSJ3UDMKEOzflqXXZTGm8ccfNBLjj+ny3Krlqi
         Dj/y0jZc00rtJuWz3wLsvw1LJHpTdIS7hcRTOA8+MAfLeqLhmisqAaKx3wf+cz083MJd
         8Jo/0x9JYJCRQx03OLqiXvhJbVRfu4gLu22dfHkjKspnzF4Vlq+8gcpIsLs7ygAm45cL
         enEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cfgBeWsuQ4lR9xWJ1ew13FUpmpSq+gQ4RYVq3UXp+Eg=;
        fh=MQ9UzHsOu0Y+z6dSnsareLiDConpbEpA/OM924F8yzw=;
        b=R9xxXC2veoC0cgToc1pG/jkm0hk+nNc9ilehkQZDqGtzeq2ouYAl32D3cbFH32YeOU
         Jv3S8JuAuUCKTClpWnaJEAaPMoeyN/6Dl76lXkEnfs6QeHCOqf6GQ82vZ42dbjow0dbS
         52cqZpKP/9B2XNa38+MR02tkLgqMunRtTwURP8O2VC9ZxfFkto1v9nLHV00F6SPs4aIm
         UnJDSRkHUVxU91PUj/FXjaI9oItuEkQXpFARdCJc3riST2q3OFP3o8wFZQmfJ9FRNOTe
         lCqvl12GYw2KohQhBV3P6tb7qESTVux9rG8bBYfZFDiWZAbDnDWVPhefoAAnErGofZby
         unEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428988; x=1787033788; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfgBeWsuQ4lR9xWJ1ew13FUpmpSq+gQ4RYVq3UXp+Eg=;
        b=jcSWMxh0H+VIt6ecwrzUEbUnPxBkBXYlgr2ON6NLs5A7Vs1IAJj2gKuBocs0co+tW3
         3Z3ughW6adpPa0aJpU0fXqQlzop8MunBkjiGfkuf4snqAy2mUvRGW0ENuznTPowZnIJJ
         bnYncuLLpSfJhU7OiD8MJUV/u9yKhUHOBNVErFvRn3znGBr8hDoqATI+iywjl8VrkGqT
         YdNXczXn5EcZ2fQ0axFipsfj8HVajYk0clRwcN+6yt52cp/4w08YMP2HFLtMCZmN6UtR
         T3cxOirZLWrpQGIBHOiW/EeQh0b9l9q4NVGmTeFNgpHLOE+1eG+NC4fCRMLDcUmTiAY8
         NrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428988; x=1787033788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cfgBeWsuQ4lR9xWJ1ew13FUpmpSq+gQ4RYVq3UXp+Eg=;
        b=m5YPVchmWFJs+4Q8nNmr6HNo2V/SK9pz1/OCMScffUD3M+AixkcUtUbKZ1FOQe/00l
         YWPdy0pNfe9W6+keUCFq/0Ly2HGfZdRPINYhDT0L6+TCWmz3ZPM1wWZaiet9jBMyuDG7
         lhWwhpbIG3i7BVcxTPgyKlm5yWxpQ5lP0DzTsPiYzAojm5fNnS/OJZj4+ucibOUC3/ye
         ZRp8d5uUGnSV2kLFaPaMzSLwTKhJsh0u8iPzgf1g7wOJP9f+g/EjXKbF4f2C/ht2ODjZ
         b0u1OIS9AbP6ntbzwq+Gg+2wPqIlXAJH9CfVnsycWAfCBy/34UjmNHGa0KgBOq2TC3M0
         wXmA==
X-Forwarded-Encrypted: i=1; AHgh+RrXCj4cK/FsLEeibd9udpoC9qxjnzJqvUnL61g4Ca9d4w4CfFpvG/CykIdlgqtBfNpn65j2T/4ixFHiMNZtH/du@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+KhVJYlmOqbn4GTTHrdkrzxgfhpAUet+zby3BVt1Bb6aygHQg
	9xKA+g0+US/Z3w4nohBIgjrrHOEc+Nsvmu8cdF1x89b211I2Qh3guPBs1bI/LIw8Htk/ZfSi112
	uNqLSpHRfRBa0eYmFTxOZ8WAMafy1jcI=
X-Gm-Gg: AR+sD11mA8odAYeOslEEUpWccZD+DTOTTHPVHM4d5YJbK09Mj2s0PI24ZXUClZ9Sc0y
	WLgTcLohnwYokvFj/elIFs09dYbarWqVxv68GKQkADv7zcS9vkfLfCvROg6+iQFmXjOsEoruPo0
	7Mym3RvRYkRU9yi8UOhTdhUN6IvZHvwFmznYepazTc0uwmJs8p0QSd+CosrNReyetVLovcR1cYf
	lJ39j4vOOLTsHWmBYsUsqNDr9B3hKatY9tzU8Hntrtb3+mV2Pb3SGVncGq2MSf549eW2O6RkV5z
	0upSv91+g7lxN4h2lznVXlwouebfCPngFlu77it87kKl9xg=
X-Received: by 2002:a05:690c:c9e:b0:80c:d342:955c with SMTP id
 00721157ae682-82f289e94b7mr5606407b3.3.1786428988556; Mon, 10 Aug 2026
 23:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260808074510.2655473-1-lgs201920130244@gmail.com> <anmm6X4MLpyIH8K1@aspen.lan>
In-Reply-To: <anmm6X4MLpyIH8K1@aspen.lan>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 11 Aug 2026 14:16:16 +0800
X-Gm-Features: AUfX_mxUBmem10ffZDic2Ejp1QbKpijUB1N8Df5NJafaJYvbJY0owxLwLT1ooBs
Message-ID: <CANUHTR9QBUtKJ8f5JAhRGPWw4ca2QpuzMB=F9ZC3Q38RoGMqkQ@mail.gmail.com>
Subject: Re: [PATCH] hwrng: stm32: fix usage_count leak when autosuspend_delay
 is negative
To: Daniel Thompson <danielt@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231630_684822_DAF8ABCD 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Daniel,

Thanks for the suggestion.

On Mon, 10 Aug 2026 at 18:24, Daniel Thompson <danielt@kernel.org> wrote:
>
> On Sat, Aug 08, 2026 at 03:45:10PM +0800, Guangshuo Li wrote:
> > stm32_rng_probe() calls pm_runtime_use_autosuspend(), but neither the
> > probe failure path nor stm32_rng_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
>
> If calls to pm_runtime_use_autosuspend() must be paired with
> pm_runtime_dont_use_autosuspend() then I wonder if having a
> devm_pm_runtime_use_autosuspend() would be worthwhile?
>
> That way stm32_rng_remove() could be entirely replaced with devres
> cleanup.
>
>
> Daniel.

There is already devm_pm_runtime_enable(), whose devres cleanup calls
pm_runtime_dont_use_autosuspend() followed by pm_runtime_disable().

So I think this driver can simply switch from pm_runtime_enable() to
devm_pm_runtime_enable(), and stm32_rng_remove() can then be removed
entirely.

I'll rework the patch accordingly.

Thanks,
Guangshuo

