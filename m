Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D142D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9LqgE8dW4hUmHx3D52niMT7JXJ5J/OinSVhVWI7jHI=; b=PKWSEEPvKpskXsib+TVOftnlH8
	ZOV49ndOwRB9oqziGFLVMpmOJFIdMvOvgBlD+/+u9xTPWWHPMqTDagiD3wXqYJpRioHd4SwPUqwz6
	VcRcQ6iOTeZMApWT2kXBDgUnfz2xRZjGxX0u7E+glTwa9owILq5ZRUnaM3uwL3ux+mAKeUefy4Umq
	C+SK/y5sY/6lJhD7bF/vVO5BW5ZmTWzU9Vk/3lLfoVfR64QAyDuUMW8wr52DLx/e0sVc4mq+dcSFn
	KVoqhnXiAkd2tW8E4Seq97xILC+7LRPSzpLupjmMs1DPIx2RTqEsBMQYkb89BEy4B5im09dj9WXet
	P24Hqmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95CK-00000007agj-2mR9;
	Thu, 07 Nov 2024 16:17:28 +0000
Received: from mail-am6eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2612::621] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t953V-00000007Y9h-0ruo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:08:23 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qzB0dakSV95Dh9MKKmk1QjJRIHgkk/ScAkc5xtvUKyhC62pBhxuHDKRRIdL2Rv+lCunjEe+kV/CrivuDJ9tTuckaEOyhn4ESHK+uBWRTiUAeyfS+oFcX6shBCRygYM+YtRslpTYONCrpi/FKso1Qh1+axdtJHtjymkl59hFVxB1JO/GOaSh0iGwzH0Hb4uD9G4kaotnl+bgOQrPh5y4LtPl0FnhQPeD5kYmkd1sqY4h6NFi40kjWHDN0kKlXez0p7nkwBbTNjZN4M54zpHOqfJdjb8kEjfeKF5EAsredjWsha//tOHZgcl0IeMsw6QYgtpZFscytLqCluedXfHpcvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9LqgE8dW4hUmHx3D52niMT7JXJ5J/OinSVhVWI7jHI=;
 b=v2vxygWfUzn1hAFYCsEJgmZczcyO/H5iPk4kw/B04bNa+pRR0DuehSmDniFvPO8BkMucZtqA7PEfE15Gt/yUGLL+GsNyAJbPiJAG/AvfCtBx33nRVenZBFE1zDXx5vhSZYIlMjVZ/CbcKJi5JagSs6tbrU4Uq52sayOlMDlesOrvNiHUpUt93wKvh4K3fAOL0Ssa9E380khQ5o12VRl0pSvigSJZQ26/Q3DELUfnM9nTCbaFQGPnN+2O8IBTl9chhD4WZVihKIklSQI+Wm0E8eugTWgkwO7X5cowkz3sqLuq3/oAk5HYmCf5yAUvp84vudLT6huZdOPTsh1rTqc6Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9LqgE8dW4hUmHx3D52niMT7JXJ5J/OinSVhVWI7jHI=;
 b=l/7jiCeaGjcXkxOTj1jOs8kHsLAltjB64V31lNCuEjsE1YSltn/51KBVxuv4ciORCqg1jZGKCG0fuhvpYsPlnFdQj/mTDVnJM7ocPR8dYmesaaAXNurh4dgzdO5LlJTTi7nt9Af3HVCqVm4FbMRYA44QjBAnXLJI2z/2VMuXV5Q=
