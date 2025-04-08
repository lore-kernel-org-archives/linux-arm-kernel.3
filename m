Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtkeFnj7OUO0U4bnqYDUPhFLm3B9Pqw2DU045e21LFw=; b=dD65k3+eJiNOHmWotAp+Qtg/3l
	1/ivhx+TsWN0nfXZBSeA2dtfXhezMiqYFCjYCYU3B9DK0kTkWX7ikECIMGguV/qmpx4lu8D/ax08P
	kwDNq2chkvH1jwEl7PXWP8r6dNSiLhH7O6AVNKkHkljJ3SjFHh57w9Yp7tqYdA8bRfLhlVbAd54QV
	SIpueIKOsnALVK4nyCnvEreilsEWuiDKRFAZ6R0Xrl/w8hu0sz3qkGgE7xaRgbdTmAZDpSovKnDm0
	PCZzS4EiZYZvOvCal4SmHFC1tAkWkzy0LhJoDqdctb0Cl2RFzl5OvshtBPYdpgQ5RVUQpKkFSRnjR
	P1Uoi8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28li-000000045y8-2ApF;
	Tue, 08 Apr 2025 13:13:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Jg-00000003h3S-1x1V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gtkeFnj7OUO0U4bnqYDUPhFLm3B9Pqw2DU045e21LFw=; b=SpsHA/SMQcapxBby63wXRj7QIX
	D4sJB2LQcpUQGP+gIXw3yifnAvQzpT7gmT9Cr6EGJARgNXX43kqUyXA2DhcA+IPoMcQs6m1fixbO+
	OJDtAa1Hrg4v92FSL3HkGkwa/Ua59lm7GB4Zb13pwwU+cVSGooRwQ/yvT82w0j6hxZbLp+bPt/u/V
	b1PbXt31qbRWoKXrETxS2SwwC/yz5RfRALJRKpNjKBM2MmD0NggKSLEUjEwPo3hfreUyxNn7eAS/p
	nHpSTf0kFOzy1l0TSDGS6AWy0Qy/lrOSuIBjPdeYi9GI0+eh60GkNdD9XN5cGbNQ8s3fQS3WaLS1Q
	8Fz0bjJw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Jd-00000008FVK-0gET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:36:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaJOq655532
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 05:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744108579;
	bh=gtkeFnj7OUO0U4bnqYDUPhFLm3B9Pqw2DU045e21LFw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XFZ62dW87X2NQzHQhPUVXfYGm5xqGL/cHTCRS7A07FvCznkHYnOFNXzrMykRWTI8F
	 10zxxAV3HOLmOrzOvQybFb9XSWERmWLJwLmJDafAzQpWoGEsu/TSZoaGRNNqjikr3z
	 4rWeAIP0DP4Sgg59Xb9R2lNrhwKvgjGrwMjdwHRU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaJYf079656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 05:36:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 05:36:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 05:36:18 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538Aa6T9016171;
	Tue, 8 Apr 2025 05:36:15 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
Date: Tue, 8 Apr 2025 16:06:06 +0530
Message-ID: <20250408103606.3679505-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408103606.3679505-1-s-vadapalli@ti.com>
References: <20250408103606.3679505-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_113625_554554_B5D44EEA 
X-CRM114-Status: GOOD (  13.28  )
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

Since "serdes0" and "serdes1" which are the sub-nodes of "serdes_wiz0"
and "serdes_wiz1" respectively, have been disabled in the SoC file already,
and, given that these sub-nodes will only be enabled in a board file if the
board utilizes any of the SERDES instances and the peripherals bound to
them, we end up in a situation where the board file doesn't explicitly
disable "serdes_wiz0" and "serdes_wiz1". As a consequence of this, the
following errors show up when booting Linux:

  wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
  ...
  wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

To not only fix the above, but also, in order to follow the convention of
disabling device-tree nodes in the SoC file and enabling them in the board
files for those boards which require them, disable "serdes_wiz0" and
"serdes_wiz1" device-tree nodes.

Fixes: 628e0a0118e6 ("arm64: dts: ti: k3-j722s-main: Add SERDES and PCIe support")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch is at:
https://lore.kernel.org/r/20250408060636.3413856-3-s-vadapalli@ti.com/
Changes since v1:
- Added "Fixes" tag and updated commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..beda9e40e931 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -32,6 +32,8 @@ serdes_wiz0: phy@f000000 {
 		assigned-clocks = <&k3_clks 279 1>;
 		assigned-clock-parents = <&k3_clks 279 5>;
 
+		status = "disabled";
+
 		serdes0: serdes@f000000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f000000 0x00010000>;
@@ -70,6 +72,8 @@ serdes_wiz1: phy@f010000 {
 		assigned-clocks = <&k3_clks 280 1>;
 		assigned-clock-parents = <&k3_clks 280 5>;
 
+		status = "disabled";
+
 		serdes1: serdes@f010000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f010000 0x00010000>;
-- 
2.34.1


