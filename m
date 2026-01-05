Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E05C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA5Eb8jjhZAFgp1b3JMkV/ZsS3xVH/UHBSvLtkEWLts=; b=2yA7jNevHbkbfWj0lkSVCMQ+5a
	7tlsIg4NoJmqYikANKi6hirFbanOzau/SvIcQy7jrzT8xGcwdgXXYpJie79vdS4Pgmuozigr+dPvC
	cglT9hBkDr4/rxgRR3bBCauGZTbwMyegaSO6yAohAEWW6ZrdB8IX9fR9zgjfSHv2YySGqHSpncWCD
	GsWeOi0cD2FkGza4qTkbPVbfgLgGOQz7ompA29DEHVLFNieW2IeNMu6yxC8tpjTBMchQyRmlTKIDl
	bqRTEQV6+lQNfbLHz06wpDEvY8b7VKIAJrm0InxSHJm5EynMkwHVmUgWyCaJCFfJERFDrQJ6+KoVw
	MtPeQ2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmLF-0000000BbGb-0qti;
	Mon, 05 Jan 2026 15:17:57 +0000
Received: from mail-westcentralusazon11013024.outbound.protection.outlook.com ([40.93.201.24] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmLC-0000000BbG9-1bjL;
	Mon, 05 Jan 2026 15:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYZcu8zxyEPBSPdzXwarH7YHMCY0IKLHswLHcejxoI5CYhvHn4VB3sV4trI6f0ZF5cXJUC5g5Xx2e3dG0xoQXxcC48KG76ExImWRr8yHb9bOJQl6afrWsKBhk3HDWiMcQklb3Uu4IQLbSuD07El5Y4wpa7lBKsIZdmj+lHkJ5xdM6YiB6F9V6DZLaWzCIoWJLs+/NvDXHoyCnIezUhKsJzyY6WN2A6ENWVCWwPiYv4wxvNySZm4jAWTwtEEjOqBvgHKGbazvrpdshM6+4iei2KRh867wcl7YmVGnCjHdmzIIdtGw12YZNlqwvwZl9rL8vKyXvxCiXidorNZZoCnxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA5Eb8jjhZAFgp1b3JMkV/ZsS3xVH/UHBSvLtkEWLts=;
 b=P2k2/zNXSca3LHIlV/FMBo3BTDX4vPNAe46XW64zXpbiuO57mOWSJ9e6XtVOP46NyQTcDDcKYH+9HPvoAROHADqS2bsHtcH91or+L3vjBiLxweNN/EToNDm1SfOmAradmEQoH1tp7EV6xso764LFI5sS/iYzFSYd6PNZLgjzF39duteT3LOsdfPCxNIbrxibGtZ1lSZkfS9j4W7BN8GA98KRNrFrOjrPfxQUG4sLkXfsuxG3UQzNwpAxvNL2yZsgM79VlnMWrqLthAWe3DrOgu0iyXB3yTaHm6OTfb72dIb2GB5+qkM4jiC/w+LD16xm5yKDtiCd3hDgGwJBVIaoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA5Eb8jjhZAFgp1b3JMkV/ZsS3xVH/UHBSvLtkEWLts=;
 b=rCYpzVeXeJKqEbrDFANEzCnXozdegdJpcbaqHScYHLQmHNitQjly15sZ/y3A4G3ylqHvZj862hq9/NSg+DUTOX8+FC1/yJKtmsupv8yJymN+eTLfjSqzP7Yn7jHVrNl5KrqF+CrbHIoKnNVQKrIcN1W4q/WlvQUq93Tyvuwyk+g=
Received: from BN9PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:fb::15)
 by DS0PR10MB8031.namprd10.prod.outlook.com (2603:10b6:8:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:17:47 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::58) by BN9PR03CA0040.outlook.office365.com
 (2603:10b6:408:fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 15:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 15:17:46 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 09:17:43 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 09:17:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 09:17:43 -0600
Received: from [10.249.139.123] ([10.249.139.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605FHcXm1349835;
	Mon, 5 Jan 2026 09:17:38 -0600
Message-ID: <81639035-8fc5-4ee6-b0c5-4cfdf5b2425a@ti.com>
Date: Mon, 5 Jan 2026 20:47:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: cadence-torrent: Add PCIe + XAUI multilink
 configuration for 100MHz refclk
To: Andrew Lunn <andrew@lunn.ch>
CC: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>, <krzk@kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
References: <20260104114422.2868321-1-s-vadapalli@ti.com>
 <20260104114422.2868321-3-s-vadapalli@ti.com>
 <7fd42221-d602-4ce4-9f7f-6754ed91e7aa@lunn.ch>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <7fd42221-d602-4ce4-9f7f-6754ed91e7aa@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DS0PR10MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3399ee7d-b471-4f63-fa45-08de4c6d951b
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei8xdlVLdHBFaXRIbmpyUDlkbTNNdGtLNEFpTWxpaHRibU93SzR1WWs1cHRa?=
 =?utf-8?B?dXlKV0ZlNEpvUmQ2bzNFall0dGRLZ2tOeHpxQnFraTNKejcyOUZhWVhYdktT?=
 =?utf-8?B?ajdzWTUwejk5OTg0aG92bTBqbUdXTEIzR2ZCeWk3OUc2NkVxNTAvVTNEb0M4?=
 =?utf-8?B?R0o1TXFDWDQ1dzd3djRXRm53Ym5sQjA2VkJ5ZHd2ODJKemNHL0UxbFhZNG5B?=
 =?utf-8?B?QUxOWlMzNXNvTkxnWjJsMytmZjVIQzhjOW5hVFpqYlh2ZHA5Q0FhU3c2SVZi?=
 =?utf-8?B?V1dUVE8xSUFDK3NiWFQrL0N3ZjBuUGg0UWptR0laRk9oNFBiOHRsblhKeWhO?=
 =?utf-8?B?QjlxK0FHNklDNUtzN1FOemw5S1p2ZVNzTy9nZkRPVmRTZUpIN3JWNFF3ek50?=
 =?utf-8?B?OUN6SGpJYXlMTWFxYXNWZlJUYjd2Ly9CWmNMUVZsUUJRaGR2aTV6U1NvV1Jz?=
 =?utf-8?B?bm04R1pYQWcrMVpwSHFkYVBqdDR1T2ZmcDBQZHRzU3VqVnRpYUY5ejBkV0U0?=
 =?utf-8?B?NXQrbTFkNytTSnE4YXI0UnBuMkQzOWV2aTQ0WEJtZGxsYWxIQkZqZzlyVmpm?=
 =?utf-8?B?S1pzRUNxeDdMeTVzNEFVTDcwRzhhMTNPWFF5TG1pRCtWMDIxM3F1TlRvRllQ?=
 =?utf-8?B?RVh3K3RLaGRrZ3gzRGpteUhtUmtwelRoSExFQkh3ZDh5K2FRWGltM3VrelJl?=
 =?utf-8?B?UVJWVzZHQUVQZDVVa0ZFRUF3aWt6UVJPWTZzSjlCN0Q5dHZyc3BweDgralVB?=
 =?utf-8?B?RUZBK2tEMWxRNzdMamxVc0pwS1J5Mm11MDN5bXl2TVFmT29PS3BNcFZnaTB0?=
 =?utf-8?B?MGdEWjYrT2FYM1B2Q1dPdWpQdURPUElzeG9WaW5uSGhSRDEycVdiR0Q1cXNN?=
 =?utf-8?B?Vk9qd1JPV3djVU9CemU4ckE1VGdtMnpBM1REYmFRdmdJNTBSdS9TcTRUVjMx?=
 =?utf-8?B?blJhU25ONGFuaks3WGlxdjkyUWE0SUREU3ZjaTc3b3Z0ZHdSdDRldnd1NlFt?=
 =?utf-8?B?Y3pwcW9DRzN0cm5xMG1vdXRjTHRjZFVpd2NtaEZ1Nno5MmgxdFJqYzNqWWhl?=
 =?utf-8?B?dkF3UzNPY2FXTjZiNGFLQ2EyZFpjTEgzWXJjN2F6L0g4bWNwMzl1U3dOUFZQ?=
 =?utf-8?B?RTh2UkpaU1A2cGFYbGZ1eUpuSlQzV3lZbnNLdW11Y1JWSHNRWXFRRlZ0aFJN?=
 =?utf-8?B?d1FRdjNNSlp3bUUwaG5vMVRob0JkSHRueXNGQXlaZGhXRUNoKzd3R0MzVlln?=
 =?utf-8?B?ek1RblpVRUVTMi92cUgwQUQ2RGNjazMrVldsOXNOZkhZVHFycmFMbWhaaHAz?=
 =?utf-8?B?U0hRNzluUGFsTVorM1NVaWlzY3Zqd09DME5rRmo3MjlUMFo0blFuT25sc0JD?=
 =?utf-8?B?dkZzWnMwTUo1OS8rNHM5d29oZkM0cTgyRUVma1ZlMXF2VFFtaHhRNmRUdGlF?=
 =?utf-8?B?aXNNbUhZR3o2SlgranFrNDl0VVVoL0huS2lMa3QzeE14Qk9tZHpoME4vUXVm?=
 =?utf-8?B?Z2p6enZYNkVYdnVrVlJ1eXE1RVcyMjZCcFNxWWRxWFBiUFNlQXZjbVpCNlZ0?=
 =?utf-8?B?VHozblR2enMvMm5Dd2hCdG1PNWdVUWE5STVKOUx3dWI3MG9PU09Qb2ZMZm9a?=
 =?utf-8?B?N1REVk5ZdzZKQ1FRM1Faa3JpM2RiZ1l6a0ZnbFBXcUtRa3AvenE5TWNEdS9I?=
 =?utf-8?B?SzVMMTFWVW9vYlhucE9wOEJlUk9FejNPK21kbnlkT3pJRHRIVTJaTmlhc0hI?=
 =?utf-8?B?aUh0QmdNNHJVV3N2MDcrYXB6L2dWSEZLTGVIQUVFTkhzcFZzM3Z5Zi9TZS9T?=
 =?utf-8?B?MVc3NlZRZWhjVkpqY01XQTJhMzhwNGVqV21BZHJTVFdxeFBMWDFUenFYSlZF?=
 =?utf-8?B?NnY2QnozVmY3ZEdHOGVheSswTEI0NVdpWHA0cnNCSTMyVGYxOE9OVUlUNlJY?=
 =?utf-8?B?K1NxeXdLYmRmTVgzakNUNmh0TFdOd0o1d2VXUVF3cWRPYndRV0kwMTJ5czhE?=
 =?utf-8?B?emVET0pIR2thVXlFNC9VM29NNkxxZHNkT3g0MEJJUHhoSVRkbHkvNWFzejlJ?=
 =?utf-8?B?UFVNdzlRN0RQWng5UWxMVlNYZmp5VWlvQWdpWUlPcTduMEQySzZPZGY4aXNu?=
 =?utf-8?Q?WCSo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:17:46.8748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3399ee7d-b471-4f63-fa45-08de4c6d951b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_071754_456570_695D6518 
X-CRM114-Status: GOOD (  17.80  )
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

On 05/01/26 3:27 AM, Andrew Lunn wrote:
> On Sun, Jan 04, 2026 at 05:14:18PM +0530, Siddharth Vadapalli wrote:
>> From: Swapnil Jakhade <sjakhade@cadence.com>
>>
>> Add register sequences for PCIe + XAUI multilink configuration for
>> 100MHz reference clock.
>>
>> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>
>> v1 of this patch is at:
>> https://lore.kernel.org/r/20251224054905.763399-3-s-vadapalli@ti.com/
>> No changes since v1.
>>
>> Regards,
>> Siddharth.
>>
>>   drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
>>   1 file changed, 136 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
>> index 37fa4bad6bd7..f0d870886cca 100644
>> --- a/drivers/phy/cadence/phy-cadence-torrent.c
>> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
>> @@ -300,6 +300,7 @@ enum cdns_torrent_phy_type {
>>   	TYPE_USB,
>>   	TYPE_USXGMII,
>>   	TYPE_PCIE_ML,
>> +	TYPE_XAUI,
>>   };
>>   
>>   enum cdns_torrent_ref_clk {
>> @@ -320,14 +321,14 @@ enum cdns_torrent_ssc_mode {
>>   /* Unique key id for vals table entry
>>    * REFCLK0_RATE | REFCLK1_RATE | LINK0_TYPE | LINK1_TYPE | SSC_TYPE
>>    */
>> -#define REFCLK0_SHIFT	12
>> -#define REFCLK0_MASK	GENMASK(14, 12)
>> -#define REFCLK1_SHIFT	9
>> -#define REFCLK1_MASK	GENMASK(11, 9)
>> -#define LINK0_SHIFT	6
>> -#define LINK0_MASK	GENMASK(8, 6)
>> +#define REFCLK0_SHIFT	15
>> +#define REFCLK0_MASK	GENMASK(18, 15)
>> +#define REFCLK1_SHIFT	11
>> +#define REFCLK1_MASK	GENMASK(14, 11)
>> +#define LINK0_SHIFT	7
>> +#define LINK0_MASK	GENMASK(10, 7)
> 
> Why do these change? It would be good to add an explanation to the
> commit message about this, because it is not obvious why these need to
> change.

The 'key id' is supposed to be a unique value defined as the following 
Bitwise OR:
REFCLK0_RATE | REFCLK1_RATE | LINK0_TYPE | LINK1_TYPE | SSC_TYPE

The 'LINK_TYPE' parameter corresponds to the protocol (PHY Type). In the 
phy-cadence-torrent.c driver, the following enum describes the supported 
'LINK_TYPE's:
enum cdns_torrent_phy_type {
	TYPE_NONE,
	TYPE_DP,
	TYPE_PCIE,
	TYPE_SGMII,
	TYPE_QSGMII,
	TYPE_USB,
	TYPE_USXGMII,
	TYPE_PCIE_ML,
};
The last entry which is TYPE_PCIE_ML has the value of '7' (TYPE_NONE is 
'0'). Therefore, 'LINK_MASK' happened to be a 3-bit mask:
	#define LINK0_MASK	GENMASK(8, 6)
	#define LINK1_MASK	GENMASK(5, 3)
With the addition of TYPE_XAUI in the current patch, 'LINK_MASK' has to 
be extended to a 4-bit mask.

The 'REFCLK_RATE' parameter corresponds to the reference clock rates 
defined which are again described by the following enum in the driver:
enum cdns_torrent_ref_clk {
	CLK_19_2_MHZ,
	CLK_25_MHZ,
	CLK_100_MHZ,
	CLK_156_25_MHZ,
	CLK_ANY,
};
The last entry which is CLK_ANY has the value of '4' (CLK_19_2_MHZ is 
'0'). Although the existing macros defined as:
	#define REFCLK0_MASK	GENMASK(14, 12)
	#define REFCLK1_MASK	GENMASK(11, 9)
are 3-bit masks and can fit values until '7', for the sake of 
future-proofing the driver (the SERDES Hardware supports more reference 
clocks which are not yet enabled in the driver), 'REFCLK_MASK' has been 
extended to a 4-bit mask as well.

The shifts associated with the masks have been updated accordingly.

I shall include a summary of the above in the commit message of the v3 
series.

Thank you for reviewing the patch and providing feedback.

Regards,
Siddharth.

