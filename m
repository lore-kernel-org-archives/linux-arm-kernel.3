Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EEECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmUTeSsbo9OCMMhNgU2dB1uWkEps7yBbFO/KexZvwY8=; b=r72sgtJsUQxCKQ
	TA2m4zYYZCM32efNIL5cyrEbKFIQmhC2T+VT/tFgCImNOdloYgclikSTxzIe/PVFsy4PmH1qXxDPS
	qLnQmtcL7EJY+tqQiqkTLJoNIL6VUGxnk1Kwp+oKW5zfXx6SxlDjhhD32XH5EAk1q9ocBkdlmPbSk
	/qYDo/caC6TEZepQV6Re23AABGLuWNLmWB0YnjHSL+Bogb46iV7VGIR9A7I2GosqXmim0Rppovt3+
	Ohs2aUbJdevA3Al1yThujo55hapLrKOp0o3d4opNCeJmKAt3X/tr52dBsC52mMeewH7MSEDm535Ug
	iP4nxpu02FS9oTmQQgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbn9X-00000005RNY-0Jvd;
	Mon, 22 Jun 2026 22:30:03 +0000
Received: from mail-eastusazon11011070.outbound.protection.outlook.com ([52.101.52.70] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbn9T-00000005RMo-37PM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 22:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ6Dmjw5S0ssfLz//dnmgtZWgXS3r4xgJFPcBQOF9FZDBe6KEs1ZMRorzHVCvGuG/bOnmWECQjemCEQ/cCmjhbcvghM2n5LeQrZiOk7EDj/Cq7IVLj/TN1tuFTeintomN/M609SoFbSCELtVC7fZMCfKB5ggb2gdWBhkuoXWfTYw+YDw9e9FGbbbBY5HvEsEjNc2RezSdohl9X/GGu0vICcgSYTLcExaXXqdCayWjtFM5KdYcAJl1ZSgz5tkqcZasRhtzuVYlYwLRfy1vHCB7wN6By4xwnbSLteep3r0PGgNDByHP4cyS3g/nNSCgOBCw92l+63gAWGaRknORUS8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmUTeSsbo9OCMMhNgU2dB1uWkEps7yBbFO/KexZvwY8=;
 b=vqpRNJHPG8rsK3v2jNiVRIhvwVqzW+9cPWHziPiLDBEQ7/pqHC6ohRfxpclLxFnU/LM87rjH/eYsyOmVoB9JvclIGX1pCscDjleDXA/JkoS6Rl+dcjqM4yDjX1KF12jPhGu6sWigsNOSWq+3j8HbjDmabEnPgIroqRANLSw/GG7av7gCT5a7Gu1eVXPF7CphWQAd8UaKxEkRO2TrQIGc9CSSMR6Sz7EH2G4hcl8XYUsMlOfTA2nue7FCxARNuRifwxJ3GgLgiPEcYjGMwqB4s+ysesqFCnhBXH0O7gEFMHWiHBbx/XBY68CVWkPxYeRu1t7k3yNS6m0OTcRFo/w2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmUTeSsbo9OCMMhNgU2dB1uWkEps7yBbFO/KexZvwY8=;
 b=CdntkL6hFHUwB8XSa5k72NUAfkprLtfo7avn7g70WR/FwryHNJ2yi2Ll/LdpELRpS8icUulcGOGndvnAFTBZCGhxMBtBOuVlrqZj9XwCf+XsT5DRm6aNbi5LtA+0ao/kuf66+IZW/qdICsZC7LPQLjBB5pJCAwr9jHaTC8p3TaQ=
Received: from BN9P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::32)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 22:29:51 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::4a) by BN9P222CA0027.outlook.office365.com
 (2603:10b6:408:10c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 22:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 22:29:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 17:29:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 17:29:50 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 17:29:50 -0500
Message-ID: <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com>
Date: Mon, 22 Jun 2026 17:29:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: Michal Simek <michal.simek@amd.com>, Tanmay Shah <tanmay.shah@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260619163854.410392-1-tanmay.shah@amd.com>
 <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8ae85a-ac86-4381-9a62-08ded0adc6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|6133799003|11063799006|5023799004|22082099003|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: /4rSqSMA3rTLgo8dRLfg3ocp2ye4nthJVhNjiOitPRHdibXGUL0bMnRD3LKHg025+4h4XFOa4g/qqqerP320Zby2a/T+G0kTjh8Oye3hfSBcnSmFdISpnI9fJzeRty19GyNTbQww0C+wF3FNxBLAkwNeIin+3yvTqqo4F+9/wputmWEOBUq34Gj5zfFwmVQp7bszSaF2EcPk9kZ4mP9ed4AMng3u98P3S1ft0AqHbSIL8yUaH/ucy4UZDh3/Vj2ej/gA0FWKYqQ9+9yMTEPY2p13VOtorsWKgHd8zgeIch5EhYJpDjx67t4nL3WybgJg+Zm1pfTm2Pu0c2kGfr+whRAKOiCjgSV8+Rd5jI7kUgss41c3ZRgF9QWLZ2G/drALz2qyk/6wE7MV3zxJF1/walsTN0houZrTeYIQmHMExM9NEFDqkh0cthd9y7Hzx1KhPZE6yoGp3yr3nJf8uLcfhzXn1BRqBC4mbMrpB2ik1YPo/QNIoz90ElCWvBRfldOlMR0n5bzOKL7yNyNDNMgyCMBjVkBi7FREao1sQZl0BBY59nrK4I5dNoEtWUWzBcjIPEKv3iq4ceu89PxtdcMM9CS6ccBD+uJqiiq/j8YWNAUf26QR3nyi9cINbKg5w3N/NXwaawbtNqdwSjdp3a3bb1nP/FUfHqUujC31er4lKwZp/pZaN0USiz6sFUKEoZfsdow1VMbTxNO7zIId0d+AqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(6133799003)(11063799006)(5023799004)(22082099003)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MQUNxHrajZUbhytNGjI+Nj0v2mnjYpPcwcVzlz46YVzMmEwbppEB4+aVNjU71oTS7heSH644NnQ0rB6TaWVV0J8DkdmvZOAV92GMdiGoNX+ADR/nqksLb6GFhSe39WKEA/v+qiII5bMfCRSNJzb1uNS+T1I11FRXeewrizNxuah3nWXgpdEuHa9txQh3R6F4DA9rbY/oPGXEPbIqxWXAuA2PZJjLWRui2ddK4WCJRA9W0akWwrp7QE8sPYl9bXxXH6a5VWTUvZZbkel+ZwhcSBGpAOL2Mp5AkE0snK4v7zdItXAEft48AbReeKOc9c8GBJtHqX5CkCzGgWzqqj8ZFIEsyx+QPZ1O+vemGAz3ddiRAX/KwFyHArgwR6aWzx2U15OwwUx4eAaYTXbPjxjLmnUFSROyg9tRO7DxON7wPkV9LoMxpKXg3l+jduaNwDHb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 22:29:51.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8ae85a-ac86-4381-9a62-08ded0adc6b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_152959_939281_3F12046B 
X-CRM114-Status: GOOD (  22.95  )
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
Reply-To: tanmay.shah@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,


On 6/22/2026 7:25 AM, Michal Simek wrote:
> 
> 
> On 6/19/26 18:38, Tanmay Shah wrote:
>> Current _start and _stop ops are implemented using various APIs from the
>> platform management firmware driver. Instead provide respective RPU
>> start and stop API in the firmware driver and move the logic to interact
>> with the PM firmware in the firmware driver. The remoteproc driver
>> doesn't
>> need to know actual logic, but only the final result i.e. RPU start/stop
>> was success or not. This refactor keeps the remoteproc driver simple and
>> moves firmware interaction logic to the firmware driver.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
>>   include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>>   3 files changed, 110 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
>> xilinx/zynqmp.c
>> index af838b2dc327..f9a3a95b0638 100644
>> --- a/drivers/firmware/xilinx/zynqmp.c
>> +++ b/drivers/firmware/xilinx/zynqmp.c
>> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>>   }
>>   EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>>   +/**
>> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on
>> SoC
>> + *
>> + * @node: power-domains id of the core
>> + * @bootaddr: Boot address of elf
>> + *
>> + * Return: status, either success or error+reason
>> + */
>> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>> +{
>> +    enum rpu_boot_mem bootmem;
>> +    int ret;
>> +
>> +    /*
>> +     * The exception vector pointers (EVP) refer to the base-address of
>> +     * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
>> +     * starts at the base-address and subsequent vectors are on 4-byte
>> +     * boundaries.
>> +     *
>> +     * Exception vectors can start either from 0x0000_0000 (LOVEC) or
>> +     * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip
>> Memory)
> 
> here
> 
>> +     *
>> +     * Usually firmware will put Exception vectors at LOVEC.
>> +     *
>> +     * It is not recommend that you change the exception vector.
>> +     * Changing the EVP to HIVEC will result in increased interrupt
>> latency
>> +     * and jitter. Also, if the OCM is secured and the Cortex-R5F
>> processor
>> +     * is non-secured, then the Cortex-R5F processor cannot access the
>> +     * HIVEC exception vectors in the OCM.
>> +     */
>> +    bootmem = (bootaddr >= 0xFFFC0000) ?
> 
> and here you have different values without any explanation why.
> 

The value in the comment is correct, but the check is done for all of
OCM address range. This is just refactoring of the interfaces and not
the actual logic. There is a separate patch which actually refactors the
logic, I will send it later. I would like to keep this as it is because
this was originally there, and the intent of the commit is not to modify it.

Thanks,
Tanmay

> The rest looks good to me. It is a step in a right direction.
> 
> Thanks,
> Michal
> 


