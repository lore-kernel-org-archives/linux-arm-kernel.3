Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEBDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=; b=S8Fhc4YMrWpAtV8yV+MnTYcxKw
	hIbsQYiZSB0ckfb7MhPNLmLXDbISimdZREJaUqC1HtWuVcM6Ce1OASpJc1/hLC/7I3zwxqPPTH2zd
	MgWq2l2HNPZu3N5TuMG7I1o5ezYnJD5IZaB5a/VrxlgmXocaXtpa5wkQGEwn/2gRWRI4sknYzIQsX
	XfmfaqHASImlQCb6oli3PeNJPQBsSA6TcF+IXc92gGIh6qJy4YDSe6iCNSvPC4E5nmd6kmeaPS+FB
	A/3cXCleYfOM2zRgFOLaCsmG7umMYfL7//wOJcFhU1JYX242V71afSngMWeUD+EQIlau1i1gpoeaa
	QiDlOmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE1H-00000001mer-48AW;
	Tue, 04 Aug 2026 12:13:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE1F-00000001mdq-3HYI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:13:19 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so6424162a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845596; cv=none;
        d=google.com; s=arc-20260327;
        b=S4XZlHGz353twvQbif5hnoY204xtm/nDGnSrGDfyTCtbnd8qiZbyKtSLaxKS3cEpv/
         quaViTvapWoGWwU9Dzi6lSn7hTpB2BEuBBs+M3Arl5soBpz1VN7+iELVmpJHakNgmrzK
         xz7M3yQcvbtox2veftwIVwX0xu95waDAz5+9cYrincXBBs3zQNepCp9t//8uG3lby9Zv
         v6s3u/eqCYfx+ZEDUJD0VEB1UvCRFIRRac3DrX1x+pMbvpbTr0GHcmn3V1o04p8s9zHy
         SCchXh2QVEZFOR/PM2yCtH2hXiQZv3lE+LUlbF7RrcLEPptSqQxUKVFp7VrQn7CCtdzy
         1iLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        fh=QSAkptam9LWQKgmt3rSMCMFyc+Rt5DPrEpxf3Zap9uw=;
        b=je4jFiPpW2SusgEbHdI+vAsHRTeamOQXzFVGgIU0Y0SLremq8WPs5hdoVL22s49JZ+
         zS7vRmCkENMpa6fyYL1VR8BVSEJlWa2UeP+bN1+76p5eDHloZiiY6SJWn/dupRN98f59
         N30mkQP/9CF7/DWL0ewfUUlSj2kXBS2skAcc7XLEqiAnoqrYjuxXSj0zOdeZNAuX5WYa
         +rVcsdWNTLN96LbOx+HNrF9wdV3/eo9V6svBkFME+mvhkgdXYfMuLgZnNsBH+/2gFyio
         xa5kiOGbmT1ySbV2to27QTfFvnRlJPRE3sA8/T7dXH5eWTJrR+UgE4ckJm/IbDizpyS0
         k32Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845596; x=1786450396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=eRdsECbGzQxPKPEJZv1/ABukIaO7FKJ6BAtMSrbXxPEQN+ixFCXQNGPcwhpj13qh2y
         EZha9j8MZ+5K7KaYrQnLSba7K8Pf3Scro3WsCilCtw0+dhqtSOjTWyHV9y9QMjKJkdys
         pKpbXAmwDXLhMb080YdMsDaAkmfbnKaQNa+bE43GGaeTseFZRnXQltADjIvXxR4e21cs
         /saX+FB8r3mUcb5GtdeF2JBwDZadAOpLtRmRo+rkT60CDtd3BO46E2UAYB7NxK5iN8vj
         QCqFwDCor3VN3yEgTHxhGHWDNvdUPsNVYFcrb3wIx97NiIg6e6w34lCjMQMggF6j3S6l
         9Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845596; x=1786450396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=oYphQ3WV6NbXSHlgpWNcDjGaB2oidfHwf830HJ4mmkWl9ovLR1FrYW1+FJdDu/DOuB
         g5kDFwsbyiRERN5EobmDxUZR038t8kOAxROjasVluOGFI0cW+teLUy6I0bPayYCzZO9r
         OCaSfo+7M/J6WK7AEWDqYJw8uaaaG5TVaLwZ0i2uFM7QG3Wb+oo8nctk52zQpg72EnYt
         vCOtvZn0Ng0xI/Z3sgS7+NXkGmrbIVihHBRtdB1OMuRCjhgfuy+um70FmEQgnn1xk0YL
         EBT5624eidMxxeuPMCr+QlMlrNBcnzb5r/wBk1dJ8OJLarJiKFpgacaudgoXBd3isNsP
         GayA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ZJeYiX8iTN+gdValumr+99KdLZYbutNk0eRfFwJDDS/xEC0IpIaq2UPFVAsTwSBxKvAJsMnNWK7exWC/KMKE@lists.infradead.org
X-Gm-Message-State: AOJu0YwWiyGUkt8Rfqiu1BakX7IakRgZV5IMGqIRe46eeNOWxYNx64ZI
	e0bguISnp6JYhlw85OcHDEo6fwXHnJ41Q3+/BAdEF6vCOboJu4L1c/JVcIHuPbu0G4CJwOGrcBX
	d9N4WH6pufgACQVjnXk78CVOFInKqrTkibcRg654L8g==
