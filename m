Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2569D148BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=; b=PbmHfV9JCXZjGJqXmyQjW6S9Tl
	RqVMWi4I6LC3IP0uA/XAMrn5jFPn67AyCVqQAmiul72jBcO3UpoOq4/1buc5tVse3zzMGysn0Idle
	8AOsSW7O23c15ECCYp2K1rSILpMWE1EQYne6DSj9L67LwvQFWn54rvadOWN1s+jzCFReNOtc5GPIT
	vZwJbTH8J8bAbObGQzSdtk9KQogwRX1ET0WWvX56Lc/HMTlMYi0cqWGDG2SMMX+AQY7NBQ1rsJdei
	VioD0tzk4IUhU1fXiQe2EiD1MdesEYNJqpr3t2i+BsdzPbjusstsNJFMhKfa5YmqM7TvCnWDKZOQ9
	mHjkPAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkuu-0000000GASK-1Hqa;
	Thu, 08 Jan 2026 07:58:48 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkus-0000000GART-0uF1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 07:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZIEcIseeNkv2p42luzpacrRiS9aG0E4psZf9k4kGJGbzlE9w79rBiXl+egDbFjuCVhlHp7bdTOp92l4Fl8MqaJS47ABx3S/zIjJtp/XF2iEFrqX8hJCAzo5n8P0/icD2ZteUXp8iyGV3X/Mej+VcgVd/CXUno0Efta1dK0zmLoFmvotYItttywDTyANorXgndSYj4gCe/pMQIyMPLeUS3LC66sjyunc2Ww8U137MClH+tGNSwkEMdhkeMLopAMryi8tttVXBKjDg6JxOGFBzoYW5ZVd8TuvbVc1z1xlApHV9VChXkmI5yN/deA8Vn/SWgk/TgUr8fAiJvdbiSMnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=fqsSw8SiLzr9Zg3X+SBfgOvo9b05czLg5GpSNVWeA5h0ZUV4WoZZyQQSGtbGjgq9TGEiaP9K9vGPtOOQRQVWr85bPBN9i+eSySQVWT5UsCnjXMWQHqBnhEgX1M5AOgrdmDK/XB1CdlBic81ntsl+McjMuvdFbEQr+cCStEGF7CqN5JcwzQUiTukyFK3YiIUk1PWLkiVeKGIjcUrxA3/TZLf/qZrZUWROm4rYnwz18AXuZv7bZm9r4sgl0VMB3nVjCxQj4jxT4lZ1FriB0NloSZ/jOtPk73/aLb1Chrs9kIAN/UZI7gJytt+I+mbGwBf20XIZIG0zcnynS2iK6SQ15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=YPa+fs7xA704B2t+bInj3xVr1PzkM0jlSXZfuYgEH5c7hVhA2zfAdDqGQ5ckSkf4o1Hy7lbw2SuQzJbAhDHqVyPRR4aMtuPyNczOn546IP0hsLaOg4Dis29EUQAFuM/Sl64nogaJ6G38gfW3a8auchcXIb44y6SPWy5xyvr33p8BzcGA3kT6wFUPi2OqrJI5tIwJBC8jLffbudNfo6JvcGC/G5lDbwuKH88689TVg4BTUOog8TqoQRj5ygw6/yfm3QyzIQg252zbP/WtBeS0qD6h9ISrv3FiuejYM71SFq9d4+TlR4l3nanPODMLoRB3b9OUNv4SBKavX3u2rg+vyQ==
