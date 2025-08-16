Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C97CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+erJ0Zp3LHICZMt425StIsw9Vrx8YjGGvrTqeALgDWk=; b=tqrZGmcp4nRFLoAfR4nSOumTQK
	67LbFI2TkDNhgO4XHjg5nYvBTYDGMGvBxxjO7SHhmhsM38Xhw6ITeaEA3zoawhaYmnZUJC4cIvSe0
	y8dj7KPi94mB7Rc6H5xfWWyIMCSZpUVMuj9fyREU5A4Q0MoTnrhioc0CoY4TzfA47GGEQUYBCEmf6
	wdp7Q8Dzpy1Q6MdaWumhAhAnEWFIk9UD3Ic9dQXjdIhJeihhVqrAb6LkH6iw+V+8Fo2kj3Q4SNnxh
	qpMbqecoot4Ow05xZcN4EHKoh95ArJypKi/aPZ2KsWcBINYn8FUbLY4+p8/zhYYXUXmr2T6A6acu+
	iWaJZMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKiK-000000051Z7-1stD;
	Sat, 16 Aug 2025 17:29:08 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKfj-000000051QJ-31NA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 17:26:29 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e93498d436dso31720276.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755365186; x=1755969986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+erJ0Zp3LHICZMt425StIsw9Vrx8YjGGvrTqeALgDWk=;
        b=ZIkiyAkUAJD0JY2T0u6RRXUEAChm+/p3aPrebbB/aP4JqGcrsiH72x4JV1LouImxBt
         jXbGnwPnGUa+150hN8TIC5WohmuBM84g0U/9+0xb6tE9nfopB1J82T/mUpK0rrS+aoU/
         4knElpSGcs0o+9YXV0rYs+G3n2/Mf3EKdKttxt1JajhjjZUAmfhhMYO5pCne62U1d6Wb
         uJ1n7NbhPc18k4snI6fCqvUu+BQaX9sk49Y5H2mwjd3JibnfI4cZLO5yJnpcqIQbBIlo
         +JjAfJhg0pxccagvPtGakH97l4OGQAmZ2PuztI6ZMpvZon5FbabVvtToyvE6ilpxrq2v
         W2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365186; x=1755969986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+erJ0Zp3LHICZMt425StIsw9Vrx8YjGGvrTqeALgDWk=;
        b=SXAM0ylmQ6yrl+4WvWy5vHSLR8bxNXAN0VsR58axWseAbiBKeEMJrxz7OhzI+vgZs0
         7kiN6PamYanBr4bVOy//K3cRLDJXfUthWAB814KW5FP88qXX30gQ3ZvrFLagyDRo37Hw
         MFL2c5a0Js8gCjBOOCH8u69VsKhodwnKoagL3JxpaXJNdJbTR9eYa7dIYJIWdnjVJsbt
         hKX72neezeJ7AaB918C/7ByR+W+xnrePw53lSD2AWZYxCOToxoO20a0pxvvniviUEmab
         z468PeIuPO0OdrrXHdjEZIEVg8X/LNyBfcBApO42YH351S6JQLbyiMJKP4an0aUb46g5
         esOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbkmbJDDy7gTsiKB0Hov47Xo4WfRzPCcTiz349Dvsc/bF2o9Tlk4O0S67gEFDHUyYclPmI3KKZi9yuS5wsTNYY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4XY+eoYDjFUOMugr2uRCcjR4DV2MiGjpv3JgjxSCtP5ZJapxv
	pCaYM7KUKwRbWe15xOUurdvAvh+JGcpmAimbiQJpj2WZga1w/aJ+9qb88uJ6k5es5yzVrJwuWRh
	Lg5GmQYLiHQAw0jM0EnWvKq7EYTt7yha9zYJRPlEhb+hnCBYCS4zCX8Q=
X-Gm-Gg: ASbGnctiLrNR/hWDtNExqpXtZekN8/xRsnZuQpEK1Ev7pH3ENxPRjKZiNIqa7xZvmKQ
	qDSQwoyVmeYNFxt0rUg/yv9unzLtm0DYBdv1wgttJQFQY2yfpVMZn7JXGYz5oSNfLzegD2FF0le
	yqv3+YxDmJ+1wTUtHTTaskIHk/PUoKC4u+OE3tvVD0c53omDri/Z5G3XO2X52DBkyIlZpsCTqrx
	VLjjQ==
X-Google-Smtp-Source: AGHT+IEiUE/ZBe/h6CTv9oXmV/520CYO08VrAKRH9DK2kLKicjLwLKXfuc77q+NFZWV5/udeIZCHd/ZkZBNSaus2ZAI=
X-Received: by 2002:a05:6902:1208:b0:e93:36f3:573c with SMTP id
 3f1490d57ef6-e9336f35958mr7576548276.5.1755365186241; Sat, 16 Aug 2025
 10:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com> <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 16 Aug 2025 12:26:15 -0500
X-Gm-Features: Ac12FXxe2rWnXKWQd1X34M41uQmxOqzmaGTi-5t45-ucTyoZet0Hf0j8vH7V5Mg
Message-ID: <CAPLW+4mp5DASdcToSW1QD7f51w4AYQeKzTF=nq2U=f-HiXD-8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: exynos2200: increase the size of all syscons
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_102627_776655_F144DED2 
X-CRM114-Status: GOOD (  15.42  )
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

On Fri, Aug 15, 2025 at 2:06=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> As IP cores are aligned by 0x10000, increase the size of all system
> register instances to the maximum (0x10000) to allow using accessing
> registers over the currently set limit.
>
> Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> ---
> Did not add the r-b from Sam, as the patch is pretty much completely
> reworked, including the description. Please send it again :).
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 943e83851..b3a8933a4 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -306,7 +306,7 @@ cmu_peric0: clock-controller@10400000 {
>
>                 syscon_peric0: syscon@10420000 {
>                         compatible =3D "samsung,exynos2200-peric0-sysreg"=
, "syscon";
> -                       reg =3D <0x10420000 0x2000>;
> +                       reg =3D <0x10420000 0x10000>;
>                 };
>
>                 pinctrl_peric0: pinctrl@10430000 {
> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x10720000 0x2000>;
> +                       reg =3D <0x10720000 0x10000>;
>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
> @@ -418,7 +418,7 @@ cmu_ufs: clock-controller@11000000 {
>
>                 syscon_ufs: syscon@11020000 {
>                         compatible =3D "samsung,exynos2200-ufs-sysreg", "=
syscon";
> -                       reg =3D <0x11020000 0x2000>;
> +                       reg =3D <0x11020000 0x10000>;
>                 };
>
>                 pinctrl_ufs: pinctrl@11040000 {
> @@ -450,7 +450,7 @@ cmu_peric2: clock-controller@11c00000 {
>
>                 syscon_peric2: syscon@11c20000 {
>                         compatible =3D "samsung,exynos2200-peric2-sysreg"=
, "syscon";
> -                       reg =3D <0x11c20000 0x4000>;
> +                       reg =3D <0x11c20000 0x10000>;
>                 };
>
>                 pinctrl_peric2: pinctrl@11c30000 {
> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x14e20000 0x2000>;
> +                       reg =3D <0x14e20000 0x10000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
> --
> 2.43.0
>
>

