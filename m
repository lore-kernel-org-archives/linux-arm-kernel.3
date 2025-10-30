Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kUMLbhFtvELaxcn86wwRsLkRRxt0ratGkIV9nmyhh3o=; b=DYGQ0WPLgxcEFf
	zNuB/x9s1HeT6jUSierWXYCa2A/S8j9Ap71rEfo3odKEgUg3C7nYS2fA6AzUECpA+eOZvJnWQrg4U
	i6sTFvHymCt8ehD/DNsQB9zqzRFPwPTe9qS2jCZ2giHKkD1pdEHwqRCgyC3mcnymci68KDdPXeVhN
	GytV0MlAvgCgyBF3Xsu7cHVGHyuPh7cIu0bMSci80HY8/NrKu23zhlFDacYzU2IswXtNfas1QrJ8v
	Pt14TDFSgHVr2hXCjEPox4Tc7tdA+d3RMca2dr6lHJ3h0mUsGmhHJwGOvSnOOb/hK2elYohiLArVk
	9yW0BCw8f8DQQC2/cNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvx-00000003rNG-2tr2;
	Thu, 30 Oct 2025 09:27:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvu-00000003rME-22b0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:27:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47112a73785so6016765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761816421; x=1762421221; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUMLbhFtvELaxcn86wwRsLkRRxt0ratGkIV9nmyhh3o=;
        b=k7lzztUoN3/2jMmIz767+6iLXJvGVTn/44yuTIOHx3T3IB5YvlgYgZRe3VMo5Uz9zB
         A3c1JXKrPN/p1cAwoZtzVDPmP/XUaiPLkp64fJ6Iuh9rox++/QgVBc3EMc4Z2xLrMCqE
         2adE7e6aHfxDlS17H9i+gbUl6CryF9WHTRVouNH3e4xJ5Mxhzjm1llpNAD7AAunxBKUt
         4P2qB85189oEP3UF49PDE67giNtbbTtFNjLIuPrBwSXYm4ykb52bfbKlI8WwhrSlvofa
         JAe/dYdtow6A4CSZu1XujMy+u5VlQ81qYIg68uA0vDehJE6BRq94JGLhjok2tozXoiU8
         0Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816421; x=1762421221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUMLbhFtvELaxcn86wwRsLkRRxt0ratGkIV9nmyhh3o=;
        b=vY6OlR1/SR+OYJ0Lx3J+cn4uxGIguDQ4eGPT976mL3WRTkyrS8B9Da6rzWu2x2doPD
         9+j+9QpQ4xdqq/RQKPGvr9zksJcVCl4ffmM5ojkdtBedzYYXikcpVKAZdyFgxsGJFzsu
         2vhQJchs9SUC8I+9Wx4O+086C7fo7B+p7XCWeeFIP5vsyPZJsZEtFxQ23/jFM/FPPF+L
         MpZE1GxsNleUjBCvlS0bQ+oj2IeQvU7Fp0+rExBZfZ7mkPMBtniN+WqP8w767agMw0b5
         zN6NZxee2IASzDieOB0rFw9cOgXNhn9vPrCOO4/jXbXtnVOwuy7ZmRhkt5rqP+q9zpmX
         q2bg==
X-Forwarded-Encrypted: i=1; AJvYcCUmaETLGTVTmUNw9FIUb6uHSHmHmXcb+jPL7X5/caYF+6NK/FeZWBnKGz7haWY6/Cg1TlRurd8n4sDW5xpFAe+4@lists.infradead.org
X-Gm-Message-State: AOJu0YyugR1CleyVBGWPRcffL5wYizLlDBO+B0U8CmdyNHlh++ep1RWP
	gjweVRUjhxQUnrTe3aOkoU1J4hbVHIz7e6TTfVas1eRNeqHlOYJGfx8QJlJFkaETmYE=
