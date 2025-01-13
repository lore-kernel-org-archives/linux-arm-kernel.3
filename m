Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98987E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwQtLGG6+CwJTzrSpr9B3ctoEYlM4IqJYutipWDYHe8=; b=QXFuVCPaQcQzvQ7XakcEeCplXp
	N0qmQafPTGQu9yu2US9+eMOL21JlFNvusoJHTqa4j+E7Ke9feXHyYHEzqJy50vK217iRAh4foc+yY
	xl5OOIcM/naUJ8XjlA9LMlDsglTMfWp5CeOVpL8rsQLX8e466GcQpLYp4bN6pTepgtBUjGBTikTuX
	i4dGdJ6KNEABcWkMDYVWwsHx8gFlrncDSInPD8Vv+1d1TMDQM5FiC52DeqVInkxp7JusEmMbk1/iE
	0gseYzdMwQsmvgvGahgaSIh0WuweZ7PuQdYRC+iImoSW/ewoLz+nyOypFKbv2bdr7jkinV91Auomj
	I+yTx5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIKC-00000004rUl-0y14;
	Mon, 13 Jan 2025 11:09:40 +0000
Received: from mail-vi1eur03on2060a.outbound.protection.outlook.com ([2a01:111:f403:260c::60a] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIG5-00000004qfr-3iza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pquGuyMVSv1yhWzsd7Xa3ZKAoWqCxP6lxwDyAbHTAJ+2gjD0iEbT84K4+f7ngYQzxtfAHBALh6OiWX0WBL659rfnBFvZgakfi73jFeoo7217B6VbYJPWmVp5W5O8U3KcJFByrZGPWI+uzUg5lGxvtg9ZBEPZ4m3hqd5MHDuFtoaBd65c5AOg9yet9DoUVDApS+j8lsttTiEdGPY54tBMO5aMAOKMgjGBslzV79XvGykSzTUKOtje3de54UHTmgJ35Tr6B+FVqVhxlrvA1MXzIB2RCj4O8fyYfNdgJUpeoSLV1sb+aLGtGu2bnNG2DQ6P7kffz0O81sUpGo2xFhX90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwQtLGG6+CwJTzrSpr9B3ctoEYlM4IqJYutipWDYHe8=;
 b=mmnyk55CXmCqVm9nzAy80JqKbxMth2RlNg8aS09V6FKmUoIgGjTihsi6D0kR/l6Znw9lkl5B36Id3xsfRDgl3mAVYysNNfuzWtIK1ujUqQ5/QfCMMWR9IFp8y7b2QAdhhwrqeVXJ1V9mod6nXS8IFv34g8W4fGN1LzQd8wRHq37IFTH0ACHaUYDoTFoPzC+/NHEuEU7C80PXLC4HV+ShZkrhLgNvmkD+U8OXCPxLC4GbWagN47qYdi80aptQNSk8zmxvCUYWdtqfLHDwypK1jXAwnZCYDIMVmD7mBDpD+sDxy98U9OBLw6pzGF7XWj1P3DUGNi7onRIBv0hKwBYT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwQtLGG6+CwJTzrSpr9B3ctoEYlM4IqJYutipWDYHe8=;
 b=rSxXtwxDqh9XUvblo30X5SB3iiwTtUcxV6DMj8BRfxtVLdWlGSMWr1MUWCQoAV3NLQU32cXMJ7JaDi3WaJY1fPoSLOfzJScSlDKgnzlJchKdaQtnUyC7svZnlDCtWyG3OsjzuSher9fVgCxdC8LmHoBZxomj/H77QloQ5RusK1mx6GOv3/VICk6lvtDvE0tDuq4kdm11A7lz4Osf0AJ4ZmDeZx0D8gpu49KP/AQ4ra61rhytJOy0vrjvNCJyTbI7sI+2su9i8Cft+wkHPxqGPM0LO86GZhl3rtUpegHE9c93OGcGJNxYgS5cCa5nomX34MVM+I4ZThlGymyNHkHWkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:05:18 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:05:18 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 1/3] arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
