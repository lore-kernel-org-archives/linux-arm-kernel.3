Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9723CCD182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQH5btvzekMNbwf5Pqm2Bdf+elX6uu1Uqi8n+4VdYAg=; b=UD5uPJBUMdJ1sT
	RXIV6xQyqRxOxRjnMZrdYz1WV5Pgo85u+MC2NGrt1eJepJ0MG9dYZz4RoqPzr2O+4ashfn/y8g9Cd
	je1M6DGh/LMtdjicOKIhI1Csw3FoCHWoDr3Mntf68On7kis7bMyNV/ggBZ3VQEwqmSveaPz+gXNQa
	xK4f3hGAp/yxD7XMxdBFXFKX8pPSo7NHB6mjuXgSND3RbNfUHOQBqB7JKLrdX42EbbS1mySuh0Upm
	6vlp+8oaFqNQsvmqnf2NFUQSlVNeEM1KLVoMrMJ7ESPPfsckX7eeZRIIQ4Shv6C8bXR0I5CfZZE7N
	hIyQEQLciI9k7ApiOFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xyB-00000008DUS-3ezF;
	Wed, 01 Oct 2025 14:38:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xy9-00000008DTV-2LUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:38:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so623222066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329492; x=1759934292; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQH5btvzekMNbwf5Pqm2Bdf+elX6uu1Uqi8n+4VdYAg=;
        b=b3AW1j56znluij/I7ANF+DOIRdNkzg246uXrC2jf6DfKhWSBA0vHEF5x96YMMC02gD
         H0rxkoSoZ4yGQk1FFzoL7GaOg3jlXfBpGVY2dRpv+BRX5q6XT0rBunRyfshIit6Md+MR
         aDHw5yErGpJ9F76DBIfx/NwA8XYr6UnzItsFyO2wMhY558jCHUMq1K/Y0UzM21UdPkNe
         7m6hIafyJ2GL4Z8q3/85e2K/AHgRjrT68x6f6R4Dh115DX7yXClgVowhxKrAde8XdI1p
         zqMn1DsDNPS9l4s8jysw3o/bmqcsAY+JUTMlQSD9a+iwdGDLtidZ7rPHe6sbzOHFNDAF
         lFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329492; x=1759934292;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQH5btvzekMNbwf5Pqm2Bdf+elX6uu1Uqi8n+4VdYAg=;
        b=dgnpv2cqmFkjV9iVXdh4rVClqnAymD7b98GG/5FuEXeNATCv3fx2cIBa9Ca/D7D7La
         VIwsaMI493EIWLwJakX7Ie/0LPssAhL6mOFBOISDXekNxP15Ri875NvFnD8/G5y5QFQx
         1jAwDf9FLBfm9vxtngDxiWsiu1y2LQtomhPNzbMxcix3tCZILWR4191tOzI2BGEbV4He
         B1p3RUwqLVO7jzFY98uGPLlmma6594r1IDA4Y1zSeUw4WKdY9BxbNYcUU/6Oi5hqOX47
         sN8DhCUi1XKU1WKyuBwT5JvFf54JkF3+mV2vqj7jVCNOjfRapnf0rVsGr1N5FWWyW3HL
         X1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWHRDEUayz9cNGTBqA/PdUBIieJ5nMUHX8IqFem70r0OEhxcwG8VEkTJs3Xfidb2fwAMhkb81zJS2RDF4QNaln1@lists.infradead.org
X-Gm-Message-State: AOJu0YyFofa/2SOYgPo83YDpcIz2rH8aZ1Jy22mZMqzvuvWRfONxz6Iu
	IdRja9rkn1SUjUz07LL25g4x3VCD7ODVFhOw9SrxKWf8jpbDWdg1TWuqOF551xpHGxCcmanI2d3
	ihzZ+th4=
X-Gm-Gg: ASbGncv5MdEZN3JzIMKCBe4RwnjQANhvnEJv5VoVg2K4dgbprWOaPyUOBLJDz+LTkkJ
	ZXBCuTJ0M+qcmV2QRBg9D+SruKu0qTWdQbZhYsMvaqNhHXa//W3t3nPyoAWn8cyVO5fUubt4sF0
	ApLPuM+PYL3B97deekR2QNGtgaHd9iDLkWDvCjng7hjeQ7hs62zKTnv0fRXmias41dyCNEh7kSC
	LtOiLrKov+iwp778BUctwcog+IPJaWOPzqzF4z4BubHl5iHy0xVH/4MQAXukFok0O/MI990qo4b
	IuWdSGfH7sKqUknlPPVJ1PLV2rcMJtr4l3mRKel9yL95Ebn8j+Qo15BOyH5Si53M/su5gTKpN9P
	083VWJdILu71EvuoyLljvefC158iBW+HIZY8tNLZbwLDO
