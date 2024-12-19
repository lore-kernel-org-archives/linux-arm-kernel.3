Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACFAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M9p15xFpI3OtdTaI4RI0VDmNj/jcCe5gDftH03DAkDo=; b=GOBmj7RlidIkYa
	QOK6C1aSm+4lHPRJoXw4GH+JFYdeji4gZxO6G19lvFkrXgpi3SlU6rAK0Zuly++w+75Xwfqn4Vd+V
	l9w5lUO+rkUi3uwKNrygW9RqMlyoXuuOzQrwgbdbbpW+nPZTI6QUvNB4fMbcLC9d1Y89GZ4HxBdDr
	fP1TLGBYgqs5eKY7s2NIR0emrTXM6J1bSxmU4VUr7/VEJIxwitOB3PQUilHtk6wDakqmEAIm3Ghmo
	NX760O5+dCwTtjXdM3amsFcPzNseGKB8p/HwFuWWCU3SLA0nZja4Eg7wzKLLej4nT1xnBlqlA51os
	qVNamQHYgCPrVwCa6BXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMhG-00000002wiF-2fNm;
	Thu, 19 Dec 2024 20:00:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfo-00000002wHO-35xG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso1777267a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638342; x=1735243142; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9p15xFpI3OtdTaI4RI0VDmNj/jcCe5gDftH03DAkDo=;
        b=S5Qmj3QggXAs6daK/LXqJPQUSUxQibUscbWuL5zGFTDbLM6SCGi890dh7wc+Xg6I8k
         KXqwzWhRbG046NJqWbR+c174rapg48MbZViuXnOgKyXDZ+qaqLytZP3sSaZpi0YkXHVC
         o2zj5oHrKozT91AXB2IsyxpLhaYJpPyogIMwcyvEW/jxM8cyOkPEboAeBweff8tbjn5i
         eBeZakGYCbDnsQxV+n7iEx6s1gaIoWyeTXBT0pvXd0cgxCX2rh/dRXmr/cCNI28yoDXK
         d7xPrm6mBux0kMiORfodBDFyaNyV9VgLMESEEynhd/zqkZhUY8hfF/xK0DX2jMW27+2D
         ugbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638342; x=1735243142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9p15xFpI3OtdTaI4RI0VDmNj/jcCe5gDftH03DAkDo=;
        b=VBWOAsAR5jCVrUmCtSCladieAnso39fxqq39hFLGe53enTl/9o/Glg34PCOnnmoxJa
         D8EBmv/FPaPdN7/LCOwYP8H1MUgFgFYxrfOzM2qXMs2Uscfu8em/9jm7IVq6OkbmdYq6
         D6PxG4zBzxt41pGmjiT+Nopb1ypZsygnt1Bpw0lKYOQtERbmHr5bD5uqyRUqslGBdJJX
         VCTi5YvuqsUqmT43wfZNmfVJlIyLd4DG0q2cdP0bqTFbxjauBd4u27YgyGc7AB7u+f5U
         8AeyXthrwf17fPrxqsUgdr3YNrmgsUvb8FGLwwU+5x2oBDKarwHCIomQoLJn2MbKPdjf
         xEOg==
X-Forwarded-Encrypted: i=1; AJvYcCVsW2Bh4azp2jdxHuDwnz2CYJteiUNPi/A+Zr/scnBwOwKJqeTMhn5VGZ4SmsJKme53+ai+XjY7p2GuBbpG9LL6@lists.infradead.org
X-Gm-Message-State: AOJu0YynzQ/1+xJDLpAAadcF3BDlg59Ywe122scO2InObpUSLiyrVGI8
	2QN2S1t2bJy/u8TMiq9wA1LydYT1YoDbMEqIGvVNgQmX1nxlfZW4Tv6Itd3sd6k=
X-Gm-Gg: ASbGncvelpAIeyWvhwHPn1vviPiJwtgFmNbzKz+z1aj+dBFly7WAI2+DBJv9XwOS8oi
	cyxRcbxGqLIwWkcRrttse8vwpEK4lYK4PJKgIuKZQsjJi7dbO3Y7P79dd3N1wc+IQFlGl02plaj
	uItu+zwLP1P2UniNpaP+J2yFfIlEeuLv3djDRwhdLw1MhfmzNYGeLqUJTyeW8KIZ0+OGkKaK7fE
	ec0QTs0gyrfwqaR8svuVorKn2XdD3QmpusP5JcR0dwdBGCc8g==
X-Google-Smtp-Source: AGHT+IGqEgM3Ah4T+Wz8+r13B/J1am5wz00UoQzvYl0b+jCD8bk+TH5XawNEo4BvvQIWkA5//ALkXA==
X-Received: by 2002:a05:6402:4405:b0:5d8:16ea:cfb4 with SMTP id 4fb4d7f45d1cf-5d81dd7d02cmr168237a12.8.1734638342170;
        Thu, 19 Dec 2024 11:59:02 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f900sm948330a12.53.2024.12.19.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:01 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v6 0/7] can: m_can: Add am62 wakeup support
