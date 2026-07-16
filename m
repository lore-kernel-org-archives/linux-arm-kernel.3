Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FBBC44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHbPvgDyoIOZZHalzMAUJlP9TZOpHhJCbb3hTpAlR0U=; b=sv5SFjchgjuSXmPB30WZCGMn2O
	NkCkBJhBlGKM6F53lGDaX1uvxm+xLd16mNKBCtOMaQMFrecqg/nDKAxhSydbqheLYBP1z/4gqmUTr
	H8n+ibIGKjzTBpUuVH21/jPmO8TKS/nV6mPi+FYP/Q5I3xKCLAsz+5aJ95FajAUEUCc8v3EQCgiPf
	UfiPLwcpPfr9YfBsdpFB1742VWZN6iMaJMzBM4IJqJ/sP9/r6DMGTnDV/w4xJO23dvSQqax/u+P2U
	VvLPHM6n3GTeQoseQVV0quV4mT8F5lwX3pvNte2MpLBQCQtg+CzqFeLzDiVSrOvRbQWXMBcEvxy6J
	PaCPslEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGH-00000000Z63-0Rvs;
	Thu, 16 Jul 2026 21:04:53 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFS-00000000Y2O-0Xxj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Skah8fjvCqq5eAbWt8cApu/Rd0CkW322zHYBwCl7zGx6JpGNcKHucTfx7eN+SIxDnA2swaJLnNWPCSxic9n/hvK9QxBOfIeOCFa1SoO4zJEhG8Q6B81neGEnNqPr6DV/ayaAu1RyWD4JZSvhife3U1wxbwzacYgamDd/0Hu6SvSxTohnUTLwOFnnmRj7MX2wzceRTJyBOifU3YzKkDkiJxYrquR1C4X8ivJ9/JG+tCrdr0THcWpsdDgLc/swqxbvPFLicXJVS88erF0I05eAfT6kupnO4S5Q/BWHYMomlDX78Vcf9pIGGmEZUpUtNfb0RLSBCTHFpEhcJRlhxCpcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHbPvgDyoIOZZHalzMAUJlP9TZOpHhJCbb3hTpAlR0U=;
 b=u1F4WcjQx5JVHY8e1w9KBN5q5F0fkY90y32Y8zzkK2bUsjavFrgoUA/Mxi74g6uA8g7IO2UaHYv+EUfq6MK/MidGETuKbowKh1HgTNoAZ9VfyH3Pu4cRrhf6lmo0/6+Nm4GU3Ipnb0xOzvsqkXh9YdHF83Jrp2xy2gSpyVUfHNamJ96OMEYdiTQiSevINwbt+OVR6FkG/z5LycQjGP3gRhHlXr7QWa5FynjdBCFH0PtEaYDHayZfFYP/TJSu5tD2ov9Gd9gDXmgo9h0smg07qjNJ9lGZITKFGCua+79BR6tQzIbViMI/uaUqxMrqiKdJp3NxVGaVrAAvgILDxrMS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHbPvgDyoIOZZHalzMAUJlP9TZOpHhJCbb3hTpAlR0U=;
 b=MVjsajpuWs4wI6NGSoUPyopo7+gf49UnCOmLGOs4D3ucwSA0ZvOmdyJi6festOkAKIUexHrSmSTtvtmR6cPdQIA2kmWpZKJDEdiHIOiXZf6U1Hp/qPFUeT9eGN9ilz36V4KwCmDRp/pSTJGM84t6y6h1SrW0fP6MTRd3rgONLXKjGrGO/XQfOZWF8s8aYLFP4RiBka1UYAt8BZQIACjgCmiDCRiN+bweno8rXrzNMMvSEmDGN6RRM+kHTJ7hzSn1csa4GVpRojpzjM8dTm8741ejAu4U0HroAyzsssqxBPdXzwQAky8Xfxm/nQgeSEmD7BIN2mKYalYu83/SpA8sBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:50 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:50 +0000
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
Subject: [PATCH 16/23] arm_mpam: Include all MSC components during domain setup
Date: Thu, 16 Jul 2026 14:03:06 -0700
Message-ID: <20260716210329.2914625-16-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c277384-0c8b-45b1-2697-08dee37dbc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: bRCmVfLUFJ8eU3aeiQRL4UEWj+LZy6AMP5J3jTsd/V1MnjvPCQnx05XvEOe51ko4r1pqgWztpkQGMtX4iS9l/EVRSMNK7DU3HjGD1/ghJrONLRJ4/f8ptKl7NX0tPPPvL3ZNcji38+pCT+7490J6QYgHU2NWLYnN8Dydjq2b0fFvVLMrMXrZ0vm9B58/B8cnkWFuu/EqcON5bFbwf8Bd9euZM4REoHm3f7m/EhlI3uj9mW6Q52iTsL0d6eqRIHsGoww1wp1y3KojNfzT2q2fuIARLDav26BMdBuRAdnTPyUv9mq4FrbsQjxbu2imcWdxOeFS3wTLr0md4DnazYi+SZzKUbDthppTOetazt3JVYqoDkRPCSJv7291BIOYZa1XJBJvX3Lu0qwApmxS02mRE5FjlmZ5N1PR4RekQO8RTRb6WLi5o6Va0z9h5CZplAXuY+Yz/hOMx5cSF1/J5xM+hsFKUb7dJfDmV2C8aKdb7SSHJbjxW9Ug+wJcf4c/ZLcgEyirZCyp9JaoCVAKyaT6wwV2eB3ko0fcP1I7ofKUL5mJlfjN8Z640gs+kNNIqe6FkVLmlNmk9h+7cBXavSgy6OGqmNL0bw5O/zki/b4E9NOMQwQDPRqXXAebPleD3+AEvODgb6nucxssxtSuBJQs9py1FQv4wpT5QSALNQEN1rPYqwaLXJWwKpWUi1WA56L3eOly1vt+damNn2TJoQxknA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WmxFyMS98kY6Gxl40PWKAj6nZ1hypijz6ngfMW6nzjFna0JidB12VD4hRwVM?=
 =?us-ascii?Q?YHSUb6tgGnfGFqM4MDLaaEqjLfIj/6ybXX3kjPtjySaMceDsYr4rMrrDflcl?=
 =?us-ascii?Q?HPydE5CS3aR6nY8j+oMOwiq/pahI9zFFQfrYxKXIrFpehjitegU7Bq4yP6y3?=
 =?us-ascii?Q?M0lE3V4etD2Hi8KP45edjw8Lo0uGUdvZCaOWUqm2DA+vjFwjBL0gNT22diHo?=
 =?us-ascii?Q?p0rQlxx+gk+pVyO7/WnngXbX+PI17e2KTFhMH+DjGhBwa/RDh4kP4ge2ozMc?=
 =?us-ascii?Q?/lMKRmutdSqsYY3orLgQpg6HUKbENo9E6LRaAEgHKwE8APhoxBg42ScGFvtL?=
 =?us-ascii?Q?vdnBzLXzIfhu3bEMpDv+own6AvMS5hJ87mfXJ/MpBCx5LuAOWwZUJc6lwq+p?=
 =?us-ascii?Q?s2EvUxICcxLpci4I4kxrIsY9JqCJ0mz2x0/PgObvY6NOdWu1LdHB/oC3S7VB?=
 =?us-ascii?Q?ckh0eS2stPmARHVrFplj5avL/l8DVBTHymIX/gDeCY2AKQGyb8Sf62qXLGO6?=
 =?us-ascii?Q?wC/b3bleZ/mb2Bk/3m1utd90UBppAnVdjM8haEInYQLGr8HQiiBOKK3ih0w7?=
 =?us-ascii?Q?ClqpT2VjRDw7hSTQIEHbPErGt3PUmUSJQIXCuEQzQ7h9CUHLiiNe8thHEn3E?=
 =?us-ascii?Q?yGquDSm4RNZCz9kr7+07LUFN7Xz+EwGcaAguew/R2N9Qpw1FWxRjb1Y16d4S?=
 =?us-ascii?Q?2mHe30zu38+fc8C8x8bsYapbJkKzeB4/0qg9eipl4bPsf6kUR9sOOhwMOQjL?=
 =?us-ascii?Q?9NBFU8A++vjP00vhlpcZbQ6naJUTzOl5xHkHX43EfdVOgygb6g+GaXiYVcpY?=
 =?us-ascii?Q?KKSEtY5945otn1TbRvnJpy23SfEv/thKm1NZAp6BO4pZbUWTgHgAfCrhffpc?=
 =?us-ascii?Q?QCoE7XDAK/8vMIGs521NKIEUMKMqlXNZNew3wWcCuF5LI7IsWhd+2hlIeAoi?=
 =?us-ascii?Q?fuV0awWBv/ya5k2pT9oynIl7AdD5vamc5f/Rr4FzMgv3jMzyTXX6+BK9J+hP?=
 =?us-ascii?Q?DR4icArvBtckgVVTVIzDsvabLZP3zCCdq6GQLt/An0Jse7GYqCLVR401ys6e?=
 =?us-ascii?Q?iVVvevJawmf8wRLnR24Vr8igSiiqn8q13fv3pSCbP3CRaDKpZpwYIgh94oUk?=
 =?us-ascii?Q?VR6uHdOMotKaWjIRTuGXnFaXacy572RiDwBmcbhuOuSMcFHkryb0zcbUjdB0?=
 =?us-ascii?Q?UjvIaQxnHdvxBU+2hZA8E8jeAEeOVvtHuNkiFUwxy4cla9zOQm5RECe1KQ8F?=
 =?us-ascii?Q?bo232vYQQkdBLg+mqvJyK8GFEyQC5nzBXZDCgXgYoqf+dEwcMXUdBvN6TP48?=
 =?us-ascii?Q?p0EdloXdqC/NofCf/z/bK7SwaTTuzY6zRHsaEvxLrxjYLkgKWRImjXjEGIh3?=
 =?us-ascii?Q?pLGPC5JhLJk//i3gTgP/ddZZ+mRfpi5GFp5vfi5djzKZiLiAYZtkM3ebpORM?=
 =?us-ascii?Q?cS0iU39mEQOddJAjkyT34tHVm+So9yjwB/SaXz45IYUL05tcWMaFUsTUFVkK?=
 =?us-ascii?Q?F25EcZZflMpm9H8vi8y5kKVkk0V3syrkmHqIgKYwfxuouv54eDyLcZ6b6B3k?=
 =?us-ascii?Q?YBI1q9eALWfAeQ1796ca46Yjbo+kJ/qRug38jxXlhGqrDx+x3R0zhrMOvPCK?=
 =?us-ascii?Q?wrZc8mN1ODgV6UJXut3n8U/Eg+gkpETB+LY5RYBoifhkR5W8SyJ+yauFnEYF?=
 =?us-ascii?Q?tp2ebaCud5NIZ5dPJ2uBVEas/k5E4vVrEevPDNGzqu11lxyAo7qtsUyZxuUT?=
 =?us-ascii?Q?cgaDf/qVuw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c277384-0c8b-45b1-2697-08dee37dbc6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:50.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPhYovoVjBig4olrfSNJLqMqKJNR0ehG6jDuZvQo+QdlLgEkAlBAhuZNNupz0dxY+e/g+Vwh2ANlAkSr6eR9dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140402_177961_14D04897 
