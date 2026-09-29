Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240F9CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4G3SctAyKfFFacELNCLnHRq0XKk/u7uoGld4t1jEsPY=; b=g3BUOA8TiVbODZMcOFSHiGnGhC
	zA2FUFDsGFqZrCW/M5EGQRBoVpgCgW85+SgJwT5MAavIOdNvvTgG9cazQcByb9hvPdy0tFUF6InJc
	zTT96HGoPVVh7tugiI1iCfUNiIqQ04yb1dyZqM/ygjT3OnsMlL0GeITDICHR7EoMkq3v1Y3M4L3VB
	kEbKo+K5gCWuBMXQD/QOsXzS/99DmE6tDOSy61uovU+ZvEA8ZyHl07/7u2cPLuZpkTpLq0AfDez5y
	03+PB2fN58qox79Z7CSL+b3QEARMzcXJzUAt44LWeyMlE8pL3QDqR8fTOx6AGWoh6aTNVxBQfHpRy
	01S1Ap0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVGb-00000003IN4-2f57;
	Tue, 29 Sep 2026 10:40:57 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVGW-00000003ILw-2yTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:40:54 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SiztOK7X2+jodoPsHxaWqUovwFDQSdMblTa9BVfQBKa4SU7imnDId63T18s65nmUYTCgo47+fpMX9Cjy6dWf0lcdnRvH7Gz5YRIRsl9ZquW9rfRc6hOeN+1g7U+chNKRCoxyDE4q29chweyomg+pKzg7ee9qa2nedRVTlk0K7aX7l0M9NWWBD5Z4obsHE5th758+0yuGfcP0BwmtNgq+GRaENtBatx9xf9fUHShp4ObEc0mVy7dr9vdMlRj/zZVLzGwP8YLjkl9RVLBUZ/mkrAb/KCHuMd0x1VcMwMotman7aWMqs/XCkByAFrZTc52KkO90TiMYMJ3zmG/J1vz/jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G3SctAyKfFFacELNCLnHRq0XKk/u7uoGld4t1jEsPY=;
 b=RlLs8jB+fOQ5I151dLl/17J/wi5yNcIvoZ4Pc1r+wrbUUHep0M4SQcuNWEJyfgyLECk6y6QGRUiF3Tgt30pHmnNDXxJ+BKu6PtCMubgKFE8h4WtQI8FVPcD8mFCS9pcL1tffZGRmVgWgT9dDrM141XYopjBHfgkZLMM63+C+kcHoMDdVTXx0qUsHKmTdN+2WqEGxiy4d4/sluaiCyYYiAKI/hQB1Rab8jQW89z2+Oowypn/1THkCUEeDOLRx7UvvAuf4KvL5D1zkU7gQMqdyjEMpBn/BYmUM/AxNEkYpJmoOtjQKla9a239knyrURh4TJ7bwjp7EE4TE2Ei+hKgWcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G3SctAyKfFFacELNCLnHRq0XKk/u7uoGld4t1jEsPY=;
 b=gsxsZklkY0b4aJHFNd6RWl5+B8WKJ08NAAsWwPLtLQ/3QDsHhYG103/UfDYX41UngdlSVcQZDTJZsOdvK3kBRGK2+DkZm81iRE67xQXHw4leUIqLwFeNSb0CKoclHzFD3301ZsR01eWsvuMXqLopZGRIBKf+iQO5a5MW6yB5uIw=