X-Google-Smtp-Source: AGHT+IF+k+Y6V3FbejS03A5mK9lxzI5++enhqPKipLdPjCmp6qBkSnJDY+mplwklIwoClUJ3eUySBg==
X-Received: by 2002:a17:907:3f8a:b0:b04:3dc7:7d80 with SMTP id a640c23a62f3a-b46e585ad3bmr485586466b.18.1759329491525;
        Wed, 01 Oct 2025 07:38:11 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b3e60de51c5sm705045166b.15.2025.10.01.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:38:11 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v8 0/3] firmware: ti_sci: Partial-IO support
Date: Wed, 01 Oct 2025 16:37:37 +0200
Message-Id: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALE83WgC/4XQSU7DQBAF0KtYvaZQz4NX3AOx6MmkBR5oOyZRl
 LvTToIShQgvqxavfv0DGmNOcUR1dUA5zmlMfVcG/VQhv7Hde4QUyowoppxgrGHqh+TBtpLCYPO
 U7GfqYZZAKDgOnirWOOs55woVY8ixSbuT//p2nnP82pYz03mJnB0j+L5t01RXXdxNUE4JbKhBt
 xnq6pLAXBK03nbwbT/idoCx32YfLym0J0Eaw4gLup4J/ssIzIm4fSRMd78IYFSFQJqGqGDrmaE
 l/CaNU5/3p67Kakl/DlWu/l/LzABDo7xc+jFSkxdn95/J5fhcXj/hM7+ClJg1kBeQeKejdYFjF
 R+A4hcUmGG5BooloWGUBaY4t/QBKK8gp2QNlAVkTvjYWEcYMw9AdQX1eoeqgNYTrKXwNGh1Bx6
 Pxx886BpazgIAAA==
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8175; i=msp@baylibre.com;
 h=from:subject:message-id; bh=BlZF+X5LwTRZ9A3kXP+aGTIwLm2/MeYoAXp+MpGR7cU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NtufTWc5/VzXbe4C028X+Ba8tnevLTnxt/CsxvHcX
 0LJ1m7xHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARlrWMDDNKv+08Nm0Vb9bZ
 1rrDew7VrG9f5yjwQdqwTMyVm/Mh+w5GhnbhX97XbqdJf/2bLbeycuPDV69LHZttFZdun3Vle8/
 8nywA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073813_653522_3BA5291D 
X-CRM114-Status: GOOD (  25.08  )
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

This series adds support for Partial-IO to the ti-sci driver,
implementing the firmware interface necessary to enter this low power
state. It processes the wakeup-source properties from the devicetree and
communicates with the system firmware to enter Partial-IO mode when
appropriate wakeup sources are enabled.

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

2. Devicetree series: Defines system states and wakeup sources in the
   devicetree for am62, am62a and am62p.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.17?ref_type=heads
   https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com

3. This series (TI-SCI firmware): Implements the firmware interface to
   enter Partial-IO mode when appropriate wakeup sources are enabled.

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
 v7: https://lore.kernel.org/r/20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

Changes in v8:
 - Add a patch to remove constant 0 argument passing to
   ti_sci_cmd_prepare_sleep
 - Move partial-io functions further up in the file before the first
   static const initializations

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

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI.com) (3):
      firmware: ti_sci: Remove constant 0 function arguments
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support

 drivers/firmware/ti_sci.c | 154 ++++++++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 146 insertions(+), 13 deletions(-)
---
base-commit: 24c4d4041c2ec11c47baf6ea54f9379cf88809fc
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v10
prerequisite-patch-id: 40ff771d13dccae91c04ab120aa1b5e406b66e47
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 2c9142d2bc47e64c49b7b8a7ca20a62a0be14870
prerequisite-patch-id: aa64f7e9fcc3fcbb3cb871a05a07f398f3aa8231
prerequisite-change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da:v3
prerequisite-patch-id: 707e4619d7b844e1b67ccde28b4484b7b0d27daa
prerequisite-patch-id: 412feb5d3fc125e489d11b726c0b2d8fd5ff36f3
prerequisite-patch-id: 4e3ed635267f9548b9ac7a9e440971bb1e54a5ee
prerequisite-patch-id: 65704d9da41da1fa9fc647c185f412022a16acb5
prerequisite-patch-id: 95a62b97efdac9bdf1921c1222acefac6e608c84
prerequisite-patch-id: 87d82194bc278580ae54e8788b4508f743c61061

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


