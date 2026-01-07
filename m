Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA1CF6C12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=; b=ZiYNwiwLGj7n14XfL88DSOba7g
	az3m2D8GOtZ/fiojPYa85tmTvfBRKt8OJ5BupgzxICz5vSjL41zd1mW53DFDuY0OvWJTt1gk1eh4i
	XD9dZDrG+f4CHfG0KhhicGDNpiSinKqvL0K2lsIwARhahfeI9tyBqZRLaNqRgYRFx/C5+TMgY88D3
	mq6NdW5+9Wexu4P96GfNPm1GICnF1iqqIpRw2sPoHL8QGT90ve6nDhp63xsxEDzjIejNcgdIzhvAY
	k2qXaaUE+y9D8nxrrdekXbihZl9iVt5zHEJOD0q6Ozxy8Khz4eIFo3ShSLaJwkf/kSFujWN/jbeZN
	fMuWZBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPTa-0000000ETo3-1Ftq;
	Wed, 07 Jan 2026 09:05:10 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPTW-0000000ETmR-3Hmy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOtCBNLQs2yfeC9SoOnCSGwiIJTxNcVGthQOvx9CN5WWCxN0FrHlYk7tfxVveM6e/SN29Kw+985nBBjmxXt+v5LgxHZl6NDJ7/EQvL1ASocSgSaW0LbgK2wXHuMksCMhuEx2MKT16VGbnyagZFQM0seAqZhj+ug8bJRGUhb4MSNnJZG7k8VZnIQ3HEAKRpqe9HyZD7GDWJbSswjeZpP0qbcRY9YNNz7BngI+t7zY7BhpLIM9yBwH/1ZktZrxVu6byPeXC8RFQoqtw33SxcP6BoqlTwpZFKFclmxzD+3pqIT5K/lKWaaNUVbqs7S1o49fWAn4cx9ONaLizZVm+jds6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=YmHgP3wYQVbcMpr1sLPgPfhKp0kPL1oPBqJPcx+psRwIV7bcNopU0CceLUteOvEs/Zr3527FD71VZGq4Xd+R7pagIKBjCLVl02Xp0/79SYJSVnzIlN9auEDQ/nbuQui5QG+HGyxWq32ZSRleTTDF0u2s6Vmm31LNkr0f5C/8sieRhDeXh/pTc8tNBSK/7Mht59llloeam26vrDm3tODXuxLUrV/Td9A6yZsnJyUIgBy6o7CJrp8ccvN5ZK1WKqwzSIM4v6+k5M8D5UTVWVVnNoxWJMJihX0HI4GPWVhfWDpQ2mOuMXRsdadUgjD0jI2vmpufJUgepgcGgauHOw1KIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=AGsmLxQpYVd6XyOiGhckWRqH0geYVxryYZ6fIa8AZw7TmrDWINJZNqcSG+2pvtQyP5Jkp4XQ4sQogCVsEMr9kOPu0x7OdIUooTCmVB9jFDrkEheH5fx24U1Q0usaVi179ipL4LUetYoX8XfQaDNioLdjYPynvMhB4m2tK6Nj50VdmTKbul/Zf/xsAm/G9rz4TZaDzFYrFDJkCUY2b9IvWvWp8409ZMWr9O9JrYoYufu7Y7iTpD/jr+QRoYfnwzNEeIaryiSJnBj5H6REDwFefN1p/ZdAirXDtfVaF7hWeYHXfQ67V9MEv1QhIUqBkuZUsPrbI4Pf1fJZ7T34PcjrDg==
