Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0B0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+i5DM3x3WXg2uqMLLr9WJvq/q6qvV6rl33rsfy6Fiwc=; b=ZXhlEEYa8JTn4j7hbIZOueNbBV
	BmcNxshMzVObgc865ND/bHsth/CfNYMIF4WHjHs33v9/641vJRi4ymbeDyaaLxLYuLWijLS/Pxkag
	KBbhe4clo/OLwsHnhSbd6N7iQ2IMmxnsJA3smb8jC/7vGh2rI5I2vzRQNdqVxhnXd/NpuqXlZH9fg
	ZMiVSLjeMyed62eVylnPcHbKxz3oySfAm57mGWbZpz6gM1WATpk/nAg9tXyPK5h9sYlZku1KrDmL0
	LTQHiI5iYyxPmtRbMWi58xYXmilJqm/PxKlXKc6q+ZzKVY7+DSonAeug/KjV41SNNmj58Nm9EGKM5
	k509Ah8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzhm-00000004Iki-45Z2;
	Fri, 16 May 2025 18:22:46 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNk-00000004FMX-0eeD;
	Fri, 16 May 2025 18:02:05 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id D782D1007C9;
	Fri, 16 May 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+i5DM3x3WXg2uqMLLr9WJvq/q6qvV6rl33rsfy6Fiwc=;
	b=JVePYhpe43R10j1wecIfq9dDxv8tsjf8UVk3pErXPRzjvAH/Q/VpyBp2kIJzxpQv4qWrMF
	QvdYcomHJVQEpsRaEEnTZZEYuK+UUL66mrkAPNAhJD9PAzQENdvKkVeneIh/LvE2sBOzJc
	aAlcrGcHqqbE+o6XJ1CO86s5GB2APD8=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 8B8621226F2;
	Fri, 16 May 2025 18:01:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 10/14] arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
Date: Fri, 16 May 2025 20:01:41 +0200
Message-ID: <20250516180147.10416-12-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110204_338550_A01DCEEF 
X-CRM114-Status: UNSURE (   9.18  )
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

Add Fan and cooling maps for Bananapi-R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2: fix typo
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 23b267cd47ac..c6f84de82a4d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -12,6 +12,15 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		/* cooling level (0, 1, 2, 3) : (0% duty, 30% duty, 50% duty, 100% duty) */
+		cooling-levels = <0 80 128 255>;
+		#cooling-cells = <2>;
+		pwms = <&pwm 0 50000>;
+		status = "okay";
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -73,6 +82,26 @@ cpu_trip_active_low: active-low {
 			type = "active";
 		};
 	};
+
+	cooling-maps {
+		map-cpu-active-high {
+			/* active: set fan to cooling level 2 */
+			cooling-device = <&fan 3 3>;
+			trip = <&cpu_trip_active_high>;
+		};
+
+		map-cpu-active-med {
+			/* active: set fan to cooling level 1 */
+			cooling-device = <&fan 2 2>;
+			trip = <&cpu_trip_active_med>;
+		};
+
+		map-cpu-active-low {
+			/* active: set fan to cooling level 0 */
+			cooling-device = <&fan 1 1>;
+			trip = <&cpu_trip_active_low>;
+		};
+	};
 };
 
 &i2c0 {
-- 
2.43.0


