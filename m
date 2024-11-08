Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF5CD5D695
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 01:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx4yuVRUqEO4AyisEW0Rb/Ol4PtWENkMerlyl6CPBnw=; b=4e5VoQg+U4h8dzruu3yTbf4WBL
	LJJ93V4HdBeTiTUbNpkW7TF+Sw/me/gGrBjzaoQZpshekumw3+2znhzNyT3cQGnCLf43U5GHgaz1v
	D5VHbATMw2W4JriM7b8Wj5xpp4DGS7z2selQZKCftny6gYGO4F5orD9jB219x/xwPY8N4wXbSBAe9
	yq2Ta9CMrmlIoX9mNvwiiHNxOliOq0nrLQgQ1/icS5wgBuk32CFzi7eEB5f8CbyVvxR9Q159BIl5U
	K0vjkej6XXoXNgq0hplxkDE1p0kFjxZ0bT0X16nOGoWWM+O9qSd8R114M3FZoagTHzjq7ghNyJycn
	NnAVp6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DZb-00000008uHo-0pGv;
	Fri, 08 Nov 2024 01:14:03 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DUb-00000008tla-0hOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 01:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biN7auLD5/Pia1ivi053PsvotFS3hk7M7gOt+pHGPf9qoEOLthWPHbyrfbLVOMsRE0i0DAYiSPdP3BsNFVupWqdiijQs23e2uE69rz/eUESnuqz27NwWc7RAE4H2VECii46uQQozZmVxgT0qEwcB37ZKA6n3y9Kebt3T+fswsv7gM7aAUmZDd0d4L7vGCqFS/x3uwBugGuguwwVo9M+HtaxusBatgNG/zaYZTmXTYxJQQpxEN2OX5rrrTyoxcBxKvvm2fSoRxy4qch5HtfcADzzdklrqW9qQyAfkaIeHkn5HuuTPtI7qmDfZxuMEMqCaVuXmCtR/Bn0yNOKCTiXhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx4yuVRUqEO4AyisEW0Rb/Ol4PtWENkMerlyl6CPBnw=;
 b=jLWcAAz7ahj3GRrhYNhMCZboPoDD2rr87r+qr1SrXl9nIEnXjWhVGoxs0sn1jqMPyStz+LlYfOIGf+j/py0KOU2PptKBms75N7t8nELgNJGS/cYLU09/o9q1yjTIM05v5dmUZ5ItUVCXegNKflUqDA7lLjA5ZlAnt3n8eAfVUoo1y6iHelhdaEryVxvc1wTs2YBEA/bQDGLUYim0COSAsUKafHA8jP9hb2nhgJQXjCwJ0oh9V7zSWJWEpwH+TsuK1MT+OCFVKZsXUp4HPnNLkHQvcJYaGlo2bqKWXSaO3VrqIrL0Dk2K6ZlwOIgCVUzJVT0farxZMnIHoOiKMyLNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx4yuVRUqEO4AyisEW0Rb/Ol4PtWENkMerlyl6CPBnw=;
 b=n/C+C0OgQgRS3FIRJTNXO85Djo+3WfJ4vcJ+UCXKl3V4uIhGRQI+dIKQHmHMEE2xPM7a8E3wFMrehCNERjDVdk3o2U9O8TNYRT/Hc7wooQwE/lzlJ74o7kmL15zraQi9xuyZRzG/uKEbJX7E9Q/UKEaARA2bDVFP3iopfg5pNlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 CO1PR01MB7385.prod.exchangelabs.com (2603:10b6:303:158::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Fri, 8 Nov 2024 01:08:48 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 01:08:48 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Graham Woodward <graham.woodward@arm.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] perf arm-spe: Add support for SPE Data Source packet on AmpereOne