Received: from CH0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:610:e6::8)
 by BL1PPF5D00EFC05.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:05:00 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::33) by CH0PR03CA0273.outlook.office365.com
 (2603:10b6:610:e6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:04:59 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3A05BE57C8;
	Wed,  7 Jan 2026 11:04:56 +0200 (EET)
Message-ID: <0c3ebcfe-dc45-4e52-a86e-cc776b3bcae2@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
 <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|BL1PPF5D00EFC05:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a08908-2ee2-4653-f84b-08de4dcbd5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG1Sek16S0h5RUtucEZrRzhvNXlLRllJZHZ2b1dmVmYwQlJKcHlLYk9jbGtF?=
 =?utf-8?B?d1BWUWJqZmw2cHp1aGVSblhmc1BJM1A2Vy9zcDhMak9TYklzQlBuUkRhOU1x?=
 =?utf-8?B?WkZMb3ErS24rQ0RxK2tqMGVxSTJ6NjFWeXZDY1ozY05EK3FicjJFbzNNdXFn?=
 =?utf-8?B?allaYWxBY3djbFVhK3JsYVl1czdidUJFSTdMWFovNlpVNkNFZUFPTHRTSEh5?=
 =?utf-8?B?RHcyQS8xalRjQVY3aUdKTEsrbHAveVlJeUt0VjFJc0lBdnliWUFEK3drdEd6?=
 =?utf-8?B?bEZRc2FwWmszMWpheDJVRXg0UXZ3akhXR2JTTHhyYUcwT3RCd2NPZDYrUTVq?=
 =?utf-8?B?Y2M0RFpQYTlDdisvbkdjeGZGQlJzeUR2OHhESit3aFlUOHg3a2dQZVpwbDFR?=
 =?utf-8?B?dmtLTUJ5VEcvTjlJSUxVci9LM2FUYytFOGVWa3l4eDJISVpJTzlqd2ZyRmp4?=
 =?utf-8?B?cjloM1FnSTRkT3NCK0Z3bnVDTnhrNGxZVUptRWRMSkFpZEs1WVh2OU9QUjBo?=
 =?utf-8?B?cG9ZbTZEdlNxZklXek1Fd2lOZlcveVVuR3R1YjRPNlMzRzQyS0ZDaytrTzhF?=
 =?utf-8?B?OTQ2ZWlIZ0VJNXJlVEpoUGVtZ3Fpdjdla3g2TmFvYm5ZTXF1R2VweGZ3czRh?=
 =?utf-8?B?UDJQeFMzY0hGYmhHY3I0SzZzTUZsZ3JpZGVEbDllbkQ1dmtjTHpIWDJVR0lP?=
 =?utf-8?B?dXF6SERGMjVySEprK1dZZXZZV1JpZStqTnlsTjE1UllCMzkwUGJFSmJyM3d4?=
 =?utf-8?B?b3FBL0o2YnI2YnNFbGJjMWIrOU9SeXNITTZ4SFpuNzlJd1duSE9TUC9OcTBP?=
 =?utf-8?B?c1ZxNkZIT1BqMkJ3czRGeUMza1BHdFMrNHh5d1ZFZnlnTkp4bjYrVDIycWhh?=
 =?utf-8?B?b1Q0RmdLakEydlcwQlY1ZmlRK0pnekl6bHo0V2xzNGZad1RTTkRpMURVZTd3?=
 =?utf-8?B?cENydWsvZVJjaGhMb043ZlRDUksxaVJLcGRoaGlFUHU3Y3FseXdnN1V3ZDA1?=
 =?utf-8?B?U1A4by9OK203VmVVTVVLWWJWbkRBREhSNDNRQWFFaEl6Q1QxdFZMcDJlQmlH?=
 =?utf-8?B?S3ZWc3RMMFlNOThMZEJhbUlKTFlmM1NuYjcrNUhNLzlublJiZmlGMHVhY3FF?=
 =?utf-8?B?VmZ1bWxYaEdmanExQ0tjM0ZuL2lUQWlVTGt5RkRzZWRWOWxGR0R2bDAwSnpP?=
 =?utf-8?B?Q3RWWGphRVQ5RjY2VmJDR1pUNmE2ZkQxY3BqSncwMjVINWN6V0RjSHJSSlY5?=
 =?utf-8?B?VmhQNHU5anJqMTJSN2ZudmFrZEJYS0RMeUxSRkE5ZkxSV3BsRHdjTkMwcmJi?=
 =?utf-8?B?djFtaGFneTRONTZDU3JyTE9yeUJhL3phNEwzeGFXQlNaL0UvdlRPckY3YzdG?=
 =?utf-8?B?S2N2RjQ4ZnBMdnNoMnBsemxtQU1scklOay9JaHJLN01pQXdOMmtkWW5kOWZv?=
 =?utf-8?B?UDRpKzZDUjY3M3ZTRTVFQWMrNUN1SjdRdmVnVUJLTGtkcFk1K3JmZmk4WDQz?=
 =?utf-8?B?UEtHd2Nyd2xJalhCN1JlN0MyZ1dXN3FYemdyckt6R20zNDhMWlNxTzc5NnU4?=
 =?utf-8?B?cjlPVERSV1A4aTVvTWNpdHB5RU0wT0xHNkJvNWE4VVRlUlRzNjJZcU1RYkNu?=
 =?utf-8?B?WDAwdHdOVG9lajdHcXdFSXovYk1BckdHRFRwV293NHpNbHJaTmJ2TEg2S2JI?=
 =?utf-8?B?VFRJdWFTWWpIcDV3NXMvS1RiR0ZPUmFzeTVGUGIyUm9UWFdpYm9aSDVIMk9u?=
 =?utf-8?B?allKT3VxQ1Qra01IcGFlTzNESlhTdnNLdWxGeEVYOFc3VHVKMzJZbzlUZUhM?=
 =?utf-8?B?Q01IRVUyMzNuZTc3R01ubFh1bnBpRlZoaGNHRHN6ZSsvanVxczRPZERHYU1z?=
 =?utf-8?B?YlN3Y3RKWDhIVCtiTzNvZFU4dHp3VWVlUUU3SGtIMGxzalJrQ05CMXNMK1Bw?=
 =?utf-8?B?QTRaakVjTm4vWVlSUXNjYXNVM3cyQlRIVzMybGpXOWk1eG12Z1VoL2F6SzM0?=
 =?utf-8?B?d09UNEZPRnZBR09NS2c4dnNaRDNET2RVRDl5K0oyeDZ5T3k3bkNDUWdmMnhF?=
 =?utf-8?B?ZzRKbkFzOENCK0EwME9XdXBwUjRCMzFISkRnS253T3pyRkQwakpyby9aOGNP?=
 =?utf-8?Q?Ea9I=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:04:59.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a08908-2ee2-4653-f84b-08de4dcbd5be
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF5D00EFC05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_010506_835933_D6FC844F 
X-CRM114-Status: GOOD (  14.55  )
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


On 12/30/25 14:35, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
>> By default, the driver suspends the watchdog in low power modes (STOP
>> and DOZE). In some situations this is not desired.
>>
>> Add the possibility to configure the continuation of the watchdog timer
>> in the above mentioned low power modes.
>>
>> Note:
>> Please be advised that the difference between the variable name and the
>> device tree option has been intentionally selected to uphold the
>> prevailing driver functionality. This ensures that the watchdog remains
>> suspended by default in low power mode, while also facilitating a clear
>> and intelligible device tree option name.
>>
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
>
> Best regards,
> Krzysztof

Thanks Krzysztof for the suggestion, I will take a look over the doc.

Regards,
Nandor



