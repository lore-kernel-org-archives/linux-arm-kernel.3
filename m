Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0EkYS8l4tZkm6W9/Nj27McxA93BOVMFO62Xo7My4YRY=; b=AZNGTSJdVo+7+9
	DgoDEFn2dF0NSmM8ReqJqaS3W5d/9Z95hbqVUwjwhFP94HJ/TXnyNCzdhFMPrUdhplRHFi8Baj5oq
	hUYVejBQ50UAuaeRF6patGi9CvobPV4ggmG9QAxJ2fKX3HsJ07m2dTaTA/9BnP8tCyhwlX/6iyLKx
	vgyoBzniXRW9Y9xgVVSn2QFx27o0fGI5ggFTAW+wwzsJ6uDQlIYgU1nRSORv8whGhVXFqNkY8Iw1z
	MxvJ4AAJy96hS0Jkn7tKqknQXvmAG5qsDEtDN8vFYxbHRpaAtxdzecA137C26NB0nygvL8Vg9laeF
	xHPIFd29raG/RLhgrzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvL-00000008CBo-1OFu;
	Wed, 01 Oct 2025 14:35:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvI-00000008CAl-0iSs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3d50882cc2so730420466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329314; x=1759934114; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EkYS8l4tZkm6W9/Nj27McxA93BOVMFO62Xo7My4YRY=;
        b=tS5TyR/KvRg8tLbDi84sjXSQsna+PzHdcU0l6Nz1/SJXp3tABYjgr+J2Zv795xG6QO
         bMWhOjenvOpX1pDNYYsLi+oTlavizvpPPCQLhXaCpG0qzbocjiKSIXwGLQPipavyIQnn
         lX3NNbZrRh/5Emm/X4bM7E+iCwWefivG+Y3WAMfXIh9FRkHPHvKgcZfh8I8+BvNF/zG9
         hlwSp8bvKjrJXYCVqF5EfMLLLGh6Z0qjAf8aDbKiG3p5MlFrmHZqV99sTo+cG2dBS6Wr
         DRxciCcbnsw1u5ge40SVljt3plnb7WMybw2ea1pvFajwld662IUjiZTihmryAmtUKGn3
         zdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329314; x=1759934114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EkYS8l4tZkm6W9/Nj27McxA93BOVMFO62Xo7My4YRY=;
        b=KcUvu4AffU+Lbt4G8OOMr7eNx+YHa1LMdU9JQiarezIahqwyB98l5ljdG+/lWfNTlj
         I8EOdo5PjzgjRhUiju5tSiGz5+2xF1b/FyQmX6xx8CjpbzfaekwpXK81PhZDUGGft6Ia
         oTTRn9qQck47/RQF7lCTfZSt9v4LHEUaTDiHg4KUI7LiBQ3OyKYd4esD670fVGiZ7X7S
         83HT0plQ3mxyr/35f1PJV6oSf6U/ixZ6tegN35vBTW+PqIZk4zHZkfch49UWmDKEPQau
         /1lB173ecJdvEjB2pyQSN8vkePflWcJ8Zbl6AZTB8sRwg3u/PyI3yzVDzU8xEApEIheJ
         3Ifg==
X-Gm-Message-State: AOJu0Yw2M3GzhZpXT1uH237qSrJSI2QrGCZibSddLHfSe1afxsKf/ERG
	PAK3A1sC59lO30c25WmeUHhYFphYNcc11YBZ30zHw1COVFaW5m5/FMufgCsUvq7oo1w=
X-Gm-Gg: ASbGncuVfCrTLnTB39jXLmCjcwvW1v54695o1eLlFhhHc/qCU2/YgF606vjueGJ1oLt
	C5Rf2cQs+01hfCsPVhVro1/+Eg3mFZJQDirN7FDicZ9bnUHHPvmz6+y24PCom17MFn7IAs+D2PH
	5XSI/FJS41GNr+tmx6b1Y7o2TPhM2pOTx6nFTZMhxShxVm9tMFjfN/2u2HZ0hBocZ95j2NOrKpO
	8QYpem2eAWZqt1BujJnifhtBchVzUUSxnEtVTVEQQe/xwOeOmmk+R4tL8H+JiRgk8cgbURwIQ2q
	ZqXoI6vUk+gUCTHkX55WRPGVd7LitIq58GqDANmXKc9X7hBhblZNKC0QA06xOUSjWBy4YLPV6Wr
	yqc49RusbQHxWyM75Urq33DPC7dUB8CvWfPshRwFUMwWO
