Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC4E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNiOon/jLCyoBxN7hBKOnTEYXyWz/x1HeBjjKRHVtI0=; b=x32NHtRFVXCeAWzLFSMAgGv1Ab
	CDbizSzZvyDTKZIOb4/c+Pm7zHuJF3Zf5PO5LM4pW7hVtZ7Ysw7yziCwVKQ2jHv5W2eMcg0ok94PG
	I14JL9Lgu0u8c63wt0PALBt4fwp8vMy4zqEnGkohmSWKpbUaOhbIFqW7onspW+5uxGePvvETV7NtU
	zfGRW4w+SfQmWD7Ul2K8Ru2k3/WHkcu2AG4ll9BemehQJ2B8Ssu5SV9GaU76lVoz+yjOLu98qPgdf
	1mW4BS8QaFAfsdfJ/jQbKcD2QwMUoZaIjqrJ0QSyYnGhIUvYgYOXWPKNfeeEI+RbzsZShPHHQtL8u
	Bi5u3jFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnDP-0000000AYPM-2Gvm;
	Mon, 23 Dec 2024 18:31:39 +0000
Received: from mail-vi1eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2613::604] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnCC-0000000AYFn-0qvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:30:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DY0DJBm4GATVqNHBQKY2J9pH9BkWR9F5vStatqkBHKxX0swYD/AXn44ZnRMfcBkPMgE+YAjjhcW1VJHTw5SqbJMEfI5KdMhpg1uwKcmLrSEbO/N28x72LPCc52c+x3m5HW9fN24CHqToup2nMYNcnMNajmPv7HE096LvX3Ju/fuvGOnPf4H8UBtLThtUg+UZBn04PD4cpJ8d7lbdyYwECjUN2G6Y+9R2iuHMxIQ0lrTeJZrXeqLQ1lmhBL0uFiTseHPc3kWCChGIfEEAjLbTmEhRxClpkVyFoUFSsi69p/+4IJddG/kPLTNvzKDg/fVsJ7dXCmPkqDBPANSbJI0cuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNiOon/jLCyoBxN7hBKOnTEYXyWz/x1HeBjjKRHVtI0=;
 b=vKEQYhKTfTGtHA2D+M9BRpI/MI8YG0Vs2Js6SdzKlJCQEVtlKQQ0mxvtgav7Xy5XUv9d6hf3ffPrWDnnLXm0Iks7NdcNAtgByJrEhK4WU85tXlT2L0BvZHTHPe1UpWvJnTM/PVQ8m7IywYwWmVSnQzchwJVQx86YyetBRslec2FHvXBKeXfVrFoPBdFdCNUO1o4iBV3nLFmNNXe72uPRP6thxRvir30BNp3HUQTgLRaqsTH2oJiw+9fNiieAReC0d3iJXnHQwvYewT3qZSjv2wJdiAL3scaGkdS2pqJsCnljLAd2wSPAoV9o2Y2BmQjcICOM2bceeYKUrIeJ3peURA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNiOon/jLCyoBxN7hBKOnTEYXyWz/x1HeBjjKRHVtI0=;
 b=g+im+mDBOEKgoedJW5hGLcJa1zmibJJP2EHuai+C/KTRXTckq52azkMazI30f8HQsy+pVtKesyMChJnR6f6bBqL1H6BzKceRIlyM90B9BmcQ1SqAA2zehQFKL2BKT5eGn/infgKEbR6ew4VRhiBzBJqW3gpxBV/2wtR5TjX38SU=
