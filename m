Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y2//hknri4hGBDD1e8OM0em/ek5dr9hJzLJ9p8JI8FM=; b=whm9Pu9d5K2owW
	KCwODMkOulIqymU2XkCNIwwFPitKkn7AFwMfQrQOyc99UOHYOUBQ+65UZ36qToYn205MPu1MRUSE3
	KEx/OEByTDsKGDNQfPNKAhMRhGJOWT3FaLEhmS+riGCMFv5pLLDHhNL3DxJ6vzx5k0/npguUo3hvn
	cmVHvriIDsqNONuJ1PpXD+Z6imNWjTHGOMigjSaNJNTg52G/BXFRgUJSqG0gX/6vxO4hR7qzmQxLP
	sa5P9oTTOBccXBb/ttsEXXjy6zvO0Z/Z8vMaigAlyIabnn4Ua4xDMsA0a1d7mCQk25RjF6a4iWsRu
	7rEgRgI8HpPyJ64I16Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mjF-00000003vep-3pOJ;
	Mon, 21 Apr 2025 08:42:13 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mO9-00000003t7L-2l9O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:20:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so4431525a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223624; x=1745828424; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2//hknri4hGBDD1e8OM0em/ek5dr9hJzLJ9p8JI8FM=;
        b=2JY3HAB40JUDrQ1KdS7OIA9azzrgn6uedrNlbLKqvGR2/gf5p5X1FgMJVZB980aqPF
         arTny9c+BB2Sjnsda6WSjNUeJVhjmyGeAVr8u/helxk+rI5TcoWaLmPk+xX6PJd5oD0p
         Pk5MMCgx3LbxY7Pf7YUBG7RVbQonHEekwJEsQWmr6vv+9KW62z/caPLSibHSt4u4xTbr
         E2onsBjVOQ1MQPxwRxzBNRSDNI3Px37M2JPMKwL+o1uuZLxKBAp2eVi42MXs2PKO1KFI
         +SspKSMQJy+4CqyzUjabx1TTdRmK8XSDNc6tmYtK7XSO8JSEyWyN3PTYytwZF672djSe
         RKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223624; x=1745828424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2//hknri4hGBDD1e8OM0em/ek5dr9hJzLJ9p8JI8FM=;
        b=m1Uh9GGKVYqhvp7G6HAvjogevgcw9Tg2MQ9ZDlrijjrkRhyJBM6OWyjCOJOf2PUkGZ
         18/NjxA1amkInit7B+SHXLbB4KN1YznSf5+a5/Hg4uG8I3a5q2NkJkauMKmlNut7mDXR
         RCNEiBGIb5imXTlUVWNFWxWatiEsjh1Tpg5gCY1BdY+PQ++46X0S++8lzhV9SXWt18Yl
         G0VnNAaiKIz62hd9bn+8PN9Ojztyh7Zev6bYdi30CFIawzt23oJr+hoOki9R8GYt9Fuo
         vKt1dwBb4SHvo/zdPie+AkcFlu/XNKEYaiQ0y8zQDPuaKzUmvfi4Uf0mDPdIDaOn2pqZ
         Q6qw==
X-Forwarded-Encrypted: i=1; AJvYcCUk54/gM7S1WN61+RtzDzVKa+Hfq57maZwjjgqpqgn79SknKvebXsGfdWpiT4vQ+XGkesl46D0uWFuX3f91bzum@lists.infradead.org
X-Gm-Message-State: AOJu0YzMVTgD4RA61uYCp1n6pgK3eEJ0EE3ZsrBJ/jxWe8lWEbESoyq0
	ZoTJsiloEtuEsY1WvkC3K+V/uifLPeorNx5nCjL72gPEevyVEeVjCbXPebXfaq6bM0WoXRetGD0
	F
