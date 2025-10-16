Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC57CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DUko89npzL7HZjxZvIBEjnQ7mySr2fGFeLb9bgdOWw=; b=A6zNnVAbYquBOuoTCAoI239wjP
	ywidKTJjAEImcqIa/uVCxNETYbJC6KUGobF73uUGLuk/GYIc6r4ONFl5EAJ5nwXc9oXegiurXRJXI
	NAn1l3lhYTVJyoFdykp4DePq/6Irvwvo0wSK5DRGokhpXT1yb5vZw2ddoZI/2sWSmY/EHdOQH+ysx
	8Na2mxcdkifg9IVz8J7qAfSz/YSG31zkL/K3FUm1RVUhfTL2TnXw7U4Kv3HX7Xm1OUHq9nVwOJ8sw
	gN3XbwarUg7gPBWwk7YLZyB9CAT1UbouHT4cjxnuUnxluSqYL2KNYReIDZEbsxtrkryYpbg/pq7R9
	cij853IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JYN-000000040MF-0KGj;
	Thu, 16 Oct 2025 08:41:43 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JYJ-000000040K5-0bsX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:41:41 +0000
X-UUID: eb40a756aa6b11f0a38c85956e01ac42-20251016
X-CID-CACHE: Type:Local,Time:202510161630+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:02f42891-db57-43d4-b388-6ed07773c7f2,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:d24af52aa30fd24840d7476069b00f81,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eb40a756aa6b11f0a38c85956e01ac42-20251016
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1931016855; Thu, 16 Oct 2025 16:41:33 +0800
From: tanze <tanze@kylinos.cn>
To: james.clark@linaro.org,
	leo.yan@linux.dev,
	irogers@google.com,
	john.g.garry@oracle.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	graham.woodward@arm.com,
	mike.leach@linaro.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v1] perf arm_spe: Add a macro definition to handle offset value
Date: Thu, 16 Oct 2025 16:41:29 +0800
Message-Id: <20251016084129.30587-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_014140_760685_C25F9ECD 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
and improve readability.

Signed-off-by: tanze <tanze@kylinos.cn>
---
 tools/perf/util/arm-spe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f5077..645048ac7708 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -36,6 +36,7 @@
 
 #include "../../arch/arm64/include/asm/cputype.h"
 #define MAX_TIMESTAMP (~0ULL)
+#define SPE_SYNTH_ID_OFFSET (1000000000ULL)
 
 #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
 
@@ -1732,7 +1733,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	attr.sample_period = spe->synth_opts.period;
 
 	/* create new id val to be a fixed offset from evsel id */
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + SPE_SYNTH_ID_OFFSET;
 
 	if (!id)
 		id = 1;
-- 
2.25.1


