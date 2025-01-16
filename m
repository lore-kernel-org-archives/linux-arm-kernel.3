Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03232C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgkmcNxQbJDDNl4BxDwnBgJCeP+UnqNZYJdP5yDYWOg=; b=i4GIsITd9la/HtASjP79hxs2ry
	/S/R2j8REONztI4ywCk7k8G6qJvYntqNUc/AbYRlcahUkKFsuYI9Jk8bP2YbGswSvPke4e6u6w4pe
	5WRTS5bUM9xAP1baRDLR7UJGZNXqpcqYy7vYoojOokSbEFcznx5NfRGgcoc9oEfPNmWxn5Vlwre94
	EASbqQV/iLt7tznINVtB2bwqDGE3YVUSRyKzDC/Kr3WdQ5mg5SKZH7xAGvVIa2I0yW+HGnqGvRxSR
	QlyLeQV+36LijKQMOAD6emGjA5AaTyO1YHgb580T/NsGx6iFOKSDXngItmInWAly5DKNGBbhzG4jn
	a//p4sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPSf-0000000Ewaz-3s2A;
	Thu, 16 Jan 2025 12:59:01 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPRP-0000000EwPB-13Fk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 12:57:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GCvV4T4049470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 06:57:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737032252;
	bh=UgkmcNxQbJDDNl4BxDwnBgJCeP+UnqNZYJdP5yDYWOg=;
	h=From:To:CC:Subject:Date;
	b=kmgrUbDbC2xYxIvZgtUsmTdIRt86Egb5iQXrPluQRK4knTCTO+7JPUENfaOt5iRhF
	 GMidougcoq0kBEoCwKDU1VFzntF7PfySJFGDU2DipQvtG1rNUV8Vud/HvkIfICjff1
	 agYFLxNYggS0Jad6ZIcXOtRMOj+CYrXM2vHV8qHI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GCvVLx064504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 06:57:31 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 06:57:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 06:57:30 -0600
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GCvQ8l039502;
	Thu, 16 Jan 2025 06:57:27 -0600
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-gunasekaran@ti.com>,
        <rogerq@kernel.org>, <s-vadapalli@ti.com>
CC: <h-salunke@ti.com>, <srk@ti.com>, <danishanwar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to select Type-C
Date: Thu, 16 Jan 2025 18:27:26 +0530
Message-ID: <20250116125726.2549489-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_045743_448842_8D0DBAB1 
X-CRM114-Status: GOOD (  12.52  )
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

J722S SOC has two usb controllers USB0 and USB1. USB0 is brought out on
the EVM as a stacked USB connector which has one Type-A and one Type-C
port. These Type-A and Type-C ports are connected to MUX so only
one of them can be enabled at a time.

Commit under Fixes, tries to enable the USB0 instance of USB to
interface with the Type-C port via the USB hub, by configuring the
USB2.0_MUX_SEL to GPIO_ACTIVE_HIGH. But it is observed on J722S-EVM
that Type-A port is enabled instead of Type-C port.

Fix this by setting USB2.0_MUX_SEL to GPIO_ACTIVE_LOW to enable Type-C
port.

Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
619f0b6fad52 Merge tag 'seccomp-v6.13-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a00f4a7d20d9..a11daa447f3d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -495,7 +495,7 @@ exp1: gpio@23 {
 		p05-hog {
 			/* P05 - USB2.0_MUX_SEL */
 			gpio-hog;
-			gpios = <5 GPIO_ACTIVE_HIGH>;
+			gpios = <5 GPIO_ACTIVE_LOW>;
 			output-high;
 		};
 
-- 
2.34.1


