Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA830C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jROOVHqsYj0KwYdsXYghawK7bLIe6102ZbnE+qGq5iA=; b=pWcgz9ZFcp6T6ilyEEzNf/xcIh
	bMF3dIW77yG6S7jVQs0xnlz2IThg+mwspK88jmTEcQZoJYaWMy816JdYEhLB0T07PYMomydHxg309
	opX4GVDakvWC/MNztFHmovSx1jUBfTYxi29vQhDMRXOt0fi5WyBEKE6hCZtETpWYFgtxAZ7J7M6Ve
	H1F4IHXQL3E9HlDiY5jN81emzq7JMXC8l73rV1wbwn10NZXUyX0kQTqzC42qYe2DqsbrDZ8+c005F
	wjsjLEDvA2HXcQ6DTj/bODE53DzkEYimzkKGI/zF+CJ7IX+6fbL/ACVQkHwrJQGrlm2IseVXzfvmS
	bfrJ8iCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x957s-00000006Hm7-021o;
	Tue, 22 Sep 2026 18:21:56 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x957o-00000006Hlf-2QM7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1ECQKvFFgmh3vhbc1677Kn238loASFaz17MW9GCSN1ttXcTwVQUO44Jl019OkVFxFvaBwo7/WKMw/YSyDnPQioMdVad27vzAHblg4WHBJuhV2O5NCrwz38DGCrYDSQgq5Jutt7sv5EH3HJ612rqeTn0WphLjwKA6lrAMl1KPWzDDBvarvDkY9B7a9cAsa00ep0iW+6lqx62SSGjOmr+RDzYckEOAgzcknVl/sEmbaTQ4s3z1uRVcmikkxM4LoC0duffq3//LnQvW6zvIR2M2kALfzJBX1g889KbPpf+MvekzfPEFLLbQgIZkzQr7kLvHTi8zmLnju7ocfvgG1k02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jROOVHqsYj0KwYdsXYghawK7bLIe6102ZbnE+qGq5iA=;
 b=HgLyNiiVCKNoJm/XVI1GuFyNOyc99SaGLaJkBd3ZB0guZjQ8fKaTaMwCxx+LYVzw7mb2aQPdwnOyB243ahJ8K/e2+u5ogY1M9DK7qyN7g/81EQuPz8sBn+JzGYxJliqMlK85PdUkCRYRDago6eLIcvYkb7eRKwVYG4BXjDAdk5S9jwKQGIpsFgfXporKyU0Nkf/c2MQEvHEpOtpUDD4969dyz59M6YN9lsodOmdz6VRM4jJH6Jav2uc1fA46AcnzZOOcKpQogTxiE2706ENTmqO0T8at5Dmh4cptQgzMTY412pdj5PBICDAIo10X2oitjjBYpR6N75Sa9CgkAbx4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jROOVHqsYj0KwYdsXYghawK7bLIe6102ZbnE+qGq5iA=;
 b=tCKBgGf/WinyT/r4h1Rp1jVIvoxrY+0VoZqQK5neGvk4wlB7XM+9VfUWLsY8pkc31EvqG/g/uTw3PAIvvsyVSnNOg1NgkzyEQB4cfRsY1Ug4xgJ0YxL7zuloVagSx4WzMNLvyea3V+rFWsXwLnRRRVcazZSK0gF+BgHOU9kI7I8=
Received: from PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::26)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 18:21:46 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:510:32c:cafe::ad) by PH7P220CA0085.outlook.office365.com
 (2603:10b6:510:32c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 18:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 18:21:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 13:21:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 13:21:45 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 13:21:43 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/3] usb: dwc3: xilinx: error path and teardown fixes
