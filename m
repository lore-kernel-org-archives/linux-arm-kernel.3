Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4BFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04fHc7VhOqnuT0txW4ZpNV7cM0ihdYXXzyPoXdRiDVg=; b=SYzteZJSreoSw8Eas3rOytivoI
	KFOu/R0d+lrKV+XSjxu/BNBFLkvGjLViSQ83iagnO+JvRV15PjfNSmpWmR/AlanIjEXlNts7ambwU
	98tDlM3maLDgIl05aEqoW8oqi4zbliyeGh/9An4zWQRVxHrqicqdm+s0g+umjzD1nkC+WcM5YpWn+
	tSsMrKvJ6n/fkGvtH7Q8aXVQehiN47BmZwq6e4q9vPTWwyLJXDd4YQJB55gWlleYoeZLUay2sMUds
	oExZSO+pFSPuDx/wA2fWL7o6PECSMbef6h40pIPeS1o19G7Rhee74Or9nQ6a+DK/y0W8q4Tw2+xLH
	PwoHlbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gHG-00000005tkH-2woJ;
	Tue, 15 Apr 2025 13:24:38 +0000
Received: from mail-vi1eur03on20704.outbound.protection.outlook.com ([2a01:111:f403:260c::704] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fyf-00000005qxS-2FYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geqfA9x2RdOTAL8qDkREGHx163wI8vfT0X+u7eFkGYbBrTrNagSB/8ZO9Wd5gs535Owps8NQg+O2a8hiTMjOFEqtqPvxSxCiNUR51/K1GnqW5viAMWO8PRoRGQ60sOf0v8Uky+0fxnLOeTSYrKiHyKocZuRTBRZogxPW+Hw0t4loYPJJeQayLEbV5GXhld5Fm6J2oOazV23RniU+FV9tY3WvyH9B84Znuc6soaZ8XTiOXHctwhFWGSloXTjiGpNtk/GlsK7noxyszyWnMjMnqjo2QN9zjmyOxJmMHQUjzKNMKk+gXyTIig3ujSfSkwcxmi4WDjgYQL4z2qt+gf39+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04fHc7VhOqnuT0txW4ZpNV7cM0ihdYXXzyPoXdRiDVg=;
 b=suCHOSfh/0l7cyRjkab5LUoS6seD2V8FurquJ/ih0y2vd/GMxRUv4bw8EqrLFB7wIzClzckOn21uBidUSk1Zk+MjeeptDlQXVo1rQBM6ilknD1J9r9HTywzgqJFw78S+XS2GS92PFNBAQWuTZp3Y1ZamfJAaH+wcBWsyUaDLMPcqJZX3WeN4A/ibskrJD/JKkP3zYcyTjtFXm9JmASwHSjude27KL9tUMPKge6uX7muztUi4kc9DWtdixdPpRk7YgEX9lerWrAkV9J1vBZWK7suueg08OI49eDPvEfkClpXoYHFMkQne0qP9EoIilfI7YEJ0MsKnWJskS786pP6RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04fHc7VhOqnuT0txW4ZpNV7cM0ihdYXXzyPoXdRiDVg=;
 b=POpnTcSisikDAWJXbnvcc8mgFDFi8+rlmmS8NlveCUy+rw2zKAas2FT9aYCqzU3vkEJX2tw6UjzEgMrXBg4GhsUOd/V+J7fDYczu0T1iv0vCbDRkKT7H+zGHCurcEl0dsUyBhTF8de6R2aMz1BZZuJIQv+sBw2VNXxeoEoTstm3JZMmR1/W6ids5KrmPtJ6MbhwQecXe3M6xg4wQwQSjn7BH5B9fz/u8IWWmVy+q9p/D2N+66rZUUQhEPQVqh0HTyjlBXkBstlL/1ExUeCM3vzm1YXCfWE13OtpIRHN3OMRT8ctyZqP1VDK+01/jmiO9wcNCVuX9cgWIHwUKXYu1zQ==
Received: from DU7P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::18)
 by DB9P195MB1369.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 13:05:13 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::3c) by DU7P194CA0012.outlook.office365.com
 (2603:10a6:10:553::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 13:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 13:05:13 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:10 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:10 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 3/3] arm64: defconfig: Enable TMP102 as module
