Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C9CCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSXSWjcCzx90fsNvjpgIyhSyPAcVTeWUx0L2jBqE6/4=; b=JfmJAqeddW0TNc70EdRdN51Nvs
	D7A7tGuIJ9PdFXvSS63SiwKBvcV7a1lO++sl3Xs6sSL4BQ1OGwGqwb3vzT+Toi22zaWGd2AFNz6et
	MdShP6A8/jEeH2xcEKYRtbJU28UtfOmJe764VZoAy/ASMODtyZYbO05QMM9Qx+J5TeDBOM8kx8yYD
	ml97lhYk204SCt/JkQRRUZVgQWjPtcxGRz8Eq7TnXte+4a8GiDvtwtnKaiEirEDE2I+rtnKCAiUFQ
	PiNpyBm6lPaOdNfgmr5EMQOy1+DNEiSHtGKZIehKi7ZqKqT8tjkO41seBMHFH5S1reNUjQYcTDX8/
	mwlb8XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwl-00000002UYx-1uoS;
	Tue, 02 Sep 2025 22:57:51 +0000
Received: from mail-bn8nam12on20622.outbound.protection.outlook.com ([2a01:111:f403:2418::622] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utU5J-000000010fQ-0uA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm8sfZ+tTPVUAcFH+Egy664KEdxomMXn+tmqRQxvQ+pS+yBT0nup/MzKCW42SSfTXsXyYpkU8fVXbMXMV+EAR8INQLyhWawShmRFhgiwmNXyee61k7lR/EMYPbhC4lne3FXrbxLRoRkh2W8W/zaw9MX5Y8oKAFKtBTB1EARlKIAYJrIGyhtl6MfjgJKzrYLmuGHm7trGvgUwPh0EZ++RXhYN490x8mCmCGw2XYUe3FcIxWHcdDEnMAzQXZZDG6yzah7owwIgKLRVjV4cPPMRkexNsUZA+gdx4ksQg5bwA7tZNIeUobV/sxVagFjeMxL0swgCoQj5ki73TCPkxCun1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSXSWjcCzx90fsNvjpgIyhSyPAcVTeWUx0L2jBqE6/4=;
 b=jDASQ4WIBqp7Qb5CrWgLwHIh7eEcE0XWB6ORJLbvoSgr6EJWjaityQBlB0fjlYLgW3goEEz9MKyT4OUZu/J1Lk9HeFpyD+dwXFt8Tt2cKPq4iDjJKCdrZCm1ga408d0xRa1T6cKxFQSEv7K45HV7pYDgqP2lZfQCFHhKqWPIqgiedhcPu/677vfLGy2foxwQYYL0xCydLG2t7pwrAu1KJZU24KCAop1lX/HpciScm4KiSr0nNWZPajZEWw5OV8zZXRqlNXX/MOvW+qMSpySfStm841MAzePwHvGJI9XQ9z1h+rahNObX1nl1K5uE47xlK33jHzVy7LSiKYiACHrYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=amarulasolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSXSWjcCzx90fsNvjpgIyhSyPAcVTeWUx0L2jBqE6/4=;
 b=Gy4KtLbn+gRwbtF68dhLDyaxLkSMjZp9sGmB0aQ8OQL4Qr3G39Hpgc8AluASBZApkHINSyKsif9sYuAOLsrPRfnUH8ZiubKIfMhesOkyEmyjJDMT3S+OqQjei9xlOL95STx4n05zacVXWDvc0ZB8GKDh9L1f2zZkv9dFZKWqleQ=
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 16:42:12 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::23) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 16:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 16:42:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 11:42:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 11:42:08 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 11:42:08 -0500
Message-ID: <c37cf0cc-e15f-4968-0a75-56481fa744e7@amd.com>
Date: Tue, 2 Sep 2025 09:42:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dmaengine: xilinx: xdma: Fix regmap max_register
Content-Language: en-US
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"anthony@amarulasolutions.com" <anthony@amarulasolutions.com>, "Xu, Brian"
	<brian.xu@amd.com>, "Rampelli, Raj Kumar" <raj.kumar.rampelli@amd.com>, Vinod
 Koul <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250901-xdma-max-reg-v1-1-b6a04561edb1@amarulasolutions.com>
 <DS7PR12MB59581DE67ECA59637F73D4F9B707A@DS7PR12MB5958.namprd12.prod.outlook.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <DS7PR12MB59581DE67ECA59637F73D4F9B707A@DS7PR12MB5958.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2219c7-b7b1-455b-3681-08ddea3faadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2RKeG10aXRvbzlIT2s0V3VNSlIyZHMyc1BqMStWMFdRdkQvSEI0MGpGQUM1?=
 =?utf-8?B?bnhGNXVIbkErcC9IT2ZwaFFiOGw2RU1RTWpPME5wNENTNnJSMlRVNHRkejc3?=
 =?utf-8?B?NnJJakFONG15b2tYZ1FDQkFxT01SQmRPSVMxZ0FBYzZFSlI3MGl5cjZqSUpu?=
 =?utf-8?B?SUdrMGlqZzdvb0cxU2VmNlowMkdpbGd0QXBwblRmQTFhZGFPcmtUQ0FMNzhQ?=
 =?utf-8?B?WGRWdEVJeFhVS08zVHB2dlNEUU44dXVrbzNSaDdmSFFGdFRQV2hOQWo3R0tj?=
 =?utf-8?B?UDZ1M0NqaUwxMU1pNDJKQ1podVFCRG5sMWZIbFBYRHdoMitEVTQyZWtBb0JM?=
 =?utf-8?B?M2VjSmk0LytyM0FIUG9nSFJ0TEJPVUtCQ3dDZGIxYjJrZlJKWWdBbXJuZ1ht?=
 =?utf-8?B?VUFOYWZCVnhaS3lCUmxQU0pYRTBqdTJTL1FuVUVqeUgzRWc5Uk1OcElwYWJ3?=
 =?utf-8?B?RElkeFZoeC9URCtFOEVaTk5oK2h2QXpGSlpaTVMvWUxCL0FaMGxGRmFYYSsx?=
 =?utf-8?B?clorZC93VStYT1F0RFNOaExuY204Q0x3UWgzM25BSXY3VDZyRlJvdUt6UkdU?=
 =?utf-8?B?M2lSayt5Z0oyeWpZT1BuT1d3ZlNzVEthaVo5dXZINk5ZWW9IMzJjN3lGVnNy?=
 =?utf-8?B?bHN4cFlGSzlCMlo1RU53UGZnYWhNQ0ZaMG0vai9VYnJSOWRGeUloN3JCWjht?=
 =?utf-8?B?N2FRUGpFWXR3KzBEQ3loakpiZm9XT1lKcFUyMG1mSEdhUTdRbnkvcy90aU5s?=
 =?utf-8?B?YkV3azNwa2M0SFNDU2Z2NGVEK0VkSVNseE1mbDBLNzREN3NJT0VFTjRMU3JW?=
 =?utf-8?B?NlV5SG0zY2FnRGF6WUIyTWM2WWRpV1dtRlpGYXVmZG50a1ZmTElhd0txNFFE?=
 =?utf-8?B?RWhjT0NmTjRpWWtsQzJkU3VUNlBlODhVdlNSczF6OUJqbnZGaTZpeGtNNTJ3?=
 =?utf-8?B?UHJURHE1NUVZcGQ4dUtrREVtc2RrRURGTHNtUUtmblF3RkxjdWNrU1Jad0Q5?=
 =?utf-8?B?bHNwd1RyVGZwZjVISTVFcngzMEllTXRIdDltY1VlY1pFalVTV3dWU2NCaU02?=
 =?utf-8?B?aXd4eG9qQlo1aERHNVFjMmF3TTAyVk9BV2Z6OWIzZGJNTXQvZFM2UzU0WlNW?=
 =?utf-8?B?RGtvaTlLTHNhVThObWYrMzhRaXR4VlM1VThLMGJEcWVkTXNmVXFxMkZkeUdQ?=
 =?utf-8?B?MHBoUmpFckJ0ZGRjTC9sUkVLQkFuWGdrMnJ6b1RLWndaQ0crQ0tvTUVYMWNP?=
 =?utf-8?B?UUd2eGQ3QVFlbHFSdk55ak5BUmNqaVRaSFlCTVVVNkd5OFZJa3VsdnV4WjZ1?=
 =?utf-8?B?dy9JL1AxbElJS3RmeExHRkd3NzllUEFGTlFPb21QV2VmTDBlakpPL1Zqam43?=
 =?utf-8?B?QmNXcUx6LzhFUGhmL0hCTXFjM0RLSUZwSHU2OS84ckoxVmxmZmtoQXFmU0py?=
 =?utf-8?B?UVZyYzluNGp4Q0FaVzZiSExXMUlHa0YrVTBEeGUvSkdFSnFZUlI2N0ZaTldX?=
 =?utf-8?B?Vy9LSnFROFRmZ1lNSjl2Z1BicTdzaFVuNm1TOUEzdlJEbmJxR1BnWnZnWmtE?=
 =?utf-8?B?enJGT0pVeVhua05CMTMxSkQxSGNOVmd4WGREZ0wrN1dPYkhMb21JV3RnSGF5?=
 =?utf-8?B?Z2lpK3R0bnFCNFBaTkt6UjRYcCtVOFkvNE93TUFOcTB0RG9NU0pNUUJ0M256?=
 =?utf-8?B?dkVucUcxYmZGTjIxL0ZtNDNiN0ZGOUQ5ZHZ1Q01zaE53MGxtSFBIRTFHbVdK?=
 =?utf-8?B?LzJvejVNZXIvaVJucTNtM2ljSm1rR2MwSFY1UkNRQzRvZ2k0dzFkMUNQUmpm?=
 =?utf-8?B?aEdZYkdqWnZlZlQwOGVCS1VmU2YzMlFvK0hGaFI5U3hnS0VNbjZpZTVxQ2dP?=
 =?utf-8?B?eFhNalpjTHp6YVhtYWUyc2o3R0g2cDU3UnRlRGtoZlo4SWpjSTNIZDlHU0dJ?=
 =?utf-8?B?MUlTYW8rb1BLV3A4M3YzU2drb3ZpZDJYQjQrV08yb2E1TzdBTzUzNkVXOVg1?=
 =?utf-8?B?VnlMK2pIV2tjTkFYRmx4ZDB6K2I4ZDJPbC9tcHNTZE80WS90TG5FRGI1QmNt?=
 =?utf-8?B?dUNvYkdsVnF1RnQzM25jOU1VZG9XR08wVEtvZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:42:12.5425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2219c7-b7b1-455b-3681-08ddea3faadb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_094217_259657_13813908 
