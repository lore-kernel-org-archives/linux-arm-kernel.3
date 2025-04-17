Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1728BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBl3TCu3gksd6v/dkukzfiaNZG7cMAnJ/y7g/B6EaEg=; b=pCfNlcSlXwsBZM3DDxbRqq2qGu
	PNiiH9tDF6ddsqFdytYFN4z+JNRFNbWuM2DplI2emzVpWKfSB3oLwnta8izVD8yMOoLgsVMyCSeTz
	WNHYY+jQ8IpDcdZBMVablkSHmOi/Fjiud7yyHGf4Bm4KMudvMw54ivhDivs30qqYSXHmX3dIl6UJg
	HVQ6VxEMDYdL+D+AhlIUZBL0oJGcaqV8eyc/iLpIwZYwobxGqEcSdTcf0QJmdxkVTMEhZemFyw1Q9
	DB/6VcVE74okt1jnS3jH30A1jNzSEaSyz7BGffRt+mo17ecwui/rJGILpYbbOsTJFBEwHojeUKZZB
	FrzutZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OW0-0000000D0lk-3G23;
	Thu, 17 Apr 2025 12:38:48 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OQU-0000000Cy3k-2jFi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:33:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCX3Ql691249
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893183;
	bh=YBl3TCu3gksd6v/dkukzfiaNZG7cMAnJ/y7g/B6EaEg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FvbcK3Zhgv+5kAV0xygXIadBex/l1m5RHWJVKNpggspuwgK5y/oRaenVZvRCpZIOA
	 JXl5Uad3L0c8fbq0XooF1J2r+woMlaA8De9bYj0RmLVVNt0RJrWNLyLybh3B3nOc+E
	 BGkkra4XTd+i+8EisG+F6FJ08/HjVdUNKT2NwznA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCX3mt094189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:33:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:33:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:33:03 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCWkMR038275;
	Thu, 17 Apr 2025 07:32:59 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 3/4] arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
Date: Thu, 17 Apr 2025 18:02:45 +0530
Message-ID: <20250417123246.2733923-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417123246.2733923-1-s-vadapalli@ti.com>
References: <20250417123246.2733923-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053306_779315_F5532528 
X-CRM114-Status: GOOD (  10.66  )
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

Since serdes0 and serdes1 are the child nodes of serdes_wiz0 and
serdes_wiz1 respectively, and, given that serdes_wiz0 and serdes_wiz1
are already disabled, it is not necessary to disable serdes0 and serdes1.

Moreover, having serdes_wiz0/serdes_wiz1 enabled and serdes0/serdes1
disabled is not a working configuration.

Hence, remove 'status = "disabled"' from the serdes0 and serdes1 nodes.

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---

This patch doesn't have a v2 and has been newly introduced in this
series.

v1 of this patch is at:
https://lore.kernel.org/r/20250412052712.927626-2-s-vadapalli@ti.com/
Changes since v1:
- Collected Reviewed-by tags from Udit Kumar <u-kumar1@ti.com>.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index beda9e40e931..562dfbdf449d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -52,8 +52,6 @@ serdes0: serdes@f000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#clock-cells = <1>;
-
-			status = "disabled"; /* Needs lane config */
 		};
 	};
 
@@ -92,8 +90,6 @@ serdes1: serdes@f010000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#clock-cells = <1>;
-
-			status = "disabled"; /* Needs lane config */
 		};
 	};
 
-- 
2.34.1


