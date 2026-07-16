Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF2C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnt05k0RnEHXUOMHxXtlf3FeqQ7AA6fhOcspVS5Ukfk=; b=5E0VzhztcrwxIwMEdTMiHB6pKh
	b//2ZCVVtYO10B7TB2X0e0Mla4VWRgLdTPMgbgRkmg15KTuR4Hl4PIVUbUwG1bW2VUYys9806S3iE
	YSrvjdLoepD0vpxwtVDCcepQM4pQVwKHBoX5TQihXovUb1bOj+ugIaQR9ElXkx9VfKcEFC+U+v/X2
	mNhiJflv86NxMKCqG9Epf81cH5Jha/V20p9LtpmFkv4OyeIv+dvsGK8hj3VwxSSMhxlv5uzq2gxLo
	nG2TKvWmQl2POeh2VCO30JZ+8YLQKiz4ZSuv/cvuUFaNWNDpceRp52sB0TJWB2goP11LWK7rdvZ/p
	0+0cjSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFZ-00000000YQs-25Wo;
	Thu, 16 Jul 2026 21:04:09 +0000
Received: from mail-southcentralusazon11013054.outbound.protection.outlook.com ([40.93.196.54] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFR-00000000YAB-2N1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAlPPaEFHWeRCdpnP0QoNcWJtXI2dPVxJ+6PToUG4KGWodg1kwa6/7s7G/hDQf9+H7jA5QOzpnoGGrEUi1A/lCz04O6EOjf/cxsT2uBAmrSuT98ob8yHgffVbnhaNjjGWbZEsBlxmKt4Mz96armwqH2bCJbRd3TpkrFNTFLRX6q2MsS2emCbdweOImqpK0WFKJjU2IZUfKNHQBNgl6tHpNMY5aAwzfvBWqIXuqkhkQZ4tzvyixgnLj3YQSRapMSpHAc+21jo9jZgWEae8m7fBtGuYUpJ/0aaHh5Z8/oTcaf9JAosiaqvUJNdGjWcdpkSaJOXsftkgJvxeP7Hhr2n7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnt05k0RnEHXUOMHxXtlf3FeqQ7AA6fhOcspVS5Ukfk=;
 b=TpxC2DzTixpjep4yqo1kt4mzyvMZAP5VPC+KCoWm3NOSvP2+j6hK37Je2zj2HtAqBTVJTKflss7VdDejnXYpcVRoYyhZPBLg5PBfQsYUx0gZECb3fJ8Oi1JYmS66cDohAtNPoMJ598T5cIdZYQ+x0MN4znxVusb1zRd3qmmx9mTpObxb3gToAS3BRj774A7k1vwqxJKjE94IFG+gdA3RhYL6xB8gTT26lqu3NesLRqj9mfb5OHBZ+o1vhPG2g0U7t1EXxpUV8vYkoBTwrVxso43U5/5qni35dcoJdRBcVup9CEJzxOdumvEY6889Jj/k/FOd5tcYfiT/1fuunyoypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnt05k0RnEHXUOMHxXtlf3FeqQ7AA6fhOcspVS5Ukfk=;
 b=NTwYFHslyyi2/LuTSH7RN6REHjiMfOWtn0XI9RguY6oI7HgeadvUrccXfsOkgE/hKFtDLAyhujWcHPHSuwCWn/6ui7VMhgAv3UiLZWCsvRCA4AsaY6BR2eYiqhDpAsUFemCKpuKk6ZUSHU6bQ/jCsXrqurL1l4It9NGJ+o6xsANj+tlz8w/mSNs4fqu/hawJCb2nmff655Zz27dKFWVtLthQa4LDK8MgPXexGDhVnTx2bxbxGzRuQTZ+ltHHvLHZ8dGgj6mrsNXde+uZPeLBACEbafBNIN+5nWx8h28xnTawsLPVRY8jk1+Noi4F4G5NJjsDvmD+p/X9KNoViIjk6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:49 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:49 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH 15/23] arm_mpam: Refine L3 topology and class selection
