Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6F9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j8qJ55ToF3jTe+9KsGyg1OHhc22gynF+LRW6Ku4tCvk=; b=FuGHnmoX5C+J+i
	/UCnUBjtnu8OqjWPXkwrBIZZV0OZPJV7FIW7ie361WIiDVSkrmXLReq36CLTboLrfJgrbw1f0tFCx
	zHfqNQpiIHqRBVt/m362WUDPGhC0amqTSS8BRNAkBkx81CB3GQfelFSUKNLFGdei3F+WwcoBt0pGm
	LJ1yqqhCLVZ163feU1yDTelO0HqnkhZhilER6xbuSovJNwz57o1kwIZrydKfGLZsDvl+C9hG1s7Jw
	EDoNX7Jb+uhEZAf8IOIyxMPXRKSAOUWCjwdrUiOqS7ROqGxkdjR4nNUlWR74BhC9b836n21r+og4q
	kAmTuL1QfJbEHY68f9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mSm-00000003tn5-1Z6k;
	Mon, 21 Apr 2025 08:25:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJE-00000003sAL-125k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso5699682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223318; x=1745828118; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8qJ55ToF3jTe+9KsGyg1OHhc22gynF+LRW6Ku4tCvk=;
        b=SRBI09Eo2lHXZpd+cTs0/d3m6bMSQ4FNFN+/TxphKDi5mUAMNxHtbl+f2ENHIZWyfE
         7lh0YemMagnq52RXDxZvZh5B3HHoT25q5Cmnpz1TtnbAGtatJVvixMPIoo7ZhCWCPIe7
         +9MZ1skGzgB2Y1Y5gvlFLmEJzzhSYkWBFguihjxWi2WZhkHM8vuuOtTPsZaD0+LV6aAy
         B40+tWxWgtnVfJ4f0c6+27Cqv0KXC2Y25BTFXOvMNxZ29QYSN7aEoerS6P/8fCSbJVUo
         AxVvhH0bMBYe0U/JnFkmb/PbAcHrGxwigMeBRTeVVbHL9/ED26eGFc+l/9lTnJ5vMozF
         jlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223318; x=1745828118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8qJ55ToF3jTe+9KsGyg1OHhc22gynF+LRW6Ku4tCvk=;
        b=JJvEpFEDNWpi9LvpflfpDe6o78xfUxEY3n00i6CViOHvQEpD4CmgNl0PStoKvfHZii
         eN/Gea6fU81YUj5VEEKn6A98PnobYEBYXFmDaorudJ98oMw7strfikKQnpvLKQPX7Lij
         UJnlWlnQB8UFfC4dZ2nalmunlgeqfrKjW6g+UyGzC7suUY2pzo4I3N3itc6CRAmGkByW
         +wyrq9Ly0SuHyqF2szvCF+hBhQrsl/hYSmS3PhB3+QGxWOfaf8BNIixw4C+BM26zla40
         o8jfWexf1PKg9I0TtaNlMbJrEwnJ7gWvCY56Xo/HSt3tvhv6v4t/L8i89QkH/otMiYS1
         k0DA==
X-Gm-Message-State: AOJu0Yz1cI8INVorMdNFVgdOAyvKPOKNL5louEoyGmFwv1b6z9tssZHI
	FdtdMDV7yXbEwvS03cWpOkhId9iBdOfsxW0iTmBXkQvYCAQhY2n/Nw5uAQsMWOg=
X-Gm-Gg: ASbGnct5RqtLtywRW/zShgGQt53/dWVtFYZTHjrooZUlB1RUxrAMUDRGjjSab0omof0
	Os9CeZ9TfV/BMcliB5V0SENQtmu0msTqOp3PuI+dw2EpXQG4RPcPT2oDCHkQ2ajFeO/uswg0ksh
	D/HXNF8a52pNyn9MPaBI7NjHEYtHZVAU/yvfipYXW7YglHj44KeCQalp/pDDzmq2m3EPZupBAw9
	M0sBpLtq5ehEXfYcNAKDx+jHVD1m08dJfZvvvzkkQ/MIBxyTQj2k7+i2sZ08uptqlQhgciabSQA
	npp2qiRD7uPEszKff8x1qd0HOTAGZ+qLmG5zt01FjiTlkQ==
X-Google-Smtp-Source: AGHT+IHl9ajmtuDkj5s00oPoVojYOBkZKIewBG+zW2Dai7berQhTSgtIulOKXTkdhuk7U3TNOYhilQ==
X-Received: by 2002:a05:6402:50c8:b0:5e6:4ee9:f043 with SMTP id 4fb4d7f45d1cf-5f628603c66mr7983837a12.26.1745223318219;
        Mon, 21 Apr 2025 01:15:18 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f625a3e4bbsm4216959a12.72.2025.04.21.01.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:17 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/7] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Mon, 21 Apr 2025 10:14:18 +0200
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr+BWgC/02Nyw6CMBBFf4XM2jG0vIRfMSxKO+hEodgWNCH8u
 w24cHnuTc5ZwZNj8tAkKzha2LMdI4hTAvquxhshm8ggU1mkuSgw2Ik1qqGUaAJOygVWT7a4lBj
 fTFbGiL4XlVEQHZOjnj+7/9oe7Og1x0w4RuiUJ9R2GDg0yVKeo8RpAf/9Jon1XKRp/asPWo34V
 g+aJ/R2dpr2vMSLFqas60x05tIsFbTb9gUlg9dq4gAAAA==
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
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509; i=msp@baylibre.com;
 h=from:subject:message-id; bh=wh2ZvJ0MpzyvSvb/71rDMCsRepQ7ZRPMAExEDL7P2Y0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf+mHHmf8eNTUFh8i8uPM59+GinUpOuw9eteZzoS/v
 S34TbKio5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZi+47hn/G249KnvmYE1vk8
 E1aadJbRY9re+3O+3rV+f0778CkrtqsM/6y/W3QIpuz9tlAg76ntCxUxh/a9ryuTuJc0iF2QVHJ
 4ywEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011520_292905_688D3159 
X-CRM114-Status: GOOD (  12.98  )
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

This series adds devicetree changes needed for Partial-IO support
on TI am62, am62a, and am62p SoCs. It defines system states for various
low power modes and configures the wakeup-sources for devices in the CANUART
group. Depending on the SoC and board details, some low power modes may not
be available, so the wakeup-sources are described in the board files.
The series also adds the necessary pinctrl settings required for proper
wakeup functionality.

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

2. This series (devicetree): Defines system states and wakeup sources in the
    devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter Partial-IO
    mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.15?ref_type=heads

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

These new bindings allow us to define the system states and reference them
from device wakeup-source properties.

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

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (7):
      arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 +++++++++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 76 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 76 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h      |  2 +
 7 files changed, 290 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v7
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