Received: from AM6P193CA0124.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::29)
 by AS8PR08MB7944.eurprd08.prod.outlook.com (2603:10a6:20b:541::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 16:08:16 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:209:85:cafe::78) by AM6P193CA0124.outlook.office365.com
 (2603:10a6:209:85::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 16:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 16:08:16 +0000
Received: ("Tessian outbound 4a86a9c66651:v490"); Thu, 07 Nov 2024 16:08:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f0652da09028213
X-TessianGatewayMetadata: BC+DMOY0e2MFItsCh36Ph9nYU8o/CqQblghzDbGznE47zeMSsNZMnknAmEd6DbqRKr7P0kGBH7pImpBhsAKwZ2ihk8OnXDCIaUk7ZI0yN4dqqx9Yp0q3BczN6ClGdnu0dENiQScy0nb/kjSXoFWO2goSfEeN0vxPclspEXzLol0=
X-CR-MTA-TID: 64aa7808
Received: from Lf497499200bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4EA1FCE-6234-4EC4-9B9A-847986D2D82A.1;
	Thu, 07 Nov 2024 16:08:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf497499200bc.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 16:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAC1lRTDkNngFRld4DQvRXUlIfjkDujbWl1OZixutSuIfxHRlwR2aaOeh99LZDQlkkB580Arnt95JRuFSS48ZJhxYAtJQi1vwMyQXS2gy5h/zgcvCJX98yNnI0J4qZFRJAWa6izS0aiaK5lSriCnQ2kPXq6I5hrJiZebRSSdIar0g+gbssKSy41okZCgq7UX41fQq5/sWDC+1qJ1lAqXO7sOQzYKVV5Vr0/lsBR3GpcG1Lm4Jadn+aCwIQgnQ1JdQhRO0+v/tk2fQmZbtQI9/Jj/eyn5GvyqOSYEMdYp8BKs3/t+flc+wUcYnqCPukVeCgkh0GZrvZMU/6ARZbFrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9LqgE8dW4hUmHx3D52niMT7JXJ5J/OinSVhVWI7jHI=;
 b=Qthixx2w9YRriWGoRHwZjKO4l9SyggSOpbsvdmXWfiNp9Er0J/jo5E2PDvGuCFTqqX/hDeTf+Tq9Dv1Nm2c4+tRdBIlZczAdBOyh0qxH4fjxDlMMbYWnGRRDQoJ9fqniJMy3hxnVE1ZjBtSUsQ7v3FNp39AZnXGHS7f5chqRS0ZmjshHBWbZ0FMMuIkw3Vl2o7cFLFepf9exEVSbz2H7qsA2leHs58BZBRC+p2d3+9OJ2P+HSlmssUg+pP4c3OWKq1Ir+cJW20ZebUnVwB4lHZAZbnJLKemNmbuB+xHcLyUAYBfUEOMIZmyiu5jebmgjhGCNXNwIyiX2xMesDYp2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9LqgE8dW4hUmHx3D52niMT7JXJ5J/OinSVhVWI7jHI=;
 b=l/7jiCeaGjcXkxOTj1jOs8kHsLAltjB64V31lNCuEjsE1YSltn/51KBVxuv4ciORCqg1jZGKCG0fuhvpYsPlnFdQj/mTDVnJM7ocPR8dYmesaaAXNurh4dgzdO5LlJTTi7nt9Af3HVCqVm4FbMRYA44QjBAnXLJI2z/2VMuXV5Q=
Received: from AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30)
 by AS8PR08MB6311.eurprd08.prod.outlook.com (2603:10a6:20b:290::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 16:08:05 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::2f) by AM4PR0302CA0017.outlook.office365.com
 (2603:10a6:205:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 16:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 16:08:05 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 16:07:42 +0000
Received: from e132406.cambridge.arm.com (10.2.3.22) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 16:07:42 +0000
From: Deepak Surti <deepak.surti@arm.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>
CC: <deepak.surti@arm.com>, <mark.barnett@arm.com>, <ben.gainey@arm.com>,
	<ak@linux.intel.com>, <will@kernel.org>, <james.clark@arm.com>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 2/4] perf: Allow adding fixed random jitter to the alternate sampling period