Date: Mon, 13 Jan 2025 13:05:10 +0200
Message-ID: <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 28522e5e-fdbf-4b33-bfd5-08dd33c22a59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blBIeHNWSlkyTUVwQmFWakRpT2ZmU0NZQXFkWGtDSWNiTkRuNHdwcjdDdXVy?=
 =?utf-8?B?KzhXYjdGa1lZdjBValp2akRVRVU0N1Z0K1VEU3k2UEF6UnROSnB1ZGZ0M3VP?=
 =?utf-8?B?Yk0xTGg0QXM2T09CZG0rZzlybU50WUp1UkxIQVZ1Ni9LL2k0T1hNOW9taEF1?=
 =?utf-8?B?NmtueGhEVGljZGZQVjdQUFZVVUZkVVJWK2R1TElnaUprYVA1TzlXdUFMRDNU?=
 =?utf-8?B?aW1ZVmxrZEZkM3VWRnlOTVMrZnkxZzFuaVMvdy9QbGFhQ2FkSnVrRVByOWUy?=
 =?utf-8?B?STUzQzJzbEhmU2ZhdU4wS2xSSTFaZ0JSWVVSMitOYWltaWxxazk0UnBvRis5?=
 =?utf-8?B?ZHhtYU5rRWtsNmlLUFp0VHRZMkkxTWNsN0VrTWtySGxhMjFoa3NYamU2bVBY?=
 =?utf-8?B?MGJxQk1yTngza09GK2lUM3ZiblBLV2o2VXRGUHZYVEVaYU5jRm0wbzVQOGlP?=
 =?utf-8?B?akxLUHRpeVBaRG1uMzBJRHgyc1pQUSt1ZXZ6a043a3dmYjJiU2E3UmxEK2dm?=
 =?utf-8?B?SThrL3lnTDJmeWx0Vi9ISXVIcDhHb0tYdk0rVjRKdmZRMFY4S0Nwdm5td2Jw?=
 =?utf-8?B?bmkwYVAwaDV2ZC81aU8zNnMvaFZhYlhyeEdlNXRCU2tKbnJWMXRzbnpONXJX?=
 =?utf-8?B?b0o1NnQxNmdnZC9vZ2w5cVpsUStTaEhWV1ZhdkpMcEZwWUlPWVpHdytTcUR6?=
 =?utf-8?B?K3Fxb09nWXVTdUpjQytOSEQ1Q1lOSmE3bXhMMmF6T2ZDd0QvRXk1dGhrTGNh?=
 =?utf-8?B?b3NMRWlzc2U3Q2ErRnVoYnlCdm10Y1ZIaTduTitVb0g4dmR2cHR5NGdIbmNh?=
 =?utf-8?B?LzVtbGFSWWZWblpYN3NOdDJPYW5TS0ZSeHgzWlRKaHlTcUFnMjVLNEdXSkVo?=
 =?utf-8?B?VVRJNTFMWllsZWxDcXZCTzBQa2l3WjJsdHBoOFI3M2ZHamJnMFlUeG14ZzlI?=
 =?utf-8?B?N1NkVVpmT2JHTzBBZ3g4NDhrNjlkTkdxeG0zZHRtSSthQnZTVHNDMUNnWktE?=
 =?utf-8?B?TkxyaDJRQUNmcEFQeDFNc1JMeUNmOWxrSTQvN3JxWEk4WkxkY252RlhudGpm?=
 =?utf-8?B?ZGZIdHJnNmQybEJFUjY1SHBFVXZsOEIvZTh4MmRmOU5YZTErbUE0VVN6R0FD?=
 =?utf-8?B?NnFBUnU4N2NPeHJHLzFvNG12UC9FWVNZM3AwS2xmUDRQSmRCKytwRk9KbzdO?=
 =?utf-8?B?ZVY5d3VMUWkwNERZeUJJTXRoQm1scDVKeXZjakFhR1pDd05mZTVoZGNiRkZF?=
 =?utf-8?B?NFd3cy9CT1M2clM1b2w2QUgrTEs5Q2Yxb0JqTDlDZk9GQVMwN21DcWp3ajRk?=
 =?utf-8?B?MEJ4SFlUNTRSTWlSR1p6QXhhUjNKZlJJZkt5SXlURDdVZ0JNVkVwRDFGVWNN?=
 =?utf-8?B?ckh6UGNmd09PdzNlQys2YmgwNTNWeFRiRTZHR090MWZoeFZjQ2JyVWxqdk9o?=
 =?utf-8?B?Q3Q1Nis0NFp0YWRsMEJDQlY4YzBsZEJqMmhTN2pZSURNS2ZlMHAvZW9XQVUw?=
 =?utf-8?B?YnpsWXlvak5qOFlFakhVMnF6LzdrUTVTcnVmbW1DUHhCYlRpRjNpNm9VbXl2?=
 =?utf-8?B?SGFrZms1Q3N6TzkyL0xFa2V6bEF2SnJIRGlDZ0twOEsvTzQ2OTVSYktlUUtk?=
 =?utf-8?B?QjQzR2h0TjRqQTQ5ajFFcHVmbkpsOFdjQWtrV05FYmlROENnVVhUV2piN2RZ?=
 =?utf-8?B?ZEpCRTArRFZXZXU3d3V6VGFtR0pvTWdQbGk5aEZITi9xcDFmR2tWYmNHcStY?=
 =?utf-8?B?YTYvRHZCOWJZc21YNWkwOEJjSVROUHY0ZDdPRXQ1bEJOc2ZqRzMxdktTbnRW?=
 =?utf-8?B?OXdNOEZZREtNTEgvV0V2ZVorZjJ3NTJMMDE2b2o0TkhSTkprTnpTRjhaVktG?=
 =?utf-8?Q?+h9UQvbRDK2ZP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxXVk1Lbjd2UVJxMGI3RjAzWDhxaElTUnJYT01SMno1QjVaTnErWElIa0Fa?=
 =?utf-8?B?Z0ZNa29SNGtkSW1HaXpEWTZjLzZMQ1k4NW9Xb2pJaVduSkxvNldBMVZTRXhq?=
 =?utf-8?B?a0xTL1hidk5pVHRBMG0yQ1hSanY3bHhnSTV5VnczcUp6ckVqYURKTXl5Yk9O?=
 =?utf-8?B?WC8xL1BzWmFkaFZUcFpyMGdHUGdRT2FlNWZUSXMrY25ER3V2OGd5a2Znek02?=
 =?utf-8?B?dlUxeVZTRC9odWJUeHdhU1pOOExoUHV4Nk1NR1Y4R0Nta3phWFVGRXlINGV6?=
 =?utf-8?B?azc0Yzl1ZHk4SHBuaWJlanRhT29CS250amRCTFIraFVDQVJNQjJ4ekN1bTdL?=
 =?utf-8?B?YldyK3J3RThLejVsQzAxaDBJdXpyZ2VYcFBLcTFoTFpDZGhzS1ZuYUpaQkFG?=
 =?utf-8?B?TmRBRFNsMlozMTYyekorMm10dllMS1pLb3NhZkZZNFlIU1V0QmhvYW9KdURE?=
 =?utf-8?B?K052dnZpMHhIVnUyd2s3UitOeHNxb0UrbGtvbUpNVkQzUE1DeDVMUWV3Q0pZ?=
 =?utf-8?B?UWJjS0txNUM1WUZmT3kwaGpnNS9sWHN1YWdDL3BoalB3SU5CQ25Uek96ak5F?=
 =?utf-8?B?Yk01cVUwNnYzQUZKaVJYRTBNREdBdHBQRmdZZWs3YUZmc0o0Z3g2dTF6bVdF?=
 =?utf-8?B?WDdpQWpxRTd5TzRKYlZQS1BlUUU3L1V0eGlkYWJXaklvTWJidkZ5NTBkQjMz?=
 =?utf-8?B?Ym44aWZmRGpuSFpZb25WSmVLa0VvK0RzL0t5V2RUZ1pzREpydW5ldTZLVTRX?=
 =?utf-8?B?d0lOOUtpVExZT2V3SmRXYjF4RHUxUWpieWw0a3UvLzBFUnZoYnI0NTNYQ1JK?=
 =?utf-8?B?L3VFejdCeDRXV1M2aTZGcmk5WVltK3F6dHFFbXppdjZFVkFoUVovSTEzelhI?=
 =?utf-8?B?UHdnNUZsYU5DUjRxNlFLdVRzOUI4T1luM2FSM1QrZjg5WVRVcFM0OVowa3RX?=
 =?utf-8?B?VENYMjRJQmVDbGhvam9kR1FxUERYb3NOSFdMS3dPeFBEbUJma3lwRUQzTkdt?=
 =?utf-8?B?YjFSNTBYRngvQldoRU5YQUNmaGpDWm9PQk53enhPWDVEdmg3WEpCa21FeU1L?=
 =?utf-8?B?aU1GUTlORnAvdGsvZGt5Y1FtRFVUdG1wbS9aYjZ0WlhIblh2ZzdMNGhaZGQ4?=
 =?utf-8?B?M04rUUE5UmtHQS9hRURRaEtzZzlIa3JrOEhORTNZbkp4L3lxdDNJbE5MMGRH?=
 =?utf-8?B?c01tS3BEWUhFdnYvY0l4SlJWM01LNXlURjRWekpoNnlkOXVKRkNzUmdZVUxV?=
 =?utf-8?B?aXYzMW9UblhlVGVIbGFSbkpXK2twNTVseURvb2VweTUyY0JVWWxXYnRPN0ll?=
 =?utf-8?B?dmdlS09KdXFrWW9BOU9ocVVON3FLWUk2RGlESlBCaTA4VEY1bHVoQmZua3hl?=
 =?utf-8?B?OThHNTUvdkgxTzllaFZpM3ZZMkdrOGI1Z2tIMDh4WHhHNnZ2WU1TWEd1eVY2?=
 =?utf-8?B?MFVFbTZjTzNhMEkyQUlzOHlIR1N2Unl6L3YwZmo0SzFYOXVGcTV3YVkyZVZj?=
 =?utf-8?B?M1FPMlBzZEZxQmF5ZnR1TVhLaDRoVFlwQTR4bVNMNnAvQmk1bGxkN3RHR0tt?=
 =?utf-8?B?amtBa3FnZVJRbGFFKy9GWEFzbGcvbTRRd2U2YzlIanZqZkpldkVOb3UzZHEy?=
 =?utf-8?B?ZVZZNytNS293RWdROUhRY1c2a25nM2ZHTEdLdEFZZC8veXJLQldrTHF1Zkxi?=
 =?utf-8?B?TnIvNks0UVNLU3c5NXNHeWhFd3ZEcFZNaEpWdmsvL0VxMHVhdWhvblpncWQr?=
 =?utf-8?B?OGJaK1hiUlhOYWFobmV5aFM1UWN6UVczTzNodnpLY1dtSE1tdkxqNitCUFBt?=
 =?utf-8?B?TmFzUEV4bWpTVjBlWUVXZVNSd2Yzb21leGN3WWtGdnQ2STlPWXd4VG1wOXdY?=
 =?utf-8?B?LzMxZ09yR2kzRVhXaUNKRlpXQjAyb096OGowWkljTDZXY3RLUWVmbStxQW80?=
 =?utf-8?B?NUZ6ZkZiYlVHdjdNMHVlZXBNdEVNVmRUR0VpMTQzalVzbmpNSXB6REJ5S2hO?=
 =?utf-8?B?dmtJaE1lWURnUGY5cDFCNURiWU9abHJiY2xYTmdJRmJPa2dOeHdpOGtQcDRZ?=
 =?utf-8?B?TWhVcG92Z214cXBCLzhSVlN5K0xKQUo0d3NDalFHY3p2d1pYMThQNUUwWVNO?=
 =?utf-8?B?a2hLcldnRG9RV1NKT0N0S24zY3JOMTlEM2FITm5yVEhzVVN0b3JQQnByZlBC?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28522e5e-fdbf-4b33-bfd5-08dd33c22a59
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:05:18.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa8kBurFawboDk1H0eLDqC13XfGSx2CtOlYowtTuHgWj/sefQgy8//AC/MwiyNAh/x+8mgRwT0BvxfUQiehqBbO17DEluX7vtcpWCjKfg+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_030525_933050_90633823 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add I2C[0..2] for S32G2 and S32G3 SoCs.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 7be430b78c83..beae4d5cf54e 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -333,6 +333,39 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -341,6 +374,28 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6c572ffe37ca..79b38cd8b142 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -390,6 +390,42 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -398,6 +434,30 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
-- 
2.45.2


