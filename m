Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC9FD63938
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xtb1L/BECqqh2TzqQO7ieq8R/yPpFJsieu3zLom10vI=; b=JsSjU5YgOIT1v/JJC1cC6KBmM3
	v4jtpeiq2gl/+A+baZeStudnJXaDMVFHKVNPX+6PDCFzkMdCD1PfGQPqJ6o1qphi5OM85vJQcEfni
	BvAbSV2SIOarBB8iJLKR4lane8K4xsVLCnsTN0H7D1hFwqp+kZiXEjd91p+5UvXW7WqFOVreN2x5Q
	lvGcBqb6XRLbv/r5PNbwxNqdVk0EUDUjjrqnBOh8MFCkIdwlCOLuy8qsJK1Q70yzraet5HNkgjXbw
	5ZF0ga+UiGU81cvaw2cImftYRir5R3gH+FZn3YyzaEc+pwvvMwuhZ6HDonwimK4/m9+I11zPDHjb5
	ksH+we8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkJI-0000000FMjf-0f0j;
	Wed, 20 Nov 2024 12:59:56 +0000
Received: from mail-db5eur02on20726.outbound.protection.outlook.com ([2a01:111:f403:2608::726] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkCi-0000000FLfu-3CID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 12:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLbV5xkI0BGqCG8hwMp3OVeXWmID2dg45FLcmJ6X+Bwyez4hL2tVwON9auzzLPIRDD4qd5IyltfRrCqncRinsqM8Oa2pTUBsQACmoYYPTTRLEZfYASbxRLQVwdHeya5P/SVnvr/gNSkoovU/f8rCYu0Zo6uXqc8l84rV+wAnjQiXccoVjAQIODx6bx+8k8BGfoOoNj5aRk61UeXAVTp7ZVD3jNoUz+cA79N6hhryu+EcBgvWhi1oiKw33jbbwGiXOeKFR3rfpGNyd+g0pH8hQYG8mXp3+07wv6BdNR1bjzXHPup9a56bEsQNPQu4i/undEWsPsAA3EqyMU1xwIFlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xtb1L/BECqqh2TzqQO7ieq8R/yPpFJsieu3zLom10vI=;
 b=runiQ+HgBIeN1vY4mvIpjNMtxqYuh1SGmGttc30sEkYKZv+/GW4NGPuSM5A8hOadMGyA687X/5wDiBTwHvBprvdhEczRe/rkK5PcLU6njaFAQsDrDy5c+Wbsw9ICbZI33sBzCTUC/Onu6s9c0sLCRGkzg0DBrjKCZi9EZsdJDyL9UdwO77Ga8CYGddZ8iTqbQ3eepsAGNWVMuVyf/c/6x+zZOh7fzTRftcFUhOYxq6l6lUua6UmfvdnYUo7BJpQTA2/IIIOLLE8w8SzX2Uggf0hOQU2isLh+bDa6YD6a0PNPv1S17vwTal3DL0M90Ois6IRL9+2DxzyLDywsZ5epjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=none
 action=none header.from=phytec.de; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xtb1L/BECqqh2TzqQO7ieq8R/yPpFJsieu3zLom10vI=;
 b=DcRUwoWCAuXBdRTdzc6cXCxFVgICq3jUpeuyWtJSIoKzANdA0Y8iNbhfKV0DO0erc8fZpl7qsHrazax1V375iDE3EV4OxcGAYU0eM9KMqCbSMrmDAC1+RhSRdhRyk9kO73NS4lBObpj5bQaNiK/arBj88UjtL/n0noX/GIuAQxM=
Received: from DUZPR01CA0229.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::26) by AS8P195MB1846.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:52b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 12:53:01 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::f4) by DUZPR01CA0229.outlook.office365.com
 (2603:10a6:10:4b4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Wed, 20 Nov 2024 12:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Wed, 20 Nov 2024 12:53:00 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 20 Nov
 2024 13:53:00 +0100
Received: from [172.25.39.28] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 20 Nov
 2024 13:52:59 +0100
Message-ID: <9efdda6e-a401-4321-9680-905a1e70f392@phytec.de>
Date: Wed, 20 Nov 2024 13:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock
 to core clock
To: MD Danish Anwar <danishanwar@ti.com>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>, <robh@kernel.org>, <ssantosh@kernel.org>, <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <srk@ti.com>, <devicetree@vger.kernel.org>, <kristo@kernel.org>,
	<linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-3-danishanwar@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20241113110955.3876045-3-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AS8P195MB1846:EE_
X-MS-Office365-Filtering-Correlation-Id: af870ffc-6b7b-49ed-2257-08dd09624412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTV5c1E4MTRXSkdWKytHVG1xS3prVE00UW44V3g3bWxjT2s1YjVsd2ZDNjAv?=
 =?utf-8?B?VXQrQzV6a0c0ZVBUUUdSV3ZVNG9ncTJqSnpuZmkvUU1tWXBBaS9sY2gwQzRQ?=
 =?utf-8?B?dXFwYndUeGRXTTBlL2ljVGpxR0tKSktiRkQwbmp1R1FqanJid2hPekZWTzcw?=
 =?utf-8?B?UjBwcmNLUllVUElSYzZMc0doM0RHcUlSM3h6S0p1RS91YUozMUk0OU13ODZY?=
 =?utf-8?B?Z0tEdC8xUHF2N1ROTFNWSVN2bmRjZk5jUHNVbEpEZHoxTFVxck5sODFqdjZx?=
 =?utf-8?B?dWlxejNKaEp6RkNPUWZiSW5xeTZOV1NjVmhNWjFXbXI3ZVhuaXFpWklSQkwz?=
 =?utf-8?B?K3hpRS8wbkJOMGJBaWFyMUg3RFExenlLaHpWL0NpS00rU1BuWXQ0NFM2Qkta?=
 =?utf-8?B?ZlhSaHU4eVV4LzNHY2J4b1p2ZUhuWm9YMnFLcndVcGpmTzhBS01lR25jQ05P?=
 =?utf-8?B?MWRLY0NDeEM5NUFMVWE1d1J3NllnTGZqalBocXVMZ2R0TFJoOE1PNkhuRVN4?=
 =?utf-8?B?UVRWNVllU01wa0VwRWYzQndWV294bE0rU0s2QXVUbjVGdEtkVURldUNST2RB?=
 =?utf-8?B?cDJtSGg1d1djR0hsTE10bEx5NHlXRmVKN3YwM0R4Q0dFUkRpUzQwTGNpZ3Qr?=
 =?utf-8?B?VGtsNW5KcEhoUUVSa3FlTFZFNEt5R3VpZWxERVVmN0s3TWRVa0dXSlVRQVd2?=
 =?utf-8?B?L2k2VFY3MUptQkp1eXBkZlZuYmJkaGR3UWFWYzBGUW1LOHJnTytYT0lyYXZG?=
 =?utf-8?B?SHJIUXlKUVMyUWFUemVVZDlZMGZvVk44aVM0VStPd1ZzekN2aDlqZWtMVTRs?=
 =?utf-8?B?aGNhaHA1aHNGOHlCQk4rbndFeEhmemJQODhJM3F0SDJYRjFUbFJ3N3loQi9i?=
 =?utf-8?B?RTdhUEtOSGw1ajk2aEw1NVpKMDN6alltV2JaaG1nNVhXQ09jOGNIalNCNGhE?=
 =?utf-8?B?R3FCMEhDeVZhbEdSeS8wYkIwNUc2S1ZHZHdBYVZ0YTZVQVJVaDduS0luTC9s?=
 =?utf-8?B?dm4zdVlyMHJzSWIyK3RaSFI4RWJzMEdjSzhXL2xqcS8xb3ZOM2IzUjBWd21I?=
 =?utf-8?B?YWptQ3EySEFOVkNFM3FrWUVUUWk0ci9PZ2dmTkxDTnhQb2tMeFgxVHBLZXhh?=
 =?utf-8?B?eDZlRlY1QmlqcGpXbHdoUGtDRFIwdlNMQzN6eHlveVIzOVRCb2d6d0FQcWJj?=
 =?utf-8?B?TlQwRmZlMGFjVGcxTENvSXRQaUFGTkl0SlJjdWtCTzJsSkRhc2lTTUphZjM5?=
 =?utf-8?B?V0YrRVYvYThxTUlma0VvV0hyMWp0TWRScW9DVmpUa0dDQS9HSlg5ejNHRTZ0?=
 =?utf-8?B?UDJSdE1VS1AwYmJZRU1OVFBOR1FSbDBmQjB5NTBKakl2MVhBZzNMTWgwSndj?=
 =?utf-8?B?V0FzRXJ2azllVmZrZm1HSkNqdGhCb2tKblVYK1J6QWlXR0VkY1lLK01vNFhv?=
 =?utf-8?B?S2RpTVBZcjQxeU1aSE5jWVJnRDlFNFdlSlArczQ0T1JpRWlMUnFuaHpaZFBC?=
 =?utf-8?B?cVNvVnZiMFhXbDNtcEozK3ROSFZicmo0bjdhUWZpTmZ4eHp2L0FRWXNtWlZU?=
 =?utf-8?B?ZUxDdXBkRHlTcVR4WmZicHJTT3hUeGdBWmpOQ0FSaXQreW1NYzBCSjgrYXlo?=
 =?utf-8?B?dXAyek1rM2FhZU5xTDFPaERPVjZjeXpmR2tWT042L2ttbXEwbFh5bk55cGk1?=
 =?utf-8?B?WTAxLzBuQmZpVFlsclZQUlBWazA5Mkw0K2lwTmh4eXJQT2pUaUVjTW1lMWNx?=
 =?utf-8?B?cVlIbHlqSXJjRW9KN2dHYnZ5ZzU1TVFSb0NmemNHNWJmM3VUQTdaS1hnQTNR?=
 =?utf-8?B?NG9RSm1XZGR6N0JIZ1N2RDRzZE5YQlZVelkvUW1FNWkyNWN0cXJuOTFqQ3li?=
 =?utf-8?B?ZitTYWUxaFNYQjJRandwQUQvalhZeFREQWVZa21DVHpzRWc9PQ==?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 12:53:00.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af870ffc-6b7b-49ed-2257-08dd09624412
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_045308_817475_C13C9DEC 
X-CRM114-Status: UNSURE (   9.33  )
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



Am 13.11.24 um 12:09 schrieb MD Danish Anwar:
> ICSSG has 7 available clocks per instance. Add all the cloks to ICSSG
> nodes. ICSSG currently uses ICSSG_ICLK (clk id 20) which operates at
> 250MHz. Switch ICSSG clock to ICSSG_CORE clock (clk id 0) which operates at
> 333MHz.
> 
> ICSSG_CORE clock will help get the most out of ICSSG as more cycles are
> needed to fully support all ICSSG features.
> 
> This commit also changes assigned-clock-parents of coreclk-mux to
> ICSSG_CORE clock from ICSSG_ICLK.
> 
> Performance update in dual mac mode
>    With ICSSG_CORE Clk @ 333MHz
>      Tx throughput - 934 Mbps
>      Rx throughput - 914 Mbps,
> 
>    With ICSSG_ICLK clk @ 250MHz,
>      Tx throughput - 920 Mbps
>      Rx throughput - 706 Mbps

I can see similar improvements. Thank you.

> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Tested on a phyBOARD-Electra-AM64x board,

Tested-by: Wadim Egorov <w.egorov@phytec.de>

