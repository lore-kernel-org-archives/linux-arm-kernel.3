Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06765FD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k9fvTilyyl2d8OPyh3EIC30H3jp8U3uZjeLKrp+pAOg=; b=Xh49ZbTv2FWrE+GD5oD7BK9+TT
	Mu5okMgakEh4Gun91L3i8QjFrNfI5vrljd5iHrh0tqd77C4rMjMX6pYOj/7O58NrpXVpsEHF4YuXs
	5epH6YYyWyZBpP1YLz8JKE5wCYwxcAqnNnrnKB86A1rqdK6zt4nys0zVb3QVWFXb2qy3BDIjt07Xu
	7rxOvDNMKXGpAbsqPqp8b8fkB++L21Ny4qa+D3Awn5Rm3Daxu3W/6krLNcKIV9auFo+jXOGhoAMOf
	7v28vSjvhFsBf6UeGqq2ESWPYxnjZvhI5KQiDnJRpCNNssu0o3u9yG3eT7MfTAwADLyw7kxTeEEdX
	O+K9YtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkRq-0000000BiBb-1ySA;
	Sun, 01 Mar 2026 17:19:18 +0000
Received: from mail-centralusazon11010042.outbound.protection.outlook.com ([52.101.61.42] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkRo-0000000BiBD-0VYj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3tLMMNqmJ+mP9/r0kMPOueVUon6CM4pprhucDB1mWiFaTaAe1Ipq8+ZJTO7LnkdyESqDp+Bu1QvbHdVscr0TpcTmxLz6Bx4+O0PlU3HNOIXptwQPmoNxzJr804gDmEbOPd/oA7F59YyA5JGh91KqJkU0xjBW4x8EA1wqIt/PSIqCqXWcXI7XRqyNsx9kHYoLH6N0qXAXu6trE9TwP3snKgHGw256oCtHKqIOc/Ck8UBNW70QRnk2/4ALO5HoK3/f362J5K6mosoJwIdErXnj7V53MQoQvXrucGZAoCycJRE7F9EGnf/qQlgaQwT3O56xTNWsr8Y9g+su99KFSBBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9fvTilyyl2d8OPyh3EIC30H3jp8U3uZjeLKrp+pAOg=;
 b=eXhY31crZ4YvgkzmJs5n/EFC8P9hNxh4oXDW+puxrhRheId1wjnGqodO7Jyo1eCXVNTWP0CF9bxdJKfiKcQ4NJGYJ1ALfUT+1OOisd+3o6hR3oeJOFh+9KpBFglLasYwC48hfzFlQvIt22o6QgmSK4oqmFgC6pblLYBuhKgxtF12BGSbx2J1UL9fvp/4kIIXqxAnFjcXbwjVrXPJvKI5yw9+Gb0CVIgAjP99u5jCRWZv4myhObMMXuEqZEKdn3iK0yB/fGT45oiePUlrn3+oYbyQIhcnD+YnIQHl0ufngbB/4aNpJdGC9ebkw7EF+ed5pP7PrICJykF+Q2s+ooYTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9fvTilyyl2d8OPyh3EIC30H3jp8U3uZjeLKrp+pAOg=;
 b=KQMasqCbYN2c/CUZSCT/6ALL8iiOwbEoamjkiEoYqwaxRCSlt7dfMVmsUpjYIxqrrCIAKXr+/v8F5smpeck9wlcwGk9T12OgSQlO5J0AxyoGvzacGQmpBLuQPeLRXHSByIvgTv423dF/RNoddK5ByWD3E1soRTWT9k4FDRagCDOsi/uc5RAT3eoQWp4Bl2q7c6bYj6zZNn4M5w5zQSMl8KcEj0VMdvP0eGzYSqG73bJJtel/zkDxv3oKhRIuqFEt5ymnl3Mm3NfcYZ3ERWlJhubyamxs1h3iTzbzh+hgYoqCOJ6lAcOPZu7QQdc3LtCz5fC++/q29V5Sa2CZt/QiRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Sun, 1 Mar 2026 17:19:08 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::aa9a:b827:90c6:506b]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::aa9a:b827:90c6:506b%6]) with mapi id 15.20.9654.007; Sun, 1 Mar 2026
 17:19:08 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Peter Newman <peternewman@google.com>,
	Gavin Shan <gshan@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH] arm_mpam: Set feature bits on default partition config
