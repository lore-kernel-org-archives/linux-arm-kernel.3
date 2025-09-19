Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399D4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4e+vM8y65RFB7t9z0rUFFvypiNgEA9GqKV1KkIOAjaw=; b=A9U7CzI/+XLFXtPfHSSYvw1X4C
	2ZwgOk6Cz4ufEAJhBGjXUTg1evfrLVT7+EV2i/Dp0hpJPup5/6A1QyojyL+/k5RHUPCs5IexUKbMQ
	Il5tkqz8rKMu1VGkk+0qxuHudeT27LuOSeRpoAtZdgMtdPfSTTm+XR20Lz0/gRg1wqsN9vltDPBVt
	k4A4oyMkWymMaDVm//yVAq2O2Q/DMPUxHBJD7qerk2/0AIZgpTP0uHtKnvY8eazaxlqOIYz2GiGMW
	bywEf3paynxbOg972Bz2PkObG8hwh3raRWzquHm1Xtq7h/vpQKpmsxYamSJoPdnz8Wg6DqmUIfTTx
	xfttgLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgsa-00000003uXu-0Rjw;
	Fri, 19 Sep 2025 19:34:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgsX-00000003uXS-2ey6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:34:47 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJYVnd309082;
	Fri, 19 Sep 2025 14:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758310471;
	bh=4e+vM8y65RFB7t9z0rUFFvypiNgEA9GqKV1KkIOAjaw=;
	h=From:To:CC:Subject:Date;
	b=du/t96Rqu8z/S9y/E8DMnrXo9Sdt/i5dE5RVObEXS3ejwua+k1Lq79523nhCeQO00
	 ZTmqtS+kG6lNgNqsEfrcU27dzoW1qNEIWWd8RWZqj+7JPVHmUBOs5eBKU/bCqM9cxS
	 ekflEfqY3L+UCV/UvrVkoudRIAEFrA47KMcRj04g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJYVIE2559652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 19 Sep 2025 14:34:31 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:34:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:34:31 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJYVKA3079903;
	Fri, 19 Sep 2025 14:34:31 -0500
From: <rs@ti.com>
To: <mwalle@kernel.org>, <afd@ti.com>, <conor+dt@kernel.org>,
        <frank.binns@imgtec.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <matt.coster@imgtec.com>, <nm@ti.com>, <robh@kernel.org>,
        <vigneshr@ti.com>
CC: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
Date: Fri, 19 Sep 2025 14:33:42 -0500
Message-ID: <20250919193341.707660-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_123445_722975_2C048EC7 
X-CRM114-Status: GOOD (  11.10  )
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

From: Randolph Sapp <rs@ti.com>

Update the memory region listed in the k3-am62p.dtsi for the BXS-4-64
GPU to match the Main Memory Map described in the TRM [1].

[1] https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf

Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
Signed-off-by: Randolph Sapp <rs@ti.com>
---

Requirement for the following series:
https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11..dd24c40c7965 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -59,7 +59,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripheral window */
 			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* Main CPSW */
 			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x01d20000>, /* Second peripheral window */
-			 <0x00 0x0fd00000 0x00 0x0fd00000 0x00 0x00020000>, /* GPU */
+			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
 			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
 			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00010100>, /* CSI window */
-- 
2.51.0


