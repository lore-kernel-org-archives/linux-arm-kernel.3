Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1598C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hOmi94CwEA715ZAOzg9DxMrScwf/c4xhyVVMxCeC+aM=; b=nTlpFcct/xSkRqoGUNftRnjlXM
	bvuf1nhWVxqaYBBbHRhgaaYjnOEVUbCiAYnDrrZljvccfi1SR5Y/cEBn3QuK/HLeWIgAjt9NbgwMh
	9+Vq9V7xwxAXxKyr9bnuXDFC93HK6X6UTf03Uj7qPOoNjD6yrDaKeEj/YYrK1JdH4log0mrw05yjX
	9mV0d1qTcUNK0igxhuR8AkMzisYIjYGCH5IwOskf95JfsauLmGG94JbQ0zjNDt4fOTFBE3U7dJa9z
	KYKYh/eBgQfMoS54ZVmICpdEp3FxkqroVNg/zWyUB5se5EcYaDfs25LPa/w/FIRTZmtZSk2sDIcnZ
	im34qT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LDo-0000000Eqcp-2EtZ;
	Fri, 11 Apr 2025 20:43:32 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LAL-0000000EqDL-1f2s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 20:39:59 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BKdqV01656208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 15:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744403992;
	bh=hOmi94CwEA715ZAOzg9DxMrScwf/c4xhyVVMxCeC+aM=;
	h=From:To:CC:Subject:Date;
	b=glMI/ezE3ujz02cssORcqwu2dz/Opdfuw2OBQibw5sSkZq2m3CXJAJ472YHWKEVqP
	 o6xYbo/SOjFiiTK4VDG/e6nB/tKiQ5+w2yf3rweOo98bAh8FpS/yFScmBWnUYUnSJd
	 jw8rocCxZn74O1xlXV3t3ENAzItQgsrjQ8nzht7g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BKdqvc113039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 15:39:52 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 15:39:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 15:39:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BKdpkJ095890;
	Fri, 11 Apr 2025 15:39:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Jared McArthur <j-mcarthur@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tero
 Kristo <kristo@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
Date: Fri, 11 Apr 2025 15:39:50 -0500
Message-ID: <20250411203950.2859356-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_133957_548075_5DDC02C5 
X-CRM114-Status: UNSURE (   9.26  )
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

main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
This is required for proper operation of SDcard through various boot
stages.

Fixes: c5e615963bbe ("arm64: dts: ti: Add k3-am67a-beagley-ai")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 9be6bba28c26..bf9b23df1da2 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -309,6 +309,7 @@ &cpsw_port1 {
 };
 
 &main_gpio1 {
+	bootph-all;
 	status = "okay";
 };
 
-- 
2.47.0