Date: Sun,  1 Mar 2026 09:18:29 -0800
Message-ID: <20260301171829.1357886-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: c4de73a6-77ef-477e-15bc-08de77b6a5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: Mj3prZEnFOVvojGTnhFDWpen4zEca9EQ4sIKmhw8OmIiTsbMiYGTC//wnWVlphGGbZG5y7+53+Kk4jf6ERWuQb+WEgwhcN8G2j0o29iVNmFqMyh2TPcWUqgyTmjvanERZnaD7Z6yWsU5dqzmva6DG8DR3sWZKo63ACVQIgOJMAaS1GzTTEiMz89MFp7sefseSi7UVuq0t0f9KJ49FuZxO9eZEgrb0VCt1IuwfxiksWkWi7SdA2DejtCIlZHV1K4Mw771yRSQbRfZe0SGSsGX8KcXZce6JzeBnKyvwaQked3T5fqFuW57+ikNTTrZ6lLrtFd45BJO1tU3PNVEmfb4j6Rw621hy/78q2t/qeIz/STVWboNu/tx5+8oN4z/3O9gBvXno0cDf06csP3L3Z+XibtmlKDbLOwD9PB625DLQuPT4wJlkoy4eUVEYXnovYnpBzpVwEWG+wtI5+Z3zvHZW5BOrCA0GZ5D3hDLto5xAxGCLb0UaLs5uZ859/lAgTWQZzVDdznP+kzofkx/VWgmoQ0bxvRgOrnrw02R9K/DYA1e7HSC2KjBYsBe0UJVLs/iLhdpio9JERWQLtjrco7cKTsZi4IjIRA0PuGoYXgestidNatAPa0h2QAHD1N31yFPOZuqGac8rCkRJq05aqnYPdpti0l66egx8x/KyKzPFez5SKcrbgDz6fzBogfNnF2uB2RjZ1rMBiFF7Behhh37Ck2vkTSUijCK1OFgFsA4NBXcCm7Xit+qOOdcDFJzN4YPxhsA/hss3rULrjzq5lFEgxF2ezZggbc0GfrnSu4lp28=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aDfhiM24JwyG40Qmczo8rvY413BO5NmiGHdLHS5NZHbDATy9OpJBe188mMzE?=
 =?us-ascii?Q?tA2MNGT60Eze0Qks2S8TKv4p4/R6KeF1rlb1NDlN3CXWIEqkHpCxCjtiZGjQ?=
 =?us-ascii?Q?C1o3B0Hc9KSjCymp9ehDSBxcaRfFlptXt3UXnajD0S4pPC6+MOD0A2lfzG+F?=
 =?us-ascii?Q?e/v3k4ogZgA+tPPX2qJnx+e41JZXMJrJ9tP8wTCWhHAGzqtIQX0gcmk0AZja?=
 =?us-ascii?Q?KewQL6KW5jObFPMPS1lScHO4NUWZXIEUN6k08BeRRpX+U+Na3iIShcsBtfgf?=
 =?us-ascii?Q?TOJQsBqH4Y0SLeDSxHuP1v29Ocugiu3C2hw5GGXIGHWgtBj0U8Uv8UZ0AMO/?=
 =?us-ascii?Q?NAqB+q/Xy80IYEX4yrG9cTRpozOlKylleYBQXKkcRfXlFs7YcWJbbOuGB9ci?=
 =?us-ascii?Q?Pzg8V5wY6gLl/9Y/Kp+/vnzk36iDhIblliGAyYvBOvWtua5PUa3cdA77Wrvc?=
 =?us-ascii?Q?L5NdSd99Vwl7KAe0moCswY1Fr//THotxtxQ/U7Nc1Cq4AnirNWbNp4JYX4cR?=
 =?us-ascii?Q?7z3OJVq2ehub9Pv2KOtTdAuoOECeyFe4iENOm8SOKdmVADj7Y2nAWnHEBvtH?=
 =?us-ascii?Q?nh8SBoMOCO1fUjLl/Vfz3T0oVky9xI4Q3CpPmV/KehXvy7DiiRBZPhw15SOT?=
 =?us-ascii?Q?ZrJ5sJXxwJ6B6oaMYAia9GGnyhkFCtSxkAuMgVNZhcmzoyg720aoWSzSbfwT?=
 =?us-ascii?Q?7eFBSunmK3yBzlMlUodzT3DZT65Gv+4PzcCOXGOS0f/Td/6I7mNfdc6LU1Tn?=
 =?us-ascii?Q?yD/MGf3tWAAxpfLt2HXFa+BjF4jdEU/zAnD1ON5ZHWMehc9mWFnWbDE3grJz?=
 =?us-ascii?Q?MHyN0lUjfLm/Vzx1941ou58s4GTXf8B1fn2T/+/mueRe7Pq7YUXR6NTcB9Wb?=
 =?us-ascii?Q?Sqr6TfSQ8FwFA6oI1bxoIzqyt7rCG3FImS8FWVlO6sHbkYQmBSI1C/kx53Ux?=
 =?us-ascii?Q?qZ5kdW+F9GSKX9czaxGCV9fcB3wBwqE89081y2WmSDHW9BB3Jz1Jt2PWxucF?=
 =?us-ascii?Q?RMXTvmTnqJYt4nNPS+hyMMTYNIPwaj+9KuzmQGxBYaJfIV2bsy1eLMxj+c+u?=
 =?us-ascii?Q?WrbBD075WgfsMB5xRyWWD/MLh5AtvQGR2w14vR8EDl2Q6WrJ9wVda/Da5d/d?=
 =?us-ascii?Q?wBRXFC3tq0awCRjaF7J8vz+fxvllE6ANHpK//kLZwf2ea2cEFuQbJsbzw1gK?=
 =?us-ascii?Q?jsXUFjJtfnMm5G9pPhWCTyhkXR1TJZRtD3TgpRaxmy/zktM/p5gSxzOzsF/R?=
 =?us-ascii?Q?PiscoMLrKwRLCBzppAHhn2fkux2lFVP6k9xfXANh9+ypqjHE0kfR884RiS7R?=
 =?us-ascii?Q?ADpntf+M5h01TV3vK/7vX3cLmOwFelHX4aDfL7zCtc9p3LiW+dYvC3oNR220?=
 =?us-ascii?Q?zT8R5t/XUYxc/PTNFCOtQYekIO4r4Oi4aQF2rMyGFCISAQI81ySTqZkGL9j/?=
 =?us-ascii?Q?CaAzcxERtYWmNFxx+eX1aCxeSiQxK/BUiwVVmgFQlGu/DYFv1yBsp4sDt4+y?=
 =?us-ascii?Q?yccjEC6Bz9zCT8UU7v/UJMK7hSIwpvreA5BlgpW2iIQ3eo35log7i3NmbbFa?=
 =?us-ascii?Q?PeWd9mjcjJuKkfR8sfUIhH1JB1UlxkE9Tm5MgPHeuhihmVleM61Bo5xrTYb6?=
 =?us-ascii?Q?oeA6kECKOYKRaraXhTo/p5zhvDVrQB5LYkrfYvAwn22mVDiVftYSTg1duEhn?=
 =?us-ascii?Q?fcy6+KIcf7Czn5oARbemCHpMDMkPjeAUfm4RRgQjjNTCi4ZQ3fIWNtDdsMDO?=
 =?us-ascii?Q?BPprYhTXwQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4de73a6-77ef-477e-15bc-08de77b6a5c2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 17:19:08.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+7O+GGFD+vripqfXyCCe+3qFELX/ZsynLzICssavUqEyvI7vKdzK07Hp0jAvGCxc03AwCRch1OTdE86LoFp3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_091916_175670_298D4DBD 