X-Google-Smtp-Source: AGHT+IGPh0b6Cxm9sqYuxgclNTvK/JU3pH3+2c3TM2Y+STgHfKskfPDypTfSJTByubYN08YN8dsoMw==
X-Received: by 2002:a17:906:6a13:b0:b45:8370:ef10 with SMTP id a640c23a62f3a-b46e516a451mr409478866b.22.1759329313733;
        Wed, 01 Oct 2025 07:35:13 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-634ce748d4dsm8879008a12.29.2025.10.01.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:13 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v3 0/6] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Wed, 01 Oct 2025 16:34:12 +0200
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQ73WgC/4WPy26DMBBFfwV53an8ABJY9T+qLgZ7aKwGTGzjJ
 or497qmUqtusrwz0rnn3lkgbymwvrozT8kG6+Yc1FPF9AnndwJrcmaSy4bXooHoFqsBp1aCibC
 gjxbP1kFqIX+VPBgjxlEcDLLMWDyN9lr4r2979nRZc03cj2zAQKDdNNnYVzNdI5SqTnbsr0Nf5
 XMtOO9+DCaNM3ziB60LBLd6TUVBwlEL03adEoM59klw9t17siE6fyszkyjF+yIpHixKAji0moz
 iiKMxw8uAt7MdPD1n6wJP8hd4zAYPgDIDZaMaqdoaOep/wG3bvgAh1gyOlgEAAA==
X-Change-ID: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5279; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Ho6sQr+t8WVdgRQqoCiFPU4adZn9lrXFkwd2+H3u0zw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy71m8OTrv80LStu2riQ1X3S6nrP2+1PXE94Uzft2wf3
 0LF5T/9OkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAik/4yMlxikvPb3ecQrrxC
 ceXWi/5hppkyvx68XPVSsbZG+9ijLZ8ZGSaoxC07GO7tY7P68e5GCY9Ie8HEqyfrhacfWnhRQGn
 jNAYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073516_256439_B9BFF3BC 
X-CRM114-Status: GOOD (  16.22  )
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

Hi,

This series adds devicetree changes needed for Partial-IO support on TI
am62, am62a, and am62p SoCs. It defines system states for various low
power modes and configures the wakeup-sources for devices in the CANUART
group. Depending on the SoC and board details, some low power modes may
not be available, so the wakeup-sources are described in the board
files. The series also adds the necessary pinctrl settings required for
proper wakeup functionality.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
system on pin activity. Note that this does not resume the system as the
DDR is off as well. So this state can be considered a power-off state
with wakeup capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each
handling a different aspect of the implementation:

1. m_can driver series: Implements device-specific wakeup functionality
   for m_can devices, allowing them to be set as wakeup sources.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.17?ref_type=heads
    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-0-6972a810d63b@baylibre.com

2. This series (devicetree): Defines system states and wakeup sources in
   the devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.17?ref_type=heads

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

This is merged now in upstream dt-schema. These new bindings allow us to
define the system states and reference them from device wakeup-source
properties.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.17?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - Link to v2: https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com
 - Link to v1: https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Changes in v3:
 - Drop patch to add WKUP_EN and rebase to linux-next to base on the
   patch that accepted which adds PIN_WKUP_EN instead
   https://lore.kernel.org/all/20250909044108.2541534-1-a-kaur@ti.com/
 - Fix small typos in the commit messages
 - Use AM62AX_MCU_IOPAD for am62a and AM62PX_MCU_IOPAD for am62p

Changes in v2:
 - Combine k3-am62a7-sk.dts devicetree nodes with existing ones
 - Combine k3-am62p5-sk.dts devicetree nodes with existing ones
 - Update the idle-state-name properties to the new names from the
   dt-schema
 - Rebase to 6.17-rc1

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI.com) (6):
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 6 files changed, 278 insertions(+)
---
base-commit: 24c4d4041c2ec11c47baf6ea54f9379cf88809fc
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v10
prerequisite-patch-id: 40ff771d13dccae91c04ab120aa1b5e406b66e47
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
prerequisite-patch-id: aa64f7e9fcc3fcbb3cb871a05a07f398f3aa8231

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


