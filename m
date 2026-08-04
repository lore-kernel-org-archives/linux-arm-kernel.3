Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B360C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=; b=rNyl/11rUujm6vf3taQWuPKZfC
	8S4p4Y4XS7H7zWVjR0uxBJj2jNZBvP9UlzNHc6232yJZQeZS61w4PUwciCh+/+JMzwkUJwbiXEWbq
	3Bjzvtrq3BYFpcj86MM6W/t39DRDsdJfBbnF5frrn6cYwdW6LASBSiBxDA7w+kNkQmotg4LUvP7h3
	8WHT1QdmnvDOLU9c7h+yX4qeRaT4CJeH/VtC5eU1XejgJyAd+qR2pLWftLLu6S1Nd3O3n4iSH+/Sw
	r2gM6ORpBtwW/RFGVQJFWa87DhS05cDTz9E7NYU6satwxFyc9CF85kwGfg5UHvMATyM3OS8onzGqi
	P9I2G7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDvp-00000001lfS-38tt;
	Tue, 04 Aug 2026 12:07:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDvm-00000001lf5-2r9F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:07:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so6416970a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845256; cv=none;
        d=google.com; s=arc-20260327;
        b=VDFL4q/nJF20ZnNVg/Or6foMsX+Omv21dFENcncvEjUv3KsXULJ5hBkX1ucwdO5125
         THv9UGI/i9vcXUai5V4BxXqw5NWKtYHsXgoavYDN7KgzeeAwySG/+AYTsVhxp2cTVEp1
         majFpSFMQsboPbl9flvPngAriDAMOKbiX/yo+oE5eEKuyx1/YdLHaVm060JeavqkLFUJ
         BepRNJYCTpqQStg2VzThGxm+kpPnlphEzAJVHOliV5Vq/VT0Z/VZcAaYuhMJByYFMMyy
         lkdDeLE21RjQQSyAba2Zn++tyNpPum+tdye/sSJfVdWhRWycMtJzO0CdtqLQ6fDSlABO
         GC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        fh=XsaChADxe2EciDiz5TDK/n+nCoWsDZ8S4ZOfJo5aUvY=;
        b=W2C+1h1K7XATk0JYbps3CG+tXXhC1YM3zNfvfr3MJl7DHlPl8iiD0ZtiveqYKz61Ue
         FKf/L++Dq+3ZI6H8S4TV0R9hyC7WnUAoNWc1sSk1L/aPOvXc+ytl8ql0kezH/4X1pt6j
         Niq7osObolwkks+tM2nqf6axdgCJW/Rq9hXb9mz/CJdIsE5foFo8ZvW3t4BhGI47pDUn
         SRSwKH5XcxflbIqjxEtNMMW88Gj9xuQF4xx5tasReQrbXwI48O0gwE2KO3UtIJUgBtNg
         OMldve7e/YPD2tOZcgS/dth/XY/abBWtmlq9Uw+JzL/lgggqKn2kmeUPP6Z2AJ2aIdCv
         yOuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845256; x=1786450056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=ZCwpxopUm7Atd3lAh2zNZ8wmsJkDv4zxVF8lkzWW6gbCd7zry0vXRhr1vwRGzeJcc0
         9xe14wYehw8yT6a7AMi5YC3s5XOIQpK1rIitZ29il6NfQIO5U5TkTqyXh42zrnEZlIqt
         1YogKI7zrj2nh/Blo3mlEwFU4Q2szNPPKNrM/V6QQFi9gezPF5mvoz8MtiiNpfLhxDyp
         Kd7QYVet+oNfrcTn9qvaumUJTrPx3dZDk4n1s9CVNDmIvIk3xd68iN25huS6TMfZaWZC
         h3Hp7O0AhTJiQkpQlS5cIALu1pX9wNFGtnx/T+ybOpnPSa122PUi5mq0AtPgfb/c4t5j
         n8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845256; x=1786450056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=Pu61JGJiZ5RS3MUV9XJRHwFFhsrYElE2zuZKaYazju6xd5NvBK9UznrQ9Y3nez/1QA
         /h9uMPSaa8jZAMeeTsv6XhGQeoZN/NCCp/EGt3Io65ntpHj6ciLY+vbKPaLdFW73CUz9
         x+go4+LSAc40tw/kppNFeZUtlrXdOzwTHnDBTwcSJ3Xs2H3gsJBfgbAr05ShH65/6wSr
         QWpQbfCBOKvZG/L7lrTvqwF2mYQ8rgmW7oran8jmKlrPp1pd8pbiIYdlEsPU8w5vRM3K
         0sm0ngDIjm+7yFVgqraskTLqvrla7l4H6xl15P2Z3zNpA8pvi9DGd0HTzM4dAf/HjZDE
         sAAA==
