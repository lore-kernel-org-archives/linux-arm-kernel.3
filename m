Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E62C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2AF5EGj2qKzyf78LkwWbxJULTyLQiIdC4tmSHWVSetw=; b=0Of/bV8+SQpQp5pgZYzlysVL72
	mu6kyY9EtpMbpHBZqblNvYjw9rafyMNN7wUpTwjPAPzAgM6LRwEfUo4AnZQIilqUTJg4TrcLFbVzP
	Tzi0r/s0ejcBuoVEDt/QdAv03e8jTn70QYG02H3tCjKrNNp0MczIId2Jo6LcLCB6XTZdnHjFjDjC9
	DzWOJXCUVvBOtDy1D+kA7abUP6mWb/qj2u/c59MZqIn2DcYQ40lWU3C6rO9WyudOgZcM+K0JaBfKi
	cA1XR0gQbdXRSFZ1FWCyQ/SVO5csPLpSwFykqgWaKBiUE0vIm2zeA9SvA6XDqR2Xh+gQOQOMNDjbf
	ncw5GIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0g0-000000091hA-07zg;
	Wed, 02 Jul 2025 16:51:16 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWypt-00000008hGJ-1Yrw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:53:23 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562ErGLe3265092;
	Wed, 2 Jul 2025 09:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751467996;
	bh=2AF5EGj2qKzyf78LkwWbxJULTyLQiIdC4tmSHWVSetw=;
	h=From:To:CC:Subject:Date;
	b=S88bvCmZCoQkQIQ/eKSEQ5wbYz/HSld3j1dZRXMBH0Q80NMN6zZuzZOiuRtKbaVSQ
	 BDqQusU9xeKQSCoUmMrvRVOUDQnMr9LIf4GH84M+6tLNbbabMu8OxARSBzdvfpYDRY
	 ThsKCTY9x4aYeEk60HWHgJQeO/NlJkYBHBfp8S+4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562ErFPs1372673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 09:53:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 09:53:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 09:53:15 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.22.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562ErFHm3616815;
	Wed, 2 Jul 2025 09:53:15 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] arm64: dts: ti: Enable overlays for all DTB files
Date: Wed, 2 Jul 2025 09:53:14 -0500
Message-ID: <20250702145314.71996-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_075321_511583_FC5CF3DC 
X-CRM114-Status: GOOD (  10.55  )
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

Allow overlays to be applied to any DTB without manually enabling it
for each file. This adds around ~10% to the total size of the DTB files
on average.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Note that Broadcom's DTS already do this, so there is precedent for this.
And we do this unconditionally in our Yocto Distros[0] already, this just
moves this so everyone gets overlay support for all boards.

[0] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc#n5

 arch/arm64/boot/dts/ti/Makefile | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 743e7b945af3b..93fb2c5c3bbda 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -348,24 +348,4 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
 # Enable support for device-tree overlays
-DTC_FLAGS_k3-am625-beagleplay += -@
-DTC_FLAGS_k3-am625-phyboard-lyra-rdk += -@
-DTC_FLAGS_k3-am62a7-phyboard-lyra-rdk += -@
-DTC_FLAGS_k3-am625-sk += -@
-DTC_FLAGS_k3-am62-lp-sk += -@
-DTC_FLAGS_k3-am62a7-sk += -@
-DTC_FLAGS_k3-am62p5-sk += -@
-DTC_FLAGS_k3-am642-evm += -@
-DTC_FLAGS_k3-am642-phyboard-electra-rdk += -@
-DTC_FLAGS_k3-am642-tqma64xxl-mbax4xxl += -@
-DTC_FLAGS_k3-am6548-iot2050-advanced-m2 += -@
-DTC_FLAGS_k3-am68-sk-base-board += -@
-DTC_FLAGS_k3-am69-sk += -@
-DTC_FLAGS_k3-j7200-common-proc-board += -@
-DTC_FLAGS_k3-j721e-common-proc-board += -@
-DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
-DTC_FLAGS_k3-j721e-sk += -@
-DTC_FLAGS_k3-j721s2-common-proc-board += -@
-DTC_FLAGS_k3-j722s-evm += -@
-DTC_FLAGS_k3-j784s4-evm += -@
-DTC_FLAGS_k3-j742s2-evm += -@
+DTC_FLAGS := -@
-- 
2.39.2


