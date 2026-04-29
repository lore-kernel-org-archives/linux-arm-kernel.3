Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823ADCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/gg3GWDwakpGZVgreGEteTv/KZDM/5J9UGOpXMwrVuw=; b=Fz1jbER5jJrYMGf/76oXp7RQBu
	RNDhJyD0sMn3hAlG6eRKH7O2Wx+f7NeCDoCPVtmdJmkvEZuGCpGQLQvNFSZqV6256qihvD61Iq/CA
	73YYhdslnU6is1u7bTzccJI4xFHWpDgz6Jb4a+LJYEErI66I7T0FHXcZBofvACgRWKz/fiH7WSHHk
	x6jObRaXGbWG9FALqCdYAYaIuzJH4fgJ/vPug9mI3zmzyqM/vQBbSJq1pPw6hMr5mye/otQWRiOmL
	Sxz0PfT7acjinxh/vl+2a8HAGyPH2MRFUy0BJaKRWutuMc5ptlcb6nCCTwl2FZsCF00XCvLgO8ptL
	yyrtkjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PH-00000003w7t-19BW;
	Wed, 29 Apr 2026 17:09:03 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PE-00000003w7G-1r4k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtnmHJf9cufCbCVlQIOFII+d0fRLys5nIyidHv2Tulh96QEcmQa4YS0mxXs5FDfKCMRAHDDWU9Q5FWbg6rD7298MVpiDurWx9S5nsaboMycpyek8Pyx28DXHlh3Q6ULIzoJDTuPFiZYhDsJQJ+kp8hr8tnlpQMmFVL8Xq8B1wUS4MCjWshTpc/1g17/2YkcOi5AkgwH9oHwU1T7tvIewmDHw7oRbEW3Su4/sirqjr1844MMApdOMeKKbFmbHXogAA0Fgm+HB3VOZU2aWyFB+4BPrOmSerFYgyOVGrpt9tvhG2KpF13QzoUuVEEf1bs98nlaz5wcK7nPQ+KswcPBNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gg3GWDwakpGZVgreGEteTv/KZDM/5J9UGOpXMwrVuw=;
 b=ZXx7dMiqlX3jQa4sDQ7X8AmhTWNlCuVUyBRXhNU6LIzaYg97uHgPyege5IsmwY5RBhfJfPZLVEiC8BuG04tXe7mbIL1qRmHiOe+MztDqJAagdW5GrCi+4SXQLBrFxA3+Ib+meEJzTesJIQnqpfEM72CuX0hfk1o2zQc73QKGMQSET46MQ3J5HerEtXig3WWKRHdz/KTh82NE2k3Rx8/buWH32exqWPas/MX6Z5yFc9gPcDC4W6J/+uAYcEH9waEdqWnAw6PGH+As9tV6LI66qy/If561QVj5IEqWePRlvYs1Y2kyTVfYzKlFcx4LPP4Fey6sGrzT5RLmbHvXNEe16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gg3GWDwakpGZVgreGEteTv/KZDM/5J9UGOpXMwrVuw=;
 b=jvfMoVzbJZLculLfxWMUrXUyB5F42BQc0l8DeVMOn3qvRrtb3rre5RmmIczGb3QIHcq+Wpt87jjijqtctqcaqH5/cxIuCxwBuawXrkLvs4bIbwc11pAiMOnyWt7sQwZCAp18UcLMiunqjjQP1s6ddUi3+Ozy+c8vxTzXDEQuCJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:08:51 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:08:51 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v1 PATCH 0/11] Optimize this_cpu_*() ops for non-x86 (ARM64 for this series)
