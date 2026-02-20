Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE4BC55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOd3oFSxuAgPCTBP/y5Q0xNC2Dr0CaaGRa00aGU5R34=; b=N20UlNgRu2BS3ts86VAitY3zPD
	e5sqyd/KBZFLuMXNgIF+VhifIiAQlqSkb9TBXjdt8YHUCaTVhgXZyVh2wsnO/Hqm6PwUWtXa45Uhq
	jEUY3h8HO20oFmyEFpXq17zRUC4ZygyBISBWQkBYbvL16RQUuc4WFJ7U1N0bz5frC3z5g0jGTLiMt
	HHAdsWeddaVL6s/z2NWa0TJMRwXo0d0Yt/0Ad7EbHQNs+hV+VxcFvnZWeaffkZrlp/+nTKTb+2BC7
	/KoZAMto6wLwPyiSbz5SIs29sEqkJiJUb5EaDGHAMCeyeQ9z2H3FpVanpmZkgNeLMMlHFOXbX8gKs
	hoRd6OGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQRB-0000000EXED-38Xr;
	Fri, 20 Feb 2026 13:20:53 +0000
Received: from mail-swedencentralazon11013021.outbound.protection.outlook.com ([52.101.83.21] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQR7-0000000EXDq-07Di
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:20:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fWMvoHzVjVH02nvy5DV/6QNjvNWMh+M+mX6XVi7gzHqy7rdBOGzc3bcx3UjAWOO1KesuVi+17FObSZZUrKTbs1WEDloovTKm+YIOzPbE7BTmrY9qOXSx1wB45MHyQoW0NI/JqINPtS6ifIvMmx70RlNaovhNYFH7W0YCF+2KDVGzVkH/tf4L0q4nd3PBx48rv9R6PkEICROXhNSPquO5B++55Ru65bl8BkpdV8Gj8uBHbAEP+VxaF3nrvSJIpm/8muE5rkkK4xOhUZg51ww2MX1B4mXluzxYrkCyeYG15CwpY/PvB3T3fm6iDo7E9M6nJpg5nqASegPQVUFZGOYxeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOd3oFSxuAgPCTBP/y5Q0xNC2Dr0CaaGRa00aGU5R34=;
 b=eHNXQr+UcvqnQ1MJG+gVSVxwNca6xLEOqzVKGHFUcn1RsQWBi2NM52liyzGL9xI+2c7w8vQPgoEPj0IgcyrwPL3dP1zWkU6KM2u0DCLEh8/pJHlh5O+whhR+TI3vrOOb7NzWb6UJkE6pwL+z7PxmoBGzulo9oLNEiZNIBudHrl/AujEwosk3r/7fObVtFS1mvXzUGO5fGSZD6iLhTSfC++ztLD0nKZCuNhpY2g8E+XEwOijYkHLXFkXme5A7HTaX67QDys+XMhAOoesARrRAEzQUfLcbN7SWlVURI8mdj+X03s7Z8nlK9bVGO/XHThhToIyl5P11jylTHRDpeBftAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOd3oFSxuAgPCTBP/y5Q0xNC2Dr0CaaGRa00aGU5R34=;
 b=pfLuKz5igXLTYl38up6NPo8VLV2dilz93UkQ+yqjTgtXosbdX6T7O0rJ/oa2AksNOALkuw/bbimmEkp7Zv1hp2TCmjUMc5MO5K0vQk/wJpI9GaZS34aSpPnXmleybQDBXWcZj/HAWgrGghLznBRs+SQDZwflXCf5c7vtAEApegU=
Received: from DU7P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::27)
 by AS1PR08MB7514.eurprd08.prod.outlook.com (2603:10a6:20b:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 13:20:41 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::d9) by DU7P251CA0010.outlook.office365.com
 (2603:10a6:10:551::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 13:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 13:20:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd14iPF1dx/ORZDSzlbL3BOdRoq3t83EqL7FK7axZapfMsXb4NT/T8BVkte17blIqF4gDzWBIEuQX6s3K8Q9HjqzR1UqvYIEizMA1sAHUQ3PFgQlNxOmYdSEiGdNtnQoYeTUl2ZXqVv2vbvbJ/Ar7UQNcWnQcPL92i4PcSFt0sgXIxtzHMPfaSVlGC/1rJAcXA9+VqLkydlDiOxgww5snrRdmc0XD+Cmpsm0g7tf6EMPVch4psoXlI3KbN1QscfUEtHrH9rgUjDwPtpoViwbrHn8+MfPA2Q8yrIxCRWZB0LDr4oJY0vXitcTF6/Jj8YK63fbhSvwCmDRd5W+C1ZkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOd3oFSxuAgPCTBP/y5Q0xNC2Dr0CaaGRa00aGU5R34=;
 b=LDra21cizt5YH3tHLgI4RBLT5iRW/04Ne4bbHLw+ZIk+MvbnQphG36ixOfbeZhTofNF2F1Y7aAGfy7C1GMx3yRJmKUDcPX1ebaBwcOmru5uLYx528SLNLJd1YZBSbZh0qIALhmQWduKWxfrErJsTTJUW4rIzU3sPzDLVJl/yR982a7Mp36skYHqIjREv3bKnDa8ja8G2OVUbHVxqJQf5jSrQGcODlNUUI43AqevT73RTSCqqab++i+hntJnEWdzipDD2dQ1PgJg+tmg7bbHMX5DZUs/i8AiZXPShjut7CPq0wJeJusxBFvDJ1m3mVKSZf7pgOnPlltfemtPa4Ohs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOd3oFSxuAgPCTBP/y5Q0xNC2Dr0CaaGRa00aGU5R34=;
 b=pfLuKz5igXLTYl38up6NPo8VLV2dilz93UkQ+yqjTgtXosbdX6T7O0rJ/oa2AksNOALkuw/bbimmEkp7Zv1hp2TCmjUMc5MO5K0vQk/wJpI9GaZS34aSpPnXmleybQDBXWcZj/HAWgrGghLznBRs+SQDZwflXCf5c7vtAEApegU=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 13:19:37 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 13:19:37 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Jie Gan
	<jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 4/8] coresight: cti: Remove CPU power management code
