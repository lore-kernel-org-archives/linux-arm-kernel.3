Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F59EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1WeB4x6CHyrgzt8D5W31tN8y9H8QgucSRoa9BiEA7g=; b=vbaZ74d7qabCm0YJN2egJUsQOD
	keq/kCruNsJn7EAdCKUS0foZt8XY/xfqsZCFUAdJBhIvGMylzzVYiAgXzsxI6lSHzz94gsnKV5MS5
	KqnPyU+3h/IBRb7AxRduFG+3xwkhs9ahnvRmEF3949aZu885u5RxTjnTHSzx7eT65XVpxLPhkuOAJ
	bAlLtp6qfLqyGtFGMMVWLNKc/dR+7yGihkAYoEyIcKwA4HiEbft+I2ZnvekPdYEGLwnC5CvsxW9m9
	x3TLVwpIKR24b8WeGER4S9msM6aLewjPtl0K9zRCJ3f3TO2oseW9TMrkyrsZZ7ohBjlaYHrt1ZklN
	vAIFtkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0NO-0000000DSO6-40dK;
	Fri, 14 Mar 2025 08:26:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0He-0000000DQwc-2x8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:20:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZDcfC6PFrzvWsF;
	Fri, 14 Mar 2025 16:16:51 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 42B101401F3;
	Fri, 14 Mar 2025 16:20:43 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:20:42 +0800
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
Subject: [PATCH 7/7] perf annotate-data: Handle the access to the 'current' pointer on arm64
Date: Sat, 15 Mar 2025 00:21:37 +0800
Message-ID: <20250314162137.528204-8-lihuafei1@huawei.com>
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
X-CRM114-CacheID: sfid-20250314_012047_138114_0CD4EDEF 
X-CRM114-Status: GOOD (  14.18  )
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

According to the implementation of the 'current' macro on ARM64, the
sp_el0 register stores the pointer to the current task's task_struct.
For example:

 mrs x1, sp_el0
 ldr x2, [x1, #1896]

We can infer that the ldr instruction is accessing a member of the
task_struct structure at an offset of 1896. The key is to construct the
data type for x1. The instruction 'mrs x1, sp_el0' belongs to the inline
function get_current(). By finding the DIE of the inline function
through its instruction address, and then obtaining the DIE for its
return type, which should be 'struct task_struct *'. Then, we update the
register state of x1 with this type information.

Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 tools/perf/arch/arm64/annotate/instructions.c | 71 +++++++++++++++----
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index f2053e7f60a8..c5a0a6381547 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -263,6 +263,20 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
 	Dwarf_Die type_die;
 	int sreg, dreg;
 	u32 insn_offset = dl->al.offset;
+	static regex_t add_regex, mrs_regex;
+	static bool regex_compiled;
+
+	if (!regex_compiled) {
+		/*
+		 * Matching the operand assembly syntax of the add instruction:
+		 *
+		 *  <Xd|SP>, <Xn|SP>, #<imm>
+		 */
+		regcomp(&add_regex, "^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
+			REG_EXTENDED);
+		regcomp(&mrs_regex, "^(x[0-9]{1,2}), sp_el0", REG_EXTENDED);
+		regex_compiled = true;
+	}
 
 	/* Access global variables via PC relative addressing, for example:
 	 *
@@ -296,20 +310,6 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
 		regmatch_t match[4];
 		char *ops = strdup(dl->ops.raw);
 		u64 offset;
-		static regex_t add_regex;
-		static bool regex_compiled;
-
-		/*
-		 * Matching the operand assembly syntax of the add instruction:
-		 *
-		 *  <Xd|SP>, <Xn|SP>, #<imm>
-		 */
-		if (!regex_compiled) {
-			regcomp(&add_regex,
-				"^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
-				REG_EXTENDED);
-			regex_compiled = true;
-		}
 
 		if (!ops)
 			return;
@@ -351,6 +351,49 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
 		return;
 	}
 
+	if (!strncmp(dl->ins.name, "mrs", 3)) {
+		regmatch_t match[2];
+		char *ops = strdup(dl->ops.raw);
+		Dwarf_Die func_die;
+		Dwarf_Attribute attr;
+		u64 ip = dloc->ms->sym->start + dl->al.offset;
+		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
+
+		if (!ops)
+			return;
+
+		if (regexec(&mrs_regex, dl->ops.raw, 2, match, 0))
+			return;
+
+		ops[match[1].rm_eo] = '\0';
+		sreg = get_arm64_regnum(ops + match[1].rm_so);
+		if (sreg < 0 || !has_reg_type(state, sreg)) {
+			free(ops);
+			return;
+		}
+
+		/*
+		 * Find the inline function 'get_current()' Dwarf_Die and
+		 * obtain its return value data type, which should be
+		 * 'struct task_struct *'.
+		 */
+		if (!die_find_inlinefunc(cu_die, pc, &func_die) ||
+		    !dwarf_attr_integrate(&func_die, DW_AT_type, &attr) ||
+		    !dwarf_formref_die(&attr, &type_die)) {
+			free(ops);
+			return;
+		}
+
+		tsr = &state->regs[sreg];
+		tsr->type = type_die;
+		tsr->kind = TSR_KIND_TYPE;
+		tsr->ok = true;
+
+		pr_debug_dtp("mrs sp_el0 [%x] -> reg%d", insn_offset, sreg);
+		free(ops);
+		return;
+	}
+
 	if (strncmp(dl->ins.name, "ld", 2))
 		return;
 
-- 
2.25.1


