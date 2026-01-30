Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F06D49C93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYkjuDyTTmGdchkx8D0NP2D29zVT8a6JbBZsgapT794=; b=H7F0P2O0pxj1G7jLh7sX3LR19a
	WnveCg7qeKtQe5LJE/ytxRsQu//XxtqJYhylT3f4LJMM6hiIKEM2N5/1lwJYgkoeSxks70v6tEl1G
	PoFELsFIsQXRx3XCwTJiwr44tunE3rKxdyOLKxb7MIMAhPKfzmj/F4upWPEX8RjFXMKthldkb99Mh
	d6lTkOrEOR1QUkN4yX9P4iBNj3/GK3e9T3OboMaKZ8/x/zO0DW+DAVoS1GeP+CNLZ2q+Iy7t/NeXa
	iC4vPLA5mL4kkC+0ohkMLer4xwgKXcu2xWCc9RJzKZ4Wo6eqYoyPAdKZAJDVcBOfJraOzFyTxRAUw
	sc5cjJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllJe-00000001IEa-3r8a;
	Fri, 30 Jan 2026 10:01:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllJa-00000001IDy-1yr0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:01:24 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xu9BG19PnXcjvpJIIYHA7yGBYujVNh4RznDjd3gDcntKOuPSKbBZIEVV+pLK14vMRCkVXT4yCYy1QCJ0BewDZzBUmNw0EiCJv2xinZYvyixrLX8/UA/xAiZlNwtJbWiatHuAEKjGn/ICBHjKBbg304ym+bKfYqD7uFIlK8FikhjjDD0fsGI0tKIRG5c1zY85u20N3a16M6Qj9C+11gflBnkkw06mJ4QphWMmAD2O/551F3XAtyYcPKluao3Zm8XnJSLu3X3AqZ4Kazq10crASZRQcDF1o/hPNhdKVJFbN+aBOti90KubtmrQlWh1D3SJ9qEujYgzlbM89N+oWTFDVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYkjuDyTTmGdchkx8D0NP2D29zVT8a6JbBZsgapT794=;
 b=MlDHXEdBheoZ/eGQ7h4cM55yn5K02hDhafXmrkZmKIwU2SXQyHYHirlO/W9Zg3zjozilD3swWWS6uYX9jgsvCwN7byosDwBC2aGdOENFxXAyrsAVungAKaXj3IgZYd3UYIAdcc9MipdXA+3KMc8S5XlCXFLt42VjjW3ePRknK40s7reVFuK0/8DbSijPV8BmOTT+IhKpnndeJigE7kqodTuZFqMhQW1VDQjGwPXo1ml5dY6e6WaGxXQRnYouNJXM2yaihYXhNIGJkdtMb2bHbxrvJtifUINqQWr2zHt3u7PvWCM7PtLDcfX6zyELnLhMBWljiHrx5bbGSKMGwYcDGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYkjuDyTTmGdchkx8D0NP2D29zVT8a6JbBZsgapT794=;
 b=ecBbYv6IggHpGmJBQNKLxNN/8OUt0qjL8e0BbwVCQxaXmCS06fHmD9rZtCxOpMJ+hIbUttEB5nWBQ88UwPFj8IjfGyq9DW6iJNwVdtY9TEhU4eBr7B6gVFT9gLNe/AB/xX43PHMqxoSergIuDQvyn62dg9lD6zFPxyxFYTp0Nto=
