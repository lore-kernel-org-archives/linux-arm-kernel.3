Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAB0D59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x48fCIR5ythnhHtTMavWW7w+aXgcCsyJRQ7Ez0l1cjc=; b=FgaG47/3MxbHD2nwIm4f26+BEl
	983x2bFeyh/dNJPAmemuhhQust05Yuvi6IEcVBGWwOKx8cETmMWDQymBRNmnz3pQoDdqFoQ0ckSMR
	CkGlqJRWVd5ywzuAg8axgzBkPZUQc0tmEyoz9k9943481Q8H7YoA7MSpKKmW8r1i183XqRQjf61Sc
	A6A/OGMwXtPxQHLbzE18Fx2j1JuqzATy97O9nkSeanxV+KDNbx/KRLhBqdOmq2DJAIKQmrPtr7uqc
	BdKoio34TYNHN7WSa2XV+qTqve+oJrhbPg1t/qj+8QOdAftQPkUGdmGJDLTb6Fn3MLAem8Y7t5Y7V
	ACGIhYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lvL-00000004Z49-2J8I;
	Wed, 06 Nov 2024 19:42:39 +0000
Received: from mail-eastusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c101::3] helo=BL0PR05CU006.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lqA-00000004Xb3-44vl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wyvv1Hb14MFnfNA6PfNT5+aQZAHmRtDcf4kdrbI7DoHwH03l3dxDzy6vdA+X8rrtKmRbl7xeUQotFzht1VuJfsxSoljvfWtGczjAjkj6rwVsf/Udc94AJbIGadTbDYw/7rtvYgalsgFonCoKhb9dos42vS8fnezPATn44+UhpYmzmLT5HxXtb2hBx2O0arDbqir/AT4m5p7lv4GW870BlhH5TJjSkz1zQJW6O+krXo8yE0VwvWPGQsr85eAUIj+zxEzFz1CA3dZl6vDevF0Fc3S+DcVPXk0DAMgqtjXF+77Ou8H77MRcZli0VRjzNQvC4ekovqRNWjSFUmsVf3nUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x48fCIR5ythnhHtTMavWW7w+aXgcCsyJRQ7Ez0l1cjc=;
 b=gLia7FZVb4yx+j8IdlQTUL6Hbvp7nOF9YAasp8lolaOadtgesO5gp31yTIkVNOq6E5HR3eXjEEP8/ik2NDnSsZ1mX++ZGerbP3amoA9h5JpWh4SRiG0A9jNPAmNdaU8AKL4emBAXfpwv2LSibRXJwq3rVm8saopWyPw9paGqbeB1jaW0FcD3qOcgJc+6heIToSfdp1y19gCeplyt90wD2f/28IEFcOl0428qxE+n4FRRIh1zCF0irCs8xsd/Ucvtp3UU7QjiOTL6G8qK1yomO6u7NJiuuk3HMQOY7MfSn+80zjNMXADE/7P5FvLtmZUHSex+bVkMQP0DucBjN3hb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x48fCIR5ythnhHtTMavWW7w+aXgcCsyJRQ7Ez0l1cjc=;
 b=L59WObmv4XmLhVi/BSPLwKUeZX3ftGMspc4PUFIjk+NqMPBHxdb9KWIUFlsZRkm7FlChUidMG1jk0FkMQO6OJ7AFwUyip+mJQwXL3B+29YEjPCBO/1QRwg8EtXdWOzCtbm9mu0VPwxZbLX3KBBys9wu3Iw1EPijyhwFIU5Wxhpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 DS1PR01MB8775.prod.exchangelabs.com (2603:10b6:8:220::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 19:37:16 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 19:37:16 +0000
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
Subject: [PATCH v3 2/2] perf arm-spe: Add support for SPE Data Source packet on AmpereOne
Date: Wed,  6 Nov 2024 19:37:40 +0000
Message-ID: <20241106193740.6159-3-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106193740.6159-1-ilkka@os.amperecomputing.com>
References: <20241106193740.6159-1-ilkka@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:610:11a::9) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|DS1PR01MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: f3609f30-d727-4b29-8620-08dcfe9a6bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ca1lUle3syPDr3PpaAtWsmMRtykc8t/wGn6Rm3HwWpRz3qjTVj78cfixarVZ?=
 =?us-ascii?Q?4xiDswyabsnSlhpPkC9fqWisjXclfqLRr8i+xOn3RmF3BSh7TJ+OZaVGzen3?=
 =?us-ascii?Q?wzaaCtaTIx0hQIvW7MJCN/eQ17nTcmHLbed5kazelc8lMofW4ge4ocpqnzxO?=
 =?us-ascii?Q?4Ouql2DsfQ6woL5fVx0nG8enqSjx87FRJK7I63O0zGlhIrptI0SXlxJMbazh?=
 =?us-ascii?Q?AF8ngq+/l4vv7UShfZzOm/zdMC60uhGEjjZFwWRzQUD43/tQxrPM63HD0Cg/?=
 =?us-ascii?Q?396K3oNZBzQU24zL/z01Uee90pxObqjqRGkPWYl15ZcDdc/oRpkD8rHcb6zy?=
 =?us-ascii?Q?cNYiRn00r25suaZOvj5ZnbbJW6CFxJSxK1UXLGUq61+0aaY9PsG+aDFjeBk2?=
 =?us-ascii?Q?iuTTpY5bW4ACbjGndCA8LSJfqb3Qh73ZJRVd2/5PuWomAlS9NDXz2URCzNP8?=
 =?us-ascii?Q?+kPy7paVC7s5BCq1pcjEolrgJodOJE8F98ie4dilnjtIHHE8KlsinHRKMQY4?=
 =?us-ascii?Q?RrUDX/qckkW7Iyd6MGPXfLL5Re5i+YTg155hLEB4dFd3MVTAtpNKOSpFyKmB?=
 =?us-ascii?Q?uWC9v09chmQFLbJeBmlowUTsNmXzaMmLt+uvFu9c9Z3kttSL1YlBzxCS1N7q?=
 =?us-ascii?Q?62v6oHr2xls9hqTxz9GuvLY31mrZ6vqZzVB8nh9gkn4ONpoDpPQrn6nGdI5e?=
 =?us-ascii?Q?KPsPr61OqqaHPhol4IwmWpvhftcPJh2jH/NKxM+SgzvF3TYn1BO9UY/2577V?=
 =?us-ascii?Q?Xf6WOGFu1qpKsEJtVtOupqhihIiHVrVySXopVR2ixpjLDqogLVJ9In+ikfHs?=
 =?us-ascii?Q?2nkYe4AmriycajsJSxUwYJwAv7xgIi4E1tXmCEmyT9M+tXfP1oUR4zgfYQkz?=
 =?us-ascii?Q?rOgHjIHCzSB/VBB00x5WTEqFFAsZ0uBNk1eOgrG9Mdrjq359AE6wg/gn0E8m?=
 =?us-ascii?Q?tgsvhpmcMqKdFyJ/hDlOcIpSSxELE2kYBPmlVx0f75MrEh5FKwlZiPOUfS/E?=
 =?us-ascii?Q?qo0gKYlNle6X8GaGPwauv+SNQ8XdJ9MZ92NP7oi8mcIgvKHOg0KPNBzEVsYx?=
 =?us-ascii?Q?2e8KgGEIbgpHw87Rwhe/0zORJzbQdanhCNnigJhs89qXNL3kbn/ZEA+yH31O?=
 =?us-ascii?Q?x6MjcfBRbo8RWHRpaV7W2yBHka+TZGH6MH2lbd9HIc0YFu6ZUwmPkcirokTx?=
 =?us-ascii?Q?UZhiJRFEgUbuu9w7TXrWOOydDVDW0X33cVs9NZ86c6BEuJGCrXs1TAMRcWMi?=
 =?us-ascii?Q?CiW11kI6WRnEEU1JCI8QkWxerNbS9pRe2KJwheoBj/abub9o3vG9wBcPdFNN?=
 =?us-ascii?Q?ngpM5cshz5OW1kdyLW/UBcOX1inIhMcnPt7xrPS9oGukna7VfFhhMvL8jvTQ?=
 =?us-ascii?Q?aMjBcMBAmL/ku419ugw9gCAK7Jxj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8g95BospL/NmPk/Cftqvne/OYgPTc/4XrsbrE5+Nbf+9qAM3tA8lHdpMuci?=
 =?us-ascii?Q?1weFCXh7a3QHKhuGQpLJ3YHTn35NB/v5SGp3iZ4PncIF/eOHscaXF8ySE2OS?=
 =?us-ascii?Q?oUkMjAS14uJpWZbsbcZHN/1498OqBocipYlzYEUm9BocVbhXqpYVKZXNYocd?=
 =?us-ascii?Q?PX83i33JqXm5VicNKJ1WMhLbx4d32Z7u61P78mj1sw3Ot87trtVrTj2KO5OP?=
 =?us-ascii?Q?TjgimE4v4DpCi6syv34HPW5hGtZFN6JjatbsehhH2hyLpitIhvw7M6E5AgjB?=
 =?us-ascii?Q?EEoUv2K6+eS+/0Tc68lm2P4ywu5jaJDXuJ8LomyWaY2MoiNhZp0hTUokvnlH?=
 =?us-ascii?Q?uKPlLpzAvRVA+Uni2B7LIV7r57l3lwcb55hL1tSDQll+0ZiEooo0QG0QlYlq?=
 =?us-ascii?Q?V3fttKh9ryf/9dHfvGACKBepwnwul23eNlXqhrEmzaheoYcW25HzhT74czAt?=
 =?us-ascii?Q?0vXG13dNHzcw/+yKzbQLiFqKn+eRl1TFOhvnvUTh+pAEfNaKFtBWr8a47HZ5?=
 =?us-ascii?Q?fiFcUTK0K/Yst/hSUinVl/gMiyXaf+5L3lo8bk9eu0uIJdHmIuCkOgMLuMGH?=
 =?us-ascii?Q?8i8pEwFjMuCEtIq6bfpec+9OoBrKZdZdCYKygleqJPquUf7ajkyJHjrI3nlq?=
 =?us-ascii?Q?7yTBm5b4xzJkACvx+CDuzp1CIXtcQLXaE+fPJUZu+4y3mQrvBdUlyJLrg/2g?=
 =?us-ascii?Q?23gNC5o9i+IaW1gSkFNKNRBUdoZ4FVfDO/Sz9SPGOD/hWy+KplmAi9sMXT2N?=
 =?us-ascii?Q?+dqwgpup1iu83jdbmT2yeRr9Q5S/B1UZjvCFs5CO2ygqMr6vT9xSDc0hF2R/?=
 =?us-ascii?Q?zMtG1ExKmUrrM3MULSiOnffa5hAkLlqAQ0KR4GRv/SjPbMMQOcDjihekjkg7?=
 =?us-ascii?Q?g5IytymCNlJHtQTDNQ6WoBDfJNTEejdXgLGhU3HI9Pk3+d+DqCPgZCMdESSX?=
 =?us-ascii?Q?aYmOUC9uugZin7YUG2ltvYyUtzUxKb4JpYxcbZu4DKleko/smh+NCpU+iDuS?=
 =?us-ascii?Q?JwWAa5yr8jl1FpxjaEJkeQMT54iV7gjrVUrrITVKs+cA0wq60MVOByDl2cz1?=
 =?us-ascii?Q?UOSqHz9dyC+tnA49Msoy+g6nK08M3qMmo52CZxts6D1KdLOAwPIjy9iwVP1d?=
 =?us-ascii?Q?mzvvBuuzkVUq7sZp7bEdkS2dMVI0iLWXOiUEsp+WuTY46mJ/wJP51cjT+W2h?=
 =?us-ascii?Q?9Abvqr0AeaRG+obva/O5SizlVEP3fj1ugWVe0KxVqZ4fcMie2KXkvg9pIBX+?=
 =?us-ascii?Q?0mgxlzlq64c/tyGagmpQ/XbAgImEGniJhgwN83L8qNh4d5c8rNU+2pcrLUwX?=
 =?us-ascii?Q?4sHZnz/knU5JHnCjSm4VWqRzSGuU0lwo8aocgvFopck1AyqbVtTEJEPItzTL?=
 =?us-ascii?Q?+WcBQbf8nbHdVIcpeyV87ZTwKnyZ037FxLU/GzvPfVb7KvRXcnp14jZ6N6kH?=
 =?us-ascii?Q?vUo0Si2f3LJMDg3q64TArK+0c/73N+MYt/RP8mq1hVuQXs0AXElu7mXDn9sd?=
 =?us-ascii?Q?z+MfXHx7YndJqQmCxTwfyIjwyxRjfUFnT7L+aq1fScs7+djjrsyMek2lYXCW?=
 =?us-ascii?Q?YguZiCJgKwCeIx338P3+m/YqJuTW/8+Y+c2f9dNueJZLiwBX9BaZdLt5wx5j?=
 =?us-ascii?Q?9gXtyiWc7SdXoM6dwjMkxYU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3609f30-d727-4b29-8620-08dcfe9a6bd0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 19:37:16.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMPSxY0B5QQTXMJ5lsbPb0vdU69c9OZH87MmzlBSCRKQMg6xekP6SY9T0lN7fEpnHRgvDDBZ6x8YonWs0iWMFMHe2DrTnb1rVjjrRcNALJJqI9BQlBDJ3aPGPjXehyny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_113719_048266_162DD6CC 
X-CRM114-Status: GOOD (  14.36  )
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
 .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++++
 tools/perf/util/arm-spe.c                     | 39 +++++++++++++++++++
 2 files changed, 48 insertions(+)

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
index b222557cc27a..40847a3d18b0 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -531,6 +531,44 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
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
+		/* Assign a bogus value that's not used for common coding */
+		common_record.source = 0xffff;
+		break;
+	}
+
+	common_record.op = record->op;
+	arm_spe__synth_data_source_common(&common_record, data_src);
+}
+
 static const struct data_src data_sources[] = {
 	DS(MIDR_ALL_VERSIONS(MIDR_CORTEX_A720), data_source_common),
 	DS(MIDR_ALL_VERSIONS(MIDR_CORTEX_A725), data_source_common),
@@ -541,6 +579,7 @@ static const struct data_src data_sources[] = {
 	DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2), data_source_common),
 	DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1), data_source_common),
 	DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2), data_source_common),
+	DS(MIDR_ALL_VERSIONS(MIDR_AMPERE1A), data_source_ampereone),
 	{},
 };
 
-- 
2.47.0


