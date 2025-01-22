Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2949BC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mgsw9sjcOYMTK5DRdpzbwQYUkz5YZUZJUxQ0U58JvOc=; b=Xnm+8+GC48cbEicDHInzKEcCxk
	T+ZUjdm8/+ATdBjVz93gdrzhJU2IrX4oqLCHgxD96zw0jqWxGf2SDwtMIaBNHxewSXsO0OlVK37ni
	eM1oSuuIwYgxrM0yVuVAF7X5h2EyvIabH8Q/Cl21C1J2wUouYQlfd6j9oc5CHqwbN1tG47/itu/cR
	qQi60rGcADsJ4NfL1U2/woxwxzewMeEYf+9z3V6XBg02VvwW7Hf8hsDqNL8yVABPX8qNwBKj7eml7
	Sjl6bAek42Y2tJZh1bSPAYgcERITKClgLCBdly+oyuTc+jw5XzlRHjGXuBZN6uoOuc8ru8a/35/MP
	vnaT7tqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaA0-0000000AC47-2Vzr;
	Wed, 22 Jan 2025 12:48:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa42-0000000AB0l-3SXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:42:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCgVGc192843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 06:42:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737549751;
	bh=Mgsw9sjcOYMTK5DRdpzbwQYUkz5YZUZJUxQ0U58JvOc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m3HN5Ll3A19X3PfSuQheQCVH1/AufwXOrR6v7JFi5E2aZ2Jf4YiJPAXV2wrTR/rOo
	 Jo54MEbYwKdb1qId9o45uD/q2VfA4TAcczs7Jy+aWvju4CyzcNvtVETrtsISOYY29u
	 tWQ3N0FA8JqTsIfrO2cFq/t+pcN6un/fv5OvRhx8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCgVnk017894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 06:42:31 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 06:42:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 06:42:30 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MCgN24007253;
	Wed, 22 Jan 2025 06:42:27 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62a7-sk: Add boot phase tag for USB0
Date: Wed, 22 Jan 2025 18:11:48 +0530
Message-ID: <20250122124223.1118789-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122124223.1118789-1-s-vadapalli@ti.com>
References: <20250122124223.1118789-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044234_906325_FB4A5495 
X-CRM114-Status: GOOD (  11.48  )
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

The USB0 instance of USB on AM62Ax SoC can be used for USB DFU boot. This
requires USB0 to be enabled at all stages of the boot process. In order to
support USB DFU boot on AM62A7-SK, add the "bootph-all" property to USB0.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8..afe654cf1c22 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -655,6 +655,7 @@ &usbss0 {
 };
 
 &usb0 {
+	bootph-all;
 	usb-role-switch;
 
 	port {
-- 
2.43.0


