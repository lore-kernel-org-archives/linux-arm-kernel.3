Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191FDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fA+QZmHLMheNWe1fuWSyOeK1K91l2wgNybCSNPDo7ig=; b=L7rcEFN3ijtOP4V5dgs5wB/YBP
	aCmZt60VGVhSHtlssestLmSGd+9dkNLOoWB6WK7zEj4Oc7q3Uk6TBDnylz5bcOujatRyMjRwboowI
	RxR906V0rBtIfUQ/XwTrBqH8eMGYbEt+vcGJgLsrbbHFe2Duc+ZQXaxafAyUW1zjH6GglXCLk3+js
	5DFCk/+5vJmpLqQPomKCWghnPpiAxkcFhxElyzF9SPqv+nd8WqqiEz01u6WZky1unVXZ5GAaCRSzZ
	nrbQvq+XHelQN1Z9ZnQHutNsTqn1R+Fjr43K26tBRqvm9jyoMyg+W2nf3toUOb2YLVAmI4+qJp6vE
	KQgyeJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaBG-0000000ACGK-19kC;
	Wed, 22 Jan 2025 12:50:02 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa45-0000000AB1u-3PoZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:42:38 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCgYnx1012237
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 06:42:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737549754;
	bh=fA+QZmHLMheNWe1fuWSyOeK1K91l2wgNybCSNPDo7ig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QFgpYHBGUSwnbdH7zzxq1f83MJfgvmGTk1kH+GdnW43E2IdIOSb5GlZzFNFH983sJ
	 ZAoUPDhlTVgJzRrSxAZWqrQt0xCmUuGj/TYhdb5TXJOg2eQT6So74aAH6hBEvVagRV
	 nE6gLxYE/lawxgnqz1UOlBXwfJgQauY5LuLWBxCg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MCgYvQ053712;
	Wed, 22 Jan 2025 06:42:34 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 06:42:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 06:42:34 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MCgN25007253;
	Wed, 22 Jan 2025 06:42:31 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p5-sk: Add boot phase tag for USB0
Date: Wed, 22 Jan 2025 18:11:49 +0530
Message-ID: <20250122124223.1118789-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122124223.1118789-1-s-vadapalli@ti.com>
References: <20250122124223.1118789-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044237_894459_6580FA4F 
X-CRM114-Status: GOOD (  11.37  )
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

The USB0 instance of USB on AM62Px SoC can be used for USB DFU boot. This
requires USB0 to be enabled at all stages of the boot process. In order to
support USB DFU boot on AM62P5-SK, add the "bootph-all" property to USB0.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ad71d2f27f53..20ceb1c11d8e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -519,6 +519,7 @@ &usbss1 {
 };
 
 &usb0 {
+	bootph-all;
 	usb-role-switch;
 
 	port {
-- 
2.43.0


