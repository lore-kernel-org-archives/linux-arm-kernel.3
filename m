Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67D5CD040D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJxOGy6E5k1aFreDxsmtUuqHx7FHQDst8rgzpeTnPl8=; b=R09OULeB4RdSUDyn5iVsxFSFBk
	PMRQ9nrZkltrTyybusie5JBHRNNQ7TQd4ynp9e4UbApOhbw/+BwJi3MX8Xusoeq2jm0DvBj4p/HMG
	WILQ2/FAx2ad5IrRD47rPQ9b4SCBCyPYkA/NH4bi66Jjtx3u4eFjynDNv6+Ze/cOPRTehhXuVuoQY
	oTQqyBIhv/O1xPTq54JCYPqY1rwBnN1P0VHtpAiA+AAJ/BsgD32MlzlvmOtwwbpUC4x5FhFfjXaJQ
	4rcXvKz/RwqFwHOaWoocM4OiuJezXFi762cjdF/lP6WZhIOB/HOS+nAl6UmX2pvQwVnhKgfZnGWNf
	hOwalroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsmP-0000000C9CZ-2kYk;
	Mon, 05 Jan 2026 22:10:25 +0000
Received: from mail-westus3azon11010029.outbound.protection.outlook.com ([52.101.201.29] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsmN-0000000C9C4-0zwc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWVS8lXRVV+/B9az92HE69a/lC5uX1v9DZeo0giBrt7tKe79+ER4U/KpWkrbsdxoeRCVt57V1tjfdw14PvOrqjytjFo4PCrrePBYUrwO/YM7GvPhKanOw52R2v+GKj0/T4ns3PztV+CFZUbKfRIfgoZK1e5WqvPi/4uB2n6dAzVQPw1MbootInLPA79CC0WtmmeoGQhJvFcAib8JeCnkMyAlXjWQ7J97fDW2wf1H3d7ToICJC4YN1k+723aANvjhvigduLB8o6rq52mCDyZQ7QCegFiYsVBmSgyCJxPW21vMzX3XW1OaAkm+aayXVaNCeEvgiFJeY3V/oD1lH3mUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJxOGy6E5k1aFreDxsmtUuqHx7FHQDst8rgzpeTnPl8=;
 b=XSit5wWpkc2JM5/887Qm4+HWQ8Tces0zwp5R5lSTqIEYC0PatbVB12H3S4YOdGo0RwbvLnYhzwLpYO2vFIEfVflBhl3u/Joa2PzUiNXn/fcz9Fdn+Bvt3/ihw1wXctIf3gK5/ton4qESfmS0gPZqc9jVy/hKPJYp0diHHF/fVZ2w5f9IJoJT47nPsTnPsImxXvJyUjlMkPzFwHfjzfpLWO4OspluvS9Fmofy1WVb55NFWYBd39IafFkq+eHJQTeWd/LYnOIqMXp9HfrluiBnJekoGzJUYYZQ3bAX+tVXQfiOlbP9djPap6AAmCFu+drn+gxHxU0CViO4ClUHL3YcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJxOGy6E5k1aFreDxsmtUuqHx7FHQDst8rgzpeTnPl8=;
 b=BtDJHXEKg4oejWzq9AKAyyIzzyeoo63WeW3OjeNiuo5BTjhT2RNOLnyLCodSDDWtusD3dkEG3j4nRvcYLJ7YYe08wfqc9Xxqgij3p+2DF9K1utgOtKQvaoM/nCfBwsh7sG+KRxTcmfp7axd3mNHZZvnOWE0r1ZrvkLIH4mze55Q=
Received: from BY5PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:180::27)
 by DS0PR10MB997555.namprd10.prod.outlook.com (2603:10b6:8:30e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:10:17 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::fd) by BY5PR13CA0014.outlook.office365.com
 (2603:10b6:a03:180::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 22:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:10:16 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:10:14 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:10:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:10:14 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MAE391853241;
	Mon, 5 Jan 2026 16:10:14 -0600
Message-ID: <c477e23b-83d2-4369-81d0-b914089842f1@ti.com>
Date: Mon, 5 Jan 2026 16:10:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP UART
 wakeup from LPM
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
 <20260105135520.rqnysf77ou2kggfh@shakiness>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260105135520.rqnysf77ou2kggfh@shakiness>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DS0PR10MB997555:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec77b14-4c5e-463d-ac16-08de4ca73540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWtvY21zUTRyRnBzQ2JPZlhQaUxTb2ZZZ3UyM041NzdRRmlaMVd0RlRUWGFo?=
 =?utf-8?B?M1hFS1RFZmJzanlVUStNaUJNYWJCSnhnbTU5eWgrdTRBWktxcW5pOFlqRmN2?=
 =?utf-8?B?UWpLMnZtaUkydGU5ZmM0T3VGa0dJWnBYdDJsc1ZnVW1vZmtjMzdwV0l4VVUx?=
 =?utf-8?B?R3hYMVcxendZUm1UYVJJdlcvNlZ6WXMrdHljMnk3Q0NzekFQQVVUVHpRWitv?=
 =?utf-8?B?bEt5S2RhdFp1bzlSSjZGaUZTMmV5MzlTUVUycHVhVUxQTGRrU2tua29xd1RD?=
 =?utf-8?B?b2krUTlCcmwxQUllQlFvN2FqUXRIQmJBYjROUEhVVS9NeTFjYU9zOGxCend4?=
 =?utf-8?B?cE9kWEZBN3RGZFlIKzRNTGUvd0lCRW5leVlMRHZKT253d2lhR3dHN1V3WmpW?=
 =?utf-8?B?WVd4dUlmZUc4aWd4bStvRlRQK0prWWphbE4vcGVmTTJwZUV5NGdua2p2UGc0?=
 =?utf-8?B?ZXpZd0huY0VnMGV6bmdiTW5BVWl3VFJaTWlXMEhxRFVmZFdkZmpIYnhqS1ZQ?=
 =?utf-8?B?UU8yb2J6dUdOY29IQWYvRlJrWDBPWXRieHExVnZneklrL2FtYUtqakZOMUt2?=
 =?utf-8?B?ZzVPTi9GS3pUWmtabisveWVsaENpWFoxMVVXbTJ4dU0vMStaM2Zva3Q1U3gv?=
 =?utf-8?B?V2VQcW51L3RNbnNETnZSNGNqRzFhc05kVTBCRG5jb3dCNS9NbEc5VGpBM3hr?=
 =?utf-8?B?OXpwVlZZSEhJVTQyY1ZmSXQrOXpOOExZS2ZzdFlia2hZelRnSE1QZHB1RlBB?=
 =?utf-8?B?ZC9ibHo1bUZaWmVaN3J2aUFTeWk5WHJRR1pzc2s3NzFTUlZtcDhlNXIvQlNi?=
 =?utf-8?B?N3pRc1ByaU8zV0Y4Q1RyUFdTb092aEwvRDlhNCt3dEFWaTMzM0xqY0JtaTZu?=
 =?utf-8?B?MFhOeXVJZGdkMFlZZS85d0poR0wzSlBSRU14bkFkYVJBYkhEOUxONDZBUGRH?=
 =?utf-8?B?b2RlNUF6RTlhUDZGV0w5M0tiVEpFZXFWa1VNRFZEV1hCa25YUDAreVUraUpi?=
 =?utf-8?B?SitmanBPUWQrQ2IvWkFlNjRsUkNwQThSTHE3eEpGMXZKSjREb2hqdWdSY3Zs?=
 =?utf-8?B?ZFBwRWNub0JzNy9YK3EyUEs3dlI4SEJvNTVMVDRpdmh1OWwza1Zaa1JxMmhh?=
 =?utf-8?B?a0VBZ01HYnFTMWVsVFlMbHZjTlBUbVRlK2RoZWxqeU40dGZzYUtNOEd2VnNC?=
 =?utf-8?B?RGFsRnNIcnBvRDhHaTZoczNMdUxzWmxqS2IxZUZGTTNXYk9mTWZMZnJwMDNj?=
 =?utf-8?B?YllhUE5KNFRJK2NvSndRWE93QmRjUkc3a0xza2FyclVtY2lHY05aU1d2RUx3?=
 =?utf-8?B?bGhndkRFeXFmamR4OTVGQ05mVDh6cDRlY3NvbmJVQys2ZjFoS1AvcW5KSDEw?=
 =?utf-8?B?ekY3dkFTbi9BR1BSaDB2eE94VlhBbkFhOEFhZjBnUUNtNUNkRUVzVElOZFNR?=
 =?utf-8?B?VmhZK1BScGUxU0JoOXovci9UbVEvdkJmTk1LWjF1dDhBMVJ5b1UxMlNRNCsx?=
 =?utf-8?B?dElrNFpPMWNZNmorV2Jockx4dmRMZEJhd0htU2NNa0xOcHNvNC9udWtOTS9I?=
 =?utf-8?B?b0xXVWttcnM3UUxYQlNDbFl4SzlHMXZpdytjbm5hVWdYN3hSc1I4bDBwY0Ra?=
 =?utf-8?B?VFRZOU4yY2lIVEJYN2FLYllOVW1QKy9xbWIxUTlEQlFtcTNKN1hUeU0rdGkz?=
 =?utf-8?B?VEhFbUhsQnRCMkNJcEFYMExXT2k4TTBUQjJ6VHpaenlJbVNFTnlDMGJ3aEJk?=
 =?utf-8?B?Sm9xUUJ0VVhxVVFWUXI5OStSZ1hha084UXBSbVI3aGJUcjdSTWdjcE1sMUE3?=
 =?utf-8?B?eW91N3Rya1g3NHdYbkZsYndTU1FrbjZZNjE5bnVLczd4WnZGaiswc3IwN0NR?=
 =?utf-8?B?aGJQWnZaNmU5N1RFUWd3YWk3RHVlcGFxc1ZSY2l4c3ZrbFRpV09GdHZ2U0Zk?=
 =?utf-8?B?Z1dDa2NUbWgvcnRyYUJZaDJrS2FKZVVxTHc3U0xrZDVTb1BuZG9UZ2V1R3F4?=
 =?utf-8?B?RTRSbWZMOVpwUFBIZXVLUlUwYTV5RkVnMXdhTERyN2hNZlFCa3ZtOUgwaUly?=
 =?utf-8?B?MTNEOCtoY1NSYnJKdVdJaXBjOXBjb2xtdVRqM2lnc2ZxZ1d6aHl5ajBpa3ox?=
 =?utf-8?Q?fjC4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:10:16.8890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec77b14-4c5e-463d-ac16-08de4ca73540
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_141023_315236_D2FB66DE 
X-CRM114-Status: GOOD (  12.63  )
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

On 1/5/26 07:55, Nishanth Menon wrote:
> On 20:51-20251230, Kendall Willis wrote:
>> Change the status of the wkup_uart0_interconnect node to enabled. The
>> target-module node sets the UART SYSC and SYSS registers to allow wakeup
>> from WKUP UART in DeepSleep low power mode.
>>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -359,3 +359,7 @@ &usb1 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&usb1_default_pins>;
>>   };
>> +
>> +&wkup_uart0_interconnect {
>> +	status = "okay";
>> +};
> 
> don't we need to set status okay and provide pinmux for wkup_uart?
> 

No, only the interconnect target node needs to be enabled because it 
manages the SYSC register. The SYSC register configures the WKUP_UART to 
be able to wakeup the SoC from system suspend. This allows the WKUP_UART 
to be wakeup capable even if it is reserved by firmware.

Best,
Kendall

>>
>> -- 
>> 2.34.1
>>
> 


