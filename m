Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75D1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xcxogDrk4fjzO62bpnTRD3XF3xkPLQHeL/c+vaHKOzw=; b=c6/CPzZRMC2aD9
	qsMdMR54PuUMS8pbf9v/8J9JIsGkVBz5p8jThEfUIRMEYv+KqIi+UiUZZjFvCvsReLFy1Q0/zJqVc
	xYclAKYZrHQhovL+lKHRMNEDYIOo2Ri/tW34DTVY1QPCcQ3hcEvlgrAntT2f9tErNG4EytCIQM7lv
	3w5w53eA0Z4AGB4E4C/D1+Fh9SupUG7LxJpAmFzW+CquSVZYntBz4UBlXHbONjXy06UkL1bD9No6I
	CA7sHGFEQp2jmNGo2i0gUd/bZ1yO/gLIZZinnnxo5A4cYQ/Is6WD0vPGfXG1A1TeUO8SGPenb8fmO
	2H0iefwVzCkchJziO+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6akp-0000000303B-0vtB;
	Sun, 20 Apr 2025 19:55:03 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aLk-00000002wJy-20RC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 19:29:09 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kC6Om7iFg7lgKg7K5cMA+4Pbk0/FtwzWNG+TTZqCGTBYZp8n2i084deJ+iC5ktCHwblTxMyIvxEqWwfsCjqmEKnLoAQ+IMKQmlXU6GIWitrnVOE+HsaglWd9z3rKOfOoB0MbEMTRNhbS5/WYkvJvKrxGcdjVVL9CcGaeGSyQF7FBIb8/ZYXdnX8uATmvnjHBAnXpGRk3pwltGO2Ze0QaOnIcDIYMdpu/DRZidKYFOyB1h/nWbW/Gb3Okg0wK5bii/6vEjcnL7VhHD1JMhdEk5kEDsfE4z/IZQaX8ndyZDurZLkG9UMIhWkSROzJ/C5JeCTGkvFChDUHr3/RxJ5zSVA==; s=purelymail3; d=purelymail.com; v=1; bh=yhkfGEEcnbf9CwY/Rpk+yRBtiyW3R/ZeFCf3WAeNpmw=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149203934;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:28:42 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
Date: Sun, 20 Apr 2025 21:28:20 +0200
Message-Id: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRKBWgC/x3MzQpAUBBA4VfRrE3dxk/yKrLADKZ0aSZS8u5ul
 t/inAdcTMWhzR4wudR1jwmUZzCtQ1wElZOBAlWhpICnj2jiEtlxOEw3LOuJuBgbDlxD6g6TWe/
 /2fXv+wEXGZFoYwAAAA==
X-Change-ID: 20250420-usb-resends-april-46c2d3b8d0d6
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
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745177319; l=1365;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=yhkfGEEcnbf9CwY/Rpk+yRBtiyW3R/ZeFCf3WAeNpmw=;
 b=YakDTBXcfdEyDqqwA7lSGKU4ju4xj728i4uc7zQTWyGqm86FxAyUgW2/dQ/+HWaqf+z1E5oeE
 ael57tIvXlEA0pcobeavz05qm1KdMVsR1Hbk0M6OdVIhinscYz2/ML1
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_122908_583546_78258A2B 
X-CRM114-Status: UNSURE (   9.77  )
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
Changes in v2:
- rebase patch to apply cleanly after Exynos7870 merge
- collect Reviewed-by tags by Krzysztof Kozlowski (thanks!)

---
Igor Belwon (2):
      dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 32 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 3 files changed, 37 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250420-usb-resends-april-46c2d3b8d0d6

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