X-CRM114-Status: GOOD (  17.70  )
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

Iterate all MSC components per CPU when creating and looking up control
and monitor domains on the controls branch. Key monitor domains by
component, support MBA mon_capable lookup, and report mon capability
from any L3 or MBA monitor resource.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 197 +++++++++++++++++++--------------
 1 file changed, 112 insertions(+), 85 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 86458a56a526..f67647d95bbe 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -95,11 +95,27 @@ static bool mpam_class_memory(struct mpam_class *class)
 
 bool resctrl_arch_mon_capable(void)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		if (!mon->class)
+			continue;	// dummy resource
+
+		if (mpam_class_memory(mon->class))
+			res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+		else
+			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+		r = &res->resctrl_res;
 
-	/* All monitors are presented as being on the L3 cache */
-	return l3->mon_capable;
+		if (r->mon_capable)
+			return true;
+	}
+
+	return false;
 }
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
@@ -1719,13 +1735,12 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
-			       struct resctrl_ctrl *ctrl)
+			       struct resctrl_ctrl *ctrl,
+			       struct mpam_component *comp)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_ctrl_domain *ctrl_d;
-	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -1733,28 +1748,17 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
 	if (!r->alloc_capable)
 		return ERR_PTR(-EINVAL);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
-	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
 	if (!dom)
 		return ERR_PTR(-ENOMEM);
 