Date: Wed, 29 Apr 2026 10:04:28 -0700
Message-ID: <20260429170758.3018959-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: f21973e3-d0d0-4c3f-ac15-08dea611fc53
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: FvIex4waOBesyo7wyAEVsiE5vPTG/2h0cPX8dn421M2+TEiux0f8OyfapbxojFPaQ3a94q+0CnuZMwyFxuT4MmYUWI6HIjsPi7KY3ezTj8ldrDZ9+AgKKPCdxRDUVfUT8kVACAa9T3mUNSzPAqJudOfStKTsU3O04Lou4Pd/z7nzFptNzEW5Lj8bu2AmmR5iRSyOxR5J0XWD4NhF1BJnKWSgdaZP2whQ3Jrg+3G+NutA22kZbq70Xmcg+k20Ld/JJnq8x1dnN6ui1gd2jYbbEeJm+uAo1cunUz8VsoIy9IYsht2yTmpJp3SQufo2s63fdWN2IaXpzru8zz/ZCI0aR3adQsuUsNGu9J18lZ1ECFPLeybwupXuOwMVCDmEG2KJgyOr6gAKm4JGQkZ6+23fnZK3ItIjPxLdWm9To6DvQGe8zOKBHAYYKUs0OipiQAQLT06VIU3gzGn4FRO8S/1AY/fCtgj1qJtX1q9JphbB4R6uix6Hgg1boA+0+FNTLbL2zSCHpV4nNFnAjmeQkcIPPSVIdqsgwsCFML1c0mHPKq/IzaaRVmRp1I3gAQ42ru43Uia2KOQkw5YmSEkGTHrbW6mRbjw5o+vUZOPKNq7FIH/o9C8QDpM6kWy+HkHeF4ApClHiL3UkWOUnaJnRhSf5VREUgxaM/cAUB2FAXgh/gICh0z2mIm3qLyu9VRRYueYU+kkPz/kC1mrNTwJfmsECI3XuGP5FecYCKi3uz1LrxrM0MQ4251T74QSD6GtBuuaaZ9aUIcWiPU/iE7BjFcC/mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5oN0M0WWViRWdDd3JCNUpUd0UydVhGNnNsem51RDV6TXdHSS8zNlRwQ092?=
 =?utf-8?B?c1V2OVp0eG9NUjJXM2xuQzdKZHhQU0ttK1p3b0lLMmN4WTE1NllvUVFrcS9M?=
 =?utf-8?B?ZnB4U1k2TjM2cVg3ZVdyUHRwU2pJd3JvbGs5Q1JROEJJUHl1Tk9scXgyc2lz?=
 =?utf-8?B?YXpsZXNNdDB6OWdqYmFscTdsdXhNVUNRRkE3ZFBUMHFjQ0I1eVRHUUJGSllR?=
 =?utf-8?B?YXdPUm5hWUg1aVhNR1VsdEY5UE52MkJZV3M2VksxbWdTWUlZeEtFWVhiV2xU?=
 =?utf-8?B?MG9RTWVzQldTZ1h0cUlxTUtqSDBSWjFReFJJNVBJb2lleWZkZlNsVG9VREF1?=
 =?utf-8?B?Slp3SlBDamxuM3JOVnlnZ2d0cXRsU1ZXOVNOREpCN3AwdXA0a1ZOYmdkSHh4?=
 =?utf-8?B?WEtTdFFKUzBGNHlkdHZKYXNNa3lRZjBuTTlEemhzYmhJTEhhMzFBbTEvcE1B?=
 =?utf-8?B?eDRKMWx4eXhPWnZVTTRaRmxwZEdnb0V3b3NLS1hDUWl3QlovNTMrMWVZSGxZ?=
 =?utf-8?B?YVduSjlyUElMK3JwZ1pRcHJ6aUNPWktueEJMa2J1c0t3SEsrZndEMU5uU3JT?=
 =?utf-8?B?K1dCd04vaExSbEZhVmN2MjNYQkdTZ2p5dEF4K0NlYXVvcU9ZNVN0aFJWOCtL?=
 =?utf-8?B?YjREaDB1WHd6bnE3ZUhhL1JHeFJTRzdiUjVEMWZIL1lWekNzQjFKaVN5eFYx?=
 =?utf-8?B?SEhRUGU3QXRLbTBPempKNHdjc0ZVUW1VdjFoK2hHWFh3WG1sNGEvYnVWZ2Rn?=
 =?utf-8?B?K1k3alFyQWRHT0lUMU1TdVBBaVVuaHdMKzJRNkNTb0YwWGdDRzhaUnlpVm13?=
 =?utf-8?B?ZXRqQzMzVE9nWEx2YnBzQlEza3ZQVXFNMVdBbjVUMStmZDV0ZmF3WDc1empr?=
 =?utf-8?B?Y2d6bkxCNmJCVmhiRWNqMzdMNmUvNUxrdWJYQURhSEFSQTNUbndqMzhxdDVk?=
 =?utf-8?B?aDBCeGxoNXlpMkx0OFd0MlM1Kzg3enk0ZW40WC94RlhBU0ZNMVNCVkVTMi9M?=
 =?utf-8?B?dU95UCtQZWpMYjVZRzBFYklSbEdvTDJXRUlOK3FtQTJOR0daMXRPalpFa1Fx?=
 =?utf-8?B?VmFUT1dtd2ZYQlJQak1QRXQ3S2hVUFJhZUpKVEZkbDlyc1phbmliRFJ4VGR0?=
 =?utf-8?B?QjBxclB2MVVTRWhHeU9QVXBxRTBnRWdpbFl5dWJvSmZpZ2pXb0QrWHh1ZHVX?=
 =?utf-8?B?a09jMktVMkJJWDhtUitLcGgxMGk3MDU5R1g4ZERHVGsyclpPaURyV1hIYVlj?=
 =?utf-8?B?dEg1V2dDZDhlUEwvbExIZWZIM1dUS1VLeloyN0c5SDJWNUI4R0dzamhGWU9G?=
 =?utf-8?B?YkRYSVZnT0hBWFlaWkdtZWZxb0NjRGhiVHBsdm1QUy9vb3pWQVZFMEpJcTNC?=
 =?utf-8?B?Z0lCTkdQd0hWL3BBbStVTFg1Zk10Tk01SVJjeEZ1V0s3ZGxhV2pQWVhHMlE2?=
 =?utf-8?B?QUhhQWxxQmorSWtaRWgwRDV6cndEYUlkR25Jb2VWSjBuSVF0Q080Vm15MHVz?=
 =?utf-8?B?cGdhVi9EeC9GVCs1RVYxaXVHN2hrdVJLODZWNjdyZDRUWVptMFhZTWVRV0hQ?=
 =?utf-8?B?UEpITlJUbVJOK2toNE1yMy9GVnU0TUljbCtWVllXbVlqdmFIYXJkT1FNQzJK?=
 =?utf-8?B?UXBGY3ZuTDdEUDQ3bXkzb2Z5M1lQaXRYU2VoNEFaZ0kySFNoS0hRc0VMK1Bu?=
 =?utf-8?B?N2JDVkFkdkFHRmltOGhMODBlL3FkVFVxY0tmeS9SRG8wZVJyOHpJY3RNS1Rl?=
 =?utf-8?B?aGlvODRlZkJvcGhxdDA4b0daR0l4QkFUMTBndGI2eDgwN1MvNDR4TDcrZG9v?=
 =?utf-8?B?bjBpZy9UN1FrT01XU2k3ei9xeWpyU1YyWW1Wb2dTWFZ0QmVIZkJ5V3E3WjdI?=
 =?utf-8?B?ODJnNGZqeEFKaEFJamYxZ1FPTDlDeVQzWXhocjVHQ3o5OUVoZUcwVTNCU3FE?=
 =?utf-8?B?aE5KK2RyQjN4V2hPcjdCMHRhbENOUUlJby9XUDVjLzFrUDZZV0ZtQmpaK21t?=
 =?utf-8?B?ZFpUdkF2ZGhGL3hyYlc2VjVTOE9zY3BIUzcvTzVUVFBEK1FidXdJSUhCUURo?=
 =?utf-8?B?Q2N4NDg2enBTSkpxcGQzeGFIQ052UmxaTzIrdndNcU1PbnNMUzlDa1dFVFly?=
 =?utf-8?B?ZkR3WnNMNXFmZzlBWnZQZHZreElrSlo5TXRVN3dMZGlXSWFiNW96dHFDZ0tW?=
 =?utf-8?B?cTh2RzdmRVhjU3dUdHR0L1JHMlM0d1pvMlBOd3ZhZUFJcEpQbVJ6bjZITk9H?=
 =?utf-8?B?R25RcTRQRk9iazFXeWdGaFdzWHdsS2FERnNBai9SQytLVHllbDMrSTh0Sy9m?=
 =?utf-8?B?Ly82Znd6WlpkZkZqOS96akxaamZNLzMwdDNFekd4WUJkK1FzTTB3aHo3SFlH?=
 =?utf-8?Q?IkAg6KyN0STONNTE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21973e3-d0d0-4c3f-ac15-08dea611fc53
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:08:51.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9MJLlhqWqhhKkQ1RnLsB/QO3LjJSaV4Jl6dKUIWV5UtDQGUAL78PykhdmAmDGDgkJ3+z1mRVpv/VYWHhr6Cljq3WrlIy4K7DMF8iZa4J+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100900_500901_792B2FD7 
X-CRM114-Status: GOOD (  20.37  )
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