X-CRM114-Status: GOOD (  12.83  )
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

Currently we only set the default values (cpbm, mbw_pbm, mbw_max)
and do not set the corresponding feature bits. As a result,
the MBW_MIN/MBW_MAX and CPBM/MBW_PBM blocks in
mpam_reprogram_ris_partid() does not apply the default config
because they require both rprops and cfg to have the feature.
The missing feature bits may cause other issues in the future.

When initializing default per-partition config in
mpam_reset_component_cfg(), set the feature bits on cfg for
each resource we program (cpor_part, mbw_part, mbw_max)
so that "configured" matches the default values.

Set mpam_feat_cpor_part on cfg whenever we set default cpbm
(cpbm_wd implies cpor_part).

Set mpam_feat_mbw_part and mpam_feat_mbw_max on cfg only when the
class has the feature (mbw_pbm_bits/bwa_wd can be set without
HAS_PBM/HAS_MAX).

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
Without the fix, mpam_wa_t241_calc_min_from_max() in the patch:
https://lore.kernel.org/lkml/20260224175720.2663924-39-ben.horgan@arm.com/
sees mpam_has_feature(mpam_feat_mbw_max, cfg) as false and always returned 0
on hardware that supports mbw_max. This causes performance degration
because of too small mbw_min on T241 platform.

 drivers/resctrl/mpam_devices.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 9182c8fcf003..be4b554104e3 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2618,12 +2618,20 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 
 	for (i = 0; i <= mpam_partid_max; i++) {
 		comp->cfg[i] = (struct mpam_config) {};
-		if (cprops->cpbm_wd)
+		if (cprops->cpbm_wd) {
 			comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd - 1, 0);
-		if (cprops->mbw_pbm_bits)
+			mpam_set_feature(mpam_feat_cpor_part, &comp->cfg[i]);
+		}
+		if (cprops->mbw_pbm_bits) {
 			comp->cfg[i].mbw_pbm = GENMASK(cprops->mbw_pbm_bits - 1, 0);
-		if (cprops->bwa_wd)
+			if (mpam_has_feature(mpam_feat_mbw_part, cprops))
+				mpam_set_feature(mpam_feat_mbw_part, &comp->cfg[i]);
+		}
+		if (cprops->bwa_wd) {
 			comp->cfg[i].mbw_max = GENMASK(15, 16 - cprops->bwa_wd);
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops))
+				mpam_set_feature(mpam_feat_mbw_max, &comp->cfg[i]);
+		}
 	}
 }
 
-- 
2.43.0


