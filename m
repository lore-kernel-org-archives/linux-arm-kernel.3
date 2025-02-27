Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C3CC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haR5tbnvIj2P2bamJeswnPFGYF5HC2vavkyiI1t+w3o=; b=cPfB0lBdaR0GzKWKqY9drDfriB
	8dDxFspgYqf4Pw5xaVdid5athASEvi08VLfl/r1SrHGDI9468h3xiZWZAhV5Ydj78lLA/n9GBpyFl
	UqW90K6sKQr8l5q2RuDbTsSLm8bVNH7lvH1jOEiwdLMHU1dkXUVgBUnetKirP62y3kw5ssK6Eb/JO
	kNeEWRiMXH1P9AueqTk+daQ6Fhcvz4PWCTRFrhnLXknMjSYNBOCLvU9DF9CHpt289CqQXTEtImR0S
	H8l0a4uk9My/EeNowjm/AuX1/IrLw+Oy9Hx4SywztLgX/Cvilxp9p4OIJSMe5pwJ1XsErUwF9tf7W
	1I9bPwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd9z-00000007ORu-11fR;
	Thu, 27 Feb 2025 12:38:39 +0000
Received: from mail-tyzapc01on2071b.outbound.protection.outlook.com ([2a01:111:f403:2011::71b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncex-00000007I4w-3Xqm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:06:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoCIlZdI4KOTpR+lhUVWe1eTEqqa7yGGJHdFU7bN8Qf7Jv8K7dBk5FfynUACsNr9akbXnEN5QlNtvGZPXvvV7fR4j+LWenINyWlOBnXRr5ZIK+e7RjufHJLdqef0jRKwYeUazaOJD5eUC//0N0+58wrfdioFhOyLXwcBJ5XwvSTyNxRBFqMn97kogxlFSTVB8WEWNKGXVDEHdeD1PFqxRIHhALjx6RrqzukDgGWxg3AvIC6UFTNDST2Dz7b5vIpUE5i8fOjaIkWxwWX0qcMW7Mncks7i/ChUO7jOcV68oDRNtKxZ7gqaDjNGJpCLtlTM/V/a9K681sBsWAoAM9nhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haR5tbnvIj2P2bamJeswnPFGYF5HC2vavkyiI1t+w3o=;
 b=WfEtN2IJRCXwe0a2xFEGeFlf6Bi2ZygQXhbFU2JJBP5XZey1AIKPnwzam3SwwSLPtCDkUXjIJVy57VxxTv4v4kaxctdyuo4TYQsyysn3Bg4dP6E2KdYRro5tct3E9n+DxIEegRD899OHCUfjdT8mCBcmU155V9XZOe87W9tenYgmwxnzIi1p8VY6Pvo/Q7JiByUUupzVUUayTTV4NQa5cvP9tkyWd23XDhwNATcX60A3r1XJxIaYAozviMe7huYfKGMf5Hut7irGO+NNjXuWZE0LaPuIzyx8YQYjKSK/s3AVIg3fVBBXK9Rva7JuQ9Z5KRxKMoeYuo+k5v/BqMyFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:4:186::19)
 by SEYPR06MB6009.apcprd06.prod.outlook.com (2603:1096:101:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 12:06:21 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::42) by SI2PR06CA0006.outlook.office365.com
 (2603:1096:4:186::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Thu,
 27 Feb 2025 12:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 12:06:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C3A9C41604F8;
	Thu, 27 Feb 2025 20:06:19 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v3 3/6] MAINTAINERS: Add CIX SoC maintainer entry
Date: Thu, 27 Feb 2025 20:06:16 +0800
Message-Id: <20250227120619.1741431-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227120619.1741431-1-peter.chen@cixtech.com>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR06MB6009:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 00f2b4d8-7546-44e2-f431-08dd572725f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qITiwnQHseTN31gaN74XQgr8Mrob3Args4WzG1gjNgj6JnHhtIu0wC3aup0T?=
 =?us-ascii?Q?eZ8oEq6N6oUFVblBwGuBI1V5U+xyPx4FjADIBTIS1TidEEkqYBUXb6PrCC/R?=
 =?us-ascii?Q?jvWmAgtHxNX6mexO+FXhm22DbRkWN33ysSFSzTd3sMTB3YP6MKQpsO3McH2n?=
 =?us-ascii?Q?2ADTf1x7oKnpMNBDFP27W+G/5KVybFz8Ci3czwpVgAJ88XLU0hnh+p8G5VAA?=
 =?us-ascii?Q?LlJpsB3KvwgKsCOOwBbtH6WwssNtVlg+2gZONOt3qnq4lb6GAN4Ahp8IiWhf?=
 =?us-ascii?Q?bWZE/D6+cDL2iiS8UMzbINgYfOhogYKEiD9ab3HM6RssPU/sq2ZPxYN2oKjS?=
 =?us-ascii?Q?Hcf8D+XRTVMt9Qxm4AbDz2OKGKtVp6leihnJ6K40FpNd+prxRvuQcHTuFctF?=
 =?us-ascii?Q?HTwhslOHTGuyyXb0vlVkaY2thjIDpFoO0suZQJvvsHkShQSwp7tysM4r9RDU?=
 =?us-ascii?Q?pE+Yp3kKRJnTtX+CCKPH/di26OzfRf80rqJDZkU+vz0pqNF/c5OyKCKTYopo?=
 =?us-ascii?Q?jv/4Ak7Jr1uQr2IKxwXviaCcuks3KJTZZMglNcWlxTW+511DeRGOZqk18t4A?=
 =?us-ascii?Q?9P/Ol91kTqod3t54JkqXt3AdwlW6KZt2D80uUA8WOjYtn7aTqfLDnqI+lQa5?=
 =?us-ascii?Q?CY3yqDdSuHvMj84kyq6zqJdOHvirtU8b4XWqzMe1WHVvxuE5QR4Pd4TUqQM+?=
 =?us-ascii?Q?bTBFtxTL0FVp2TIHP2aWZGELX+OvnJYySu07LtbSekmFvYBj4QqbpXkYQiFm?=
 =?us-ascii?Q?fBmJkumT5OyY8QaZzjUteiVyu+HV3cBYBZJLQxpKNHH2xlw6eRL9DN98r/pu?=
 =?us-ascii?Q?EMjCyxPMhHH3pUNQpxNYa+a/iTgZhr5IxGHtLuIZvDEmvx0e1ud5NFd0xj4D?=
 =?us-ascii?Q?RT3JtEKEYbtvIB68m2SAtxaYnjRLoTnJIOQMsdNDgx/wpTNgYaUPhHTNdkJg?=
 =?us-ascii?Q?oAnIWDJDv1FUuzC3K2TJCaPr3O0AzQgAaA1HLSTZp74I6GID9Y08I/JOvpTk?=
 =?us-ascii?Q?hVSxnWa6n1XC6mOc49oYjlSo5i0JG+1/5uqtVZtqjKOAzercHH3wndX+pcLs?=
 =?us-ascii?Q?GN5y4wGM+QqvxMmDJLr7XuEAgxj4BB6zIkDsIR68GdWKo8kEVEmrFlx6AiPH?=
 =?us-ascii?Q?R6FrWvpMi65BjPgnksSsh0Y+CNumZkXqUC08+tEryMIJ0VCDk6PNdRod5zEz?=
 =?us-ascii?Q?IOzF0ZrdcppqgmYw0oi22ng+Gi6VOK+khlD5D0iIgkdi5hpt9fHXLZHW+7us?=
 =?us-ascii?Q?YBIxAA4JP3U71VpUI8ReiQEelzt34OB5Hl2SGNftsk7yeL8fKX1MreiINqwK?=
 =?us-ascii?Q?9no6J9pWpinLzJMXXCdXFwoq579rQXMoIvFERVr/sDa0ipkvlMPvqm64CW9H?=
 =?us-ascii?Q?toOcN2XgZ5vVbbUcKksUN/wnhlHgkuIxErMyG2+m3ub3K3/yLvO2MJqG9m53?=
 =?us-ascii?Q?mKrtXAkS3dmmZatNmdVu81OV0zvLhJA/GY3suD54+4GV9boJDVCicHh7xAvq?=
 =?us-ascii?Q?LihYp/yCr4AyF98=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 12:06:20.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f2b4d8-7546-44e2-f431-08dd572725f3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040635_892376_BB1C57AF 
X-CRM114-Status: UNSURE (   8.58  )
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

Using this entry as the maintainers information for CIX SKY series SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..200d2529c8e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2354,6 +2354,14 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SKY ARM ARCHITECTURE
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


