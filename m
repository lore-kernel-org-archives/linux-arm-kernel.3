Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A18C47BDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfpzZLcNWeuNmLUlW4svXekAMqLJndI6eSDMkmxyGD8=; b=IsDFi4L7VNEQWXUFYI5TG8YBSM
	ddUoDYmZva2bxCZ3KyM3EsqT5/jMOnEn3tmABNDRf4gD8Vj3ElLTSzs6X4WLSUK2dwVK2cgx8bT5y
	7ZQgM1m9xuAfpnfGfBng1oE/xDaFI99LJUltDKHVvpViL3Q+Hayx3GACiRilwrxPWL1lgCjRNvlqT
	Ejtbbd45MWhCRPaGj6y1G8vT+PabcTF3XZe8MXv4aukxk8/inaY4wZAtVxvI1yjcDXtlCb2ZpIzlv
	0Aq/6999vuaALADQh9s8YwAvQR0zXJXT5hzhhe4Bb83xVNxACQzP7Iwd2oXiRgyFT02mYbRDVuvoS
	bbSdBfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd48M-0000000Cm6A-27IV;
	Tue, 06 Jan 2026 10:17:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd48J-0000000Cm2l-1Ueq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:17:49 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yW/CPjhTlvxy+9PIAW/bo96RVzRWNrsfiZMb8uBSOcCBwzqKy8dh3DniD2jo+t1CSr4gdnde9/qCBD4ks2jQtyvOULuux0JlDchHJ6RW3T1rV6Fvnpmw6cdIAvA7z0buCbMZrhJA6rcEKwucz7crs8cvZSkXdBCZOLHdhyGTk3DCrvh76TrPP8hxWBtRQKW7jN2Aq8h2ymMxG1paQBk6JoKNowRPkTwfYxkdJHgWt/YQL9o+5wNbAHMcRxo7g9AHrtLGGUG10+yCySBOIi+oWxoERNr92duSqeKQ9SvqGjxw2yoNKLABNck+HU9HIvV+MLlN/Z4shiPIkwNHmL4DpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfpzZLcNWeuNmLUlW4svXekAMqLJndI6eSDMkmxyGD8=;
 b=UpMIB3bPmlgM+VpQ4ddmMXceIcPjpfOjXHYx+f4Q9DGi2MO42gsIdJHMkhc/iyZLWXKuwPv5KirbfvakTKaymUxQhMFhpRy21PJl44c2hPlYPA6LrDNu8NzmcM1uySg/GKUqppCJ6n4D2bs1mDbH6fv3MM2w06ArZmJhDHHNCaMtN0QDjk2poy3HxIUQ2LmSxdw14HTrH4YlfAM7JDpB6orSRYGSaFPFNOL42P/wHGdZ5J90kwg6js1ay16it7DKlaChV59PovWadTw1VoRudN6tMd6w26nAMIFa3kvHrRLW9YYqbFJtuxiV3l6wVT72spZ6AIzkN2tV4e2UNR20pA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfpzZLcNWeuNmLUlW4svXekAMqLJndI6eSDMkmxyGD8=;
 b=G+F7WTwdKkJcxcUUceQFvlVkH75j8MwapHBwQCCZ7IZSZ0+dKP+053fsDLNKkQA0qF2RXd8FvBz/HgvXC/jvdHvQycpK8w1OncQM+R1rHNIz1rl9fhQNzODajamvP7WjPLjV3yj1qjWXhk3c96hvREerwC08PM89kp64q75rJjg=
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by DB9PR08MB9754.eurprd08.prod.outlook.com (2603:10a6:10:45d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 10:17:40 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::60) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 10:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 10:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buDWZ3OLg/lJDxj695BnR+NdhG1ZGGCNyJIlK4mQEygb49uy0YeX+OKbYL2dBWAIpnZZZmqcfYeJwRlFVZnl86L569iPhSery18PKd5j0xjghGoISl6eb1adn4fZpi5ltG3nl1/aLFgditInE6aavu9iv3uatjUcF+sLrbuNMU4EtEIGIlgGH5Ve39WvKKnaCOXFTtswDKsdPxFGi9YVgcQMSNVxjJ2McauHuz8CEhPTPpUAyXmYZE9wx7gfPSUwkLZLhI2/YreTI1qiKYAygg1XrNo1td64SI0o66ZGLxqhKIJXPvdQsTaYPx4PmZtWma2EjtVKwc3f8SS8dMCaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfpzZLcNWeuNmLUlW4svXekAMqLJndI6eSDMkmxyGD8=;
 b=gRLu2GLElrHskHSFImtlP95AtzguNToDE7sx5slqh8+8DyPVNcBU9GARSSdcRKCquTwZ4umWZZz5At6Q4JVjjSXUZ+4a6CdvG12ByG8KjrS98WyRguWA9bSi1/sGOdN/dkp7fk4HiPKNFvFI+QRUvfTpyJoD7t51kgbyIvnz2iHcEslfhhAh3omTzSE3cgLpWKWMSXLF36CtLwxi2n7beStP5HljneknbTyXsfkdQ9CMLrOIHjqFJNzNstDdasBzVtajrVglcZEwYlcoWFy+7UUE+adr3aivbJIeNJKyrpiWtgsW2Z21fq6jqK+ndlC++AMft0r//VsndMMSern1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfpzZLcNWeuNmLUlW4svXekAMqLJndI6eSDMkmxyGD8=;
 b=G+F7WTwdKkJcxcUUceQFvlVkH75j8MwapHBwQCCZ7IZSZ0+dKP+053fsDLNKkQA0qF2RXd8FvBz/HgvXC/jvdHvQycpK8w1OncQM+R1rHNIz1rl9fhQNzODajamvP7WjPLjV3yj1qjWXhk3c96hvREerwC08PM89kp64q75rJjg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:16:34 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::4a03:436b:121a:8b8d]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::4a03:436b:121a:8b8d%7]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 10:16:34 +0000
