Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A27FD0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9GjLyrUovCAs/itFKkl6SdTkHcCigmbwpVXsabFIzLI=; b=qGNbEXjTPvFp93
	IddQ82RvxdscAZB6c44YXet7QRtgD8uVGCh95elv0bRqQaM6U5yNeV14c7BYVouGrE6gxoGIekz0V
	GrEIEU5/8aj/4fbG9uUNxgbtQYKwZZ0II0T7xlAkreQ6xhWU3sW9c9OV46yS6ieBTkebZWcY9gaeM
	LwCsCR7N3bMmSnytiXMv36RaasAcIWSPZj36yHn5f5ZltygZ1Pp+joNtwdoGff0lpQ4juYNKZhor+
	3MBQ+5R4HPqRDlR0K2J4VmxwkzeFm9Ja+WgE3PPgzEjYRUcG0iyiL0oekIAvhDUO/NI0+ncz1FpZb
	7Odp74LZWLlv4BsQmeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k0y-0000000G7bO-2jxY;
	Wed, 23 Oct 2024 22:39:40 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyZ-0000000G6v8-187c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso338101a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723029; x=1730327829; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GjLyrUovCAs/itFKkl6SdTkHcCigmbwpVXsabFIzLI=;
        b=HgqS8gQ/LBcFWv6BbnvqH8FbYHiJ0E865DEdh/HiT2NQOHudAM05fGZqCHZzpo557Y
         puozijtDA7shyzjIqSKgt+Ggg1ldyzLoBsgb4QpbWktqhAoxVWuC50+9fbi6L5RwQ6mO
         pMSrJH0pCVr8fBUOp7TYB/5ct0RPZ8E/ISMWVTlYzEQcT9CM/wvFJfD9p5N4I6qMRZVw
         yhnn9RPClGYG4b4eqGcseeQgQFGNLpv1PtM4+H85NfJIfMzvHDaTVS37RDw0lkFhijXu
         UQxTyUuX6ChvK1SCSqrc42yQQL6iw+sI1U2TAKyMkDpE/Cmo8ucD76UPfEPOZ8cc6Hkq
         jZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723029; x=1730327829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GjLyrUovCAs/itFKkl6SdTkHcCigmbwpVXsabFIzLI=;
        b=HzPzV8qBje+xsJjocNsfa2ESmbuz76v4SzoAkPWKvqLjoVnDfn2ZkQ7krFaclzxr0z
         GvhqQ6fH+L9pu3mMybGcLhFXOgbbSNPdFBI3KcxwkhBhhKqjo6BXpMSwat61ucxhpecP
         2rFq6IlB0nfHVUnP7C/TAFof9dUP5g07LFlTKU/l5ozAbgLbBjyD9drRFlx9O3OsNTJb
         aFp7m/+iM+jYZy0VFkTxP0XEFprVyIFEPviuOFLQPuM+JcaIQYExkv0ymU58nYOzmmq5
         /xjlPmpaYoK7RzMA8Xk9lZ3B2HDzBn7NdC0+db6O4dFcBSnQFEarfAVvva+MqF3i1e//
         o8OA==
X-Forwarded-Encrypted: i=1; AJvYcCUcpUhPn15bMkGA89idbiRiJtStY/yoQGCkS/NiHHG7oyr1w11F5CFxXPoPdoRrD/OmA8ccG+iyXA7OBEJPsGoC@lists.infradead.org
X-Gm-Message-State: AOJu0YzInqSeM5RK9d56k7Zksy7n74KcsfwgemcUquQIUa+rLq63PnEU
	Dba7+L9+mVUiY03qxyF680w/1LQwEIdzUqmhax0aWWD9I5hXsBs9
X-Google-Smtp-Source: AGHT+IHq4uQ4ZWTcwAwjlSwm2uiOqT0ZdpoxlLWuEYMeWjs5pOEq1U85++qtkC7hLnSxG8UrS0ec8g==
X-Received: by 2002:a05:6402:378d:b0:5c5:cd4b:5c4d with SMTP id 4fb4d7f45d1cf-5cb8aca2dd1mr3261325a12.8.1729723028758;
        Wed, 23 Oct 2024 15:37:08 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:08 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 00/12] Add support for Exynos9810 SoC and Samsung Galaxy S9
 (SM-G960F)
Date: Thu, 24 Oct 2024 01:36:31 +0300
Message-Id: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG96GWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINZNrajMyy+2tDA00E0yTk1NsbQ0TTJIslQCaigoSk3LrAAbFh1bWws
 Akpg/9lwAAAA=
X-Change-ID: 20241024-exynos9810-b3eed995b0b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=3314;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=fDYGFSiGfjp1xITeKsF1qgFSp9poh5xdMsaZW2rsHHM=;
 b=MrsoCLRlSFg+nm88pTF+R79mqB3Q75TI+feiJWmHp6ies/JafB2nr0nxY/Q6GoYmqczv4OhU3
 u61IG1fjWS5C6gQ8rAXxcj7fdguHLV5SlGpaXKxiGPSxHGqHu9syECh
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153711_347486_C44E38A5 
X-CRM114-Status: GOOD (  14.33  )
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

Hello,

This series adds initial SoC support for the Samsung Exynos 9810
SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
codenamed starlte.

The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
should be fairly simple to add support for other devices based on this SoC,
considering they're quite similar.

The support added in this series includes:
- cpus
- pinctrl and gpio
- simple-framebuffer

This is enough to boot to a minimal initramfs shell.

The preferred way to boot this device is by using a small shim bl called
uniLoader [1], which packages the mainline kernel and DT and jumps to
the kernel. This is done in order to work around some issues caused by
the stock, and non-replacable Samsung S-Boot bootloader. For example,
S-Boot leaves the decon trigger control unset, which causes the framebuffer
to not refresh, so simple-framebuffer wouldn't work without a secondary loader.
Ideally, there'll be a kernel driver for the display subsystem some day to
resolve this issue.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Markuss Broks (12):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
      dt-bindings: arm: pmu: Add Samsung Mongoose core compatible
      perf: arm_pmuv3: Add support for Samsung Mongoose PMU
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
      pinctrl: samsung: Add Exynos9810 SoC specific data
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/pmu.yaml     |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 525 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 256 ++++++++++
 drivers/perf/arm_pmuv3.c                           |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 16 files changed, 1074 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


