Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1ukSKhmtxKEyX7FOOTcTRSkRm/xtlj9BuhhycLdVw0=; b=MVaRCjf81x8g//sCdNIaSGAQvt
	bDVakVzIuHDa+dR+zVN6RcNz+TT6KDBEbn8nTSZPiYMFNH53NJm8pagavv2flanSiIR3+4cmiCFN4
	M1Vr1mDiGRPFflVkpmcZ2VVjeuW2HQM+44CTKxz2dF1iYdgIwyTKZvWrisTU5iZnl/6ixDFN7Ex7R
	B8JqJ20V1RsSi+Pa7cI/beEtF0/Ns1D4H+jubxmygCne53VFc4R6eaNQI2naVHSfO9RZLw8togHON
	omY2pItFS3RvpX7rM7oXjcpxEjfwv+ZlHqFsb6wsxoPXDqrnh5HiRZZbEJmlpvfZBkEfK2axil640
	h7Nh/LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui0AN-000000070DJ-1WqX;
	Sat, 02 Aug 2025 00:32:03 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui07m-0000000701N-383O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 00:29:24 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71b4fc462ddso19027717b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754094561; x=1754699361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ukSKhmtxKEyX7FOOTcTRSkRm/xtlj9BuhhycLdVw0=;
        b=QRNhfJ8NArfTd7zWFefgF9UCBT2WbGUgUFsoLwV7TsZsDW/GWpb100Fwu8SjJJumg3
         y5RFcleYRjoRjrhmPazsKfsWHOg+cW3nIKFDwJQVl7ExGI89WBHoy+vpwUQb46+ym8Pv
         QMABx2XAbAvv4Y62mCMIv3hEHMBgXlCkcv09My64aCRLSpiahgB3s0BDM/8N+TJaam0n
         JOKRYmg42/vBVt8Py9LCVnMKRKajGXKXOJGYZyvbFL/p+Nj7YaMS6mI9v/GdQTTYZu5I
         5fYT2Y2cd35WR0V7wLbEXrCdBvKtn5DtCPqmAUS2I6CLk2tFNAfpRqReRDcZxV0o9epS
         mBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754094561; x=1754699361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ukSKhmtxKEyX7FOOTcTRSkRm/xtlj9BuhhycLdVw0=;
        b=Y6zN85ncEvhzt3J0ZGOm0oDTK7dBArNMzdH1pGlc8KFPptw8zitFFPjWLGQicGHpoK
         PERgoBLb1ThnU15gr8dcfjQUboXBnnyMGhwdC1gIajjxzmMU1MihbCdqXYbtGnfWejKV
         dhlrZfyA7UCbOrdNluHGdvJTOoi58pO+tzLucuCfzzQm+FlREmHB5o4xPcwYzcSjB3eR
         wn4lvUpcRmfDHxmi9L56Jb+aDxZ5Bg08D7vem4k85lAQVtOe5d598wAoElgG3MI4y+6B
         eIMS//QkznxphOCaLQ0WlGKadwWB+B+SYZMSQEPoAJszy41Ku/3goe5wr6VdUuXUB+75
         8HeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WsWqhQgeSc3LEqAsSrydVqq+fhxVqkjEUWnYlnlS7tw5lyQ620EPU5Cj1f4qgEqdw9FeRL9XkvSJsg5A0wG2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf2HdbMJVh1cX7RhYI+V8uqdjBG86CranOGiin53zpV6CdOT2R
	t5qfO3GSPA4HrF8UX8lfS4v6L9gjEK5/U7MKLhJr0N3Asev8iLhw0gyfPtxe05LWU2XE72p9HeN
	l53LxW+irnNpqNeUrMjC6lnsseWhet3tQ/lyut/2v2w==
X-Gm-Gg: ASbGncssixL0+q3dMrNv2q8IPsms9SwAxTMyXDXP1FQ9Li7r7dZN0c+8Eu+xiW4iXGi
	h1tRB3yhjOu7wCILOlea17zUA8lR8GuU0S+pJcBSpJEv1qUGCQQEeqGOprcTp3MTyUbPHKB20J3
	kzd6REprsjKDcBhwuxPa5GED4CcDnvPYukEMIICvOVPWz+Rv7y/bAgTlsGs7OLK49l069mnIFuV
	fmLog==
X-Google-Smtp-Source: AGHT+IE8ocrwfW+jYi1b+PwwdH776i/4xWR5LD9i+ONjyo97j81erbD7o9iAQzRF40MbhmQx3aXjuOwbFFA0dvMS4Yc=
X-Received: by 2002:a05:690c:3343:b0:71a:38ee:1ff with SMTP id
 00721157ae682-71b7ef4db59mr22292567b3.25.1754094561179; Fri, 01 Aug 2025
 17:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 19:29:09 -0500
X-Gm-Features: Ac12FXzIeJyXP9m27_ER8_SL561hmtMLHZi1Z0J-tLh9l2MOkqp5S4hnFCva6J8
Message-ID: <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos2200: define all usi nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_172922_874568_7FAB03CC 
X-CRM114-Status: GOOD (  28.22  )
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

On Wed, Jul 30, 2025 at 2:44=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Universal Serial Interface (USI) supports three types of serial
> interfaces - uart, i2c and spi. Each protocol can work independently
> and configured using external configuration inputs.
>
> As each USI instance has access to 4 pins, there are multiple possible
> configurations:
> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
> - the 4 pins can be used for 4 pin uart or spi
>
> Such configuration can be achieved by setting the mode property of usiX
> and usiX_i2c nodes correctly - if usiX is set to take up 2 pins, then
> usiX_i2c can be set to take the other 2. If usiX is set for 4 pins, then
> usiX_i2c should be left disabled.
>

The whole naming scheme is a bit confusing: one might think that
because both usiX and usiX_i2c have the same number (X), they
represent the same USI block. I can see how they might share the same
pins, but it doesn't seem enough to me to justify this convention. If
I'm missing something, please help me understand why it should be done
like that?

> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
> as their respective uart and i2c subnodes. As Samsung, for some reason,
> has decided to restart the counting of usi instances for cmgp, suffix
> labels for nodes of such with _cmgp.
>

Yeah, they probably meant to number CMGP instances, not USI instances.
Because CMGP (stands for Common GPIO) is actually a separate IP block
containing:
  - 2 x USIs
  - 1 GPIO controller (8 GPIO lines)
  - One general purpose ADC
  - 6 interrupt combiners

So some USI blocks are separate USIs, and some USI blocks are a part
of bigger CMGP blocks. And instead of using "usi_01_cmgp" for example,
they should've gone with "usi_cmgp01".

Usually it's recommended to follow the naming scheme from the TRM, but
AFAIU you don't have one. And the scheme used in the downstream device
tree looks like comlete garbage. Anyways, I don't have strong
preference on the naming scheme. Frankly I'd just do the consecutive
numbering for all the USI nodes in this case, like: usi0, usi1, etc.
And add the comments when needed, like "USI from CMGP01 block".

> Spi support will be added later on.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>  1 file changed, 1361 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 22c6da907..f83e6cf24 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>
>  / {
>         compatible =3D "samsung,exynos2200";
> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>                         reg =3D <0x10430000 0x1000>;
>                 };
>
> +               usi4: usi@105000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x105000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric0 0x1024>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_8: i2c@10500000 {

Why not number all the underlying protocol nodes using the same number
as the USI node? Like it's done in gs101.dtsi. And maybe even follow
USI naming scheme used in gs101 in general? Like, sort all USI nodes
by unit address, and then number them starting from 0. If some other
USIs are missing (like I mentioned in my review for the previous
patch), add those too, first.

[snip]

