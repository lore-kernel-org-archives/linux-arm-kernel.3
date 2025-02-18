Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu2okXUSmxriTpbehwh6ce09slF4FRm/a2wXcayZzzI=; b=R3b71d5JgxQQJy3CfITkgxgBBE
	3eoQCl3FIbKxrBDEblMQO443UijYy13sd0plBD/+q0mdKFnYgiVefg4J9AqMsbrd8LsT20BIeplEt
	CYfwCcEFD3/G83dwpCrF7WICKDizscmQA/gvHeoYcd+ArhHfnUocuXl+MULQSeJS79J1RYPduuQf7
	mBMvRb3t6No+dgvw2zL8Fpqo/sdZ7yZyC6JF8xTz5VPDP+HTlwLMkWYOSfEJ3glt6NN4W/n3zlQQo
	krWAfGu+JWkwthJ/PQ/4wYmLs0Q6n8ISfQHDdnzK+0n8/UZRLTS6dlzVL/xGCpDfB0jfSBYYE302l
	cXJX1cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTLs-00000009b8B-3xzM;
	Tue, 18 Feb 2025 19:33:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSki-00000009SHd-2e3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 681BD25F43;
	Tue, 18 Feb 2025 19:55:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Rq9FsMmw4DF; Tue, 18 Feb 2025 19:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904923; bh=2uuzNDF6TRQwOUmOokoBVZvzfGe6+SMZJha/nrslQoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=azCDGikTTOkVBEfcJtHreO+htcsv5WBdSgcF6PRV89z0jw1y33AINRxQLcvgioa55
	 N3VrauH9Fwqt4ee3cEKwXNSSa0fYkbg6ljdNVpPz88ioti+qsnjqw0Nx8BMNyKTgk4
	 lVchcJLYwGXAlZ/yF/spzfdZd+JUMTcHczCux8N59YoAc4H9R2AQ1jE04yV1G2iSP5
	 12bvg/EJU6Py8pZdI54DYyeFXWG5ANHnXtJZvDdMFbRK3RyNUel4qBjqzJqvE8/Z+2
	 UVUZlK6BsVcL9eUUDhnuQN+oSUC26Dz6ZXM3xFELhZ/jFt17IXqE8nx24TtM5hYJI8
	 9xuC/9veOrBIw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:24:43 +0530
Subject: [PATCH v2 2/2] usb: dwc3: exynos: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usb-v2-2-1de41a89c9d4@disroot.org>
References: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
In-Reply-To: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=1429;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=2uuzNDF6TRQwOUmOokoBVZvzfGe6+SMZJha/nrslQoE=;
 b=RayIfUsA56+Ryke4XCCdqVp80lSZQhMVZho+Q5GWcSVGnEVaHCG08SN1ccbileBjBWOf0+2yb
 gtyygrTFZYqDz/UbxyQhze2XgO8e3Rhw0d6n5Es9bVbD/wZDFLvjnhx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105528_838168_77BBA9AF 
X-CRM114-Status: GOOD (  11.54  )
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
 - Adding its own compatible string, "samsung,exynos7870-dwusb3".
 - Adding three USBDRD clocks named "bus_early", "ctrl", and "ref", to
   be controlled by the driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..ca8d2955303c589ea03a261944aadb6582c9cb9f 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
+	.clk_names = { "bus_early", "ctrl", "ref" },
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
+		.compatible = "samsung,exynos7870-dwusb3",
+		.data = &exynos7870_drvdata,
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,

-- 
2.48.1


