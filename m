Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03778FC72D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=59UatZnPQebxpPUbaoejPsCGSwwdZSX5Yt2Ab7MbFgE=; b=Q6drXNldTUU39P
	oMwS2wT8cRjAE1tExX+bFJ7yZcFTPHM+VczPWfbofpeKFirNN028lRCYzXXw4FH1hrZtmkS8hK9jV
	4t3PXVTR5Q/n95sacOHMqt+WYFRTSCBdpa/Y+pS89nNUTz8uVeg2BIa6/DKVGRVjvTzwcyRpNNDs+
	emuUS4PNxGN0wdCY107M51nGoyke12aTOVW8t6abCGXTi/JnzfeRzhVZARXfOOvS1bH/5Y16izXgu
	IMHEfrxON8pj1YIIO2iZZK4vHgfl5gK9O8VSaArrbYOhzjkR5cmOsAUO5Vou3AqgXwJBjcdC0Pv0r
	852GchR6zhXKn0zbrGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4edB-0000000GiL5-1oz6;
	Mon, 23 Mar 2026 12:43:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ed8-0000000GiKf-3Xfh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:43:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b05761bec1so23237195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774269817; x=1774874617; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59UatZnPQebxpPUbaoejPsCGSwwdZSX5Yt2Ab7MbFgE=;
        b=I50tAsVqIpv6nlvtg9YDl/RzOkJq+oTha+nZ1NnGM02SHoTih0M4Z48Li3WVs85cYr
         705BTLVhnN2y6Js0RlbkxaGOkVWnSh8eBdzjR6cYZY31cu23YCjjUdwg6qla4aCxxVG6
         vQFpY5Gyn+T5edjOhBanQJYNV0J+fXZDsSvVmNM56TSNUu8Qp4fCcayeQOuKZsgF9kOG
         CWySm/eV5LWNOAPegPWoSGDsWPbZUeBSU7/5i1VYNUzUrH/97S7pawqihvkTN9SMU8Pz
         2d/BNgRAQH+Sd8Q6loXVq+ODU8erZadoVpuy+6SNOSakr1dgYUmxhLNg1p/7oejOW29H
         +g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269817; x=1774874617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59UatZnPQebxpPUbaoejPsCGSwwdZSX5Yt2Ab7MbFgE=;
        b=iYQaiw+pfZH7gd6bwmyJmACsCqEeJa5EACmXNRPlonwVvAUxjDt8zZTnGlFBxSnbAA
         G9leUVSXGLPTv0iokIxie2JFt8wYieJZwh96vn+8boh3rKI0jVJAYoA03ocJ8o0wRNGu
         f7fJQH/h2V73qkP7WQeiUcQZYteIqWIb1JSgPxVr1MChF+cRH9y1uU32QF1Z/v/+aHsP
         3zXwWn3Wsr2WSoFJFi+cIKvW18C0BHwvsDXOUiC5F/slvv+ndoMmSOiTG/mt0mtWhDux
         cQhkxYohDr3NX+uoqxuDqTzBkoehUPUMO6DVkfSc4hJLm5i9ia0nB76HFd1xL1qTjArI
         mCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOYGD5B8xw3/fFL27ACi3faBUZnGtCHtJ2BHW0vYeQYuQjrECP2IaM0795iWzIjpuSNiKMe1peZKblY4HfbfUH@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpsW1wksOujuy3ClbuyiYcVKPbC0v3s84jZ/JSup6lURepH/g
	Qfb/N6H38a/CfAYjlnDPUKpz8P0AYqpY5/ZG4NvaJmvwoYmX3bL/cI7+
X-Gm-Gg: ATEYQzz1+loplEZDXPtszrM9oFrYKGeWKXQYlxgxIJWDwvU7CSIJOkdBIuQLVi7Jp1P
	WbczpnHwow68zXoPqLk3LK9g92sqQwnZ0XEvm3TNTwAnAZQLf4bTPjDxbc38KskY+NADU1t+1FJ
	rjMR5y9nY/5VEzr/791B4o39FufOMODUVfg7bh9rRuo9LBlyfP9nmIpLuADjNpip4wFqJZrdI6Z
	0gTApWXH4mB+tJBOut1AaAQBrCn6VZo0bJbYP711+09JVIXk2ovHyPmooRqqsVcQaREjYSaO3ih
	LoHyn0RTUOpwHR0exVMR0pJcWe05ng3HOhJmsMCSnARpPxftenzTJrmKcnJl1WhFtI6TPfI4cV2
	XOZWnCCms/OxE/3Qsu8i/b3fz+KgCWbZZXJ9fa0+vsKxo6oIH6yRUs0pRSKxKhlR1S9i7W2TXmU
	lANj3tvByYzCM1BHjw8ZhBJiLykPj/1gxGR994sGzS+hCeLf0qrQPfK0naCiuu4kPEmLDhCOaj7
	DU=
