Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1724ECD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYI8cpfd4sqZbXvqtj61icNlYBRsihBzBXZXwL3AN4U=; b=oA0mZoCJ5dpIR4b9Blfeld5zMF
	uSWG8aQRA4Ftol/Nzv8KFI9IMXi+cXY2Cp8TcP61cgnO42VSx2zRq7LanO8tsUwNbcvnGOjz6pKS9
	3q2MJFbe/12kiyB5KaEWASY8Kpyt45//Vb3/eJO4SNjBwIVrJA1rF+W0/mwOUdkGWw4AVvqxYF/PA
	0XzDZlqW1EQcHgegYCg9K19VZfIuR8SsF5myU+uj4yS448gj/FZ07p2eEoWU4+QVt2dRteTzFazfO
	eKBgRtTKFPpjOM0DZaOPwQnqVzVC8zkengr2boNW1M3htQx6bhzaXJe9+7dWpqZ8LHa75ZJFFqyR/
	6Ara9NqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYDe-00000000IBs-19UR;
	Wed, 06 May 2026 09:07:02 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYDd-00000000IAt-0dLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:07:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j6VvIvJ7OVmLChQsuSWy/2zQhexmzDZyPT40HIgnJDAm/qP+aRaUQIl58WXAsaMEqUxR8OkhABYMh7ZwD+sCTgPLeDAc61zeud7NGc3W6t2e5u69Wu5FI6t7lQJlmNN/0m/qfExPC5TYYjWQk/IBs4+KfzMz+HKemRnvWPDbGelgaFyNt3flQAAxOOxlsP0XoiJMWw8bFyTy85O5h3jE3Mnj1aek1kXmEOpkSXlGzzqBYeOhHussXSi+5t61ARpPq6fZZ5XENnP4w0IOViMKhKLkaq/zUao9O+3ANZnssdwcBya6k2kF01BaNa73WkegtOItUOlnm7CqyGBgpcQQOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYI8cpfd4sqZbXvqtj61icNlYBRsihBzBXZXwL3AN4U=;
 b=fZY8A8GcIEi7I5nr/4vVh4MGd7+kIxEokYl6MTlQ5oHi2lFIdefNJQ10dV18UR3wT7lZCPfmPD1RjbXl+gveTpsO6iIlkiPt79S4ZGMU8q7HVLg5HDZSSveB3CpXcGm8kmg2nVPqklzWRwB2Rj1Yet3bsUDH6t7wUGNRXvDCxEhUS1lu0ac6IiHYzsp8AYowStXuNr+YlIkOo+J44KTU5q6C1G9EwEyLQto7VRAx3dzy66hSlGVg1gaIZ2nQ+l6xNr2ZtrIRUCTlB+y7183WewfmxlVt518+Ch3p+qIrNvwL3KzDC3/bSBWfj8MT7DSJWJ9xkANxMwnbtCMcgsXh1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYI8cpfd4sqZbXvqtj61icNlYBRsihBzBXZXwL3AN4U=;
 b=QQWBvP3zysir/P89T/zAeCFVuZ795A4uwlr9htxDd6z8ppWv/Tfq3KCiuCe/opwu083ewhHjHQgppP1OSfYRNEaLl47mYCb6ad6T/44vFqHoWeAQGaOu8ePb4SRejHNLEUmc8F/xUWPf1iVJGnZOe1VdcfxCS7dd73XjWhC6vTQ=
