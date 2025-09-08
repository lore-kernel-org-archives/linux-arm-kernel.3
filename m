Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D469FCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XbuHFsOvA66sjk/Cm+9qrr4i3NfWmWgnU0tnmjhfxdk=; b=hmhro1tqduNJZAHqBuHql2E/Yz
	zgfgoqO3rGGWREF6sqU8zkGLsCZe2CvlRtVWJJRtmUjIN5UonV+rSZVSRaU42j2gnR3lsja7P4C40
	Uavv37sf61TBe+6SdF+a1HS1jxHwdhScwlDykn1nyH7III/dTHvX+TI1y11DMfCvqcbFVhmxZg+9Y
	1PC/dejW0orAA+/QShr6sS7cObQtDcCJC5CoCxH3Bz8M0AXGMGOI6LugjAmSWSvE6opSD4kP9kckL
	kDL5cjdZ8N1zk4I4gRH+fYMk0fGOXaEvviJabXpq3kDBYDtJaP6IxZjSf5S68XUOlEyMkABgwhLRT
	079YEPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBP-00000004oV8-3xrl;
	Tue, 09 Sep 2025 06:50:28 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhL3-00000001pBa-1QSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:15:42 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588JFXRr118736;
	Mon, 8 Sep 2025 14:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757358933;
	bh=XbuHFsOvA66sjk/Cm+9qrr4i3NfWmWgnU0tnmjhfxdk=;
	h=From:Date:Subject:To:CC;
	b=UUD/ajQqhmJG1AonVXN2n20H64B3c2WRVekpTrMjNO09PLAKHMM1V3WWLEiEtBBXy
	 aRwT9o++ssDU1GbYFt4nLpuEoi2+JSyEG8ivgVuP7j49EE1co015VTRYVSrg+dWK3m
	 WimN9Rcb2unflJ/XLulUCBPZ1a7jJRPFk98pPKWw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588JFXjq3170991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 14:15:33 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 14:15:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 14:15:32 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588JFWqI1096033;
	Mon, 8 Sep 2025 14:15:32 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Mon, 8 Sep 2025 14:15:28 -0500
Subject: [PATCH] soc: ti: k3-socinfo: add information for AM62L SR1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250908-62l-chipid-v1-1-9c7194148140@ti.com>
X-B4-Tracking: v=1; b=H4sIAE8rv2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMLXTOjHN3kjMyCzBTdFONkI1Nzw1QzUwtzJaCGgqLUtMwKsGHRsbW
 1AG/rREdcAAAA
X-Change-ID: 20250908-62l-chipid-d3c2571e6587
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=bb@ti.com;
 h=from:subject:message-id; bh=YPKZOl89AJQZwlz1VpSwOMG/7dUSS4j86kNPIqkOXN0=;
 b=owNCWmg5MUFZJlNZol4ITgAAZv///7/fp//+jJ7+N8ks/d5v5h9+/37fnttz9c4///L99m6wA
 RsYHaQAA9QGgaAAAeoAwgAAaAAAZABoAAeoB6jQZAGR6RpkNohppmpjaoZQaaA00NBo00aMmmQA
 BpkAAHpAAbSGg0ZGaRoNqA00AGgGTIANA9QPSA9IyHJhGmTI0GIABo0GmTTQ0A0A0ANABoYjaTI
 YCGEaA0AaNNMmTQAAaBoyaYGDVIkjYQJ0YHhWwAyHz9MrLiM4nIVlQK47mGi4kES9uTnBpOt7FA
 ThHAlYADzB4TLvP2yK/PgMCZr2zS1W/iozJzIoYbHtLscQqtQjjHUhNcxZ3mLygG20Prp94gMeB
 Tq6gM8RfabUy4QL1XvXQh+W3koRLg3Dfxl1QAIR00jUmM4E3U8bVjNphFSXKWrwdtLMOv96JPgi
 47u3cEMsFiYg3C0iVwKWK6YrVpoq5XVnBi+/PGGfYNwtlEVTjMN86pfMYfaWoUctQ8hkdExUpRz
 ie8DD/FQpBdaqTfqRzsgnc1gqB0rIVmnLqFvrWiKz9mN5qy1ezhtbPOoWk2gEWGNifYHHXU+uJi
 RTFMiQgLy1iCpPhWhsQg9O+RPtPYqRAiXvIQKgwSjZYB6+MzB27FkzUiGzTNFwF3uUUAI32AWA2
 5z/F3JFOFCQol4ITg==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_121541_564530_B7487B0A 
X-CRM114-Status: GOOD (  10.04  )
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

The second silicon revision for the AM62L was mainly a ROM revision
and therefore this silicon revision is labeled SR1.1

Add a new decode array to properly identify this revision as SR1.1

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index d716be113c84f1b87a2547f9292a5a7138c00f3f..50c170a995f90bb7d153f7a54c9d321de783622b 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -66,6 +66,10 @@ static const char * const j721e_rev_string_map[] = {
 	"1.0", "1.1", "2.0",
 };
 
+static const char * const am62lx_rev_string_map[] = {
+	"1.0", "1.1",
+};
+
 static int
 k3_chipinfo_partno_to_names(unsigned int partno,
 			    struct soc_device_attribute *soc_dev_attr)
@@ -92,6 +96,12 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
 						   j721e_rev_string_map[variant]);
 		break;
+	case JTAG_ID_PARTNO_AM62LX:
+		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
+			goto err_unknown_variant;
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
+						   am62lx_rev_string_map[variant]);
+		break;
 	default:
 		variant++;
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250908-62l-chipid-d3c2571e6587

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