Date: Thu, 7 Nov 2024 16:07:19 +0000
Message-ID: <20241107160721.1401614-3-deepak.surti@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107160721.1401614-1-deepak.surti@arm.com>
References: <20241107160721.1401614-1-deepak.surti@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AS8PR08MB6311:EE_|AMS1EPF00000040:EE_|AS8PR08MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6cfa09-29fe-465e-6561-08dcff4663b7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?1PV7PJDnKvnlG1CLly/JNYmtzce17tZ2rhz85qzeBg9lRW+nHiXSL7oXwTzV?=
 =?us-ascii?Q?D0lBLTLzqeYi6xIMc1ot1cQcsmVghQxqL8MSq59FinUfQ0GeM9V/HDQhu+QY?=
 =?us-ascii?Q?q1r8SZHxpUDQAPBddWdVGbq9kHDQmpW8BIyhofx7RHV2FAo8xBPgkWY2G5lc?=
 =?us-ascii?Q?fXAhNSwCzVQXDgb7HKmZdCZnVetIYJPFqze9v2OK7Ivt9ARdp96DyhZADjHD?=
 =?us-ascii?Q?/vQs2b5nPr97M5f5EqzPJ1xoTZB7rt6Gyw58haOdicX/GYizXJG1mwt4GNHX?=
 =?us-ascii?Q?z9j5CtzKTj5D7xv/l0szbansTrwsAB/AMrMgSpbLa+kgi5EQrFkw7ZFVViI/?=
 =?us-ascii?Q?a+0NyKa+0K5uZWwWjV2vjS9SHkYSr1FaWC2Og2dQ/JdD0Br4e/IqTtynoT+7?=
 =?us-ascii?Q?Cg4qO+i6ft5o0809E10F3DdgM17ifUNRGJ0HPZKEaQj7E/874Al5y8jHU92P?=
 =?us-ascii?Q?YLcVMyzq40efS/K5tWmoqtw654awvCdm1+DG9yhqT6RrfIhGvTCVgrZ+nMsK?=
 =?us-ascii?Q?/eBmmmCJfaC6t/nbXhoUOCwYF3TDx21AlRJohUowN5t6cCq6IebduNrkP84M?=
 =?us-ascii?Q?rRX6Ob0QEqSA5eaN2keNIluaO+2L16IGXwio/DVR7NItXj21SsveFIdG6wFD?=
 =?us-ascii?Q?0Us+3oeIogLJLFmAE0oETpEOfEJrGRfSg91/2vZQwk1jBMjEf5kX/S+fhISV?=
 =?us-ascii?Q?wAIq21Yc//o3pZs3D43lNUN3C20SQCHSzohsuQTdyd6WI3EXSxjpb6a5PLnM?=
 =?us-ascii?Q?DNnRz+uSg4/2XXfhp8ZyK0JuB6G9vQW1kj6KN68+8uFjIb9fRdk9IKmzb1ry?=
 =?us-ascii?Q?A3OE7l20+3HucdKfkr/yI+duFpcsaDxC3Gz1hVqmwS7TR3L97ZC6F1dBMjsG?=
 =?us-ascii?Q?yd//NMv8T0XEcU1CoazqRgznXZKyoJ+6XtJKf1D4vhQd6xuetOvM2CTJAUTf?=
 =?us-ascii?Q?lUItBlFOjj87gsV76O46EBGQCf7veO/FIx/oCDEFd4XsEpO3lSx493mtZzeE?=
 =?us-ascii?Q?Dzdwlvsh/Z1s9qMjHAt9+z1qXJGHCx6T9PcwXewMwAHWqTiFfRnSbTx/0a5/?=
 =?us-ascii?Q?99eylGKaLC6KITUAe6XdBuqmkZ6gbbAU5mjzfqxaF1lLoUMT//ZyRKoWNsdr?=
 =?us-ascii?Q?MSuBwKWUrlzIXU0w9g4O68k0mcYNOrp/Hcj3dVKoCfZ+XKR6SCdU+yFsGeSb?=
 =?us-ascii?Q?amu7YMw/CYY5SlrFamd8gzE09Q70oVHbpclbOptb4q/hJbvxWw/XA0uyUJ2B?=
 =?us-ascii?Q?knvplP2WuKCIt8xNJzWbiX1oQu58ph0A/S1oR9TZM1y4GCKrGw/NVksBN8GA?=
 =?us-ascii?Q?wcmKmejIlo3vEi3N9ZKYsIv5iUyushySACP/Jhav1QD+1JVLfQvVbKHVFiIO?=
 =?us-ascii?Q?dquI7DBjcyxwPNHQTY4XDWqcNjzetnTY9wENVrN0TG1+3VgBDA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6311
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:205:2::30];domain=AM4PR0302CA0017.eurprd03.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fb36313d-646c-4e7b-6efe-08dcff465d21
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|36860700013|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9L6GOY4DQ1ZHKu7fLLBmxSuB/lQxx1phdfruAQyUNh9HJz0RYqBIsm3njNu0?=
 =?us-ascii?Q?TV+7WR+sKIksP1oL6J5RONFC2L4PQCL+6jo9HwFrmsQc58/LgPwJ4t7zaboU?=
 =?us-ascii?Q?kLwBLjMGbrgPH6nUDwktKdK0IXlDsqh8URttJ1/ueb4S3k/0IdCmIp2VmXGG?=
 =?us-ascii?Q?13LoLEhqjOonQw6W1w/xWUPnYK3ygbYNhHMbmFKL3NOiTlVaJDAAdt7lhcie?=
 =?us-ascii?Q?bVOLFJdcOpDNMLVtgTXpi5B4vodWSUDYzzKXRJLue6Ww9Nh2dPtu0K7eTvEw?=
 =?us-ascii?Q?AR2b4Wj+X4+0+kQ9zbQIWZZStmqusghoO71OKeB28xnYaUIyv6nh+21iyeSA?=
 =?us-ascii?Q?FSeTajP4VDmVUWkyF7F1+uf79SagvXQxkMAUCmA/3Ja8cVZOCJXT7xpGopOm?=
 =?us-ascii?Q?2z8W0HU0QR+KnAZJoQqufoFElBpIhrIrigpRgV382Dr1NUpWFTPIb9VZPkhX?=
 =?us-ascii?Q?aWMH/uGQlkcF3g4RxKPeC/IRHW+Pw74/LjsaR6fazIWEo5BvHv8Sv+OIDpWc?=
 =?us-ascii?Q?xjshA6UOx/d8Kw6ow3Aq7ir1z1ol3sQoYhWLJO19VchYa6cTRL87zrDnsi/M?=
 =?us-ascii?Q?Ik9ga3RYUsJdMyvxCQ3XsQweNAIJqMwe6CFBe1cO2EKSfy8ezpIGQLYrj1ZM?=
 =?us-ascii?Q?ExTMyaVQohkI8NweEVOXT1VDNswGbFFRs2wT5t2nl6cRVWWdbpcAdPmQR5tb?=
 =?us-ascii?Q?78fTe4oaq0ok6s+febEWyzpEj7WR/uPuTd83/n1zyKS6Whldd+vBY2DJ4vms?=
 =?us-ascii?Q?gI4EqTieGpsB0kKxIkeIALnzbfkRpLFk45UsqWN0PbFONBH3eZZlu9Fb+GX+?=
 =?us-ascii?Q?ctLCkwwo9Bf0HlbabAJJopwiZLs1uNEzChEOJQSktqY9UV0Wg4FsKpEqbkmW?=
 =?us-ascii?Q?BLxRVm53KURHSahdDKAMsHEDGZFFFqS5C91dV72K+UJDYEvoHlVY2AT0ioUi?=
 =?us-ascii?Q?yiWXbaZrdwauIdusdT1Vt4CotEgK49u4ZEEPIC9CCz7sxNB2hLxDc/pJbQA6?=
 =?us-ascii?Q?T5rAwNe/G+99jCEBlzR2XpORVld5ghng4lmzJQCYlcgZ2wswDe42GknNHT25?=
 =?us-ascii?Q?V263vaWEBNUCUW61Cn0sykvd3l28q3UicAcLS4xcAu2/K2X3b604k3RM0Dxz?=
 =?us-ascii?Q?7UOMT4BDjNDnnHoFlcomEDGxfBticmvXtLcGsS55ZKObwd0C+Y7tGYh4TMZm?=
 =?us-ascii?Q?ogxkeFr1w4CbrRUNt2Qq+Xym/8kq3F309UowVwhe1qdAQe7/R+rD+E7vByhj?=
 =?us-ascii?Q?Mcf6yg4OCuN4y64P20k5LwICOYYJIRJJKXqfROhnzW2NVhtQESj1TAHVP9vb?=
 =?us-ascii?Q?Xl2yL9ZCQ16KcBDJ/mwY1Zdb4B1hzbmNpM1LMv+r7JGtEUCt+v/sBJGGRKcA?=
 =?us-ascii?Q?2EJu/dtKW5Gr4IZgptaAY/S80+sB0hXNdR1vOgg6/FPieprzOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 16:08:16.4899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6cfa09-29fe-465e-6561-08dcff4663b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_080821_448105_C4C2AD26 
