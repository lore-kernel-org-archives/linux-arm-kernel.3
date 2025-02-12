Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMUjaEjJEv8Fp6KTvvVQCD916I1txak6eBFZLlKuOe0=; b=tSQekYsxMnZmJQ00z5kXEyr1TB
	3KbDKV89y9X83d+KQcrUhTMaVwuh8eU+MI3pCP3VHG4Hs9L9oAoHk7LsvtrdyU9Nc8hL/5yhwVI4S
	Pqf/3+1BEBKhqvlsV0qEfuxnT768kqjpBk6sv5NRF5Jd9Po1DscnCvbffXRDp+BHgn3VNuj7x2J34
	7xLmPRB9T7iq1zXAuNR2YCjmINUW2XwWU5rBka29anNZOzSMcbIhjk4ORz39PmqW2Sc4DreGPneaP
	BIC1brFs5dPf+uojwqXHIYtzA4mrBSqpEGkBkRQLW4SOSR94NMKSWPzaMl1r1IxTpE1A1ycNKaDJo
	PoW8q0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJxU-00000008roa-0qiB;
	Wed, 12 Feb 2025 21:07:48 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJw2-00000008ra8-34ae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:06:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CL65Zg3977713
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 15:06:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739394366;
	bh=mMUjaEjJEv8Fp6KTvvVQCD916I1txak6eBFZLlKuOe0=;
	h=From:To:CC:Subject:Date;
	b=DIx/C20G074mRXZ+qV/OZZRuX2jeIExXkklKAsWxLVoIm9fZLiPY/cEcD4syaxae/
	 e5EUiBaKZRUWSRRNZZG1cvOKkumqTB0DJD5Yq8sM76q3JlCm3bQaL9qRxGn4hRVgwN
	 kBhFQCiVubjIIU1ir0QGrIq/XX93H22KeENI5Juw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CL65lY129213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 15:06:05 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 15:06:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 15:06:04 -0600
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CL64Sc099103;
	Wed, 12 Feb 2025 15:06:04 -0600
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <d-gole@ti.com>, <msp@baylibre.com>, <khilman@baylibre.com>,
        <k-willis@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
Date: Wed, 12 Feb 2025 15:06:04 -0600
Message-ID: <20250212210604.745175-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_130618_914034_BF348097 
X-CRM114-Status: GOOD (  10.83  )
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

From: Vibhore Vardhan <vibhore@ti.com>

Adds alias for SoC RTC so that it gets assigned rtc0. PMIC node is
assisgned rtc1 so that PMIC RTC gets probed as rtc1. This makes it
consistent for testing rtcwake with other AM62 devices where rtc0
is SoC RTC.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
[k-willis@ti.com: Reworded commit message]
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Tested with rtcwake on AM62A.

Original patch for AM62A existed in the TI Vendor tree with Vibhore's
authorship:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.6.y&id=f745d9063212d1088dcfb068ecb4b16648b96487
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8..51ea961f166e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -22,6 +22,8 @@ aliases {
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
+		rtc0 = &wkup_rtc0;
+		rtc1 = &tps659312;
 	};
 
 	chosen {

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1


