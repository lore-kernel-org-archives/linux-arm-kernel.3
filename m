Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F566CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lLiP0q5IFLMxnjMShTLnnnDTwSWv5Fa39Icu54ILZE=; b=0mFmi1tbrwzeqzYibBOFNgN8Lt
	PgdqZ8HcWtPEOEwPBIkPdzRf5kqY286xDNkHZzTmh31eP4cTHOtflMbFGEp3AT8el8QaeOsH0woAk
	MjglEPA8Sst/NIV8D4dbqhmGHSsNc/IpJ6Z/D216nGMS/zS4rFe5s2XIJfYHgwfy2JFjMSBOnzj8S
	JKrv9FuApZ3ZAAXAveoNS5pEl+5HRyxVjUJr5/iadSYzNKi4NX4wJ0Khk0yILtl/NKaEuwgZAnY3s
	zhpELXVwrsaUmZOxyg0WNEXpRYK/r2OSgxCnu7jrR6C3myUSSabKpBbVrunfNOXLAtdFB3fSbDlrG
	2CEA88nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxS9-0000000E6i4-213z;
	Wed, 17 Sep 2025 19:04:29 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxS2-0000000E6Wd-1wxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sro1GpR7LO1K9Z8e/DuveA7iwvWBnLVO+OCjkuI7U2jxwskraipCORvtHcweC32beNOVoNFXzvP5KQ7ZFJrxJNv3odQ/FPXF39y94SG4aBGzyZN5wtW22FS2Yy1n9+nG2bVbxJaOvJOIzEMP0ng5hPYc2bFrLvI4QwJqHartuYKlPWQ7SknTDgJN2EWxdfgH9HOSue03R5+M0RPG+9RRoSQzC0wfgZ8t2ZaQJ8zJW5HawU6kpuc1RjSQNnsQiSTgiyP9WfvbVE+xUtZXHb+vJftblltvBbXBURvbW39uO2ah0SuxZshmxUgZZADmRgqmHrItSCCTWSefgL9fvu4+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lLiP0q5IFLMxnjMShTLnnnDTwSWv5Fa39Icu54ILZE=;
 b=KpEYhVG2YiPPzpBW2ol03ARP5kbbfD42Is/Zn+9zGZvdzpWZhvhtQDRXaD4ZS0eN47XNmebrLd1bhhxZVPx6v6OUsxtZIzjq4wxW1pvptz+Xe5Z7qtmzetZtRtxpMeVSPnyjbLxnwn2RAhWRquX3Qo89i1xgQFn+Xq2x/2OeKRQm1FhuiSxHWQwGufJVUNhNBxT/naahf60KX3ZhoJtTvuk9BLlQ0iA3xcsyjUR3rIMHpNVHuEKe5r2EM7S7czemKu4mrOjqfQi6CV4XIE5tmnS3N3323kcdU+QhRmCjKAdDMTZCRj8O8Gdfoh+FcRfEY2WZHKmpGrttJV3eLdgtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lLiP0q5IFLMxnjMShTLnnnDTwSWv5Fa39Icu54ILZE=;
 b=QaXa9zVl2v9pRn+a+RPk0PEepiL3DHfjMKFySB8MmLPuI6XpKYZbMZMQyaZvQ/UO/bBK19PccXXiah0b/A157GOylwBLOpRaug7PP5K2bF3iKh9JwdOUCBVc3Pi9t8ji8bjLSDwkcZ4RJAWMhrRD7ndPLWmDfUHN2/qFyZhtvyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV8PR01MB8429.prod.exchangelabs.com (2603:10b6:408:189::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Wed, 17 Sep 2025 19:04:19 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 19:04:18 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v8 5/5] arm64: kprobes: call set_memory_rox() for kprobe page