Date: Fri,  8 Nov 2024 01:09:11 +0000
Message-ID: <20241108010911.58412-3-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108010911.58412-1-ilkka@os.amperecomputing.com>
References: <20241108010911.58412-1-ilkka@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:610:119::12) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|CO1PR01MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddda937-3b49-4a32-01a5-08dcff91e6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9/2aQVweG6X1Ct2+ZhCSQ/kFrP6RBSe6n6ktoUlbq1aSOftnhAn2y67x+KwP?=
 =?us-ascii?Q?AMimueefB+LbSjNnLOXuG9W+3/a787e4/X+AyVXBWEV9ImzhkRyV7qem4pyv?=
 =?us-ascii?Q?lKV+ECIqglu5mi2h4y+HggZKruks/SpgbDanEhlosOYeBtLArIQxQzs3W6MJ?=
 =?us-ascii?Q?3/j0QFFHplZxJiT6pMYWb6h/NIxaexHHvA2FZMMIu8UB2jmM1xVj4z7ymrzA?=
 =?us-ascii?Q?cgurNZqHfFdOJLdoQ+Z1rnIOYA46pNKKxO2Mnez8ZOU5NNUwEYa2+ppJ3A0R?=
 =?us-ascii?Q?aUIAWLIxaG3CDOXrDXQ9Apa6IPxvOuV1UYczMOtyrLGeJ2PNm5hKL92GTxgp?=
 =?us-ascii?Q?5AgwqmG6BQKqLDgeEDem+yvQare1CxdTKEAvMS7C0f3tRolX/DsfIWjHqQ5p?=
 =?us-ascii?Q?h7g4gfg9Y0vJQFB8Hy4W2w87zwT1V3BDOsZqd1ev4M5LwNgiI/mXNhr0aRtL?=
 =?us-ascii?Q?k2znRZLgdkUcyCOXzYlRGn21n+Vlzaf6T9rTcqCA+5kgK2B/NuzXuXKLTg8L?=
 =?us-ascii?Q?FdT6ert3eBiBlMxFb8T7/lyG91cA2f23n3w/lHNTVvZseCvdh6g50qJHyxaH?=
 =?us-ascii?Q?iQhwmFWrsjcfA3d/OoqRotFMcamMAYhM9Q/r6iHqkDSOeFGWC8VivqmIOYBp?=
 =?us-ascii?Q?RTHqybyNMXxFw6DFLm8svK24P2MsFXgMKfXgbcrAbtITAfS/D9kBl/Xk+MWL?=
 =?us-ascii?Q?Cu9VmKIn7v7AAH7tbt84U6A9a2j+iylW/MyqtTKR3elhSRFYai6Yn32L1lGi?=
 =?us-ascii?Q?cepLAhkolHxyps+BxWk++dpRAZYOs2Mo1y4AkhQpIUW4QmUIpC8FXkmfz2+t?=
 =?us-ascii?Q?bY07Jeixhfe2ZW26DWMxT1aJ1H+SjOlsSOadqQ5bnaw6nIJQfJHLNVmeQ7fI?=
 =?us-ascii?Q?L4ltL/52pVByTuk//bl5EPbC8zXY6tdkggO0aZPAQ/wPMUGNm6eGIAlYlScO?=
 =?us-ascii?Q?xokVBY2T7iFbSbwUl4qx1mpy8FCFut6lCsx3YF3VkX2xqJn7TfY8r93wdEGE?=
 =?us-ascii?Q?D0TPxAWbYU2luDhW7KcLd2DnTBCsLIDIZnhdfajmCQWbcFxjOgEMmFqgHwjL?=
 =?us-ascii?Q?RS04G+x7nAm1bAlqvxqaDyQQaUanrEMEPoFDy1eb7SPo3YAG/5+A6S32mLx8?=
 =?us-ascii?Q?ligBKn11UicTWHsEBHvlzNLGleMWItVcj0LQzVaIdJkYPxJreBv4tfnhlp+j?=
 =?us-ascii?Q?6WXqGuk2ZBq/uTKLj5iKcRc+7xrw5rMEAXd32JWgdqAbCd9sb7lujzD9E027?=
 =?us-ascii?Q?x63LSyZBZGm+scOekVyjrj/yjcFup32NEJ0KU1SneEX4Jw7tce4MD7jGoJES?=
 =?us-ascii?Q?ODtB4p0EX+bU/wkGMP13UgJIe7VAmwohAasIuHQk+Jx7g9cO6EnvoH9KYY11?=
 =?us-ascii?Q?9LqPFhTwdhjMS1rmwZ07tJC2mXIp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXAOS9Xq1sQgLFZetGX28Q4E6g/96UywD7zfVd9cnyNOuJ1sfyx2Q2yDm2JC?=
 =?us-ascii?Q?3F2vYWQU1nxPcgq1YLPRey9aKCVuGVG9jUmbOMklllQ9tOIAZ2on+DpUvagG?=
 =?us-ascii?Q?XHGWKaaElKrFxKay0tCx+4/ag2M6bXfWcwRyTk8M9mzUOgJRSY1oCjBf01Ss?=
 =?us-ascii?Q?HUx3vSqHgcZo+6zrhzTIrDHMEVWlCNx7uxaik+1MbSUVDmIXQxXXMOyyi/Fh?=
 =?us-ascii?Q?AIgnepuob0hkYuNuNxAHXzk3XIig69kHDSVsN6pTLleCVxrBpoPMAUsf4YZF?=
 =?us-ascii?Q?GtEx4uwhLW5PCkQj7Aa+dUdiHGcYI1HeEaDS/Os6recbT0pw6foRzuq7PTf6?=
 =?us-ascii?Q?HDRmSfe6897ZK4rBIhifnFI+U7hqr67azWh09zB/ZNNlEnvqzSYN4Q8a7UgS?=
 =?us-ascii?Q?dKiXm0ozSfLkEodjTXjF1fKAqTzMuQ8Q5UDGyEmEz3GgLYiONGwjI4BmbZCh?=
 =?us-ascii?Q?kxyPKMNYshrGdjrs3seBdRIC5sIoNJpbBCne3nVTGd9VM81SOrExd+aKuBu5?=
 =?us-ascii?Q?Q2Wr7nB+AXeqPvJKNO6Stg4abcAvz8JpWS8+0wDnazZeL86TNvTS/mGQ6TiM?=
 =?us-ascii?Q?QM1CrQ5ygIfICLJsdXcuhkP/n3oVLft8OrXc7Xm6V8pjvY/nkrxEa9576lvY?=
 =?us-ascii?Q?pbk8vIm8a+2n0niXrARgWkHVSNrLA4cOAGOQQhbMwV2ab8Yc6z7A1gIwx6xw?=
 =?us-ascii?Q?B2myhuavnLfz5VdDHxv12pqEE4QOPchAd2R+swh/2ylz/DnIq2Vapi05ghnt?=
 =?us-ascii?Q?wBXm0I6N+SJ5knsB42HMJeNSetY0BjNwkH6FqmDITHnK0Z0UiQuzgXqImiOa?=
 =?us-ascii?Q?jaEVbwcM3TdkPpkWzQqelg5VLxmUwqYhQV8OqoM+3HuksnkGo4ISYsWz8RKo?=
 =?us-ascii?Q?BBX7u+GGCxiWy6SVLC0Sv623sVzmxmcfTR+oti26/5Pio8nvrhYHp6v1VGAF?=
 =?us-ascii?Q?mjBhoDbvFuK5neFdyx0kLVA9zvygMLGVK+T52H1D6Cx7qmd8wDBZDNk+nhzV?=
 =?us-ascii?Q?qL+vrI6Hw3Us7jm4CYyIKkrrm5iharcu1GjwxSr9F4eMRYCu/8/OXF/260sr?=
 =?us-ascii?Q?bmhjSUIhUYm8P16Gv5TR0we0HdA9h7R3de9MUolS4RMDYsoEg0Mg8n9ND4PF?=
 =?us-ascii?Q?zVVAXss2hheqoplujiWXFAH5eFcYpmbdnFEeWyeFM7EgXJ37jhMm76cnITxL?=
 =?us-ascii?Q?ILKyVpAeBOguYFmPCKSUvnCyaGbZY73ETP10jzmek5UfnbsO8+DD0vNVZ02J?=
 =?us-ascii?Q?BEMY+V+syzAgsb78z6WuivDxDMbeYlPLO0czYrlVn6qF5ECwXbZ36v3F5ucU?=
 =?us-ascii?Q?fody0ugadvHsmplWlh0C5sC/SQdxFpaS1kPMO3NYnZuYCcieHsvLIxOZQwyB?=
 =?us-ascii?Q?FA1GO4TrPqgs2QLozUKK5UP35wUb3fAJzXkBT4Syekh7zzdYzYTlu57pcmxm?=
 =?us-ascii?Q?7cU9/SPRe7Y3G4suLfIg2LL+uOjX7tdNLFtX2RIic/38Nz0nBnzmrkCzYouI?=
 =?us-ascii?Q?ttAm4UZtPkn/ejzUIOMlqyCg8a9yjRjIDHU5bwtpMFmgyIHE+qEs+G8OqTOk?=
 =?us-ascii?Q?oWIfZwSEhwKZxx8rE5YOrI8sxJIVodd1TS3fyMuu3PsCcUsvajStH609qJlt?=
 =?us-ascii?Q?+JdJ4sRILDaz8rwp2L404T4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddda937-3b49-4a32-01a5-08dcff91e6bc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 01:08:48.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Vua2hu1KGj/6jE30bqgQ0FKsgmJm+xPhmUD4CJh2j+pDbg3RsjJsg4xF8Q7sBhnbDoFbavZsO30/nCqu5NlC9HYdZpa6h022QcuyAyGwG96BNDt9Kpnik/zRheuuIjf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB7385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_170853_234498_2EF57D8E 
