Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4DC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 05:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iQXfyalqbVzM2bdCPJ05L1KZPH9N7iukdGOBcfEl0U=; b=QjYNcOriTqMyaAsataua2V31Ye
	AZkr7TuYr8ksknWt/TDu450lr6srKjJNNL9Va1dvZQyGPf8xh8Ge1SN4OrsZ/l/3BJHbCuAvlD8EO
	iPf2bPwQP5AzQP3K8vr/Fzv9HK+EOyD+lqhOCdHqRdhYr+74MNumZiTVYTK8ym4H296kIuV8ymBqS
	BHL+lRgJyb52jjMJPWzs/sbUuGukzQZzv9iLb+wNbMBQhb9Pp2UPDXPjqDcRdTJ1eTWlCcjSwXAde
	RZuFvJJFyIhCjR47B2is+fHQoAFaMYZEdN9AblL7a1lUYd0QvVi5hU7GBVO+ZtDSi7LUW/p0Q1q2K
	+Sgok6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TUG-0000000FTyA-3gtG;
	Sat, 12 Apr 2025 05:33:04 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TOr-0000000FTBt-06Dy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 05:27:30 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5ROvr1725208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435644;
	bh=4iQXfyalqbVzM2bdCPJ05L1KZPH9N7iukdGOBcfEl0U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JS8U7cNvnCPtElZzaRzdyeaVyZWVG+sIC5NhTlox62iaoXeNirK2b4TlwW64XEOhZ
	 /sNCZusz3O6MEky63ooW7qHT+5wFWqTLVEz3T6R8+rtJ88zP9KbvAT2p2SYHf/Qmw1
	 oLlSv17kOBV7r/MrkJihrG9eWJVSDxJH4XQqPZh0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5ROku006758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:24 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVT121011;
	Sat, 12 Apr 2025 00:27:20 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: drop redundant status within serdes0/serdes1
Date: Sat, 12 Apr 2025 10:57:12 +0530
Message-ID: <20250412052712.927626-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_222729_108276_8BCF7F5C 
X-CRM114-Status: GOOD (  10.86  )
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

Since serdes0 and serdes1 are now enabled by default within the SoC
file, it is no longer necessary to enable them in the board file.

Hence, remove the redundant 'status = "okay"' within the serdes0 and
serdes1 device-tree nodes.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch depends on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
as indicated in the cover-letter.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 0bf2e1821662..34b9d190800e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -848,7 +848,6 @@ &serdes_wiz0 {
 };
 
 &serdes0 {
-	status = "okay";
 	serdes0_usb_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
@@ -863,7 +862,6 @@ &serdes_wiz1 {
 };
 
 &serdes1 {
-	status = "okay";
 	serdes1_pcie_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
-- 
2.34.1


