Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CA0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KLZVzB5gguW5ckbJFT4MWRxu9RwecJodm2oeC+LPCy4=; b=SHHMo552KmK90myIrLPpT63k6z
	slFm5NZrGDyH/6Inm/eiSv2ot6iLgNwGrjupOxLgIRzt7GwAQTM96RFvtMyDZ+PlM9/3C12rROeqo
	675eQvFi08KB6HzfhfJL5/w2rGFQqAtn1Mgx42FrICUFsHRMpY1o9y/m6Pm+YzXDjWVc6cXd9b5+R
	2jgxt9cQP7nu6eCNSpGlCUsNAcCMFJnMcIkhWyyCmOM/avhj4akYrTNWIqEx1i6pAbCwLFnr5mn3k
	yNvW2F5i/KfxRpIxUQS+uknFWfuCIznA0sh5plPKCTPfFMVEGUXKLm+s3FewtSw7DibRuRUbTNMy2
	78TQg1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1JM-00000004IPO-1SAe;
	Thu, 07 May 2026 16:10:52 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1JJ-00000004IOX-2Kfj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiDSF6Igoufrz7IOwMUxSypQSxyfzAnVHpYL+HVfxYdx6hRCUjSeyVcUtBKtFGO8S8p3Ta59IqNY6oaGJSPJAD7kMu7cxubYV4+vm2HZHpZQh+BfXVQa95hjTD2vFGvqNKcmcknI+KwInf1t7Ge+hfcEsGg0U8Ln5B6cHgO3wOoZAQ8toV+YpxNhHuVFkKSYct5FeVPxldqe6fFlzk6ox2C10n0Euwetl719qkil98KKG8MwcJJYrJVVaoNmrMhdbD5yWk9rPSr8QdrfRE74vu1WqIZypzsSb6Fw3UWwK6Nre2WGIFixpLu3/+gBSkEf/XqMZSi3pPlXhMQLecuf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLZVzB5gguW5ckbJFT4MWRxu9RwecJodm2oeC+LPCy4=;
 b=tZhUebFspPfKSv5KkUfHpny2mCioGxAKeEGJhSKV7aLmQJCPR/wDNyzs2xM/NL6BWRu+gbrVerNucP1XNeZka4EZk+DwAgj2aqBf3ARF4NdjyKD/Vc/IboAA1susZKvAhjXxoNa2gUV0skRIS3Yw+YCZT4SRAHys64ZFdpsLTEZj2oOlY0Kmt+CcYm4/c/C91CVZpxIA7HeUkuvoA5B+h5CcwF0y1xPKv3/WrzSjrYhD3kvDpYi/gFVcxaIyjoc3xWEeWHlD0g0zLWJsIR9Lj0aoS59+xEWdnaf6t9ILwaGDmVIPBiGU8mF3FTHQyAN+qTB3U/KvhqCAOBVjvyz6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLZVzB5gguW5ckbJFT4MWRxu9RwecJodm2oeC+LPCy4=;
 b=So6X3dxgNTz/uDN68flgqrMe3MUFZvelRsYkrCMSl7Gzs3ng/MCYSf0dm+WWeH4CHfjfRwGYGPuNWKoFHcqieTDzA6dCpihKxucctNzjFVXB9mpY4znUcskEpY73e3mipjYatNpEy37/lVc00Y4+KfbZ6ANf8ZO/LPCEiJI7Pe8=