Received: from AM6PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::40)
 by PA6PR08MB10765.eurprd08.prod.outlook.com (2603:10a6:102:3c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 18:30:10 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:209:89:cafe::23) by AM6PR10CA0027.outlook.office365.com
 (2603:10a6:209:89::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 18:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.12
 via Frontend Transport; Mon, 23 Dec 2024 18:30:08 +0000
Received: ("Tessian outbound 867970499bdc:v528"); Mon, 23 Dec 2024 18:30:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9090d459e10bf1c
X-TessianGatewayMetadata: L6kRvOYUdYkMhjRq07q6ZvMiLRSzptcarEPpPb77vStgqjBKXbKbl1B4Nwof4xR3oIaIvHEteYRWzXKooX/WyhH+lXkXaG//Pg/l6gX8EJtcvIAZtOM7h1QaQDhlWCPSzywi0inoC03ID37jxsRRSw==
X-CR-MTA-TID: 64aa7808
Received: from Ldde9f1f55b0e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1875A6A3-7D1F-4246-AFE1-662BBC1E910F.1;
	Mon, 23 Dec 2024 18:30:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ldde9f1f55b0e.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 23 Dec 2024 18:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPh0M69Lh3lwNOPO73wFiemtE6lt/XEL0yYzbc0FVYZoncZxy9/GXI1pZvHAl+zsMeRnFDnOTmmJttNDs00Xcs0FPhbSAQsNLyoCqMUgT6RdgJ2Z1TCW79RkvxH1nUmTfxzb0txFzPXcmCuLtE+1amIOZCY4EoBqh4iDrGeL2VtLIyXjZ3xpUAnpvtqoJdhNOTgzMrT6WRPyZFJ//DKTtM6xIQpsMKYrtI68DUegZWNdk51v82vx5hbF8zcHDN0Rc2/fRM75YWsH2RQdhHmpgs3Fg4arUdYdHpGqj7CGgAmeMzGx6MrXgnl4mrb3GbfTC4zbwh+kXUYPoo7EEx+JsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNiOon/jLCyoBxN7hBKOnTEYXyWz/x1HeBjjKRHVtI0=;
 b=c5UXF1JFozVZlCZeBvXky8DuroFiEXhroODfNL0/U6jRU/tg0DiloB+12hKVFCdSEcx2GcElvPNAnGuCiSP5keGr5zzEYx3wd8aWeUm8wG18MnxcDKg5plD+feqGFbghNTvaGl3vn1VgdypFxZ9XBbpMGqHQplztQFbvKXW4+M+0Ym4qe/vCJ+lg25C2YzmRqfn8MF0GaBbpgPevqHovEdhQrrT9ejBJ5CLOfvCIMf1h/lSdmmETisXBe/VgI3odSYEAcLOi3mBbSOZjfTMXJfpkUpsn+E1zfNv9BOkCmmAwAUt4k7ZK9zogHgHD3WcRnFXmkTEM0cJbwXi4AZ/gXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNiOon/jLCyoBxN7hBKOnTEYXyWz/x1HeBjjKRHVtI0=;
 b=g+im+mDBOEKgoedJW5hGLcJa1zmibJJP2EHuai+C/KTRXTckq52azkMazI30f8HQsy+pVtKesyMChJnR6f6bBqL1H6BzKceRIlyM90B9BmcQ1SqAA2zehQFKL2BKT5eGn/infgKEbR6ew4VRhiBzBJqW3gpxBV/2wtR5TjX38SU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7554.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 18:29:54 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 18:29:53 +0000
Date: Mon, 23 Dec 2024 18:29:51 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
Message-ID: <Z2msH5No7NAvFxcM@e129823.arm.com>
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
 <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
X-ClientProxiedBy: LO4P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB7554:EE_|AMS0EPF00000192:EE_|PA6PR08MB10765:EE_
X-MS-Office365-Filtering-Correlation-Id: a45630f9-36e3-48c6-ee18-08dd237fd43a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?xDD5/PUQfGaBXEiMkbDGZov51fcDMBiqrLAIK/dzMXMua8jyCE2FPRYQoqFN?=
 =?us-ascii?Q?vVMADpeXsrNIJwv9gxgQpQLT+PdbI+B4NespiWWytUjz7B0RdWq+pIdw0h/j?=
 =?us-ascii?Q?vuyDSrulP0JZtVDNmeikQt4p/sAkeAED+8cxZjJX+YtXC7MKhQ7jxoizpIzN?=
 =?us-ascii?Q?7QWZ+HdAVBiJsofy7Nzt63WFU0HZIV+L3ZiUN+WncQRqRQDzK4QicIZGjX1v?=
 =?us-ascii?Q?k5fZgNaPWt6vh8baCDDxtr5yr3fjcnOrux/KmTEoRueozlUOA1sr4KT8FDSj?=
 =?us-ascii?Q?Fq7AkgBxtdsd0oqz3IBr6pAFaCOX3W1IpOX+9KVGoSZqbQ3HFdvLwvnFejtO?=
 =?us-ascii?Q?xV2UOL+5hZ/NQd79rIbjizybZ7uEJ7an9oxJRJHcQyMFy9xNRjddjL6R7MEU?=
 =?us-ascii?Q?HGeyjeRWG3V0/kyTCgxIkNS2TcJIKBAh837127dzV5lRPgg6tuJsRhYpU9TX?=
 =?us-ascii?Q?Rqaai3UdDPPU13XaAOdVlxT8uIc+oGvo/REn6kthTjJgnQm7d0+XVmtcNYzV?=
 =?us-ascii?Q?fQokwTIOisBLE1hfPuC4tc4cBRnDuC+odqbirdYlhe0nwcydjGYeTm86P2+J?=
 =?us-ascii?Q?zOW5R4VFt1lAB7ALVUXsa3BVIwanfeaNM7+M9dYZVaYC58KHrh+5EyvUd8vv?=
 =?us-ascii?Q?zgoiFLRkiB3jUMsgCzJMv+foIf5r7UwuRcL5hNRztyzonQ6uh6/Q64J5ENtO?=
 =?us-ascii?Q?REInNZaPZcpvrIHwkLt30yANAaL5DX42aQmqTlcl/Ih3EI4nZjCgrbL42fsx?=
 =?us-ascii?Q?IlhmrJxoSenw/VXAg4cnLVQHVBFWiqAErWmvt6Jn6/BKI/ditwpEZiSstWza?=
 =?us-ascii?Q?jPMvvbfAHgIK51YY3TDWxZWZ34KDBO9rSXnbU0aXrHJxgC4t6lkxOAWyTZBf?=
 =?us-ascii?Q?zyelcYwVMCpgzdQ+BhIh7GDIr31mHHfmox8bTxfO/QRWoI06UHHEk6vhWcrt?=
 =?us-ascii?Q?pZ3Ar0hCJvQ7LkWlauz+43hCZ9PmiPUEPu9f+izDtY6JejzMDwcfh3Rvl5s4?=
 =?us-ascii?Q?Q9cEnWXyN9x2iFgRDondzJXcTiK006YqEhyU0t9kMUmN7wdhe0WrM6rjPhws?=
 =?us-ascii?Q?Rl6RnN5yqAK1vza2iGk6ZooziC5RX6D4wgREoqEgcvDYEadIc5qtzYIFdmbH?=
 =?us-ascii?Q?12T68RQV1I2qVlsD4z/3E1iXmcDpkeny1zyEGYcebV1nBhnrBdEVIWQjkTfp?=
 =?us-ascii?Q?dEerbSt/Uh5hmvirtvzKs6pzwd24kMzbgxUinsJr6JWy9USv2avfDyrSfV23?=
 =?us-ascii?Q?sKA9ueQ9jixAQ9nFJIxDONuTDoOFVTJhJJpCBbtOnYlXYH7CH59chwUZ/9rN?=
 =?us-ascii?Q?R7/feAqh2hoy3+jp8OvxE4CqiwiBDp5J6oJcQAVD7h5i2ZPTTbUK0TWIg1kZ?=
 =?us-ascii?Q?j3q3rTJfzNOYoPFbIjJSEUCfOugw?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7554
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c293194-992d-4b4a-a20d-08dd237fcb67
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXDJ2qWtaeV6XB/mgik7xpxhw0RbmrlM9nXp+cK9CRBR1IxB2VdjixM7LIm1?=
 =?us-ascii?Q?sgT1erfYOgXiQysqvA6/mNsq0wDftRIrtQ9xuhwKqMd/b94KXQNqUw9XBuWc?=
 =?us-ascii?Q?RcmCfap+EHSYkeuabisxBRHhncqtOPbLyCzf87Qd7uBziNiQgskr8G+87gJh?=
 =?us-ascii?Q?Au4Y/gDpn/w6g+dTvfLv3yIGkFt2dt7offAyuYLFEcaonG9b2FN/Tu4OUcLK?=
 =?us-ascii?Q?VkSrHi1SN+D/JypCT6wAa64f+yZVEGAcIxWY78LJKBzMRM/11FHbNtdjTEbZ?=
 =?us-ascii?Q?OpJpdN5xEmSixgiF4oOG0xm3gX5nHeikhDQ4kvZjZxBz6Ujs+GvrlDgkMAoY?=
 =?us-ascii?Q?C9QLaN6OYlMNvPTmmYJjXcrO64kZvF8fQfP9Vdk9F5DjAybEQJR2wS405N+n?=
 =?us-ascii?Q?qShLWIMnKtEkmS/m/+AF2ZiyjK6se/Yi5/TTyvQhJWUce6xM8Tmd0xaWQ3yx?=
 =?us-ascii?Q?HS02asNNNAA9jTWEEkNQdZSWOz8Jgs2UQ0W1ScdJbPANLX90MEv1pwf0MduH?=
 =?us-ascii?Q?Kau6fNkmlNp5e2ZU45XZTpT0v1ZtO0nykZ2yw8BszeJZncxTlrcmj087rnHz?=
 =?us-ascii?Q?2IyCkiQfPtiLJB8QZjuxxXna2P7ZrzFsQlqKrsQgtiy2pQvRoMB12XxFIoUr?=
 =?us-ascii?Q?mhYisLOaZggWKLTsvVGA4wmgrGgmziJ90EnZ1Au0F835tNJBZqUaR7e4WaQD?=
 =?us-ascii?Q?lzp8HcibVl7LGotqfpnkt4o2gByiOeo/ZKmZ9100ccEcUWHeg/i9NumIbV94?=
 =?us-ascii?Q?ZueHedGHFbok+tr2NPp9IhgATK+2I+Sy7MPxjQd6/v940DbcZmT0FarkLV+f?=
 =?us-ascii?Q?obdMgHxmBTFnS/SWChg+MBwSyT93gJGaRPRQKarSIvzTuKgy7u/6BtB3GKpG?=
 =?us-ascii?Q?q7BWcSfJggb/hkXSERUDtoJJhHuKpO/vYPbQGJZHVMA0lUD9UyDkYWsz18G4?=
 =?us-ascii?Q?xiZJoIPDjzIRXj44a+yDhyOXkVFlOArEQjFFIh0hbrqUUpv65VgXnBzFXgmR?=
 =?us-ascii?Q?Z3qE/4ltEwRH5KyqCEIpfUmNu5945GV7IsDdkNBKm39omwX1IzRb1YcUMKb1?=
 =?us-ascii?Q?yjVcltJ+eoNzq2oQF9s5E34h9QYteL6x1q8c7g0iTRWZkUDA4zDbKCk4xYJ6?=
 =?us-ascii?Q?u+8l7IbksGQkgLG6AsvLgBDbkczKzGmX3UTAEqJXDqKrV5SzOfuNKoYHyhgj?=
 =?us-ascii?Q?t9+jYuOr09rp3oaZCUaAV/Ms/NIeYI5pQMi2DR4bua26K/Gg2vA9BX3PAyNw?=
 =?us-ascii?Q?Ge+GrDFhSBhI/WUwArldM9IDPgdyKP+ffAZ81NaV+Et4A+Qpx8O0Dl8PGVyA?=
 =?us-ascii?Q?rTUErwjVG7hDJ5UvQuhvcQaPnPcfFyin7SasskYbBiP56Ow8XVJP3DhUUim6?=
 =?us-ascii?Q?/sDWAFxty/RLQI7Bm/wewwhrBlGZn5NoqUEsScOTf+sP/amnEc0gpOYSOLAk?=
 =?us-ascii?Q?4RQokj7rstIjMgRDqcasjYu3WLKwYw1mgIkiNpboablBBsGwRVxnwCs3NsVW?=
 =?us-ascii?Q?hydiN8pPN8I7MFc=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 18:30:08.4147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45630f9-36e3-48c6-ee18-08dd237fd43a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_103024_527249_A868FB70 
X-CRM114-Status: GOOD (  16.16  )
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

Hi James.
>
>
> On 18/12/2024 8:48 am, Yeoreum Yun wrote:
> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> >
> > CPU0                                          CPU1
> > (perf or sysfs enable)                        load module
> >                                                cscfg_load_config_sets()
> >                                                activate config. // sysfs
> >                                                (sys_active_cnt == 1)
> > ...
> > cscfg_csdev_enable_active_config()
> >    lock(csdev->cscfg_csdev_lock)
> >    // here load config activate by CPU1
> >    unlock(csdev->cscfg_csdev_lock)
> >
> >                                                deactivate config // sysfs
> >                                                (sys_activec_cnt == 0)
>
> Assuming the left side does Perf, are there some steps missing? To get to
> enable_active_config() you first need to pass through etm_setup_aux() ->
> cscfg_activate_config(). That would also increment sys_active_cnt which
> would leave it at 2 if there were two concurrent sessions. Then it would end
> up as 1 here after deactivate, rather than 0.
>
> It's not explicitly mentioned in the sequence but I'm assuming the left and
> right are the same config, but I suppose it could be an issue with different
> configs too.

Sorry! This happens only in sysfs mode. not perf.
I've forgotten update the diagram...

>
> >                                                cscfg_unload_config_sets()
> >                                                unload module
>
> On the left cscfg_activate_config() also bumps the module refcount, so
> unload wouldn't cause a UAF here as far as I can see.
>
In case of perf yes. However sysfs is done via configfs interface.
IOW, while cscfg_csdev_enable_active_config() iterating to find out the
config, it's possible to deactivate config via confis interface,
and unload moudle.

Above diagram explains this when coresight is configured with sysfs &
configfs interface NOT perf.
Sorry!


> >
> >    // access to config_desc which freed
> >    // while unloading module.
> >    cfs_csdev_enable_config
> >
> > To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
> > deactivate while there is enabled configuration.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
> >   drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
> >   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
> >   3 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 86893115df17..6218ef40acbc 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> >   	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> >   	raw_spin_unlock(&drvdata->spinlock);
> > +
> > +	cscfg_csdev_disable_active_config(csdev);
> > +
> >   	cpus_read_unlock();
> >   	/*
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index a70c1454b410..dfa7dcbaf25d 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
> >   			cscfg_mgr->sysfs_active_config = cfg_hash;
> >   	} else {
> >   		/* disable if matching current value */
> > -		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> > +		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
> > +		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
> >   			_cscfg_deactivate_config(cfg_hash);
>
> So is sys_enable_cnt a global value? If a fix is needed doesn't it need to
> be a per-config refcount?
>
> Say you have two active configs, sys_enable_cnt is now 2, how do you disable
> one without it always skipping here when the other config is enabled?
>
> >   			cscfg_mgr->sysfs_active_config = 0;
> >   		} else
> > @@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >   	if (!atomic_read(&cscfg_mgr->sys_active_cnt))
> >   		return 0;
> > +	/*
> > +	 * increment sys_enable_cnt first to prevent deactivate the config
> > +	 * while enable active config.
> > +	 */
> > +	atomic_inc(&cscfg_mgr->sys_enable_cnt);
> > +
> >   	/*
> >   	 * Look for matching configuration - set the active configuration
> >   	 * context if found.
> > @@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >   			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >   		}
> >   	}
> > +
> > +	if (!config_csdev_active || err)
> > +		atomic_dec(&cscfg_mgr->sys_enable_cnt);
> > +
> >   	return err;
> >   }
> >   EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> > @@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
> >   	if (config_csdev) {
> >   		if (!config_csdev->enabled)
> >   			config_csdev = NULL;
> > -		else
> > +		else {
> >   			config_csdev->enabled = false;
> > +			atomic_dec(&cscfg_mgr->sys_enable_cnt);
> > +		}
> >   	}
> >   	csdev->active_cscfg_ctxt = NULL;
> >   	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> > @@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)
> >   	INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);
> >   	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
> >   	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
> > +	atomic_set(&cscfg_mgr->sys_enable_cnt, 0);
> >   	cscfg_mgr->load_state = CSCFG_NONE;
> >   	/* setup the device */
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
> > index 66e2db890d82..2fc397919985 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.h
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
> > @@ -38,6 +38,7 @@ enum cscfg_load_ops {
> >    * @config_desc_list:	List of system configuration descriptors to load into registered devices.
> >    * @load_order_list:    Ordered list of owners for dynamically loaded configurations.
> >    * @sys_active_cnt:	Total number of active config descriptor references.
> > + * @sys_enable_cnt:	Total number of enable of active config descriptor references.
>
> When these are next to each other it makes me wonder why active_cnt isn't
> enough to prevent unloading? Enabled is always a subset of active, so as
> long as you gate unloads or modifications on the existing active count it
> seems fine?
>
> >    * @cfgfs_subsys:	configfs subsystem used to manage configurations.
> >    * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
> >    * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
> > @@ -50,6 +51,7 @@ struct cscfg_manager {
> >   	struct list_head config_desc_list;
> >   	struct list_head load_order_list;
> >   	atomic_t sys_active_cnt;
> > +	atomic_t sys_enable_cnt;
> >   	struct configfs_subsystem cfgfs_subsys;
> >   	u32 sysfs_active_config;
> >   	int sysfs_active_preset;
>

