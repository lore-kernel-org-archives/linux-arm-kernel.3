Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA2C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWi3RHjbbdLB18XRATM318s4fdy+oCrOdSJJA9aZ62g=; b=OUEbQtMWEG62WvgKPJBZf2nUyi
	kVeJ1Sy/vgrdEXBMgpPcwjTe4QRRSFeYYL4NljZ4NkOob4Hb4q09bejCIb0ujaT7zbjFpYnYfOOnp
	T+Mu0NyyWKJ2jl6bD3MvHtmhvHJe8Qu9bKv5S6ftLkldmMUyFCr0uoPu9sz1W0l7IbiZOBr3oLeiz
	Vd1whYFMOlOqk1JY+muLFTH944ppM+lqgdVE98+YuNt+6oMot8jKkSbC2kkMfI5GkIC0hJRHU0KVy
	tempix25CDDHJ3XttbOyYruUbm/bii0rGsqO/1AMoJzLYtV9eshWmut5+5/IUV6MMkl38kkf1ASfC
	1sWXMdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3f9-0000000Gc74-0xcT;
	Mon, 03 Feb 2025 21:07:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3El-0000000GYl1-1Ycu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:40:09 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3A2FB25B82;
	Mon,  3 Feb 2025 21:40:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNoaU0_hr59U; Mon,  3 Feb 2025 21:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615204; bh=yRoaCKNEQlD6o0GKHQouyJC7CdOjXR24VD3WPrh3Op8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IDdOGTvAMvXbAWeRujMvrxtrF989Lr2k9KefDry2wCfNmfSQxsnTyYk/wL3jSLFA1
	 1ZZG6xaviVLL0PIW1vBmaw5HuworkNAQYn+fMFDOmxz031spFCWdAYZNbpFM0PX7RL
	 vq/RV7eZTtdDBjaseVgWK19o27qDbhmLjlhQBm1YWxiwHqZrYaqKR7Cw0FSeCAKS7j
	 NP0xCKjzehJydxCFRocvlagPwTBMZUWVDuKUIqq5v3aIV2tCQj5jKXCF2aecg5BxnI
	 HCXic/ysjW/moIl2TBPLD9S3EqJLTnZcO3EVBjuf/RlluYbjhql2U4Mn3oyKV1AChX
	 KfrKmeWEW4joA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:09:30 +0530
Subject: [PATCH 2/2] usb: dwc3: exynos: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
In-Reply-To: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615179; l=1479;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=yRoaCKNEQlD6o0GKHQouyJC7CdOjXR24VD3WPrh3Op8=;
 b=+ktiE4SZjhVNoYoBk+EPGLxPzpZux+LGOV85hHQifZ6XAfc/lFlX9je3XhSmHK9V6qHfn3Wpn
 fxVgysCtnITANmlXT/K7jZ2xlLqCLDmJo5ZyKuHsg19eHP2I+CcoZ4P
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_124007_543174_8C94B1A8 
X-CRM114-Status: GOOD (  11.41  )
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

Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
Add support in the driver by:
 - Adding its own compatible string, "samsung,exynos7870-dwusb2".
 - Adding three USBDRD clocks named "usbdrd20", "usbdrd20_ctrl_clk", and
   "usbdrd20_ref_clk", to be controlled by the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..34f2b9e8529303cd2a957baed5819a45cbcf3309 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
+	.clk_names = { "usbdrd20", "usbdrd20_ctrl_clk", "usbdrd20_ref_clk" },
+	.num_clks = 3,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos850_drvdata = {
 	.clk_names = { "bus_early", "ref" },
 	.num_clks = 2,
@@ -185,6 +191,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-dwusb3",
 		.data = &exynos7_drvdata,
+	}, {
+		.compatible = "samsung,exynos7870-dwusb2",
+		.data = &exynos7870_drvdata,
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,

-- 
2.48.1