X-CRM114-Status: GOOD (  10.57  )
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

From: Ben Gainey <ben.gainey@arm.com>

This change modifies the core perf overflow handler, adding some small
random jitter to each sample period whenever an event switches between the
two alternate sample periods. A new flag is added to perf_event_attr to
opt into this behaviour.

This change follows the discussion in [1], where it is recognized that it
may be possible for certain patterns of execution to end up with biased
results.

[1] https://lore.kernel.org/linux-perf-users/Zc24eLqZycmIg3d2@tassilo/

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
---
 include/uapi/linux/perf_event.h | 10 +++++++++-
 kernel/events/core.c            | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index bedae424ba36..16dbeea5803e 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -461,7 +461,15 @@ struct perf_event_attr {
 				inherit_thread :  1, /* children only inherit if cloned with CLONE_THREAD */
 				remove_on_exec :  1, /* event is removed from task on exec */
 				sigtrap        :  1, /* send synchronous SIGTRAP on event */
-				__reserved_1   : 26;
+				/*
+				 * jitter_alternate_period:
+				 *
+				 * add a limited amount of jitter on each
+				 * alternate period, where the jitter is between
+				 * [0, (2<<jitter_alternate_period) - 1]
+				 */
+				jitter_alternate_period : 3,
+				__reserved_1   : 23;
 
 	union {
 		__u32		wakeup_events;	  /* wakeup every n events */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 579b04af70a2..14dfac6f13dd 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -15,6 +15,7 @@
 #include <linux/idr.h>
 #include <linux/file.h>
 #include <linux/poll.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/hash.h>
 #include <linux/tick.h>
@@ -9831,7 +9832,11 @@ static int __perf_event_overflow(struct perf_event *event,
 	if (event->attr.alternative_sample_period) {
 		bool using_alt = hwc->using_alternative_sample_period;
 		u64 sample_period = (using_alt ? event->attr.sample_period
-					       : event->attr.alternative_sample_period);
+					       : event->attr.alternative_sample_period)
+				  + (event->attr.jitter_alternate_period
+					? get_random_u32_below(2 <<
+								event->attr.jitter_alternate_period)
+					: 0);
 
 		hwc->sample_period = sample_period;
 		hwc->using_alternative_sample_period = !using_alt;
@@ -12744,6 +12749,9 @@ SYSCALL_DEFINE5(perf_event_open,
 		}
 	}
 
+	if (attr.jitter_alternate_period && !attr.alternative_sample_period)
+		return -EINVAL;
+
 	/* Only privileged users can get physical addresses */
 	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
 		err = perf_allow_kernel(&attr);
-- 
2.43.0


