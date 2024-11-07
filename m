Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E7AD43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=; b=vDMSNXzDSaprAwZY9z2S/DmYP8
	i1LzxESQIO+dVfzzyUEfMb86NegjGR1G/6sN3WJiFbnyL2qNwmxHnvRjLJI/0nbuMZJ9KfqH263iC
	LEsTiNcMZ7XIRsbKh+yE9gF62aZuabyKXlOGpHpLw2qsuT73+hGY0SufL4Jhv3uel5KPkhRJ79S2d
	UYj4PIf1M+c1HJQDcHGKPXVcr0O+rkEEZvk6gNnX/XcvXauiPtE2fdWEtoUYVkcsBts7CgY0sdA0q
	IPhxjjit1IIGSidJEjqssiRz+zOIVfOkR9ggSoe+GY5UMOBv/Ml3fkU/NykOvEW+v72+39hE4JTwi
	PjWOMa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t938o-00000007E5F-3CBD;
	Thu, 07 Nov 2024 14:05:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92zY-00000007CJ9-0Whq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:56:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fc968b3545so9171161fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987766; x=1731592566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=;
        b=USTLnKNLPoejKI0uttPE8vDeJGyUR8Sd/rDiu3SnsRoSQ3gZeNDpjbRo7d1id89GuY
         zkHYTAfrUzl3UiBpiFVX/qAJfvHtxyGdVHd25mzPJ9AuuVAPwA3XuFpuiMPJCBt9CEW1
         DCNjHC1JOM4qgsW7Q8Av42FrwdMTS21TyWaJmMx3CgRZiUb7/8E+an0K9rjJnt94jbhK
         YACOpSG9f0damZhpv1ch2Twa9WV8PbtyLLlW8S8leuL9LjUSwnH5H4ss7OW+Bjdm87kH
         WRkGFEqH1esR5P+zz+6mmIPBTXBOxh1Mg+2bhxKGZMdToYdcf35GCs+3zVCFHiCXa56X
         YloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987766; x=1731592566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=;
        b=wx7/4CK0bAczHzEtOGV6LGd4C3WmlGGb4JJWpWd+CPpVY/Am7+vEM3ZoDB7hHNJ5iX
         0sIFbOnsXi/DxSTUWVTdgpub6blWD2G3H06jsrCMlZWT0dTE/0Mtc/veuu2J1OAYKygh
         5QpBKy56ozzvbmxvAsbH065mavfknW0wFu0zW6kRVkYSF9wyDEDYChySok4VZ0iCjhuq
         8BngyjYvBi6YyBBgKvoJV384e/sOvXPU24N2a1FzalHA9u/Zi1Kkj8QpUqX6y1R/KSeL
         eF1xzTwYnwdFpIoKBsf7iQFXT6kuKA3KVUiBtFJMhe5nh3FINuhiy3H4Ej6SEi9DPirS
         Dcng==
X-Forwarded-Encrypted: i=1; AJvYcCUe/uvvZDBd3sbSYuCgVRBQafF7k3jsIZaKE3LIVOC0EXKxQM/v1kZkzC0aGoeD4FwjuNSLObB6rmawwIWgtRIM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcl/V3sPWzwOwiOa7li69GQ3VApJJqRJYy3O7TuHi3nAdG8EZu
	Sv2MWaxwUBH8lG8QIQMCsFwpb2V75UTW0JXSQ/ziz8v4+zzxYzLR2o7lkFImMlcJCVeFWyHU0+C
	t4XhtttPUAVSfQWApGV6/NfbMyWAsIXeyB+Ysqg==
X-Google-Smtp-Source: AGHT+IFrud7HairE/9EIYpHYq1Qq4YumL/GF1pww8t5Xiei+et58qHUoVolZLH2rni1Z35DhKc3CTAu8t4LeeyRCaLs=
X-Received: by 2002:a2e:bd0a:0:b0:2fb:5014:8eb9 with SMTP id
 38308e7fff4ca-2ff1e8b49e0mr470261fa.10.1730987766341; Thu, 07 Nov 2024
 05:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:55:55 +0100
Message-ID: <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_055608_257954_3B4F421B 
X-CRM114-Status: GOOD (  16.83  )
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

Hi Dmitry,

On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Follow the ARM64 platform and implement simple cache information driver.
> As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> limited to the ARMv7 / ARMv7M, providing simple fallback or just
> returning -EOPNOTSUPP in case of older platforms.
>
> In theory we should be able to skip CLIDR reading and assume that Dcache
> and Icache (or unified L1 cache) always exist if CTR is supported and
> returns sensible value. However I think this better be handled by the
> maintainers of corresponding platforms.
>
> Other than just providing information to the userspace, this patchset is
> required in order to implement L2 cache driver (and in the end CPU
> frequency scaling) on ARMv7-based Qualcomm devices.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I added my review tags to the v2 patches, can you put them
into Russell's patch tracker?

Yours,
Linus Walleij