Received: from BY5PR20CA0001.namprd20.prod.outlook.com (2603:10b6:a03:1f4::14)
 by SA1PR10MB5782.namprd10.prod.outlook.com (2603:10b6:806:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:09:40 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::66) by BY5PR20CA0001.outlook.office365.com
 (2603:10b6:a03:1f4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 16:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 16:09:39 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 11:09:38 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 11:09:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 11:09:38 -0500
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647G9cRb3985466;
	Thu, 7 May 2026 11:09:38 -0500
From: <a-christidis@ti.com>
Date: Thu, 7 May 2026 11:09:34 -0500
Subject: [PATCH v2] clk: keystone: don't cache clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
X-B4-Tracking: v=1; b=H4sIAD25/GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3eScbN3i5ExdQ3PTNGNLi9TklGQDJaDqgqLUtMwKsEnRsbW1AGL
 P1GxZAAAA
X-Change-ID: 20260507-clk-sci-175f398ecdc0
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Michael Walle <mwalle@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Randolph Sapp <rs@ti.com>, Antonios Christidis
	<a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778170178; l=2038;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=nzZb5KX8QE7F8wiJTbfv2Zd+erQgyqYICWcP56uq61k=;
 b=GwDDsHAvoeIkISSuSV1nBCF5AT6G9bTi9bR9xaItKrHnLZ5ILWRDbRfAEDVbxTH0iwT89YyuN
 sffdFRcW1RqCKI2g+aeEfMPqre4hOcg3p0ZGzjnRL9unEGZYwqfpkdr
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SA1PR10MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c0e9e-a475-40c6-3f05-08deac530ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sYcQqg6wozXSQ7CHOGS9luwvA99TUAiZxyayN0Yq0/P0wJWkXQizEMMlfasuJkW0VZEdrGVAXYHkGL22I8v3A00CbnXlTtmbL6Q1czBlU7mCGvcB21LKNr4FWwAfI3RsbG2+z7KXFZqhvRGcJvzDvAclLxKacM4QynzvatbzNLQo1wUazajbJyUD9z2L9yKBtnVyY/QM0Va0o6ohNX/Hh7C02aAsQ2WdNXso/0WU0VdG7SZJNxn0zLwIa1YHYB1V8GWI5WYoGQDIIFFezkYTcG/tuf5gNtrYc00Kom3fKanhUgjtWb5sONuc8Ql/9Dh41kZCbp2E0TkBv8dfW0Ox4EsXbSZkJ4UwNLDciKf9HKgoMtUaTUMSqYAjrw3Q9+T3fv+WSURWfONuVrDmIiR256fmGWmxGrdf58hgJXkSoss6qKq3rYKmX2v7U8XMFEXhnB5mu1+UzyTcKsW8YRaaWATJdSFr6GuH8KoAhT44D8j+dBIaecp9ikV+U3aed5in/GpzHoHLGa96oUGbegGmApL9VlkeAMfmQws3BPRQwzplOQkk6RucHt8avl/jInLggw1eTZBG0ONDknWBuc+1sfUORT3j3YNEVEFD7voOib9+uzOTou0JxdgsHQGCVYP5St1hlSFEixlWFdfKcWbOb/F94UcKT7I3p9C+sL42SIauUr+0mkp6Kh4l0cSJuxKksHg0of4LylcUciaVabSMQGRHx8lorBOLctimJfIqaq8=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /aA2bZB7DA4NGc87mqGm9V3lIh+lmZh9+G0VFhVl3+LjnnUEAz9qWEpP1pAaJ/2wUErH3fvGTkyQ6w2ovrmVfNW63eYnmt+OyVQwzu/XMXpOxyzZWISUqgytE2HfKRb2F+uaiC7WoEe2tPmPnHYh8GferTQ76y3XwJFwFUg6jtuOt5uO9Cj06y+7jxfnUXNMeUAZo5LlhL3xwsEgjYDaYIL8ca+nucGEGRlFEQYU+mxAfjiQiPMfwNFzvN1NTRdA3teFGleI/Lf0/64I2uOELm+yXyIwWQJxfC8ipwUdj5Ivp8bwwMy5buVgeKTl5xxPRRW0hM/vTL+sq1/hZ9JYFjbK+ZKC3e/uLoRQGgr/wjKh9v7SjmuRM/LVeuhBLqmZfJYdGIu13G6mq6mZqxrpLzT6DRfMBqRjikSw+5ktpZQzJMn3+SANZ3s9ZJnk4+cP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:09:39.3903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c0e9e-a475-40c6-3f05-08deac530ab7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_091050_047907_F013F596 
X-CRM114-Status: GOOD (  12.63  )
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

From: Michael Walle <mwalle@kernel.org>

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Randolph Sapp <rs@ti.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Resent as part of series [1], separated from series per reviewer feedback [2]
- Original patch was sent here [3]
    
[1]: https://lore.kernel.org/all/20260224-gpu_dts-v1-5-cc5ddffe140c@ti.com/
[2]: https://lore.kernel.org/all/20260225010507.flvt775fs5kfe7ez@unknotted/
[3]: https://lore.kernel.org/all/20260109120728.2wku6akxof2ddn4h@tastiness/
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..0a1565fdbb3b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 
 	init.ops = &sci_clk_ops;
 	init.num_parents = sci_clk->num_parents;
+
+	/*
+	 * A clock rate query to the SCI firmware will return 0 if either the
+	 * clock itself is disabled or the attached device/consumer is disabled.
+	 * This makes it inherently unsuitable for the caching of the clk
+	 * framework.
+	 */
+	init.flags = CLK_GET_RATE_NOCACHE;
 	sci_clk->hw.init = &init;
 
 	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);

---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260507-clk-sci-175f398ecdc0

Best regards,
-- 
Antonios Christidis <a-christidis@ti.com>


