Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83117C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MfnOibsMR8PJLojhIl+PNX74688bOZ/dJBAYNRO/nKg=; b=IcgcYWdv9+Ze0f
	u8DCg879V0xOh1YojoRZ5G4VIW/cXZajgyiz76au4AZWbPKJ8DDDBL/w8gqQI8c80OUuBBIOQ7P1Q
	tOoyMQmNdjmgG91GArbgM6iRAXU1vU6ZyyMxcTEpdEOrkEOslmybZEwSOKCu17sKZjTNPRDeHdgQs
	u/yHOrGEDkrNP/5VkXfxy6ESNiKi2YioPD7NuDRJ/21mlc5GgCANOBfPk+J4Ju+6s12YSpXiRYE4R
	3v3qAkZyAeDoCnk7sLEQMgLPPKUDnAlNYRfdBtGOIshQndltZjbG+GKAcbqlqACVBEmrt9HadoJiC
	TKjehkCl8+0d2Mtv108A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0HF-0000000Fqvu-1bCm;
	Fri, 14 Feb 2025 18:19:01 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizdJ-0000000Fk8K-2uLi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:37:46 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kYADpheOkBDJni8Szoosijy04sibwNBeGQWE6vO7rL/BnzUnasL9y0+BSK+2Y2bequjxW0dY8mrDVQ6GGQMXedpnchHOawMFYUx2lOqg1TPy+P2CJ53/obEdHc3UciJz1CUsJFfDY1q20HbP1JWlk1y03SyDOGxYWe71GCWnQ9w/W7E+H3xRdJ2j6cyzxuvSWAKAp+GibSYVni4g4sgyDKVi4PCIq3xxgCgYaAETr5zGsXJJFOJv/8WXJOANaYSU9Oh/vN7zZocWMpN/2vZPc8jA8824iS82U6OxT14t1V6REiPY0s2VTXTXxFCEsdU3YQCsSO3yXbBatu74Dei+QQ==; s=purelymail3; d=purelymail.com; v=1; bh=5X9po93482aFLpIrgTxkENTzyprq/G/AXnwXeW493MQ=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1457029256;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Feb 2025 17:25:49 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] USB PHY support for Exynos990 SoCs
Date: Fri, 14 Feb 2025 18:21:06 +0100
Message-Id: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ7r2cC/x3MPQ6AIAxA4auYzpIU1AGvYhxEqnYBQ+NfiHeXO
 H7DexmEEpNAX2VIdLJwDAW6rmDeprCSYl8MBk2HRreK7idEsRaVvw5xqnEasbPGOq+hVHuihe/
 /OIzv+wHja1l7YQAAAA==
X-Change-ID: 20250214-exynos990-dwusb-3b1005929bd1
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739553946; l=1223;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=5X9po93482aFLpIrgTxkENTzyprq/G/AXnwXeW493MQ=;
 b=6ZfuY4P71D86TEPrjhPZjctQE9+ZypUwPq2J3pR9ULWDbxiK2N+X4bZ+QTsdcnN8fRhpMtiuS
 VNy1XxJ654VCw2hwiOUwmEWUJMEVf8Mv/oFb8QAjlzIa7YoHhWgLZ//
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_093745_800656_1545B534 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Hi all!

This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
This SoC has a combo PHY that supports highspeed, superspeed USB and
DisplayPort, however due to my inability to test the superspeed part of
the combo phy (device always enumerated as high-speed, even on the
vendor kernels/bootloaders) only the highspeed part is brought up.

These changes have been tested and confirmed working (with the USB_ETH
gadget and telnet/ssh in a ramdisk) on a device from the hubble family
(x1s) and also a device from the canvas family (c1s).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 32 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 3 files changed, 37 insertions(+)
---
base-commit: 5cbcf2652f4cd84eac21f5e88fe2a0baecc601fb
change-id: 20250214-exynos990-dwusb-3b1005929bd1

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