X-CRM114-Status: GOOD (  13.46  )
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

Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.

Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
---
 .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 ++++
 tools/perf/util/arm-spe.c                     | 44 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 358c611eeddb..4bcd627e859f 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -67,6 +67,15 @@ enum arm_spe_common_data_source {
 	ARM_SPE_COMMON_DS_DRAM		= 0xe,
 };
 
+enum arm_spe_ampereone_data_source {
+	ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE    = 0x0,
+	ARM_SPE_AMPEREONE_SLC                           = 0x3,
+	ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE             = 0x5,
+	ARM_SPE_AMPEREONE_DDR                           = 0x7,
+	ARM_SPE_AMPEREONE_L1D                           = 0x8,
+	ARM_SPE_AMPEREONE_L2D                           = 0x9,
+};
+
 struct arm_spe_record {
 	enum arm_spe_sample_type type;
 	int err;
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index dfb0c07cb7fe..df84933b673d 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -455,8 +455,14 @@ static const struct midr_range common_ds_encoding_cpus[] = {
 	{},
 };
 
+static const struct midr_range ampereone_ds_encoding_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+	{},
+};
+
 static const struct data_source_handle data_source_handles[] = {
 	DS(common_ds_encoding_cpus, data_source_common),
+	DS(ampereone_ds_encoding_cpus, data_source_ampereone),
 };
 
 static void arm_spe__sample_flags(struct arm_spe_queue *speq)
