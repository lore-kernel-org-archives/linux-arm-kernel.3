Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854ACC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbIXTJ8cqYyRq4DH9ZIEbVM9db9hbL/vEEhMzlT0zZk=; b=l02CL9qqX/8CbfFIU7DpUHLCMO
	k8dxXbfg3lxSgRcH/I0pD4cZgnMFRbO/8jf0TWi/ol6JbBpe2oNAF+EDhX8hpz/3qrX5sGCwg1jJm
	n56jQUBtZsIBmx+wX++Q7qESzwGXEiKR+8x3DT3ugSrgKomtEITzrv6ooyuZO3h5ZFNxaBHhhrzpp
	bvzr7mc/IF8gDItLeB8yOMi4V+yuF82ID7mBE/bTcnh/zVtnsyYUeyz8qjXoA78TEdVKAthrXMsYf
	QNWAnXVI43dVuM8SybXVorPsd5t9mu/TqJ8ic+3ImanVNnqSjLrZUtQtCrWbc8DtKIHd4OMpt5w8R
	evyPv5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26jv-00000003mqe-22LF;
	Tue, 08 Apr 2025 11:03:35 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26JX-00000003h2Z-2xtl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:36:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaF2e1150088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 05:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744108575;
	bh=PbIXTJ8cqYyRq4DH9ZIEbVM9db9hbL/vEEhMzlT0zZk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bUmwAx3mmKlR4xs33su2aKXb5VPw48f2mLZHrtj4/Oh44BNNmwgjGIg1t507G8lQ4
	 CiI97d2R295S3PJ1gk1/ZEitShFCRyK0+aGRC+uV2dg9utpa+6gvhyob+v+oHGpGYy
	 uBAfc/MO/PdT8BIYNWqX2qQZrN3dq6/KkQ6wNmHA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaFK0028494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 05:36:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 05:36:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 05:36:14 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538Aa6T8016171;
	Tue, 8 Apr 2025 05:36:11 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
Date: Tue, 8 Apr 2025 16:06:05 +0530
Message-ID: <20250408103606.3679505-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408103606.3679505-1-s-vadapalli@ti.com>
References: <20250408103606.3679505-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_033619_839011_6EF0177F 
X-CRM114-Status: GOOD (  11.97  )
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

In preparation for disabling "serdes_wiz0" and "serdes_wiz1" device-tree
nodes in the SoC file, enable them in the board file. The motivation for
this change is that of following the existing convention of disabling
nodes in the SoC file and only enabling the required ones in the board
file.

Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch is at:
https://lore.kernel.org/r/20250408060636.3413856-2-s-vadapalli@ti.com/
Changes since v1:
- Added "Fixes" tag and updated commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 2127316f36a3..0bf2e1821662 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -843,6 +843,10 @@ &serdes_ln_ctrl {
 		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
 };
 
+&serdes_wiz0 {
+	status = "okay";
+};
+
 &serdes0 {
 	status = "okay";
 	serdes0_usb_link: phy@0 {
@@ -854,6 +858,10 @@ serdes0_usb_link: phy@0 {
 	};
 };
 
+&serdes_wiz1 {
+	status = "okay";
+};
+
 &serdes1 {
 	status = "okay";
 	serdes1_pcie_link: phy@0 {
-- 
2.34.1