Date: Tue, 22 Sep 2026 23:51:22 +0530
Message-ID: <20260922182125.11067-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c3a4a3-8c2a-49d3-a2c8-08df18d65ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|5023799004|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 7lnA+oZ+vEkjITLqqXCdoYlr6VHuHmsjlnCz+Gy4jpW4o6rdRaHWsKZ5A7hFLLa0tdIegO4GTRKn2LuTyptuESwI0+6ZS5l9sjGwgteNxjq2WOuMThrhlY8OBX11OTZGyt+4ii+evze4uL6btyGw29tWPXpjs5nxIMoZHHQ8+9TuOGwnqFrDJciMODsmcnXFHRzGrGSuL/qUu1zYeiSOXZfG7ZpUpzByhPz9WXk7JdHI0ECHhtAtzKmPh65zq/qle8B9Ip6IRi1xc0UHdn6R9YH+tOTrjhISfH3kmEZKLWfEujd3+4/isbod35NYuHbjdC8ouZ/u20vNxwCkDLn+sSNx0/3KMob9X62oPEl6e9Zt2XcYDKneELQ1vJRLi7X1jWgOS1uUIWZjHCHjDWTxzqu8GFR7Pq1Araq6BB7PUCs2mbhV7PkWbwR3fw0mR61pVyK+xQiNstJgIUTDgciXMZCiYCfDcJjYIVnu6vHbBB13/PISQ7mdCG2H7DQ9KADNcR0tOSvD/km1UN/n9zZWCll0k1NvqRILJ4zdAEZku1SN6QqChEjXsphZDT4EP/edcApBR8R0ugkubRJ2fWwq3VIxKepjZ7qMkI/XHi06tAfS1nW4ST+viC4NU0MN1WtSSN37H8lf/jLv3yC5CxopTX1+sqFVoX5/XRQoUjB4yEDahnVvzzo9ZpmjIe3o+/Q3lMdNVR/MNw7pmSLdY3kt/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PhCBOkpXuYyO+/UyXUCd2DY+K9YXaxqXZ/iRBahiWlHNFHydWzKwM/jNeW2UI2rN6mlKCkmNl4Xw3eeLuQJIWiH40FkOFWXrDeyimEpOHRHQWIKv3dSKdfKHjH4xT8pcTDWI/wrNsOsDD+XyVtumfYp/Tsygndd/3eAP7w2NJ80EFwrwSuCog4fmAqRpNCM+IXRkHQ4+6JD6smhxrQLDSkBu12PT2CeFI9L7Wz3FAQqM7pWNxSu8cTX+IPdQlGE+hl8+A4SEa2a1Zp2KjWMi4VSnEVnAaUgJluDbxxqjvH6jat8Vr0BXqHQnjQgzJIwI4D+N5fhJb5unCAZxMF0CZMDzwUzpoFGlnJoBmOgQ+N9Fy0zjpDa0tXK1CKD4JQxJC5eFV2DkS7FSpRFYlmV6NpGyFcY5Gyp2hrNwQ71Ui/UumeyHJixnXSnm1K6hocPd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:21:46.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c3a4a3-8c2a-49d3-a2c8-08df18d65ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_112152_625079_86B0F6D3 
X-CRM114-Status: GOOD (  11.18  )
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

The ZynqMP path in dwc3-xilinx deasserts three resets and initialises the
USB3 PHY, but nothing unwinds that state when a later probe step fails,
and nothing unwinds it on remove either.  System suspend and resume have
the same problem: suspend calls phy_exit() without powering the PHY off
and ignores the result, and resume can leave clocks enabled if PHY
reinitialisation fails.

These three patches make each of those paths release what it acquired.

v1 [1] sent them together with two platform-data cleanups.  Per review
feedback they are now split out so the fixes come first and can be
backported on their own; the cleanups follow in a separate series against
usb-next.

Patch 3 was reworked for that split.  In v1 it registered the teardown as
plat->exit in struct dwc3_xlnx_platdata, which one of the cleanup patches
introduces, so it could not have been backported.  It now adds a
pltfm_exit pointer alongside the existing pltfm_init in struct dwc3_xlnx
and is self-contained.  The follow-up series folds both pointers into the
platform data struct.

All three are tagged for stable.

Link to v1:
https://lore.kernel.org/all/20260810174713.2325292-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (3):
  usb: dwc3: xilinx: fix system suspend and resume PHY handling
  usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
  usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and
    remove

 drivers/usb/dwc3/dwc3-xilinx.c | 101 ++++++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 24 deletions(-)


base-commit: abc36cbda29d8f19cf3a580cd86ca9e865186a41
-- 
2.43.0


