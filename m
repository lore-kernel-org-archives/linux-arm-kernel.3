Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3937FD0623
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aPRAl8XBEAVPedtuLZozkH/4zHuUY/9G55Jcjy2Q4hs=; b=r6gj+cLZZuhy3S
	xwzhpl64SFOYG66u0RznEtpscyOFOGcPGUCF283fSA5SWyZTbCfAn7g0thDkhUNPLKEeFakJ5wMLX
	gpbZMb0oCoY9AsNwSe/Jdpn+7qYUVyy1pHjRxcz0VEVHo+nsqalIk1HNvEd5m1mKMrZDDX8nkMhCA
	3BM6qwk8DmGkomyhzaa9TWuTf7dEUT61l14NaGOeldXzMV6CnfRRb5nH2X0yQ4nH4mKmTFGEjMJH6
	jhryT+bEf+0wIy/Gg0FkE4Qv3hRhKGG4k0XA/r4QCBO5/erJRn/0Vi9svsQ/UJOHTrx/afz/B6Msh
	gKHMBAGy8Hv8VXhlsRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Cx7-0000000AvC8-0rMs;
	Wed, 11 Mar 2026 06:21:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Cx3-0000000AvAq-0gA4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:21:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso1123933a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 23:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210108; x=1773814908; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPRAl8XBEAVPedtuLZozkH/4zHuUY/9G55Jcjy2Q4hs=;
        b=CqTXtmeaX1xv64cR8sJvY4HVA4kLv0+10h5I8tFeJdvYSGxNkEtGSn43SwbdPwVEPe
         CIs8Pci24oBKajuD2FvhrNk8Itm4BgrbN8VYL7XkrZPH5Wbn96ip+j5PntORGDBWQ11P
         r5IzkWbupJIZ0vBJumwayCo9US74xCVtVmxFsEIIA8W8ZyboSsUqZ2g3O9nkTpb0QQrW
         XRRpVAJ+WLtyf4PyJODRBTwIhHKtRhd7f3twf+S0f++DOPOUZWVthTCTv0fFwBTyU2w3
         4iG2ThOhBLWulcvOonj71ZBN0NDUQ8SHnmciZSLnajr4Jrv9nEzkhKCR7wfFUJIO8rKB
         Lz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210108; x=1773814908;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPRAl8XBEAVPedtuLZozkH/4zHuUY/9G55Jcjy2Q4hs=;
        b=LWPaUae4GrZiTkX2L6StzddxnRDk9pcDMlZcKQnmPHarLtsBeEfWth6DoCkhQt1x/H
         qcCErgA/Mu8o14Tpi8hqEuJxYnTI9qJodeePUbAxnqMFi4XEJy0BKc9VeIWs0qWHgIjM
         5Y+TOz8VK48aCC+9ZWQNOFbhZhW/UR8UuRqAlbyxTrHNk3BAcQjqMGpZtluZ0sk2/VkM
         MWOjqxs5A2+NlE1aKN7DyQjlasNEoy/OBtzAy6cUh8KuHNyVHeVZRiJjGot1tTQqJkbj
         fw2l/r3v/Y3TXbZgKOoA7KpK+WIDg+XVueGQGn+Xv+Oh0YlLxlpCFp9aVhl4bUmexd0o
         fsQA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Io+A/r+b2MOhaEy1o1ikv0Bxq4DDdlPtkulV0rwY/assxGIoArh/DxqC9O09zNPYIEaen2MfTxQYC2XKFc93@lists.infradead.org
X-Gm-Message-State: AOJu0YxQcsN6LIZCftSEfMOHOUFz9xwd+dYVH8cOpAf3RX3+SFSY7HDy
	fQmHW4D8x1+cQWlFZ0wtbr2kTh87aMU5xMquqd+W0UQKL2jroK7FkdbpDncw+w==
X-Gm-Gg: ATEYQzz56ahTieznQy/AcN+1mcTA3SpJdSWfDnWfn66gPOiZwXzo+aF7rSThY6HaCWg
	9rdKXvcV9+uBR8QL6r8zvSjFkkNmlnnBdMsW6i535HFEmEE/mMb2PIBSPplJC10chqU5loR81BO
	/f5RyfoPILaDdDdRcRVR7FK03gNTookEpKeeTT/NeMvWyi7JSM49Xp+m1VQpRYw0uVIRH9TGyL0
	vvUbAfcUTD4MYA1l4eymMdmsZD6qCGHmrdl61nULGdOUOUyZOq9cRDRTer1cCWAI8ZqsTnA6QeN
	1/Qe+1wUI6UGK2uSDwaCLWIE1auwRKsElPCy8KT9zNGHvMr0wSL70eDy0473WTMokMmlA+qu1VG
	zo/yDNbTWDIgeCMoBd/fZ7z41GaHffMKB1/W0VP8AkDuHA6NOD1R3iA7LYyXWYtcanNzfTB2SVb
	kc23+tjRN2joeYQrxsjs7hL4W7tjX3RVKa6nYnmkcrKvDfctaFYxGUjWZ/kqdIp+qEtrO3kfCXW
	NY=
X-Received: by 2002:a05:6a21:b90:b0:398:870f:d7b2 with SMTP id adf61e73a8af0-398c60e5943mr1266713637.33.1773210107749;
        Tue, 10 Mar 2026 23:21:47 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdfa9acbsm1008019a12.32.2026.03.10.23.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:21:47 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v3 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Date: Wed, 11 Mar 2026 14:19:27 +0800
Message-Id: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAJsWkC/33NwQ6CMAyA4VchOzszWkHw5HsYQ8Y2oQlsZsNFQ
 3h3BycOxkuTv0m/ziwYTyawSzYzbyIFcjYFHjKmemk7w0mnZiCgFGnwIO1I3csMDVmaGj0Ffq6
 VbhFVIXTB0uHTmwe9N/R2T91TmJz/bD9ivm7/cjHngishAKU55VVdX7tR0nBUbmQrF2FP4E8CE
 lHKoqxAIbRY7YllWb5b1+Ru9wAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773210105; l=2198;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=Axc+CcnQnnfpiP5A9auA1FuvVMCpTICZ4JkiYPK7KGI=;
 b=AeS7rOHZELrxiBxvNyIsIKUOn+ZlPw6IOgK9gSv2u6Yil5P3iZUUoLV/vi4Yt/hjpiAducidT
 Ng5ObpGxUZwCQnBvBtvuUNWczv30czDnT5UwPYM3E3D8BuXjFkklacB
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_232149_210862_EEEE4344 
X-CRM114-Status: GOOD (  12.29  )
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
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 634 +++++++++++++++++++++
 3 files changed, 636 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260202-sanmiguel_init_dts-79cdb33c50d5

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