Introduction
============
This patch series implemented the LSFMM 2026 proposal for optimizing
this_cpu_*() ops on ARM64. For the details of the proposal, Please refer to:
https://lore.kernel.org/linux-mm/CAHbLzkpcN-T8MH6=W3jCxcFj1gVZp8fRqe231yzZT-rV_E_org@mail.gmail.com/
I didn't repeat it in the cover letter because there is no change to the
proposal.

The series is based on 7.1-rc1. It is basically minimum viable patches.
There are still a few hacks in this series and it may break something,
for example, KPTI, SMT machines which shared TLB, etc. But it shoule be
good enough for now to demonstrate the core idea. The main purpose of the
RFC is to gather feedback early, figure out missing parts and risks, and
make sure we are on the right track, as well as hopefully it can help the
discussion for the upcoming LSFMM.

I broke the patches down to arch-dependent and arch-independent parts so that
hopefully the interested persons can do experiments on other architectures,
for example, S390, easier.

A new kernel config is introduced, HAVE_LOCAL_PER_CPU_MAP. The architectures
which can support this feature will select it. Allocating and freeing percpu
local mapping is protected by this config so that others won't pay the cost.

 
Known Issues
============
1. KPIT
-------
We need determine what CPU we are on, then switch to the right page table.
Currently arm64 kernel fetches tramp_pg_dir via swapper_pg_dir - fixed_offset,
and fetches swapper_pg_dir from ttbr1. But ttbr1 may not hold swapper_pg_dir
anymore except CPU #0. So we need to figure out the other way to handle it.
Switching to tramp_pg_dir should be easy, but the reverse seems harder because
tramp_pg_dir just maps the trampoline vectors.
Maybe we can do two steps switch. Switch to swapper_pg_dir at the first step,
then switch to per cpu page table (for entry) or tramp page table (for exit).
Nobody should call this_cpu_*() at either userspace -> kernel entry stage or
kernel -> userspace exit stage.

