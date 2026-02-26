Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C1FFC592F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZnPJfupjXRWk1E1fCiQQKTWD66ynz04UKrS8Ell2eM=; b=Ge4n/blEgzbjgLXCTdXgleKlXu
	s4J08Y6VpYbaywqLngHU3/Qj0wSL9iEEKnQcWFCSFln4c5rPtaxsVa18NCjsDwPA1+Pf5GDhIkJ3I
	SIyIWk/SzYres8XcLCQIdNNE+5kZl7Wr1wmSAym7agLKjcxAP97KNEq8Lv29px8bPBH8IrHW5nmoa
	hlEwxD5yP3eI8KVO6gBDzD/2nvDXXobW9wV2J6dGJoFUWiv7zxA2O4IYRHVHKNz/ATlRDroswC0kI
	NprqBOrcWBmVmhbh0omJMcCCy9U0Yf9vabAEhrQyHRcAI2liDcJMkijwQMn068oeHEhiYV59no6BK
	wVowxEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva2Q-000000064oW-2NjA;
	Thu, 26 Feb 2026 12:00:14 +0000
Received: from mail-eastusazon11011064.outbound.protection.outlook.com ([52.101.52.64] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva2O-000000064nL-1ikg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocaag5YO8K2zY45cRyBK+2IXUaj0JUkQFHfqK0KO31bGF+ZQH+nBPqfmokur/+doSxL1AlH6FRh6NTx53gRzikQPlyCLXJtp0pmEo8L51McD6IVXgnsLN05EO5swqfOqsT9DHOe/heHGahft3/aUIG4VfXRc3jkqiqzMzBrRVOtck1hk6VEQOrvVLjwdo7DODVTc+794S9Xj3/Trljr7bUeJrvZpf8N0Xl+uDWOX6O5k+7AyBZ03VnHCJQ9hkTXLRvCqfcRqjgA6BhL/tBt+Bd2bCt0WryUJvVvc0sRF8D5HUfBUgOIUjUWahwc1CbOZGBmNcQhqXK3bikebS1Wirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZnPJfupjXRWk1E1fCiQQKTWD66ynz04UKrS8Ell2eM=;
 b=XP5ydtDngyXIAcV8FQOMN50UydOebECH4x4i93Gw4CCUlvVIcq/Qfm75E/z4Aqr2sqK9ymtCV29q73JpN7j+gKeMvPF7iFyzpVMNkB6WXCajZBV/E77Jr8wkVrs7kaP2pegdRrwbthMPYCfhWozQ+52ppjd0lbB0P6T8+t1CjPAzIljUjqjjcMs670AR7YMsqio9Y3bCu5gi0Fscw7XRG2Ooz28ebF8HDCvWpJ4vdxSGESx0SRQBCwYntOc3CnvE2POhFvpQorLG/UbOncjb4x5LnhiqX1odNBww6zUQOTEtRdvrbVD6kWYHEy1IHz+U0hUeYJNUiHf8Pjr5JzziBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZnPJfupjXRWk1E1fCiQQKTWD66ynz04UKrS8Ell2eM=;
 b=NIfWAT3vnak6nKbA3kdGZShbgiRxfhZ+2t/4qQAOv7tfI+xf7rklrymzxDlgphuH1iXCUOmiVoogQ1Yb2bc1/92W1BL68a6TZC1hXZMPO5/fESh/Mj+3AARlHBM0QHvnOjjRa5P3YX1pQmM5azuA+hQ/c+1fqXQwWFfEIIaSxChGvx/x1mRqV1bpWYuq9tdlDSNTMT0hq5sKzv+MNqwtICi4I/Hd2igbIraD5sez/eiZgZrxV/ExVEaOw+PD+0KE/hHi7cTAvLmgOdasrnuGF9AI8hX5L069KieSFpHIDr96ksGkkiyLBHeJVL6GB9IoGd/AQGRzufpytXbLM5lwcQ==
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
 SJ1PR12MB6218.namprd12.prod.outlook.com (2603:10b6:a03:457::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 12:00:01 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::e1) by DS7PR05CA0046.outlook.office365.com
 (2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 12:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 12:00:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 03:59:19 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 03:59:19 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 03:59:14 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <maz@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<viresh.kumar@linaro.org>, <rafael@kernel.org>, <beata.michalska@arm.com>,
	<pierre.gondois@arm.com>, <ionela.voinescu@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <treding@nvidia.com>, <jonathanh@nvidia.com>, <bbasu@nvidia.com>,
	<sumitg@nvidia.com>
Subject: [PATCH v3] arm64: topology: Fix false warning in counters_read_on_cpu() for same-CPU reads
Date: Thu, 26 Feb 2026 17:29:11 +0530
Message-ID: <20260226115911.1664285-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|SJ1PR12MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 35278274-09dd-4052-fc6d-08de752e920a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info: /H8lzh5HWVgQnqw+JPG41oYvG6MHJ2ha6xhLH1Ijl/kHjocTS3m6JDWgTe/oITNPZCYkeIeEX925wVrYyN+lkGVolWS2Xm/Ol6NRyFbFcETKa5MGGhaDPXerMnITSM+K90b7g4oI2bPQCj2eqTKP4HFZ9eKli6QCFzNMelXAtwHTK4lQ+wJOvc9wOvdcAhRSi3dYQ05XFlkNej16qfZcBjUUAENvqCTzdf0ZIHWjj9+ytyyeEG+5A4zIgDevdjAu6IMS/mT0bjLu/tuRZ/SZD3qrhKtnQrXJK7iWDUWHgQOjsHdf6Jxp+t1n4quizmqVMUHADJ89FPSyzreXC8qSR2OfJCfPsZTImxZnw+6FHPWzDyCb+WYqTVSUrU+QUOdXH8+vuo1w2NRlMXb1Ns1lZ7ffHEqo+4jcypnC3n2w8uBHHacA/Yx4xwl7fteJ9E1lQfRyV0rIFu+H1OBr04Ar975oPOjZkhQUIowN/LiVXLD3rNingpfkm8j4SoP9OW0mlDNa179b1NBt7+ubMXGLiO1QplQUy+eL5Na4m1cnDqf48FhnRchCNTsw1C17YWwNUcuau4iOJfi07fGJBArzHr1ka52CCvN9tZpEU18lvHtRWwdyLe86ipAljX5uaqWyb0t/iA0nVuJDNJ+iBWvMdZR/6BtzLqDdryW3503YAcyYBrVqQjwkN5DX/LutRUN/oKO0gR9G3FTkDdO6J1XDE5bpue+51H3CtunU8HgmTry2WZ8vKWPb6Fx/pIaLhCsVm9UpV22byIEBi8XN+i6XKSfdgGUMInF0QkaeP+O0VGFHiBtIpanuvm0SBKtiAOuvoUdyDUHNZoWsGIv93hjcwEjHcv1jUnox/uahiYLhZHk=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t7cg/fg9/c6Qxn0hHjIgywvNKdPIGrf8bRI9B+5L9cWBOBkWHGSVsnbsIiHT4p1G79mFI4KnpLyDxUcDNImqLTE5ttR5TR8pilxDTAdcPc1L4iOLqlUN003qJu3RGXwZrktYGg/+KSavKDHVyizOMUaSa4HDfr4Z+FYU9evwMvBI0YtJ9qVk8mBmoX+n50wUnM6NO8K+uE22HiBdlbmuDDDXunjshnipO9oAuhs2lUZCMyceYpJ5zL4PrYtUv3XqBXyskkIr2Z2/st5GX2MlEDpiNjNXsp01Qyl2fTjFRe8hLdi9wP5PwPYKC2PDmsHU8ysPEIGsX9R9FmK4X0MsbxJZMVzIVU/dLNvu+njB/YPjAxNzLxP1cQ43AaVpuov0hpdUP1JXtUHZMj6XsarQyGkYysNKYvZ/EFuEywecACfy7SRAhkPJTFsLRze7U5SB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:00:00.9268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35278274-09dd-4052-fc6d-08de752e920a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_040012_454029_948DC311 
X-CRM114-Status: GOOD (  14.32  )
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

The counters_read_on_cpu() function warns when called with IRQs
disabled to prevent deadlock in smp_call_function_single(). However,
this warning is spurious when reading counters on the current CPU,
since no IPI is needed for same CPU reads.

Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in
ticks for non-PCC regs") changed the CPPC Frequency Invariance Engine
to read AMU counters directly from the scheduler tick for non-PCC
register spaces (like FFH), instead of deferring to a kthread. This
means counters_read_on_cpu() is now called with IRQs disabled from the
tick handler, triggering the warning.

Fix this by restructuring the logic: when IRQs are disabled (tick
context), call the function directly for same-CPU reads. Otherwise
use smp_call_function_single().

Fixes: 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
v2 -> v3:
- If irqs_disabled(), then call directly for same-CPU counter reads.
  Otherwise use smp_call_function_single(). (Will)
- Remove get_cpu()/put_cpu(). (Will)

v1 -> v2:
 - Rebased on v7.0-rc1
 - Updated Fixes tag to match upstream commit SHA

[1] https://lore.kernel.org/lkml/20260127080700.3565546-1-sumitg@nvidia.com/
[2] https://lore.kernel.org/lkml/20260224092714.1242141-1-sumitg@nvidia.com/
---
 arch/arm64/kernel/topology.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 3fe1faab0362..b32f13358fbb 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -400,16 +400,25 @@ static inline
 int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
 {
 	/*
-	 * Abort call on counterless CPU or when interrupts are
-	 * disabled - can lead to deadlock in smp sync call.
+	 * Abort call on counterless CPU.
 	 */
 	if (!cpu_has_amu_feat(cpu))
 		return -EOPNOTSUPP;
 
-	if (WARN_ON_ONCE(irqs_disabled()))
-		return -EPERM;
-
-	smp_call_function_single(cpu, func, val, 1);
+	if (irqs_disabled()) {
+		/*
+		 * When IRQs are disabled (tick path: sched_tick ->
+		 * topology_scale_freq_tick or cppc_scale_freq_tick), only local
+		 * CPU counter reads are allowed. Remote CPU counter read would
+		 * require smp_call_function_single() which is unsafe with IRQs
+		 * disabled.
+		 */
+		if (WARN_ON_ONCE(cpu != smp_processor_id()))
+			return -EPERM;
+		func(val);
+	} else {
+		smp_call_function_single(cpu, func, val, 1);
+	}
 
 	return 0;
 }
-- 
2.34.1


