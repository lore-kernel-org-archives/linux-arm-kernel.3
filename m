Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F5FF41997
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkt1egPRcD6Dn/oR8mtcCdsbsUP7Y0ia3uYxCdpqqkk=; b=XKVek1aJ6Z09+7iEsb8wmuaKod
	n7JXJ9gfRc7j3IGvuClQjEgKNmUOlukarBttV/KBWxXrvXkBb73/MO9q64J5bb6K5OgnLQBCzKI2K
	E5+HCCMho2k01bcg8JyQ/Jn96AXqsHrBPNMJ/+64W3YKnqKqxvPRA6xv2mdwGQH82cnAFY+Fl/xi0
	HunJ9CyTWlXITKvtE2G8PsiQd0Gr+WPKp/WGeyzsghFFkQsHfDPqjOAEStZC75nDLOFaYACUE52zG
	7+mue9fjmPvfwFKvWA0p4+DKqkPbeX3wyWt98SDJ3gwdx/V88lf7xlicwZRX2uu0FFVLRP+5iPN3M
	32EP8abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCz4H-000000016CD-2zK6;
	Wed, 15 Apr 2026 12:10:05 +0000
Received: from mail-northeuropeazon11021118.outbound.protection.outlook.com ([52.101.65.118] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCz4F-000000016AF-2Zuj;
	Wed, 15 Apr 2026 12:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRcxhGpDKA7iH21rymSJMimLYn9Ezk2iAWpj1Ni8sHkq1zL7hSiGLvXPyX08EolFA/1oVsqQBvLw/kV0b1W8TaU63sf5Zl6TCVt9LRl2EXWMFbp0N4QFuMZImAai8EJNKj5RkyCUZtUt9aIW8E0RHmGFIpH62NcTJoW8lFY7T89KcV2OpY7bJdv3V7CO54a+ohPPPnazf58Q15wYWKXmdVIQG2PzYuc9SiRoo2gTdZWc4MNKK+18tWhlUHKhYBGkdoEfADRmR71Sbqj1gln9NT5cJAzTPOjP7k1NyvWnfCs0dGgcWHXjlspjUMQ0TvpVIWmf3EXMkiWmKatJmKTQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkt1egPRcD6Dn/oR8mtcCdsbsUP7Y0ia3uYxCdpqqkk=;
 b=X6pmCsQHlPGeN8DU24g8ioCISMAxa8O09a4AK5UxZTP69d8h23msKRTtfzaTb5o1bWvXNR+RyPTpFJc1LtaBJlnAJQkRFI+cjfjbWdPNKrkhNTQKbsSlt9Cdi7wp2ktCmivwScy5mYa16w0cRgzhDdjDEthX901k20VzHKYEgDII1V/nUnGmNBxUcEWmcABkeTHxco6La6G/E50DHBRS3V9hKExidUU+FK5f3z/uw/7LYCoKikqlvgPo5IZcJfcRI8Da3yAp2Yt7UUEpNld3AQmkegCJFZGiv6HlDuAR+0GC+zEtRAxmMCgM8Tk09BeLEpJyHVWI1ZsFDmmCUpnTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkt1egPRcD6Dn/oR8mtcCdsbsUP7Y0ia3uYxCdpqqkk=;
 b=YYdb1lFV2lDdqcGgRsg9VWTnle3kdyclWlwNkbh67pmCtYuLc94NLPPBYIYXI35o010oDC8jq856NbX3SD26yamOBlERrBLt1WfNQ6BqE/ynimgCqp2jg2aLqzSS6yCURlVehFHfMwiylR2nAq7je1a20IAXjLvi7uewQmmk9bt8u7+IbkUScZeLqTVMnuzUY+UgsaZhGVfx64u8d/hwZhmMBSX5+6vIJNGsSXGSt4XnXjtJ77qdE72gjfvNBysSjj8KA0iVLuF7ZCxLRd+J10+TygCsuLdgh4EgFF+FEVjO3YHpaveAD3Rl4roBINiwLTsBSiiYa8kC/dcud79eVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by DU5PR08MB10823.eurprd08.prod.outlook.com (2603:10a6:10:528::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 12:09:52 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%7]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 12:09:52 +0000
Message-ID: <ab5bab39-88be-4f58-aee6-2bb0dc49a732@genexis.eu>
Date: Wed, 15 Apr 2026 14:09:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
 <abBPufvrG8I8UP69@lore-desk>
 <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GVX0EPF0005F673.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::3b0) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|DU5PR08MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b8323f-22d7-4815-496d-08de9ae7e64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RXbFx1LTTgLYJSWI82qSrUSOdlDq/SJXuP9SaQcl6iFXzMnphONcu433Fnzzg1ZRegWoWmHEjZHta9ZWdFboej0VWBoVl+sHqtGFNc9s8hjBARdbZZaQFcXySitEZ0nwf1j8xYAL8yudD0L+AaEpfkDhckZoJdtXFNJW4BqVBoBD0UoXNyIkE2jywDzr8s2AdsHzpPI+2GsC2jZKdpHTp1ubHh/+ejQ/kaxhqUnV0oG4jyCy9+V0UPACmj7A8NC6o9EKb3JMiwFZ6zptz5Lfujc6i1aTCMohicJ2i5mmhHJypTpnrVzXeToK5w4Orci7GjdynmHMQb0C0qcXL2mYYQxAQX0H7SiPdjaTV3aTHkXzF+3lvwcMKOxszTC96VctrmrqwuHX47t/jAaBBBtUHQPMKh2/DRLZqH46pU7gVvMikrJUtYDInzL76e2+OCQ7bjkN5PHblc3HFP9iXkcD3hSyBsV7FohpXjqzow5zOWLsedoKE9yAB45T/5RC1OsZbaC4ic1gd+znbiwcAMitz7DyUB3jYrdKnfnKVzRQb1AJp7OSXHz9gPwFWCtXqX7n2mFetIR2NHMLAFriZV21/NzZCW+ccp4csRc5g+/EYYZ86ExczkOpDsw1Si2TyFzo49xGBdAs6jABfKxVJaT3lHBskEE5+p7d2J9IfY5YmfQ2WeeF/rmj6jAV8AFzey748IiEd4FVuMHdVhpwm9kTmj/NY/ReFNyP8OEn0Tzh2Io=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxNaTNCRTBWWmhjVERCbzJmYzlsck13SDdIT0YzalVmZGk2OE02TVZsSng3?=
 =?utf-8?B?dzkwVEhYeHU1bTBUdnBidVd4eDRYSFNseE1scWIrck1QbEp3ZkhCcmF3WDU5?=
 =?utf-8?B?ZzBUV25NRExBemMyQ2ZUbjNoaVB4dVdkazc4aHpqYnI1Y3liOHNmYUM0a3hx?=
 =?utf-8?B?elYvMGI0T2hhTHJDaGtmcWdlR3FkQXF6Q2tFbitJMnU0OWlTUCtyYm9QWEFE?=
 =?utf-8?B?VnAwczZwOTVrazl6bWtPYTdEQis3RzBjbjhER2hoT00xdWZ5UHNYeUdoNHh6?=
 =?utf-8?B?KzN1N1lsTmptTXJkRXoyVndicE9WcE1POE5UaXRscGFNUTNaejhnSEVMRUFy?=
 =?utf-8?B?bER2akFnTVFUbWd6L1liUW1EQ3BUaDkyalBjTWJ1bWMrZVR6NWxKODU3a3hj?=
 =?utf-8?B?d3QxRktMVnBudmtWbTFGTGVsU2FWeUlNVm5iVFM4MGtTMEJ5UU9PaklVZDFZ?=
 =?utf-8?B?K1pOZkMxeW5GdTJWYS9nUmVTdEhFYTZHaW9uNWNIeU4yajJ5U3YxbzNQQXFZ?=
 =?utf-8?B?UGFXdVoyOVNOYXBvaW5CZkNDNnZtUk1wd3drZnF0Tmg4a3NZZjhoVnI3Mkk5?=
 =?utf-8?B?RFphY1VZTlRMNW1aMmNqZEpGaEMvNlZlNm0rcE02ckxSYWFqb2J6M2NOUjVi?=
 =?utf-8?B?R3hsaFNuWUJnQTVEbVZuYUJ3NkxZTlpVdUxOZjJMZzVvUUpkdVkzdkRodkJy?=
 =?utf-8?B?ZzFvZjVmRlkzZ0NhYllqanNTME5taWZNYngzS3Fnb2R2cEVUdGxXYjd3aSs2?=
 =?utf-8?B?NWdyVWFlV2s0Qjc1dDB2R2pLQkdkcnFpUjN2R2ZqN3dnTk56cy9KSzVNVXBu?=
 =?utf-8?B?ZFYyWWg3RzVPbGs4eTJLVGNqRzJCenNxMzJiME8xOEJwVUx6eXRLTEdRc3lv?=
 =?utf-8?B?ajQrdVZuVWlZbzRJOHMxcEFqdm0zNDVyYjhsZ09mWExvWDhDYm5FQXRlWFRz?=
 =?utf-8?B?VlFUQ2g4Q1FZNEJBTXRZa3BNNTF4S2dYVlVPZGJNZFZiY3VFY2VmYjVZUkFo?=
 =?utf-8?B?VkVuSnpJb2lLQTZIcUEvQUViZFJSdHoxMkgzQ0dEUS9EUUhqS245TVM3OVc3?=
 =?utf-8?B?aGNYWUVJMW5QOW1KMnpndmtZTytZT2ZFQWxhdlA0VkxBaFBJWjVrRThiTTlz?=
 =?utf-8?B?QldMZ2Q2ald0anJEMTRXNkhhZDgzdEwvQVh6VzNrdTdldlJSeTBEVnpoSncz?=
 =?utf-8?B?d3NjejdJeTY0SnhYakwwc2FsZDc2T1pHLzE0ZzhMa0hNTEdxOU1lWFVKUnhN?=
 =?utf-8?B?QTJMMTAvL2hrNFFkTjZ3UFhVK1lJUHc0cW9FUGFIa2NjaTYrdnR1MkRQZVhT?=
 =?utf-8?B?Ukl4bnhiZlpqeEZhZmVRRnZTYkh5dzhvWDA2MVRGUkR0aEE1VDZJbFdNS3RL?=
 =?utf-8?B?bmFaK3IzWmN6NWNKZVFxaFRQRjNlb0ZTV0xmYmVWeFVqc0RoSy9ZN2xkTHUx?=
 =?utf-8?B?V3lFVTJlUUdrdmpycU03RlE0eW5yL3ZtckhmdWVsME9Mamx5bW1DaFpHcis4?=
 =?utf-8?B?SDRLTnpkVFB0a2lzZHpnOXlmS29GN2FMdXYzYTEvOVp6NjJiTm9tOUJoUHJN?=
 =?utf-8?B?dDhRbzdUeFYxZHpKYlZRQmRmRTRNRjBrRVk1RXNtVC9aVkhmK3VwT2EvbFZv?=
 =?utf-8?B?ME10Q0p0MC9KbVBsNUd6Q2Nocy9qc0V5aURKUzZUeG55T0NQYVJSSlFFQnMy?=
 =?utf-8?B?UWZrRGtXWkJ4UzMzNEt6bnM5Y3dQSlNiL3UvTUF4THdLTldMNGE1RGd2R0d3?=
 =?utf-8?B?enl1UkpyODJQNmFZbTFiaSt2YzBnNzE4VE1rK294eE1VM1JlcDRNZE8zdGww?=
 =?utf-8?B?elJXTGZ4bjBiRWs4TFJzdjUvd1NXMStvRWFYVGZXYXNvUXhRejdTazhRNmRr?=
 =?utf-8?B?OUpUUXg5RmpteW5MVmpZN2tBVzhBcHJ4TWdiY0xDa2FFakZ1d1dBNzVqbDhJ?=
 =?utf-8?B?VXBmRFJXV0h1UFZITnRyRjI5QUZwL3lBSGczMHJUT3BrMjhNcEdobGE1WGVF?=
 =?utf-8?B?NVN4bHlHb2w0N2t6SGJEd1N0MHllZ2JBdzFaZkZqUDNuOG85ZFc3WEVBK3hv?=
 =?utf-8?B?Z2dIeXUxWmdXWnkwVWFLVDNyNldsU0lVc2xwOUlQVnlnWHlhSmFDa2traWph?=
 =?utf-8?B?QUlXYldjLzJQSUhBVVpOVG1ZU2JjbmpoMHc2eDU3U2V3MnNIclg0TnpiZGlD?=
 =?utf-8?B?SkdVMVhwUDlTdmhwdCtPRTVuOTVjTzhhcEN6QmJDS3ZQTHlPak96ZEVFdlhU?=
 =?utf-8?B?TXIwRVJZSk16SXFZN01RZGFVVFlFS1NGUld2b2xIMTh5MEYyc1NOVTE2RkVW?=
 =?utf-8?B?WjA0R3dlTGhhc3ZHSlkwbFBoK2M4V2t2L3I1RWZvSlJiL3FGVm80aUx2TTZU?=
 =?utf-8?Q?3BenUkDjj5xmolmgXUbnueuN9uflxyOYJPqTM424EJ89K?=
