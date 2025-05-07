Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C420C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRczj6SJTIUJwCrtATmHN5USaYxtqbXlxpwdjw45ntA=; b=DOFvhbYJtyPIfkhffskJ1/iNyq
	KHkTgzkLQONCoOGAmJ5bOUvdFo+cMKfHMwjBdEMm1OouR0S2NoKMicN9TrHUeq3F7JoWuv3jPi1UX
	Qz1PjX9sIcmEehyhkSNiakB6fEjQwXhOPhXosxFU7K31oeoCxZQror9qX6dEgzISwebEhu9TUVRcP
	TJo2Bii/E5AwSMUCHI8AjgfttBIPoPp8ZWenQxnXtzzP2N9g30wbvqgjZp6P/uLpkDUYVOF7WGOI6
	cIkCwbuAbtBK8snhTPEEK72SGWIc0fmF3EAKAV+rWlwjX1oGEVhlGfL8XThCq0vvrJtDlQgowR4Jd
	q5ejBKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZ19-0000000EU7C-2mlX;
	Wed, 07 May 2025 07:16:35 +0000
Received: from mail-db8eur05on20724.outbound.protection.outlook.com ([2a01:111:f403:2614::724] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYly-0000000ERva-3UNg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dkdfx5OttLVNuTqbZz4QWEQzOcis6I0swrwM8xQjneILfuFn9KN6buMeC0suawVZNJwlWeTGkNOyXqFUyFnFYZXKcyFfLy0/rNbh6ufooxlpACFyYn6cxBcXq/C2P7gRVDnqZhj9SRXSgkdLXF1hrUPAuU4SeqbWnIlQU/2JZoRcBE2DfswxB5RhmtLOYycdoRQYBQrIT0pEvWIDhLc7vJAel0+HsTiV5PEvwak/d42F9Ueguzoxiu5SSmPL96fseojFjKlpu+6l+Jz0ShJSZ7NujWbyUnkCHaKxZuK/s9uy6SC2Co48AnlPeYHyuP0RbtW8TNCvAge44z1S//biUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRczj6SJTIUJwCrtATmHN5USaYxtqbXlxpwdjw45ntA=;
 b=FOQdhu7RblvqzOg6IfMQJY+HSDT4xF2YcdQvJ2kh/THAOEJAbjo0xJ3e8PnU7Clu3LVpP+Exn1KOFIQRkkYBB8oGfPYeS4ZCJ7SbCFkvxmDETJfYI7qG8J/NaTbaVMACbhSUT/OTiAKyKcX9nOIYpXVHqRSOqMmpC6DeCFAKkWdSmmM4EFe1Wyji6UYQdwjy9oSWSBlHNA//C59dUDrkTkHFUxRN3Y5puFnT5JnFHXSejknjDfOg0+HI4FW0jRMiKqW/2MF/ksUCZ9g77yU/TIO35CcAYQ6JfLREsid3rWAWzgDxl53P5HGmH8JCEj7aEasOaQIMlGeOhARYZRueaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRczj6SJTIUJwCrtATmHN5USaYxtqbXlxpwdjw45ntA=;
 b=o7ma/gKvyA49y51Quuqn3dZfkvIntXL5uxZOY3S9a0BbO2uAF/8ZYhfe13z5WjQbn5Fz6x3yLMt9hJAJkraqlYlqJIEDN8d8daCSLTJ0bdGKLt7b0S0XGJkRIJfETK3V+CrPHf/+5X48Ygq0D3PVV6QuwvRaryZdfV5qi5G4vJkS4pSqaIicHWy9LXg7xo0gXEhwyGq9Yhz9byzN8K9FrFl1ZIIPRXBQ0Mnb1hCVtwE3+kZbvBgk96u3IYRh+hN5OzODz4QDIZfJMujIe/N/JxGwJYwVhpFL9axecty4iqDR5ZcimTanWCnmp+Ow0y4wll1GuH8iJgRHKUjeMtkVLg==
Received: from DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) by VI1P195MB0590.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:147::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 07:00:41 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::d6) by DUZPR01CA0040.outlook.office365.com
 (2603:10a6:10:468::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 07:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 07:00:41 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:35 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:32 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>, Judith Mendez <jm@ti.com>
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
Date: Wed, 7 May 2025 00:00:08 -0700
Message-ID: <20250507070008.1231611-5-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|VI1P195MB0590:EE_
X-MS-Office365-Filtering-Correlation-Id: 301f31a0-89a8-4214-b323-08dd8d34e14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WpLEJafkgvnQ4k76tfBx99reWQH7JrIF+2u3+ZqVMyKQHFRxghq68NssJEmQ?=
 =?us-ascii?Q?O9eC56Bj4nIUNA9bdPlW0A9VGYsyG8JK/JaO8jhRuh0EBt95rNO7vu1d+BWT?=
 =?us-ascii?Q?y31ZETcUo/cbxRNxelCA2E2UoJOYDdErFbqqepOzl/D63X+y6BBCpUg66E/F?=
 =?us-ascii?Q?0Qsq+qzRyjrlcC79whcEN9YmM4sKkd+u5nf1BccYMP/wdD9QK72y5HmAvSpK?=
 =?us-ascii?Q?yjd2N7r5cbjvio3cUJlX7GN2pe/jwhaVjIn0Kj2KEPvseZ/CIaHrvvKpylo+?=
 =?us-ascii?Q?Q89xKt58M5ShUkRaKUTu5lFRnWajuAiuWzsc1PCDBI25SkTEM5gWQZF0DARK?=
 =?us-ascii?Q?M0HHskOLXAb63CDv1/AonMnHkyITunIrIs6QOzv6jRe2RNV7PzYvLgYA2mpB?=
 =?us-ascii?Q?YFOuu2ecYx2bIfTcECsk1GEi8rseSxoApcMVv9Npfc+dpxDcEdC8el07ycoH?=
 =?us-ascii?Q?Zc3RYl3K61bMu0JJQNT55dmsGzPtRmQRSCdS5dt9AJ05xuL/vcIPDXXXtedN?=
 =?us-ascii?Q?hcjOfBYgVfGgg3uYPsjTbap4q9qWN2S+22xC/UuJQevJAPerERC8eW+0fEOl?=
 =?us-ascii?Q?iNwIpVEcBo22xT/Vu3pIJoHj4JViN2kxRauD4aFXPHfVrqd7ltFNieuy+d4r?=
 =?us-ascii?Q?6ZDID+r45gYEKHnw3sFF0lsJCmYQmj/g6HA4GPo9IutjA5JeDdXnB89q+eod?=
 =?us-ascii?Q?X2G/NZI7R37Cbg6WmulAF8thY1OC2HJlFdB84kuuGrohZUl6PwoxAwoYEB0l?=
 =?us-ascii?Q?Bnctcz2jJRWX8XjN7UMuIrh/BXuPVfFrXAzPnR9znLjkfY/Zcd9aXEi0hJ9O?=
 =?us-ascii?Q?yIiVAfFbHZDtnuu3N6f1KiAU5fiv+TSEBzqIwmyar51aHNiBIrqG2NxTW64/?=
 =?us-ascii?Q?iOk7CllNpOxtkSZf1p4kxUoB53Uut2dJ0Z4wkxLrT23vjfHhNDfYrPr3atf0?=
 =?us-ascii?Q?JD9fhPlfA8UUBo/7jBP6K2AXsG1Z3zGEvrQ9MwC7Iw2Ruf+bzs7L9jjhWnyN?=
 =?us-ascii?Q?9HjbJ/6v9EdlKKB3/WxD1wc3ZHVuba2ei94+oa9FhSOGKbhVDH6A4/Q9UKLL?=
 =?us-ascii?Q?Mr5cs/5I3Z3YPGPRwCSh5CVeytqI8lPkAdUQnxV3MBvzKLE6dqdT7Ro/+e9/?=
 =?us-ascii?Q?thA8m4YZS2ELxgWarlEbyt0OjpGBnW5k7373NB5Ta1ViaGE02UhL179ZYBLN?=
 =?us-ascii?Q?4NnZ5UWKHOWoB7Xpp5lugTbFz07/17IU5Die8JilUrBD6lG6TgnoCfQQSZ1Z?=
 =?us-ascii?Q?sgJ5n62bT1h8d7BhVIJ2R8HC2JfxIxSGk2zjGqnXPapJzEBYOifgDl/+yjEO?=
 =?us-ascii?Q?m1+7EESOg/XqborYkbMv5rkJ9ZDCcIBlBdPsh/gMFbvA8lHF9u90j/jW4XME?=
 =?us-ascii?Q?EVUPLgsZXdPUS74InxKLmuNVznRy1fQgebRS40wwQjMpkHRwFLd+GUAaRB5F?=
 =?us-ascii?Q?XWjl2XUeJhrmGB9zLjS2rg3fYTUOYmfNjFLA+Uv2rvugbGrXbnAgiqVJEBRG?=
 =?us-ascii?Q?kw1br7yHYE2IvjsN/jmwgP9fFUMbOXoZJ5Vu?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:00:41.3479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301f31a0-89a8-4214-b323-08dd8d34e14c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_000054_871300_0907E473 
X-CRM114-Status: UNSURE (   9.46  )
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

C7x DSP uses main_timer2, so mark it as reserved in linux DT.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Reviewed-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 434ce5c73d97..a18d68e170ad 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -384,6 +384,11 @@ &main_rti4 {
 	status = "reserved";
 };
 
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1


