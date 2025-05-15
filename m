Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDEDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdiaA80PGxTj8/63dW4VmBFVuedmct7smoH5RxZ2HsE=; b=FiNyHMb9N9TWlk
	eU0IZ74zF4dSwItO7FZ575oX/Rh25GBuG1wkTUZZsFKjyQjRWSPy/N1qiJKoo6pNZEXqDXlHLPHJs
	oWzNFROlNwEaCRGSvkPOBMYxOjiJ9JpoQQjbpNB7aKG+r0huA/Sje6k0RqrlrzYFrj9ipo+tB1kEO
	vb6sSiFRvzX8oaD5YDLNdRfztHjTub99TcxA24sLnsY5Hp+0RWkV52FX7HJTSNtvzPlJbDVhCcRPM
	2/p8fJ1B3/8zFICOApycPsDeF/8X2YIG+30tQOYA3XdkMf8/tdr6C0Fnt/zgBvy6BmPl+comuZSu9
	d47QYoxa5Ors9Xc06vKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZtv-00000000wFr-28vK;
	Thu, 15 May 2025 14:49:35 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZoB-00000000v8v-1EIU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:43:41 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=OyS5encPWeSpjfQSDR8d5+1EwUrba2JUY/JgWBvF1jJl9kZdsTqHg+FmHHNGYGzl8jDjOTQlZA063MIFup08AJBxfmRXaxxf47s4+0apX5wVF67Ys5Q8DGhQ2X/s4krTytK8/ADxZJdgx6fW2YZDRKbMPRxwIb7PGB/1mQVe/pMeCiLWaYtZZLDsvNnCkNDXFbK5dEJgrQIA4XP+ayjG1Nkr2VuG5SfC2ix0LNdlhwrBKE3ZNroUjuUu6AUCwhkZroeMuaTTASzfEb4yxvXC7u9C+hpeuAQnTmkyOSHVukgVEFz6bGdHu20a2pxTgubPmFyGIF9mH5BSphG/mmslJg==; s=purelymail1; d=purelymail.com; v=1; bh=7KnyBf6no0fpHB5ZlMQW0sPJAgngdx7mnb4tL9CM37I=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:06 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/2] USB PHY support for Exynos990 SoCs
Date: Thu, 15 May 2025 16:43:00 +0200
Message-Id: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHT9JWgC/x2MQQqAIBAAvxJ7bsEMM/pKdDDdag9ZuBRF9Pek4
 wzMPCCUmAS64oFEJwtvMUNdFuAXF2dCDplBK22UqQweMmIioRgEV3djVt4H1zZGt9bWkMM90cT
 XP+2H9/0AeyV35WQAAAA=
X-Change-ID: 20250515-usb-resends-may-15-ccda86528773
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=1423;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=7KnyBf6no0fpHB5ZlMQW0sPJAgngdx7mnb4tL9CM37I=;
 b=IJKR9zCW6SXgST6KqPgmHhLcdPwUDoyGtSq7TqaZGp8/rwJy1kT0pxDa0FC/nr8cvODAiJv7a
 Gfd9Hmoz7HuCbajakjvOqL/BBIH4pZO705lr0ZiBm6X64ySktCAfgdl
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074339_408554_FBE3FF8A 
X-CRM114-Status: UNSURE (   9.97  )
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
Changes in v3:
- rebase patch to apply cleanly again

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
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-usb-resends-may-15-ccda86528773

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


