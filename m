Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9960BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e1PBfYc7K+bLWshKemdsFGbQdiqTONlX7YiZarYPNg=; b=p/N6FdWM1IJVqluC+DtmwHdFMr
	PkdhEjFOA7g9IhIukkgfUzF0EUON8OGihq3Bl9U3Kwoa8wUMFzTrMwgsVdX8+u9dve/Nl5d7miaR0
	5VVgk0Aq3gRrE5JHnr4R4TznaHOAsB50w9IFZMpOCO+iNjZckW5gjvSVP20ucxjjZNnO6Vfg7oRu0
	TT9dCXrCgVUH7X26k3e1jOoukIWVd4i7o2ZuHZOmOE0KBkMzPEDpJV+fMFxuHSC9J+6NUA8Eu8qkM
	BP49pQ834zcO75bwAG3U4IYsmxTOZgWGH4mqBS1FreNFKzrnMHRnKjVkG5TUY3l8h0qkcDOJE+ii1
	X4GN1T+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXMo-0000000AqEI-2IxP;
	Thu, 13 Feb 2025 11:26:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXH1-0000000Aodf-1pJp;
	Thu, 13 Feb 2025 11:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739445650;
	bh=e0eGua7t7TvlPBa9LwHKZrO9ganTKJP++6K1ucHteGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqEPr+8kYbymOGE/ORH11JUEEdKWYxPB7p25Xt+OeO7Nn4/SY/ClqOP4vY1tOmzvq
	 kQTsyLM0OehqUXgQ6pjd76W9tjrwy8hSG1mF5dNvYSQAs95u5TymWVIIi+V6HoGddy
	 +P/GvCBoeeNW0LQqncxqpkiQkvjlGKg7Dxaa5hCseGow1dwAlGMv+odl00upckl7nm
	 fwUFdhqnM6eOL646G4Q1wUxXXrrGCCtnIlWKyOWOMB8475Qk3pJL8BDK0yioYqFdCF
	 xOtnFU6PqDJXiKPqnCHsMgUOxir8jFejEjZipX1uriYmbXN1rr3JCc+OYmeR80OiIU
	 u/x6tyrm/ZGbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71A9917E151F;
	Thu, 13 Feb 2025 12:20:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 3/3] arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline
Date: Thu, 13 Feb 2025 12:20:08 +0100
Message-ID: <20250213112008.56394-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
References: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032051_641943_C903457F 
X-CRM114-Status: UNSURE (   9.41  )
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

This board can use a MIPI-DSI panel on the DSI0 connector: in
preparation for adding an overlay for the Radxa Display 8HD,
add a pipeline connecting VDOSYS0 components to DSI0.

This pipeline remains disabled by default, as it is expected
to be enabled only by a devicetree overlay that declares the
actual DSI panel node, completing the graph.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 41dc34837b02..7184dc99296c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -172,6 +172,32 @@ &cpu7 {
 	cpu-supply = <&mt6315_6_vbuck1>;
 };
 
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint { };
+		};
+	};
+};
+
 &eth {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&rgmii_phy>;
-- 
2.48.1


