Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c58atM53j6xJlfjeW4uz3/6gYrG19vaD/Ky2Z6w23+4=; b=4G41dMcxJPJ/NzaZwMJlfZYFxp
	AF4orzaR2VcAkCG9lIaFCB7Y3lBFqE0bxSzietSRg78Vf4fdZ7sOeqViiOzOcsS05/wSs8ScyqBO9
	72WI49qCDv86MiwW6pyiFspKl70BGBEUtEGC6YBJoGo/IPcw3+GtK0q0KT3ck5VG2MwRXpQAikt/k
	fQtr2amiwVyZuxrMJ3sEcOSJ2oTZn5UILzAiu7B0zCE+jmuwp2Y0owzpUD9h+P9c4UPTuN8jt2d2w
	MGKJ5zIgxeW9wMNNYqLmY3EleIRNNfO8o0/qAJ1VWcEMeWo/HP5MrapF507vudkmwNts6ma800W6i
	6X38aTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVRb-00000008u9T-3uLV;
	Wed, 09 Jul 2025 14:06:43 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSib-00000008SEQ-3AFI;
	Wed, 09 Jul 2025 11:12:07 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 9DBF360415;
	Wed,  9 Jul 2025 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1752059520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c58atM53j6xJlfjeW4uz3/6gYrG19vaD/Ky2Z6w23+4=;
	b=SQsLJ1XddLx1flDYfMiD06aaz+xu+cU00lgxQ3taCPskDgSMkgFi132EYmOdPemFqylPKe
	n3r8uSV62h28uKwjHZGQsouRST6hYoxKJIUEvzjNULrtDPVbPyzUyzIwiVtUEMkYQqZjQN
	j1QrcCIXTTec6aLcxt9pT4vYLStmmGo=
Received: from frank-u24.. (fttx-pool-217.61.157.99.bambit.de [217.61.157.99])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 464E81226CC;
	Wed,  9 Jul 2025 11:12:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 11/13] arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
Date: Wed,  9 Jul 2025 13:09:47 +0200
Message-ID: <20250709111147.11843-12-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041205_934612_C36012C5 
X-CRM114-Status: UNSURE (   9.65  )
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

Add aliases for gmacs to allow bootloader setting mac-adresses.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 21eb91c8609f..20073eb4d1bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -8,6 +8,12 @@
 #include "mt7988a.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.43.0


