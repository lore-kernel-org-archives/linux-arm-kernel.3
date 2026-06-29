Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7157C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBqf39JRPNeVBGWu5OR4vsS5PpgPjOOmO/gqCv+MoRw=; b=ZX23YetLO4E0CgInm+qfqVR9N3
	n9R+pELbzBZ6RRZw02FKn7BRmv2K8lO2XkYFSYRa6H2F9HM1KhmUDq9KcSZCf5C+WbJ9LRnSFzdSH
	zHczGUEvF3jvn3DqA9oIewODpsPO8/29yvhwp/1mgphKQ9Yfg7TGj5/9+1Rbu6i2yATd3qu56uRLX
	At9xTx5CFobKoyO5Zli7h7KvMYPjdCtBvFgu4TgRJ/bkCVI1rKoREAmBHYsrpQI3zQsu8UAUEhEXQ
	FgqK2WdGdWTvwCYiAjCWFdWiB03S3rLrSMLnIsghEuasCFHEQmY3l+9Jf6MxZdOxZk9s8AA3v3G31
	IMKlfwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCUB-0000000EoCC-3LVQ;
	Mon, 29 Jun 2026 13:57:19 +0000
Received: from mail-swedencentralazon11023087.outbound.protection.outlook.com ([52.101.83.87] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCU9-0000000Eo7Z-1Uup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/N0dboGXWc++yl8gsZ/Uv+SVt2Wfw8K/j8/+S1OVPXcHGUBvRkz44oR+qTB1Jf0IkqyaL9qZxyKqpAxPNr5aamS/lNr3q7lD8R839goSd4maxEkemOKU7mfywbsEwyguhGWYr/NFSR1ssHPLnKiWzlZs5puD4CvGzKPnduuykko++THaz55Iem6e2REe+JaIZqVEQgPmsL0ZZZKcEpqTwzYuqNm5xlzJjHrXXesQH21btESVKLb+6OSfrBBWU+piNlrcoQSqG9ox464zuOWIrDz55Cy+beik1TKoNq+GEANJOzEkr1MdUnVZfCHgibFbglA9tA1Al1hTbdVys0gRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBqf39JRPNeVBGWu5OR4vsS5PpgPjOOmO/gqCv+MoRw=;
 b=JTZHlXXZp8qbL6+F3kgZRGnw3zWOrdSeX4rZqxbtkKSGQUV+JrTr6KIqQ2fjyJoDWZz1U1R+U5LrqufHpTIsxzYo1dZVgMLWChjl/y5XyH2+s9a1C9ltoU7DbiwKuCai9AOHGQOsAxWFAw0N9FnQU4NnTH5cn7V+t/kbvZHyJhhwMSHz++S/lUSIaa24YW7Ef/p7M9eH+jX5+t/8gu4R0ck+Gyc6mOLiqpUA1Kne0zrTUtANlhjbckYBcfMUPmUbUrbrxhRn6upP4SxqTOYwpcOiDsvt7njKiB9jOeTmibED5U/dZbGybjDY+dFUbrNRwT4NjPFf3CiLDyqG3YohzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBqf39JRPNeVBGWu5OR4vsS5PpgPjOOmO/gqCv+MoRw=;
 b=KqtQ8UQqYuXJd8K8/nj+dS0dcIISqlzF2pRo2VdFGH3QLbosW85VbIYckhH/zGWTWyG/dRMc9xmfVevMBlarx53hC1AI5hM3Wc5Ahp4On2MDKSEbnK9Tlyw7HAC7C53RNd8Bv2x2UTezmrVwIujrUNnO4CImbBp2nFbNR/KvXqmuX3u4bXLUVuFfPGKlZBSIvdtkEAq3MZb7j20oBxrkPHjjQ/nu9wVMFIElACQ5+3cMGX6h01wh+Evn+6UuErKaV8e4+ZNO9x0Yz6GzIYDE6Q0oYXlQkeesVY03CnpcEsEBj5EdPNhTIt/Bf+KSs3Sv9C1IreUAnskykX+Mdevg4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DU0P195MB2326.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:57:07 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:57:07 +0000
Message-ID: <9ce272c0-5e1d-4e4f-9a35-ed93251954a3@phytec.de>
Date: Mon, 29 Jun 2026 16:57:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] Re: [PATCH 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM67x
To: Andrew Davis <afd@ti.com>, Nathan Morrisson <nmorrisson@phytec.com>,
 nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
 <20260625160214.4001298-2-nmorrisson@phytec.com>
 <0aaf11b7-6043-4140-ac15-7c62f367c218@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <0aaf11b7-6043-4140-ac15-7c62f367c218@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::22) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DU0P195MB2326:EE_