Date: Thu, 19 Dec 2024 20:57:51 +0100
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL96ZGcC/4XOQW7CMBCF4asgrzvIYydOzIp7IBYTeyhWSxzZY
 IpQ7l6DWKCqUpb/LL43d5E5Bc5is7qLxCXkEMca5mMl3JHGT4bgawslVYNSWjjHKTg4ORrhSl9
 8mSDHS3IMxQAq6B16Y63GwfeiIlPiQ/h5Duz2tY8hn2O6PfeKflxfNOISXTRIsF2rXIcNeVTbg
 W7fYUi8dvEkHnpp3sV2UWyqePBUf0buiMw/Yvsmqn5RbKuoNXsnaSCj7B9xnudfhM+X8XMBAAA
 =
X-Change-ID: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5191; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FveGKuE50tvj//BccFVz6uTSoxWvQQAOqunJVHcMagI=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqu6nMKw3LdWZeP4yk9//ndmdPGWVHU77pv8xn3+MO
 +Sk3e26jlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAigfsZ/udl+jY/5sh5OLXp
 SFTS0/6Wz8fmnf4ctnSx/ZQlnh8CVjAyMvw48n1ixt9dv642cT/vZ+UV1/k/yzr14T55ZYE9YeV
 ytkwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115904_789972_4F364A1A 
X-CRM114-Status: GOOD (  23.25  )
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

Series
------
am62, am62a and am62p support Partial-IO, a poweroff SoC state with a
few pin groups being active for wakeup.

To support mcu_mcan0 and mcu_mcan1 wakeup for the mentioned SoCs, the
series introduces a notion of wake-on-lan for m_can. If the user decides
to enable wake-on-lan for a m_can device, the device is set to wakeup
enabled. A 'wakeup' pinctrl state is selected to enable wakeup flags for
the relevant pins. If wake-on-lan is disabled the default pinctrl is
selected.

After feedback from Nishanth and Krzysztof, I moved to a wakeup-source
property that can be a list of powerstates in which the device is wakeup
capable. This describes special cases like Partial-IO where the device
is powered off but pins can be sensible to changes and trigger a wakeup.

It is based on v6.13-rc1.

Partial-IO
----------
This series is part of a bigger topic to support Partial-IO on am62,
am62a and am62p. Partial-IO is a poweroff state in which some pins are
able to wakeup the SoC. In detail MCU m_can and two serial port pins can
trigger the wakeup.
A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

This other series is relevant for the support of Partial-IO:

 - firmware: ti_sci: Partial-IO support
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-partialio/v6.13?ref_type=heads

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.13?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions:
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com

Changes in v6:
 - Rebased to v6.13-rc1
 - After feedback of the other Partial-IO series, I updated this series
   and removed all use of regulator-related patches.
 - wakeup-source is now not only a boolean property but can also be a
   list of power states in which the device is wakeup capable.

Changes in v5:
 - Make the check of wol options nicer to read

Changes in v4:
 - Remove leftover testing code that always returned -EIO in a specific
 - Redesign pincontrol setup to be easier understandable and less nested
 - Fix missing parantheses around wol_enable expression
 - Remove | from binding description

Changes in v3:
 - Rebase to v6.12-rc1
 - Change 'wakeup-source' to only 'true'
 - Simplify m_can_set_wol by returning early on error
 - Add vio-suuply binding and handling of this optional property.
   vio-supply is used to reflect the SoC architecture and which power
   line powers the m_can unit. This is important as some units are
   powered in special low power modes.

Changes in v2:
 - Rebase to v6.11-rc1
 - Squash these two patches for the binding into one:
   dt-bindings: can: m_can: Add wakeup-source property
   dt-bindings: can: m_can: Add wakeup pinctrl state
 - Add error handling to multiple patches of the m_can driver
 - Add error handling in m_can_class_allocate_dev(). This also required
   to add a new patch to return error pointers from
   m_can_class_allocate_dev().

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (6):
      dt-bindings: can: m_can: Add wakeup properties
      can: m_can: Map WoL to device_set_wakeup_enable
      can: m_can: Return ERR_PTR on error in allocation
      can: m_can: Support pinctrl wakeup state
      arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as wakeup-source
      arm64: dts: ti: k3-am62a-mcu: Mark mcu_mcan0/1 as wakeup-source

Vibhore Vardhan (1):
      arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as wakeup-source

 .../devicetree/bindings/net/can/bosch,m_can.yaml   |  27 +++++
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi            |   2 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi           |   2 +
 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |   2 +
 drivers/net/can/m_can/m_can.c                      | 111 ++++++++++++++++++++-
 drivers/net/can/m_can/m_can.h                      |   4 +
 drivers/net/can/m_can/m_can_pci.c                  |   4 +-
 drivers/net/can/m_can/m_can_platform.c             |   4 +-
 drivers/net/can/m_can/tcan4x5x-core.c              |   4 +-
 9 files changed, 151 insertions(+), 9 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


