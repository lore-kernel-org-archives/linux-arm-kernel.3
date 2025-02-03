Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E79EC02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=; b=3mizPGHawSO06pNZjFAycKvbGA
	SrWHtfSIWh+Ld8im76iSDZ6xBByutSS5qwLsApHtYRRQNkxIlfPv5/+MCbleSgtHk99WT0xCkk4Ep
	B8m6mHzR30y/HuBNlV/7kYxBtbpyNR//iND9FhVl77VZqORdDvMlRCLndYyTlBhUK+zsR8sZ0Imjm
	c4Jcqpb+vxKaUVaX3ZobPxkQmDhGoq6uVLSDq0ov9ZedJwSr+g7HIWqUefFjgIR3n0ifx38trw5Pj
	zS1/GL2jivOj2BMCAh96L3aUdbaTJJPGvw4EMUrT7q3Qnd1ZVoe3q9FMcNnzGS2Y8ekt4cgOofoqU
	oxDcqBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezB5-0000000FyUr-2tWn;
	Mon, 03 Feb 2025 16:20:03 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tez9l-0000000FyLT-0cOX;
	Mon, 03 Feb 2025 16:18:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bS9oCwzXHriZpCI29qACbIViUIAdapdZSRGXvSui65WAtuHdaP8Cca/B2UuxorZRPiYkiAp3EROuIaAv4TjwNkxq9GETgs+B7/B+rWwQ7JthzxRM0YGoCSyzle/H14SVjwUgQ9elJ1GzgSx6ZT9QcGqUyOuvODG+4R4/SZd5wsOcchS+UvV6Rbv89gtMMYX0y1HluSBEV2NGdDo5ehz1cWO9P1h9I6VPnMdjUpyZjRcC2hH20JZ1uj8mIT6nojqMHOfpJFJXYxkQvzAGpMvNPHACjMi198q5/nutyPXkruUBmDYaragqXnRBo7aPWxrUvv9lV2ZuhbNJynT5lvw7ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=dhH32rKHyIRWll0M4DjbKiCF2ZJSSw9ZVC6ujGk+cHTIOpkCUhtOKiuSdDnj+mD5L0Kel6EPVA9AWdJChY4vrwNm+L06U1RgHIhgMuPpkI0UUlV9qDv11kfG0iaTitTcjcTBDjj0VIxioViW10JFHz6f8d0/89yuVq9R/9v0UF9yZuHKS/+qj6m0F0B4jl2kQ7bGlcS99Pax+3eIXzKFyEZDsiBL+6IvCDiiCW8HFNtCiUeNG3NnzCuM1JIdUNTt6/EjHkwIi4DIR3L90tP4F+xsEzCQ30psLbiynFDuoGMPlmo3nTW1vJeyoKt32ARtJZI79qcn+pj1PuMtlmy5sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=Ot5YHTNjhoTXCRWAnQr8nQdCVsWxCQIgqG6vvkxQiB2GzWGQ75VAeR7WSEzT/z4oIM7ACMfw2vkDNTCWpQ3FkAo0kMF03nkSOS7QkIDjaFlcHIbTD7EDS0B6S2HPmKIE9HYZnyDGxjbOfqdxeNyhguXdIxNmVX+4FqGUfOfHI5k=
