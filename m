Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5634CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ySdZbsfQoA3Pydck58t1awyRQGkCymKZ+NC9Ymw8JnE=; b=pNtuWc3ZuEycg+
	tzRX+TuOB4W9nUEc85CmXRVK06E1UjC8oLJW/o+x9t3mqDZSM2QM30IiVVNDEhSQQJblhMptRw/sC
	KJ+2ohtzRLEqNAKx/bVuP4TIRNbGck/AtKEGFpB0/G0Rn5Q/7pmwWFCokbBIL4qKAFVZhtatuhFhN
	DMK2D1qPP8mJUS00n6i/wwvjnIngqoWJsQY8GKD7N5l6zQhPiSnaQo7hgO6xCotF43Bqmj/ya5+Iw
	4JEQe1PahAly7VfkAT1izWTmy9mq56DAR1tjGk6wfbVpBjyn8R+eQOHfrdJzPQy3Y/OPjgijU53k1
	l0CXxPbyN3H336m7o2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttW-00000009qXP-3IIm;
	Mon, 03 Nov 2025 12:42:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttT-00000009qVc-3lbi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:42:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso7574994a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173762; x=1762778562; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySdZbsfQoA3Pydck58t1awyRQGkCymKZ+NC9Ymw8JnE=;
        b=mAzFg7/fuSmNOT/1heERXCYANBlILL8jSVb1o7TrMkdQu7GKsphU7xNB0kC81xMfRV
         ONVVu5MbtCYYV1MWTKvhMVpQ5ZgL7Z5eI6WuXHw84Ug8E3qHORO4uPwUMM/RIJO2OglB
         pFLTXFJFZH098CRenrY8VHJfQ3VUz6067UFADkSH6hSLkaVYvJGdsShwBFvEXgFpbgPH
         2REHd/rhFwf7GNUQzRcBR0U65r7BhIoODVU5CDIvx3KipZ2NCCsRR1dBPFQRVXifZwYF
         XskETittqpe/XWEEbFpv/I+g8NMJyM4XmYq8QKCaDDPKGx1hCsmphHoyHow/8OkmUJ4O
         4EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173762; x=1762778562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySdZbsfQoA3Pydck58t1awyRQGkCymKZ+NC9Ymw8JnE=;
        b=uiKbY+ThZxBqlDWci5DuSyZRsbkP2MHTd0nmV9KGe3MIFAo4S5NBkP/0KLjZpCLGT1
         /JonOULGZKWmlQIQWQHzOoaJtZdd+/+mI2ihC+J4hEjdO8TkQKX0o7HJPgCb5etthaVn
         5dXWsShOiWYyyhvCxbNv7JvRSDse4BlQzpWfbJsT9fDV2mNQKi6bb69jCk+Z9SvqbmjS
         A9QviMrll8cNYieIvqZ0oz2uIfvHjKaGnqH4m1AxfJSH+8uaACBRW+eIbuNQo2ACvJDo
         2rb6h0HZ/77VFssxgKrgS3AwlXnUfK81BpL0ihOWkrnHsMcb3BHQfB264z19w6MTetAV
         jFVw==
X-Forwarded-Encrypted: i=1; AJvYcCVN5MxPpFaTp8I+NdoC2GI907DPGgJHN4MWzp+EUoNi97obSIxN3GOeLM5UDGDuKIjNFjjO4dwbQnEUKp+xEKvY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8+Xs6g+nv4LKqMOKbrFqctbNJPeO2BjNypxsy4pkDSZ2IFT1
	oPBrFElMn19tZbT16yUU+dfHmGiBEiIqUSsrgH+AbIgo/H+tLn2pFWQrWSC+u+QxRY4=
