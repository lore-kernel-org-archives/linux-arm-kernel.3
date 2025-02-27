Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6567C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oxit/fbFATP5S0oI9jk02pT67RxLAecxX72TBSPrJ4=; b=BEoptGGdRAi9CnRG38cDVqqHdd
	3m2FvNV6A6e6/mZuoIi4XG1NOTYtkHeGBLLaZKBW+vtau5Sz0ACmrMoKBlKTUHcEdrffLYzW7Enqk
	G9fvNA6i3pcRHu7N1AWceeNx3aCzwLZZgERykLDfhYt8BKhcf8ScjzOKyOjolXaebNxqj6js/sp0P
	iPoUjV3m92ou1vf1rLQIXiyNTy5MFKDoDL9JVwsBJ7oxE4PCpIvD0AZONYHWGcns0qnWqX16BWIri
	oDdNkJ+Y5aHsQSLfSy/665JZFehp04a5OFYmLANVvECCcRGb2JHN3YgUkTjYYKbd9df8NSXeXmZod
	HNTQmzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkY-00000008aEK-0cQQ;
	Thu, 27 Feb 2025 19:40:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhMT-00000008B2D-3HCx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:07:51 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso14391351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740676067; x=1741280867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oxit/fbFATP5S0oI9jk02pT67RxLAecxX72TBSPrJ4=;
        b=Zg2EXqv/f4y/Jlmywyl4/D5XkELr5Dh9PaD2IOkZTqTI8+2J5xIIbebfOEuv+R+sAT
         mc2CnbAQX8ruukHMl+hE1n85RP1DK+pMw0YH9aRWDOq4qg+UAoqkzQV2Y4Xt2VmMfuhY
         BHro3TuNgjPRFep0QOhA8P5ZK2VOgpBZMMYKDSdMZiDlJu1sMZ3mYfU+RdTMRVfbgToN
         HbqN0NF5wuMPejgE6vb4bfBOY6Qnjxss8qaNrThzPNwJlaYjza6F55j5msgH7sYd3fq6
         hDE7o6CKgPjusFLfJNxzinXdUFe3L2xKyAzhsK4VMqzADhiMmpOW9/sRF4+DdSUqVZpC
         BaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740676067; x=1741280867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oxit/fbFATP5S0oI9jk02pT67RxLAecxX72TBSPrJ4=;
        b=GUsfIgRXr5nfYXI4bIECJFk5c9MdhBr5p1MyWIp5IGjsgtml8tzbsM49wab1MqOCTR
         4lyuznGmchzTXY03ZWLCWRVTYnKXS8So8sR9M3GRg+LLY43jVfwEQG7MnFqlhwTw7tot
         IPFauLvno4PkbnPMrcO/UfEW2AOrXaIQM2QRHrwt1lT6+OYfG2Y6nZHJ9PXABqQEbmWL
         wFVCFqV7bzB3WtqIMekDPOmZMV0fl7IAt064EDPDLzoAtFFBgIWyNXjYMsDmOckmvGdq
         ElaJS2IoGmXj/7Vh/NJ7EySW9YRQBy7m9apYFDEtw5XCd4PKcy2sapgBdI2uUzAmwAWg
         ayxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Dr01UhYcMu7tyVQ65XK3CenXHldkOHOYX6YPV1+g33A8TzSt0ZXgrXNMSd7vanpXWll0ogfFJLVSgJjPQ+FH@lists.infradead.org
X-Gm-Message-State: AOJu0YxEvC87fuM7gqYV6EdmLI8CCMp2twuZjK1KYniJqHTyYx3lMwab
	qkApKqoIMrj4wFMdV6WDFjAsFRTOu37g6FQyZaC8m5l7VHtKdGFo1eFp7akRDHeMPHtJd/AizY/
	QqeAjmeqDS/hVq630yUKwjrmJkek=
X-Gm-Gg: ASbGncvF2MZ0UWcew3hpg5ARTyaTK0GB6tUfGRo9l3URPKC8JtUqcku0etJaAWlb0Zr
	W+uF7JuWl7tIIxINu2bneC0hYW0h8YUkCVerFDF9YJhsbuLmQC83hnKCIENjvOzceCPFAwpgqlx
	7c7IuJxzplVmGFwK6qKjIX1RSvzpgXYAS/lM5hjW0=
X-Google-Smtp-Source: AGHT+IGbHwFw3Ei173z0Un2b6hE6mBlb5qScKRe0aoWLTdNiy0wIyLsDV/TjbMoZKWKVOebKb7C9sd0SzZzc+u29lkw=
X-Received: by 2002:a05:6512:3b11:b0:549:490e:240d with SMTP id
 2adb3069b0e04-5494c320d47mr80269e87.28.1740676066843; Thu, 27 Feb 2025
 09:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Feb 2025 14:07:35 -0300
X-Gm-Features: AQ5f1JoOSEVimzZP3To5R1UEdgKOEY0K6S3WLSXvUvHm17C771vmwEyHDgADBUM
Message-ID: <CAOMZO5C0uS3jes=tbnM1D75n-OoAVDXQrfyn0cPZKwdNPViFxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090749_819411_1684D445 
X-CRM114-Status: GOOD (  16.77  )
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

Adding Francesco to help review.

On Thu, Feb 27, 2025 at 2:06=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
> which is EOL, with the TLA2024 ADC and AD7879 touch controller.
>
> Accurately describe the new hardware.
>
> v1.1 of these SoMs is still described by the following DTSI files:
> imx6qdl-apalis.dtsi
> imx6qdl-colibri.dtsi
>
> The STMPE811 touchscreen controller is no longer disabled by default.
> The STMPE811 is self contained within the SoM, therefore, disabling it
> is not the correct default behavior.
>
> v1.2 is now supported by a DTSI that modifies v1.1:
> imx6qdl-apalis-v1.2.dtsi
> imx6qdl-colibri-v1.2.dtsi
>
> For each carrier board using these modules, a new DTS file was added
> that includes the v1.1 DTS and modifies it with this v1.2 DTSI.
>
> The original DTS can be used for modules up to and including v1.1.
>
> Ernest Van Hoecke (2):
>   ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
>   ARM: dts: apalis/colibri-imx6: Add support for v1.2
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
>  .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
>  .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
>  .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
>  14 files changed, 222 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.d=
ts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dt=
s
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.=
1.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.=
2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
>
> --
> 2.43.0
>