X-Gm-Gg: ASbGncvr5+UjEWov0gpcSwe+PD7QHOkB2sC9ST5QMlF1DgoCxqjlKt7OQk5ry4EvWDl
	wjHA8QrIFpHD/8Ksup3Tv73dUyg7HW8YtzBOgjoOMHvORsURw1jE7VN94hzCOVokwQT0bE+YZtG
	cV9AF13TGdUyUjJp/uCShuC5DCneTjJpmPC1+2AhlBb/29hsoTtlZCc5eYKREgZKACiFbhXiBRc
	Yv7Y0oaGdjQtnRdroeki3IELLVuPO19h+7XNYN0ibw/Au7PWG4prAehNtrMeoTTWfSmtIzVgeMh
	3PAZIzxoeAAzqns8pXQzIZNpXF4+I5PH+O0=
X-Google-Smtp-Source: AGHT+IHN4I6voe9MkaTbYNinvZPCG6UdoeCoQlcmMWrevtcqkaDTbIA+2EU2iRfYT2fL8Xsk7lmQfw==
X-Received: by 2002:a05:6402:26d2:b0:5f6:23b1:ab43 with SMTP id 4fb4d7f45d1cf-5f627c1e07fmr9366958a12.0.1745223624010;
        Mon, 21 Apr 2025 01:20:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f62559cb7fsm4313239a12.48.2025.04.21.01.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:20:23 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v6 0/2] firmware: ti_sci: Partial-IO support
Date: Mon, 21 Apr 2025 10:19:58 +0200
Message-Id: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK//BWgC/4WQyU7DMBRFfyXymld5ip1kxX8gFp5CLZqhTmKoq
 vw7zoCoCqLL+xbn3PuuaHDBuwFV2RUFF/3guzYF8ZQhc1TtmwNvU0YUU04wLmDsem9ANYJCr8L
 o1cl3EAUQCpqDoZLVWhnOuUSJ0QdX+8+V//K65eDOU9KM2xFpNTgwXdP4scqiOJAcgiHo1l9lu
 73c7Y1RLXyodzf1MHRTMG5vUBhiRVkyom1RRfmbkmOeBDcb7Hg3IwdGpbWkrom0qooELb2Pfhi
 7cFnfFNlafOuUpP9/JDLAUEsjlteUoiDPWl1OXgd3SKtXeOQ/QErKR0CegMTowiltOZbuD2D+D
 cwxw+IRMF8alowyyyTnit4B53n+Ao18HI4nAgAA
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7595; i=msp@baylibre.com;
 h=from:subject:message-id; bh=6MkfKz38ObeZcfyCkcrYqFfAXaeX4E8lYjZjUkcJ/Tc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzW/9uk3H4ELrsV4jnLxbwhpctv0sXjwgnJj0M+lOdt8
 i/rlrnQUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABMJk2L47yFx7M3l9bUbBa16
 NPi99z5lsc2J+F2tsTPgiePFHdc3WDP89/216P2hmZIXHqgwVHDe1Ht4Y58Vs/iLmKNK09bpmlZ
 EcwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_012025_712521_11B49649 
X-CRM114-Status: GOOD (  23.14  )
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
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.15?ref_type=heads
   https://lore.kernel.org/r/20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com

2. Devicetree series: Defines system states and wakeup sources in the
   devicetree for am62, am62a and am62p.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.15?ref_type=heads
   https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com

3. This series (TI-SCI firmware): Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

These new bindings allow the ti-sci driver to identify devices that can
act as wakeup sources for specific system states like Partial-IO.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.15?ref_type=heads

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

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

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

 drivers/firmware/ti_sci.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 136 insertions(+), 3 deletions(-)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v7
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753
prerequisite-change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da:v1
prerequisite-patch-id: 74d50dae2d453ec9a3e72c89df40e97df2ebed9b
prerequisite-patch-id: b68c32a3053c71bc0c3e301dc0b6b4f54546f789
prerequisite-patch-id: 6fe934ea35357712bb07ada84c157769418704d1
prerequisite-patch-id: 993138fcd8edcedf0d7ba033df7bf9ed3d45d40f
prerequisite-patch-id: e0330ef081affbe91e02b2e9b5a76ebab59e6ea6
prerequisite-patch-id: 864092d43dff594e8be7812a80a3e4a1739ee038
prerequisite-patch-id: b4f982c7015f03acc41285195aff0f3a44b027c2

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


