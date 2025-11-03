Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C59CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFwPuzbH1s93pLflRrR41MiQVaCaS99/J+bBqrl60ng=; b=NZJTtFja+9ltM8
	VMvvwhZAAwe2h9XMUIibXmMhoU6xMrGASiSN67PSsxSXrxtpIVOeQvncwK6ngHI5cjlKMCh1cyd/M
	04VOESxV9jzyKpaauMGcHZP+KwC637lk463+G5e01U+bc6OK3pV7PIQU3wL3+8SoF6UCsA7OisCTW
	Nbvy1ozKAXZZ6yvaALBjGIJAJ6tCT4vFsMm3578G0ytEUFvgRKYzTuaWP8vwON8Wx/+QtMi+8aFYy
	woHtmfLTbcP4RiVVDrK1CSmU6W2lYwUKa5UXJdFFvN6fVOnbBFNS9gp9DGJjqG9g/hchrpRiMePhd
	xCAGrm/g2SN8pug2AoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr6-00000009plS-1icn;
	Mon, 03 Nov 2025 12:40:16 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr2-00000009pkK-3zui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b70fb7b531cso119652766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173611; x=1762778411; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFwPuzbH1s93pLflRrR41MiQVaCaS99/J+bBqrl60ng=;
        b=EhdHgCQWOI3UmwasJx2kL2TK2ebUr9qTzQ7DRrxHtvFK04kdiuqe3WoGovv+IKFTyP
         F0Vz4VuSbb/qpz9jgGQc2+78xc0u+6PLJ2vYvRbrYQ57VlaGzt4v6VfGEUGxt7bEmMlp
         89pto4eBI1JoqEsr7Rj1Exi22s+eHCTsHlPWBXwSe53Y20ESSCn3stboVbbobGkdqNO/
         Ae1of0KSn3mkAm0WiYoo4O5zaEytsHoLMaQnqKXWLCE7ie47JfP+LddgQkk0SDTtBV3k
         I5tWUbhbS8Nxa+NhKQnPatL+XlYxKRFCqxWNFVbykiUFAsy/qBsiBr/3F2S3W9AB8aBV
         W+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173611; x=1762778411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFwPuzbH1s93pLflRrR41MiQVaCaS99/J+bBqrl60ng=;
        b=vFEnuhr8Pf7yaCrvDiZC18/BS+rc6SG6xNeKAnRf5wDE0qjB6sMyWyNR8Yf4htQViL
         dbn3/TF3ZT2/9jyg0L0w+lJa4qPLcZ37E9NeFxc2qizcEbKL6tMs7CJ7EMgctcnsb5oi
         VDsLm+Uu2TtP95OzwTQp/UkvFcFqm8Qi6CCfNapZPF+IexSzPn14wHzFPzlhcHOb/V6s
         UmEEFpRZytm0ALh/m8kzHdNexPMjMeoisRX7sS2FubOA8Bf/dAnn8JPmcjwMEpZtnQk3
         fhl2BbwnGJO24xMNPYDfE39IS5iO7Tbq8qKC0WfKJGnt9YvPT4K+T/gkREsfzdGz9EZ1
         DnaA==
X-Gm-Message-State: AOJu0YzYv9aR+wMuKugEMkE4ngQro+4/XIe+UgGBYfWJOsNWiw2St4GP
	BbhTdtDRkL9ibUPkNsdrc0V/fR7PoncTe2YdCIIBm5jkA0pfGxnC6ZtxUXFwX8q9doM=
X-Gm-Gg: ASbGncuREyoWis/NN7z/OGqVR3c93oWw0cp+hc7kZ7ZinCGxTclFs0vXSi+G4o8r4Hw
	PIHQdDYnNhpooceiI2hh3IXkqz4P3AJ/2Gk/suWU2jxHFBb92r3BU5Kl5HXxV5ow7FhyPBLWGxu
	mQGQJdSccST6bY9vUCSUYqyKbz2rdkqf/f9DUyx+fE/XyyF3euhMbu4Abt9yM+MLtgnnKzxLiiC
	xEEwJJQsMLhRSnNvNSMlDu/CC6+7tUebPj6li/S5rI7dW8PzNK+LuKGuyND1ILd2/ISNTYH9/8z
	+6xLiUTsaeWosTkxfPwzZAXIju8jmHnJ7U4weZv0QQATC3QijPomYgRsbFxPnxTQO0kD2sTxbPB
	OENcrwXATR3fBa+58n3CXi0uYwNTEYVcYjYJp2G+FpWYFJKgoH+Ou6iEyQMk8h8+CF4Rthb0=
X-Google-Smtp-Source: AGHT+IGYfHhpn3clxE/PmkQiB0h63Xks1aNEnVKSS2/kPtdzO/izb0gVnG8+wVkOiRhQtBvVp2xvGA==
X-Received: by 2002:a17:907:9451:b0:b6d:76a9:e7de with SMTP id a640c23a62f3a-b70700d36fdmr1287002866b.8.1762173610962;
        Mon, 03 Nov 2025 04:40:10 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7077d065fesm1030502666b.72.2025.11.03.04.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:10 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v5 0/6] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Mon, 03 Nov 2025 13:39:27 +0100
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+iCGkC/4XPTWrDMBAF4KsYrasyGll2klXvUboYS6NGEP9EV
 k1C8N0r29CWEvDyScw3bx5i5Bh4FKfiISJPYQx9l4N5KYQ9U/fJMricBQIaKJWRqR+CldRWKF2
 SA8UU6BJ6OVUy/2qsnVPeq9qRyMYQ2Yfb6r9/bDny9SuvSdujaGhkafu2DelUdHxLclmlAI9iG
 TiHMfXxvvab1DqxVUG1U2VSEmRl2Wkg8s41bw3dL6GJ/JrXrfiEv+BB4R6IGUSjDeqqJCD7BNQ
 /oALYbagzWMPReMZKs+UnYPkH1LAHlsvJjUFwng7mqP6B8zx/Axoy7ubxAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4843; i=msp@baylibre.com;
 h=from:subject:message-id; bh=yh1eX/W5XH5j1wEtGCbFayViCUcpxe1uVu+jHw3omxI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORY1BT298qOYRrrY9sH/7ptkazfdKbdY+klzM+Hmb5
 zlz/86QjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIRxgjQ5vu3+rNDLyyC+Id
 MlhcWN4G2i28Ez0j4ki/c9oezrSlsxkZLrsbBVl4ajM2x/IfO/tplVHipIdatSVb6tjC3hkuOja
 PGwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044013_282027_8D642923 
X-CRM114-Status: GOOD (  14.32  )
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

1. [MERGED] m_can driver series: Implements device-specific wakeup
   functionality for m_can devices, allowing them to be set as wakeup
   sources. This is available in linux-next now.
    https://lore.kernel.org/r/20251001-topic-mcan-wakeup-source-v6-12-v10-0-4ab508ac5d1e@baylibre.com

2. This series (devicetree): Defines system states and wakeup sources in
   the devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.18?ref_type=heads

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

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - Link to v4: https://lore.kernel.org/r/20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com
 - Link to v3: https://lore.kernel.org/r/20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com
 - Link to v2: https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com
 - Link to v1: https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Changes in v5:
 - Disable mcu_mcan* on am62a-sk and am62p-sk by default.

Changes in v4:
 - Rebase to next-20251029

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
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 +++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 69 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 +++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 69 ++++++++++++++++++++++++++++++++
 6 files changed, 274 insertions(+)
---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


