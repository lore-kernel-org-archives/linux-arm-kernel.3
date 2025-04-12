Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40310C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnT9MxsvWv9TvC83CCl7GaR17zDfazPzlImDwFTNB2o=; b=dS6bRm7L99f3dgDJ4QFjEfnfS8
	cTYkeGSDt/WFl4UvxWEs3B9fHoaOB73GKed8bYGoK2SACIUpsKdBYb9+oY+BxGaKZNVbHYeeNUUkM
	ARzXGQdA3z+duN+9dPdvzxfUso9WjONC2Paem0/bPuxbexeSes8b6Lbr4bhe2JDETnJJhdAgFJKFu
	jZ4XFJ1UWw/s/b/7Dhh0UQ5P9U8cRk//R1XMGRAdq7PH2dR8Re37SZHWLHmk/3Ezt3YJg108zhjqd
	dHthuPvpKYnJvl09W1WmjXF5an3xtizelQkaK875MElLoFrX5uicfuIUDQz2/AMGlRr/sI3PmXjTm
	BmrSgpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TQf-0000000FTXy-1qwE;
	Sat, 12 Apr 2025 05:29:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TOo-0000000FTBE-303f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 05:27:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RKKY1613848
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435640;
	bh=CnT9MxsvWv9TvC83CCl7GaR17zDfazPzlImDwFTNB2o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FIfi1hs//YjW5MazA8AL9XWEoD91VS6UPS+9dgAyko2qpt6Wgy8PqFwxa9my2CkXs
	 gSJVD9c8QY4FCpziuhGDKc7phND5GlMMl/Inmc/G9bb4h9NtZrTLrS5x10k39bx1fb
	 qWLQJhiZJf6IM603/GjuamhcTYQdbsL3pUkcuLAE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RKOR006750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:20 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVS121011;
	Sat, 12 Apr 2025 00:27:17 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
Date: Sat, 12 Apr 2025 10:57:11 +0530
Message-ID: <20250412052712.927626-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_222726_910383_A79DC860 
X-CRM114-Status: GOOD (  11.16  )
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
---

Hello,

This patch depends on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
as indicated in the cover-letter.

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