Date: Wed, 17 Sep 2025 12:02:11 -0700
Message-ID: <20250917190323.3828347-6-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250917190323.3828347-1-yang@os.amperecomputing.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:930:4f::16) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV8PR01MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 1858c89f-7f5b-45f7-96a3-08ddf61cfeef
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1JtawaK/mkDWiXpIKt/cJAWxwvDIj4IMxBHkNO6MuHPLZ+l1mQTAIIFuaEgN?=
 =?us-ascii?Q?gGBesFt6zFrLRsx9Np/aH0F9P25K2Rhnz/lLcEG3XEbZTiO3wrv1/pWvkXgV?=
 =?us-ascii?Q?bxuZBxI9yGEodhang7H3oc0hGUWrE3D1q+nhgmgr+s4msW/2pR5Rqj03SlNw?=
 =?us-ascii?Q?cJvstd5hK8UDV71OMhVGJ6Y8+CJ2sD3pjGuHp3wr06TggvRIVaDQMwjT6sKz?=
 =?us-ascii?Q?kMG7LuXq1vNy31rcY1InpsCdWTCUHa5aq4cLzVisvhw9MfiDD5zz5RRfDJav?=
 =?us-ascii?Q?nbKeTPwjDD9GoyJPNDae74K3NwX9f/j0PmRhOeg2JKoGFbbZ1KbLj6WgVn3n?=
 =?us-ascii?Q?DRjqJVS6DBDkzACKJVEBzcH5sq6HZSxn9xbranJld8VycZtndKYss5KPmVgf?=
 =?us-ascii?Q?06AEeeSIcyptHC9Z7KIwZIy4NSeAcJAoKMDEOwHaZgzXcSjKzV90/v97o8NX?=
 =?us-ascii?Q?DFRqCE8p9/eKd5rSGo69xLe62RzMTFfZclomPqJGfcKSexzRqpfxORY1JirT?=
 =?us-ascii?Q?bYC713YAReW0OvExyT+MoPqVWJtV9vaCYqijCOWFw56e97LOsFiF9VNl1vo1?=
 =?us-ascii?Q?ZIG9gsEeqSQwxo6EhEeOn8X2WA5k9bZ7ZZ2LRB3K+mI90BMXCuDx0cfVqzy7?=
 =?us-ascii?Q?109mgmgqoDSGlZ0Y0FfJe5gF58IuzOi1slXBrKLBJxcUm6F3Ev2mvQSCNFou?=
 =?us-ascii?Q?kw1k4JAgwa8PLuMQpim2iprxx7o80dW6LY64lMd4buiFPRhzLKYEgEPBXzE2?=
 =?us-ascii?Q?IV1tT4RBLyoXjI99y9znXmVyEu63gRPeNzJfki+jPa+AIaT8gr+NUtFr6GY9?=
 =?us-ascii?Q?1Cgb9hHEKF+/EKIlzPAq++3yp0GsA/14BeznPyJYjxUJGdnvv2r2m6HiaEJA?=
 =?us-ascii?Q?eEpugy9UqzdJcpMfIbWvdNSWKMTfBr9rOlQjmcwZFpA5Cxk3D0xH9EjMhWTP?=
 =?us-ascii?Q?ebxkDS9soxj+FcVybywK6U/AD3ZHQ1/R8HGOCdAbEK7hbHSNxPJN94QtVv6n?=
 =?us-ascii?Q?TGYQNi21+mNnyirJOEJaioW9BQ7euT73lnCOlFwOJI+8UW+K2e36BeUw1EPW?=
 =?us-ascii?Q?TVE6YWVZhSn8JbsZEeSyOFgjxFtcDwtykPP5ydja6LSpx5mMcqFRGCvpeo3C?=
 =?us-ascii?Q?9ooL+4Tp7SAqfoa19zMl3nfyazyFIWRxwIvDjyNHWbQQYwyTDW5RyGPy8Bij?=
 =?us-ascii?Q?+CtN5y8ph+kWjqNpq7J6mdx5okp+NM0namJpUM89rxm5s34fZYWgB6iDQ9vs?=
 =?us-ascii?Q?+1phgvhFKsTg9Xb55ek+lxIZdFuN5d2ZPwPiElWzZl1jWviV49Mf2sgFpRPa?=
 =?us-ascii?Q?9Y6bHHBomtTdkbqi3qN3P7L/LEoLYC/kM7W5AYblGMIomsH4SaafqGWNOSqz?=
 =?us-ascii?Q?QmbW/rvIfEZT8WooWTTCCeArL3zAQCgpvT6jAiWLTCcimaLhmNGVNHlXmYRu?=
 =?us-ascii?Q?Di9HBbpZCg0Bt27/h+OwsTQ+E3Xrugu18JkcxAglGIAAU+5MCSlwFUTx8Y6O?=
 =?us-ascii?Q?3kb66Vj5qnzSivM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laP4Py5Bt0LKoJIrwbKKSekAN/757xgenTFh4i57Rxep09lwcLwwoNzfDwHb?=
 =?us-ascii?Q?ZctA57yPMcZA7FKwAujdX0ylI5YKfdzzqgocCHyMYDk+sDPMUKWAA3UWbF4D?=
 =?us-ascii?Q?RGDRF7pwnChO6UWUISegN+SAX98mcB8hd9GDCKbO1rL+yREWkIozVDL1054V?=
 =?us-ascii?Q?krOP2eaIXzLq9N6qOhOcL2yA8v660YhefwPym/RdXJ/gXiCCxCx8j6J12f2d?=
 =?us-ascii?Q?uQiarNbM4R0ZHLoQqnAquKqbZsPQ0YoiNCghwrXjVAeNmiZ5rrm78mt/MWiL?=
 =?us-ascii?Q?t+EfI435FlMuNS+Cun2MkJ6UIYI7c4S391dsBKjvZqwdNyAmk9LWW60me27l?=
 =?us-ascii?Q?6hlig8ueOCWwJ2uTg3lmgt8zBJr9KTT7zIS4nkp7xruQL3qmMUjkkbj6rOVh?=
 =?us-ascii?Q?IPuu7ebN0eF7POGf61UzwhI42jQlc/9OHLxPhbZlXQxYqZYg6DJIG6FRzRPH?=
 =?us-ascii?Q?ksEk50usiEvM99VFCf4I/LkC8KNadLCFCwvw4JszjzfiHrp/PjGh+ANHthD8?=
 =?us-ascii?Q?9ShP/+LjuEJpi2TiuKCpXxaczoLpw+qeg0N20FrqMiQj731hSzX2QXNbMK1+?=
 =?us-ascii?Q?/3O8LNifePkF9WMAXmRGVZZxGbZlIL4YbmIV2KTUGDhUx5+LX6LPZs1PXLj8?=
 =?us-ascii?Q?sOyoa3RxQZwPWQkiBc+4WdCsi1gkcUJPYYC+iPcpnDu6BA9PEayaoYBxvsKW?=
 =?us-ascii?Q?ig14jKzyIKHLNeqUZfkjL29Cnrfnby101Nic83JJ1NRiLyGF/xoNRAoZBCcP?=
 =?us-ascii?Q?TWmxeS7y+o+PrrAVd4HUQsCURemeAuxCBInROsDHMlczyiWncpEuFvQ4Wvdt?=
 =?us-ascii?Q?KRNl6jRpFwrke/XcPPqec1IyR6hPS8I2DR+VooQXlqG+O10xMRSgbtg4X2IG?=
 =?us-ascii?Q?IUU6/VFEL0opLYT9ck0ZgvGU+jo46yXbV4skjmnqd/Syu12JxGgaiPC/PdTi?=
 =?us-ascii?Q?cmYJHpaoM0v63kPWJPYYq6OAmLa5GyZdDVlK3mtypxCbJJJM4DzElyLXcr7F?=
 =?us-ascii?Q?6irJH31iw2ekkL6kBdIf6hCHqM5j6KcCD98u0E1dYSkl4GU5KlsvBLqAnLXa?=
 =?us-ascii?Q?0X7HwIUPpN6sn0ByBSIrBdgnlZwN49opBPfLXpqTMvDA3xZFRXlhipXLxWHQ?=
 =?us-ascii?Q?gFqKYXQrQeAtFJV1g5lMFKlxx/RfL5jY0pgkcjRf4yesiAkGpHhnJKgUpB/L?=
 =?us-ascii?Q?jvLQ4eaQSjGxCxrOb5dwr7AXQkT0OWNzPjfmYb8KFBhildiD7LXnPaHo6DuM?=
 =?us-ascii?Q?OED0yNSVvWyi0DiiAv5CEcfIn9lKk92S+0mIlzW925L2cixfokT+ukaHNsgs?=
 =?us-ascii?Q?ThG9xU81mjAAevxntIuyU6Wyfa+FzqjvjeCXrpDMIxFTK95ZUVQKeGuGsuz4?=
 =?us-ascii?Q?Gk6yw/5tDqgx/VOpZet3X0TKFjO5PmFndnRtT+Wl5yiJ8YlI2o6ip0Vf4x0d?=
 =?us-ascii?Q?B/Aoi29b7baC5FphINenupPEk236Q5Qe0m6L+rrAQA2deErvdW09NBK7+GIe?=
 =?us-ascii?Q?+4mmQf+1E/bvK5FwkPfMWndz8OdU+5WR73KZPjInCaisJ2DGh+C2XCSxxlCk?=
 =?us-ascii?Q?Siw4sBoRNN5h2Gkl0lhngdScxfhNoCtVXzM6IYDYRIepvnOtQcMZSTbGw1eM?=
 =?us-ascii?Q?Weuj2vYtxiRORGHUG+1tW3s=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1858c89f-7f5b-45f7-96a3-08ddf61cfeef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:04:18.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /okpRiSN3QJi/7yFi8vfAyuV4FzfqbNg3DvveobKiDqxnpF0NbWBLtBHKnCaRU0VXt8ir5Zuk/58HyjyuWTj/mGJy5GGrgfpgHenYxfxJRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR01MB8429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_120422_514422_C3751F76 
X-CRM114-Status: GOOD (  10.93  )
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

The kprobe page is allocated by execmem allocator with ROX permission.
It needs to call set_memory_rox() to set proper permission for the
direct map too. It was missed.

And the set_memory_rox() guarantees the direct map will be split if it
needs so that set_direct_map calls in vfree() won't fail.

Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 0c5d408afd95..c4f8c4750f1e 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "kprobes: " fmt
 
+#include <linux/execmem.h>
 #include <linux/extable.h>
 #include <linux/kasan.h>
 #include <linux/kernel.h>
@@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 static void __kprobes
 post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 
+void *alloc_insn_page(void)
+{
+	void *page;
+
+	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
+	if (!page)
+		return NULL;
+	set_memory_rox((unsigned long)page, 1);
+	return page;
+}
+
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	kprobe_opcode_t *addr = p->ainsn.xol_insn;
-- 
2.47.0


