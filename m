Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF44BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1/fd4D2fxZy8Mgd9AyxZx0+qOiqfX47sDLO5E40g8c=; b=3yEryaYsPTnFk5IMg5BVOlM1q8
	42BOGUJ+pGuCrwmCQSo0vzm3SRUsa8Jj2xJnKjUWSKTx7xICkSJcmy8XZnC42a6aHHDck//cixn+3
	ojJlW2RYxQjUPq0VZyZXJFz/q88tvxIxVAq9Z4RcdSPBInEs5xogwTLz9zu2GS57xEHG7WPEjrR+c
	nvog/T0kvgEBRnjKFk7/fDtMGDC9XI9jwCQtECe24CVJhghyR5HrlLcGoWTrzll6ZuisYN1FuxJ2a
	5hRwNarDFKeUiBqHtkToDvA8SymvSW5ykGbMKWzunFlpy4JlY6GJJUQW0t5jIzKWkZ9fCrPHd9sI0
	/WW8wh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0P9-0000000DStY-10Mh;
	Fri, 14 Mar 2025 08:28:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hu-0000000DR8M-0y4V
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Mar 2025 08:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g1/fd4D2fxZy8Mgd9AyxZx0+qOiqfX47sDLO5E40g8c=; b=Gq84Pt+da5krT+f0ObQl4tPDpw
	vhOhaIqktl0AexqRPDNNw5wm9qpTM5spLfQNzKwFRpkPKmgpFUCV9mFN3F7t/4QcZgA9FaJGWNV6K
	Fn1Bi7zO8Ax6qpkMOUzwFhlLHgFHEiQqWYZPPAQwzRz2j2/X72j8IXz0pwYrzcNliF5+sWP549Kok
	V634tjOdSv+EXuKU9Ofn4a1ECwA5IEOGVn1pQv+aduCzmoOg6M+lzMnOChAeNsN9eAErRyJ9j2MWH
	LvaxQ7AqfMy1E1GThxU2CVLLnA9hCcgo8qcdBSYE21Gi+kUAv7mKKwBBlLXUcNgPS+b3Jv+6kKvGX
	rEr0AAnQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hq-00000002rOA-2cCo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:21:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZDcht3WbMztQfY;
	Fri, 14 Mar 2025 16:19:10 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 5ED0818006C;
	Fri, 14 Mar 2025 16:20:39 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:20:38 +0800
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
Subject: [PATCH 2/7] perf annotate: Advance the mem_ref check to mov__parse()
Date: Sat, 15 Mar 2025 00:21:32 +0800
Message-ID: <20250314162137.528204-3-lihuafei1@huawei.com>
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
X-CRM114-CacheID: sfid-20250314_082059_547347_25E4C840 
X-CRM114-Status: GOOD (  11.43  )
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

Advance the mem_ref check on x86 to mov__parse(), along with the
multi_reg check, to make annotate_get_insn_location() more concise.

Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 tools/perf/util/annotate.c | 9 ++++-----
 tools/perf/util/disasm.c   | 8 ++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 31bb326b07a6..860ea6c72411 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2442,18 +2442,17 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
 				continue;
 		}
 
+		op_loc->mem_ref = mem_ref;
+		op_loc->multi_regs = multi_regs;
+
 		/*
 		 * For powerpc, call get_powerpc_regs function which extracts the
 		 * required fields for op_loc, ie reg1, reg2, offset from the
 		 * raw instruction.
 		 */
 		if (arch__is(arch, "powerpc")) {
-			op_loc->mem_ref = mem_ref;
-			op_loc->multi_regs = multi_regs;
 			get_powerpc_regs(dl->raw.raw_insn, !i, op_loc);
-		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
-			op_loc->mem_ref = true;
-			op_loc->multi_regs = multi_regs;
+		} else if (mem_ref) {
 			extract_reg_offset(arch, insn_str, op_loc);
 		} else {
 			char *s, *p = NULL;
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 50c5c206b70e..d91526cff9df 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -607,6 +607,12 @@ static bool check_multi_regs(struct arch *arch, const char *op)
 	return count > 1;
 }
 
+/* Check whether the operand accesses memory. */
+static bool check_memory_ref(struct arch *arch, const char *op)
+{
+	return strchr(op, arch->objdump.memory_ref_char) != NULL;
+}
+
 static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
 		struct disasm_line *dl __maybe_unused)
 {
@@ -635,6 +641,7 @@ static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_sy
 	if (ops->source.raw == NULL)
 		return -1;
 
+	ops->source.mem_ref = check_memory_ref(arch, ops->source.raw);
 	ops->source.multi_regs = check_multi_regs(arch, ops->source.raw);
 
 	target = skip_spaces(++s);
@@ -657,6 +664,7 @@ static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_sy
 	if (ops->target.raw == NULL)
 		goto out_free_source;
 
+	ops->target.mem_ref = check_memory_ref(arch, ops->target.raw);
 	ops->target.multi_regs = check_multi_regs(arch, ops->target.raw);
 
 	if (comment == NULL)
-- 
2.25.1