-	dom->ctrl_comp = ctrl_comp;
+	dom->ctrl_comp = comp;
 
 	ctrl_d = &dom->resctrl_ctrl_dom;
-	mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
 	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
 	if (err)
@@ -1772,13 +1776,12 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
 }
 
 static struct mpam_resctrl_dom *
-mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
+mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res,
+			      struct mpam_component *comp)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_l3_mon_domain *mon_d;
-	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 	struct mpam_component *any_mon_comp = NULL;
 	struct mpam_resctrl_mon *mon;
@@ -1789,24 +1792,14 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	if (!r->mon_capable)
 		return ERR_PTR(-EINVAL);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
-	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
 	if (!dom)
 		return ERR_PTR(-ENOMEM);
 
+	dom->ctrl_comp = comp;
 
 	/*
 	 * Even if the monitor domain is backed by a different
@@ -1821,7 +1814,7 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		if (!mon->class)
 			continue;       // dummy resource
 
-		mon_comp = find_component(mon->class, cpu);
+		mon_comp = comp ? comp : find_component(mon->class, cpu);
 		dom->mon_comp[eventid] = mon_comp;
 		if (mon_comp)
 			any_mon_comp = mon_comp;
@@ -1858,25 +1851,32 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
  * for anything that is not a cache.
  */
 static struct mpam_resctrl_dom *
-mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
+mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
+				     struct mpam_component *comp)
 {
-	int cache_id;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_resource *r = &res->resctrl_res;
+	int id;
 
 	lockdep_assert_cpus_held();
 
-	if (r->rid != RDT_RESOURCE_L3)
-		return ERR_PTR(-EINVAL);
+	if (!r->mon_capable || !res->class || !comp)
+		return NULL;
 
-	if (!res->class)
-		return ERR_PTR(-EINVAL);
-	cache_id = get_cpu_cacheinfo_id(cpu, 3);
-	if (cache_id < 0)
-		return ERR_PTR(-EINVAL);
+	if (r->rid == RDT_RESOURCE_L3) {
+		id = get_cpu_cacheinfo_id(cpu, 3);
+		if (id < 0)
+			return NULL;
+	} else if (r->rid == RDT_RESOURCE_MBA) {
+		id = comp->comp_id;
+	} else {
+		return NULL;
+	}
 
-	list_for_each_entry_rcu(dom, &res->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
-		if (dom->resctrl_mon_dom.hdr.id == cache_id)
+	list_for_each_entry_rcu(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
+		if (dom->ctrl_comp != comp)
+			continue;
+		if (dom->resctrl_mon_dom.hdr.id == id)
 			return dom;
 	}
 
@@ -1884,14 +1884,19 @@ mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 }
 
 static struct mpam_resctrl_dom *
-mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct resctrl_ctrl *ctrl)
+mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
+				      struct resctrl_ctrl *ctrl,
+				      struct mpam_component *comp)
 {
 	struct mpam_resctrl_dom *dom;
 
 	lockdep_assert_cpus_held();
 
+	if (!comp)
+		return NULL;
+
 	list_for_each_entry_rcu(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
-		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
+		if (dom->ctrl_comp == comp)
 			return dom;
 	}
 
@@ -1902,6 +1907,7 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
@@ -1912,30 +1918,40 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 		if (!res->class)
 			continue;	// dummy_resource;
 
-		if (r->alloc_capable) {
-			for_each_resource_ctrl(ctrl, r) {
-				dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, ctrl);
-				if (!dom) {
-					dom = mpam_resctrl_alloc_ctrl_domain(cpu, res, ctrl);
+		guard(srcu)(&mpam_srcu);
+		list_for_each_entry_srcu(comp, &res->class->components, class_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			if (!cpumask_test_cpu(cpu, &comp->affinity))
+				continue;
+
+			if (r->alloc_capable) {
+				for_each_resource_ctrl(ctrl, r) {
+					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
+										    ctrl, comp);
+					if (!dom) {
+						dom = mpam_resctrl_alloc_ctrl_domain(cpu, res,
+										     ctrl, comp);
+					} else {
+						struct rdt_ctrl_domain *ctrl_d =
+							&dom->resctrl_ctrl_dom;
+
+						mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
+					}
 					if (IS_ERR(dom))
 						return PTR_ERR(dom);
+				}
+			}
+			if (r->mon_capable) {
+				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
+				if (!dom) {
+					dom = mpam_resctrl_alloc_mon_domain(cpu, res, comp);
 				} else {
-					struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
+					struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
 
-					mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
+					mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
 				}
-			}
-		}
-		if (r->mon_capable) {
-			dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res);
-			if (!dom) {
-				dom = mpam_resctrl_alloc_mon_domain(cpu, res);
 				if (IS_ERR(dom))
 					return PTR_ERR(dom);
-			} else {
-				struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
-
-				mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
 			}
 		}
 	}
