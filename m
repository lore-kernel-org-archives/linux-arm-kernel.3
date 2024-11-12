Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D69FD41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6L0rlNbqaOU8uamcn+aeH4kgFTUj+lf0ZzyEFVtxGLA=; b=K1hYI+TQW5yQ3ZCYOU3df/8Pgt
	ObrOTeh8KoCh5hoZqBF/V5z5LWil4AcqCaK+anm8Xr0s6QWHeAwMsB+Rw/FY0jpLunfIGKjDDLYPT
	PR8jeZamSR8u5FiTWYiPpX8fI9zPdcNOP1Bt1mwLE7ve2U5mVV7L8eXsaFxa4wcdmtsjdZX2sniZC
	Q40Smq44i99EYO8b3AQHl2maEaT3mZzoz2I9ekwI8y4QwTuiMHw+Txs6ImbUcVc0dop19w4Y84PSL
	/aqvC5Bpne9ww8gcF/1rdUAz4X8sqMXLxblDvvtvMJ4OKptQb9u6H/fvaFZxuR3ESk8dohXiIFeZT
	2zjIFZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAku3-00000002Okd-2OVk;
	Tue, 12 Nov 2024 07:01:31 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAksA-00000002OK2-3e5w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:59:36 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC4LeWo031428;
	Mon, 11 Nov 2024 22:59:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=6L0rlNbqaOU8uamcn+aeH4k
	gFTUj+lf0ZzyEFVtxGLA=; b=ehEdCGtmMG5S7Ro6OvDe9F7udHFCMoOd1MulmF4
	T3d4n4ULUSWX5GcqN+FiE0jHgYdnHxtb1Ii81UvPrNwULlwMNfrQ7B3gnfB9U0Ib
	n0sSK/UWwOKyfWGntBUA+erqzq/AOvurmC9AFg3lOEK+/bKuPoqOUzVNIWTlf2uf
	x+tOV70l8DMWAG8t/Y0Ave7ql5TblvA/VzIZ2MWkE28McMowLgN0akJi04pXjNvx
	znpu1F56J2ROHwPilFc2gAPvPuaKmKVXcIDjc4TQ90zVv4qj87SMgmvw8sHY6Qvv
	aAYXnMNWDPaceX9PDQIrIkiAlisgKPyneooNA1jclUqROtQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42un9d1c33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 22:59:29 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 22:59:29 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 22:59:29 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id C10F73F707E;
	Mon, 11 Nov 2024 22:59:28 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] arm64: dts: marvell: add pcie mac reset to pcie
Date: Mon, 11 Nov 2024 22:59:26 -0800
Message-ID: <20241112065926.756315-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8Rs00MHIRqTVmuWdGVCsUnxvy8T3NJIz
X-Proofpoint-ORIG-GUID: 8Rs00MHIRqTVmuWdGVCsUnxvy8T3NJIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_225935_049753_5CA866F2 
X-CRM114-Status: UNSURE (   9.12  )
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

Add system controller and reset bit to each pcie to enable pcie mac reset

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 7e595ac80043..f5aef6a23f65 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/mvebu-icu.h>
+#define CP11X_PCIEx_MAC_RESET_BIT_MASK(n)	(0x1 << 11 + ((n + 2) % 3))
 #include <dt-bindings/thermal/thermal.h>
 
 #include "armada-common.dtsi"
@@ -547,6 +548,8 @@ CP11X_LABEL(pcie0): pcie@CP11X_PCIE0_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 13>, <&CP11X_LABEL(clk) 1 14>;
+		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
+		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(0)>;
 		status = "disabled";
 	};
 
@@ -572,6 +575,8 @@ CP11X_LABEL(pcie1): pcie@CP11X_PCIE1_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 11>, <&CP11X_LABEL(clk) 1 14>;
+		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
+		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(1)>;
 		status = "disabled";
 	};
 
@@ -597,6 +602,8 @@ CP11X_LABEL(pcie2): pcie@CP11X_PCIE2_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 12>, <&CP11X_LABEL(clk) 1 14>;
+		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
+		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(2)>;
 		status = "disabled";
 	};
 };
-- 
2.25.1