2. Shared TLB machines
----------------------
Some machines may share TLB between CPUs, for example, SMT machines may share
TLB between the two hardware threads in one single core.
The per cpu page table just can't work with it. Maybe we need a new
cpufeature to indicate whether per cpu page table is allowed or not. Then
just enable it for not-shared-TLB machines.

 
Benchmark
=========
The benchmarks are done on 160 core AmpereOne machine. The baseline is
v7.1-rc1 kernel.

1. Kernel Build
---------------
Run kernel build (make -j160) with the default Fedora kernel config in a
memcg.
13% - 18% sys time improvment
3% - 7% wall time improvement

2. stress-ng vm ops
-------------------
stress-ng --vm 160 --vm-bytes 128M --vm-ops 100000000
8.5% improvement

3. stress-ng vm ops + fork
----------------------
stress-ng --mmapfork 160 --mmapfork-bytes 128M --mmapfork-ops 500
15% improvement


Regression test
===============
1. memcg creation
-----------------
Create 10K memcgs. Each memcg creation needs to allocate multiple percpu
variables, for example, percpu refcnt, rstat and objcg percpu refcnt.

Consumed 2112K more virtual memory for percpu “local mapping” and a few
more mega bytes consumed by per cpu page tables.
No noticeable regression was found for elapsed time.

2. fork test
------------
stress-ng --fork 160 --fork-ops 10000000
fork() needs to allocate multiple percpu variables, for example, rss
counters and mm_cid_cpu.

Roughly 1% regression was found. However stress-ng fork test has quites
small address space, the real life workloads typically have much larger
address space and do more complicated works. The stress-ng mmapfork
benchmark saw 15% improvement.


Yang Shi (11):
      arm64: mm: enable percpu kernel page table
      arm64: mm: define percpu virtual space area
      arm64: smp: define setup_per_cpu_areas()
      mm: percpu: prepare to use dedicated percpu area
      arm64: mm: map local percpu first chunk
      mm: percpu: set up first chunk and reserve chunk
      arm64: mm: introduce __per_cpu_local_off
      vmalloc: pass in pgd pointer for vmap{__vunmap}_range_noflush()
      mm: percpu: allocate and free local percpu vm area
      arm64: kconfig: select HAVE_LOCAL_PER_CPU_MAP
      arm64: percpu: use local percpu for this_cpu_*() APIs

 arch/arm64/Kconfig                   |   2 +-
 arch/arm64/include/asm/mmu.h         |   3 +++
 arch/arm64/include/asm/mmu_context.h |   6 +++++-
 arch/arm64/include/asm/percpu.h      |  17 ++++++++++-------
 arch/arm64/include/asm/pgtable.h     |  24 +++++++++++++++++++++---
 arch/arm64/kernel/setup.c            |   3 +++
 arch/arm64/kernel/smp.c              |  40 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/mm/mmu.c                  |  75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/mm/ptdump.c               |   4 ++++
 drivers/base/arch_numa.c             |  51 +--------------------------------------------------
 include/linux/percpu.h               |   4 +++-
 include/linux/vmalloc.h              |   3 +++
 mm/Kconfig                           |   3 +++
 mm/internal.h                        |   5 ++++-
 mm/kmsan/hooks.c                     |  14 +++++++-------
 mm/percpu-internal.h                 |  15 +++++++++++++++
 mm/percpu-vm.c                       |  91 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/percpu.c                          |  46 +++++++++++++++++++++++++++++++++++++---------
 mm/vmalloc.c                         | 112 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 19 files changed, 419 insertions(+), 99 deletions(-)


Thanks,
Yang


