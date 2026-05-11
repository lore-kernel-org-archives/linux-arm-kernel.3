Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E5CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gmBNcFXL4SEZ0SStYLpRW1m4H7oxUGUfa1bhU/oNHVk=; b=3/VX6bGJP8wrTZzrq4JVUn5P6K
	RmwlA3JwneddB61AdOcuaLZvvunNQXbhINLOv58AWly1Jj96urejot+Gp8DwfHsikstEv8auK+odl
	Udg/NRV5CjEc9PLZqSOKySWRcTNNz8DH+2Tv430J+BBXSbA4Ru2xTLMlWIVMjQn5SA4AmHLqrr17w
	uczkMdWdPM8VN9GrlD5NWDbmQ5ElqcQiATd3yUjmT836UUKh9AWQ+ZEhrzXEO3eFskkz6wvwiTW6c
	cMkoZNA5BWF3zluwpH3y3QxPtozeBd56HSt35Q/udMcanTiwnsQ/qURhrOfG7UCdpCKNuAN2YvEBW
	i1buuRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXsS-0000000EmJU-3FUx;
	Mon, 11 May 2026 21:09:24 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXsQ-0000000EmIw-2YyU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778533762; x=1810069762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gmBNcFXL4SEZ0SStYLpRW1m4H7oxUGUfa1bhU/oNHVk=;
  b=O4fZ4EtrZBqK6OLQDBDJjnknriBuUgcCD1XL+hqRLWyaeApRM0f8vISQ
   x4WfPE24B4R8k7KOdJT4bNtMwlOUbi4eDm2m69MAdg7W6f4dUszCNS81D
   zNAw6RJZ2PolOYTpK5yLlkPrz9Gqt8/luvp5dccHtkggP7IaXMNGXR97K
   qJhwNkn+0eQLKmfYMdLTUioFZo9XjiD/IpNCX7x/kOMx+/rPkHdaOWq8C
   Cxmi86oKjj2Q10mH1gY2EIMsnFb3vd5r/Hm6/VvbmFccNimH8EuF1wlnO
   S1g0dGIKscNT9OXOgly6pLPh7ttsvISP3FtACJ7V11WTWcnmJzhMm7eGM
   w==;
X-CSE-ConnectionGUID: 0zVo/EuXTmWAseOu5UCThQ==
X-CSE-MsgGUID: 8gfJTadJQ9OgyYyQ9whUCw==
X-IronPort-AV: E=Sophos;i="6.23,229,1770595200"; 
   d="scan'208";a="18904877"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 21:09:19 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:19334]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.175:2525] with esmtp (Farcaster)
 id 57478e7e-fe0b-4b36-a475-490afc8c63da; Mon, 11 May 2026 21:09:19 +0000 (UTC)
X-Farcaster-Flow-ID: 57478e7e-fe0b-4b36-a475-490afc8c63da
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 11 May 2026 21:09:19 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 11 May 2026
 21:09:17 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <aghayev@amazon.com>, <juew@amazon.com>,
	Saurav Sachidanand <sauravsc@amazon.com>
Subject: [PATCH 2/3] perf/arm_cspmu: nvidia: handle empty resource list in PCIE-TGT init
Date: Mon, 11 May 2026 21:09:04 +0000
Message-ID: <20260511210905.91917-1-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_140922_696727_0FCAB463 
X-CRM114-Status: GOOD (  12.39  )
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

When acpi_dev_get_memory_resources() returns success but the resource
list is empty (rentry is NULL), addr_filter_reg remains NULL from
devm_kzalloc. Since IS_ERR(NULL) is false, the function proceeds
without error and later dereferences the NULL pointer in
pcie_tgt_pmu_config_addr_filter().

Set addr_filter_reg to ERR_PTR(-ENODEV) when the resource list is
empty so the existing IS_ERR check catches it.

Fixes: 3dd73022306b ("perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index bac83e424d6dc..bae722e263e91 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -555,14 +555,16 @@ static int pcie_tgt_init_data(struct arm_cspmu *cspmu)
 
 	rentry = list_first_entry_or_null(
 		&resource_list, struct resource_entry, node);
-	if (rentry) {
+	if (rentry)
 		data->addr_filter_reg = devm_ioremap_resource(dev, rentry->res);
-		ret = 0;
-	}
+	else
+		data->addr_filter_reg = ERR_PTR(-ENODEV);
 
 	if (IS_ERR(data->addr_filter_reg)) {
 		dev_err(dev, "failed to get address filter resource\n");
 		ret = PTR_ERR(data->addr_filter_reg);
+	} else {
+		ret = 0;
 	}
 
 	acpi_dev_free_resource_list(&resource_list);
-- 
2.47.3


