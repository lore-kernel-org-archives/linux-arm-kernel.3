Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36091C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYoaQKOG0j2VrFU1cmqPC5t9p1n01H3GC07p2m/mp0Q=; b=snqI3gszkHVpIfk92E1NSRgqF8
	7rT3ZlCRgvS/QtwfqjOBTNhLDbostHHlyPRs5r80+WFys8oofkz2CWfDyfPlnGishNnGkrBtiMLIj
	6MUUSwwICAxljUVd/8nAMvHOchjMI8s5UOOvfRUSIFL6AoYA/zm0dr8CW6vylP7eIFqlvohxDNpqZ
	dQdapCRATdYGropZUyhOc0j7R26kOF0gXZ5ma8/o9X3AWZQhN/aIlvPhUG6pO4zNzA5MwpC+wz+NC
	VO/Y5kINAVLIDWiZ9w4Omrnytt1hdwcZoaiiJBu1Vc2QTpGpQK3aT/CdQCRpgSewyxzlBl3qMPf1e
	fSqjZZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTBm-00000009YXP-0wVE;
	Tue, 18 Feb 2025 19:23:26 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkR-00000009S5V-2sHc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:12 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt1cJ1601148
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:55:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904901;
	bh=EYoaQKOG0j2VrFU1cmqPC5t9p1n01H3GC07p2m/mp0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eBCcKc2MQgD3O9wzLYQLqDp2RHlNaf8SSa6l6pTgiMq91KUI6EuyE47VVakrXZuC0
	 Db/KBV/mcKnamNJDDuv+ANgoTZFK9i6Q4QL2KJUlP6VB+OQa5KEDVeyYJDKg2bnqcr
	 k+PC2j+qOcFzUofvw0rnkFAyJoLLFDtqLeiQKlyY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt1GX021064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:55:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:55:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:55:00 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIsrxZ123821;
	Tue, 18 Feb 2025 12:54:57 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>,
        <y-abhilashchandra@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH 1/5] arm64: dts: ti: k3-j722s-main: Add BCDMA CSI overrides
Date: Wed, 19 Feb 2025 00:24:48 +0530
Message-ID: <20250218185452.600797-2-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218185452.600797-1-vaishnav.a@ti.com>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105511_768670_3E26F959 
X-CRM114-Status: UNSURE (   9.37  )
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

J722S has a dedicated CSI BCDMA instance which is slightly different
from AM62P in TX channel support, add the overrides and additional
properties to support CSI BCDMA on J722S.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 3ac2d45a0558..f8e4424f3bb7 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -204,6 +204,16 @@ c7x_1: dsp@7e200000 {
 	};
 };
 
+&main_bcdma_csi {
+	compatible = "ti,j722s-dmss-bcdma-csi";
+	reg = <0x00 0x4e230000 0x00 0x100>,
+	      <0x00 0x4e180000 0x00 0x20000>,
+	      <0x00 0x4e300000 0x00 0x10000>,
+	      <0x00 0x4e100000 0x00 0x80000>;
+	reg-names = "gcfg", "rchanrt", "tchanrt", "ringrt";
+	ti,sci-rm-range-tchan = <0x22>;
+};
+
 /* MCU domain overrides */
 
 &mcu_r5fss0_core0 {
-- 
2.34.1


