Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A024D3B7FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5gHcQ4FCTGNFnaCtGHvpnPCQcPDHMQwxknwgQhKcio=; b=TdPbT4NRJIRJNN59EHhhayJzL/
	DjIpDS4F4mOh7wH68Qz2vhv7joG/Jv4Lr0bb1YTfJXf00PP8JZilujsW4C3qnyFG4BsRuBlHf2HwM
	W8t39s+GnpFvEUvlYb+g6+7kDwRa8j6HvEbrcVh+iiE+1O5ZxxPFQ+BOX7LiIcIUKVjMGhCnCl5i6
	tkqzN7jaDYqKeTAt80Rrud+D8FkNMdfWzeGWaX1syWfUICPnTHv2KYZCD+dKMNWPEPsEfCpgxL0Mu
	4fwg3Adq7bEzGGeFkFzr/7+ZPb4c15n8ha92obVCqYvH4KdbPNCNIX3tdHpoJ/cRFrl2bgdf3TKGG
	qS6z8X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAlv-000000077Dq-47OY;
	Mon, 02 Dec 2024 18:03:47 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAkv-0000000776v-0rSf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 18:02:46 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa52edbcb63so984315066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 10:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733162563; x=1733767363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5gHcQ4FCTGNFnaCtGHvpnPCQcPDHMQwxknwgQhKcio=;
        b=QLgn8Zxpjatf+3SjpdZVw84LK/txFmabJGd8AMeI2dvcKzpbb3pf9T2VFFaFxbYUNY
         XqKkW1WuHmGTsp2uROZ9V8hqHsKCRIcDK/XgMfu3Io6xaSwsD8n7ljkfpBCWlzvluAuw
         MH6LOw60b1iyVfhT/C4iXaz0Nx6IOjI5WTC1QslYrIBkHFLNyqSnd2Lxymc7s2QUgmIx
         3Hh+LTj+kcj18nAf8+rLv7/I4vy2/UppiH4fxgYsxlJZTRxbru7OX1y5C78+JOSh7D6D
         Ht5afEC9sFNiSvYELP18bMXN9NgbL4BSu0uybcsbBb8klooNAmlbs8VhtKgebeCcM1iH
         VcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdJyHxbOrQqHVpuU/fTIzdZHDgOaxAZuUFe/t4d+SXkyV7ilpv3BFU0/qAyz0jhve2AAJFio1t9SDwARd/W8YO@lists.infradead.org
X-Gm-Message-State: AOJu0YyTg5jvgAm9HBn3sbpn9KUe2tFqgfHgEe4sVWY/v4g61tUJk3or
	2b15rYojsCBnF5ZJ2YqTwPNfRxLH4sl1bUj75IEfB66kThR9DH3dItGanj2o4kE=
X-Gm-Gg: ASbGncvtrg5K1yqjMzR4sxrBonIHT6vsx1eZCNMiQqJCi+TG3jPKPA3HcEVkzFCAJk2
	dRa75Yu7CHfus4hXDfPyivxoLMJlLi7ueUvNRNyebXjplkrckMoyeZMgghKItS+jGfBfoKXNlrz
	3LILwDM8RKLJNBYnmRxSnEyQvyK9iffAK1p3PgEesfqz8gi0IqlzFccH5deuIAUkjMFAHEswKmH
	cNaW7pUSumMbm4Kj0cZnLpow4hdmMonM7IFCbjV/i3HDKkhgsrsgmZ+CuVf/rSCvoXhwxtpsp/2
	lvkH
X-Google-Smtp-Source: AGHT+IFvr2mSZVts65V2N5vRf72eiZIO3xMEeE3e82vntFf6UW3H39YiU2xOtzRRu+RY7KSGQaev8Q==
X-Received: by 2002:a17:907:3e95:b0:aa5:ef1c:9dfc with SMTP id a640c23a62f3a-aa5ef1c9ee3mr122793466b.8.1733162561574;
        Mon, 02 Dec 2024 10:02:41 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d55eesm531746066b.80.2024.12.02.10.02.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 10:02:41 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa52edbcb63so984307466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 10:02:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOujs79WY2JdVl/gySNBXfylFUKzxy3NznXVijNTffMZ+LKFFy+1Ca8zblA19HvCLeSOHxS8PQgEeqJAWjE0El@lists.infradead.org
X-Received: by 2002:a17:906:2181:b0:a9a:616c:459e with SMTP id
 a640c23a62f3a-aa59467032cmr2043918466b.27.1733162560648; Mon, 02 Dec 2024
 10:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20241201155820.29259-1-towinchenmi@gmail.com>
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 13:02:04 -0500
X-Gmail-Original-Message-ID: <CAEg-Je97QmLUrOV+dvg2zbV56R44Ouj4gLwV36z-RdvG-H+hGw@mail.gmail.com>
Message-ID: <CAEg-Je97QmLUrOV+dvg2zbV56R44Ouj4gLwV36z-RdvG-H+hGw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add PMGR nodes for Apple A7-A11 SoCs
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_100245_242877_70533E74 
X-CRM114-Status: GOOD (  18.47  )
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

On Sun, Dec 1, 2024 at 11:00=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:
>
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11 SoCs, along with the associated dt-bindings.
>
> Changes since v3:
> - Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
> This is required for cpufreq to function correctly which will be added
> in a later series.
>
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
>
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinche=
nmi@gmail.com
>
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
>
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinche=
nmi@gmail.com
>
> Nick Chan
> ---
>
> Nick Chan (10):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s8000: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
>
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  39 files changed, 6237 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
>
>
> base-commit: 9ad55a67a788c0806b0fe23be36fae6dbfbc3fc5
> --
> 2.47.1
>
>

These seem reasonable.

Acked-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

