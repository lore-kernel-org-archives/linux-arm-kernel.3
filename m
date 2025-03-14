Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fgl61DdgclIley/12cHvL6cz/HYGNHwE80JQr+byLU=; b=pnhNhqhwLtJjFZ2tO3yhD/FLrg
	2GnLfiqXKgiiudRKJyDIwRAc0FAXTe7nC7Wpi3Eviu65eazhFAhgEmAUGXEiOmOuqug+q5HvyXzBp
	IXifzuFb65uguMaD0NeUSqea84LsekS6NAALmMHK7JUBiY2YZ1DvkAQsx4NQ8JQJIgaDs5HrIuGiu
	nz9SEMR234T8tRMYDYBAL6Ve7DllaoHBekz1V8oia7ziyGTJvi/OoHN9GdFMmypBKhBN9z8FcHYj+
	dqsO4IBJLehe28LSMreITjLS1GB0g1EvXQyxT+PVpX/vC16sS1Ge9Q6TBFprCZSmlcHGyqkYzm5uT
	VCGZSSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0SR-0000000DU6r-2tIL;
	Fri, 14 Mar 2025 08:31:55 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hd-0000000DQv3-1xKf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:20:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZDchc4gCbz1R6Wc;
	Fri, 14 Mar 2025 16:18:56 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 995EC14022D;
	Fri, 14 Mar 2025 16:20:38 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:20:37 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <namhyung@kernel.org>, <acme@kernel.org>, <leo.yan@linux.dev>,
	<james.clark@linaro.org>, <mark.rutland@arm.com>, <john.g.garry@oracle.com>,
	<will@kernel.org>, <irogers@google.com>
CC: <mike.leach@linaro.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<kjain@linux.ibm.com>, <mhiramat@kernel.org>, <atrajeev@linux.vnet.ibm.com>,
	<sesse@google.com>, <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <lihuafei1@huawei.com>
Subject: [PATCH 1/7] perf annotate: Handle arm64 load and store instructions
Date: Sat, 15 Mar 2025 00:21:31 +0800
Message-ID: <20250314162137.528204-2-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314162137.528204-1-lihuafei1@huawei.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.74]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500004.china.huawei.com (7.202.181.242)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012045_893545_94C74BD7 
X-CRM114-Status: GOOD (  15.35  )
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

Add ldst_ops to handle load and store instructions in order to parse
the data types and offsets associated with PMU events for memory access
instructions. There are many variants of load and store instructions in
ARM64, making it difficult to match all of these instruction names
completely. Therefore, only the instruction prefixes are matched. The
prefix 'ld|st' covers most of the memory access instructions, 'cas|swp'
matches atomic instructions, and 'prf' matches memory prefetch
instructions.

Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 tools/perf/arch/arm64/annotate/instructions.c | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index d465d093e7eb..c212eb7341bd 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -6,7 +6,8 @@
 
 struct arm64_annotate {
 	regex_t call_insn,
-		jump_insn;
+		jump_insn,
+		ldst_insn; /* load and store instruction */
 };
 
 static int arm64_mov__parse(struct arch *arch __maybe_unused,
@@ -67,6 +68,57 @@ static struct ins_ops arm64_mov_ops = {
 	.scnprintf = mov__scnprintf,
 };
 
+static int arm64_ldst__parse(struct arch *arch __maybe_unused,
+			     struct ins_operands *ops,
+			     struct map_symbol *ms __maybe_unused,
+			     struct disasm_line *dl __maybe_unused)
+{
+	char *s, *target;
+
+	/*
+	 * The part starting from the memory access annotation '[' is parsed
+	 * as 'target', while the part before it is parsed as 'source'.
+	 */
+	target = s = strchr(ops->raw, '[');
+	if (!s)
+		return -1;
+
+	while (s > ops->raw && *s != ',')
+		--s;
+
+	if (s == ops->raw)
+		return -1;
+
+	*s = '\0';
+	ops->source.raw = strdup(ops->raw);
+
+	*s = ',';
+	if (!ops->source.raw)
+		return -1;
+
+	ops->target.raw = strdup(target);
+	if (!ops->target.raw) {
+		zfree(ops->source.raw);
+		return -1;
+	}
+	ops->target.mem_ref = true;
+
+	return 0;
+}
+
+static int ldst__scnprintf(struct ins *ins, char *bf, size_t size,
+			   struct ins_operands *ops, int max_ins_name)
+{
+	return scnprintf(bf, size, "%-*s %s,%s", max_ins_name, ins->name,
+			 ops->source.name ?: ops->source.raw,
+			 ops->target.name ?: ops->target.raw);
+}
+
+static struct ins_ops arm64_ldst_ops = {
+	.parse	   = arm64_ldst__parse,
+	.scnprintf = ldst__scnprintf,
+};
+
 static struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	struct arm64_annotate *arm = arch->priv;
@@ -77,6 +129,8 @@ static struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const
 		ops = &jump_ops;
 	else if (!regexec(&arm->call_insn, name, 2, match, 0))
 		ops = &call_ops;
+	else if (!regexec(&arm->ldst_insn, name, 2, match, 0))
+		ops = &arm64_ldst_ops;
 	else if (!strcmp(name, "ret"))
 		ops = &ret_ops;
 	else
@@ -107,6 +161,15 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		      REG_EXTENDED);
 	if (err)
 		goto out_free_call;
+	/*
+	 * The ARM64 architecture has many variants of load/store instructions.
+	 * It is quite challenging to match all of them completely. Here, we
+	 * only match the prefixes of these instructions.
+	 */
+	err = regcomp(&arm->ldst_insn, "^(ld|st|cas|prf|swp)",
+		      REG_EXTENDED);
+	if (err)
+		goto out_free_jump;
 
 	arch->initialized = true;
 	arch->priv	  = arm;
@@ -117,6 +180,8 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 	arch->e_flags = 0;
 	return 0;
 
+out_free_jump:
+	regfree(&arm->jump_insn);
 out_free_call:
 	regfree(&arm->call_insn);
 out_free_arm:
-- 
2.25.1


