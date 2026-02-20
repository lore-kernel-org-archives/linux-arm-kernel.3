Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBCBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncaVl8FmjKo1MU54nAIJ5qmIEEBB3+ip6lPVKRFzkRI=; b=CLwiGCF3ro5jmI/XTkQFNB/KhL
	o2ilA9y46bO3jCTNU6SlYPZZTnDuCQonOJAkylsKgf8/55ur6wWWYV+RcNK5IJog1hFlt4RCXpX7h
	3l+PzWjGDyvClXZGGFFB9kiPDxLJBdUy0Qw048LFwzhIDck36TpMIsGAZAw4qa91nEudyB+oF/ieW
	w5Wm/d6vjZtJTPGWpwgOne1vWAYgnD8R6r11Y8j3RNicI3IbEm67D/Ap6tTqGZLVdlMnQcf5Mg09R
	9mk9ICj7Tyhx/8vMv7b/gOJtrIOU3HtTSEP7YRtUx+08hZgVT6dZ+8uSyWgWTSuEzJLAS5QuFvfDz
	GidelCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsV-0000000E5mE-2vCS;
	Fri, 20 Feb 2026 10:36:55 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsN-0000000E5e6-3MZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:36:50 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncaVl8FmjKo1MU54nAIJ5qmIEEBB3+ip6lPVKRFzkRI=;
	b=0PGmqiJHpNVwmVI44CQvWvovGJZ+7qLLsqK8dGW50OqtjYILi5uhxHVIXe1PTtikO0ddRT
	zCb7uxXqYLv+DHmP1HCzr4i2GImt/p8nkKsmsP1CV0mYOqpg5g2z1kgo4a7vX8EXvLdjQj
	DkYbFeLKf8i7lR/n+S/xWJK+e3Fng8NWA9DWWmfT+3Nb1IkJ9gHDvAEfY+IPyr+KD2GMlO
	pCLKlZq98gZTO25TqAN40rzhNd47AbZlNmP5jzq3fp1ugcG12qnHLQAzVppb28NMn39THK
	HxYsSroQo80OyxNmoKNhXfKiO6YwQYncs5pJKkG7UXsw8NHiAROYLqiC84FeUg==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
Date: Fri, 20 Feb 2026 11:36:17 +0100
Message-ID: <20260220103636.9697-3-frieder@fris.de>
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_023648_775489_698275C9 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The SMARC evaluation carrier provides an SD card power switch that
complies with the OSM standard definition. The OSM base devicetree
already describes this correctly.

Stop overriding the vmmc-supply in the board devicetree and rely on
the definition from the OSM base DTS instead to fix the power supply
configuration for the SD card.

Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff6917..74d620dd06b7b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -249,6 +249,5 @@ &usb3_phy1 {
 };
 
 &usdhc2 {
-	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
-- 
2.52.0


