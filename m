Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F188CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWTyaXpIK63I0rO14QOLwHw9o9wQZtHZBygetmOGkVc=; b=Qc3X+gUDOEduwKkN6qo13y0MQN
	rAq4AUHUOmup3zVQiGZZYnK6j7cDHEzoEvqdtGp+IEruITfoGH0JN75OakovhRYXLEUwdSfcJT/9C
	unG+BhSvbrkehkbu2dMGvAKGiBQazhLUfvZ0T6tMqS+53/kyDa/8ikcjoVO3So41hb7KBi3rBJ4fZ
	/Rd/IdKBBshCOT25hYrfydusvAuGlcal28a5xFtIQ96zwbvPFGt7bCHWxC+3KWi5FnjU2Dr++U3zj
	4JCWYg6LRYWUFPkKU7fPA5r47ic4VNS79Qg+Fbdh0TK2mOVgxSfGslyAPlaKlaj8vdKS4+wLpq/S2
	MxyLgSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuOV-00000005l5L-0lIK;
	Tue, 23 Jun 2026 06:13:59 +0000
Received: from mail-centralusazon11010049.outbound.protection.outlook.com ([52.101.61.49] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuOR-00000005l4i-30ME;
	Tue, 23 Jun 2026 06:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5V+3+HXKkyuRX0sVBXTiV0RRH2Rb0dO07Zp3IoGEqnkl+feQl5ZH2XuFJzivRKxltr8cwG4eITBtX9+X3NkPbP9nzQUeZTjNnUU6bd+Pu/+A6UOqjmEYhOR3n+CMqKrDzMkAM7dimyy3HbniNcMySl+XLVIYOVlnGeqE/G/W7lKFOt89PXEKY6VdqnZjxQapPpO7A0vGbP/ky2OSv/MH1/ka6KtXv4mvW8GeLVQD2SHYfT4LvMxK7PfpOzizv4RwLAnNAMYfDg+DvOe3X5S2S76lHRCObkgcKZgGGdm2KvYMrnUzESOPe3+acbfT8X9FSuzeK3keAmL1fRYMhHFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWTyaXpIK63I0rO14QOLwHw9o9wQZtHZBygetmOGkVc=;
 b=WQnX+Ig+uaE7bHzCaYCHjAtrsl4+Y3pG/YiLuE2FxdyrcIU/7lAWxwNHU6AdBtaDlEiM04t3gAvuAc5eCinxs5fV5zTu5/aO0EYBuVtsalyBPA7bi/1eielOrBwpxJvPMpxuQRVNmQhMhPKS7QejUV/ZH93ehyQFNQXDK1rtsBFBljwBtBHEt+8Wy/ifivUmjuqMnwrO0WYHEsF652y6I9YxkUhTwHJ5P57Ul0afkMDOyg2Uy76FKTor/KVbNjpZtslb2N78eT2IrUMpIQ2TTr0ryE3h8du1I9OVglJtjwDumjbwqbUWy7ftVIC5WSGftE2zVeHi32lWplzFNSxZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWTyaXpIK63I0rO14QOLwHw9o9wQZtHZBygetmOGkVc=;
 b=3BdUCZcW0bH0ZqEwb1pXjYx1Qy9vAYbRPMKwtNRhpqozz728nCWZ/i2F0+t8xg4LZ29WIg3KW5u/JA7ajoNvvGQktkAM+vMbk2gYa4aCKbppyJlaPszsM9sfp9ndepX9vNODcnhvFE7946YWKO2yaHBMJ3XoUPFuXtM1fk/2zOA=
Received: from PH7P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::34)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 06:13:47 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::52) by PH7P221CA0023.outlook.office365.com
 (2603:10b6:510:32a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 06:13:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 06:13:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 01:13:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 01:13:45 -0500
Received: from [10.136.45.194] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 01:13:40 -0500
Message-ID: <ff9678fb-4cca-4849-8ffb-7cb76db60e1a@amd.com>
Date: Tue, 23 Jun 2026 11:43:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	<guoren@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
	<dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-6-kprateek.nayak@amd.com>
 <178219229643.10927.7189200920480581019.b4-review@b4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <178219229643.10927.7189200920480581019.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2beb5042-c1e8-499d-45ef-08ded0ee9596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|1800799024|36860700016|18002099003|22082099003|4143699003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: XgxvC6tu7aV8RuaTNX+ZLLRk5Ho9pvYzQevmycmk3zNmn78dierWCJ6oxy5Nr2/hWqcpS6sXZjtrsksJoO5B5+XwzVdppRHVCjhX5FxDb6ruVsOlU9PM4ZwWZYsYvxTaB5n7nCsmkLwIBwPKkbNPe9DNc+u6v0u1zsGH0LVN96IfnFoOIr4oxYYx79At6cqWsAKOdDXr7ySLw8Ho5wfu1Cv0ShzYSzXoXE/qpc3HatLwYfYCMxfKzAnAhPpkPczXgP3sRDzvVTLLEgHMzRcMsYZzQyfF92DycQqfUAUG06HgrnyPiLTM61OTOfDjcJh3ePSgk3DXHKTw/lGj1wV4rO2qNr3DqRYM6ZIMWp8m9DpAeYVunUqDCpF+4LvURh6R3jyfKNuL7xx2OzrtuXG6WRB67tUYnLVVAIun4F0Kaoe8oz+OQZ4hhRKNcPzhBBtXhRdfNesGnScoFtyuWl30I15zjLscUZrbrjq7iCZ5sJZbomp4w2Wk/zWIHNp45elRnLxY6kIIp7K1Xshvg6XQb5h9nyE13pQIm/urgIC2GLLS22G/Q5a0nuV3dO5xYN5eGB5cozU08Gj21PE0JcWQCLwHUqx/KouxPuNk+46jufbYtr+gO8HUUkp9TUCaKMWigys3WBkyC+LYFApf+WlwiqQgxRershrJffc7Zwm7eVXTLYw3LwMOvHFLS6Vfgo+YXGQcHT3J8UiwyD3cM6/qhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(1800799024)(36860700016)(18002099003)(22082099003)(4143699003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rhGPamkFaWyjlOQwVTFGosmGfAW/sxcV5bKasq33VF6IVkSqKw5vylZGlGgxnD+101TiDAEVn2blApm2R3lTCQ5zkw8PK+vuAmm29V8HTvo9gpW56Epgt4HaNvIlQG6tXI9n4Pqex3sJ8r6HnowvLQU2ZX3oOc912CmmSCNWEEi8g3+/8brU7rRzPAnG+dStwflPhqI9jmh3NBlBlTOnPUiQqeRltRKr8Ba04prXk/ThpjNcNCD/UJB2eaS/p5EKEYEli5bjUv702zpPH4i/kT4un7/9qUVtt6Sl6Eqe3WwQVSVBPTaVbxevO9eef464LoI4gokkcfZU57c8CnmA8hh4qzfCWRRGWdIZiwhdazU57qok8f5O3DK7SaPH5Wd6RfSchORS43L420MpfvIEUt8uKAysR4nYeJlUe+HtKgAIxU6I+CSzKjEaxF3FgnXv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 06:13:46.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beb5042-c1e8-499d-45ef-08ded0ee9596
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_231355_773000_7D426029 
X-CRM114-Status: GOOD (  19.36  )
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

Hello Charlie,

On 6/23/2026 10:54 AM, Charlie Jenkins wrote:
> On Thu, 30 Apr 2026 09:47:27 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>> Futex hash computation requires a mask operation with read-only after
>> init data that will be converted to a runtime constant in the subsequent
>> commit.
>>
>> Introduce runtime_const_mask_32 to further optimize the mask operation
>> in the futex hash computation hot path. GCC generates a:
>>
>>   lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
>>   addi  a0, a0, 0x678     # lower 12 bits
>>   and   a1, a1, a0        # a1 = a1 & a0
>>
>> pattern to tackle arbitrary 32-bit masks and the same was also suggested
>> by Claude which is implemented here. The final (__ret & val) operation
>> is intentionally placed outside of asm block to allow compilers to
>> further optimize it if possible.
> 
> If the mask fits in 12 bits, we can nop the lui and the addi and just
> patch an "andi" instruction with the 12 bits of the mask. We already do
> this with the lui+addi block and nop the lui if val fits in 12 bits. I
> would be happy to help draft that optimization.
> 
> But I think the better solution would be to take the power of 2
> assumption since that will also benefit arm. We should still only emit
> an andi if val fits in 12 bits, but if it doesn't we can patch in
> shifts:
> 
> slli    a0,a0,x
> srli    a0,a0,x
> 
> Where x is the constant (arch_size - _futex_shift - 1)

I can do that for the next version and use ubfx for ARM. I can just put
in a BUG_ON() at the arch/ specific __runtime_fixup_mask() and if a
new use case arises which hits that, we can perhaps move on the dynamic
nop patching scheme that you mentioned earlier.

Let me know if that works and I can pivot to that scheme in v5 and send
it out post -rc1 after some testing.

-- 
Thanks and Regards,
Prateek


