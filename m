Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EEBD65553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aoMCpH356omVntog99tdxpr0Qy2Oe//iOD3wmNq6UE=; b=CyOowV9o58A6EUm9+e8QPEMp4S
	K0dp/4str4Z8lf/JPUjUwOTmiOurV2O+ZTJGkWAbiPyxjil9ChFrSO4oK/eg7hnOND3edav4zbk2w
	3xSlZ7LhwKQCaLhKcB2OYUynaWQoar7fq/4oHAC1urR+17ygINYuonlApSRWsxRkxzFRKR/FRFKJe
	+vwkG6PzQh7OVUdO1Q5tZbOyREnkXO+UClAyctgmgt+Q5BOV7bQQA+MhCfF5mxNo8zpdH5+4OuAF1
	qQzZ9ipPUamF4BXRevEcqlETXwD8DFXu5sK6SP+8KbI2LiuoPD2bw5P4zxfaM+BdKV9DhmlHrqcTV
	Qkzh4Mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYCx-0000000EoVW-3GO9;
	Thu, 28 Nov 2024 06:40:59 +0000
Received: from mail-am6eur05on20629.outbound.protection.outlook.com ([2a01:111:f403:2612::629] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYBy-0000000EoPk-1iIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 06:40:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Rx3reIqeAMbD7p6TFqzWlFjtQpv9P0B61XTfN+efr56ZwXxsHXdpyvN3c8Qb9zgh4BAEUGo2B1f9bdt+pBHUyWFNXmqOrCy2sHB8dhfaj9bJXyMUH3oWKtV9uZFxJApzpq7aQxwvzf2v1ASzJIjemCzoXnoX+VKOGgIlPg+wQ0ELywOEjUSHuSpqCxkuR1GfBbHzRA/7OQ4Cb3YeEluLBaTpDeccJoGKJ5xnGQ1TBaQKMyfgc4PEK8gVzaEBYhSKi/Tir+CFDMdRBFg8WG9L7coaVE3pQwQ/rWHhRywbGekkyfdLVvZmhBSRi1dPdr7XMKaTulkpExvldz4RoC0xCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aoMCpH356omVntog99tdxpr0Qy2Oe//iOD3wmNq6UE=;
 b=t9WdwtmexO2L7JEx5F9Cp5ImOSc6CfX/5brJOcWrpWbv2gSkh5Cn2mzyYa2x+CyKKjbnk8mufDzI9L5V/bcsnmpKevEY/2UkEDsaOzkpYB1QynN2w8xt+PFWsv/bVQU/mpFMOEJnrnPVCxSGSBX4MmDuAgPhy2caMV1LldwZ3JNlXelbXVlZ+kN9wXnHQ1Z+VTHaA/mRSXE8WD3HhmZHkCmuswhyvYwU8G7FpgokJoifPaLMFjz05UWXq2AWNky4KY9qF3EXLDMEwqaIB+Eevlx23thq1ZYKldrkx8+rrjGind9dZReRnswMF7nzDfjGPvDd//aRBA21KRkWzDlW+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aoMCpH356omVntog99tdxpr0Qy2Oe//iOD3wmNq6UE=;
 b=MeuUQIMZ16CJQsqbu4hQsycbSVRyxIDeEA3gIB4GYUdb18gA1aDFGu5AZmb7xUWdRjIwWkORLbhMgwqALvHYdWP0MF4hMxPkKwbivlnL3j2iabqNnq49s2keINQ8z+umYbqnZD/Oq+SG2KqxEEe2Oj/4WtI3g19Pey2yP5KrGHk=
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by PAXPR08MB6430.eurprd08.prod.outlook.com (2603:10a6:102:156::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 28 Nov
 2024 06:39:48 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::35) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 06:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 06:39:47 +0000
Received: ("Tessian outbound 2e0b2b8680ec:v514"); Thu, 28 Nov 2024 06:39:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c8a664c0d5c8a9f
X-TessianGatewayMetadata: nDKixdBfzbXPt2+Dz/zblatzw5zj+6We+y1e7I5vZOj334c9psx2Oum3VZ2hC/+mMbfVZY0nrPIIk1iTkiQIo0J8upEr3wKk1ZLmAqL1vPLg4S0HQ1aE1rfAPDmUK8hvrp7XYejvV+sPWdDTvvBsnIUFxeB7wWFb6IxHXsBuK9KBxwxNpbx9RORngiuSQQTOnSpcsGM9a0ThLUAG/zbfAQ==
X-CR-MTA-TID: 64aa7808
Received: from Ledc7acb6e79e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 277FAB56-E488-4395-A830-6F64534C8C99.1;
	Thu, 28 Nov 2024 06:39:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ledc7acb6e79e.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 06:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUxd2ffbSk1RcRpoQ6r0kmBPL+Dhuu0dsXUPH09VVWR73wBfGBUQfagYWLrhysg1BXoqom/YXBnUYbYfb64jzmm2G+rRD2EMMp/AP+wOV3d0u/QcenDyzAnj1Yt+GnsUUzsu/zoCeD9F+SJ1KdBQ8yecWgVuffwsTjGm/iLEVFyjKqVH0Z7fHdkKdIw6/1AfbHokyCEOTlCDwu0cucZtQudgA08SjTyToHu5uDYmqZW+xFslT/J7f0fu7fVBvxudJB7qRiDEIdsMRnXt237dv2Cc6T2gRFK6X83K8O6+XjxkIZmrMKZUdFYwS3nniyD+Td/fKvKa987Rge1i3spDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aoMCpH356omVntog99tdxpr0Qy2Oe//iOD3wmNq6UE=;
 b=A0YdpnOplac/vnH0ZtOGqWa3mgY/3Ad7GNhLtfHE3MkeGV4f+p6inPbj00w60pqV0AVBqvcyFIaR3eC54erFkL39FCK/l/VmbrYZbfg8+0ozY1fkkoDnX5tZjB2Hio7St622yC/zykY5B64uTRloY3kfMazkde0xfM0FviFjC55VyqvFDZFDG1eVYnWxdz/9Q0ZtyTlJB8UNtKsalktkQUCJMLpLANzd4SRd+adzwnmJm3bopaNOAqkfn0iP7eklGS5dA5fMa3VKHqDSp7B3LHbS9njVlKCpikuyvitfRTT+R25PT0RSSCQE/3YOIXUujHM/dJMOdGXaHtNbQCcT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aoMCpH356omVntog99tdxpr0Qy2Oe//iOD3wmNq6UE=;
 b=MeuUQIMZ16CJQsqbu4hQsycbSVRyxIDeEA3gIB4GYUdb18gA1aDFGu5AZmb7xUWdRjIwWkORLbhMgwqALvHYdWP0MF4hMxPkKwbivlnL3j2iabqNnq49s2keINQ8z+umYbqnZD/Oq+SG2KqxEEe2Oj/4WtI3g19Pey2yP5KrGHk=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PA6PR08MB10394.eurprd08.prod.outlook.com
 (2603:10a6:102:3c6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 06:39:37 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 06:39:37 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: James Clark <james.clark@linaro.org>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "mike.leach@linaro.org" <mike.leach@linaro.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
	<clrkwllms@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [PATCH 2/9] coresight-etm4x: change etmv4_drvdata spinlock type
 to raw_spinlock_t
Thread-Topic: [PATCH 2/9] coresight-etm4x: change etmv4_drvdata spinlock type
 to raw_spinlock_t
Thread-Index: AQHbPx84d5utnNsCpUiY+BlleRX5/bLLVRAAgADqXZ0=
Date: Thu, 28 Nov 2024 06:39:37 +0000
Message-ID: <GV1PR08MB105217A184D21CA8FB7C4E6BFFB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
 <20241125094816.365472-3-yeoreum.yun@arm.com>
 <ec11e7f4-ed82-44eb-8e72-5a5094b67cda@linaro.org>
In-Reply-To: <ec11e7f4-ed82-44eb-8e72-5a5094b67cda@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|PA6PR08MB10394:EE_|AMS0EPF000001B0:EE_|PAXPR08MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: ab396c5c-7c49-4ef6-6480-08dd0f777414
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?TyaOWIBDWP5f1X4iP31vTe78XIyhrT/lUJ5oN+qX1w0IIIJenYKP9DL1Cj?=
 =?iso-8859-1?Q?KSB2go9yGSXTa8cKqxaRGJ1RUxBizej+v1PzzuDkkRCBtnAB1JNRyU5lDT?=
 =?iso-8859-1?Q?JXeKYbRLJm8fw3hvvgaUYUqk7E7NaU2qVLLq7cPGtaXLZOPTxvMxAIyvVR?=
 =?iso-8859-1?Q?/7+tWLHfetfCkMPOuoJeRtnoJBHkWCXtd3JWp8pXGKo9X3AyqsY8+9b6WM?=
 =?iso-8859-1?Q?qf0z/feGvCILcJ/rXTyWbS1fY6dNnkuWbfkko9+cnOVrD0BiUyQVtMqrDQ?=
 =?iso-8859-1?Q?mpEX2xqULEEhqToHkDEa43IPrkkzYGfnjZaImPxkmkrfQhZlyReRMhyeg+?=
 =?iso-8859-1?Q?auGan4fKdBOLkhFOmRvjnb7+xyVQNjvtDcMDiHc81jLe2zB+axcfq1HuT3?=
 =?iso-8859-1?Q?/zFSqG7rCTj8Bhvajg+0dZXCDmrpJgFFuWVpUvjmcveYUBfH0VRqyhe9gh?=
 =?iso-8859-1?Q?Azt+2uTYn3bK8AIv1u7Bd5WcZX/nONYdwS/ZBA3nzXuTN7+yydQjY6CcsZ?=
 =?iso-8859-1?Q?VUYxS7Qf8YvXy+Ah4ND+3+QgcEw5HEAIYTfuOqBZC7v5wHWjJMM0E8fkfX?=
 =?iso-8859-1?Q?xWqmE8c6u9B3OtG3DHq3SwRtu93TYMbMCH2fAB4mkcYqgGSTeK56qqB8ic?=
 =?iso-8859-1?Q?79deC3T8LHH4RD+eL0BexsTGhQ3VfDdWEBn0Ke5T1DeddOtLbeX1smQWUx?=
 =?iso-8859-1?Q?ukaSFdRB+JTruRWnxsRmLwgZ+2RCo7kzomPl1rN5uolt3vcGLX5+3Sb/rP?=
 =?iso-8859-1?Q?8NvFQx5qiMItQykZxwzIALElicuDRu7LAA4qBeigsOK+zIwYEs4SsGMJDR?=
 =?iso-8859-1?Q?/gxNiBKl1fMXblxkPnDw97oDxhhlOamoMi2KwXbY693YuJGN3iO084DPV9?=
 =?iso-8859-1?Q?olFYUlLjmgw03tIRZ0kKbRClMvQC+6nmzWgRW3yTjw+5VMcaXUdq8GmXs6?=
 =?iso-8859-1?Q?UUwqM8XflI/4PQ5iAUh0KWzJG24m2ddRUgb0WVXNZ1uNTKffoySV5ySVzO?=
 =?iso-8859-1?Q?8/cX7hmVq0ZCY3JRS3jLVeKvS+2JqtucpnLxeh4nI4PzhsAvPXrxkIUtYn?=
 =?iso-8859-1?Q?It+hZiH1yXGNE1CRcsj+hXpG9gWYGwcRx4yYldsvDLq0T0DMoI6/6B2lD3?=
 =?iso-8859-1?Q?wzWHgAj77PDNJ2RVgLDKsaZKfxMGrIrtQYLLU/DoZBdApIPawp7TCJTDww?=
 =?iso-8859-1?Q?OS0qcH+gcukOaHVkOk3f21Q3AH41XKO+wtvdyYHxo3GlfaKZYbHUpRKL+U?=
 =?iso-8859-1?Q?/7YJAQ2Xxf94WPh4NGE/aJQzlAGcfuRvlnI8HfNXhBBPJnRVcBn+vIVrxz?=
 =?iso-8859-1?Q?dchAAMHGAStj738q+pRyW1Y21KjMT54FXAEG6bFV/0ZpZKPTORf+N4Ceun?=
 =?iso-8859-1?Q?ls6lVwM907H/v1Xf2ynf/VIkXAoYTl481Ymeh07ZiNAtP6BXYTl6iIpQ7o?=
 =?iso-8859-1?Q?1qgzHihtxs7WAflK96UuoTGHvvDC6dXyPdpA5Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10394
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1a37b7eb-48f3-43ad-9a13-08dd0f776e0a
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|1800799024|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?i5BnEc5iPaRCd+LiDnZHCu5ri1FbESy6kSHKZP2G7cb77QLMESc0DBoC7W?=
 =?iso-8859-1?Q?eJb6lkefqVZS2Eqvbb38oCNVJ8Jc0y6Z1MozrsVW4kbXVwyTty5xaElDwN?=
 =?iso-8859-1?Q?4xYkboVHybxSRYICMT6Tz6NN7tFFv3i5WK/7fQGnldxjaerDGfy1IYw68/?=
 =?iso-8859-1?Q?qYQya3xjy4Gl+VAvLFvwdXeH/8O5qV4GmZEk1lgKRoGQoQx9ztdSmElCUL?=
 =?iso-8859-1?Q?+0zpOPrvDpKPp+NtpSwTxZTNtTP7SFZJL/QbtyudF5MWtTbu9X7OdtJvva?=
 =?iso-8859-1?Q?2mkHlgt8I/Y239nc3UGD+URLXlHcVXlIr6M42+r8Q9nBhKLUvIfAFf0mA3?=
 =?iso-8859-1?Q?KPHRaX5gten5A9zKLy6830NckbrXxn3z3QOJCptFNrXexntQk3rDmePgej?=
 =?iso-8859-1?Q?OgwRUnezKn3GGZ7Nk7GmcA2L/fUM6XnfsBQLyg5s97zQ726mikxdaCINm2?=
 =?iso-8859-1?Q?GTUuhy4OqrO8awXzYRsoVfm+Sd486B8Xfu0f4sFjAsMElp9x6KM+d41i+C?=
 =?iso-8859-1?Q?Ov+SUVjSLzeRf+WRdBN0XVGEABgH92tiZAtvKq21ub2nLJjIW1tHY0wSHc?=
 =?iso-8859-1?Q?CggsQQR8dNX/0SU30vMM5ZcoTppBhLy9MJyB7JS8gldILCnmLTxU7nKVB4?=
 =?iso-8859-1?Q?sss4uflUizITfOOxfWTAeAVsz0dDAaJHq4nXC3eq/OlQK69OG8nI06UtCJ?=
 =?iso-8859-1?Q?drzdA0hUqRpMsFaeaD+ROXn45AcE4mbp6V70Ls2IfzB5F42FDTUyl5cbrG?=
 =?iso-8859-1?Q?gfvAhphAcelBuQfbB0SB1NJYceMz1UUO5H5oFKhHo4QB8BSTjij+kMU2GA?=
 =?iso-8859-1?Q?7uldRHkvZIxIjawhxqdGWea1zXazoUAuhVIcZep0SejiJZfNNl4nge5lae?=
 =?iso-8859-1?Q?tz+/SB5gEZZ9pQp9bXIYeEM6mphfG8YQgTK3DjgVzlGfqFyKi5DGdtJPHp?=
 =?iso-8859-1?Q?3v0eUR/IzSK5ahY4dv4sznPyNCkCDiR+VSts7r7MmFXktVcIe+DMtonwra?=
 =?iso-8859-1?Q?If5kwNRw5ZPOu/uv3nYqoh10nbQCE1Zr1hYclCjHTm6+pBofhF/9mPMuTq?=
 =?iso-8859-1?Q?oRLv4xj+ESh6+Yb/JISYwDiKtO8v8+6usnV1tcHiHF1yRE9KhP4L5O86kb?=
 =?iso-8859-1?Q?nJ3jb26rdFtYSxqrdmlt5to2gjGNHl1hyUawKAvXU4T5Lpzs6wuiJ3MwUD?=
 =?iso-8859-1?Q?WFR+7ZqxXMdag1jkLG2DruIKwNaXDHt0dKNv60kpn1DJMo7gPPdVcbGWhc?=
 =?iso-8859-1?Q?yqT/CIyJG/oF+jC49Z5kXDR877cIrVoRTBIIOECY+FlUR9PYbRKqgUFgrw?=
 =?iso-8859-1?Q?oc7i2i5HoTjKA6FVt07fF7P+kP8z1MKXELXKsZq9ELK2DkaAETlUPysumJ?=
 =?iso-8859-1?Q?qaiFKkBArJiYKtsa0oENvvT521mDIQ0GFFzmJijiWUBX+YN3aVqUf6APj8?=
 =?iso-8859-1?Q?0gSmOD8Fei3LwiJBWMS3hQOkFOYmxBLgOV78J+tE6CpP6HcQITG8Eu5ERd?=
 =?iso-8859-1?Q?oH+r9SPJzTg0OGBvZP+/2b?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 06:39:47.9028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab396c5c-7c49-4ef6-6480-08dd0f777414
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_223958_601633_B51CEA0C 
X-CRM114-Status: GOOD (  15.13  )
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

Hi James,=0A=
=0A=
> There's a lot of churn in this function just to use the new scoped=0A=
> guard, but there was only one lock and unlock anyway. There are a few=0A=
> other cases of this in the whole set.=0A=
>=0A=
> The scoped guards make it easier to write correct code, but I'm not sure=
=0A=
> we gain anything here other than a bigger diff and more to review by=0A=
> changing already working code. Having said that I did review all the=0A=
> changes and I'm pretty sure they're all ok, so I'm on the fence about=0A=
> whether it's worth going back and undoing all of them.=0A=
>=0A=
> Surely updating to raw spinlocks is a search and replace to fix a=0A=
> specific problem, and the scoped guard stuff can be done on a case by=0A=
> case basis when anything is re-written in the future?=0A=
> =0A=
> I don't know if we're considering a fixes tag, if PREEMPT_RT is 6.12?=0A=
> It's probably not necessary but if so we definitely want to minimise the=
=0A=
> change.=0A=
=0A=
At first, thanks to review :) and as you said there's no functional change=
=0A=
except change of locktype.=0A=
=0A=
But I thougt making seperate patchset to change locktype and=0A=
apply scoped_guard to two patchset makes people do duplicate review for=0A=
the same code and almost same posittion.=0A=
=0A=
Since there's no functional change and reviewed,=0A=
I think it doesn't need to seperate..?=0A=
=0A=
Thanks. =0A=
=0A=
=0A=
=0A=

