Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB2C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DIcEgoppAXulH5vp8KeYvryGqkcW4+kiP+l5ButByY=; b=vfWA/w3AYwD/qEB2/74He7alMW
	0hCyXEjuBxwyyLe7EDGL/lzUrf7vc+q1d+PyPXOV4Rm51zZN2MbxH3IWNfjtr0BkjNsTuhtjXaahK
	3dxF6tGnjQpfuGQgf7kZU5/ZufkTI1kjanUYXHgCmbGl5G4XZ1ey/0ZUOhwV4Be8E6xtN1S9n1ZyG
	GmbkV6uy/TGQElPjsQUDC8fhXFBq2+JMvk7b2mxE5DuUsdZzfRDnwoD435YXbLI1r9lZiti06Ven/
	SzSVX98NeGdF8YElid43MIIw8FMWIOK5FvTBR6iq2W+sdPLmtg3zUrYPydW+LSvazqLt+9QUH9SnB
	VYDBKuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpGZ-000000071cq-1wcq;
	Mon, 20 Jul 2026 14:46:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpGX-000000071cL-2jun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:46:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-476d8e647e9so9312775f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558803; x=1785163603; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:autocrypt:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+DIcEgoppAXulH5vp8KeYvryGqkcW4+kiP+l5ButByY=;
        b=C9Tal57/EhlvmGLCmZWd/LowdVW6eKdmuIyR2wuFhRTuSQWjrXg36TDajO7SwBk5BG
         ZO93E95VdczvyJS0Zrl8ZZi78qjQwfvyrVHYNcXSdBpG/r0jd9E3I8jKVI9IpSq1h5oN
         gZF3oT90B/xjEsDbhMDT11nUe+sZgewHVL/z6rFnkrTvw+0ZZYLDn+BAtbRx7k5+eqEI
         hg9DOTHtPMdd1VDLqm7EECGHpB4CtH4x0SjXdrgyHAuGXJyZ7gV+tnNbHU+dWBWPDJX3
         Wo0vjjRgGbxI65EQa9WvhImV0zJ88e0XGi58RKYU7DJCraiG7eUDdgXu8G0+ZKVwsAGY
         WnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558803; x=1785163603;
        h=content-type:content-transfer-encoding:autocrypt:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DIcEgoppAXulH5vp8KeYvryGqkcW4+kiP+l5ButByY=;
        b=mggHvdSKIQw16aHvWPM9Ivr5MpQy/lfBu8urXc3YSp982ElVpxdtp/xHdpJmZRBzB/
         7zSmNdc/O8bLrGXPwzYpNVQLvbsk4mPngXKeRvYRuVXrZkgQBGHq1tqlDbFhcJllO+Tj
         OAonbWHXS4kCrtynQqUoyO429MOZZ5XZBRBTNhE2GGRlidfWzAPeNcRDEDF063U6R7kz
         oNH75XEv+CibYrbXRaNLER07KB9r1wsOdrpxz+HxK3xFnBCsZvdVHefJN3GVJ1KAp0Ht
         w39Sy0nLdVhxiy85+Ba2FJVHldB8l7J+J8LeasWmrLSVuKMbiD9LQw03PFmtqU14lG1E
         VQ9w==
X-Forwarded-Encrypted: i=1; AHgh+RoKUO502cbCVndeQAr4zX5ANopC74PJirX6n3ryGJNa0J4utsqWD7euGcofnln7OLy0i9MqlRIAOipfKFSIY59R@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8OzqqQ8iJ9+ptKJlvwnyuW45caR8ahp1r4kji0LyCEdWe4Sn4
	+97iF1q1yT7vGZiYNoj5SfnBgpsCae6mHSetmDc8EnmNqVjpFuww7xNE
X-Gm-Gg: AR+sD12GziLTTRu3V3tv0Gmxj+OPUt4tXEutvY+5P6etMl3epJrMtPgowUxxm47cF+z
	AJlHu2xRq9htbeonS3OIvrBuZ1YPilZED3hJnQ8D/yMt4kmbJqlcylo6k9vAA6n7kjEmfssCOBI
	PFhOXRCGB/skBmxSNsO6I994g4mvx7QZCEakLQ8+s0c34RLlanrCRVLyS0yN9MShoiows0EDFMf
	GzkJxYpV/L9hRpulsQEuSWkO3CG1Y7SxGYoJ7vTiVC0IjeiM0snO/+s+1ovOyCp44fndzCSnvjW
	ZmcJnU6zi40vbb/KXJqipLiKO+RGEwZrE+oBLdKhtgFtxv6pco8TMTjTD/qrHJhp87DnfKOKgBv
	ypYocf3hyugllU198q2rcaWBlJ9LDmoN4BlDx8S4HPBmmRHzV/xN1gxVO4G5STOPg3yheAoxjQp
	nlYjZIdWTZZefKWTL60Q==
X-Received: by 2002:a05:6000:188e:b0:47d:ec60:6581 with SMTP id ffacd0b85a97d-47f622d612emr17290234f8f.0.1784558803067;
        Mon, 20 Jul 2026 07:46:43 -0700 (PDT)
Received: from radijator.localnet ([93.140.52.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm29579920f8f.25.2026.07.20.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:46:42 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Marvell PXA1908 SOC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Date: Mon, 20 Jul 2026 16:46:40 +0200
Message-ID: <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_074645_713975_BB2E04D1 
X-CRM114-Status: GOOD (  10.07  )
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

On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Penev 
wrote:

[...]

> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 4b2c089f46a1..8383f9f1da51 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -130,7 +130,7 @@ obj-y					+= 
mediatek/
>  obj-$(CONFIG_ARCH_MESON)		+= meson/
>  obj-y					+= microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
> -obj-$(CONFIG_ARCH_MMP)			+= mmp/
> +obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/

Could it be possible to select mmp unconditionally, like most of the other 
subtrees are? AFAICT, that would also require creating new Kconfig symbols for 
the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more proper 
choice in the long term.

Regards,
--
Duje



