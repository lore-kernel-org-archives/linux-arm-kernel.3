Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C688C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DpoyvF8vHF6pvhV8jyXEYvZjATLDZX8GvBDzWRv6FA=; b=tI2zDuTV7zqopkFlHMEY3Dtlle
	agPHatHE7bRsfLcOgTJVGOxvwUdgKxPDCyp3AZtLTrKfq8pX0ya//hCnDd6Gpe3B9FiCpRHAcZg7L
	cmjZD9cxHacgP848zhvtzTowdHI9MucyH1XgnRjgVLuU634Dn8VDHerVDWl5x6zSh25dYZjF8bb+z
	Wk6HJe0rXhvguZ2pPEoRB8YwDF3CQ7EQB8D9YmKjCuKoDZaMyF4gT7Ua4yi+X3Yd0q1WaM4WG08uM
	pmkU16qgGfX8+SHpz8odbKd/Z/5iGYzwi0p+RbmGBmDlSMmvodGX0TlWkmzlVhxoLep1x5hiL9hCd
	/F9N9DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504w-00000009CIK-26rN;
	Wed, 16 Apr 2025 10:33:14 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTN-0000000936j-1fXY;
	Wed, 16 Apr 2025 09:54:26 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 012306045F;
	Wed, 16 Apr 2025 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DpoyvF8vHF6pvhV8jyXEYvZjATLDZX8GvBDzWRv6FA=;
	b=FM+rpkf9eoW+lvZoYQzoN1vxV8CnHsRP+vdDcXt0tEh/wI8JQkPLieYDu73s6xE3+OB1Yr
	Np9xUHAicWx6/od0Ph5/TDrgULa8Ns00rdVhp35BYQ49Q8vsHqp6R+Q2ufInwbDCh+xYF1
	nuFXlQpjbekCQyllLCjsbu3W4iNNhiM=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1D5E33600F2;
	Wed, 16 Apr 2025 09:54:23 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
Date: Wed, 16 Apr 2025 11:54:00 +0200
Message-ID: <20250416095402.90543-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9f979f6b-afa1-4db6-8f8e-fb832d51291b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025425_574788_6CA6DA62 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Enable XS-Phy on Bananapi R4 for pcie2.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                 | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0d332822971d..37e541a98ee1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -397,3 +397,7 @@ &tphy {
 &watchdog {
 	status = "okay";
 };
+
+&xsphy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 72792f4ccde3..868d6c0742e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -560,7 +560,7 @@ topmisc: system-controller@11d10000 {
 			reg = <0 0x11d10084 0 0xff80>;
 		};
 
-		xs-phy@11e10000 {
+		xsphy: xs-phy@11e10000 {
 			compatible = "mediatek,mt7988-xsphy",
 				     "mediatek,xsphy";
 			#address-cells = <2>;
-- 
2.43.0