X-Gm-Gg: ASbGncsS+YDeh+7MLulQO5l3RSZgFkDYTUAf0tUR4+vNNRKmTpv5qYrMZPwNUKSMQ4a
	WYCaJiuhcxh20MzXswrvkueHRLEcEYH87tnh5QG710PCu3qfEiW0zFInIcIs5vVt2/nT6dik+b8
	emEufvO4bW96OjGBiSnTr890vyD3sjtj6WScgFNvU9Km0T3399X8468K+J5k2oULqzjTU5C17Vt
	KD7RpGJNK3c7knnz8/J8hBtE3HV46zsUCmwn8btEU1iEv42pu+VRR5NAP/tCkhGEzVt2cdMABjP
	BS2wM/18Wsmrmb7+QhfeWWXDkAtCBCbPfjaGC2H6p5+4bJ1Cuaguy8CFZR+wVaVp3GO6YygA/lx
	RuRZcNu0BVAy3uxiy4Ispkakycm1Ak71t8YmD4Vel8LxIrmWakjLqrzzxoJwRV6nxTJXyVJxvR2
	LqjnYPvA==
X-Google-Smtp-Source: AGHT+IH7gnDUVPLdyweD2s8+ECeaCpX5murw+DO/g9xiCSZKO8V3qVwx15d1k0QmIznWlNpzSJCtaw==
X-Received: by 2002:a05:6402:5111:b0:63e:2d4d:5a60 with SMTP id 4fb4d7f45d1cf-64076f67066mr11004356a12.8.1762173761943;
        Mon, 03 Nov 2025 04:42:41 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-640d50199e1sm930448a12.35.2025.11.03.04.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:42:41 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v10 0/3] firmware: ti_sci: Partial-IO support
Date: Mon, 03 Nov 2025 13:42:18 +0100
Message-Id: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqjCGkC/4XSTWrDMBAF4KsErasyo39l1XuULiRZbgRJ7MquS
 Qi5eycObUox9XIG5nsPoQsbci15YNvNhdU8laF0RxoQnjYs7cLxPfPS0IIJEAoBHB+7viQeDkb
 wPtSxhH3p+GQ4Ch4VT8LKNoaklLKMjL7mtpzmgNe3+1zzxyfljPcli2HIPHWHQxm3m2M+jZyiN
 ILw7HawK8PY1fNccJLzxb0K5f1fZZIceGuTuXXyxuFLDOd9iTU/U9yMT+oBCvRroCIQU3Q5xEa
 BzQug/gY1SDBroL419FLIRlqlglgAzQNUAtdAQ6CMOuU2RJTSL4D2Abr1N7QEhoTgjE6icXYBd
 D8g/Y/Vho5Aa4JVwoBGhAXQ/wIlrIGeQLCq1brxCU38A16v1y+Rty/n5QIAAA==
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7486; i=msp@baylibre.com;
 h=from:subject:message-id; bh=tUy+XzWKsgLSae03b5aT8r2DQygS0809yUu4YJxMeqk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyOxdqVAv/Lig/Hit+S21K5/d3ayoMJUq9X6Fb7fuN4c
 Gimk1VnRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExk02yGfwafs+Xbz0Uc/uL7
 896SiIyj59XW7q44mvb36qrzN+Njn/9lZPg5SfC8d+qT092ragJvSf3V+GWt9K8mznOLg9eHO2Y
 fGJkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044244_011517_0EDC541F 
X-CRM114-Status: GOOD (  24.56  )
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
   https://lore.kernel.org/r/20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com

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
 v9: https://lore.kernel.org/r/20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

Changes in v10:
 - Remove unnecessary empty line
 - Make ti_sci_cmd_prepare_sleep aware of PARTIAL_IO mode and the
   not-expected response, because both Kendall and Andrew seem to
   prefer this.
 - Moved the removal of the ctx_lo, ctx_hi and debug_flags to the end of
   the series so merging is optional.

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
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support
      firmware: ti_sci: Remove constant 0 function arguments

 drivers/firmware/ti_sci.c | 131 +++++++++++++++++++++++++++++++++++++++-------
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 117 insertions(+), 19 deletions(-)
---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


