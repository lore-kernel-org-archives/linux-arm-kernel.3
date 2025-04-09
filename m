Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE02C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TIDLuiEOJadSq9UAocGOgimTnMWyC/tjW6yt8Iynfs=; b=rhcYlbDd2oxXMRotPkW4SJhgWz
	AkpyMRLLmOchMIsTi6F79aR2FZPf6T+6dafkKq60k7H6M02CWKdMXDOVKZ+40DWn8E8dGTBifc8J2
	KTNyMP2bYx3Y6JbSJDqj7jGXovv+3wKwjYrNSLz8LobOTq/pQw1luhEPG7TMdGw3rgz6qsituo4/3
	DgO9pq/gqLEBUgnBHvaIDtS9sTpRF4os3xW1eKqdTDFSnYVkj8H2R1vIOVgU6Awy3i0wljK0ap+Jo
	e5Tgd/coadg80pb19AxyPibgLgXd4XTHGjPg7WCPziAnkRlvEvPjHgr5YRXradXSUuiNwdjs2SyZL
	XddcrGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WUA-00000007TAf-2Eps;
	Wed, 09 Apr 2025 14:33:02 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VhF-00000007KVk-34bQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:42:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539DgJXm843569
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 08:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744206139;
	bh=0TIDLuiEOJadSq9UAocGOgimTnMWyC/tjW6yt8Iynfs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XoXLlnzVCHjSXht/0VqRKYWo1ls3hd3wEl7ocsWbLmSizBH0Qit0VlLycXK7e0R2b
	 4FNFtN/VxtIJ95MZXZx+9ZV4QY2TUhQ1P9ONbGWjK8NAT3YbDwPqvoiA3K/IIOAij+
	 W2v8eNZBnrRUgHqezQMu/KYDNwyxTzTTACBT1h2E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539DgIIj021441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 08:42:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 08:42:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 08:42:18 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539DfZvs122297;
	Wed, 9 Apr 2025 08:42:14 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        <stable@vger.kernel.org>
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219 overlay
Date: Wed, 9 Apr 2025 19:11:27 +0530
Message-ID: <20250409134128.2098195-7-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_064229_816177_47073419 
X-CRM114-Status: GOOD (  11.98  )
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

The IMX219 device tree overlay incorrectly defined an I2C switch instead
of an I2C mux. According to the DT bindings, the correct terminology and
node definition should use "i2c-mux" instead of "i2c-switch". Hence,
update the same to avoid dtbs_check warnings.

Fixes: 4111db03dc05 ("arm64: dts: ti: k3-am62x: Add overlay for IMX219")
Cc: stable@vger.kernel.org
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
index 7a0d35eb04d3..dd090813a32d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
@@ -22,7 +22,7 @@ &main_i2c2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9543";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1