X-Received: by 2002:a17:902:d2c9:b0:2b0:52dc:f1c1 with SMTP id d9443c01a7336-2b0827bd48fmr106900625ad.16.1774269817485;
        Mon, 23 Mar 2026 05:43:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm103668865ad.13.2026.03.23.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:43:37 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Date: Mon, 23 Mar 2026 20:41:04 +0800
Message-Id: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOA0wWkC/33NSwqDMBCA4atI1k1JMj5iV71HKZJXdaDGYqy0i
 HdvdFMp0s3APzDfTCS4Hl0gp2QivRsxYOdjpIeEmEb52lG0sYlgImdx0KB8i/XT3Sv0OFR2CLQ
 ojdUAJmM2I/Hw0bsbvlb0co3dYBi6/r3+GPmy/cuNnDJqGBOgXMplWZ7rVuH9aLqWLNwotgTsE
 iISucpyKQwIDfKXgC8BnO8SEAmhU8uVLpRUfEvM8/wB/+8a1joBAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774269813; l=2647;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=e+YdCl+fCYreU47gtwqy03Jl+PvxUX7nHi35h7gNzJc=;
 b=uHObNyONEAf4p/vGAYVGeay41iAESMvQI/0AI6Npa6OHdAZhzJWkQMMQke82nm6dZZJNgBsuq
 B9JfrHwOxFEDLzeDMzB3p1Tl/B4l8QHXe36n7cCPbi2Y4P6l2KtkU8c
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_054338_892367_8FAF08F7 
X-CRM114-Status: GOOD (  12.03  )
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

Add Linux device tree entries for Meta (Facebook) SanMiguel specific
devices connected to the AST2620 BMC SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v4:
- Include openbmc-flash-layout-128-alt.dtsi in flash1.
- Rearrange the DTS nodes and properties alphabetically.
- Disable the internal pull-down resistors for below GPIO pins
  - GPIOM4, GPIOM5, GPIOV4, GPIOV7
- Adjust GPIO liname
  - Move `PCB_TEMP_ALERT-I` (GPIOV5 --> GPIOV4)
  - Add `HSC4_S5_OR_S0_N-O` (pdb_ioexp_20, p12)
- Link to v3: https://lore.kernel.org/r/20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com

Changes in v3:
- Update the model name to "Facebook SanMiguel BMC".
- Remove CP2112 and downstream IOEXP nodes as the upstream driver
  is not yet available.
- Remove the following EEPROM nodes until the bus numbers and
  addresses are confirmed:
  - 3-0051: HMC FRU EEPROM
  - 3-0052: HPM0 FRU EEPROM
  - 3-0053: HPM1 FRU EEPROM
- Change the compatible property of the following EEPROM nodes
  from 24c02 to 24c128:
  - 5-0050: SMM FRU EEPROM
  - 9-0050: PDB FRU EEPROM
  - 13-0055: SMM EXT FRU EEPROM
- Fix the smm_temp node address typo (0x4e -> 0x48).
- Remove nodes that no longer exist in the latest board design:
  - 19-006f: RTC (nct3018y)
  - 9-0075: IO expander (pca9555)
- Update linenames to match the reference design:
  - B0_M0_AIC_USB_EN-O -> B0_M0_CPU_L0_RST_IND_L-O
  - B0_M0_BRD_ID_2-I -> B0_M0_BMC_TO_GPU_MCU_I2C_EN-O
  - B1_M0_AIC_USB_EN-O -> B1_M0_CPU_L0_RST_IND_L-O
  - B1_M0_BRD_ID_2-I -> B1_M0_BMC_TO_GPU_MCU_I2C_EN-O
  - IOX_GPIO_P16_TP -> USB2_BMC_HUB2_RST_L-O
  - I2C_PDB_ALERT_L-I -> X86_TPM_RST_SEL_L-O
- Remove unexpected or unsupported properties from SSIF and IOEXP
  nodes.
- Change all status values from "ok" to "okay" for consistency.
- Link to v2: https://lore.kernel.org/r/20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com

Changes in v2:
- change mac0 phy-mode to rgmii-id
- remove max-speed attribute from mac0
- Link to v1: https://lore.kernel.org/r/20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 668 +++++++++++++++++++++
 3 files changed, 670 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260202-sanmiguel_init_dts-79cdb33c50d5

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