X-MS-Office365-Filtering-Correlation-Id: 182b9a80-df25-4fdb-f3fd-08ded5e64ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|4022899009|23010399003|376014|7416014|3023799007|4143699003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DrtVGpzslnxV6jDnIiRa2+v75iqFkA5q51ys8BqoGXPfEvF7vnPSDbdw9xzYDnm+9Pm/O4uh+JL5t6WiXrNovguKWnV6T6t5zydbOmFQ21tCeb178m4JkjGf5syZP1cumzqZbOCbbuwE/i+Rs8G/AGgln+m5T1ZRRdBSUKA7gqOaIGeJiyot+Chzr/yyh5xmQQUjJ5do220o8lJBg68sA9xHiPgmqqhsXv6BTf8wHfBj7P3Sjc3K6QtGfqlMBwpvJU0UtoQTDe/OkG4gYo6sbwAxc8BFjRnzaCgpiXOPL0iqthAkOL+EDzwyODQ0HEoST7lJUN5ed7zl2mhusymqul6C/b+NmCWoU1NDGh4spQIyiU6XUbQuZKw4m+/yRedKO6DiaYQBZYOaZ220rCnxI1IUjc+WMtAkz4VPZAd1QfM5vNjArwAqKdekaRujXkSyjuffISwdPkrMMeTGYX8Vl3mPgTBCRvwVGnR0MY7KEvbpdW2ozcwMCX/4AzFBSdqftsHjd4tuEMPjtHeBKkE0P9/NInmq3BDY0jr4B+9soAaMwxmM85jbe0LE6JceboA3WOMOG8vx1x8qUT+10J2hzc0tJ59dg16kbnCv4rdXZQ3shbJPi0S6/VQv6g8QQPZhengGLmvy7vrSSW07/sZZmiykxwarcKwYdEjexUYWLQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(4022899009)(23010399003)(376014)(7416014)(3023799007)(4143699003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVcyQmNPV0FNU3Z2OHE0eGxsK25Bd1NDakZ5NlVtQVJwZVFnM3BhN0lQdHZO?=
 =?utf-8?B?Ym14OVJ5cHVkQWNYRUdnQWNkclQrV1F0d2V0dDNaL3QyQ092WHA4WlNuRTdw?=
 =?utf-8?B?MytHdU9UOWo2UXUwT2FXc1NEcXBsbllYM2gyaC96R00zSy8wQ0t2eVk4Zm1Z?=
 =?utf-8?B?TnRMck5qT1pNazFONU85YnE4cXRnbURZSzh5cmd1VzlxUzcyUk00ZDMvdkhM?=
 =?utf-8?B?c001TndzYnEwR29ydmJISWxsdm85ZmZnYnBDbCtNalg4REsrdkwvSkhFb01V?=
 =?utf-8?B?TGQwUTYyNGNCeVlaK29JVnArQlRTbkZlMHU4Yzl0N3lHWkdBZGhTNjl6WGtZ?=
 =?utf-8?B?c1FNYzJ3UmVsdjBNTDZ5dVozQXdvLzZoZUdyTGxDK1krZkdpQVNwSTkwNGhs?=
 =?utf-8?B?c25UckhXSk9VNEhobkdnR2hOdEpxUlQyMzZncFRjYXdtZWdYdk91RkEwSldM?=
 =?utf-8?B?STRyd1hrcmNTVFJMRlVWOGZSZ05BOXRaVlVmQ0k0VmplbUpmaVZmUVk0M1VU?=
 =?utf-8?B?a2F2SEdmNUFqVUJoRjk4alhuRGJ6cHBwMlNMV3VxUlk3U3h1Mjh3c3lMNUt1?=
 =?utf-8?B?WW5PMWV5RFZyRm1keDUycUh0cFphRG9SdS83a1VhbUpoVHRvRHFpTXhCTHJQ?=
 =?utf-8?B?N3g2dVRUb0FTU1FQem1xdjJxWEFvVWIzeDJ1dmNHRnhLYWVhcmZtVVp2QXBC?=
 =?utf-8?B?UnE3YXMvSTFCc0RRaTZ1MW5ZNTBnUzZZNXNoejJhK2ptQzM3YmR5YWNrb1ZB?=
 =?utf-8?B?SWpGZjEzRms4R0FhTDRVQ21Xdms2OEYrZkNVeXZ2dGtRaU8wTXA3UlI1ZzlU?=
 =?utf-8?B?UWJwUzNpdzBMUnVydXdOQWpodkM2eVR2a21TaHJHUndkQk9rQU5rV1ZnVnlW?=
 =?utf-8?B?RGFjWW1nSU1Jd1pWcGR0S3U3aExXZHdQV01PNVRVcU9hUHo5S1FQb3hNV283?=
 =?utf-8?B?eGdGd2VkL3hYc09qbVJrbTJzcHpXQVY1RU44RnViRXlEVVFQY3NORXozR1hF?=
 =?utf-8?B?a2FLczk4RlZCK05kMkloTVdONTUzQldyejY2Wk9NTDFSamFueThucCt6b29W?=
 =?utf-8?B?ZFUxN25Ec0lOT1FiMzl3cFd3eGhac3Y4cURJSUx2a0NlUnpibHgxY2RpNWZG?=
 =?utf-8?B?R1Q3WkZkMDNhbWRJU2FaMllwTEQvWGU4VEV0R24wZms1RGpud3lER1o5Mi9O?=
 =?utf-8?B?R0dsZ1JGZXJOV1kxOGVGYWtZWTdZL3NXcmV3eVZiZllrNWJLMk9BbjFKQ2Fk?=
 =?utf-8?B?SWZNbzNTTWVjcFgwUklpNUZZbzAvdTVScDNHQnh3ZWtuR1dKblVOcG8xM0pG?=
 =?utf-8?B?MlV5ejJ1KzBZY3ZpaFVyRllINDFtaFcwVldYMmVmOVFOMWptVHdUdEJad2Vu?=
 =?utf-8?B?YXgzNTdEWTY0MGt0ZEpKMVJobnRXWEZNdUVPSG1sN05CRmMrMHdBWkpSQ3BZ?=
 =?utf-8?B?SUZNN2pVVnNzQmNLYllWcUJiZE1Ha1kxT0JIOXkrdjE1VW82UitrRlFieHBj?=
 =?utf-8?B?OXZOc0pHWDUyN3VCVzRrME96MnFuZVMwRFpxQXRCWEgyaGVFRlRZMnVDeFlh?=
 =?utf-8?B?T2FXTW9GdnRCTEVOcXFUVHhUTGMxYU1IbHk0Z1NYNDNLYndQK1ZXM2JXVWQ2?=
 =?utf-8?B?eE43bTl2SDlTTGQ5Y0pCMW51QXl6Z3hRN1hJL3ZTT1pQV1h2em56M0NaMVBH?=
 =?utf-8?B?QjZsYTFEem1acnh0QTlrU2VYbkIrRnIwSmlvSnVWWkg5RkM3TTYyTWpVUDRW?=
 =?utf-8?B?ZzA5aWphcnJGT2hRT3NmRkp5ZytyY0lIL254S3UzdkpLVVFQRU1vQmNKbmZM?=
 =?utf-8?B?VzRSM1h1VGQrcFo2dTN0TGxGeWNlWVZUNHdyb21jc2VJeHBhczF4WEVXM0h6?=
 =?utf-8?B?OTBabEhMeHZpakdRVDJ1QldqQXBkNjRzdE9EL1YrRUN3Nlk0Z1RybEdsWHh3?=
 =?utf-8?B?SmlPQ3BIYzdaRExmQUhnMzhDQ2V5SDVLTTRSS1FjT2Fjb2dRZDFFZHdTVEJh?=
 =?utf-8?B?TjI2ZlE1M1g2SGU5a3RWL2hFWTNTcC9ZcnJ1MjIyeUZKdkRvZ1hOYlZBVkhP?=
 =?utf-8?B?RG1zTnlMZ3Q0dG9ZZnF1bjhUUnhwTk5ZSmZhT0NpVW5aS2NxQzBVVE1vbkJE?=
 =?utf-8?B?SVRwMktrU3NYbm1scXFCTjlPYXlHNWo5bno2ZkhLd2xLaDZiV1d3eGtTQ21V?=
 =?utf-8?B?U2dSQStXbEV4QkRRcHhzM3Z4dHlDM2NlMUFPVGdnTDhKNDRsRENqSElZYSt3?=
 =?utf-8?B?UHBQY0dzSzNZQ2grekJtVmNBNlAzcmI3b3RDZDFBa1BzbjI4S1E3VTdwaWlo?=
 =?utf-8?B?QVhRU2hEVHA1dDBpbXMwcGtCUDJTQjB6L3JYUHMvVTlEck9xb3YxenZSWlk1?=
 =?utf-8?Q?CHNXQSr0LTfoo6u84rgUw1Iv1Aj4mmYGD2tsNnc3QV203?=
X-MS-Exchange-AntiSpam-MessageData-1: FvkDyfOEEx9gIQ==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 182b9a80-df25-4fdb-f3fd-08ded5e64ed1
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:57:07.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcFqM1WSoaxG9Q+FNPeDOk+vwKtecOmuzd8h6QUeBO4kfTqm4Ip+f/+w4ZxiYpg0qK8aePw/RUOxwhBlY3giWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065717_737168_A37CFECF 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Andrew,

On 6/25/26 11:37 PM, Andrew Davis wrote:
> On 6/25/26 11:02 AM, Nathan Morrisson wrote:
>> Add support for the PHYTEC phyCORE-AM67x SoM [1] and the
>> corresponding phyBOARD-Rigel carrier board [2]. The phyCORE-AM67x SoM
>> uses the TI AM67x SoC and can come with different sizes and models of
>> DDR, eMMC, and SPI NOR Flash.
>>
>> Supported features:
>>    * Audio playback and recording
>>    * CAN
>>    * Debug UART
>>    * eMMC
>>    * Ethernet
>>    * GPIO buttons
>>    * Heartbeat LED
>>    * I2C Current sensor
>>    * I2C EEPROM
>>    * I2C Light sensor
>>    * I2C RTC
>>    * Micro SD card
>>    * PCIe
>>    * SPI NOR flash
>>    * USB
>>
>> [1] https://www.phytec.com/product/phycore-am67x/
>> [2] https://www.phytec.com/product/phyboard-am67x-development-kit/
>>
>> Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>>   .../boot/dts/ti/k3-am67-phycore-som.dtsi      | 328 ++++++++++++
>>   .../boot/dts/ti/k3-am6754-phyboard-rigel.dts  | 502 ++++++++++++++++++
>>   3 files changed, 831 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index 371f9a043fe5..623ee2369132 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
>>     # Boards with J722s SoC
>> +dtb-$(CONFIG_ARCH_K3) += k3-am6754-phyboard-rigel.dtb
>>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>> diff --git a/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
>> new file mode 100644
>> index 000000000000..8a40f648098e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
>> @@ -0,0 +1,328 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Copyright (C) 2026 PHYTEC America LLC
>> + * Author: Nathan Morrisson <nmorrisson@phytec.com>
>> + */
>> +
>> +#include <dt-bindings/net/ti-dp83867.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +/ {
>> +    compatible = "phytec,am67-phycore-som", "ti,j722s";
>> +    model = "PHYTEC phyCORE-AM67";
>> +
>> +    aliases {
>> +        ethernet0 = &cpsw_port1;
>> +        gpio0 = &main_gpio0;
>> +        mmc0 = &sdhci0;
>> +        rtc0 = &i2c_som_rtc;
>> +        rtc1 = &wkup_rtc0;
>> +        spi0 = &ospi0;
>> +    };
>> +
>> +    memory@80000000 {
>> +        /* 4G RAM */
>> +        reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
>> +              <0x00000008 0x80000000 0x00000000 0x80000000>;
>> +        device_type = "memory";
>> +        bootph-all;
>> +    };
>> +
>> +    reserved_memory: reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        secure_tfa_ddr: tfa@9e780000 {
>> +            reg = <0x00 0x9e780000 0x00 0x80000>;
>> +            no-map;
>> +        };
>> +
>> +        secure_ddr: optee@9e800000 {
>> +            reg = <0x00 0x9e800000 0x00 0x01800000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0xa0000000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: memory@a0100000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0xa0100000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +    };
>> +
>> +    vcc_5v0_som: regulator-vcc-5v0-som {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_5V0_SOM";
>> +        regulator-min-microvolt = <5000000>;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    leds {
>> +        compatible = "gpio-leds";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&leds_pins_default>;
>> +
>> +        led-0 {
>> +            color = <LED_COLOR_ID_GREEN>;
>> +            gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
>> +            linux,default-trigger = "heartbeat";
>> +            function = LED_FUNCTION_HEARTBEAT;
>> +        };
>> +    };
>> +};
>> +
>> +&main_pmx0 {
>> +    leds_pins_default: leds-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x034, PIN_OUTPUT, 7)    /* (K22) OSPI0_CSN2.GPIO0_13 */
>> +        >;
>> +    };
>> +
>> +    mdio_pins_default: mdio-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0160, PIN_OUTPUT, 0)    /* (AC24) MDIO0_MDC */
>> +            J722S_IOPAD(0x015c, PIN_INPUT, 0)    /* (AD25) MDIO0_MDIO */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    ospi0_pins_default: ospi0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x000, PIN_OUTPUT, 0)    /* (L24) OSPI0_CLK */
>> +            J722S_IOPAD(0x02c, PIN_OUTPUT, 0)    /* (K26) OSPI0_CSn0 */
>> +            J722S_IOPAD(0x00c, PIN_INPUT, 0)    /* (K27) OSPI0_D0 */
>> +            J722S_IOPAD(0x010, PIN_INPUT, 0)    /* (L27) OSPI0_D1 */
>> +            J722S_IOPAD(0x014, PIN_INPUT, 0)    /* (L26) OSPI0_D2 */
>> +            J722S_IOPAD(0x018, PIN_INPUT, 0)    /* (L25) OSPI0_D3 */
>> +            J722S_IOPAD(0x01c, PIN_INPUT, 0)    /* (L21) OSPI0_D4 */
>> +            J722S_IOPAD(0x020, PIN_INPUT, 0)    /* (M26) OSPI0_D5 */
>> +            J722S_IOPAD(0x024, PIN_INPUT, 0)    /* (N27) OSPI0_D6 */
>> +            J722S_IOPAD(0x028, PIN_INPUT, 0)    /* (M27) OSPI0_D7 */
>> +            J722S_IOPAD(0x008, PIN_INPUT, 0)    /* (L22) OSPI0_DQS */
>> +            J722S_IOPAD(0x038, PIN_INPUT, 7)    /* (J22) OSPI0_CSn3.GPIO0_14 */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    pmic_irq_pins_default: pmic-irq-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x030, PIN_INPUT, 7)    /* (K23) OSPI0_CSN1.GPIO0_12 */
>> +        >;
>> +    };
>> +
>> +    rgmii1_pins_default: rgmii1-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x014c, PIN_INPUT, 0)    /* (AC25) RGMII1_RD0 */
>> +            J722S_IOPAD(0x0150, PIN_INPUT, 0)    /* (AD27) RGMII1_RD1 */
>> +            J722S_IOPAD(0x0154, PIN_INPUT, 0)    /* (AE24) RGMII1_RD2 */
>> +            J722S_IOPAD(0x0158, PIN_INPUT, 0)    /* (AE26) RGMII1_RD3 */
>> +            J722S_IOPAD(0x0148, PIN_INPUT, 0)    /* (AE27) RGMII1_RXC */
>> +            J722S_IOPAD(0x0144, PIN_INPUT, 0)    /* (AD23) RGMII1_RX_CTL */
>> +            J722S_IOPAD(0x0134, PIN_OUTPUT, 0)    /* (AF27) RGMII1_TD0 */
>> +            J722S_IOPAD(0x0138, PIN_OUTPUT, 0)    /* (AE23) RGMII1_TD1 */
>> +            J722S_IOPAD(0x013c, PIN_OUTPUT, 0)    /* (AG25) RGMII1_TD2 */
>> +            J722S_IOPAD(0x0140, PIN_OUTPUT, 0)    /* (AF24) RGMII1_TD3 */
>> +            J722S_IOPAD(0x0130, PIN_OUTPUT, 0)    /* (AG26) RGMII1_TXC */
>> +            J722S_IOPAD(0x012c, PIN_OUTPUT, 0)    /* (AF25) RGMII1_TX_CTL */
>> +        >;
>> +        bootph-all;
>> +    };
>> +};
>> +
>> +&mcu_pmx0 {
>> +    wkup_i2c0_pins_default: wkup-i2c0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0)    /* (B9) WKUP_I2C0_SCL */
>> +            J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)    /* (D11) WKUP_I2C0_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +};
>> +
>> +&cpsw3g {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&rgmii1_pins_default>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&cpsw3g_mdio {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&mdio_pins_default>;
>> +    status = "okay";
>> +
>> +    cpsw3g_phy1: ethernet-phy@1 {
>> +        compatible = "ethernet-phy-ieee802.3-c22";
>> +        reg = <1>;
>> +        ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>> +        tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>> +        ti,min-output-impedance;
>> +    };
>> +};
>> +
>> +&cpsw_port1 {
>> +    phy-mode = "rgmii-id";
>> +    phy-handle = <&cpsw3g_phy1>;
>> +    status = "okay";
>> +};
>> +
>> +&cpsw_port2 {
>> +    status = "disabled";
> 
> This should already be default disabled in the SoC dtsi,
> no need to re-disable it here.
> 
>> +};
>> +
>> +&ospi0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&ospi0_pins_default>;
>> +    bootph-all;
>> +    status = "okay";
>> +
>> +    serial_flash: flash@0 {
>> +        compatible = "jedec,spi-nor";
>> +        reg = <0x0>;
>> +        spi-tx-bus-width = <8>;
>> +        spi-rx-bus-width = <8>;
>> +        spi-max-frequency = <25000000>;
>> +        vcc-supply = <&vdd_1v8>;
>> +        cdns,tshsl-ns = <60>;
>> +        cdns,tsd2d-ns = <60>;
>> +        cdns,tchsh-ns = <60>;
>> +        cdns,tslch-ns = <60>;
>> +        cdns,read-delay = <0>;
>> +    };
>> +};
>> +
>> +&sdhci0 {
>> +    non-removable;
>> +    bootph-all;
>> +    ti,driver-strength-ohm = <50>;
>> +    status = "okay";
>> +};
>> +
>> +&wkup_i2c0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&wkup_i2c0_pins_default>;
>> +    clock-frequency = <400000>;
>> +    bootph-all;
>> +    status = "okay";
>> +
>> +    pmic@30 {
>> +        compatible = "ti,tps65219";
>> +        reg = <0x30>;
>> +        buck1-supply = <&vcc_5v0_som>;
>> +        buck2-supply = <&vcc_5v0_som>;
>> +        buck3-supply = <&vcc_5v0_som>;
>> +        ldo1-supply = <&vdd_3v3>;
>> +        ldo2-supply = <&vdd_1v8>;
>> +        ldo3-supply = <&vdd_3v3>;
>> +        ldo4-supply = <&vdd_3v3>;
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pmic_irq_pins_default>;
>> +        interrupt-parent = <&main_gpio0>;
>> +        interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        system-power-controller;
>> +        ti,power-button;
>> +
>> +        regulators {
>> +            vdd_3v3: buck1 {
>> +                regulator-name = "VDD_3V3";
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vdd_1v8: buck2 {
>> +                regulator-name = "VDD_1V8";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vdd_lpddr4: buck3 {
>> +                regulator-name = "VDD_LPDDR4";
>> +                regulator-min-microvolt = <1100000>;
>> +                regulator-max-microvolt = <1100000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vddshv_sdio: ldo1 {
>> +                regulator-name = "VDDSHV_SDIO";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-allow-bypass;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vdd_1v2: ldo2 {
>> +                regulator-name = "VDD_1V2";
>> +                regulator-min-microvolt = <1200000>;
>> +                regulator-max-microvolt = <1200000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vdda_1v8_phy: ldo3 {
>> +                regulator-name = "VDDA_1V8_PHY";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +
>> +            vdd_1v8_pll: ldo4 {
>> +                regulator-name = "VDD_1V8_PLL";
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-boot-on;
>> +                regulator-always-on;
>> +            };
>> +        };
>> +    };
>> +
>> +    vdd_core: regulator-vdd-core@44 {
>> +        compatible = "ti,tps62873";
>> +        reg = <0x44>;
>> +        bootph-pre-ram;
>> +        regulator-name = "VDD_CORE";
>> +        regulator-min-microvolt = <850000>;
>> +        regulator-max-microvolt = <850000>;
>> +        regulator-boot-on;
>> +        regulator-always-on;
>> +    };
>> +
>> +    eeprom@50 {
>> +        compatible = "atmel,24c32";
>> +        reg = <0x50>;
>> +        pagesize = <32>;
>> +    };
>> +
>> +    som_eeprom_opt: eeprom@51 {
>> +        compatible = "atmel,24c32";
>> +        reg = <0x51>;
>> +        pagesize = <32>;
>> +    };
>> +
>> +    i2c_som_rtc: rtc@52 {
>> +        compatible = "microcrystal,rv3028";
>> +        reg = <0x52>;
>> +    };
>> +};
>> +
>> +#include "k3-j722s-ti-ipc-firmware.dtsi"
>> diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
>> new file mode 100644
>> index 000000000000..7853d4f5d3b9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
>> @@ -0,0 +1,502 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Copyright (C) 2026 PHYTEC America LLC
>> + * Author: Nathan Morrisson <nmorrisson@phytec.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include "k3-serdes.h"
>> +#include "k3-j722s.dtsi"
> 
> This should be included by the som.dtsi, keeps the include chain sane.


I think we always included the soc.dtsi on carrier-board level. As far as I remember the idea was to keep the option open for SoM/CB combinations using a different SoC variant from the j722s family. E.g. if in the future there will be a need for different soc.dtsi which is not j722s. But since most variants are now handled by u-boot/dt fixups, it does not really matter anymore.

Regards,
Wadim

> 
> Andrew
> 
>> +#include "k3-am67-phycore-som.dtsi"
>> +
>> +/ {
>> +    compatible = "phytec,am6754-phyboard-rigel",
>> +             "phytec,am67-phycore-som", "ti,j722s";
>> +    model = "PHYTEC phyBOARD-Rigel AM67";
>> +
>> +    aliases {
>> +        gpio1 = &main_gpio1;
>> +        mmc1 = &sdhci1;
>> +        serial2 = &main_uart0;
>> +        usb0 = &usb0;
>> +        usb1 = &usb1;
>> +    };
>> +
>> +    can_tc0: can-phy0 {
>> +        compatible = "ti,tcan1042";
>> +        #phy-cells = <0>;
>> +        max-bitrate = <8000000>;
>> +        standby-gpios = <&gpio_exp1 1 GPIO_ACTIVE_HIGH>;
>> +    };
>> +
>> +    usb0_connector: connector {
>> +        compatible = "gpio-usb-b-connector", "usb-b-connector";
>> +        label = "USB-C";
>> +        data-role = "dual";
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&main_usbc_power_pins_default>;
>> +
>> +        id-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
>> +
>> +        port {
>> +            usb0_con: endpoint {
>> +                remote-endpoint = <&usb0_ep>;
>> +            };
>> +        };
>> +    };
>> +
>> +    keys {
>> +        compatible = "gpio-keys";
>> +        autorepeat;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&gpio_keys_pins_default>;
>> +
>> +        key-home {
>> +            label = "home";
>> +            linux,code = <KEY_HOME>;
>> +            gpios = <&main_gpio1 23 GPIO_ACTIVE_HIGH>;
>> +        };
>> +
>> +        key-menu {
>> +            label = "menu";
>> +            linux,code = <KEY_MENU>;
>> +            gpios = <&gpio_exp1 4 GPIO_ACTIVE_HIGH>;
>> +        };
>> +    };
>> +
>> +    pcie_refclk0: pcie-refclk0 {
>> +        compatible = "gpio-gate-clock";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&main_pcie_usb_sel_pins_default>;
>> +        clocks = <&serdes_refclk>;
>> +        #clock-cells = <0>;
>> +        enable-gpios = <&main_gpio0 22 GPIO_ACTIVE_LOW>;
>> +    };
>> +
>> +    vcc_1v8: regulator-vcc-1v8 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_1V8";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vcc_3v3_aud: regulator-vcc-3v3-aud {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_3V3_AUD";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vcc_3v3_mmc: regulator-vcc-3v3-mmc {
>> +        /* TPS22963C OUTPUT */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_3V3_MMC";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vcc_3v3_sw: regulator-vcc-3v3-sw {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_3V3_SW";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vcc_speaker: regulator-vcc-speaker {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VCC_SPEAKER";
>> +        regulator-min-microvolt = <5000000>;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    sound {
>> +        compatible = "simple-audio-card";
>> +        simple-audio-card,widgets =
>> +            "Microphone", "Mic Jack",
>> +            "Headphone", "Headphone Jack",
>> +            "Line", "Stereo Jack",
>> +            "Speaker", "L SPKR",
>> +            "Speaker", "R SPKR";
>> +        simple-audio-card,routing =
>> +            "MIC1RP", "Mic Jack",
>> +            "Mic Jack", "MICBIAS",
>> +            "Headphone Jack", "HPL",
>> +            "Headphone Jack", "HPR",
>> +            "MIC1LM", "Stereo Jack",
>> +            "MIC1LP", "Stereo Jack",
>> +            "SPL", "L SPKR",
>> +            "SPR", "R SPKR";
>> +        simple-audio-card,name = "phyBOARD-Rigel";
>> +        simple-audio-card,format = "dsp_b";
>> +        simple-audio-card,bitclock-master = <&sound_master>;
>> +        simple-audio-card,frame-master = <&sound_master>;
>> +        simple-audio-card,bitclock-inversion;
>> +
>> +        simple-audio-card,cpu {
>> +            sound-dai = <&mcasp0>;
>> +        };
>> +
>> +        sound_master: simple-audio-card,codec {
>> +            sound-dai = <&audio_codec>;
>> +            clocks = <&audio_refclk1>;
>> +        };
>> +    };
>> +};
>> +
>> +&main_pmx0 {
>> +    audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0a0, PIN_OUTPUT, 1)    /* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
>> +        >;
>> +    };
>> +
>> +    gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0054, PIN_INPUT, 7)    /* (T21) GPMC0_AD6.GPIO0_21 */
>> +        >;
>> +    };
>> +
>> +    gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0244, PIN_INPUT, 7)    /* (A24) MMC1_SDWP.GPIO1_49 */
>> +        >;
>> +    };
>> +
>> +    gpio_exp2_int_pins_default: gpio-exp2-int-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0050, PIN_INPUT, 7)    /* (T24) GPMC0_AD5.GPIO0_20 */
>> +        >;
>> +    };
>> +
>> +    gpio_keys_pins_default: gpio-keys-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x01d4, PIN_INPUT, 7)    /* (B21) UART0_RTSn.GPIO1_23 */
>> +        >;
>> +    };
>> +
>> +    main_i2c0_pins_default: main-i2c0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0)    /* (D23) I2C0_SCL */
>> +            J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0)    /* (B22) I2C0_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    main_i2c1_pins_default: main-i2c1-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0)    /* (C24) I2C1_SCL */
>> +            J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0)    /* (A22) I2C1_SDA */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    main_mcan0_pins_default: main-mcan0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x1dc, PIN_INPUT, 0)    /* (C22) MCAN0_RX */
>> +            J722S_IOPAD(0x1d8, PIN_OUTPUT, 0)    /* (D22) MCAN0_TX */
>> +        >;
>> +    };
>> +
>> +    main_mcasp0_pins_default: main-mcasp0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x1a8, PIN_INPUT, 0)    /* (C26) MCASP0_AFSX */
>> +            J722S_IOPAD(0x1a4, PIN_INPUT, 0)    /* (D25) MCASP0_ACLKX */
>> +            J722S_IOPAD(0x198, PIN_OUTPUT, 0)    /* (A26) MCASP0_AXR2 */
>> +            J722S_IOPAD(0x194, PIN_INPUT, 0)    /* (A25) MCASP0_AXR3 */
>> +        >;
>> +    };
>> +
>> +    main_mcasp1_pins_default: main-mcasp1-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x0090, PIN_INPUT, 2)    /* (P27) GPMC0_BE0n_CLE.MCASP1_ACLKX */
>> +            J722S_IOPAD(0x0098, PIN_INPUT, 2)    /* (V21) GPMC0_WAIT0.MCASP1_AFSX */
>> +            J722S_IOPAD(0x008c, PIN_OUTPUT, 2)    /* (N23) GPMC0_WEn.MCASP1_AXR0 */
>> +        >;
>> +    };
>> +
>> +    main_mmc1_pins_default: main-mmc1-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x023c, PIN_INPUT, 0)    /* (H22) MMC1_CMD */
>> +            J722S_IOPAD(0x0234, PIN_INPUT, 0)    /* (H24) MMC1_CLK */
>> +            J722S_IOPAD(0x0230, PIN_INPUT, 0)    /* (H23) MMC1_DAT0 */
>> +            J722S_IOPAD(0x022c, PIN_INPUT, 0)    /* (H20) MMC1_DAT1 */
>> +            J722S_IOPAD(0x0228, PIN_INPUT, 0)    /* (J23) MMC1_DAT2 */
>> +            J722S_IOPAD(0x0224, PIN_INPUT, 0)    /* (H25) MMC1_DAT3 */
>> +            J722S_IOPAD(0x0240, PIN_INPUT, 0)    /* (B24) MMC1_SDCD */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    main_pcie_pins_default: main-pcie-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x07c, PIN_INPUT, 7)    /* (T23) GPMC0_CLK.GPIO0_31 */
>> +        >;
>> +    };
>> +
>> +    main_pcie_usb_sel_pins_default: main-pcie-usb-sel-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x058, PIN_INPUT, 7)    /* (T22) GPMC0_AD7.GPIO0_22 */
>> +        >;
>> +    };
>> +
>> +    main_uart0_pins_default: main-uart0-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x01c8, PIN_INPUT, 0)    /* (F19) UART0_RXD */
>> +            J722S_IOPAD(0x01cc, PIN_OUTPUT, 0)    /* (F20) UART0_TXD */
>> +        >;
>> +        bootph-all;
>> +    };
>> +
>> +    main_usbc_power_pins_default: main-usbc-power-default-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x1b4, PIN_INPUT, 7)    /* (B20) SPI0_CS0.GPIO1_15 */
>> +        >;
>> +    };
>> +};
>> +
>> +&audio_refclk1 {
>> +    assigned-clock-rates = <25000000>;
>> +};
>> +
>> +&main_i2c0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_i2c0_pins_default>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +
>> +    veml6030: light-sensor@10 {
>> +        compatible = "vishay,veml6030";
>> +        reg = <0x10>;
>> +        vdd-supply = <&vcc_3v3_sw>;
>> +    };
>> +};
>> +
>> +&main_i2c1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_i2c1_pins_default>;
>> +    clock-frequency = <100000>;
>> +    status = "okay";
>> +
>> +    audio_codec: audio-codec@18 {
>> +        compatible = "ti,tlv320aic3110";
>> +        reg = <0x18>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&audio_ext_refclk1_pins_default>;
>> +        #sound-dai-cells = <0>;
>> +        ai3xx-micbias-vg = <2>;
>> +        reset-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
>> +
>> +        HPVDD-supply = <&vcc_3v3_aud>;
>> +        SPRVDD-supply = <&vcc_speaker>;
>> +        SPLVDD-supply = <&vcc_speaker>;
>> +        AVDD-supply = <&vcc_3v3_aud>;
>> +        IOVDD-supply = <&vcc_3v3_aud>;
>> +        DVDD-supply = <&vcc_1v8>;
>> +    };
>> +
>> +    gpio_exp0: gpio@20 {
>> +        compatible = "nxp,pcf8574";
>> +        reg = <0x20>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&gpio_exp0_int_pins_default>;
>> +        interrupt-parent = <&main_gpio0>;
>> +        interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
>> +        gpio-line-names = "CSI3_STROBE", "CSI3_TRIGGER",
>> +                  "CSI3_SHUTTER", "CSI3_OE",
>> +                  "CSI2_STROBE", "CSI2_TRIGGER",
>> +                  "CSI2_SHUTTER", "CSI2_OE";
>> +    };
>> +
>> +    gpio_exp1: gpio@21 {
>> +        compatible = "nxp,pcf8574";
>> +        reg = <0x21>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&gpio_exp1_int_pins_default>;
>> +        interrupt-parent = <&main_gpio1>;
>> +        interrupts = <49 IRQ_TYPE_LEVEL_LOW>;
>> +        gpio-line-names = "GPIO0_HDMI_RST", "GPIO1_CAN_nEN",
>> +                  "GPIO2_LED", "GPIO3_MCU_CAN0_nEN",
>> +                  "GPIO4_BUT2", "GPIO5_MCU_CAN1_nEN",
>> +                  "GPIO6_AUDIO_GPIO", "GPIO7_AUDIO_USER_RESET";
>> +    };
>> +
>> +    gpio_exp2: gpio@23 {
>> +        compatible = "nxp,pcf8574";
>> +        reg = <0x23>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&gpio_exp2_int_pins_default>;
>> +        interrupt-parent = <&main_gpio0>;
>> +        interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
>> +        gpio-line-names = "CSI1_STROBE", "CSI1_TRIGGER",
>> +                  "CSI1_SHUTTER", "CSI1_OE",
>> +                  "CSI0_STROBE", "CSI0_TRIGGER",
>> +                  "CSI0_SHUTTER", "CSI0_OE";
>> +    };
>> +
>> +    current-sensor@40 {
>> +        compatible = "ti,ina233";
>> +        reg = <0x40>;
>> +        shunt-resistor = <18000>;
>> +    };
>> +
>> +    eeprom@51 {
>> +        compatible = "atmel,24c02";
>> +        reg = <0x51>;
>> +        pagesize = <16>;
>> +    };
>> +};
>> +
>> +&main_mcan0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_mcan0_pins_default>;
>> +    phys = <&can_tc0>;
>> +    status = "okay";
>> +};
>> +
>> +&main_uart0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_uart0_pins_default>;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&mcasp0 {
>> +    #sound-dai-cells = <0>;
>> +    op-mode = <0>; /* MCASP_IIS_MODE */
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_mcasp0_pins_default>;
>> +    tdm-slots = <2>;
>> +    serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
>> +           0 0 1 2
>> +           0 0 0 0
>> +           0 0 0 0
>> +           0 0 0 0
>> +    >;
>> +    status = "okay";
>> +};
>> +
>> +&mcasp1 {
>> +    #sound-dai-cells = <0>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_mcasp1_pins_default>;
>> +    op-mode = <0>; /* MCASP_IIS_MODE */
>> +    tdm-slots = <2>;
>> +    serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
>> +           1 0 2 0
>> +           0 0 0 0
>> +           0 0 0 0
>> +           0 0 0 0
>> +    >;
>> +    status = "okay";
>> +};
>> +
>> +&pcie0_rc {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_pcie_pins_default>;
>> +    num-lanes = <1>;
>> +    phys = <&serdes1_pcie_link>;
>> +    phy-names = "pcie-phy";
>> +    reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
>> +    status = "okay";
>> +};
>> +
>> +&sdhci1 {
>> +    /* SD/MMC */
>> +    vmmc-supply = <&vcc_3v3_mmc>;
>> +    vqmmc-supply = <&vddshv_sdio>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_mmc1_pins_default>;
>> +    disable-wp;
>> +    no-1-8-v;
>> +    bootph-all;
>> +    status = "okay";
>> +};
>> +
>> +&serdes_ln_ctrl {
>> +    idle-states = <J722S_SERDES0_LANE0_USB>,
>> +              <J722S_SERDES1_LANE0_PCIE0_LANE0>;
>> +};
>> +
>> +&serdes0 {
>> +    status = "okay";
>> +
>> +    serdes0_usb_link: phy@0 {
>> +        reg = <0>;
>> +        cdns,num-lanes = <1>;
>> +        #phy-cells = <0>;
>> +        cdns,phy-type = <PHY_TYPE_USB3>;
>> +        resets = <&serdes_wiz0 1>;
>> +    };
>> +};
>> +
>> +&serdes_wiz0 {
>> +    status = "okay";
>> +};
>> +
>> +&serdes1 {
>> +    status = "okay";
>> +
>> +    serdes1_pcie_link: phy@0 {
>> +        reg = <0>;
>> +        cdns,num-lanes = <1>;
>> +        #phy-cells = <0>;
>> +        cdns,phy-type = <PHY_TYPE_PCIE>;
>> +        resets = <&serdes_wiz1 1>;
>> +    };
>> +};
>> +
>> +&serdes_wiz1 {
>> +    clocks = <&k3_clks 280 0>, <&k3_clks 280 1>, <&pcie_refclk0>;
>> +    status = "okay";
>> +};
>> +
>> +&usbss0 {
>> +    ti,vbus-divider;
>> +    status = "okay";
>> +};
>> +
>> +&usb0 {
>> +    dr_mode = "otg";
>> +    usb-role-switch;
>> +    maximum-speed = "high-speed";
>> +
>> +    port {
>> +        usb0_ep: endpoint {
>> +            remote-endpoint = <&usb0_con>;
>> +        };
>> +    };
>> +};
>> +
>> +&usbss1 {
>> +    ti,vbus-divider;
>> +    status = "okay";
>> +};
>> +
>> +&usb1 {
>> +    dr_mode = "host";
>> +    phys = <&serdes0_usb_link>;
>> +    phy-names = "cdns3,usb3-phy";
>> +    maximum-speed = "super-speed";
>> +};
> 
> _______________________________________________
> upstream mailing list -- upstream@lists.phytec.de
> To unsubscribe send an email to upstream-leave@lists.phytec.de