Date: Thu, 16 Jul 2026 14:03:05 -0700
Message-ID: <20260716210329.2914625-15-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 72013cdf-d700-4ff0-cf31-08dee37dbbc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: zN8LAi93NdRhJQsWzL5+xxxxrpLPv4f4XcsCbQRHxIomezgYrown3/g2wh8ik5sKvczUBocJ1PWpKl1DuSTqsyBz71wrgS0VSDKw20IY+hEil1JU7sJ86sR8BHvvdCCoH0QJTauX1GfvzfQQAePRxMl865t22B7vAazeLjBUfN16C2Nh5lWR7a0ggKnJh8qNFfx60tzNLmBvSK/wg3du3eb+5ufqCUx06gxauCK4ZQ8QyMYg2WuBdTFkW1p05/uspPGX9Q0zW/mSjVon2PmCWg1qa4NmCNquptKEwARPFm2W7AKnL+2cOoojjpcyTeXIsz6nkIs4zl0CZqHr7WIpf2FLdOddwFgNq6SVU36nVN8iMEse4CYwmqt1mJtOZqt2frcVt0pVTtusp7I2Jrup+wUCQXN30/JJR/Bp2y5DjYfdz5IKcEkarJtd1B6JYmI3Zmzx5rUSx7Qj5l/iTzhfRlk3BrRR5XSCKDieLf9SeRNszWP2DdBH4MSJnBTmiPr/itW4tvTGETYnAq0Ae87FcWDcEaMhcRjSWuK4gqz98Vk8aRUkLaN9TYuDZMPOK4i9IGS6vbKeI0rcC2DVXRizhGF1b9i4ctuBsMio0FKrGS1bDXZ6RLUtW1xMYtydYLJlmTwpdzWHd5JfeFfLSBqbJmYao9veQ16oecKT+G41JoTZ8tNnBdMU3Bqa0qbgK/cjqEVX7K3LcrGIHzcPANygtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLf6r7JNXzWHQjKlyjz/DzqwAyQpLXimCuQMhVEXKkD78RA4uA4/YBQ9xaNf?=
 =?us-ascii?Q?r+rwGByMWRATeBbfN+NRG2B/z+xkMcn7OUXEKdAcqOux8f6T5Kq2cNw3W8oV?=
 =?us-ascii?Q?T/3vngAphW9/fxhi2S9ZbaDBmtKp9KvG5kHadrkvT7HmSrK6hZT4UHvbSuKu?=
 =?us-ascii?Q?+QrwihKG8HUqpkaXCytM65ie+rfGmchUdiT3yK7r5vnmh/Rsc+w9gwskzZ6/?=
 =?us-ascii?Q?bayHoKV+kJLNFvQlE3AU6VA9y8GvUBJSVlYYaRj8AB8UTnA0YSzNsc7JTQNs?=
 =?us-ascii?Q?znsqABwA76vkVVqjQ/2x73bqLnemz6jgNjklkHwc3lV+eRQWuYRQ2fq618qX?=
 =?us-ascii?Q?mA7r6QuKZbaqRqRMDX3Q3t5IIJ4r2Xcg1+dcSVpTAu8fymJN0dG+uzfjCSZ2?=
 =?us-ascii?Q?gqiypbiV/gIC/VbfzZafODWi+1TKzwB/GyyOwFNXSiqc0CBFa1m4zcgcfkS6?=
 =?us-ascii?Q?I3BkYugfR4FfDmjkzDdTTA3YSwtztn1oVYl0uvInbxpOc0aKjyHvMVcywhar?=
 =?us-ascii?Q?0saZYx3Y+WVJWa3lHyA45xzkvUotT8Yw4fL/UoRWW5zMZHN7KK46EWWjQQGT?=
 =?us-ascii?Q?wU4y9FGZuYuVbOaj1kLE0ZUqYHrI4pjF8lYAQYVmrmMQ9RljCKj6RwAs8PYd?=
 =?us-ascii?Q?UW+h7+A3LTWoLxnRdmSUxXJ/LeDa9XCW3RavLDXbIiJ1vqHveCjFEC6WL+tf?=
 =?us-ascii?Q?yLk1yq2drbhx5q15DtfSd6sslaKeFBJfsslM4YtffgXEbs7yuXQhYIFzAqI0?=
 =?us-ascii?Q?RQ7OLjj0AhcL6mn86hstgbbE9RQyvNH8r/gHBqFB4Oi7GapYNMMtMcZmMwH/?=
 =?us-ascii?Q?BDNXyBMH0WiaJwJ8GJ3pMkO4MNHxUxx5CfbMDCd6GMfEXReOOWHOzFho1WrZ?=
 =?us-ascii?Q?DhTNwhiEBO1GvxzrykotSMiGU7A6dzibuwC7/ye2m0hxAX/dMsyg9Ppw1j7/?=
 =?us-ascii?Q?ivsPbcSfr7nmDOd9ip+kXTLNB5MjmB9Hv6TN1qS2dDlqKZ4VoUNxocWlRpaz?=
 =?us-ascii?Q?Ve+cbmzaSQMieklDTb+kPosmYBvJjTKmNoVT0joviO5f2PF1rGwxHQy1z4t3?=
 =?us-ascii?Q?Ryp6s40ivXQoQ/sMyTeZ7PLT3oee2W9ow7Uc2i2cCreQM0NGMM9WFYEHuG1c?=
 =?us-ascii?Q?OHLhrNB9ew3LE+Ds8qEWUkeqxjJJFsNEKE0PKvcE4ZOtJuQC57Wd76OifcI7?=
 =?us-ascii?Q?z5XWjuDaS/Ov2Nzu6IDak3Iw2jxf41zDlw8a//UppYh8v4q5KYbcNO2aioDK?=
 =?us-ascii?Q?J1yjvw/lsFIkJvSrfqVf4utMzPcdRQhEAQCxTOLnor80xuji7UH99FWO3ZAR?=
 =?us-ascii?Q?1lY80oDz6MfOtD7ROhP8oOFIfB5AGEOyMXNG+NnlEmsUYyxm2AX81zaKzUQ5?=
 =?us-ascii?Q?o/HQTdKOHh+spa7V/eumMQPhh7gZ6OWbzFs6lwfkcrlrNHiB3I7BBsurN7BF?=
 =?us-ascii?Q?0iE4ONyowM2DNlm8faQC8Eq0SaPViJkl8gSHEAARAB/XP+ktsJR+XUtCe1/N?=
 =?us-ascii?Q?SkFj5pOc4xkScDPy9gdJH1JMHdQZGtU1BawjdXVxl3+OZyvvDZ7v65GJzmt3?=
 =?us-ascii?Q?akkDk4RrGk09M0GVsuDd7gemItHnxxx6Y4fU+1tdNLiZHD45Sm+kWZ+R1yW+?=
 =?us-ascii?Q?h+5Id7EvoWkTAbFAg6Nh204cPnxLSz6qYtP3yEGkcQpsA8F2sp+jLG24CqjG?=
 =?us-ascii?Q?3Kpsj6uYACtN9q+uPdCi27GLREaQYITTzAJ+lQYu3SHCk3FHa6/B0x5xhGDM?=
 =?us-ascii?Q?HDadVfLj+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72013cdf-d700-4ff0-cf31-08dee37dbbc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:49.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5yNkZl2L3nTv6GS+nRAPzz7zYPHXy/0gHAiMh3Tlcz2EhLvWV/UFU+s0P1FpZY7w4azYzrwOXMRhgeqWLonwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140401_608896_E87FB7E6 
