Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA4BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 22:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZQ3ptl+nXCUruGL17lHqoeg1DTCDNqkoTZmaRK16Pk=; b=OI+ghjRmLhQdhM8XmWknTGVlcR
	Q0eortq6DSa1z4kR57kY/a9Z67YtT2Z4gHUMb/jIHduD3ioLH9o6nFHnd+UBLYK4VJXgYdCMJfa5w
	8tk+CHIslwtuc19F8UXztnjOVWpJQ7r5ubgPFQYJZ5M9koJNPn6j8nflDY/rHOJv9uufuREoeEoQp
	dpq0m1X7CulMnbjnj5jrOea1TJlDtquDRle3bp2Gt+5PoQ1s2UO54Dqlk3GsdVeuztlAbAzV9XAij
	7GEceIXrqzxuH7Ose99Qy1QfmzyH6QOZLD/zd6vJSEQo8Qzo1PFQTPFfMQA/sxiL/ChSt68ayJuxj
	GlwUN6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhy1I-00000006s77-1Nwc;
	Fri, 01 Aug 2025 22:14:32 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxyi-00000006rxr-2Kpg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 22:11:53 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8e11af0f54so1905370276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754086311; x=1754691111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZQ3ptl+nXCUruGL17lHqoeg1DTCDNqkoTZmaRK16Pk=;
        b=y3M28RQ280ZeofTozcxPLBSZN3lRfeFNT027q5IQmx2EMQgrM9WebRwUlBzCgfKrFT
         HtIzgUvuYHHrbmQGulyjxM+DtPss+9WXnVWIpSpzi99GvvhX74nMxXZGgpIMlIefbcMP
         84OZJpS13HK2oUa0AJyhGQsyM0+7ynNzv9qC/6tl7x/2ZHHCixGIq9Zs8UDgvmlnM11y
         gtsBY8p2qw9Sc+d53AniIX3YxL2ACQmCdxF7KoNpOQfBXvqTWwKfD+IIlxznFmPMZlVW
         CwQmYHBbUuMDdUWDkmgm2qdyPuLY39nrBo/RdGRv6rqVfhwsXmoOYjUKaaBqC1I/nmfK
         meVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754086311; x=1754691111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZQ3ptl+nXCUruGL17lHqoeg1DTCDNqkoTZmaRK16Pk=;
        b=QZNmpwXxtxCg7EYZ4VL5CgoCNyxJRurvc+XAa2EgvFxZvvZmRidq+2QslXAHmSUDHH
         FFcnsCwMBXAsXBra/3fR4JGXEQi27xlnYSdO3UMjW0r6vrXAtPM0XpGiN7T8a0Tl+uJN
         M+C8pd25LjF8mPDxtp/lFP5j25oEY+jHbD9Bo5YmVDjH4bgqrzz/C/qomnJ/SAVLMmUy
         0xq+DnAdI+EDeOCJulwf3IwxSZ9VPltS5Kr8st/+sMPpoJN47Rv1vwpGInvP6MdRXfHJ
         uPv4umYehuiE369ZY9s0PP+fN6BMRc2Fx+efsRAMzm/mgsj8kF+musmRyZfxGl9a2SSp
         dq5A==
X-Forwarded-Encrypted: i=1; AJvYcCXqeXZfjPWHWLK9vDsFeYPtE/zZmU2usYOI/x9ZcHaHgrjv9jO/UA3zUudG1wXz1CWiqYBC579o/ssa0kamesr5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz07BKWU7oOlJ+l54YwX32qHPUayVD+6NY+fm4hxxgTCHAH9yYC
	nRwcxmDBn/PIL/y0CTHPocKtIr2U9HJwM3oY1TjNVYjFFnWB1VhlMY0W8wV5F2JhO9T9+Oq/CN/
	rzhrDrdyDTBLn8aRzJf79kC0PYEVqDmdjyu3Pp9zEQw==
X-Gm-Gg: ASbGncvZcfnqehCW3ggtBmNEEH2opCJZJbjtEY18VuAgNoAd0iti82J91hRQg6WJImR
	gkcwUnVcVGiXMEPN9u74nVVzgpl47n4zvVSb0p5Mbi3VJvTXrsKRdmdGKVzqqfzySgPbGC9Pe9O
	r8FIusEBsf0Rxk1LbrGHDohg8BexF/9vpf+bICCIDIgK4pvRytu4NoGgJmrF9szdW5hHdvuZI4D
	rxysg==
X-Google-Smtp-Source: AGHT+IHHqeJHNAbgmM8GMieWnZy5D9PazvXOXJxMb+nmM8OfoRPhTwJEHb5ZjR+06/LLEwPYiHrsAqqhXrmv7gbk9Bc=
X-Received: by 2002:a05:690c:d8c:b0:71a:27d2:2bdd with SMTP id
 00721157ae682-71b7f62d7famr21657777b3.13.1754086311325; Fri, 01 Aug 2025
 15:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 17:11:39 -0500
X-Gm-Features: Ac12FXwPXRZu6Ot3_0uSchflAwrF7qDuOzVPDdy_jKO2tY1n3bXW3MwJ9wqx3gQ
Message-ID: <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp
 syscon sizes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_151152_635921_9A1A2D29 
X-CRM114-Status: GOOD (  18.56  )
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

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Some USI instances have swconfig offsets that reside over the currently
> defined syscon ranges for peric1 and cmgp. Increase their sizes.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 943e83851..bab77b442 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x10720000 0x2000>;
> +                       reg =3D <0x10720000 0x3000>;

Exynos850 TRM says that all System Register instances (in Exynos850
SoC) use 16 KiB (0x4000) of address space for their registers. And I
can see some SYSREG registers actually have offsets over 0x3000. In
reality though all IP cores are aligned by 0x10000. I have a feeling
Samsung does the IP cores integration in the same way for all their
modern Exynos SoCs. It can be actually deduced by looking at the
starting addresses of the nodes in the device tree, they are always
aligned by 0x10000.

Hence I'd recommend doing this:
  1. Use either 0x4000 or 0x10000 size (not 0x3000). For the
reference, Exynos850 and gs101 use 0x10000 value.
  2. Replace the size values for all sysreg nodes in your device tree
(not only peric1 and cmgp), for consistency and to prevent possible
issues in future.

Also, maybe it'd be better to use "sysreg_" prefix for these node
labels (not "syscon_"), as it's called System Register in TRM. But
that's minor, and probably out of scope for this patch.

>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x14e20000 0x2000>;
> +                       reg =3D <0x14e20000 0x3000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
> --
> 2.43.0
>
>

