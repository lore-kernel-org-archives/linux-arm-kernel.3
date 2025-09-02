Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F6ECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVXxGdziaoxBeUwaXlwKAqEmpVy7Hr7kZxhdiqzCnVI=; b=oG2BwLPYRwkaGV25XHAyLSy2bV
	/iSD+NlVdTi+mEzcCnSUVCOfdlMyDlveEed8/kFgUgKUyKza/QbU6SbO9yI3IY8E17WwbtGuBAQDQ
	TFoodBzptg2xruTTcmc0rS703l5zXtCQ98+Ct/lI/V7oAy8U2P/7xCYbqDFG8gfwd0+DL+9TIgydl
	1hux10zS9eC+u6O10du+jyNVTUuFIYfdIUCoA6x12Q2pMtIV4VwjnejxH1hyU9x62k9tPIriJMF1/
	z7A+0vAU1VHxFwrXZ3xq8aGrkxd3vdIbZmhhRU2rYfbcaQeFKDFEO75ca71ckwyFl/0cg9Jeprrom
	w5RrSAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJdo-0000000FK8m-08LZ;
	Tue, 02 Sep 2025 05:33:12 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJb4-0000000FJBw-31i0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:30:23 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5825UIge2911397;
	Tue, 2 Sep 2025 00:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756791018;
	bh=XVXxGdziaoxBeUwaXlwKAqEmpVy7Hr7kZxhdiqzCnVI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fVzsgIzV8p1Nhrxbv1vwZPx4XgEwwFFZNNiXRvnUfF2OtRKxaec9V2q/OYaenOJvp
	 YXAtoAiFrWMm+hhObfoITPcuKgzJJmApTBI2IVPOglMWQdcSEjWh90UWpIdGDgDsVS
	 gaf+xpNHpbWpUY64OZOHwCFNIyhvdC/gILk6yPY8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5825UIN63247813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 00:30:18 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 00:30:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 00:30:18 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5825UAWo3551148;
	Tue, 2 Sep 2025 00:30:14 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to usb0_phy_ctrl node
Date: Tue, 2 Sep 2025 11:00:06 +0530
Message-ID: <20250902053009.1732607-2-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902053009.1732607-1-h-salunke@ti.com>
References: <20250902053009.1732607-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_223022_804641_8E6F2C07 
X-CRM114-Status: GOOD (  10.30  )
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

Add bootph-all property to the USB0 PHY controller node to make it
available during all boot phases. This is required for USB DFU boot.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index bceead5e288e..434d30ce8916 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -734,6 +734,10 @@ usb0_hs_ep: endpoint {
 	};
 };
 
+&usb0_phy_ctrl {
+	bootph-all;
+};
+
 &usbss1 {
 	status = "okay";
 };
-- 
2.34.1