Received: from AS4P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::16)
 by PAWPR08MB9056.eurprd08.prod.outlook.com (2603:10a6:102:333::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 10:01:12 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::7c) by AS4P251CA0008.outlook.office365.com
 (2603:10a6:20b:5d2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 10:01:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 30 Jan 2026 10:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZbqe2/bdQ12CTHbFvUo4xC8IALyl3qWoHcJTOEbPyGBp3hfEwKEWCk7yJKxdQ0PeTGRfrjrJX7NykR47jaOCULYkvzh2W5EvnMlK0QpzmpYRmwQxYoPL3gY6LJXLImiz5ZsPF21BF2gLefxnDb/6wEFVjd5Z3+q4Vf00pLjJ+S520EYJEeFWnWPTd1yixn3pV3XZzlh6qPc+B+KwEkhuSFTHoPEW/jYBl5CXA33DC2pO8lP8z3z/kRcXbpK4043EVbv2CU+mT6IedRekoNANIluHrbszxWi2/QLr9FVagcv6G5pSZ1Rk8iEFB6bhVcZk+uiRW7IH4ltJ1GU7tu5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYkjuDyTTmGdchkx8D0NP2D29zVT8a6JbBZsgapT794=;
 b=XPvpXR4F9w6VN8cZS/YyQOTFrF1hMBC8k5sPsXhCcwyGj0PYydUpsoaq4jotob+HtgZnmwEQrUYkh8QtHmvzlBRv7pOwtEZvuNb/tKWI5Xl/aW95jkwHkuTT3bjFDzbbJII7aVNtjxreDhE5oCx3VbdrOIDBQHJLz8lfFoo5lrVmSaA0/M2BChTgVHO3lrx2HgNv5iXfrLkasyDA2ECR+AG/oMQENWU3ePFCY/JAEetGPuXL4IeDgXwFQO5Qcb/Sy1n6p3n3nu1S0lgO2cCoVkBcHLk/GdUkiDbn1luXcCOPgPIYlNm7ASBMOP1RxzjOU5mC/XuNg0/NwDYts8aBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYkjuDyTTmGdchkx8D0NP2D29zVT8a6JbBZsgapT794=;
 b=ecBbYv6IggHpGmJBQNKLxNN/8OUt0qjL8e0BbwVCQxaXmCS06fHmD9rZtCxOpMJ+hIbUttEB5nWBQ88UwPFj8IjfGyq9DW6iJNwVdtY9TEhU4eBr7B6gVFT9gLNe/AB/xX43PHMqxoSergIuDQvyn62dg9lD6zFPxyxFYTp0Nto=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6509.eurprd08.prod.outlook.com (2603:10a6:102:12e::6)
 by PA6PR08MB11285.eurprd08.prod.outlook.com (2603:10a6:102:513::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 10:00:08 +0000
Received: from PAXPR08MB6509.eurprd08.prod.outlook.com
 ([fe80::8270:9060:b0a4:b01c]) by PAXPR08MB6509.eurprd08.prod.outlook.com
 ([fe80::8270:9060:b0a4:b01c%5]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 10:00:08 +0000
Message-ID: <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
Date: Fri, 30 Jan 2026 09:58:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
Content-Language: en-GB
From: Debbie Horsfall <debbie.horsfall@arm.com>
In-Reply-To: <20260127132206.036892e4@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::17) To PAXPR08MB6509.eurprd08.prod.outlook.com
 (2603:10a6:102:12e::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR08MB6509:EE_|PA6PR08MB11285:EE_|AM4PEPF00027A6A:EE_|PAWPR08MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea0e8aa-a969-462a-40cb-08de5fe67f64
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aEw3MVFJa21jQmVnbjBvVERRcVBSSnNjcG40YWplckhSZHZuL0ZWV2kzQndx?=
 =?utf-8?B?MTJKTW1YdEJoOUJSWGdvZDVoMkV2ckpKTHduLzBZQTVqaW9nT2prU3Y2M1pH?=
 =?utf-8?B?aFhVNklEazFKWWs1Wm5LdHR3NFFackQ4RjdpUFRBSlV6M0xkeHN1OVd1clRt?=
 =?utf-8?B?SytUWGx0WnYyTWpaNlFMRDVENUhIckw1RFAreTNUMEgrcXExTWZoZnB4dkxh?=
 =?utf-8?B?S0pLNFB2N2Iwd0VNWXdZNytIa2d1WXlvcmtrT05FUFJFSGl2RHlVQWU4cTlB?=
 =?utf-8?B?cXZnNWhONlZzR2UvV3lFVEw2SFAxWTJtRXoyamlybWxCR0lJeVZ1czFhWXI0?=
 =?utf-8?B?SXBZTENaeTBKRXI0TFhiL2ZFdHNiQXJRVGNHQWFIOUdVSDR5SzVWS3JvVmRx?=
 =?utf-8?B?RTRZNC9BVERFZFVxMUc4RGpnUyt3NVRXWDVkUzd4NFBwT1VSL1BrTFlwcnJV?=
 =?utf-8?B?Rk5ILzAzazhTM1IzdGNpQWJMajYrSWtFcHJoU3dJdUtTYlEzcjBwbGEyNVdo?=
 =?utf-8?B?cDdNRlhkbm85S000MVpiQ3BQQUFPVEREdTQxM05sSytuK0t5N1NuUWZ3Vm81?=
 =?utf-8?B?eTVXRmw5SC83b2lUY0V3SjkxTkJFYXVCOGoyTkRQUUZ6Y2FGTTg5cVlRdXBu?=
 =?utf-8?B?a0dYUmQrTVk4WGNvdHRBdzJlZkdiZXYxbklhb25uSmJ2L2JUd1hDc0NWNEla?=
 =?utf-8?B?bXNJY0hHRUkxZEFrZTJKQkNLMVZpNVgzdWtUM2FCdlNyYU5JN295YzcrN0JI?=
 =?utf-8?B?UUZpV2xBMzJOQkFPdjFSU3UxMVIwbkR6Y290L2NnL20vK1FSN3d5UVlqNm9Z?=
 =?utf-8?B?VU1aUlJweGJwcENna2QwSnowUVV1eUtwcGQyWXdHMmlRWXdpQmxYWXRkMFNv?=
 =?utf-8?B?L3FTallEb0hCTG13TWlXL3lxR3J0bW9GY3dLcWpwTWY0MkhIOGM2aXN6dEZo?=
 =?utf-8?B?RXVEbVV1T2laNW0yTlpwL0EwMnA1M3VocDhMYjZqbVFYQkV2OWFweTc2T1BY?=
 =?utf-8?B?bFpabjVrdWdScGNCRzVJWEd2TEtldkxBMWdMY1BzcDBwa1BuL3g3bmZ3STBZ?=
 =?utf-8?B?aTEwRmxtendzVDNySVNWWG9MdVZSWEgvZmtGdElhNGhJdk5RY3IrdmV1MklO?=
 =?utf-8?B?a1JnSVA0MlhJRk1GSzFSck95WXp0SEZGbHVXbU5xR213SWhvMTlQcTlNdWdB?=
 =?utf-8?B?MGMxcU5SZDFDOVZRdktEMjVFOHR2VjVydWpEd0kxZlRrZVI1SU05dzFsOVE5?=
 =?utf-8?B?QkhNck5UZVQ2SHU0UTBrZ3dkNEQwaDNaRU1tWktJVlhFTmFERXZZUGRQTmsz?=
 =?utf-8?B?dzgybmhES2VXRjlZZzJMcHNxZ0RyNUhvT0hYWUN1cG9oL0ZjUnFOM1NBeTE5?=
 =?utf-8?B?TjFDcTFWQjE0elQrT1dWSVlybk5vaytjWERiN2g2Y3FnTDRUK3o5OTA5UmQr?=
 =?utf-8?B?U01oa3NPc1NPNExuU1hjSGMydEFsT0xVU2ExanU5L0pKK3pxRHk0eWdMYlZN?=
 =?utf-8?B?K0pTcm5vcFAzTlpsY0FlelpYQUhYUXdFaGw5WWE4U3hYLzU5QkVHZnVSNDNF?=
 =?utf-8?B?RTVnS0tucVhCMUMzNk5GR1NMVkJsUTBuWnpRYTJmeEpVSFNTWkpBcmZqYXRY?=
 =?utf-8?B?TFg1WW0rUnNpTFBBRFRLTEE5YTcyZWI5N2h4NDM3dGZjUVRHQ3l5K0NCMUpP?=
 =?utf-8?B?TGRoNkZUTUczMlloU3NzZjBaMFZsR2x3L0gwUjNWYnFjWmQwWHpzK1BVZ3lE?=
 =?utf-8?B?c0IrajF4NkJvRm1ycjlxUjdFcTI2SjZyVklrcHB0ZnR0V3FXRmxnMS9HODBm?=
 =?utf-8?B?WnBiWFpKOEZIZk9DNkRlazFkZzdkb3h4aldVRFZXSjhMUzdrZ1lVY0o5MFVP?=
 =?utf-8?B?YysyNllZMW43U0RoYTdqTUpvQiswQ1prbUR5d3JDQXcxZU9DcGJOMVNCZWFq?=
 =?utf-8?B?UEJNRHF5Zm5Lc3ZMdU5WQ200VmdhdU1tVk45WHVaSXQrWUI2eWh5bXUzUm9j?=
 =?utf-8?B?L21OOFhlWGhkNytSeWNEVk0wSDRsL1BROWk4ZEt3a28xNi9Gb3JmM2pFbkt4?=
 =?utf-8?B?TEJrd0txQnA2UEdvN0NnL2hkeEF4MWxubC80cXlIc2FsdWhmQXNDcWUrbmx0?=
 =?utf-8?Q?lxRc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6509.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11285
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 34a79a8a-b332-487c-02b9-08de5fe65962
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm5OSm1GKy94a2ZKK1pZYXdGR0I2WHVScHIzaG5lSlgwMktIWWtKS1ZxVnU3?=
 =?utf-8?B?a2tWVFpaQVlmbHZHRW9TQjZuYkNLZGt3dllrQzZhbStyaXRYWXorNHpVSkFj?=
 =?utf-8?B?RGdmRm9DR3RNY2Rqb2ZiR1lxOWNSQWRkTVVjQXBNODJ6MlhXSlpzVVhIVHZr?=
 =?utf-8?B?azZsVytZalpJSWs2WUVESW9jTDlGTlhUYk1FaXl2ZDhqR1RUSlBPZkwvSDAy?=
 =?utf-8?B?cGZ2cVI5YWZRbHAxdklEaDdhaDdOemFvMDZ3ME5JVytaZ2lrUGNYeHB0UDNw?=
 =?utf-8?B?ZkY3Ny92TTBGNjRHTGg4Wi9jdUNEcGRlbXRQU244cUpnTUh6MmhvNTZacDZt?=
 =?utf-8?B?ZDBFMHArMmJvdFY3aXZ5eFREVENmS2pYbE1HM3NUQmxLTjh1ekxNcFRDWnB4?=
 =?utf-8?B?OU5BZ3E0VTRMcUZXR3RZQ0cxQnY3UUlSb0N1WmJ2SUhIT0NrSFYrSm4zNG53?=
 =?utf-8?B?bU5mcVhtNWpHM1RIVTBpQUZ6SzJuNnpSR3RuUWN0cXUveGlZcVpweW4yNzB0?=
 =?utf-8?B?WTdCU3JGOHFaV0FFT0h1b0U3YVR3K1pCcHpOUFdGcDVoN3hPZE9GdzR4dHJ6?=
 =?utf-8?B?MFUwOUllZjVMcjB5SDRkOE1KV1doZ3RvZkEvY3c2bVBWeVpWS3hjd1FWa2gr?=
 =?utf-8?B?b0NObm1nM0U1OGpQQkJmTFlsc2FnbkpTTVQ2UE1NOGV6czF2UHlkQjF4d2JV?=
 =?utf-8?B?R2dDNElLQXdSS25nV2VmNWNEYUVnblZUcUQwQWVMTEV6ajQwTzJtcTA3R2Nl?=
 =?utf-8?B?K0JKbloxcUIwS0tOYU5UYTJUUldBRUROSkVMbWRoVjNKTjFud2ROODNHM1Z1?=
 =?utf-8?B?NVNZV0xCUThCaWdvaUdORSsrM045OGhkZnBZMXRpZ2luaU0rRU90dXJJU2l6?=
 =?utf-8?B?OVM1VE96K1JJcVU3RmFCRldvWlhvSU5JMVJKbHQxSmkrZzVtOHBOUVhKK25E?=
 =?utf-8?B?bk5tcFhMYmhHNlNxdUZBcHFvcE4vdktRWGdOajF3ckp5VHZhMzVqUDBNWW5k?=
 =?utf-8?B?NUtEWWs5MlpnQzhVYmE2UUQ5Wk9UM2pRL25peE5vekovdTBzUmxlL2VteExl?=
 =?utf-8?B?ckIvZSt3WHU4L2hJdzFobjIxUUdvNG50TUVWQzlhUkpVL3FZYXVJTGg5VDhR?=
 =?utf-8?B?MFI4OGw4M2tyUHEveGdsNTU2UWZTdGo5USt5ekhLOHhJMjcrYW44SVYzTVdC?=
 =?utf-8?B?SzRybHZWWHNMcmtRT3A2UTB3Y1R3WlhxTmR6YlFSeXU2K1NlZTA4SDRmV0sy?=
 =?utf-8?B?NEVKcGhHbkd5VXQ2Tm00K0lkd1RqS1JOM3ZlazNGRXYwMVpRdm10VHFob1dN?=
 =?utf-8?B?VWc0Wk1ydGdTNHlFR2tqa1QyL2s2bmlYd2Rhdi9ycTJGMTdqU1NodFl0RGo2?=
 =?utf-8?B?L3VsY1BSaEM0TGNFcnFPM2pZZVRXZHBvYTZ1ZzlFRC9UbUtDNTRCTlowWEo3?=
 =?utf-8?B?T0JETFFQZDFGTngxT1hFOEtUcHpOQTd1NjAzaE9iTE9sNE4vTXJEdng0VWtv?=
 =?utf-8?B?N3lCUUhydkhEbjM5UlhJblNmV1Z5dXBSRHZzekJ5azFWZmdVL1c3cERIWENV?=
 =?utf-8?B?dHk4bDQraG1rcldSSTR0SG1ta3g4dytLQU9Ud0NWbnBlTUs3VmZ3YW1QblFr?=
 =?utf-8?B?Y3dLdWxmK3hoWk81NnhrT0hrTVlURXlhQlB2ZHM1TVVQWU5IdFljV3dsbC9i?=
 =?utf-8?B?eFFiOWpDbVRseWJqS3YvTDNoYlA5TTdXbzdRT2gyWFNleTVKUHp0RzcxY1B0?=
 =?utf-8?B?VEhFQURyc24xNXV3eTRqNE9JeVc0L1laRW9iV081c3cxZU1QZ1ZYMkNuRFBv?=
 =?utf-8?B?MHYxOUphMDY0eXdpRkd6dnA5NW5Gb3BpOVRDTWQ0akNXUmVwMVBvcFg0dmgr?=
 =?utf-8?B?SWRwa01NdmpLaFk3cFZxUUMzZE80Tk93K1prcUJlODd4Y0hFZGgxUnhqenRr?=
 =?utf-8?B?d3VJN2NpeG9mekg1Z1V6TFkxWjdGU1REeXk3WDJiU3hlOFRjeHMramtkbENL?=
 =?utf-8?B?S3lrQS9EMFgzWGcxa0RWcUZUNzF1cllEWklKWVpFS25xV0cyYVlrQlAxcEFM?=
 =?utf-8?B?dWt5VGJzdS9RK1FFTzVxL25sR2ZyZ3N3aVRBbjZlbmNFK0xxN3BrMDRoYVYz?=
 =?utf-8?B?S0EwMTJtcGFHbUdJcTNKQm1Rai9NbzBBOWt1Y2Z6dGVpWnRWaVQ1dEpicG9u?=
 =?utf-8?B?WlZGV1d2dlVOWDVqVkl2NWFHYngyRGhtRC91bWFoMEs2T09UQWFlQWtJb3lC?=
 =?utf-8?B?Q3F5ZjdnVDVLNWFMVEsyQUl6Y09RPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WuIMQ2Pl07MUXcTQcRtDfI3P8Nf5SjJZHLwZDdvd/8FsRe3TGxOPOWr1KuRo1P/pxi0qsD1+la8+dg7iD9z97ddYOO3wcypehbI6oLL4zyZFQ9TGARW/RRE1Cd4NiwkGhLQcRkTIzx0tTenstW0K2cj65Hcm9xv9TpTL+ZrE1iQ0/2pPuEYOce8+JTr1QFu/us4BMsozDjjQnPXL0wPILIJUj3MKosVW+5dFCUO1gFDa5kwAkshxGy/hAgoC8n15ZWZj687P88grn3qY4W7ywVwjs80HB9Yq0OadreGmsdi/NdFWnfg1zx2pIFbBwZABv75VaKhxWqas6GHuCCtZg2xNRzKHtu6jPKeU3THXAuzjtJhMdRAqVk2CLSblzxQDGj5Xu7AXBNDEmuDwpYsO6kZZWvWsJLbPB4FPpssOOJqbOp4IpvL7Z8Ayjb6zU1n2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:01:11.6480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea0e8aa-a969-462a-40cb-08de5fe67f64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_020122_693799_FF76A2EC 
X-CRM114-Status: GOOD (  12.30  )
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

On 27/01/2026 13:22, Andre Przywara wrote:
> On Fri, 23 Jan 2026 17:37:47 +0000
> Debbie Horsfall <debbie.horsfall@arm.com> wrote:
> 
> Hi Debbie,
> 
> thanks for taking the time to send this upstream!
>

Thank you for reviewing it! I have responded to all of your points and 
will send a v2 patch set.


>> Introduce the Zena CSS Fixed Virtual Platform (FVP) dts. This is
>> currently the only Zena CSS variant, however the common definitions are
>> included in a common dtsi for extensibility.
>>
>> Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
>> ---
>>   MAINTAINERS                              |   1 +
>>   arch/arm64/boot/dts/arm/Makefile         |   1 +
>>   arch/arm64/boot/dts/arm/zena-css-fvp.dts |  55 ++
>>   arch/arm64/boot/dts/arm/zena-css.dtsi    | 826 +++++++++++++++++++++++++++++++
>>   4 files changed, 883 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 90d88137adf1..d1d2dae6a71e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3727,6 +3727,7 @@ ARM/ZENA CSS PLATFORM
>>   M:	Debbie Horsfall <debbie.horsfall@arm.com>
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/arm,zena-css.yaml
>> +F:	arch/arm64/boot/dts/arm/zena-css*
>>   
>>   ARM/ZYNQ ARCHITECTURE
>>   M:	Michal Simek <michal.simek@amd.com>
>> diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
>> index f30ee045dc95..770fb145b4a9 100644
>> --- a/arch/arm64/boot/dts/arm/Makefile
>> +++ b/arch/arm64/boot/dts/arm/Makefile
>> @@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
>>   dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
>>   dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
>>   dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb morello-fvp.dtb
>> +dtb-$(CONFIG_ARCH_VEXPRESS) += zena-css-fvp.dtb
>> diff --git a/arch/arm64/boot/dts/arm/zena-css-fvp.dts b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
>> new file mode 100644
>> index 000000000000..d3c649e894d1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Copyright (c) 2025, Arm Limited. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "zena-css.dtsi"
>> +
>> +/ {
>> +	model = "Zena CSS Fixed Virtual Platform";
>> +	compatible = "arm,zena-css-fvp", "arm,zena-css";
>> +
>> +	chosen {
>> +		stdout-path = &soc_serial0;
>> +	};
>> +};
>> +
>> +&soc {
>> +	virtio@30060000 {
>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30060000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	virtio@30020000 {
> 
> I think the nodes should be ordered by their address. Do you make any
> assumptions about naming of devices (/dev/vda, /dev/vdb) in your setup?
> 

I will move virtio@30060000 into order. I don't think there are any 
assumptions on device naming dependent on ordering but I will run all of 
our tests with them in address order to check.

>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30020000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	virtio@30030000 {
>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30030000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	virtio@30040000 {
>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30040000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	virtio@30050000 {
>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30050000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
> 
> Do you know if there is something at 0x30070000? Maybe something that
> needs explicit enablement on the model command line? In this case we might
> want a comment here.
> 

The memory map documentation says there is no device there.

>> +	virtio@30080000 {
>> +		compatible = "virtio,mmio";
>> +		reg = <0x0 0x30080000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/arm/zena-css.dtsi b/arch/arm64/boot/dts/arm/zena-css.dtsi
>> new file mode 100644
>> index 000000000000..7825e93df0a6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/arm/zena-css.dtsi
>> @@ -0,0 +1,826 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Copyright (c) 2025, Arm Limited. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +	interrupt-parent = <&gic>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		/*
>> +		 * The latency and residency numbers below are for illustrative
>> +		 * purpose only and may vary on actual silicon. These values are
>> +		 * considered just to demonstrate that the cpuidle governor
>> +		 * logic works.
>> +		 */
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			CPU_SLEEP: cpu-sleep {
>> +				compatible = "arm,idle-state";
>> +				arm,psci-suspend-param = <0x0010000>;
>> +				local-timer-stop;
>> +				entry-latency-us = <800>;
>> +				exit-latency-us = <3200>;
>> +				min-residency-us = <4200>;
>> +			};
>> +			CLUSTER_SLEEP: cluster-sleep {
>> +				compatible = "arm,idle-state";
>> +				arm,psci-suspend-param = <0x1010000>;
>> +				local-timer-stop;
>> +				entry-latency-us = <1000>;
>> +				exit-latency-us = <3200>;
>> +				min-residency-us = <4500>;
>> +			};
>> +		};
>> +
>> +		cpu-map {
>> +
>> +			cluster0 {
>> +
>> +				core0 {
>> +					cpu = <&CPU0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&CPU1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&CPU2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&CPU3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +
>> +				core0 {
>> +					cpu = <&CPU4>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&CPU5>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&CPU6>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&CPU7>;
>> +				};
>> +			};
>> +
>> +			cluster2 {
>> +
>> +				core0 {
>> +					cpu = <&CPU8>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&CPU9>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&CPU10>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&CPU11>;
>> +				};
>> +			};
>> +
>> +			cluster3 {
>> +
>> +				core0 {
>> +					cpu = <&CPU12>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&CPU13>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&CPU14>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&CPU15>;
>> +				};
>> +			};
>> +		};
>> +
>> +		CPU0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a720ae";
>> +			reg = <0x00 0x00>;
>> +			enable-method = "psci";
>> +			i-cache-size = <0x10000>;
>> +			i-cache-line-size = <0x40>;
>> +			i-cache-sets = <0x100>;
> 
> So for those numbers that are meaningful in decimal (64 bytes cache line,
> 256 sets), I think it's better to express them in decimal directly.
> For the small size here you could do it as well, though for the bigger
> sizes (L2 and L3 below) it's probably better left in hex.
> 

Will do.

>> +			d-cache-size = <0x10000>;
>> +			d-cache-line-size = <0x40>;
>> +			d-cache-sets = <0x100>;
>> +			clocks = <&scmi_dvfs 0x00>;
>> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>> +			next-level-cache = <&CL0_L2_0>;
>> +
>> +			CL0_L2_0: l2-cache {
>> +				compatible = "cache";
>> +				cache-unified;
>> +				cache-level = <0x02>;
> 
> Same here, cache-level should be just <2>.
> 

Will do.

>> +				/* 512KB */
>> +				cache-size = <0x80000>;
> 
> Please add the comment right behind the number, that disrupts the flow
> less, I feel.
> 

Will do

>> +				/* 64B */
>> +				cache-line-size = <0x40>;
> 
> ... and as above, just write <64>, also allows you to lose the comment.
> 

Will do.

>> +				/* 8-way set */
>> +				cache-sets = <0x400>;
>> +				next-level-cache = <&CL0_L3>;
>> +			};
>> +		};
>> +
>> +		CPU1: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a720ae";
>> +			reg = <0x00 0x100>;
> 
> for the records: I verified that the other CPU nodes are the same, except
> for their obvious differences in cache numbers and MPIDRs.
> 
> <snip>
> 

Thank you.

>> +
>> +		CL0_L3: l3-cache0 {
>> +			compatible = "cache";
>> +			cache-unified;
>> +			cache-level = <0x03>;
>> +			/* 4MB */
>> +			cache-size = <0x400000>;
>> +			/* 64B */
>> +			cache-line-size = <0x40>;
>> +			/* 16-way set */
>> +			cache-sets = <0x1000>;
>> +		};
>> +
>> +		CL1_L3: l3-cache1 {
>> +			compatible = "cache";
>> +			cache-unified;
>> +			cache-level = <0x03>;
>> +			/* 4MB */
>> +			cache-size = <0x400000>;
>> +			/* 64B */
>> +			cache-line-size = <0x40>;
>> +			/* 16-way set */
>> +			cache-sets = <0x1000>;
>> +		};
>> +
>> +		CL2_L3: l3-cache2 {
>> +			compatible = "cache";
>> +			cache-unified;
>> +			cache-level = <0x03>;
>> +			/* 4MB */
>> +			cache-size = <0x400000>;
>> +			/* 64B */
>> +			cache-line-size = <0x40>;
>> +			/* 16-way set */
>> +			cache-sets = <0x1000>;
>> +		};
>> +
>> +		CL3_L3: l3-cache3 {
>> +			compatible = "cache";
>> +			cache-unified;
>> +			cache-level = <0x03>;
>> +			/* 4MB */
>> +			cache-size = <0x400000>;
>> +			/* 64B */
>> +			cache-line-size = <0x40>;
>> +			/* 16-way set */
>> +			cache-sets = <0x1000>;
>> +		};
>> +	};
>> +
>> +	dsu-pmu-0 {
>> +		compatible = "arm,dsu-pmu";
>> +		cpus = <&CPU0 &CPU1 &CPU2 &CPU3>;
>> +		interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> 
> Shouldn't that IRQ number be 184? According to the (internal) IRQ
> map document this lists 216 as the GIC interrupt ID, but the SPI ID would
> then need to be 32 less, so 184 (the column next to it in the spreadsheet).
> Same for the other DSU PMUs, but the other SPIs seem to be correct (timer,
> UART, ...).
> 

Thank you for noticing this - it is an issue but wasn't picked up by our 
tests. I will change them.

>> +	};
>> +
>> +	dsu-pmu-1 {
>> +		compatible = "arm,dsu-pmu";
>> +		cpus = <&CPU4 &CPU5 &CPU6 &CPU7>;
>> +		interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
>> +	};
>> +
>> +	dsu-pmu-2 {
>> +		compatible = "arm,dsu-pmu";
>> +		cpus = <&CPU8 &CPU9 &CPU10 &CPU11>;
>> +		interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
>> +	};
>> +
>> +	dsu-pmu-3 {
>> +		compatible = "arm,dsu-pmu";
>> +		cpus = <&CPU12 &CPU13 &CPU14 &CPU15>;
>> +		interrupts = <GIC_SPI 219 IRQ_TYPE_EDGE_RISING>;
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +
>> +		/* Bank 0: start = 0x0000_0000_8000_0000, size = ~2 GiB (0x7F00_0000) */
> 
> That comment is somewhat redundant, as it mirrors the line below.
> If we need a comment, I'd suggest something like: ~2GB mapped at 2GB,
> another 2GB at 2TB.
> 

Thanks, I will take the new comment suggestion.

>> +		reg = <
>> +			0x00000000  0x80000000  0x00000000  0x7F000000
>> +			0x00000200  0x00000000  0x00000000  0x80000000
>> +		>;
>> +	};
>> +
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>> +			<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>> +			<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>> +			<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
>> +			<GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +
>> +	soc_clk24mhz: clock-24000000 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "refclk24mhz";
>> +	};
>> +
>> +	soc: soc {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		timer@1a810000 {
>> +			compatible = "arm,armv7-timer-mem";
>> +			reg = <0x0 0x1a810000 0 0x10000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			/* Map child space [0x0..0x30000) to parent @ 0x1a810000 */
>> +			ranges = <0x0 0x0 0x1a810000 0x00030000>;
>> +
>> +			frame@20000 {
>> +				frame-number = <0>;
>> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0x20000 0x10000>;
>> +			};
>> +		};
>> +
>> +		gic: interrupt-controller@20800000 {
>> +			compatible = "arm,gic-v3";
>> +			#redistributor-regions = <16>;
>> +			reg = <0x0 0x20800000 0x0 0x10000>,    /* GICD */
>> +				<0x0 0x20880000 0x0 0x40000>,    /* 16 * GICR */
>> +				<0x0 0x208c0000 0x0 0x40000>,
> 
> Those look as if they are all contiguous, aren't they?
> Then you wouldn't need the #redistributor-regions property above, and can
> just go with one big GICR region.
> 

This is a workaround for the AP GIC Multiview. Is it acceptable?

>> +				<0x0 0x20900000 0x0 0x40000>,
>> +				<0x0 0x20940000 0x0 0x40000>,
>> +				<0x0 0x20980000 0x0 0x40000>,
>> +				<0x0 0x209c0000 0x0 0x40000>,
>> +				<0x0 0x20a00000 0x0 0x40000>,
>> +				<0x0 0x20a40000 0x0 0x40000>,
>> +				<0x0 0x20a80000 0x0 0x40000>,
>> +				<0x0 0x20ac0000 0x0 0x40000>,
>> +				<0x0 0x20b00000 0x0 0x40000>,
>> +				<0x0 0x20b40000 0x0 0x40000>,
>> +				<0x0 0x20b80000 0x0 0x40000>,
>> +				<0x0 0x20bc0000 0x0 0x40000>,
>> +				<0x0 0x20c00000 0x0 0x40000>,
>> +				<0x0 0x20c40000 0x0 0x40000>;
>> +			#interrupt-cells = <3>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			interrupt-controller;
>> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			its1: msi-controller@20840000 {
> 
> Are there multiple ITSes, and some are just not shown here?
> If not, please just use "its" as the label name.
> 

There's only one so I'll rename it.

>> +				compatible = "arm,gic-v3-its";
>> +				reg = <0x0 0x20840000 0x0 0x40000>;
>> +				msi-controller;
>> +				#msi-cells = <1>;
>> +			};
>> +		};
>> +
>> +		/* UART is fixed as 24MHz, both UARTCLK and PCLK */
>> +		soc_serial0: serial@1a400000 {
>> +			compatible = "arm,pl011", "arm,primecell";
>> +			reg = <0x0 0x1a400000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&soc_clk24mhz>, <&soc_clk24mhz>;
>> +			clock-names = "uartclk", "apb_pclk";
>> +		};
>> +
>> +		watchdog@1a420000 {
>> +			compatible = "arm,sbsa-gwdt";
>> +			reg = <0x0 0x1a420000 0x0 0x10000>,
>> +			      <0x0 0x1a430000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		rtc@300d0000 {
>> +			compatible = "arm,pl031", "arm,primecell";
>> +			reg = <0x0 0x300d0000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> 
> Can you please double check this interrupt ID? The IRQ mapping document
> just lists some "expansion range" here, but I cannot verify if this is
> using the SPI offset of 32 or not.
> 

I have confirmed with our interrupt map.

>> +			clocks = <&soc_clk24mhz>;
>> +			clock-names = "apb_pclk";
>> +		};
>> +
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
> 
> You don't need compatibility to the pre 0.2 PSCI standard, so drop the
> last compatible name.
> 

I will remove this.

>> +		method = "smc";
>> +		cpu_suspend = <0xc4000001>;
>> +		cpu_off = <0x84000002>;
>> +		cpu_on = <0xc4000003>;
> 
> And those three function IDs are only needed for this pre-0.2 name, so you
> can remove them.
> 

I will remove them.

>> +	};
>> +
>> +	sram: sram@104000 {
>> +		compatible = "mmio-sram";
>> +		reg = <0x0 0x104000 0x0 0x00001000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0x0 0x104000 0x00001000>;
>> +
>> +		scmi_shmem_tx: scpshmem-sram-section@0 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0x0 0x100>;
>> +		};
>> +		scmi_shmem_rx: scpshmem-sram-section@100 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0x100 0x100>;
>> +		};
>> +	};
>> +
>> +	mbox_db_tx: mailbox@40020000 {
>> +		compatible = "arm,mhuv3";
>> +		reg = <0x0 0x40020000 0x0 0x30000>;
>> +		clocks = <&soc_clk24mhz>;
>> +		#mbox-cells = <3>;
>> +		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "combined";
>> +	};
>> +
>> +	mbox_db_rx: mailbox@40060000 {
>> +		compatible = "arm,mhuv3";
>> +		reg = <0x0 0x40060000 0x0 0x30000>;
>> +		clocks = <&soc_clk24mhz>;
>> +		#mbox-cells = <3>;
>> +		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "combined";
>> +	};
>> +
>> +	firmware {
>> +		scmi {
>> +			compatible = "arm,scmi";
>> +			mbox-names = "tx", "rx";
>> +			mboxes = <&mbox_db_tx 0 0 0 &mbox_db_rx 0 0 0 &mbox_db_rx 0 0 2>;
> 
> What is this third mailbox about? I think this would have to match
> mbox-names also? I guess this is not needed?
> 

The team is confirming which mbox names are appropriate. To pass the 
Devicetree validation the only valid combination of three is: "tx", 
"tx_reply", "rx". However, the second mbox needs to be rx else the SCMI 
communication fails. I'll investigate further and make sure the names match.

> Cheers,
> Andre
> 
>> +			shmem = <&scmi_shmem_tx &scmi_shmem_rx>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			scmi_dvfs: protocol@13 {
>> +				reg = <0x13>;
>> +				#clock-cells = <1>;
>> +			};
>> +		};
>> +	};
>> +};
>>
> 


-- 

Kind regards,
Debbie