X-Forwarded-Encrypted: i=1; AHgh+RpJ3UVbipP+ExZpHjfHUImlmSjOGK3vURBAs7AWIK26VhVPqzR0nPM+xIFu5k3PcXNtsS1dkGSDa/ev6nc69REj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvs9KOrBnw9rDLYcLOLnwPOQqJ+XSmoHBW6qPKlBT/+r6qHl/6
	SG3KbEZJKqhhm3gfgqTakqXfKNOuR8mg5LL3gXSItJiIF5c3pPKpmv9h5EmKXUs17Z2FD7wyvfE
	HxITjbfLBYUoMcetCiQ4Za7abbEqb8Zn15pKFICLn8Q==
X-Gm-Gg: AR+sD11NMsJ9P8jo16QUYxq8Ht3Cobkk6C/OFZ0Kb58VO+wXIEKF/qBTPUAxiqsVODz
	dpKcs7VahF2WIULeiQaGeS4fAUQlJtj+finc6DNca8hKcJ103hxhXDqm+gJCqThf5Qlo75FTrPz
	wp1UNo4kCuTHoKS3+J8qb1EDvJuc5Zor8J8q1xgh9XnVa0bqcWzPbXzl4mXucx6yN0ixjM2yMW/
	9iREh9OGrpIodkuXarM1Xxqajsag6tt69R5y5TqDfIes0DFcbsBBSK3BEJ0mH1qZJbMrO8/MrPs
	ZLRmAYAbeEZo4v+X6PSn22PsVCN6hYbj9i1Ai573cXurRcevqLf0+Ruien+hxF2Y6o0GoOUL3Wd
	23E0=
X-Received: by 2002:a05:6402:388e:b0:6a1:2863:ad74 with SMTP id
 4fb4d7f45d1cf-6a12863af68mr2437534a12.16.1785845256497; Tue, 04 Aug 2026
 05:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:07:22 +0100
X-Gm-Features: AUfX_mwrWQhO6_L2Bot9kuFbfGYJZrtdWlLRWzD4dosje_HVGZdBKQIbCnWzkTk
Message-ID: <CADrjBPqc7jsrfYJXecG-PYt_Pp0vE0mA6GhOhb54u1p0SUFCzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: exynos5433: Override thermal zones by phandle
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_050738_765314_1F1C6E5E 
X-CRM114-Status: GOOD (  15.39  )
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

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/=
boot/dts/exynos/exynos5433-tmu.dtsi
> index 57b335f579d8..a3ebc49fcd36 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> @@ -7,8 +7,7 @@
>
>  #include <dt-bindings/thermal/thermal.h>
>
> -/ {
> -thermal-zones {
> +&thermal_zones {
>         atlas0_thermal: atlas0-thermal {
>                 thermal-sensors =3D <&tmu_atlas0>;
>                 polling-delay-passive =3D <0>;
> @@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
>                 };
>         };
>  };
> -};
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index 5fc3ca233ac6..ebd63b9e244d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -2073,6 +2073,9 @@ pcie: pcie@15700000 {
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +       };
> +
>         timer: timer {
>                 compatible =3D "arm,armv8-timer";
>                 interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_HIGH)>,
>
> --
> 2.53.0
>