Date: Tue, 15 Apr 2025 15:04:58 +0200
Message-ID: <20250415130458.33714-3-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415130458.33714-1-d.haller@phytec.de>
References: <20250415130458.33714-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB9P195MB1369:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f1678c-7e70-4894-6135-08dd7c1e28ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MkXVvHOKheQTfOrRtiHGj1kMjUlFfrqa3SrCGI9jodVf6dvvcYeNLb/aHmAv?=
 =?us-ascii?Q?ECcQnZR9ZapNY+605yFqPDCXDZcWK84KTp5gCyf9hVaidMLPuvidn3lnLEal?=
 =?us-ascii?Q?9goZxHch4FKUc6KddkCgOOXJfby5TRZJAGkG0vga2HTGtkhyOZQRtUih9Uuo?=
 =?us-ascii?Q?zU0yJ6n2JmaeAaQT0tM1d6vSJbXN4mzyPZZvpU3CeIzGxOEiEKRSDan+jc0l?=
 =?us-ascii?Q?DeZP7xeHlzc5XvL/q7Iv/0M9LZh6a76eMstUtoA15W33fZg2zC0UZEN0/SqY?=
 =?us-ascii?Q?9BIllieYIb5YxEmVg1QGETD7wO2c2LM4bYQFscD6qd28kALo/P6XLpKhVrwV?=
 =?us-ascii?Q?KM7E2sozpCIlW7N1hfZmX0+FE1oVPG5EqpeXogURal/SYs5enovyz/oBW/iz?=
 =?us-ascii?Q?3V/fDlNTokWDJPeUxxX2077G0QI4OWftDi+08arQ8iCC7pVBj2lmPenk7I7E?=
 =?us-ascii?Q?KgNrTYvWBB7uUV6xU8u48gl/4C7QIPZhvCIGKK96PitHbJt5VYKwToExeigy?=
 =?us-ascii?Q?OvcAUVXz8yeTTUnHgji+ED+NsQNa/gQZDi6XP+3Yr4LwdN6B3rlqqvVqeCau?=
 =?us-ascii?Q?wJfr9V2/LfLVF9wb3m5hHaRhhmsRlnOj8Wmsv2oZ6yDLAXAjsrr3LukwGXMM?=
 =?us-ascii?Q?Ig5ajed6reyUyPl6jcV7AgpHJc2mpstcJfFcsdZvRhTmMXXSz1bPBIj185+V?=
 =?us-ascii?Q?rLhvdfH4xD/UAdPn4LZTGLLKEqLET1LqL0lT3Jjv5GzCcfnAoTYkPupqn4Ez?=
 =?us-ascii?Q?iTrdVNCXgIH1A3ASIqG98dvrZMGGEIU8Po6t4Fy+7y/DlHvD2O5NHfXOB7uL?=
 =?us-ascii?Q?dWVgLDOLSw4IysXgXBaMq3PMGJYNhsN5GoawJsk70TPjrM+c1JQJ5KkTc2pH?=
 =?us-ascii?Q?maf5//Mdc5yzooazZQc3VZuPMRH2LwUv943o8LfDnNsxa7lyHIXGcvMm8/u+?=
 =?us-ascii?Q?CmBeZU+8I3lEkeLKAJCnF0ogVQZU8s7FG+XiqyUJRVI2b0NFppqqyboyVArX?=
 =?us-ascii?Q?bnm/y/jmmoRpYf2x1INpFVzzPsCYJ9K7xghGrxpHz9rzWSFMCFJwzp+vAVM4?=
 =?us-ascii?Q?321dQZ5Bb2guL6l9OB3NGp8d3hFi1SwypDmxKAJaavz8hzLxOeL+4YhoY/qD?=
 =?us-ascii?Q?jgbkiAnVhS+VevsV80CjiLF3CYRYsXIH1lXHXNSsx42ZyMaaKk65hUruzwR5?=
 =?us-ascii?Q?thvICCtV/e9paHLgEEeFwwA1bcES1P7Stg9/oHOwb7D/4Ph1LJo5ftyICxjW?=
 =?us-ascii?Q?NSS1PqThOYr3ZFi/QdTKWC21KEQnwIKCMAeAoDPhB93QOCGCcvHoVxS012BO?=
 =?us-ascii?Q?KxgNHBAUP7J0B1m+t99DjctVbhkcAMOky+j0v7VNvUZ5vPzXAwI7I/cnxnLp?=
 =?us-ascii?Q?G8u5+cgF299IR4E3W2KS/uKKd9rIUA6PBBhuouJ/aBPiYgkbIqPKQ1jXRaiT?=
 =?us-ascii?Q?cldv22qpuRsAIjRdNY4hSl+LzpW1hfLNYiWhAVTyws1L5XvgUd4iGXGWBZFa?=
 =?us-ascii?Q?DTp2qSQUzvwFePYAmsjZa7RLdddWHVgluRkp?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:05:13.3009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f1678c-7e70-4894-6135-08dd7c1e28ea
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_060525_572871_B8EAEB38 
X-CRM114-Status: UNSURE (   8.61  )
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

Enable the driver for the TI TMP102 temperature sensors used on the Phytec
phyCORE-AM68x/TDA4x and the phyGATE-Tauri-L-iMX8MM.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Changes in v2:
    - new patch in series

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..54e6705f9752 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -702,6 +702,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-- 
2.43.0