X-CRM114-Status: GOOD (  13.35  )
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

After enabling memory-level MSCs, the existing class-picking heuristics
still treat every candidate like an L3 cache MSC. That rejects valid
memory classes for MBWU counters and applies L3 egress checks to MBA
classes on CPU-less or system-wide affinities, leaving no monitor or
control class selected on affected platforms.

Adjust the heuristics so memory classes can back MBWU directly, L3
topology matching is only required for level-3 MBA candidates, and
traffic matching is skipped when the class already spans all CPUs.
Also tolerate components with no online CPUs once at least one
component has matched.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 953412f11995..86458a56a526 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -854,10 +854,12 @@ static bool topology_matches_l3(struct mpam_class *victim)
 {
 	int cpu, err;
 	struct mpam_component *victim_iter;
+	bool matched_once = false;
 
 	lockdep_assert_cpus_held();
 
 	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
+
 	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
 		return false;
 
@@ -871,8 +873,11 @@ static bool topology_matches_l3(struct mpam_class *victim)
 		}
 
 		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
-		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+		if (WARN_ON_ONCE(cpu >= nr_cpu_ids)) {
+			if (matched_once)
+				continue;
 			return false;
+		}
 
 		cpumask_clear(tmp_cpumask);
 		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
@@ -892,6 +897,7 @@ static bool topology_matches_l3(struct mpam_class *victim)
 
 			return false;
 		}
+		matched_once = true;
 	}
 
 	return true;
@@ -1030,13 +1036,15 @@ static void mpam_resctrl_pick_mba(void)
 			continue;
 		}
 
-		if (!topology_matches_l3(class)) {
+		if (class->level == 3 && !topology_matches_l3(class)) {
 			pr_debug("class %u topology doesn't match L3\n",
 				 class->level);
 			continue;
 		}
 
-		if (!traffic_matches_l3(class)) {
+		/* Check memory at egress from L3 for MSC with L3 */
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask) &&
+		    !traffic_matches_l3(class)) {
 			pr_debug("class %u traffic doesn't match L3 egress\n",
 				 class->level);
 			continue;
@@ -1164,8 +1172,9 @@ static void mpam_resctrl_pick_counters(void)
 		}
 
 		if (class_has_usable_mbwu(class) &&
-		    topology_matches_l3(class) &&
-		    traffic_matches_l3(class)) {
+		    ((class->type == MPAM_CLASS_MEMORY) ||
+		    (topology_matches_l3(class) &&
+		    traffic_matches_l3(class)))) {
 			pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
 				 class->level);
 
@@ -1302,6 +1311,9 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	if (class->type == MPAM_CLASS_CACHE)
 		return comp->comp_id;
 
+	if (mpam_class_memory(class))
+		return comp->comp_id;
+
 	if (topology_matches_l3(class)) {
 		/* Use the corresponding L3 component ID as the domain ID */
 		int id = get_cpu_cacheinfo_id(cpu, 3);
-- 
2.43.0