X-MS-Exchange-AntiSpam-MessageData-1: NvvQHA+opM3Ftj2h4b8eDCeUUGqFMaDp3kQ=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b8323f-22d7-4815-496d-08de9ae7e64e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:09:52.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsH2FbpYG6bw/5JVRSa8yWwrwuih9HN0DCk0w4mOZEdXqnVuK4virGkP15KAv6NUGi4gdvzeyv1Mj9B6sQR3/ea92UXDxXm+bG/bZr1DP10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_051003_674322_80CFEA81 
X-CRM114-Status: GOOD (  13.73  )
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


On 4/15/26 11:47, Christian Marangi (Ansuel) wrote:
> Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
> <lorenzo@kernel.org> ha scritto:
>>> Enable spi controller used for snand memory device for EN7581 evaluation
>>> board.
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Hi all,
>>
>> it seems this patch has been reviewed by AngeloGioacchino, but it has never
>> been applied to linux-mediatek tree (or at least I can't find it). It is marked
>> as 'New, archived' in patchwork [0]. Am I missing something?
>>
>> Regards,
>> Lorenzo
>>
>> [0] https://patchwork.kernel.org/project/linux-mediatek/patch/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
>>
> Hi,
>
> friendly ping here. There are lots of patch with review tag and ACK
> also for 7583.
>
> Any chance someone can ping maintainers that take care of picking these patch?
> Or someone that can reply on how to handle this? Maybe we need to sync with
> them? Lorenzo (and also me) are fully maintaining the Airoha ARM target also on
> U-Boot. Also on OpenWrt this target is starting to get traction and is
> getting used
> there, so Airoha is not considered an abandoned target anymore.

I think the following Airoha patch set has not been picked up either:

[PATCH RESEND v3 0/2] ARM: dts: airoha: en7523: update dts

MvH

Benjamin Larsson


