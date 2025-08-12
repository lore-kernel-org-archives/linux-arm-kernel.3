Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59862CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=naiEIwYwGuDf/CY0Rk/O0uYgQE/3lMNIjYzePPRvS00=; b=hzQ2nLiPP3OHKr
	XW1kxHGZ1wpO+pxnMym9t6OejjnuJieXsXI4EmIsd7H4QhIXeuIYP5Am+1NxB3/vnDom/q7SqmWOA
	hWjYWBelIXpqws4Jy/qdOQ8J2TvyQKj8f+dsE50gxNxY3b7n7esb7gi1REPunEf0HAfQi6pMgpVtA
	afsTS2foHqnVPaQI31uPpY3z8ybe8v8MZl+ravX2qOS3Mb2B1uD4i3qyvhCLF6W76/BGFeQe7thrZ
	jv+8WX+C1VBw2Z3U840L7TxJFl99EfS1V42GCuGB0FjxZW8cF8KQYmCEuHVk71W4qGex62YIO9oHW
	230fndhm2/wBs1+23tQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIx-0000000AnXD-0qGi;
	Tue, 12 Aug 2025 12:40:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullB1-0000000AMOV-1Etp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:20:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so8211228a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990414; x=1755595214; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=naiEIwYwGuDf/CY0Rk/O0uYgQE/3lMNIjYzePPRvS00=;
        b=APD2enN9zKRztr++sv9Yz1kUkJ1UB1kIx2fThqtEjz9z3k6KjWyMUOosWUYAzZxZn0
         NHUmlRBUI0PIlVDS1XyvjXplbE2YW1XhpBxyIpiZqI82h2wMGf4qMUS3F6z5sH2jqW+Q
         qnJWYQK78dmgXAJtwod26oKm7bdLpLHatqMA7hnB8y3egnTboTtQFrWM9Reigjq6lsFU
         e/tpy4+9KxZkl8S0usqpjs7hEwuDORLtvHzop8EpO8ZRR5W1Raa4iziOjUCaS1hE6OtK
         U75k4tjb7+hZDEt3hY00gLNSLpD19hCDzAS7OW0rw7pHDBjFSU9gxXvZ0gbcoH2dHgaD
         RVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990414; x=1755595214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naiEIwYwGuDf/CY0Rk/O0uYgQE/3lMNIjYzePPRvS00=;
        b=dk72JXiW+tmVgUoWXhxT0Rl5+RtVhhoim2H33oPw3fp4eiiyB5feo0dPJWlE94T4D2
         CbFClGFHNhrc4VoSmHyqOmi/3AdM+BVjbxYfNvWtNdoQu8Hnv6wQa/KPBejTQUeqS3x+
         GlALd5colxMkTUFOpbbPobIdZNhF7H1v9OiDKmBMIRyXJbm/7XmMgvFeBBEPUeB4y+U+
         JUEMc8qPEJV07Z2TBPk8ZOXN2C3WzaiQtBISZ+g/jzMw8xuZBEYjFJLnmN+b0r06gf5H
         6J9+a77NDdluwx6t9aXFwbVhQ5LWyljWZhbgyffQwXaGBvkMg7XB9kcizE5SLFbBxe+h
         LQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFsHQYYsV8zHJ3yRskjnoCCMaW7cH4Ebo3G4s1TrA868qfKBOeu4TAZul9CTyHarTAs/DWTWw2Cj+KGlewm/Sp@lists.infradead.org
X-Gm-Message-State: AOJu0YzNA9zhC8OMaS1Z0Wbu1BfsaL+lobxsM2MLsYOM/Xlda5oxq4+j
	eYAzyhbXTDkv/IE3kdphvpsUevfNbyeyxD3lZUP2HsvwX/ZJTnuoYpmzdue+k5+q7C0=