Received: from DU7P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::26)
 by AM9PR08MB5906.eurprd08.prod.outlook.com (2603:10a6:20b:285::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:06:53 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::b7) by DU7P251CA0002.outlook.office365.com
 (2603:10a6:10:551::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:06:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Wed, 6 May 2026 09:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vP9u4+8HJcgTBYzXHt4tU7JP/e/Y7QDfJSvDTgtP9toAZznTL0Z4IliS7I2EYvjwWYdfinfdRjtDngUiwCV8mpus7+mToh/M635rVZpiTmrIB5cyH+9Jr6w9RtsqT6IN1eWX8+Rrkzww8VPzWB7S0yj0vZKs6WAL/fzUG77sdBThdDgIlMctQ6f8hzZMwqDgv3gUfAjpCEULDCbOzr/L77qNEifZZiltlu/4Cn6IV3XgyxIyUJu02njRpQBXjoddU+oFJYqH46Oix4oOaItmJcN0d+YLcOxkVUgQHZgqxorrQfDFVFfHrOP6UamZtYBvtaWzvDHUgEp8QCm6D9CHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYI8cpfd4sqZbXvqtj61icNlYBRsihBzBXZXwL3AN4U=;
 b=JxPn7XmLAJsyW2M7dSDyznTI+Fag9jRNgMEXvgX6jOYWcp3iY1/tIzxNDk/8C8HRvTEBQIboG44Iaw5vIX9hIAGUbEXsthNufQYnEIfaaeB6Xqttq/iPP3u1uX6s9aHd0R6bjWrlR4KM6/726FW4hT3RiAy0NZYKKm5e5w/jEERQV3MEL9Z1ID4wCsi3IiWS9B9KvZ3twnvZZtIi0B2vtxxPfS7sDUbx15le3Sb+xkKz5OL3eC7EMuNGVdTrBrVJEOal3kL4DnRL5hEu/uRZkauawrJkdg6nEpQ6qg6FF0nIdaYfTQqo3lJXv6AJWN6GHdyXIR9Q4HdiPZJy31R/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYI8cpfd4sqZbXvqtj61icNlYBRsihBzBXZXwL3AN4U=;
 b=QQWBvP3zysir/P89T/zAeCFVuZ795A4uwlr9htxDd6z8ppWv/Tfq3KCiuCe/opwu083ewhHjHQgppP1OSfYRNEaLl47mYCb6ad6T/44vFqHoWeAQGaOu8ePb4SRejHNLEUmc8F/xUWPf1iVJGnZOe1VdcfxCS7dd73XjWhC6vTQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AM9PR08MB6051.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:05:49 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:05:48 +0000
Message-ID: <f3d3d2e6-65f8-4ea9-91d7-4b1fc3882a83@arm.com>
Date: Wed, 6 May 2026 10:05:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/27] coresight: Move source helper disabling to
 coresight_disable_path()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-14-fc7fb9d5af1c@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-14-fc7fb9d5af1c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0510.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::14) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AM9PR08MB6051:EE_|DU6PEPF0000952A:EE_|AM9PR08MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 531b6d22-7540-4901-25df-08deab4ed0c6
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: iXJt9gzAYWZo0xUIX+by/pxbJlCDO/micCq9XY8deGFSwooQDSFUt8MhNwd3vh8NJsc7jsz9aa4yR5pVlWtmq6mjfc19o7OW/1LEFZUip7Mo+9tWhVieWOb5Mgea69591QaTmVw39LBYitm2p7NejmYout4k5z6i4D3jh78NTsbfcCJTLsDG0aA7PK4i8jOQswlWL6n8WkPBMdFnQqWnRdZd8xl6eH0WrT7oTTQ6HDZeP9QPL+Bqt7C7Rul1WdFOBdYNrwfJTf0zhheikwIKidP49MY8RDfMwjqdy79nlOxubCHruDDBSgsibNjV/qCQd7kZJwwyGbU1wnzjVEXkGP/TUl11dTa9vBnh0xvE1EJuv5O8IaAKVL2V1LL6As8r+DjtMIXdvkJLn734X+cHKgJ5wWGJ1CWFkc7iKjd8VflgDuGaXbA1biiYKRnDm79yZ06K3fUwKKr5vZiuVGrm9NVq/Fv+xi3uqj5DlBS2peQWTXiKmkXH9VklUKize6R51GMOpzWSeWm0jqE/RxyKnJyxTUy1RQbWBO2hIvplYMl54ybGIxnTZT/RvYyaMbo/Ro8focwOwIPXeE1xLthrmGg3YS9UwoG64aBzAvgefBgl6O36NwpWEYUiUFiJFv8FWS7Mt2wdtObRdG2lyVQT+Lclfd+U/o2bhGnio76Cdi5ncmc3NRKEVcTyYKOidZj+OkDQjcg5zHoYwzGQDZ8tcQclbmqhFMpQRxVTCPQHTkE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: wE4b8etkCktdxOTXpW8VUlwDhGWdWo5SJXnQEcCc4Xx33PfUS6puI4A+JV0Moq6QNmIEgE0rMFLoKjk/ET0e2WUqA6SaTX77cpOHG5pgN6+zuZvE1v7EEkDZY9ULgW/ZulbuV07wQCCAftx28jsixieBG0wHvCLZhLhaZnIKB/wwFatY6FLtQEMfYdUOVw2B3V2nKWuMobFenv2VQtW8b5Ba2cAm9QltNTp0GGgRDSiqU/choEsHqXjSw4Ti9TKVdpPV+Wvvv4V6mrLtLdD8IvUNoauqMfZTrag+/Dtb4u1/9KE4I8dNZR02Lp9TPHR+siy+UMvmZsemRRrjIZQd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6051
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe3dc4aa-8464-4364-5e19-08deab4eaa66
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700016|7416014|82310400026|376014|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: DMuIegev+PSUPIiMbcrtDhTuZCLY1rcJFIfaz2/Bn/0y9nQqFIvFJ5mgRPowVlmuD/RiPZLoak4nKS14o80dFP0EdfysIIa+fwCXOzad73LO5rpBwLZjH4a87AC2L6rwvjLgC4h9vzqQcIWj+0UhClj/vV3VhZEGK/CtxiarFpPLdc1mzLV3IlnyE8jNyVmmQ3VCfEu7zD4NeeMePN80dT27RBHrbUE/u9XtXYxWLo7sm3bYPmx/+6vxS2GT9yT95809yOKYO/+Nhrtl1rkInw88FfHZbEi/ehpOtXPWeyheGtRj/SxfNc1lJoEpEMuX3UoOlbcX0Im0rgJUzEvj51FedpFW2tZNWvJC9GOeac+Ten2qxeWSj9JyRt6uO1XOyP03Or371RvP5NS4pFOlEX3gzJQxvQz5FoBVwv73SVV6CWpJfoJbx02w4BaN87O6NvxorOFt4NuE3ZB/6cQotQ9VEEZKYwoI5mOHGA6RXT4LonkIa3urrAz4U+RnMRYE3D4eZs73D2wz1aHTDDy/5wKuaKv44IijkbCRUDSOx/nA/9QplG88AdwXsp5Z3PO2MWs+qB3kUE3KzxXgL/xKBmM8IoyMgIXJsZCx49WCfu5bqShjJ5T5DLKd0RvXuWMGXS3wovcQXXidU16bWL9uLcZpK7PSl0CbrPt/oSMpSY5u6Lz555IlPLElPq7egzXcDJXYw5xBwBjne7zx6LdXTAuW7Eg1LxCtaVmSzpz1hebra+pSSodXk1R+pGhxeG45y0tfMW1mk+qccWv3eETDGg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700016)(7416014)(82310400026)(376014)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fJR4fhEvixbkSIeQ8KMWwQHvrCxttTgO/T9JLmwiBsnQMRr/mB6B6CeB+s64hNmBk4Qo0X/titm1zqDHo7YsGSPMphXpR5A+DyHGCnwjI7CAhCmwT259kjMimNRZEwsThr2GdMCzjNgDMPugfNpbU4ReRGoajHcSd0U6H4VU13wCNOC3K5y89tUH7p9qK6hg04I65xu5ee8QW1VVHSMQbifA5ilgOVVY/wk63deYzRqkxP+LlR1ZheMdC4kHa8XiWQYizhSG6mF2qC+mTWUbn+o4qrUJbvkUcrxwPz/Q6fdPr5YWXNVTFT9lrIVdOOtamWc96kezUTJ8Av9LPrAvFCE+m4+8tKPK+s6cDMzmW8zfGbVBKPM1tTKaCmBNSj7yzXYXrkUhURiqQSPTc5+hs2MiftK1mEGljx1pNZMKA1iXBoBPPsNvFJcHn3RrPyVl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:06:53.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b6d22-7540-4901-25df-08deab4ed0c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_020701_337666_98E23B0D 
X-CRM114-Status: GOOD (  28.33  )
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

