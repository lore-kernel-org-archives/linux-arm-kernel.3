Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1B2C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQoTc8dItvF3hepvTsQXWtyNn0aiS6EWsoQS7mTTVdc=; b=Nwt2eRt5Tf3Exuqrbh1TCsP8Gi
	sl9Qob88rx8UUZWfJ/pH4o7hqOC29TI0Z8cMcmu0TABBmByy2PCIJ4KQVOA+XipGjwuEE1G8KLuGh
	04TF6nKKPhJyr83VsuUOTR52U8g6vHLpAdo3NxJXhIFFBxxbihaSV/Ln94kRu1qaEZzSalRkqDfFy
	d13Lfhs4HIaNHHwhhfCjlhXsZHWgPVMEr2eeW/NH+mFlh+WADJdp4MOscbojqwtXoEpk3LYw6EE1N
	n1/wd0H8c5fWmKDou7LQn/xD42uTBG77mSdnwDYa8xqGLmiCyG9C9LeEtIFRxkcleDB50TH5bHItu
	hb8ThMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGK-00000000ZB0-0Eb0;
	Thu, 16 Jul 2026 21:04:56 +0000
Received: from mail-westus3azon11012004.outbound.protection.outlook.com ([40.107.209.4] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFW-00000000YEP-1Q4T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNH2aPMEWMbmd6B/26WRD0EO3HpqtQ3BtHSW3CTFKqyGyC9mxHCvInfLlvYTEjefbasnsIXKVcFPAPUlsN/YqcIqu/zJYP3hiFrgx9yQeR8TdfVpcLXI0c6V+fVkZGJUJDvxp6i1dmzkq+w/dX5WAhz/+FR9IwwCtOckh7lcTh+HJ5C9qKWJo01YaGdQt10tYi9gUREeNPkVE1t5bYkyCaAByYWKSShRzanLDdqhH/kdOk1cMOExt/oT6115p7wCVJ9+EIlaX122zfyq1tHLhiR+621sGANuYQN0MwI7AfNMw7nR3iL3TYj25Ir2br3av3XJsrZRKU9n4k1V2oSYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQoTc8dItvF3hepvTsQXWtyNn0aiS6EWsoQS7mTTVdc=;
 b=pEFuRjYxet9h6WjnQPYBwGWy4+/+m/95OBTKm4JPG+qHqPsapCpEKo4MR2F/gzVT/QAfmDEnMkOPP5RX/QjyExCYas2NPw7t/1KH6s75lOHQDoyMNLGZXUgCZZ+xt7zLc7LjimR20Dxtd45QDj8I0TCHUis93Ksmg4/mY/xLTW4eI+vSKIKgNqiaTg8qv25TEV44rhZijOKhzBmTiHyaQhGApkgOECh9Cf9Lv60qsriLGZR0Yjp9J3vnrhNW1gTyJyE6uTRBWqCYl+rNCTD8QgCKK06M2L9rFYHQDtNqdKR5FF5viH/+drx5FmG8sAy1ey/jBX2euGMVpK7wo8sTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQoTc8dItvF3hepvTsQXWtyNn0aiS6EWsoQS7mTTVdc=;
 b=aGWbxWqmD4p0doLxu0xeqLABWAGfmsgEPt4VyWOxykSg5++kn/AV80OBATPX1ksd0H/Zu9iL+O4RYS5oeBkeGbOAlJL8Od7zD7Ra/PaB8x46FdQmvyeLBFn8+0/HIPbbzBISe28MbxhkDuyRFHVsAUMVUEZPz0fUJRNLosZJQuSKJZqlIZ4oWiG+Fn5N6n/ZXZFke0V1KqQB2VpYapDWqbIsKc9xY5Lfo6vD//LWZdkZ/QyyFRBpRb1dU06t/evKXN1eJm2cmxzdQYcp8D+9fnYzerBGsCOEMt4HT4Uy1HWW8c49HNhzIrS1a5JGDWf0USAuaHgHRmhzEIka2jw/AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 21:03:58 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:57 +0000
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
Subject: [PATCH 22/23] arm_mpam: Add KUnit test for CPU-less NUMA node affinity
Date: Thu, 16 Jul 2026 14:03:12 -0700
Message-ID: <20260716210329.2914625-22-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec6810d-736d-4817-786f-08dee37dc087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: vn/uQ3181K6Tl6nAe8HRXpi3VUu8XPEkHFjlBMECjm925WFzVRI3Vzll1KD7sWZKJQPxFyNMRUSE8eCujAGHTUmAxOPvOUVgHqqIn49ftJO/SI7cR9cfDPaITu9ltXtnzQoKbvYhPn2M6kLGa4H4osVYjGuXIFnpW2esJvBpTYcAJtsFCgJT8Hfetk1JPZ4/AohCCP1YYMC/00aKuf3qd+GMp7d3oUpNtOcAyPckJchC0X5JIyoCBx0tiuBDr5CfmD2JM+bHfYyk3TZLuDaRSeqhddsO6Ceza9dIJT4PdNy9OdRLkiAQb86Dy+kY1noKp49V4gqwAlkPL4CpWI59sBJux5xJXi33a6F6B/MJ9lYa+N8gv7Y9z5JkpNbgtHwVpuKTH0wKB8wWtPd0HMwp9oBI1acoz6dg1RoTgeYu6uhYq13tVZDdIpAXSw1xSjio7FGwSnrH33kun0x6BME5Wqc85oSQBO0p/QbxZMEjNL/IcDyaSL4BsUQHwjtGr6WADmkeejGxjryGAYoQ3rc/J6s9bFt8DPR+l6flcFPFCEo7Zk8J6e19Rj936SRaRQ7MqmFD/xEEuOy8m6IECYX/2JyWEQBM6RS6plxScUw5v0QJjolH/sekIs/7dfxujC9k1scAwQKgWBWL/YxvyyJGfCh462u/kipsO9Tby2D3pwuVyhGnJwf849rM1v73VQrXCBXbS8fqcH4THvYts7FiVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GoF+oZ9uhPx7lhmIr4Almmpm3FkeZ1YVu1nCcFVmSTKbbOoD83y9qaD1K7f7?=
 =?us-ascii?Q?BsGf4zUWAkyPKx8S4AyyTdICBkWiQ8eEqzw3TAwaYK5pVHgQjVBsLrl6yrhA?=
 =?us-ascii?Q?OPamsRM888Jd4xVtEzZXHCPJZHxU3nKLE21QpzyrjdzyzpAxvpeCDDDjS97T?=
 =?us-ascii?Q?Wb5/4qmrCpA2aGkBGD3T16iJnzSY7cypsAq0as+Q4jcs3ELFBIMw6KANL16T?=
 =?us-ascii?Q?1OzmJQ6BhQJF0f5vBA+lyt4Yrx/5i/KseycCmU2UAV6kbbE2WL4LNkLXfEBV?=
 =?us-ascii?Q?JW4wmBys0So2yXcxOmukNj0MoNqO13Pnwd5Zom7+HO8kKb+kriDiKQPsEb+e?=
 =?us-ascii?Q?zM9zhVqsnWhQvXa7CQvhEPUAmz1uWsOQz2iJXK4H8ct1IaUu4bSASx6mql92?=
 =?us-ascii?Q?N5V1piE/HEQFoDp6JVg9E5L99+9jAM82NHLBUzfApBLCBkcCYxPdo9HRhM/h?=
 =?us-ascii?Q?Kha/dw0mNaCM5Qc5GuCrh2vmcYtDfDSxUvMqXhx3KxKkPk6WxyNlccRs8o+j?=
 =?us-ascii?Q?PBLg20VPV4VL5VkUpIWp1OcQy4g632Ccd3zHLOBnxUIWBHgxt8zlaBHNtq+1?=
 =?us-ascii?Q?snXXJxyk1l22JdrtQ8OoWuHKYhCFMal9mpzq0uK7UY1pvk06JtIVKaYsdaIr?=
 =?us-ascii?Q?cwUkRdvrM9dIjATCvnbSK5PVyZcwaJB6B2EiD+4zt6joTgq2/ceaWlRnc/5e?=
 =?us-ascii?Q?dAO1CxYKMFftvtszzaAa+HsWuA+0Jnd2pt66I7u3YkhXo8BA7LP2A0NgUjz/?=
 =?us-ascii?Q?0q5lJoxat9w+vBOlrJGOwj3K5K+dM9/WtH8vkh5yWDmRzuPfjkHTGJhZyk1o?=
 =?us-ascii?Q?lkMsqlgQwovAGGjlVov0BXCembQcv4Crzk0n/RZ4xdqo20+pfZHV/uVqpZV2?=
 =?us-ascii?Q?dD6uN2wW+ceMCWRQD0bu/yM24Osl0ZBplCOg86t6LBe9HsX6lj2CUtu4XXmA?=
 =?us-ascii?Q?QnRxlHE3cWEJiscNxSjMrgjmBEoiSCuR0XG+gjXj1ksm0N1po45TtF7sjV3Q?=
 =?us-ascii?Q?+gwvf41ZJKv2vNJomrgN+Z5/Utndki7WTxvl/mTvwajurSJBXLy3qlHvtAoG?=
 =?us-ascii?Q?CX3Q0ZNMUIDylmHBD3Hjv7ycd1dgpoTe8eWIIfEkImcoFBM8bGG2BQS30M/y?=
 =?us-ascii?Q?dSAbIDndL0FgVkF4Od5HMsLI0QNyKe7eBaY8qgEYTcgnuSPjOMkTlz6sErke?=
 =?us-ascii?Q?f39nLyGgLtXjmXAbvz4cYF/t9UO1mhyVvWsjIP8P4cxmPtmAQDV6uE1D86WS?=
 =?us-ascii?Q?XkYbemP70DzwRXXmZgFPsloFP4zhroAgvwjPlxNQ+jQmbojkqrI8q/zr1nYx?=
 =?us-ascii?Q?e+GXz69luRz5NvvOaUhqTiwvnAfXlC0H0GRGYLuBcE2QUI4aGuHhkvWjlunB?=
 =?us-ascii?Q?+7T0/ruq6zMByQ2jL1QYhrh1CTrmyGPdu27CvN2gbfJSDxd5WvNfNC1+koF5?=
 =?us-ascii?Q?nHxRfCReGV8nDkonKtN0U/HCNMju5Rksywj4xIq7oHk8T1Vgn9p7vLFFzavD?=
 =?us-ascii?Q?NDQoCLuQOFejUoMThFVCyWUBdD5nql0JLaOQ1ZwdDluOjngwtRRAaSb68UJ+?=
 =?us-ascii?Q?7F56qbZQAHEQQrtkas3ouBLDlZI/zgWNXpYESP14daf4UfTmmewNh0sVI0io?=
 =?us-ascii?Q?SNcTN+3ydqqIm9aV/yc354xJABQbQ449avEJk58RQZLIcE08UGJYfs50cl8+?=
 =?us-ascii?Q?YZXzoraoHQcPbDozC4CsKLlY0hxKvEqvbBR8szwY4N1lFoh3N5gLAtHIGgPr?=
 =?us-ascii?Q?fy0gmH4vzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec6810d-736d-4817-786f-08dee37dc087
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:57.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOMyRphHMezY7515IM68osvNcGlQ6lTy4cj998pXK2D6IDJys3FWM8FZbYo9GNwQO3uF6qb2WhcbU05SCW7IKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140406_569291_80AD9B94 
X-CRM114-Status: GOOD (  12.06  )
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

Memory MPAM MSCs on CPU-less NUMA nodes rely on mpam_ris_get_affinity()
falling back to cpu_possible_mask so the RIS can participate in MPAM
and resctrl control. Add a KUnit test that locates a CPU-less node when
present, exercises the MPAM_CLASS_MEMORY path, checks the reported
affinity equals cpu_possible_mask intersected with MSC accessibility,
and verifies cpu_less is set when the borrowed affinity is used.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/test_mpam_devices.c | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 31871f519729..7054919d4574 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -382,9 +382,76 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 	mutex_unlock(&fake_msc.part_sel_lock);
 }
 