Received: from DU2PR04CA0180.eurprd04.prod.outlook.com (2603:10a6:10:2b0::35)
 by AS8PR08MB6599.eurprd08.prod.outlook.com (2603:10a6:20b:332::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 16:18:32 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::79) by DU2PR04CA0180.outlook.office365.com
 (2603:10a6:10:2b0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.23 via Frontend Transport; Mon,
 3 Feb 2025 16:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 16:18:32 +0000
Received: ("Tessian outbound cd7bee7c735c:v560"); Mon, 03 Feb 2025 16:18:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffce7ae0a8ee4c9e
X-TessianGatewayMetadata: caav6sjM225plv59iPv93LOXIqRgvcp7ocs5QZSYAUrcB3444h2EljknyNTWsu9VTmxeE2YNqgNmJCfqMsjrrRlwk97BZkjpqVVv4KiLHAQi+rX3seLU9dXdHLzg54WWoB+HsfPZGJJdfrfpX0wzfbDGea4BMoPhWHdhAJKtohY=
X-CR-MTA-TID: 64aa7808
Received: from L2b18d4476b64.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D1E5D331-30CD-404A-BC9F-4703CF12BC90.1;
	Mon, 03 Feb 2025 16:18:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2b18d4476b64.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Feb 2025 16:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RllW1FR3d9tBvriL6+4KdSdIT418Nw1sCn0SOt8D0Crbek47DdFDFajzwwWWfSJ2q98oVYrEGBMjaQmuuHCr5gT3DnUgefvaZnJX2R5ViSx5XANhIW+cCeIDPimx2R7MdfWUMsr+lbPmMrv5g10vcbSxIG4rG+ZIA0bLv6OdBLWuQ3fNxWvGfA1FbnIarg9cqRL6RLmF9RKCe37fkDkQoR3gA0pjWSEhvotFsUGcxEmXlak/SqIZPA9QebRIqy57yd6YxWu97DtJH4lc7ezi79Et/GEY79ZKjZ8Dgtd472+ebWlTNrYjkZH18beGLXxgDFynaJ3V7Rs7Tkbw6QIQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=wMcEZIIWJbpXoaGE6A+R3Gw/6LuGu7Iulnfl/aw4zAJibVBaEwU3iFyM61B1jzYNVHSfaPSUoDvN5w2oMoiX2qwnukePOTyb1VvWOORR7c/OBLEe7dREyeb0QZCMQRai3nFuG9CzU3N1acbDfOSYj14t3xUEqo+qglBb+YiNaMVAi6v+T/YirVjzAUc125KCo+upj8bhSFsq7bKS8h2PzndDvs4XR09Bo2vTg9j/YV79udHx0szGiZxVAMxUnOQBb++qikPq9SiNTEAV7w9+PBht1AAaxKbR4E7W8vWzeQ9f/BxWXFF8O+d14DYuWVP95eoIZdr8Nc/zN8/+Gyzcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=Ot5YHTNjhoTXCRWAnQr8nQdCVsWxCQIgqG6vvkxQiB2GzWGQ75VAeR7WSEzT/z4oIM7ACMfw2vkDNTCWpQ3FkAo0kMF03nkSOS7QkIDjaFlcHIbTD7EDS0B6S2HPmKIE9HYZnyDGxjbOfqdxeNyhguXdIxNmVX+4FqGUfOfHI5k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DU0PR08MB9108.eurprd08.prod.outlook.com (2603:10a6:10:47a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 16:18:22 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 16:18:22 +0000
Message-ID: <c5f1ac22-6535-4917-9155-5e0d8fd9a74d@arm.com>
Date: Mon, 3 Feb 2025 16:18:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <20250130232004.GA1818629-robh@kernel.org>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <20250130232004.GA1818629-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DU0PR08MB9108:EE_|DU2PEPF00028CFF:EE_|AS8PR08MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3577c1ee-0e5b-4ca7-160c-08dd446e6750
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aVVkc2RhZ3NwTDJySlNkMU9icmY0bmp2aHdYL2c4TzhVV1FpeFRLbUtSQ0tN?=
 =?utf-8?B?VDZkUllzWTNxa0pmbUdEcDExQm5YTUkwSHR0bXRDZlV4ME9aaEQwc3BVN0sz?=
 =?utf-8?B?RERPbTJ4a2habGtNRGRnbms0ems3VUYyZW1zNzNHN05GaTI4cGp6ejh5QkFL?=
 =?utf-8?B?b29oUFpOUDA2bDIyR08zMFFQQ3BCSS9HL3RGQXVaUEx0WDRUNm1hbUZydTNR?=
 =?utf-8?B?anBzSFRwQXBVaGJwVk5tRDRLU3NnQW1XUnVSSFU4ZVVIbzdwZVpxcjZTejhL?=
 =?utf-8?B?K0pDTHM4SW5zeDdWOXRnWE5rNlIyN0NkRDF0V0ZuRXpIQUhnRkhhdFc2VVVn?=
 =?utf-8?B?cEhoYWVJV1VNSWFwSXVPOHJJVitZSzk4TVNMd3FjVWxqOVVrNm1UNUN5STlr?=
 =?utf-8?B?SVY4dUhTSU5OeUJUeW9Yd2kvV1ZLbVF4SFlKRzhVODB5RHNFQTFsOE5QNTZh?=
 =?utf-8?B?VnBSSUk5S3VhdVdnWG1uY2dzT3hhOXhTMk1idDB0VkVJbUpWeU5GM2laRnZK?=
 =?utf-8?B?N1psUDJCVGhwOEFXWW5WdktpN0IyOCs4L1JYQm5yRnFxL1V5enE4T0xFZ3Ir?=
 =?utf-8?B?QVZDSlY3VHNmUDNTdlA4RElnQkFzenFDMFZ3ZGowa0p3L2RRRTU3Njlxc0pi?=
 =?utf-8?B?U3RsRWNpakhQem1XNlBNRWV3NXpSR0wwbm8xb0xxR0I1cXkrT1RoVTJHSnZ2?=
 =?utf-8?B?SSs4SE9tNitWOEh4WTlJcUdwRVZ6V0NzUExPQytHMzA3UE9BVSt6N2d4djhM?=
 =?utf-8?B?UWJMamtTZnRscmdWT3M3cGdCc2FXWjNxT0hqYlJZSXd6dnVuWWM3U0xGNmFK?=
 =?utf-8?B?Ty8xcUcyaEl2R3cxc2VKS1JIcGpPWFZYRUZTQ3pTbjhkWGg5d2JVQUlCcVRt?=
 =?utf-8?B?aFhkTkJsbDcxaEZhZldXQUp0Z1dWMmpmK08rZno5SUtnd1V3V1JKY21QSElt?=
 =?utf-8?B?TW5lMHJ2RWtFdWZ2KzZtR0JZMU8wN0d1QlB5cUJXejBwdG1HZTFFOVYyTUxH?=
 =?utf-8?B?bkI2WjN2MHdTRU81RVJ3K3lIa29uOTJIdmg5YWFCSGt3UjdmZ0ZoYkk4ZkFE?=
 =?utf-8?B?WVF1TkttTnZJejRpNFUzb0hnbXplUzlML2gyVDdGY3BaOUk1VGYwWHdTY2V5?=
 =?utf-8?B?YnBXem5UNFhDTFZEVDlvSXEwcUF4VVhYVlprZWUwUXoxaitpcGx0VGcxZHky?=
 =?utf-8?B?MGhGVFpNcU1DNnpsaUpuZXBXTGpUSFI5WG1FcXBOQmhaVVpIWFM0Tktlejht?=
 =?utf-8?B?SEVQT2o3RmdTRGF0Zi9LZmZGeFBmSVZPWnpYWkpUd2M2MC8xVHk0M0Zqc1lC?=
 =?utf-8?B?TUt2NmpJYkxNM1g0RzZHbUxuaVFhN00vb0lTeDJENkRTMXV5cC80dGZ4U1hj?=
 =?utf-8?B?TmpOcG9JcUVLVEhnUFQybHdNcWhFSTYzUzJmeHBmbk91SDVSQ3JOQkI5L3ZZ?=
 =?utf-8?B?R0hDWHI1RkxjK01UZDE0VjF2QkFiMTQyYmQxcVJGNklkWFRIMVNvZFdPbjd5?=
 =?utf-8?B?ejFhRUJRZjgzSGZUdk5TUDBOSVhUelN2dk9ZNWJUM3F4RW11RzJPRzJJQ2xV?=
 =?utf-8?B?ZzJiZnk2Y2RPVmlXTDVEVVRaWjJCZE9UZ1p2SGNWT3B1eWR6b21yNCtLb2l3?=
 =?utf-8?B?QTRJUnF6VHVpRVB1SVZzbjAvaisvcFY3VUFaWjZpOXNzRFV4UWd0ZURENE0v?=
 =?utf-8?B?bXFoT1RMcUU4ekpxQUl1VW5KcnFLNm9paytrTTZJa216WmMrRmR0dkZKOFZD?=
 =?utf-8?B?Uk1adkpaVnFyZlFtQW5XMnhSTUI1L29PT2cwZGlnbmppQ0RHdDVyTU1YUUI3?=
 =?utf-8?B?UzVOa0lvMHVJNG1RQ0dzQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9108
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70284272-a168-4ef5-78be-08dd446e6128
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk1uVHNQdWZYU2VScnZFUDlWZVp5NkVBYjVMbTRSdmFNYVhFVGNOVUpxOU1C?=
 =?utf-8?B?bFdOTS83MTRuaWNVd0hBeGxybUF6SUdJS0lwanlKY0p4MWNDUmZrYjFHZkxq?=
 =?utf-8?B?WmJvOFRlQkloQnA1ZUI1TnJleEZWSTR4a01EUnpJTDlkRTZaVDl3Uk9SS0p2?=
 =?utf-8?B?TzB3dFhnL3MwY0czTmxndGJSVGk4dUxONW1QU3E4N2pLTDhsMUhsVFMrbFdw?=
 =?utf-8?B?a2dMd1o5TjFUWGl2Tm03aTJlb1JMTFRHQzZwY1k3aEZEK2xZbU4xN0JSeW9S?=
 =?utf-8?B?ajBMUkRRMEZXQTFnTm9Ca1hiclIvVEs5QThXYkRRVXd4ekxVSE1aajlqTFZG?=
 =?utf-8?B?N0FzbWZTVlFGcXRFQ0ZUL3hCRVpoMWQ1NU1DbmdXeU5WaElWcmJKZ0hRV3pH?=
 =?utf-8?B?UkRLRGRLWXJFdVVyMFVWZDZLb21Kb3JmcTkzbEhBOWhTOHpQNlIveElPVEtm?=
 =?utf-8?B?UTR2T3RtRWtrT2lLeWdWeWJXRkVpRVNpZWlnU29iSTFEQ05FQnErRldWYjdI?=
 =?utf-8?B?VUMvZk1XYkxPemhjUHlaaWYwWGFSSFRUaDRWT1BDOTI2M1hEeGVBS01TYUlk?=
 =?utf-8?B?dHdPUHFzNmthMUt2a3BaQWJqVHlNNjRpMEVRMlVQcVZMSDVIUE1ZUHF2ckJq?=
 =?utf-8?B?VFUxTXV4dnVCV25IQUtXalpIRTRidWVweEdzUEIvMVVhRmwzWUlrayt2QXU5?=
 =?utf-8?B?cjdjMlFjUWhPQWx1VzU0RThkRlNZSGRUY29RdFJsaVpIVGJGZld1TlRrSWZ0?=
 =?utf-8?B?SUZJcENaZTZZTFN4ck83TEtzekdaSDloWUNCakFScGpzNHRhb1o5SGVxREhR?=
 =?utf-8?B?b1Npd0F5L3dQeXYyTzFzekxwQXJSZno0SEZ3c0lWTWQrNlZZUVhZUVZUTWFl?=
 =?utf-8?B?Rmo5dUduSElraFd6WGQ0RTdWOS9YVmxmN2lTWG5wSVNSWC8wRHovOVJwWkYy?=
 =?utf-8?B?UTJ0alN6bmtKNUppK3kxT2dKejFzRkJiN1lvVkhITEhMcWs0eW1Pa1FzNDVn?=
 =?utf-8?B?Yy8rN3FYUGphbzZiVVZIY1o5Wjk3UGVPeFMxYzEwVkxSYk1lS1E4VW53dENp?=
 =?utf-8?B?aFVUNFBDdE9aMzZHL0lQTFlqSXhjRUlSeUJpRGxaNzVqTEpNQUsrOGNicFlq?=
 =?utf-8?B?SnhzWHJnNXU3eDFwQWJaSXJHRTAvLzlnMHI5R2dFaVFSYVRFeDZ4Y29EZGxm?=
 =?utf-8?B?V3BIV2xwcDJIVjc0ekxqSnpJcnQ3cVFZUG1kTk1zVHhKSGlCMm1vUk1lWnlm?=
 =?utf-8?B?bVk5MHZKY1lkbUlxSXF0UUtTWWpSTmhNOStoS2NFNC9VakVROWl1Y2pTb0NJ?=
 =?utf-8?B?R2YrUXV5cVJqWmxLVkkwNWg0c2o1RXVBQVBsbmlVaDF3Y2Z6M1YvUWttSHM5?=
 =?utf-8?B?NVRuQmFObUZRaEJuemFhMFBHTmpXU21wVm1DbGM3MkliQnhvN2dxZHdEY3M0?=
 =?utf-8?B?U2ZCcjVrYVdKbXZQZGFDNkhrdnA0SjYwMUY5WE1zVGF3NlYvUlpPSk5hdzlL?=
 =?utf-8?B?bzlHOURtb2thV1ZVTHJPSzVWM1RtemZqa1dicC9GV3R6V1VSM0lsVVhINDR1?=
 =?utf-8?B?RkN0SnllUFlVT0k5Z1JpUXJFWDcwbWZab3B0eHVjcWZkMExPNi9Sa2E0eGdz?=
 =?utf-8?B?ZGRTdTJIRDRSeW4rdkVyemVyNUx3emFpdW80ak1ZbGpHL2tzRVNtU2ZsaGho?=
 =?utf-8?B?bkdodnZ2bjR1clg5ZWlsL0tvRmk0M3JGbFRrWXd3TmxuV040NmdNZFZmQk4w?=
 =?utf-8?B?NzJkejZISHNZYkI4ZGt2ckxhYlFwUkNOZDdTNktVSW1uQTB2UmpaT3VuZWwz?=
 =?utf-8?B?V0VtQ1dXeERnUW1IR1FuNjlqTUU0bTV2WWt2TFNOYW9nTEhmUk51TnFXWmY0?=
 =?utf-8?B?Y0RianJRbnFFNld0Mi92VXBjR20yZlR1SlUxTnR3L05QVjduRFdINmZpRFZ4?=
 =?utf-8?Q?zzr/JMLHdbQ=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:18:32.6715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3577c1ee-0e5b-4ca7-160c-08dd446e6750
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_081841_441430_6E647762 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Rob

On 30/01/2025 23:20, Rob Herring wrote:
> 
> Why would panthor need CMA, it has an MMU.
> 
> In any case, I agree with Maxime that this is redundant.
> 

This is correct, the GPU has an MMU. The reason I introduced this custom
CMA DTB entry is to allow creation of a standalone DMA heap which can be
retrieved by Panthor using the API exposed by:
-
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t

My understanding might be wrong, I am under the impression that current
CMA driver only has `dma_contiguous_default_area` as standalone
carved-out heap and we cannot have more than one. Please correct me if
this is invalid.

With the DMA Heap API I based the RFC on, Panthor kernel driver does not
manage the protected heap itself, it relies on an exporter to do it. On
some system the secure heap will communicate with a secure FW, on others
it will be a carved-out memory with restricted access. This is
integration specific. Panthor kernel driver will expect to import a DMA
buffer obtained from a heap.

For the development of the protected mode feature, I decided to modify
the CMA driver to create a standalone DMA heap and allocate a DMA buffer
from it. It helped me abstract the importing of a heap in Panthor kernel
driver. Someone may use a different heap driver to reproduce the setup.

* Additional information to help with the context:
Mali CSF GPU requires protected memory at the device level which does
not belong to a user space process in order to allow the FW to enter
protected mode. There is a single FW per GPU instance and the FW is
loaded a probe time.

Regards,
Florent