X-Gm-Gg: ASbGncvoEO/bXR8/M3Kl1B0wDCbY7j4BuUNZr5SiNT/V9uplW649DovFZlQ45MojjXY
	ieo97nVwzj2hVowz8xmewFnCaYDR8LlYaMAAGLCyJnRCUbmoi1mqO1Bc/E54vFN/3ON6eGrjm4i
	coOXxcitlNJL1ikAkseI2AKgsxokgIR7/DhEn/uqsG5twetuEi9j4M3X3IBzoEKKinEz3cABKOe
	q5tee0h9iTaXxA0ey/rnUE1xaIbjJsaBLQge6JEr2hjIjy1FAb9pndGPq1TZSqN1nTefKwtWMXL
	WYUDgCCBj+MmLHZr2gyldnsjhUIElFtpNjLDQCsY3uKBqs/OBdALbtBXFM0Fby+fC5JrscjkzJP
	oTNGf2roGcDqFOuuUlQ==
X-Google-Smtp-Source: AGHT+IHLAQYCOX8PPid3D3VRdVWAZs9n1fYBxg+C8ZteuSFbIYqwrxnkYMt6Q4wpM9LITX2LzflJpQ==
X-Received: by 2002:a17:906:ef0c:b0:af9:353d:e69a with SMTP id a640c23a62f3a-afa1e06e444mr231782166b.21.1754990413650;
        Tue, 12 Aug 2025 02:20:13 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a0771basm2160615866b.29.2025.08.12.02.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:20:13 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v7 0/2] firmware: ti_sci: Partial-IO support
Date: Tue, 12 Aug 2025 11:19:46 +0200
Message-Id: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMHm2gC/4XQy27CMBAF0F+JvO4gj59JVv2Pqgu/Uqw2JHWCW
 4T495pABaKoLGcW596ZPZlCimEibbUnKeQ4xWFTBv1UEbc2m7cA0ZeZMMoEUlrDPIzRgekVg9G
 kOZqPOEBWgAysAMc076xxQghNijGm0MXvxX95Pc0pfG5LzHxaEmumAG7o+zi3VVYr1JAckuv8t
 jqnN+f03pkNfJn3sB1hGrbJhXOD2qFXTcPR+rrN9V9FUoHy+gY/35whgTPtPXYdam/azMix9zp
 O85B2y5syX4qfOpXQ/z+SOVDotFPH1zSqxmdrdh/RprAqVy94FheQYfMIFAVEZ+tgrBdUhzug/
 AUl5VQ9AuWxYcMZ91wLYdgdUF1AwfARqArIrXShMxY5b27Aw+HwAw/mC4p4AgAA
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7839; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Rll97YQ5vuw2udS/XZUyIkkICLtqDy4MwGkuogNaJUg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZ7Das3PfvMbOr3pmX0GPulHH/f57Huk7v/WXTfp8tU
 grzEOXpKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIkU9TIyHF3yk3ej6XOLlg+6
 i7z998TkSr3deTT05500hQPCm5P69jMyTH3BnPNlb0OAQLmBq92cvzPm3FuXIsynLLd3f/GyNye
 ZmQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022015_367564_2C2185DF 
X-CRM114-Status: GOOD (  24.40  )
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

This series adds support for Partial-IO to the ti-sci driver, implementing the
firmware interface necessary to enter this low power state. It processes the
wakeup-source properties from the devicetree and communicates with the system
firmware to enter Partial-IO mode when appropriate wakeup sources are enabled.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the system
on pin activity. Note that this does not resume the system as the DDR is
off as well. So this state can be considered a power-off state with wakeup
capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each handling
a different aspect of the implementation:

1. m_can driver series: Implements device-specific wakeup functionality
   for m_can devices, allowing them to be set as wakeup sources.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.17?ref_type=heads
   https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-0-6972a810d63b@baylibre.com

2. Devicetree series: Defines system states and wakeup sources in the
   devicetree for am62, am62a and am62p.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.17?ref_type=heads
   https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com

3. This series (TI-SCI firmware): Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

This is now merged. These new bindings allow the ti-sci driver to
identify devices that can act as wakeup sources for specific system
states like Partial-IO.

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