Thread-Topic: [PATCH 4/8] coresight: cti: Remove CPU power management code
Thread-Index: AQHcme4l9v3GgJqrVEW9B7rTGlSP0rWLowyA
Date: Fri, 20 Feb 2026 13:19:36 +0000
Message-ID: <PAVPR08MB9674AEDC6BD1DD23C76D40B38C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-4-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-4-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|AS8PR08MB6470:EE_|DU6PEPF0000B61C:EE_|AS1PR08MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: f0281858-6083-4457-7d25-08de7082d895
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bjI0bnlFRHZKdTArcVB6eWw3ZlA3SXBGTytDamtGVnJKYkFrNTBjQmt1bXht?=
 =?utf-8?B?clRQNkhHOWNscnUzbUpvY2gzcnhHOGpHaXNiaHBoVXBEZ2J0dnZTMUVtb2xC?=
 =?utf-8?B?dW43cERsUlBDbjMvQnphckpWa0Z5UEZpTTlXYlVmYXVnV2JidXFQSG9YWlpQ?=
 =?utf-8?B?OE95SUZUYWI4eS83OHF3VDhZamtoN1RIRzNhVldLZWVEUzZtL1lVYkJoUkRm?=
 =?utf-8?B?QnRYTyt2UW0xZmx4bVMwd1JJSlFaOGFxN0NKcFBQYUV6Vno1TW9jdkhSZDZy?=
 =?utf-8?B?UmkxZDJ1K1JjOTk0NGo1bDJjQUV6YkJBY0tEbFovd1g4WklkUHB4TFhMVnBS?=
 =?utf-8?B?SDNhMEp1RUdPOWpYNTlYK3IvVFljNWhMc0UzSTRvS3A2NVRNUUM4clZkU0xk?=
 =?utf-8?B?TnpjdUwwQUJsazhlYmNxM2dQNUQwa2FMUnpFMXZqYnNZUHpkV29vcXRkQmV5?=
 =?utf-8?B?eGk3Z05Gc1JJRktNSGxrRlV1VitjZy9yNUdiUFVyaml1YVpSM1lpcTlhM2V5?=
 =?utf-8?B?TFVoakhnQlo1THYyVG9sODhuWVNRNnppZlR4N0JGc2luKzFzWjZSVzEvbEth?=
 =?utf-8?B?RzEzaW15d3hGU3dEY1RKaVBnZDNNeDhpOHVuWElqREhoSGNGd3Z5TTIzSWJK?=
 =?utf-8?B?OVcyZU05OG5MeGZqY0NYakNJSy9oZTlVWEV1RzRhcEpobFFQYVN3eXdFU0RL?=
 =?utf-8?B?SVd2RE45Zm1LL0JnT3ZBRFp3VTZkMUl4eTNsdWNNNFVFMjRBNzNmUklPdEZJ?=
 =?utf-8?B?SCtYeDNQREowZnVkYW4yNVQ0NHFGak9QSy9zcXQwckJNZlRWSFN6c1BhUEFM?=
 =?utf-8?B?VTNCR1FSdEpJeTM1NlIya01iZzNHd21XVk0rbVhUOTJVeWE5M2dzbkxXSUR0?=
 =?utf-8?B?SHhZUFZROHVIWnNWMkFSM1RqNXdWakI5MllhZmlFMnFnZjQ2V1J6SUdOWmFo?=
 =?utf-8?B?Z081emI1c3NKWDJmUGZ4cis0TStCNHk4bWtsTC8rNXRraHE0NG9qOE9xUXh2?=
 =?utf-8?B?YVU4dHZad2I2U09zOEJYbnI1SSt5QjFhd3hOUEVOK1hzZjdWVExNM1h5ZUNm?=
 =?utf-8?B?aUozRDI1dS9rQThYRHF4MXdGd1hqSTRSaWtXNE5xdW5uM0RaeHpVOVFoQTN5?=
 =?utf-8?B?N3VaYVBUejJOSnlJQ3ZxdVhqaHR3Q2NFSmFnbmk3Zy9TTHNmWUwwcTNVekZt?=
 =?utf-8?B?V1BVNlljQlN1Y1czK1k1Zjd5aHlxb0NPTVVOaU9vUERpTG1rcldYZTdFc1BT?=
 =?utf-8?B?eE5DZ1NmUWdKNkxCaU5DZmo2ZHo4SGlOTXo5WTRIc3JxUUhiSnlGd2E2ODNE?=
 =?utf-8?B?akpaS1c2VFordmVpL0hUMTlvZkRzYkZGK3k2TXlycExucVMwcG5XZnp0VUtX?=
 =?utf-8?B?ektKMEJLcHVsdnBhcTUvTHJEM25rdDVncFFCMndyWXFjNlk1cDZlWGNUWDRL?=
 =?utf-8?B?K0lBUEZkeGM4YkMvS05GMUx4bDVkMThZZmNXYWJRUEhlaGlGZ1k3MnVlNEV0?=
 =?utf-8?B?cjVMdXV4OU5UdmlsMWVqZFYvRURPNlJmekE1TkRyaFE1WUFXQzkyb0ZvSzJo?=
 =?utf-8?B?RzU5Nnc1SWMyS1RSNm1DNWV4SU1vMFdwYWVyWGo2d3NGaWZRWWRiMWtuRHBB?=
 =?utf-8?B?WW0rT3ZPc0NuMHpwS0szbkRlOExEMnZpcVFWVGVPZHltUVdFdCtwblhkUFkv?=
 =?utf-8?B?c3A3UlJaM2xOZnV4R1ExTy9aQnRMeHJpZHdOMjZGT3paaWpQZUhFd1VHMW9F?=
 =?utf-8?B?TzgzVi8yQnZOaDNQTXlZbkdzc3R5cXdXMTBlR3B4ZHArRVdGNFVuMWdYZ2tk?=
 =?utf-8?B?bDVHck1SNnp5NkdZSXBuR0tJT0tydDlJV0x4OXh6aFUyS0ZXSEFrY2U0TUd3?=
 =?utf-8?B?RXBGOXh5SXdQT0NpdXNzdXJKU2FPRWowRW93R0JoTFRwaWNLeU5GbVV0RFlF?=
 =?utf-8?B?Y2ppMmszTUQwclN4YUF3cWRRNU1EeUJtZnViczJqa2dUNi9aQytpQTQrSkJO?=
 =?utf-8?B?RExqQ2xFT3VwcFJicHBFSUJBNlFrcGFaZXNaSGtWMHY2bXd6bWx6SDJKTTdY?=
 =?utf-8?B?YnV2TENVMDRwRWgyem52a09xenYvZmZoYmRXT0U2T210cUhXZEo4Ykl2QWcz?=
 =?utf-8?B?RlUrVmZHZ1k2WGhUcHZlbDl6cWFmTWtMcjBHQmlINFlrS3RNc1RaRUxpVFl5?=
 =?utf-8?Q?Y0omN9EPHHAIH2bl1XP/W7w=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 902f2565-840b-4703-6ddb-08de7082b1b3
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|36860700013|14060799003|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUdIVWQrK0F6Y21Ham1NcTNkcVFwcmd6bENETGt1WmQwL0grakN6YWFNNDln?=
 =?utf-8?B?WEZnVUJQb3UxcFVvU3FnZVZxcXN2Qndlck5FUzFsdjRMZXlSTVZDNnNxT0lC?=
 =?utf-8?B?SUdnKzdCTW0zeE1yN2srNW1UY2p3cmtIeFFJWE1tbWJMa00rSjFQY1d1SFdp?=
 =?utf-8?B?cnhCZWRRcVVpSlV4SkxYMnltUlY4eFB6VjBDdEJlZmd3b3BPM3R4a0MxdExE?=
 =?utf-8?B?NUNkV21nd1g4anpNK2xtOEZXT3NsTitubU02YmxLYjRBTS92ZzduR3ovSzM3?=
 =?utf-8?B?RGprbXU3bFlpenBQTnpqanJiVzh3WHA4djRWYXNXQ1JqREVyNGJjbHJHZDEr?=
 =?utf-8?B?MTNRakRKZVJTMmFncmFTUnR3cmlkZ0VpYnpJcXZYVmg4QzQweTAwYWpXaWJo?=
 =?utf-8?B?Mk9EaTBjK3NuNGtZTkxITUtZZ2lqcGpRQ1c1cHRtcXRKUnI2MlZsU2ZhdmxW?=
 =?utf-8?B?akYyMm5KdUpvcDVFVCtjUnNJclRyamt1US9OODF4WHl1MzFWSUwxNHlPMlZY?=
 =?utf-8?B?VzJIRDNjYWpIcisrOURvNzZMZEdPUjYzM1VDWGU3ZnRjYThiMzlzWDM1MU0r?=
 =?utf-8?B?TDA2TXF1TlVtRXd6M1BCWFBQYVd2V0xRcDdMWi8yN1YzZTgzY0QyRUtHMFN4?=
 =?utf-8?B?cEp0MTJid1d3VWJGcUYweldRNXpSa0lKeVQ4RGZUMU56eUR0SldsblZ3VlFL?=
 =?utf-8?B?U3lNWjhPcFpiZjlPRmx6T3cxQ2FLTkhTS1ZzSHorSkUxWUhiQ252c1B0MUw1?=
 =?utf-8?B?MUQ2aVlIWXNmYTMzUUg4ekhKdi9xdGVCdnJCeERCaldOZXZPYmwyd2NCa1hy?=
 =?utf-8?B?Y1ErTkhNcE5XRVBIak16OVVSdnhQTkc2MU5pdmJSWTZsV1NvalU4elNxUkRi?=
 =?utf-8?B?NWNDQWJRVzM1U01qbmc1N2JvWFlXS0gzN01zMUxBU1p6ZWRCMWxpOG9YdktJ?=
 =?utf-8?B?bFF2cTlIZjQrY1J2d2NRaDhhZS9UTmlOd2NqVFBRNWhPbmV1aGFVYXJyRE9s?=
 =?utf-8?B?SUVnc3FQMDY1Rnl3Qmp6M0VmUkpEbGFEK3Jib05ESjNnU1ZGdFJMMXR6UEJP?=
 =?utf-8?B?QXlJQUk3dElQTlhybWxYS1Mwd0dSUG9FWlVUT2QvLzZ5VERNUnEvUzZqcnpX?=
 =?utf-8?B?THJJdlA5Nmc1SUE3SDVtMkJNZWxYSGpZOU95YVNRbVN5NFVIRkZSMGx6Ullx?=
 =?utf-8?B?TzgxZGpXZmF4RTNXMDQ4cE92emUrSTV5UE9Pd3pNZ3Q5VnR0V2JzL3NvakFq?=
 =?utf-8?B?ZVNabmg5ZUVKa2g3NjZTRXF6ZHluRk5Vd21EcVBrbkxpZk00YnlLakRFQWtR?=
 =?utf-8?B?cUVaU0VUZjlZbGlLRU11WjRlamtHK0hyK1g3U0lweXE2Q0QvcHg1ZzZQdEd6?=
 =?utf-8?B?QjRzUklDdUgxY2x2YitkaHphb0VyZ3M0R1ZZc0dmTE4rZVFOSS9wQk1lcTcy?=
 =?utf-8?B?QVlRa3pmblFxa2M1Sm5hZXh6T29Bc0E3VHR0NVdRc0ZHTkdoL083U3lDK0VY?=
 =?utf-8?B?L3ExNEo2TjhEcjduQTNndzVQY1FzNHA3eGhXZWVWb3pwMzBMS2M2Um42QmpQ?=
 =?utf-8?B?Qk50b2RaeW8veHU4VVNyQ0ZsMTZVdlh6Nmt0c0ZVWTZaRjRQdFBOSUdmL1dM?=
 =?utf-8?B?NkdubEw3T1pmcVIrUTRFV2dqcGxpNlNCVjRuTUNKYmMrcjZ3emVrNUh6T1c3?=
 =?utf-8?B?bFpyYXloQ0RjNnFEbVBoc3BiRUZDUnF4ZGVOb2M3QkpLb1Q4Z08yWExvU2NT?=
 =?utf-8?B?OUpWZXBTdWJwL3RVc2RCU3d5TjVEbjdLazNIY0JraEM3VzN0QU9vQUtCVDVP?=
 =?utf-8?B?R0t0WjFKSzVrSkNhcEcyOTZiZkk4eUFITGJYQytZMzArMlVUTjNLaE1Dc3lr?=
 =?utf-8?B?L0JOTEhOQWU1SXRic1huWGVpQWtyZTU2eW1IZnVPaGp2bGlLd2NsWnNvTTZT?=
 =?utf-8?B?TEdXU29GU2Nzek83a2VuMXYxYkJ4WGJ6d3RMNVNmaTdqUlZ0Wjd4SHpJRS9l?=
 =?utf-8?B?VDRGVTRLbTFFMWFDc012TDVpREdhOUpwV0xTdmRSdlUzZGRqek5nYTc5dENz?=
 =?utf-8?B?R3BTTGR2YU5Ud3NKeHBtN0J0RUd0dTJJbC8xbGZMRmgwbHJ5dzkzM1hZNm9V?=
 =?utf-8?B?VEFwbWRZNmt1ZmxQejR4Sjlrb0Jpdmx4bmRrSHR5R290b2R4ZDRrT0d0TGRZ?=
 =?utf-8?B?YTdBQ1ZhazFSMXNwdHRwNEFXR29rdlRlWVBUcGIzRUdRSUtpTE5NNm91ZGlu?=
 =?utf-8?B?ZGhyUkhvdTcvZjFPRnpzaDNxV3N3PT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(14060799003)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TPNXrqYs4euC5pchlBd5rRSuASjkLL5ZsOGMaNbDvyWkReRc+uON1Np0EJe3M4fHzgLm7EuDhjcRcWKPbkG1IHSN3Baj4tTv802sL5pbPTAW+b4XnWhQyKqDS60M+benDYcIpAFcwE7zhUaPZbs4Llg7zhOxirrO1OOHEqa4h1n1DCddr8RllfGr0W0Gi9MpnI2ThxNaoTqBf5BLaOhhVQotZMdyQvw7XoCLnraqdDxphdz/JJEk2aM5LHzc6bNTa1twEvO53V3kNHyg04TvcyH9cfSYQCGY3vTiA5jnQ3hXP9a3nbJSCMCtNgY1QglrXZoHyG98M6aivlnCRKqnssFrhNqWg+u/YA0c+TI4js+Ee3Z8Ifmndw70wSi3BvNNupOwU+HmtwTDsbNOlbas5T8V7PuJuKdXZWxryG2x8INUkEmlrw9iidgB2zoq3ydw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:20:41.3847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0281858-6083-4457-7d25-08de7082d895
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_052049_300611_5516DAAE 
X-CRM114-Status: UNSURE (   5.78  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDksIDIwMjYgNjowMSBQTQ0KPiBU
bzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtlIExlYWNoDQo+
IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9y
Zz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVs
LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgVGluZ3dl
aSBaaGFuZyA8cXVpY190aW5nd2VpQHF1aWNpbmMuY29tPjsNCj4gWWluZ2NoYW8gRGVuZyA8eWlu
Z2NoYW8uZGVuZ0Bvc3MucXVhbGNvbW0uY29tPjsgSmllIEdhbg0KPiA8amllLmdhbkBvc3MucXVh
bGNvbW0uY29tPg0KPiBDYzogY29yZXNpZ2h0QGxpc3RzLmxpbmFyby5vcmc7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDQvOF0gY29y
ZXNpZ2h0OiBjdGk6IFJlbW92ZSBDUFUgcG93ZXIgbWFuYWdlbWVudCBjb2RlDQo+IA0KPiBBY2Nv
cmRpbmcgQXJtIEFSTSwgdGhlIENUSSBBU0lDQ1RMIHJlZ2lzdGVyOg0KPiANCj4gICAiSXQgaXMg
SU1QTEVNRU5UQVRJT04gREVGSU5FRCB3aGV0aGVyIEFTSUNDVEwgaXMgaW1wbGVtZW50ZWQgaW4g
dGhlDQo+ICAgIENvcmUgcG93ZXIgZG9tYWluIG9yIGluIHRoZSBEZWJ1ZyBwb3dlciBkb21haW4u
Ig0KPiANCj4gVGhpcyBpcyB0aGUgb25seSBDVEkgcmVnaXN0ZXIgdGhhdCBtYXkgcmVzaWRlIGlu
IHRoZSBjb3JlIHBvd2VyIGRvbWFpbi4NCj4gSG93ZXZlciwgaXQgaGFzIGJlZW4gY29uZmlybWVk
IHRoYXQgQXJtIGRlc2lnbmVkIENUSXMgcGxhY2UgQVNJQ0NUTCBpbg0KPiB0aGUgZGVidWcgcG93
ZXIgZG9tYWluLiAgRnVydGhlcm1vcmUsIEFTSUNDVEwgaXMgaW1wbGVtZW50ZWQgb25seSB3aGVu
DQo+IENUSURFVklELkVYVE1VWE5VTSBpcyBub24temVybywgd2hpY2ggaXMgYSByYXJlIGNhc2Ug
Zm9yIENQVSBDVElzLg0KPiANCj4gRm9yIHRoZXNlIHJlYXNvbnMsIGl0IGlzIHNhZmUgdG8gY29u
Y2x1ZGUgdGhhdCBhbGwgQ1RJIHJlZ2lzdGVycyBhcmUgbm90DQo+IGxvY2F0ZWQgaW4gdGhlIENQ
VSBwb3dlciBkb21haW4uIFRoZXJlZm9yZSwgdGhlIENUSSBkcml2ZXIgZG9lcyBub3QgbmVlZA0K
PiBDUFUgcG93ZXIgbWFuYWdlbWVudC4NCj4gDQo+IFRoaXMgY29tbWl0IHJlbW92ZXMgdGhlIENQ
VSBwb3dlciBtYW5hZ2VtZW50IGZyb20gQ1RJIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IExlbyBZYW4gPGxlby55YW5AYXJtLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMgfCAxODYgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE4MyBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWN0aS1jb3JlLmMNCj4gYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0
aS1jb3JlLmMNCj4gaW5kZXgNCj4gMTk1MGU5Yjc1N2FlNDg3OWEyNjcxZGRhZjU2NzVjNTRhYTc5
NTZkNS4uM2JlY2VmNjA3ZTVlYzUyMjVjYjZmDQo+IGQ2MTZkYTgwNDkwMzY1MWZkZjEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUu
Yw0KPiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3Jl
LmMNCj4gQEAgLTQyLDEyICs0Miw2IEBAIHN0YXRpYyBERUZJTkVfTVVURVgoZWN0X211dGV4KTsN
Cj4gICNkZWZpbmUgY3NkZXZfdG9fY3RpX2RydmRhdGEoY3NkZXYpCVwNCj4gIAlkZXZfZ2V0X2Ry
dmRhdGEoY3NkZXYtPmRldi5wYXJlbnQpDQo+IA0KPiAtLyogcG93ZXIgbWFuYWdlbWVudCBoYW5k
bGluZyAqLw0KPiAtc3RhdGljIGludCBucl9jdGlfY3B1Ow0KPiAtDQo+IC0vKiBxdWljayBsb29r
dXAgbGlzdCBmb3IgQ1BVIGJvdW5kIENUSXMgd2hlbiBwb3dlciBoYW5kbGluZyAqLw0KPiAtc3Rh
dGljIHN0cnVjdCBjdGlfZHJ2ZGF0YSAqY3RpX2NwdV9kcnZkYXRhW05SX0NQVVNdOw0KPiAtDQo+
ICAvKg0KPiAgICogQ1RJIG5hbWluZy4gQ1RJIGJvdW5kIHRvIGNvcmVzIHdpbGwgaGF2ZSB0aGUg
bmFtZSBjdGlfY3B1PE4+IHdoZXJlDQo+ICAgKiBOIGlzIHRoZSBDUFUgSUQuIFN5c3RlbSBDVElz
IHdpbGwgaGF2ZSB0aGUgbmFtZSBjdGlfc3lzPEk+IHdoZXJlIEkNCj4gQEAgLTExMywyOCArMTA3
LDYgQEAgc3RhdGljIGludCBjdGlfZW5hYmxlX2h3KHN0cnVjdCBjdGlfZHJ2ZGF0YSAqZHJ2ZGF0
YSkNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC0vKiByZS1lbmFibGUgQ1RJIG9uIENQVSB3
aGVuIHVzaW5nIENQVSBob3RwbHVnICovDQo+IC1zdGF0aWMgdm9pZCBjdGlfY3B1aHBfZW5hYmxl
X2h3KHN0cnVjdCBjdGlfZHJ2ZGF0YSAqZHJ2ZGF0YSkNCj4gLXsNCj4gLQlzdHJ1Y3QgY3RpX2Nv
bmZpZyAqY29uZmlnID0gJmRydmRhdGEtPmNvbmZpZzsNCj4gLQ0KPiAtCWd1YXJkKHJhd19zcGlu
bG9ja19pcnFzYXZlKSgmZHJ2ZGF0YS0+c3BpbmxvY2spOw0KPiAtDQo+IC0JY29uZmlnLT5od19w
b3dlcmVkID0gdHJ1ZTsNCj4gLQ0KPiAtCS8qIG5vIG5lZWQgdG8gZG8gYW55dGhpbmcgaWYgbm8g
ZW5hYmxlIHJlcXVlc3QgKi8NCj4gLQlpZiAoIWRydmRhdGEtPmNvbmZpZy5lbmFibGVfcmVxX2Nv
dW50KQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gLQkvKiB0cnkgdG8gY2xhaW0gdGhlIGRldmljZSAq
Lw0KPiAtCWlmIChjb3Jlc2lnaHRfY2xhaW1fZGV2aWNlKGRydmRhdGEtPmNzZGV2KSkNCj4gLQkJ
cmV0dXJuOw0KPiAtDQo+IC0JY3RpX3dyaXRlX2FsbF9od19yZWdzKGRydmRhdGEpOw0KPiAtCWNv
bmZpZy0+aHdfZW5hYmxlZCA9IHRydWU7DQo+IC0JcmV0dXJuOw0KPiAtfQ0KPiAtDQo+ICAvKiBk
aXNhYmxlIGhhcmR3YXJlICovDQo+ICBzdGF0aWMgaW50IGN0aV9kaXNhYmxlX2h3KHN0cnVjdCBj
dGlfZHJ2ZGF0YSAqZHJ2ZGF0YSkNCj4gIHsNCj4gQEAgLTY1MiwxNDYgKzYyNCw2IEBAIHN0YXRp
YyB2b2lkIGN0aV9yZW1vdmVfY29ubl94cmVmcyhzdHJ1Y3QNCj4gY3RpX2RydmRhdGEgKmRydmRh
dGEpDQo+ICAJfQ0KPiAgfQ0KPiANCj4gLS8qKiBjdGkgUE0gY2FsbGJhY2tzICoqLw0KPiAtc3Rh
dGljIGludCBjdGlfY3B1X3BtX25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNp
Z25lZCBsb25nIGNtZCwNCj4gLQkJCSAgICAgdm9pZCAqdikNCj4gLXsNCj4gLQlzdHJ1Y3QgY3Rp
X2RydmRhdGEgKmRydmRhdGE7DQo+IC0Jc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2Ow0K
PiAtCXVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+IC0JaW50IG5vdGlm
eV9yZXMgPSBOT1RJRllfT0s7DQo+IC0NCj4gLQlpZiAoIWN0aV9jcHVfZHJ2ZGF0YVtjcHVdKQ0K
PiAtCQlyZXR1cm4gTk9USUZZX09LOw0KPiAtDQo+IC0JZHJ2ZGF0YSA9IGN0aV9jcHVfZHJ2ZGF0
YVtjcHVdOw0KPiAtCWNzZGV2ID0gZHJ2ZGF0YS0+Y3NkZXY7DQo+IC0NCj4gLQlpZiAoV0FSTl9P
Tl9PTkNFKGRydmRhdGEtPmN0aWRldi5jcHUgIT0gY3B1KSkNCj4gLQkJcmV0dXJuIE5PVElGWV9C
QUQ7DQo+IC0NCj4gLQlndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSkoJmRydmRhdGEtPnNwaW5s
b2NrKTsNCj4gLQ0KPiAtCXN3aXRjaCAoY21kKSB7DQo+IC0JY2FzZSBDUFVfUE1fRU5URVI6DQo+
IC0JCS8qIENUSSByZWdzIGFsbCBzdGF0aWMgLSB3ZSBoYXZlIGEgY29weSAmIG5vdGhpbmcgdG8g
c2F2ZSAqLw0KPiAtCQlkcnZkYXRhLT5jb25maWcuaHdfcG93ZXJlZCA9IGZhbHNlOw0KPiAtCQlp
ZiAoZHJ2ZGF0YS0+Y29uZmlnLmh3X2VuYWJsZWQpDQo+IC0JCQljb3Jlc2lnaHRfZGlzY2xhaW1f
ZGV2aWNlKGNzZGV2KTsNCj4gLQkJYnJlYWs7DQo+IC0NCj4gLQljYXNlIENQVV9QTV9FTlRFUl9G
QUlMRUQ6DQo+IC0JCWRydmRhdGEtPmNvbmZpZy5od19wb3dlcmVkID0gdHJ1ZTsNCj4gLQkJaWYg
KGRydmRhdGEtPmNvbmZpZy5od19lbmFibGVkKSB7DQo+IC0JCQlpZiAoY29yZXNpZ2h0X2NsYWlt
X2RldmljZShjc2RldikpDQo+IC0JCQkJZHJ2ZGF0YS0+Y29uZmlnLmh3X2VuYWJsZWQgPSBmYWxz
ZTsNCj4gLQkJfQ0KPiAtCQlicmVhazsNCj4gLQ0KPiAtCWNhc2UgQ1BVX1BNX0VYSVQ6DQo+IC0J
CS8qIHdyaXRlIGhhcmR3YXJlIHJlZ2lzdGVycyB0byByZS1lbmFibGUuICovDQo+IC0JCWRydmRh
dGEtPmNvbmZpZy5od19wb3dlcmVkID0gdHJ1ZTsNCj4gLQkJZHJ2ZGF0YS0+Y29uZmlnLmh3X2Vu
YWJsZWQgPSBmYWxzZTsNCj4gLQ0KPiAtCQkvKiBjaGVjayBlbmFibGUgcmVmZXJlbmNlIGNvdW50
IHRvIGVuYWJsZSBIVyAqLw0KPiAtCQlpZiAoZHJ2ZGF0YS0+Y29uZmlnLmVuYWJsZV9yZXFfY291
bnQpIHsNCj4gLQkJCS8qIGNoZWNrIHdlIGNhbiBjbGFpbSB0aGUgZGV2aWNlIGFzIHdlIHJlLXBv
d2VyICovDQo+IC0JCQlpZiAoY29yZXNpZ2h0X2NsYWltX2RldmljZShjc2RldikpDQo+IC0JCQkJ
Z290byBjdGlfbm90aWZ5X2V4aXQ7DQo+IC0NCj4gLQkJCWRydmRhdGEtPmNvbmZpZy5od19lbmFi
bGVkID0gdHJ1ZTsNCj4gLQkJCWN0aV93cml0ZV9hbGxfaHdfcmVncyhkcnZkYXRhKTsNCj4gLQkJ
fQ0KPiAtCQlicmVhazsNCj4gLQ0KPiAtCWRlZmF1bHQ6DQo+IC0JCW5vdGlmeV9yZXMgPSBOT1RJ
RllfRE9ORTsNCj4gLQkJYnJlYWs7DQo+IC0JfQ0KPiAtDQo+IC1jdGlfbm90aWZ5X2V4aXQ6DQo+
IC0JcmV0dXJuIG5vdGlmeV9yZXM7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgY3RpX2NwdV9wbV9uYiA9IHsNCj4gLQkubm90aWZpZXJfY2FsbCA9IGN0aV9jcHVf
cG1fbm90aWZ5LA0KPiAtfTsNCj4gLQ0KPiAtLyogQ1BVIEhQIGhhbmRsZXJzICovDQo+IC1zdGF0
aWMgaW50IGN0aV9zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkNCj4gLXsNCj4gLQlzdHJ1
Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEgPSBjdGlfY3B1X2RydmRhdGFbY3B1XTsNCj4gLQ0KPiAt
CWlmICghZHJ2ZGF0YSkNCj4gLQkJcmV0dXJuIDA7DQo+IC0NCj4gLQljdGlfY3B1aHBfZW5hYmxl
X2h3KGRydmRhdGEpOw0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW50IGN0
aV9keWluZ19jcHUodW5zaWduZWQgaW50IGNwdSkNCj4gLXsNCj4gLQlzdHJ1Y3QgY3RpX2RydmRh
dGEgKmRydmRhdGEgPSBjdGlfY3B1X2RydmRhdGFbY3B1XTsNCj4gLQ0KPiAtCWlmICghZHJ2ZGF0
YSkNCj4gLQkJcmV0dXJuIDA7DQo+IC0NCj4gLQlndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSko
JmRydmRhdGEtPnNwaW5sb2NrKTsNCj4gLQ0KPiAtCWRydmRhdGEtPmNvbmZpZy5od19wb3dlcmVk
ID0gZmFsc2U7DQo+IC0JaWYgKGRydmRhdGEtPmNvbmZpZy5od19lbmFibGVkKQ0KPiAtCQljb3Jl
c2lnaHRfZGlzY2xhaW1fZGV2aWNlKGRydmRhdGEtPmNzZGV2KTsNCj4gLQ0KPiAtCXJldHVybiAw
Ow0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW50IGN0aV9wbV9zZXR1cChzdHJ1Y3QgY3RpX2RydmRh
dGEgKmRydmRhdGEpDQo+IC17DQo+IC0JaW50IHJldDsNCj4gLQ0KPiAtCWlmIChkcnZkYXRhLT5j
dGlkZXYuY3B1ID09IC0xKQ0KPiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAtCWlmIChucl9jdGlfY3B1
KQ0KPiAtCQlnb3RvIGRvbmU7DQo+IC0NCj4gLQljcHVzX3JlYWRfbG9jaygpOw0KPiAtCXJldCA9
IGNwdWhwX3NldHVwX3N0YXRlX25vY2FsbHNfY3B1c2xvY2tlZCgNCj4gLQkJCUNQVUhQX0FQX0FS
TV9DT1JFU0lHSFRfQ1RJX1NUQVJUSU5HLA0KPiAtCQkJImFybS9jb3Jlc2lnaHRfY3RpOnN0YXJ0
aW5nIiwNCj4gLQkJCWN0aV9zdGFydGluZ19jcHUsIGN0aV9keWluZ19jcHUpOw0KPiAtCWlmIChy
ZXQpIHsNCj4gLQkJY3B1c19yZWFkX3VubG9jaygpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0N
Cj4gLQ0KPiAtCXJldCA9IGNwdV9wbV9yZWdpc3Rlcl9ub3RpZmllcigmY3RpX2NwdV9wbV9uYik7
DQo+IC0JY3B1c19yZWFkX3VubG9jaygpOw0KPiAtCWlmIChyZXQpIHsNCj4gLQ0KPiAJY3B1aHBf
cmVtb3ZlX3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfQVJNX0NPUkVTSUdIVF9DVElfU1RBDQo+IFJU
SU5HKTsNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQl9DQo+IC0NCj4gLWRvbmU6DQo+IC0JbnJfY3Rp
X2NwdSsrOw0KPiAtCWN0aV9jcHVfZHJ2ZGF0YVtkcnZkYXRhLT5jdGlkZXYuY3B1XSA9IGRydmRh
dGE7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gLX0NCj4gLQ0KPiAtLyogcmVsZWFzZSBQTSByZWdp
c3RyYXRpb25zICovDQo+IC1zdGF0aWMgdm9pZCBjdGlfcG1fcmVsZWFzZShzdHJ1Y3QgY3RpX2Ry
dmRhdGEgKmRydmRhdGEpDQo+IC17DQo+IC0JaWYgKGRydmRhdGEtPmN0aWRldi5jcHUgPT0gLTEp
DQo+IC0JCXJldHVybjsNCj4gLQ0KPiAtCWN0aV9jcHVfZHJ2ZGF0YVtkcnZkYXRhLT5jdGlkZXYu
Y3B1XSA9IE5VTEw7DQo+IC0JaWYgKC0tbnJfY3RpX2NwdSA9PSAwKSB7DQo+IC0JCWNwdV9wbV91
bnJlZ2lzdGVyX25vdGlmaWVyKCZjdGlfY3B1X3BtX25iKTsNCj4gLQ0KPiAJY3B1aHBfcmVtb3Zl
X3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfQVJNX0NPUkVTSUdIVF9DVElfU1RBDQo+IFJUSU5HKTsN
Cj4gLQl9DQo+IC19DQo+IC0NCj4gIC8qKiBjdGkgZWN0IG9wZXJhdGlvbnMgKiovDQo+ICBpbnQg
Y3RpX2VuYWJsZShzdHJ1Y3QgY29yZXNpZ2h0X2RldmljZSAqY3NkZXYsIGVudW0gY3NfbW9kZSBt
b2RlLA0KPiAgCSAgICAgICBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggKnBhdGgpDQo+IEBAIC04Mjcs
NyArNjU5LDYgQEAgc3RhdGljIHZvaWQgY3RpX2RldmljZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gIAlzdHJ1Y3QgY3RpX2RydmRhdGEgKmVjdF9pdGVtLCAqZWN0X3RtcDsNCj4gDQo+
ICAJbXV0ZXhfbG9jaygmZWN0X211dGV4KTsNCj4gLQljdGlfcG1fcmVsZWFzZShkcnZkYXRhKTsN
Cj4gDQo+ICAJLyogcmVtb3ZlIGZyb20gdGhlIGxpc3QgKi8NCj4gIAlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUoZWN0X2l0ZW0sIGVjdF90bXAsICZlY3RfbmV0LCBub2RlKSB7DQo+IEBAIC05MDYs
MTcgKzczNywxMiBAQCBzdGF0aWMgaW50IGN0aV9wcm9iZShzdHJ1Y3QgYW1iYV9kZXZpY2UgKmFk
ZXYsDQo+IGNvbnN0IHN0cnVjdCBhbWJhX2lkICppZCkNCj4gIAlpZiAoIWN0aV9kZXNjLm5hbWUp
DQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiANCj4gLQkvKiBzZXR1cCBDUFUgcG93ZXIgbWFuYWdl
bWVudCBoYW5kbGluZyBmb3IgQ1BVIGJvdW5kIENUSQ0KPiBkZXZpY2VzLiAqLw0KPiAtCXJldCA9
IGN0aV9wbV9zZXR1cChkcnZkYXRhKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlyZXR1cm4gcmV0Ow0K
PiAtDQo+ICAJLyogY3JlYXRlIGR5bmFtaWMgYXR0cmlidXRlcyBmb3IgY29ubmVjdGlvbnMgKi8N
Cj4gIAlyZXQgPSBjdGlfY3JlYXRlX2NvbnNfc3lzZnMoZGV2LCBkcnZkYXRhKTsNCj4gIAlpZiAo
cmV0KSB7DQo+ICAJCWRldl9lcnIoZGV2LCAiJXM6IGNyZWF0ZSBkeW5hbWljIHN5c2ZzIGVudHJp
ZXMgZmFpbGVkXG4iLA0KPiAgCQkJY3RpX2Rlc2MubmFtZSk7DQo+IC0JCWdvdG8gcG1fcmVsZWFz
ZTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gIAl9DQo+IA0KPiAgCS8qIHNldCB1cCBjb3Jlc2lnaHQg
Y29tcG9uZW50IGRlc2NyaXB0aW9uICovDQo+IEBAIC05MjksMTAgKzc1NSw4IEBAIHN0YXRpYyBp
bnQgY3RpX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqYWRldiwgY29uc3QNCj4gc3RydWN0IGFt
YmFfaWQgKmlkKQ0KPiANCj4gIAljb3Jlc2lnaHRfY2xlYXJfc2VsZl9jbGFpbV90YWcoJmN0aV9k
ZXNjLmFjY2Vzcyk7DQo+ICAJZHJ2ZGF0YS0+Y3NkZXYgPSBjb3Jlc2lnaHRfcmVnaXN0ZXIoJmN0
aV9kZXNjKTsNCj4gLQlpZiAoSVNfRVJSKGRydmRhdGEtPmNzZGV2KSkgew0KPiAtCQlyZXQgPSBQ
VFJfRVJSKGRydmRhdGEtPmNzZGV2KTsNCj4gLQkJZ290byBwbV9yZWxlYXNlOw0KPiAtCX0NCj4g
KwlpZiAoSVNfRVJSKGRydmRhdGEtPmNzZGV2KSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZHJ2ZGF0
YS0+Y3NkZXYpOw0KPiANCj4gIAkvKiBhZGQgdG8gbGlzdCBvZiBDVEkgZGV2aWNlcyAqLw0KPiAg
CW11dGV4X2xvY2soJmVjdF9tdXRleCk7DQo+IEBAIC05NDksMTAgKzc3Myw2IEBAIHN0YXRpYyBp
bnQgY3RpX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqYWRldiwgY29uc3QNCj4gc3RydWN0IGFt
YmFfaWQgKmlkKQ0KPiAgCXBtX3J1bnRpbWVfcHV0KCZhZGV2LT5kZXYpOw0KPiAgCWRldl9pbmZv
KCZkcnZkYXRhLT5jc2Rldi0+ZGV2LCAiQ1RJIGluaXRpYWxpemVkXG4iKTsNCj4gIAlyZXR1cm4g
MDsNCj4gLQ0KPiAtcG1fcmVsZWFzZToNCj4gLQljdGlfcG1fcmVsZWFzZShkcnZkYXRhKTsNCj4g
LQlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgYW1iYV9jc191Y2lfaWQg
dWNpX2lkX2N0aVtdID0gew0KPiANCj4gLS0NCj4gMi4zNC4xDQpSZXZpZXdlZC1ieTogTWlrZSBM
ZWFjaCA8bWlrZS5sZWFjaEBhcm0uY29tPg0K

