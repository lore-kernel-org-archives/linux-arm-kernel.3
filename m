Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D37CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yfW6NnAc+YqJbw3pkggnHrxvyuQfI1HfG4W55w/utU=; b=joedY/KUuu2AxAbd/zwBMAlH3J
	Dah/0JL5zmGnOclJwTHSNQpmoHsUcCDZwqUWSYjmwvJG9AMYT3VHWxxUqYwjaX2uWGT8wROkfJovW
	UjYcpSUyFICLel4CQcvjOc1Sl2OfLOU+oBCxvDgMgBI807ERv0tj5PDQUGyBaIpf7Ny5XdiI06PwH
	ijRXqeNS0ARiopNZrSKyGqXrbU3Q/b3idScwmruBFrhmOjdZW6eI6wPF1IgkwpOaCB6mZZkFdd+TK
	gBK0mYuk8Cll8xcPo32O1kTDSAJ4dAPa+9dNNimByKmu3tXjEyhT3FXwnR71Y8ez8J87SCgzrFqpt
	BrCIjAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUx-00000001VWN-2jEE;
	Mon, 08 Sep 2025 18:21:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvctT-000000007Te-4AuC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:30:57 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588EUrSv3883569;
	Mon, 8 Sep 2025 09:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341853;
	bh=6yfW6NnAc+YqJbw3pkggnHrxvyuQfI1HfG4W55w/utU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VgJDWexs5TCSi2xCi78BGSbNc16DPKsxFy+95pNuqhN1EBVi/LExntNW5DUhv8Ga1
	 pQLi+nIZRtNCca2154n85EdY6HcpJ8zjA2c/P6RY5MtmGpVmv2fGneFVMJ3sVTNOBZ
	 PJTNZRRL/ON7r3BaR6n9yxfk0Sro7/NXgOHtLZYg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588EUrOR3065013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:30:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:30:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:30:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESed11037553;
	Mon, 8 Sep 2025 09:30:48 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH v4 23/34] arm64: dts: ti: k3-j721e-beagleboneai64: Switch MAIN R5F clusters to Split-mode
Date: Mon, 8 Sep 2025 19:58:15 +0530
Message-ID: <20250908142826.1828676-24-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073056_120044_9CB8B43F 
X-CRM114-Status: GOOD (  10.32  )
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

Switch the MAIN domain R5F clusters into split mode to maximize the
number of R5F processors. The TI IPC firmware for the split processors
is already available public. This config aligns with other J721E boards
and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Robert Nelson <robertcnelson@gmail.com>
Requesting for review/test of this patch.

v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-23-b-padhi@ti.com/

v3: Changelog:
1. None

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-23-b-padhi@ti.com/

v2: Changelog:
1. Split patch from [PATCH 06/33] to [PATCH v2 13/33] and [PATCH v2 22/33].
This patch switches the Main domain R5Fs into split mode.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-7-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 92f5e4a14a49..3a7813c8770f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -985,6 +985,7 @@ &mcu_r5fss0_core1 {
 };
 
 &main_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
@@ -1003,6 +1004,7 @@ &main_r5fss0_core1 {
 };
 
 &main_r5fss1 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
-- 
2.34.1