+static u32 find_cpuless_numa_node(void)
+{
+	int node;
+	cpumask_var_t tmp;
+
+	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
+		return UINT_MAX;
+
+	for (node = 0; node < nr_node_ids; node++) {
+		cpumask_clear(tmp);
+		get_cpumask_from_node_id(node, tmp);
+		if (cpumask_empty(tmp)) {
+			u32 ret = node;
+
+			free_cpumask_var(tmp);
+			return ret;
+		}
+	}
+
+	free_cpumask_var(tmp);
+	return UINT_MAX;
+}
+
+static void test_mpam_ris_cpuless_numa_affinity(struct kunit *test)
+{
+	cpumask_var_t affinity, expected;
+	bool cpu_less = false;
+	u32 node;
+	int err;
+
+	node = find_cpuless_numa_node();
+	if (node == UINT_MAX) {
+		kunit_skip(test, "No CPU-less NUMA node on this platform");
+		return;
+	}
+
+	if (!alloc_cpumask_var(&affinity, GFP_KERNEL) ||
+	    !alloc_cpumask_var(&expected, GFP_KERNEL)) {
+		free_cpumask_var(affinity);
+		free_cpumask_var(expected);
+		kunit_skip(test, "Failed to allocate cpumask");
+		return;
+	}
+
+	memset(&fake_msc1, 0, sizeof(fake_msc1));
+	fake_msc1.pdev = &fake_pdev;
+	cpumask_copy(&fake_msc1.accessibility, cpu_possible_mask);
+
+	fake_class.level = 3;
+	fake_class.type = MPAM_CLASS_MEMORY;
+	fake_comp1.comp_id = node;
+
+	cpumask_clear(affinity);
+	err = mpam_ris_get_affinity(&fake_msc1, affinity, MPAM_CLASS_MEMORY,
+				    &fake_class, &fake_comp1, &cpu_less);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_TRUE(test, cpu_less);
+
+	cpumask_copy(expected, cpu_possible_mask);
+	cpumask_and(expected, expected, &fake_msc1.accessibility);
+	KUNIT_EXPECT_TRUE(test, cpumask_equal(affinity, expected));
+
+	free_cpumask_var(affinity);
+	free_cpumask_var(expected);
+}
+
 static struct kunit_case mpam_devices_test_cases[] = {
 	KUNIT_CASE(test_mpam_reset_msc_bitmap),
 	KUNIT_CASE(test_mpam_enable_merge_features),
+	KUNIT_CASE(test_mpam_ris_cpuless_numa_affinity),
 	KUNIT_CASE(test__props_mismatch),
 	{}
 };
-- 
2.43.0