These patches are tested on am62-lp-sk.

Best,
Markus

Previous versions "firmware: ti_sci: Partial-IO support":
 v1: https://lore.kernel.org/lkml/20240523080225.1288617-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729080101.3859701-1-msp@baylibre.com/
 v3: https://lore.kernel.org/r/20241012-topic-am62-partialio-v6-13-b4-v3-0-f7c6c2739681@baylibre.com
 v4: https://lore.kernel.org/r/20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com
 v5: https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com
 v6: https://lore.kernel.org/r/20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

Changes in v7:
 - Rebase to v6.17-rc1
 - Update the idle-state-name used to off-wake as introduced in
   dt-schema

Changes in v6:
 - Narrowed down the wakeup-source binding to phandle lists
 - Split off the mcan and DT changes into separate series

Changes in v5:
 - Rebased to v6.14-rc1
 - Merged m_can and ti_sci series to avoid conflicts and show
   dependencies more easily
 - Added definitions of system-states for am62/am62a/am62p
 - Moved wakeup-source definitions into board dts files as they require
   a bit of support on the board.
 - Updated ti_sci support to walk through the wakeup-source phandle
   lists
 - Added pinctrl settings for mcu_mcan0/1 on all boards
 - Minor style updates for ti_sci support for transfers without response
 - Update and move the dt-binding for wakeup-source from the m_can
   binding to the dt-schema repository

Changes in v4:
 - Rebased to v6.13-rc1
 - Removed all regulator related structures from patches and implemented
   the wakeup-source property use instead.

Changes in v3:
 - Remove other modes declared for PREPARE_SLEEP as they probably won't
   ever be used in upstream.
 - Replace the wait loop after sending PREPARE_SLEEP with msleep and do
   an emergency_restart if it exits
 - Remove uarts from DT wakeup sources
 - Split no response handling in ti_sci_do_xfer() into a separate patch
   and use goto instead of if ()
 - Remove DT binding parital-io-wakeup-sources. Instead I am modeling
   the devices that are in the relevant group that are powered during
   Partial-IO with the power supplies that are externally provided to
   the SoC. In this case they are provided through 'vddshv_canuart'. All
   devices using this regulator can be considered a potential wakeup
   source if they are wakeup capable and wakeup enabled.
 - Added devicetree patches adding vcc_3v3_sys regulator and
   vddshv_canuart for am62-lp-sk
 - Add pinctrl entries for am62-lp-sk to add WKUP_EN for mcu_mcan0 and
   mcu_mcan1

Changes in v2:
 - Rebase to v6.11-rc1
 - dt-binding:
    - Update commit message
    - Add more verbose description of the new binding for a better
      explanation.
 - ti_sci driver:
    - Combine ti_sci_do_send() into ti_sci_do_xfer and only wait on a
      response if a flag is set.
    - On failure to enter Partial-IO, do emergency_restart()
    - Add comments
    - Fix small things

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (2):
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support

 drivers/firmware/ti_sci.c | 138 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 140 insertions(+), 3 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v8
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
prerequisite-patch-id: f7652a616dca17fd5e4a7e5cba59de6a6a36079f
prerequisite-change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da:v2
prerequisite-patch-id: 33c717bb60c1d01f8cc7118916c23c7c0b2199a8
prerequisite-patch-id: 707e4619d7b844e1b67ccde28b4484b7b0d27daa
prerequisite-patch-id: 412feb5d3fc125e489d11b726c0b2d8fd5ff36f3
prerequisite-patch-id: 4e3ed635267f9548b9ac7a9e440971bb1e54a5ee
prerequisite-patch-id: e0330ef081affbe91e02b2e9b5a76ebab59e6ea6
prerequisite-patch-id: 8ed14e4861cf2fb4ce2dc2712222ad4d956746d7
prerequisite-patch-id: 7b961aadd7a3298eb8ad245f173e1c5e47b37be9

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