Message-ID: <7cfbcc2e-b6ca-47cf-83fe-1c61df40885b@arm.com>
Date: Tue, 6 Jan 2026 10:16:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AS2PR08MB8830:EE_|AMS0EPF000001AF:EE_|DB9PR08MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: e9046680-4ba2-4f9d-761e-08de4d0cd23a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?N0k2U2ZRNnpzRktFV2xHNWhKZW4rVmtpTlBZem5XaXg3cnFuNVdQOFhqcDdp?=
 =?utf-8?B?VVI0YUQyWTg5ZUZTODJUbVVoL0owS3RBOWRwVERmVlpUL0lsME1uL1ZvVjdI?=
 =?utf-8?B?ZUFtUlNvVzAwenFQQWNhUVZpQWNWMURKRVVKTWdmdnNBMjlZQXBaR2FUeENQ?=
 =?utf-8?B?M2F5SU9tUGFHbUVXTTNxNDlhUXNLVjFFTWlSbEV1RzZoTzFBa3ZXV0hHR3ZL?=
 =?utf-8?B?VWZpcVQ0RGlCRUVNYmlicTVncFlYSGhQaXRMTWZUSFF0djBib2NkYy9wM0dH?=
 =?utf-8?B?bmJOZjN4WkwvMzZxVE1hZklpbHZHR2llUEZaUUdvdlVtZ3cwQlpLRHVkQUNu?=
 =?utf-8?B?TVRoUXhXMXBCWnRZaUZheHZOdG9JWlhON3E5RG9SUXRETVdSeWl0aWlrVDM5?=
 =?utf-8?B?b1FEM2pBRUNhd1ZVZHdOU2ZzVnV4bmd1RExac3lwQ016N3JLa3RnelpwVUla?=
 =?utf-8?B?ZTIwMklJMmhsTWZnZ29TQmE2R1J5eHdQNGV3SkZlQlNpbUtORmlWemJnYnE2?=
 =?utf-8?B?NGhndWxMRkRNcTA5cGl6b09WZStSS1FTOXRWS3B2NTA1NVhyTHdKQXRUa29U?=
 =?utf-8?B?SkZZVjJId1M2NFhGa2I5ZFFFYnVJRXNZSkdJL3NETC8zSkxsRnZnRmNoL29k?=
 =?utf-8?B?VUtpdXZ1cW15REhVK3k3eklybFBvUVVPYTdaNUExcGNINVEyanNSK0xNYW13?=
 =?utf-8?B?dnN4Yjg3aWpzTkRMb2ZBQ01xMXVkdXJSSWRwbnV2RlpsWEJ3TXZKeWFDSjM1?=
 =?utf-8?B?bHVOenlybGNmbkxLV0thaWlQZ2UzRFU4d2pJZHlzNEZDR3JWaWRFSXVFZ0g0?=
 =?utf-8?B?cHVlVmtvT1o1R3lmQy9PaUMwYkpZLzBqb2lRZEh4dzNLNEs1RUp5bnQyUlVt?=
 =?utf-8?B?aFhEaXhQTWtJMURyYUl6WUlZeWI5VVBWZ3NFSW5BY3FNS0xUUTN3NW9scVkz?=
 =?utf-8?B?c1N2cGpnR3pkSVJuc0R1b3NNazZtTlR3ejEwT0prdXZQWmRXTmNCZDQvdlpi?=
 =?utf-8?B?T1JjZ2RMMTQ4Tm5UK2lCeklBOEdZZ29JdHh4UGt1blFhbUtrMC9UQTQ1UVA3?=
 =?utf-8?B?OStHSVJUSEI5UDJRY3RYSlhkUjhrNjdHcVZmUWZqZ2o3UHJNZUh2REsyRGVZ?=
 =?utf-8?B?bm0yN1A1bFN3NkdYZjErWGQrNFJnZldFamZKdmFGZjgzemxvaTMrSmRtNFZ1?=
 =?utf-8?B?MVQxMElHRVg2M1RzT3U0OUc4TVZyTm9ZS3dQaDNLSEhzVlpsRlNFajVFNU5X?=
 =?utf-8?B?bGRWKzVBTVBKcEE1amdHZlJIdzFkRjJqQnk2bDZidUhtNzFBc0V6RTdsbzEr?=
 =?utf-8?B?ZVpucm1ORVE5bUVIMHlFUXVBcnVUOHpYSm5GSm0xRllJdzJzNWZqSzZOVFVx?=
 =?utf-8?B?anNiY2dZL0VUajYrQWkzakVjQW5XM2hjcTdQOUg5QTBSU3dWSWxVVitqeDVT?=
 =?utf-8?B?TmZUNXBMWmIxUVFlZkNWUDVBZWF1R0NrcGZYbTI1RndqSUkydngrcUhEZEx1?=
 =?utf-8?B?R2RaVWFkNExFQTY3Q2V0U1p6RE1UOUxXYVNGMHBWbm51cHFHd2xVVFYrNzZq?=
 =?utf-8?B?YVRzVDNEMEduWHpuN0s0NHUzam5KSWRidjNCZjl4QUNXSC8yTm9hYVROanVZ?=
 =?utf-8?B?cDV6T1EyenduK3d5WmhhN2t6d082TjBtc1Z5OWZ2UnJKazhiVW9INzlzYTdm?=
 =?utf-8?B?VlJHUE8xV3RzaC8xZzlOSDNNMFJ4VDZMK2x0SWRqVUI1VHVqcjllKzJWRDE2?=
 =?utf-8?B?a1lhd1Q4TFk1YXVzK2ZTMmhad2t4MkUxaXVwWkNtc0hmNy96ZTZVKzZwVkVh?=
 =?utf-8?B?VFNQc2twUlIzN3MyTGNWVHpvSkpiZEg0bG9xQmlVWFJFald6Z2s2VWQzOGJ4?=
 =?utf-8?B?MFI3UnVlUkFJQ1ZOSlhaMWlucWhkS1dNYndDZUh4YlU0Ui80V1ZZR09GaGVP?=
 =?utf-8?Q?Vs3xWFrHjwqEDULx3uNa0VYlC5c+weC7?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3bf17cf5-2769-46bc-5dcf-08de4d0cab9d
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|7416014|376014|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05KbjkrZExTS0p5Y3c5bFRBblRva3BKbHJzeEdYZEJKNXBWNXdxbVJXTE9G?=
 =?utf-8?B?aW9VZnoyYThHWW5FR0FpRVhkMDRMRE5FVG5SYmVPaEE5ekxaank4UzV4S3Q1?=
 =?utf-8?B?RSsvMTVSWlM0cUZuT2x3aFlnZXFZOTJGdnByWWZKbmtjRW5vckd4cXR6RUpy?=
 =?utf-8?B?RW92ajczLzhFYXREbS9OUndBeDJuNGdibElETW9VU3ZRMnFMYm0zQUkzMkVL?=
 =?utf-8?B?bXpGdlB1TDQvT000aEhhc1EwL25VMmJCbFhVblg0aHU3S1VwM055Nzc4Mkp3?=
 =?utf-8?B?MlUvNE11OXVrdVY4U04wbnpXQWhIZ2xHdkJJTThJU0E0cE9UMW82UFczR1FR?=
 =?utf-8?B?alQ1elVTQmFVUnN2YlQrd1FTVmJRQk9wZkplZThrVHRxcnZIclJJWVpxOEk1?=
 =?utf-8?B?RnVNV3BVczBPUXBHRTU1NjNHQk03NFVTR2tFS2xUNmN4aFkweThqZkMvREFi?=
 =?utf-8?B?TXhVT2hnR2ZzVW9EcU9wblpobDczN2lEWlpwYmRKYTdzN2xXZEhHZkg5TDNr?=
 =?utf-8?B?Smhxd0RNV1RWb1lkZlpuREd5YUxhTmRRbHgxUWdIcWlCRXV4dU9jZlA1TXly?=
 =?utf-8?B?WnF5aU03cnIxOGtVb1lnTXliM0l6RC9KZ1I1ZkRnOU5LeU90UEUxQmRMMWRp?=
 =?utf-8?B?WWdsdld2c1B6VzhkRnhsbEFOa0V2NjBxUUthQVd0QmtiTTMyQjFOU0pvL2FT?=
 =?utf-8?B?SkVEanZhMlFndUZJY2l1d0RaOUVhU0pNNzFQeXBTV2MzTmg5WXJFL25yWEd2?=
 =?utf-8?B?YjFpOERjaHRKY2VrdTUyTHdRT05INm1EcDd6Z2tSRFh0b01QTytrOFl4TmNr?=
 =?utf-8?B?T0h4MTBockpUUGtXaHRnMGQ3SHBDcFJpd2crdVpBWGhYM3ovQWN1V3BvdjNw?=
 =?utf-8?B?azhRdEVma3c4d250eE03OGhsQzZsVnBXRk5rRmJ1ckpIcWdLMHZsUlBkNTZD?=
 =?utf-8?B?NkUvdHE1WHBTQzBGZXJLK2JPaXU1UWhxbUhXTUp5VVNDelVvWkV0Um8xQVNU?=
 =?utf-8?B?MllCUzNrL0c1NUlhWURMb2hFUTFqcks5SVI5aW5yTHoxRm1uN0xOMWxJblJQ?=
 =?utf-8?B?OGpnYVpmUVgxcy9pZEI2TEI1S2hxOUc5MlRWZHFWd3VOVllObjB3U1VjS2JJ?=
 =?utf-8?B?N2FQM002UUhldTFkQjdOK3lYOXk1YlZ0RGNXOEwwTk01bUxmVUNzTm9yVlJ1?=
 =?utf-8?B?UG0wSHRYNExDZTVaZ2xLZ0VXTFNKT3dNTURVUENXTHF6alFwTFZkeVA4NjAr?=
 =?utf-8?B?OWw3SUU3cDFMTUh0WUUrTHNyUlhyekxJZ2FSYjVOZ2lyMlNOVUpzaUk3NTNI?=
 =?utf-8?B?RU9VV3RPVksycHR6blZmSmJzdEEvY0xYS2JRWFdGMnk1VERmMVZ0SWxCejR2?=
 =?utf-8?B?bW8xT2loYWFZMk1xWmhZcVc4WmZKWVNFelBISUsxaGJIWnUwUkM5TEpYangx?=
 =?utf-8?B?SmRsNUdiWHo4RmsxcGEzUU9tNWQ0ZUhFcnltcnRaR2FZUXRIaEJzUCs4RDV0?=
 =?utf-8?B?MVNZZTBBTktGcStuMW1WalZNV3FoVW9hdkhkUzd4YWlacy9nVnMwQ3dJMTBC?=
 =?utf-8?B?dGtPamJyR3hGdDQrSXZEZ1NXWmhKcVZST0FNTUsrNDd3Y0RMOWd3YWE5Z2tW?=
 =?utf-8?B?bnFBcWVaNCtha1hOa0Zya2tPU0RlN2lWTjBQU3BzTEt2dzNmTWRHZitPTHpF?=
 =?utf-8?B?SDhhNHhIcUdDZ3JUVG5yNHpBeFFPS3pobVJmUGtWOC80VFQ3eDFNRlIvSmlr?=
 =?utf-8?B?UFptNVNsUjBaQ0YzSERSZE1ucVRmYnFzMWs2bXZKWnBkNTdOMlltUzVOS2lx?=
 =?utf-8?B?cjBDZHNUV1MzMERGVndONk9DVXF3TFhOUzhhM3hzK2ovT2k0VHdGZHEzdTZD?=
 =?utf-8?B?TWNQcDh0eWdMckUyaGZIMVBzNkZjMnJMYm5HdCtaQnJ4eTNwVEZxUVUyNUFV?=
 =?utf-8?B?WWpmV0luY2FyYnYwVnpnaFhnMi9tUHRrU1dTbExsems5WnJyRlkzSG45c0Ez?=
 =?utf-8?B?N1NGYW9kd21hZ0RDVE9ZUFQ3OXQ4dUR4czh5a0ZlRE42alFRaXR3TlZjdzR0?=
 =?utf-8?B?c3p4MCtKbjF3YktlUS9ZczEwMXFZK1UxN0krbG05Si93dGVIQUI4YlhmaDl3?=
 =?utf-8?Q?tCXM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:17:39.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9046680-4ba2-4f9d-761e-08de4d0cd23a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_021747_631669_E93CE927 
X-CRM114-Status: GOOD (  12.00  )
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

On 19/12/2025 06:59, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 010eade0a1c5..0733b3e07b45 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	6.19
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		December 2025
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index d4210869556e..5a8c6af9b719 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,


> +
> +	dev_dbg(dev, "Coresight-TGU reset complete\n");

Qualcomm-TGU ?

Suzuki