Received: from PAZP264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::21)
 by MMZPR08MB615799.eurprd08.prod.outlook.com (2603:10a6:190:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 10:40:41 +0000
Received: from MI3PEPF00008550.eurprd05.prod.outlook.com
 (2603:10a6:102:239:cafe::6f) by PAZP264CA0257.outlook.office365.com
 (2603:10a6:102:239::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 10:40:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008550.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 10:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV2jJquesMudNd+vxE8FFHu4alvIk2zPr6UUUQ9gszpH3kymp83JtWtPN+U0EMwUEKq1SyyDsR2dqMFyn+NHqdKLy2KgR53IWMD+72VfQ42feMx0edcmWUhBBfHvoTtzNmLs/+qrWHAbVqz5mxb5Yxk4Xn2qMNGx+lswRf3MWYf8vyBbQ0N3/OaOqZa7TlGgE3waBdXVw1j5/G5jN+LNaOo/auS4zBOcO/qfWxt3J/3B+lRNZGbSm7/MPP0VL573eG+5RDThzu3AgcHiOpEuMjp6/KFVOgs9P/D9hNSKja/Xdq3ReVzYS3ef32PKie0MOr7GZ72UCBk8wqbVcXmCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G3SctAyKfFFacELNCLnHRq0XKk/u7uoGld4t1jEsPY=;
 b=BES5NEl1sErqX6rncq9nqbvwOSweUFhF3Q07h80C/R7qZ+0kMpLg7lYrifUc6Iwj+W/R6RryV+5eBSMgjW1Wl1s2Nd7LBV+8OMbiq4NDImmCCLoYWw7djFzAqpWn2LK/5u+T2NSACNzQk8QMw53uMgKTFaCuQ/s1uq9aSxgFmaNIPlZubkGPvcDvKXIg2wiCCE4Tt+4wVCzAW+9VjNX/WuSQB6sRzlQbEhSIIWlyQl/HPfKGyRhIr0CcwTAzRzTMj+6aYBEho0i3a9hJzudRics9PrysLGSNIbVifdM+DGf+V/9uNKHALCFJ7RQTl2TvJ8UNYXyx+21FjUZij7yshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G3SctAyKfFFacELNCLnHRq0XKk/u7uoGld4t1jEsPY=;
 b=gsxsZklkY0b4aJHFNd6RWl5+B8WKJ08NAAsWwPLtLQ/3QDsHhYG103/UfDYX41UngdlSVcQZDTJZsOdvK3kBRGK2+DkZm81iRE67xQXHw4leUIqLwFeNSb0CKoclHzFD3301ZsR01eWsvuMXqLopZGRIBKf+iQO5a5MW6yB5uIw=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU0PR08MB9028.eurprd08.prod.outlook.com (2603:10a6:10:474::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 10:40:06 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0472.005; Tue, 29 Sep 2026
 10:40:06 +0000
Message-ID: <6ccd9dc2-0740-4f30-8fd8-1f9aa14371d6@arm.com>
Date: Tue, 29 Sep 2026 11:40:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/14] coresight: etm4x: read-back TRCSEQSTR at
 disabling and prohibit modifying seq_state while enabling.
To: Yeoreum Yun <yeoreum.yun@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 nd@arm.com
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
 <20260924-separate_etm_cfg_v2-v12-1-a2b41d2f7c2b@arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-1-a2b41d2f7c2b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|DU0PR08MB9028:EE_|MI3PEPF00008550:EE_|MMZPR08MB615799:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b43498-dfcb-43e8-6b33-08df1e161b87
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|11063799006|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: Q/2z9pmfobm4PBVfNCBKTN3d36rgNMh8bQfIzBcJx95n0TgonjHNe4+re8Hda57yFjsn+DdWYq0+vXDUdb/FKXGLW7N95VGB8Pzqc73oMPSfws7CT/oRMXr2skzpb8vxEANRQqLJCHVKsAoK92qQTMlO7RkqZ5qrvpBpOLUONbs8cPT2oOqoXghso0zFjJ8brPDrbO3RLHOOVP3r4ZwOFG+hEq3iqQ9u8kPZC/gSAL6f1cL4RD1zpM7EGjX33eSxqWLX/YMbkUiXjiwJOUTk1rrsAYB6by6OBmibJBxwWnfa+1VJXHewADvFVoJWcKTfP5ROTpHXhBecxIHCwdKMQAX5qecC+KclDnR/2DEeMUCJT0T6NyPXbnuQhCjbXtn44zP+PimP1hIKoFx5ct87KgpgEcv5N9wM77PMxJWuAMP6zb/yVj+hghH8kErOF35lFWatrksUOtAwVwRDfLaxCDr/2BNw2bjmWPLPrtLAO3ae8WCEX07/Hv6/yWF6cxpwBRdlAUU56AL/KDaLLb4vav8v2ms2C/UuKrYX+0Rdm5t8YUfu0+5u3Hgm7NrwFdTK8mAtSuLvdwMCXzQj0EqzLIvE5jVd+HiqD+4YVWrw2uznKdLyvII57RIOrhAkjlbXN8w53Qqxxn+j2C8b+1/4OqJNkYHJmUjgAZLJ/AJavuA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: hyesObeJzSE3KgEpZ+/fAsLXMflgcZPV83i2jXrzXF/wvECZsw4Jra8GeG6NhlEQE1+JwrrLoDtw4iQ8sZ0KwdTrbBqGwiRBgKeOLfJjLIr4yrlrwAMcYNcv8lLbxr0Y0th25jVRvd2SKXKytzVE6SnQknm/iwFVOUxxBUg5l5+ywGmfhzGUftjvXYe3A9mwovUamaPRwval5SKFlm7GhBsHi5iuhsjjWDJ7AEztZltDksYZqWbAG6tml1EPeUnCMKgF96P8j3awYNUGh+RqxLMUSIOhXgyRBBb+PtmwNCaOsPRAacCbWJDTs83HALcJ4/ZXOFVw9n+NlL/aVrEhHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9028
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008550.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f7dfbf2-8ba1-4199-e7b4-08df1e1606a5
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|14060799003|36860700016|35042699022|82310400026|56012099006|11063799006|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bNOoPp51I4UhBWZF+pUapPavIYQLA674dTN0HDSX00Jdg7/QjcUnkKwKn29/c9wAspzzOpRUyNJiIjMAK1MHV/P1xgRal+qcImyxOuivlR/W/TqYoCc2Zd6l+Aum2Yx+MhRa0eA1zYvT1ssPznezTFZ55iC7tw3PrwL3yQY6RNPGmR8XDwOa+ZwzQ5Ghrgh0dQApSUXtbssjUgaaJmdqRegdxOobaaQITiGltRcK8zuEEzwn0j7XxoIXgmhzk3jpGi/S+VtH2FnpKbTbGVA/X/8Iod7YmCQPCZzCWpSGEfNSwAcHkJPXU9hOitMblgNRvzgNykYgjyNm9sYt3XYqUbUkzmS+ki+sCFeE4Ddxl0Mt9rrgOR40LOCLTCvsCyGfG92hu7udImZtKLm2U9x1mzhIfd0QWdfeeVXCIwVNrY/4khZOK86pXW2lveyHCN3A3px6jLJNobd2cnGYWW1tgrh3YRA4mzrn9tWomUeDvPOGqzqLWag2Pe14U3KtTrthYErOgtaypZmeHi0Ej71Bkeil+3XUNUJ+B2uD+i18QYfjv/64sJfYEBbrxTz9AuTIiCTT7vFLvPyL6zWwWH0ES2zdQwt6njidpNKVrEh5WiPyzjc/BVzwqGyP6aykBlBLy6yqZtBAXetQ/kKmjrsGB3pRBotrbmHg11Z0sG9ItIh3riP/VirwQTNT/PoagwqlQ0QJqrc2qjh0gJwrFkefWA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(14060799003)(36860700016)(35042699022)(82310400026)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fxjFGU31QZD2dJ66PYH25o1mDOfaJcKXwfuGtQmA0XoSlaxg94//9OkAzVNSHM4iB9/FTrKGShzIBPw6J/YyIiTirXRh1VN3vLkDnH1RKrbDrm8eW9K8uXb8eCHhm6BRukw9b2RHEHpnTMK+u+cC9HCJP/OXPOzTyW35a5wY16OfFPjDRuhJDTBbeIH+4bz9AzX2Oi+kERxnVv7Th/PlQiSZ6iAE/yFjkzWGkyLtsG4+4gGAYAK3Ha16sMJ2Ck0j/raP134fwVZZ3da71hr/y9E3xJn195rTo6oE/q75RQurcD+gLv9WGluZCDUthHZP+2y+VJ7j0JmjQOQu48PmK56VC0poHfU7mjdizkbYmWib3JF5jOiCsabVSXsfNgnjROpZgI71gEOeO28gzmMd9NZ9LLBCMttB+EJg/15ztqxnACl55HH+6OztS+RPsrsI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 10:40:40.8141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b43498-dfcb-43e8-6b33-08df1e161b87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008550.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR08MB615799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_034052_901380_90C03D55 
X-CRM114-Status: GOOD (  18.23  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>


On 9/24/26 18:33, Yeoreum Yun wrote:
> TRCSEQSTR can be changed by the ETM while a session is active. Its value
> therefore needs to be preserved when a sysfs session is disabled so that
> users can read the current sequence state after the session ends.
> 
> This means that any changes made to TRCSEQSTR while the sysfs-session is active
> would be lost when the session is disabled.
> 
> Copy the TRCSEQSTR value when disabling a sysfs session, and prohibit
> modifying seq_state while the session is active.
> 
> Suggested-by: Mike Leach <mike.leach@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 4 ++++
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d444..9ca03a5913a3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1073,6 +1073,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
>   	}
>   
> +	/* read back the sequence state */
> +	if (drvdata->nrseqstate)
> +		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
> +
>   	coresight_disclaim_device_unlocked(csdev);
>   	etm4_cs_lock(drvdata, csa);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc6cdd3ae29d..db3cf4ad6806 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1437,6 +1437,8 @@ static ssize_t seq_state_store(struct device *dev,
>   		return -EINVAL;
>   	if (val >= drvdata->nrseqstate)
>   		return -EINVAL;
> +	if (IS_ERR_OR_NULL(drvdata) || coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
>   
>   	config->seq_state = val;
>   	return size;
> 