@@ -1949,6 +1965,7 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	resctrl_offline_cpu(cpu);
 
@@ -1964,31 +1981,41 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 		if (!res->class)
 			continue;	// dummy resource
 
-		if (r->alloc_capable) {
-			for_each_resource_ctrl(ctrl, r) {
-				dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, ctrl);
+		guard(srcu)(&mpam_srcu);
+		list_for_each_entry_srcu(comp, &res->class->components, class_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			if (!cpumask_test_cpu(cpu, &comp->affinity))
+				continue;
+
+			if (r->alloc_capable) {
+				for_each_resource_ctrl(ctrl, r) {
+					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
+										    ctrl, comp);
+					if (WARN_ON_ONCE(!dom))
+						continue;
+					ctrl_d = &dom->resctrl_ctrl_dom;
+					dom_empty = mpam_resctrl_offline_domain_hdr(cpu,
+										    &ctrl_d->hdr);
+					if (dom_empty) {
+						resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl,
+									    ctrl_d);
+						kfree(dom);
+					}
+				}
+			}
+
+			if (r->mon_capable) {
+				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
 				if (WARN_ON_ONCE(!dom))
 					continue;
-				ctrl_d = &dom->resctrl_ctrl_dom;
-				dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
+				mon_d = &dom->resctrl_mon_dom;
+				dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
 				if (dom_empty) {
-					resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl, ctrl_d);
+					resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
 					kfree(dom);
 				}
 			}
 		}
-
-		if (r->mon_capable) {
-			dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res);
-			if (WARN_ON_ONCE(!dom))
-				continue;
-			mon_d = &dom->resctrl_mon_dom;
-			dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
-			if (dom_empty) {
-				resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
-				kfree(dom);
-			}
-		}
 	}
 }
 
-- 
2.43.0


