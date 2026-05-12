Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF3CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bw7yD9Z23DvEiMo8d6kpF8dSdIAQpco59RabySZ7QjA=; b=RvZ+2trrm07htN5FxmHg9fA9w4
	InCUf4WIWCpa+OBas2ROcsD8VDRY+j97wOLlflKL+wNqMO2sj3LWBK39RDV6R6T+pt8HoAccd6ZFx
	YiqEBCE5agdIPl5Q5F7f4+h+889S7ZnR1ELBnA6u1kprN1LqjGZzLNr1qA5ZvRpmHsO/a9Gsdhz8P
	cs8K41hCv20yCmAUYj0tk9DKX/dORmsEWlaFrhbb9li8DaqeCQSPQRY/OKovQ6h0q7zijhrFo144o
	g/wrlkCO91a/vPAK//o3G9UpSCCABsqRDIgpTtbLANGV3EgGUnntqsw2DvyMB8Ays+9etXfkvScaR
	DkyCCNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFX-0000000Hb7K-1hY7;
	Tue, 12 May 2026 17:50:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFV-0000000Hb6Z-2PFZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:50:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso4659959b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608228; x=1779213028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw7yD9Z23DvEiMo8d6kpF8dSdIAQpco59RabySZ7QjA=;
        b=J0KsI4hum149mUcgyFJhpyCW1TtmVEwQcZZcJ43Qmlr7fIfpm1S4n7MfbU/wT+CvQ9
         bNIrnlUXKbz2jbcjGGanUI85icNSe4Vtse8DGt746hqmZR+JvidBclCtHHMB9aLEAnSc
         4kVbZqpoeiZcGRfSGaOWn/6EtEvIMwrh3mdVXamLTj7HN2B+L27y4jVg+M7ukkEFeEnX
         AGAY9P5Gf29q+UFj3vUqjCWmltomg1QeIDeQGdlecl9pimNNtew62hDBSgB+snBx2usS
         4ZSCcuk90S+ivOoyXXtMYVHCyuEgf2fKmhSA4IL8mQeC2RJIX4VPfUICTLJcLZWTp+iM
         vgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608228; x=1779213028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw7yD9Z23DvEiMo8d6kpF8dSdIAQpco59RabySZ7QjA=;
        b=UQBdaqJWhkob1Ty+vCe9q8jhua19F0c6OyBRm1HslhiGMHpHH4qPZEZtGjKAjzPPVa
         P93mopzWXtxW3jSTo67tSH1oydqoUbX289tb24jefqtGlhzFvpW0+OUUuZtl9QSi0XEJ
         h9BKjQDXJrFyn6rJYe8i/ucErez5Qnw5TU8TGaaSHLaUWhzilv9z8ynG0CnMA2c/rHtf
         BazH3l77xgAs1WpMW+nVwhD7By7KzBmY+Miw1emZsDkJJuj1DQgH2nV5S5y63WVA/avR
         r985cIHky9iH0o6ThO6mAzWchL1tVjl5YIS+Hcep0+PQa8GDU2HO93MOHQT4h17xRFdy
         Vo7w==
X-Forwarded-Encrypted: i=1; AFNElJ8mBa0Hi+a+YVZuOmHG2GvM1FUSkPD073agNTLhhYSHDY+yjLZ32yLrjyPmtj/wAQsFFw3ak9JjnqCRHgrmksG7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Hsbf4QvTyBmAR80o+uEvkV/aQntZLoKml8Eiw0Wl3dHItWvL
	VZTjJqnOjPWHfPP3ble6xUsQg5Em2DW+bm2aVxD51ALzjwXvCV2QvX1N
X-Gm-Gg: Acq92OFBhw7YiYhkc0BzM+FgSVIHYwqruN9fq8pKFK+5PKGAPvHzPObF5+DbZFp2jNH
	UeiFIBdnWsQs054oGgmAtwJHJFtIVyOTe/ERsEAxMdex4B23Q6OjkHdvWdoB6axiZ88qinhQMq0
	Z1Sp9x1etwBfgqyn1RY8+yU+fjURh0bXdwBzMQ6s+tcswBvw02QhjgPSTUkF2rbcxdtqJpijjDD
	eIS1D8tDlsW4O1p7H0of4llBluYtCZQ07QTiAMQbjs6XSy2xPAvx5HyIPA/oSqmHql+BdWJO0Su
	OHMgth+SgXBWicIANkkZ1NeBzyV7OBP0V9YEkjweYHhEaMyaA95EhlDRtxPXSkjN1yNz9IeKb52
	hBxvSvrGWe0Bfcv4HQUDoC/CC7LkLs4PMr3HweiLltDPwZ1iATD/NWgKJR1/04Jvoo8SCTmqbiE
	86ZnGxLN3gXuavLNmbp0cB/w7Pe5FpHWS7/DdIM9cb
X-Received: by 2002:a05:6a00:410a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83e3b7b53d2mr14261430b3a.40.1778608228291;
        Tue, 12 May 2026 10:50:28 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:28 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U support
Date: Tue, 12 May 2026 23:20:17 +0530
Message-ID: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_105029_612500_CE24B908 
X-CRM114-Status: GOOD (  10.97  )
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

This series adds initial device tree support for the ASRock Rack
B650D4U BMC, which is based on the ASPEED AST2600 SoC.

The B650D4U is a server motherboard for AMD Ryzen processors. Hardware
details were extracted via reverse engineering of vendor firmware.

Hardware features included:
 - UART5 Console
 - MAC0 (RGMII) for dedicated management LAN
 - I2C7 for FRU EEPROM
 - FMC/SPI 64MB Flash layout

Validation:
Logic has been verified against the AST2600 v1.5 datasheet. The DTS 
successfully compiles and was tested using QEMU (ast2600-evb) to verify 
serial console output and board identification. 

QEMU Boot Log Snippet:
---
[    0.000000] OF: fdt: Machine model: ASRock Rack B650D4U BMC
[    1.085143] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 31) is a 16550A
[    1.090566] printk: legacy console [ttyS4] enabled
---

Full logs and reverse-engineering data are maintained at:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/blob/main/qemu-boot.log

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 61 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