X-Gm-Gg: ASbGncs55uGvTPpYa1Cc9FGsGYsm2fgcmKSsjWUSg9NHBst1iDS0GVEgVxGp2S5kgfK
	6Ve5g/ZF7L6/5rqyQgy0kaKrMSeJpctgh0atdgmo9ybOYljEayeapsaUwFDUuHI+SbqoMn7REKb
	lk3AjimnEQFjIGF01pvzb+IO+eJD/irK8DGRFzy204tZu0hfUV1HhcZh6waSqGr04WWtW2yxCsv
	j+FkYTqtvKDdHaxGUx7WrGtmOQloDMwDQ9vAJK2R04Bdc/jz5Q+eBrTV38jNNyKwKqTjRaoPwvh
	0GnlIwDvXsIJ1eYsWASfuA6fNfseQdv0b9QeLM3jmzXGsMAHqw+QxHvOX8F7MVb4decsAtz+x7F
	Eupd7AB1R1mx2YW+I2ybELmUNXEMR7pIP+jBy1SIHOBWkIc+TsdRKRSN+/Q3W6Wt90NJ0B2leHs
	Sq39PRcKkn
X-Google-Smtp-Source: AGHT+IFHaJLIvdoWgXCl/pyARcep0+z2Gu2p5sRzpwNsRD1vOIPlxFzzA5wEkVbzdwqkHyRcsJp4TQ==
X-Received: by 2002:a05:6000:2386:b0:3c8:d236:26bd with SMTP id ffacd0b85a97d-429aef776fcmr5200832f8f.11.1761816420556;
        Thu, 30 Oct 2025 02:27:00 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429b6bc5907sm2901155f8f.13.2025.10.30.02.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:26:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v9 0/3] firmware: ti_sci: Partial-IO support
Date: Thu, 30 Oct 2025 10:26:07 +0100
Message-Id: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8vA2kC/4XSy2rDMBAF0F8xWldF70dW/Y/ShSSPG0EcO7JqE
 oL/vbJNayimXo5gzr2IeaIBUoQBnaonSjDGIXbXMtiXCoWzu34CjnWZESNMUEIMzl0fA3atYrh
 3KUd3iR0eFaYMe4ED07zxLgghNCpGn6CJ98V//1jnBLevEpPXR+TdADh0bRvzqbrCPeMSJSlhF
 s0L5zjkLj2WfiNfNtYqJe//KiPHBDc6qLmTVYa+efe4RJ/gtcQt+Cg2kFF7BIoC0uANOF8LomE
 HlD+gJJyoI1DODS1nvOZaCMd2QLWBgtEjUBWQexmgcZ5ybndAvYHm+A91AV2gxCgZWG30Dmh+w
 XIfhw1NAbVyWjBFJKXkDzhN0zeXM937kwIAAA==
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7066; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UlKQDsAYNOM9MlXWPKObDdxIHCT7b5BmBANHzarVAFE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxmfROH+KoU4dPbnzQnSPw4fNpZ7ozZrlpztrzuWN7DA
 ssmZdp3lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwEQirjP8lWNdX/7SZaZWxEI7
 uXr1UvEfup63lmUsZf7FyWnhlaOcxciwVjon3/jx+3X25p7/lCQZNu5o5Zc635u5vSxgX36NTyM
 bAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022702_569149_43F92DB5 
X-CRM114-Status: GOOD (  23.81  )
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

1. [MERGED] m_can driver series: Implements device-specific wakeup functionality
   for m_can devices, allowing them to be set as wakeup sources. This is
   now available in linux-next.
   https://lore.kernel.org/r/20251001-topic-mcan-wakeup-source-v6-12-v10-0-4ab508ac5d1e@baylibre.com

2. Devicetree series: Defines system states and wakeup sources in the
   devicetree for am62, am62a and am62p.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.18?ref_type=heads
   https://lore.kernel.org/r/20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com

3. This series (TI-SCI firmware): Implements the firmware interface to
   enter Partial-IO mode when appropriate wakeup sources are enabled.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.18?ref_type=heads

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
 v8: https://lore.kernel.org/r/20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

Changes in v9:
- Rebased to next-20251029

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
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


