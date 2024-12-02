Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8792D78312
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jw+uC3F3A8GgcANM/UNNMs5AkPYbDaHhbB4jkeAKO+o=; b=Q2sHtHWwpcgiJpfzhbStO0fWn/
	ob1tEjRKhH+G4hJEjmloe9ZLvyCEpXob//XkW3hgcu1zxJfrBAN2NIgo66dFUi3XaFv5+ulHrzQFr
	vuFULhHCydOaJGbbTHrLeDlkCbkn15T4D0dHpVWCBVW40RnRUFvphL5RATuOMIQu1WydKi/m2kiU7
	MocfFBEdXOLXhUdcUn4fIlrVqofiMxkCy6/jG5NzGeicsU3dI3jylprnnChMYRsr1av1ipHGAAZuZ
	XsrDImnnZ5+crDfZLbTQhBAhmVjaOZw1t+/ozT515IMIXBn4rxDxRqY9Wc4QMe6PAWpxS5oKyh74r
	AG+v0K4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5c0-000000065cm-3hea;
	Mon, 02 Dec 2024 12:33:12 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VH-00000006488-3rZh;
	Mon, 02 Dec 2024 12:26:17 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 53F88419B7;
	Mon,  2 Dec 2024 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jw+uC3F3A8GgcANM/UNNMs5AkPYbDaHhbB4jkeAKO+o=;
	b=e9jMVmRTNVe5KaR3Vkk9kTyuXPkqFbn8RWLzPGJzG2VKqeNFPPC91I6WU7guiaNYk1zlHf
	H/CxxpWDrBKNql8HhNYmaoC6bpl3ZTrJfyEF06hXgUBI7Gs8cw/xgFgH0KEbGeF52LEEbR
	4eYUkEwQpVuymlAU3Quxwh+0oYEAAMU=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C0FD6360211;
	Mon,  2 Dec 2024 12:26:12 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/18] arm64: dts: mediatek: mt7988: add thermal-zone
Date: Mon,  2 Dec 2024 13:25:46 +0100
Message-ID: <20241202122602.30734-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fe9c35d5-daa5-4b69-81e2-3ca66948d589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042616_107418_DFA07796 
X-CRM114-Status: UNSURE (   8.74  )
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

Add basic thermal-zone node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- only add critical trip to SoC dtsi, lower trips have to go to board dts
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index f7748a840297..09dcb39ad098 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -346,6 +346,21 @@ clock-controller@15031000 {
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&lvts 0>;
+			trips {
+				cpu_trip_crit: crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.43.0