X-Gm-Gg: AR+sD13eLlirjVluP339Du85HgRYGQgNc8KEZZQNikUMyHJYiyU0pyMECBWOgsCDnya
	h1WnancHq9eN40T7tJGIHlp8exaU2a/IbUcvJA6yU+W+z6gbT3KLLVMYTEjosBMco5JvRs6+qe0
	lPoObEOP4ekIsZsUmfnwebihaDkAGYxb5vFmETamkc+joBPKb4OqkusCXZMRMgn1qqd7/8Af3IA
	cb1RZys+BlZLA/Y7lztTdvzQgj1TDMiq+TxSN4z7hOk/YrOW/Gu1I9x0K/jQNQx9ML4G/r0/Y0v
	D+0Dr7Tb0WLTkC4IklTGZOCKywXGr4wAku22uVTisFAEDUXCKqosFf+iohjSoWQTCSkFjtQcMOZ
	wM4w=
X-Received: by 2002:a05:6402:210e:b0:6a1:dbd:bfe with SMTP id
 4fb4d7f45d1cf-6a10dbd14d3mr6487020a12.7.1785845595738; Tue, 04 Aug 2026
 05:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:13:04 +0100
X-Gm-Features: AUfX_mwc02vgie46TBnIUko-uRbRaYK1so1vlpZtpYgOnY3URFkF56TQorxPBfo
Message-ID: <CADrjBPo0OzJP7UmnW2igYyqhWxbrdF_fmj0xrvX_0N6P3tNoXg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: fsd: Align continued properties and
 add missing blank lines
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
X-CRM114-CacheID: sfid-20260804_051317_981659_42B42D13 
X-CRM114-Status: GOOD (  14.68  )
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
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------=
------
>  2 files changed, 55 insertions(+), 44 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/=
tesla/fsd-evb.dts
> index 73b6a25e0e4d..503abe52a81c 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
>                         cpu-0 {
>                                 sound-dai =3D <&i2s_0 0>;
>                         };
> +
>                         cpu-1 {
>                                 sound-dai =3D <&i2s_0 1>;
>                         };
> +
>                         codec {
>                                 sound-dai =3D <&tlv320aic3x>;
>                                 system-clock-frequency =3D <33000000>;
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tes=
la/fsd.dtsi
> index 214d33ca7177..6766c78243a3 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -43,12 +43,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpucl0_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl0_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl0_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl0_3>;
>                                 };
> @@ -58,12 +61,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpucl1_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl1_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl1_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl1_3>;
>                                 };
> @@ -73,12 +79,15 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpucl2_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl2_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl2_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl2_3>;
>                                 };
> @@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
>                         reg =3D <0x0 0x10010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
> +                                <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_imem_tcuclk",
> -                               "dout_cmu_imem_aclk",
> -                               "dout_cmu_imem_dmaclk";
> +                                     "dout_cmu_imem_tcuclk",
> +                                     "dout_cmu_imem_aclk",
> +                                     "dout_cmu_imem_dmaclk";
>                 };
>
>                 clock_cmu: clock-controller@11c10000 {
> @@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
>                         reg =3D <0x0 0x14010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TB=
UCLK>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DM=
ACLK>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_T=
BUCLK>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_D=
MACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div4",
> -                               "dout_cmu_peric_shared1div36",
> -                               "dout_cmu_peric_shared0div3_tbuclk",
> -                               "dout_cmu_peric_shared0div20",
> -                               "dout_cmu_peric_shared1div4_dmaclk";
> +                                     "dout_cmu_pll_shared0_div4",
> +                                     "dout_cmu_peric_shared1div36",
> +                                     "dout_cmu_peric_shared0div3_tbuclk"=
,
> +                                     "dout_cmu_peric_shared0div20",
> +                                     "dout_cmu_peric_shared1div4_dmaclk"=
;
>                 };
>
>                 sysreg_peric: system-controller@14030000 {
> @@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
>                         reg =3D <0x0 0x15010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div6",
> -                               "dout_cmu_fsys0_shared1div4",
> -                               "dout_cmu_fsys0_shared0div4";
> +                                     "dout_cmu_pll_shared0_div6",
> +                                     "dout_cmu_fsys0_shared1div4",
> +                                     "dout_cmu_fsys0_shared0div4";
>                 };
>
>                 sysreg_fsys0: system-controller@15030000 {
> @@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
>                         reg =3D <0x0 0x16810000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_fsys1_shared0div8",
> -                               "dout_cmu_fsys1_shared0div4";
> +                                     "dout_cmu_fsys1_shared0div8",
> +                                     "dout_cmu_fsys1_shared0div4";
>                 };
>
>                 sysreg_fsys1: system-controller@16830000 {
> @@ -921,7 +930,7 @@ spi_0: spi@14140000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI0>,
> -                               <&clock_peric PERIC_SCLK_SPI0>;
> +                                <&clock_peric PERIC_SCLK_SPI0>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -940,7 +949,7 @@ spi_1: spi@14150000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI1>,
> -                               <&clock_peric PERIC_SCLK_SPI1>;
> +                                <&clock_peric PERIC_SCLK_SPI1>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -959,7 +968,7 @@ spi_2: spi@14160000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI2>,
> -                               <&clock_peric PERIC_SCLK_SPI2>;
> +                                <&clock_peric PERIC_SCLK_SPI2>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -973,21 +982,21 @@ timer@10040000 {
>                         compatible =3D "tesla,fsd-mct", "samsung,exynos42=
10-mct";
>                         reg =3D <0x0 0x10040000 0x0 0x800>;
>                         interrupts =3D <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&fin_pll>, <&clock_imem IMEM_MCT_PCLK=
>;
>                         clock-names =3D "fin_pll", "mct";
>                 };
>
> --
> 2.53.0
>