X-CRM114-Status: GOOD (  18.89  )
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


On 9/1/25 09:37, Pandey, Radhey Shyam wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>> -----Original Message-----
>> From: Anthony Brandon via B4 Relay
>> <devnull+anthony.amarulasolutions.com@kernel.org>
>> Sent: Monday, September 1, 2025 5:07 PM
>> To: Hou, Lizhi <lizhi.hou@amd.com>; Xu, Brian <brian.xu@amd.com>; Rampelli,
>> Raj Kumar <raj.kumar.rampelli@amd.com>; Vinod Koul <vkoul@kernel.org>; Simek,
>> Michal <michal.simek@amd.com>
>> Cc: dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Anthony Brandon <anthony@amarulasolutions.com>
>> Subject: [PATCH] dmaengine: xilinx: xdma: Fix regmap max_register
>>
>> From: Anthony Brandon <anthony@amarulasolutions.com>
>>
>> The max_register field is assigned the size of the register memory region instead of
>> the offset of the last register.
>> The result is that reading from the regmap via debugfs can cause a segmentation
>> fault:
>>
>> tail /sys/kernel/debug/regmap/xdma.1.auto/registers
>> Unable to handle kernel paging request at virtual address ffff800082f70000 Mem
>> abort info:
>>    ESR = 0x0000000096000007
>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>>    FSC = 0x07: level 3 translation fault
>> [...]
>> Call trace:
>>   regmap_mmio_read32le+0x10/0x30
>>   _regmap_bus_reg_read+0x74/0xc0
>>   _regmap_read+0x68/0x198
>>   regmap_read+0x54/0x88
>>   regmap_read_debugfs+0x140/0x380
>>   regmap_map_read_file+0x30/0x48
>>   full_proxy_read+0x68/0xc8
>>   vfs_read+0xcc/0x310
>>   ksys_read+0x7c/0x120
>>   __arm64_sys_read+0x24/0x40
>>   invoke_syscall.constprop.0+0x64/0x108
>>   do_el0_svc+0xb0/0xd8
>>   el0_svc+0x38/0x130
>>   el0t_64_sync_handler+0x120/0x138
>>   el0t_64_sync+0x194/0x198
>> Code: aa1e03e9 d503201f f9400000 8b214000 (b9400000) ---[ end trace
>> 0000000000000000 ]---
>> note: tail[1217] exited with irqs disabled
>> note: tail[1217] exited with preempt_count 1 Segmentation fault
>>
>> Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
>> ---
>>   drivers/dma/xilinx/xdma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c index
>> 0d88b1a670e142dac90d09c515809faa2476a816..cb73801fd6cf91fc420d6a8ab0c97
>> 3dcdb5772f5 100644
>> --- a/drivers/dma/xilinx/xdma.c
>> +++ b/drivers/dma/xilinx/xdma.c
>> @@ -38,7 +38,7 @@ static const struct regmap_config xdma_regmap_config = {
>>        .reg_bits = 32,
>>        .val_bits = 32,
>>        .reg_stride = 4,
>> -     .max_register = XDMA_REG_SPACE_LEN,
>> +     .max_register = XDMA_REG_SPACE_LEN - 4,
> Nit - Better to change the value of #define itself and we can rename
> it to XDMA_MAX_REG_OFFSET?
>
> Will wait for Lizhi and Brain to confirm if XDMA_REG_SPACE_LEN - 4
> is highest valid register address as per IP documentation,
yes, it is.
>
>>   };
>>
>>   /**
>>
>> ---
>> base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
>> change-id: 20250901-xdma-max-reg-1649c6459358
>>
>> Best regards,
>> --
>> Anthony Brandon <anthony@amarulasolutions.com>
>>
>>

