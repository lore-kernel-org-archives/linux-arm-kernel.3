Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C28CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0WChIlV/zxiuVn/aJ6pe5m/YT9YDqgrPizzNby6LIQ=; b=LdgQ7OYyB1WfzBe5OSQUln5LT1
	G3xe6G0DKTQQfOutym7TySu2O3hg/9LSvXBLLxeTv4jGal1oiJ5PPvJi+62N1mmgJlNRlC6pdSbsQ
	e0oS/AV2uIqPWQriY6YEMfUvwlJe2i9n2oFmSqkOHjwJej6TXxtNTobAZkDZpSRf1v5aAK1IqSBru
	tobsCOWalLvMM7FH/lMcFYM153AMl+AdBN7vq7KWcaBfPWTIhUm5O99AKjeeXBNTMafpi4Ym2ro/E
	SOsABcS02chm5fjIhDaXYgHCFTM0Jv0E2fDUpKhR5cy1qROxsBxB6ipW0xAVVKn+sjSu+IgmfVc9i
	gKu3/+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOo-00000006dXa-2CVv;
	Tue, 11 Nov 2025 07:02:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOk-00000006dTv-2TzW;
	Tue, 11 Nov 2025 07:02:41 +0000
X-UUID: 66482b58becc11f0a52f393f94899d25-20251111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r0WChIlV/zxiuVn/aJ6pe5m/YT9YDqgrPizzNby6LIQ=;
	b=t9/LMxIZ1LmnF3zJzXsH91qbEBvRYWwPXvZFIQXl3aoDbX1NevYCb9Tqhb5hGVsDS9qibpS2KgH2YgQT4FQaQh5UcxCq+DB5rxbKkOPGoIloVMlwyUigI8OwkGK1OG6nx0IKvgSbK4Wa84sDkXaCgnAUrVPegfUQAj4Xofazwps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d4058456-618c-4f12-ae96-8b41b3b820be,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:35e18382-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 66482b58becc11f0a52f393f94899d25-20251111
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260138952; Tue, 11 Nov 2025 00:02:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 11 Nov 2025 15:02:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 11 Nov 2025 15:02:30 +0800
From: Jack Hsu <jh.hsu@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srini@kernel.org>,
	<ukleinek@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<chunfeng.yun@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<sean.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<andrew-ct.chen@mediatek.com>, <lala.lin@mediatek.com>,
	<jitao.shi@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jack Hsu
	<jh.hsu@mediatek.com>
Subject: [PATCH v7 7/9] arm64: dts: mediatek: Add MT6319 PMIC Support
Date: Tue, 11 Nov 2025 14:59:21 +0800
Message-ID: <20251111070031.305281-8-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251111070031.305281-1-jh.hsu@mediatek.com>
References: <20251111070031.305281-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_230238_631759_D9367167 
X-CRM114-Status: GOOD (  11.76  )
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

Add support for MediaTek MT6319 PMIC IC

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

---
Changs in v7:
 - change pmic node name as "pmic@"

---
 arch/arm64/boot/dts/mediatek/mt6319.dtsi | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6319.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6319.dtsi b/arch/arm64/boot/dts/mediatek/mt6319.dtsi
new file mode 100644
index 000000000000..6586f0ba5b2f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6319.dtsi
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi {
+	mt6319_7: pmic@7 {
+		compatible = "mediatek,mt6315-regulator";
+		buck1-modeset-mask = <0x3>;
+		reg = <0x7 SPMI_USID>;
+
+		regulators {
+			mt6319_7_vbuck1: vbuck1 {
+				regulator-name = "vbuck1";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_7_vbuck2: vbuck2 {
+				regulator-name = "vbuck2";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_7_vbuck3: vbuck3 {
+				regulator-name = "vbuck3";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_7_vbuck4: vbuck4 {
+				regulator-name = "vbuck4";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	mt6319_8: pmic@8 {
+		compatible = "mediatek,mt6315-regulator";
+		buck1-modeset-mask = <0xb>;
+		reg = <0x8 SPMI_USID>;
+
+		regulators {
+			mt6319_8_vbuck1: vbuck1 {
+				regulator-name = "vbuck1";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_8_vbuck2: vbuck2 {
+				regulator-name = "vbuck2";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_8_vbuck3: vbuck3 {
+				regulator-name = "vbuck3";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+			mt6319_8_vbuck4: vbuck4 {
+				regulator-name = "vbuck4";
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
-- 
2.45.2


