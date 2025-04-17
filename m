Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A2AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fDmzne7+xTc8To/XJ2g3KJqulYJmb1DMD0eRayD9sOA=; b=upI2TJ72avXw89LloxZMCOVbjs
	+Jvkw8pcRip0IsruQNpUdoTKECV8zBbwqxwXS6D07+eNX5t7D6WRJqmsb4EDXUDX9q7fmd5ndqrA7
	na8WS4GTWjptOoP64dqImhNrCANYRFOCLaRsWctFNYeDGywiLu14Jp3qAyrHmo44yJuvgjskbq/2J
	audZQ7wRmmSiCYzLLWyIEkZ1DHsOXHXKk9oZj7W7QSFCSWDfwqbf3i3R6zIJBxvtXmmY6K7mtHCJm
	MefrDe0WCgdDJg+3ZI4VlTLrGO610WlaORk8zW5STCDP5A88SakXXOxDIr7bsP2r1x4FfAXUzk7mw
	J9weaZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LGA-0000000COOq-1sWF;
	Thu, 17 Apr 2025 09:10:14 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kvr-0000000CKbV-2g7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:49:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H8n9wE585312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 03:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744879749;
	bh=fDmzne7+xTc8To/XJ2g3KJqulYJmb1DMD0eRayD9sOA=;
	h=From:To:CC:Subject:Date;
	b=BQ+wC7FcKGIUtIX4J0WfiJtmZ9CCnlta4k14Nap1Bn3AnvG7MjYG+Yj7Kqst7WgBB
	 efBoRNcQM71xHjrMSepivZCShTVNPzluKlqmEU8xjPB0VaKDhieHZLg+NWzemAfFHE
	 4zpbVkI3x35gvn0YIhj23FO77NkXxJi73SzhOxu4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H8n9tf081642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 03:49:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 03:49:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 03:49:08 -0500
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-185.dhcp.ti.com [10.24.69.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H8n6LK046219;
	Thu, 17 Apr 2025 03:49:06 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <bb@ti.com>
Subject: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Date: Thu, 17 Apr 2025 14:19:03 +0530
Message-ID: <20250417084904.2869369-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014915_722567_FB89BCFA 
X-CRM114-Status: UNSURE (   9.30  )
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

Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
kernel.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 704039eb3c07..d716be113c84 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -43,6 +43,7 @@
 #define JTAG_ID_PARTNO_AM62AX		0xBB8D
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
+#define JTAG_ID_PARTNO_AM62LX		0xBBA7
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -58,6 +59,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62AX, "AM62AX" },
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
+	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
 };
 
 static const char * const j721e_rev_string_map[] = {
-- 
2.49.0