Received: from BL1PR13CA0248.namprd13.prod.outlook.com (2603:10b6:208:2ba::13)
 by LV8PR22MB5276.namprd22.prod.outlook.com (2603:10b6:408:1bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 07:58:40 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::bd) by BL1PR13CA0248.outlook.office365.com
 (2603:10b6:208:2ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Thu, 8
 Jan 2026 07:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 07:58:39 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D10DF1A2CC;
	Thu,  8 Jan 2026 09:58:36 +0200 (EET)
Message-ID: <493b1bac-2eae-4c78-9c07-801eaf954b04@gehealthcare.com>
Date: Thu, 8 Jan 2026 09:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
 <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
 <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|LV8PR22MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aee761a-efe4-4d19-fd13-08de4e8bbc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGxtdVp0aXNOMDBNSDU4R0tNbmZoQ0VPc29VOENpZER6dkdSQlRTeUFJa0RP?=
 =?utf-8?B?L3BmREp1LzJFQ2g0cTRZQk5lcWIrd1kzaWttV3FJY0FrQittTVJ3VmZCOVRR?=
 =?utf-8?B?RXdqRFl3VHdVeWE5R3IwV01mU3pVL05VRjdGeW9Sdm5TUmE1UDBmalZWMVUy?=
 =?utf-8?B?c3BIWkF5QzBBSU5Vb3FZLzdDaTdqRUF3aHdpd0tRTDRQMWRzaEdHS1pmbmJp?=
 =?utf-8?B?anNYNVVmR2t1SnlPV2hnKzNmSkFQZ2pvMXRpenBmOFExc0RVSG55ZEVlZFdW?=
 =?utf-8?B?RzFtQ3hibEtkRzJDSmdPb1pmSHpyOTEwOEVxSmJpNGtxNXk5MXpkdmtZTkZ3?=
 =?utf-8?B?VjVVMGN3OVFyNmluN2hEREZES1ZZTGQ4RHhlakpFSnp1cEdVVG9YaE5yczdC?=
 =?utf-8?B?T2ljYm82NWoyRE5MWFVTOFpFSVRLcjNSTG9Ma2lrNURDZXhCVjZ4ZVhtZEp1?=
 =?utf-8?B?SXhyRFphSUV1bkpKaHJ4ODRXMDEyVkRjQ0wxdENIenM2UjB2c0hGbXhrTGs3?=
 =?utf-8?B?MEpWNWhiWm5mZk10ZDNqWXhpYmdoRlBKZnRmUDN3UlRLZExpMWRHNTlOcUtm?=
 =?utf-8?B?MG9OREFCV3NLUm5VK05aWktlaGFsV3U5cjVNRjFjWGhwTCt1aDgwWVk1U05X?=
 =?utf-8?B?cytBMVJKK0pBT1NEbklCSHNzbTgwYlRCb1dZNG04d2wzRzJrd1JNRU5ldzR4?=
 =?utf-8?B?b2NpVkxVNW5rOXpaS2xSQld4US9rdmlPKy9oUE0zdldwemo3VU4vdGR2SnBh?=
 =?utf-8?B?eHFwM0lEaTVBYURtSWpGMzJsY2c1eUNLNDBaSitBaS9VR3ZqRnBVTVlHTDJ6?=
 =?utf-8?B?MUl5RmZPc3p5c0t5Q0Qxb3BkcFNLTEFTTHpOSmdXbjNwREFSN0R2TEg2eU5m?=
 =?utf-8?B?OFdtN2I1Y0FpSldrRTZVUzlEWUcyV3Q1VHJybHVKTTN6NmY5bmpBUWYzSlp3?=
 =?utf-8?B?bWhJRmJTNG1ybGJSc0tUTFlWQW1nbjdWVVRtTDNmN1J6MlI3eFhSV2tHSUZi?=
 =?utf-8?B?WWp1QmNmQjNWUmdOTEpmQVYxc3ZmbytiRE0zSStRNEViVUY5eUoya3pNSUtE?=
 =?utf-8?B?WVQrQUJxcld3clgwb3B2SzRlRzhDakVBajVPRkY4elAySVRmMndJMjRWdDV2?=
 =?utf-8?B?VzROb2N4MXkrY3c1N2JDbkNRWVg5VnBSZDVzZ1RMeHhka2tYWEdGTG9ScCtZ?=
 =?utf-8?B?dUZFcVZhSWh2NUZKZHQwNVpCUkVKUS9QMFdTbmxtVXI1TmJ3dlBUOXNvZXI2?=
 =?utf-8?B?MEFvUlVKN2psdFBYMVFjQ1FCengyaFZhaDRCbEZManIwbFRqclc0QUVLbktr?=
 =?utf-8?B?by9RL25nVmhFbkFmK2VlVllUSklqWkZxV3E3Tmk2ODNBZFd2eW9PU0MxQ3Bz?=
 =?utf-8?B?RDZLeWV2YTdhT0xBOEdZVFpNaDFibEliWWRScytXR1ZMVEJmN3YxUDlyZ2Jo?=
 =?utf-8?B?VCt2UGhqSm8rTE8zTEJXNWFiZTR1RW1lcElUMUlNWUNNbldHSnBNUDRpcHdy?=
 =?utf-8?B?QjdzZktTaFI1RW1JL1l1Nm5wb3J5VGFXVlNWN2xTZkMxWHBDMy9qYlhUYi9H?=
 =?utf-8?B?TVJ0d0ttREJhWGpPdlZxa2M0MTFjWmg2TWlvRWsxa2VtYWU1dStDdWE3YURB?=
 =?utf-8?B?cE15eWF3dSt4SjYvL2RTSGhXVkwyVVBQc09LbFExcERFY0RwZWsxazdEdTll?=
 =?utf-8?B?c2VtdHdmSkM2eWEyQm95a3c4eVBzQTMzaWw0R2w2bUZyQlNKeW1idllROTdZ?=
 =?utf-8?B?QVkvYURBcUluN210SC81MVB0TUcyQ1NqbnphSTlDUGYxeit4VFlEdjhKQ0Yy?=
 =?utf-8?B?bElkelBudHhUOGp0bXEvaW5uMTlIOFNJeWhFZDdnWkwxMHJrdXF4eFd5STFU?=
 =?utf-8?B?WnNhZm1XYmZhZlRjM2t1MkpNYzhudmNIZ092Q2ZvWTZWK1IyU2I2SCtZYWtC?=
 =?utf-8?B?QUZXamY1SWlmOW9Lc3EvYzUzaXBXQ3pFbkFVNGJXZHF2bTM5S2tWSGN3UE9F?=
 =?utf-8?B?OG5vbkNZalNqR05jTTRlMkpPY284VzRDQ28wcmpldW9ubVZuMXh5Q1ZYWk5N?=
 =?utf-8?B?MmtyTEpsYlFiS3V3UG91Y1JIbS9pTGg4cEZtSUxXb2l3VllTVGNQMERXSVNR?=
 =?utf-8?Q?IM3E=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:58:39.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aee761a-efe4-4d19-fd13-08de4e8bbc66
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_235846_265518_D753365E 
X-CRM114-Status: GOOD (  22.30  )
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


On 1/7/26 12:48, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 07/01/2026 10:12, Nandor Han wrote:
>> On 12/30/25 14:34, Krzysztof Kozlowski wrote:
>>> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>>>
>>> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>>>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>>>> running in low power modes (STOP and DOZE). By default, the watchdog is
>>>> suspended in these modes. This property provides the option to keep the
>>>> watchdog active during low power states when needed.
>>> And why exactly would that be a DT property? If system is sleeping
>>> (assuming this is what you meant by low power), no one will pet the dog,
>>> thus watchdog makes no sense.
>> Thanks for the feedback Krzysztof and Guenter.
>>
>> In our case, low-power mode is disabled. However, we have identified that under certain conditions,
> If your system has low power mode disabled, then you do not need this
> property - you already know that watchdog must continue (or whatever you
> want to achieve here).
>
>> specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
>> one of these power states.
> Device as watchdog? I really do not understand your explanations, but
> for sure system load is not relevant to DT property.
>
>>> Otherwise I fail to see how this is a hardware property and we do not
>>> accept SW properties (see writing bindings, numerous presentations).
>> Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:
>>
>> (From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
>> ---
>> WDZST
>> Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
>> once-only.
>> ---
>> Given that our system does not support low-power modes, we intend to enable the watchdog across all power
>> states to ensure the device can recover properly under these conditions.
> That's not what your property said. Your property said watchdog should
> continue in low power modes. So when system enters low power mode, how
> the watchdog petting would work?
>
> Now you claim you want to enable it in low power mode but you do not
> have low power mode? Does not make sense to me at all.
>
> Best regards,
> Krzysztof
>
Sorry if anything is unclear. I would try to explain the change from the driver's point of view.

According to i.MX7D Reference Manual, the watchdog controller allows, via the WDOGx_WCR register, control over whether the watchdog continues or suspends in:

a)WAIT power state (bit 7: WDW)
b)STOP and DOSE power state(bit 0: WDZST).

The current driver implementation provides a Device Tree binding `fsl,suspend-in-wait` for configuring case (a) and forces the watchdog to be suspended in case (b).

My patch adds the ability to configure case (b) as well.

Regards,
Nandor