@@ -548,6 +554,44 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
 	}
 }
 
+/*
+ * Source is IMPDEF. Here we convert the source code used on AmpereOne cores
+ * to the common (Neoverse, Cortex) to avoid duplicating the decoding code.
+ */
+static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
+						 union perf_mem_data_src *data_src)
+{
+	struct arm_spe_record common_record;
+
+	switch (record->source) {
+	case ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE:
+		common_record.source = ARM_SPE_COMMON_DS_PEER_CORE;
+		break;
+	case ARM_SPE_AMPEREONE_SLC:
+		common_record.source = ARM_SPE_COMMON_DS_SYS_CACHE;
+		break;
+	case ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE:
+		common_record.source = ARM_SPE_COMMON_DS_REMOTE;
+		break;
+	case ARM_SPE_AMPEREONE_DDR:
+		common_record.source = ARM_SPE_COMMON_DS_DRAM;
+		break;
+	case ARM_SPE_AMPEREONE_L1D:
+		common_record.source = ARM_SPE_COMMON_DS_L1D;
+		break;
+	case ARM_SPE_AMPEREONE_L2D:
+		common_record.source = ARM_SPE_COMMON_DS_L2;
+		break;
+	default:
+		pr_warning_once("AmpereOne: Unknown data source (0x%x)\n",
+				record->source);
+		return;
+	}
+
+	common_record.op = record->op;
+	arm_spe__synth_data_source_common(&common_record, data_src);
+}
+
 static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 					union perf_mem_data_src *data_src)
 {
-- 
2.47.0