On 01/05/2026 17:47, Leo Yan wrote:
> Move source helper disabling to coresight_disable_path() to pair it with
> coresight_enable_path().
> 
> In coresight_enable_path(), if enabling a node fails, iterate to the
> next node (which is the last successfully enabled node) and pass it to
> coresight_disable_path() for rollback.  If the failed node is the last
> node on the path, no device is actually enabled, so bail out directly.
> 
> As a result, coresight_disable_source() only controls the source,
> leaving the associated helpers to be managed as part of path.  Update
> the comment to reflect this change.
> 
> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 38 +++++++++++++---------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0c11e7fff1bd5cf504b17241595d83a1d11bcf40..6ab80ae7c389e9031d4ab065d83bb676fd12160b 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -447,19 +447,12 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
>   }
>   
>   /*
> - * Helper function to call source_ops(csdev)->disable and also disable the
> - * helpers.
> - *
> - * There is an imbalance between coresight_enable_path() and
> - * coresight_disable_path(). Enabling also enables the source's helpers as part
> - * of the path, but disabling always skips the first item in the path (which is
> - * the source), so sources and their helpers don't get disabled as part of that
> - * function and we need the extra step here.
> + * coresight_disable_source() only disables the source, but do nothing for
> + * the associated helpers, which are controlled as part of the path.
>    */
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> -	coresight_disable_helpers(csdev, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>   
> @@ -486,9 +479,9 @@ int coresight_resume_source(struct coresight_device *csdev)
>   EXPORT_SYMBOL_GPL(coresight_resume_source);
>   
>   /*
> - * coresight_disable_path_from : Disable components in the given path beyond
> - * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> - * disabled.
> + * coresight_disable_path_from : Disable components in the given path starting
> + * from @nd in the list. If @nd is NULL, all the components, except the SOURCE
> + * are disabled.
>    */
>   static void coresight_disable_path_from(struct coresight_path *path,
>   					struct coresight_node *nd)
> @@ -499,7 +492,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   	if (!nd)
>   		nd = list_first_entry(&path->path_list, struct coresight_node, link);
>   
> -	list_for_each_entry_continue(nd, &path->path_list, link) {
> +	list_for_each_entry_from(nd, &path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> @@ -519,12 +512,6 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   			coresight_disable_sink(csdev);
>   			break;
>   		case CORESIGHT_DEV_TYPE_SOURCE:
> -			/*
> -			 * We skip the first node in the path assuming that it
> -			 * is the source. So we don't expect a source device in
> -			 * the middle of a path.
> -			 */
> -			WARN_ON(1);
>   			break;
>   		case CORESIGHT_DEV_TYPE_LINK:
>   			parent = list_prev_entry(nd, link)->csdev;


--8>--

> @@ -580,12 +567,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   {
>   	int ret = 0;
>   	u32 type;
> -	struct coresight_node *nd;
> +	struct coresight_node *nd, *last;
>   	struct coresight_device *csdev, *parent, *child;
>   	struct coresight_device *source;
>   
>   	source = coresight_get_source(path);
> -	list_for_each_entry_reverse(nd, &path->path_list, link) {
> +
> +	last = list_last_entry(&path->path_list, struct coresight_node, link);
> +
> +	nd = last;
> +	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> @@ -639,6 +630,11 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   err_disable_helpers:
>   	coresight_disable_helpers(csdev, path);
>   err_disable_path:
> +	/* No device is actually enabled */
> +	if (nd == last)
> +		goto out;
  +

This hunk seems to be different from the one described in the commit and
should be a different patch if at all we need it ?
Moreover, this looks unnecessary. We already do the check to see if we
didn't enable any device. See CORESIGHT_DEVICE_TYPE_SINK case.

Suzuki


> +	nd = list_next_entry(nd, link);
>   	coresight_disable_path_from(path, nd);
>   	goto out;
>   }
> 


