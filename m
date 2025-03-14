Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C3CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c4rNPX9KYZkw6UGJ7wf01mW0kMliSBgjDLx+b3r4GU=; b=EqtewSDIp88WJ70EI/1m2H52Kc
	L7SW3piJ7nVzGz1MXQT3Mc/s7Caoz1Mdn/r9cG2Zkz+ZTTcs1EkZ9vTFKSVJYThAgqALKtx1TVqrp
	a7W2fFcxGgdIlMzoL5Sp3y0jodm37owkDebzlzWCZZPsLslffahbev+Kktjy0EeZVPToHmAYaCVJQ
	QjnwnnEetICL8BfTVrPC0EsegLje5s8I3B13ELUbr7BsRYQ1sOmTnGjBMb1+GcGk4wn7/hXuHxmKR
	BUVUPhJRopATuhDZW8iaRf9SDKgblO3J3P6phfMHHxQuhZMnUOwsxbbZ6PlP895wcU/vuDxJsNL+K
	QsbWkUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Ll-0000000DS2O-1GPq;
	Fri, 14 Mar 2025 08:25:01 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hd-0000000DQw7-2r2v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:20:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZDcfy4Js8zCtSW;
	Fri, 14 Mar 2025 16:17:30 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 79E4018006C;
	Fri, 14 Mar 2025 16:20:42 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:20:41 +0800
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
Subject: [PATCH 6/7] perf annotate-data: Handle arm64 global variable access
Date: Sat, 15 Mar 2025 00:21:36 +0800
Message-ID: <20250314162137.528204-7-lihuafei1@huawei.com>
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
X-CRM114-CacheID: sfid-20250314_012046_091349_726BE663 
X-CRM114-Status: GOOD (  17.25  )
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

Arm64 uses the 'adrp' and 'add' instructions to load the address of a
global variable. For example:

 adrp    x19, ffff8000819c3000
 add     x19, x19, #0x3e8
 <<after some sequence>>
 ldr     x22, [x19, #8]

Here, 'adrp' retrieves the base address of the page where the global
variable is located, and 'add' adds the offset within the page. If PMU
sampling occurs at the instruction 'ldr x22, [x19, #8]', we need to
trace the preceding 'adrp' and 'add' instructions to obtain the status
information of x19.

A new register status type 'TSR_KIND_GLOBAL_ADDR' is introduced,
indicating that the register holds the address of a global variable, and
this address is also stored in the 'type_state_reg' structure. After
obtaining the status information of x19, we use
get_global_var_type() to search for a matching global variable and
verify whether the returned offset is equal to 8. If it is, then we have
identified the data type and offset of the accessed global variable.

Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 tools/perf/arch/arm64/annotate/instructions.c | 90 ++++++++++++++++++-
 tools/perf/util/annotate-data.c               | 20 +++++
 tools/perf/util/annotate-data.h               |  2 +
 3 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index f70d93001fe7..f2053e7f60a8 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -262,6 +262,94 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
 	struct type_state_reg *tsr;
 	Dwarf_Die type_die;
 	int sreg, dreg;
+	u32 insn_offset = dl->al.offset;
+
+	/* Access global variables via PC relative addressing, for example:
+	 *
+	 *  adrp    x19, ffff800082074000
+	 *  add     x19, x19, #0x380
+	 *
+	 * The adrp instruction locates the page base address, and the add
+	 * instruction adds the offset within the page.
+	 */
+	if (!strncmp(dl->ins.name, "adrp", 4)) {
+		sreg = get_arm64_regnum(dl->ops.source.raw);
+		if (sreg < 0 || !has_reg_type(state, sreg))
+			return;
+
+		tsr = &state->regs[sreg];
+		tsr->ok = true;
+		tsr->kind = TSR_KIND_GLOBAL_ADDR;
+		/*
+		 * The default arm64_mov_ops has already parsed the adrp
+		 * instruction and saved the target address.
+		 */
+		tsr->addr = dl->ops.target.addr;
+
+		pr_debug_dtp("adrp [%x] global addr=%#"PRIx64" -> reg%d\n",
+			     insn_offset, tsr->addr, sreg);
+		return;
+	}
+
+	/* Add the offset within the page. */
+	if (!strncmp(dl->ins.name, "add", 3)) {
+		regmatch_t match[4];
+		char *ops = strdup(dl->ops.raw);
+		u64 offset;
+		static regex_t add_regex;
+		static bool regex_compiled;
+
+		/*
+		 * Matching the operand assembly syntax of the add instruction:
+		 *
+		 *  <Xd|SP>, <Xn|SP>, #<imm>
+		 */
+		if (!regex_compiled) {
+			regcomp(&add_regex,
+				"^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
+				REG_EXTENDED);
+			regex_compiled = true;
+		}
+
+		if (!ops)
+			return;
+
+		if (regexec(&add_regex, dl->ops.raw, 4, match, 0))
+			return;
+
+		/*
+		 * Parse the source register first. If it is not of the type
+		 * TSR_KIND_GLOBAL_ADDR, further parsing is not required.
+		 */
+		ops[match[2].rm_eo] = '\0';
+		sreg = get_arm64_regnum(ops + match[2].rm_so);
+		if (sreg < 0 || !has_reg_type(state, sreg) ||
+		    state->regs[sreg].kind != TSR_KIND_GLOBAL_ADDR) {
+			free(ops);
+			return;
+		}
+
+		ops[match[1].rm_eo] = '\0';
+		dreg = get_arm64_regnum(ops + match[1].rm_so);
+		if (dreg < 0 || !has_reg_type(state, dreg)) {
+			free(ops);
+			return;
+		}
+
+		ops[match[3].rm_eo] = '\0';
+		offset = strtoul(ops + match[3].rm_so, NULL, 16);
+
+		tsr = &state->regs[dreg];
+		tsr->ok = true;
+		tsr->kind = TSR_KIND_GLOBAL_ADDR;
+		tsr->addr = state->regs[sreg].addr + offset;
+
+		pr_debug_dtp("add [%x] global addr=%#"PRIx64"(reg%d) -> reg%d\n",
+			     insn_offset, tsr->addr, sreg, dreg);
+
+		free(ops);
+		return;
+	}
 
 	if (strncmp(dl->ins.name, "ld", 2))
 		return;
@@ -287,7 +375,7 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
 		tsr->ok = true;
 
 		pr_debug_dtp("load [%x] %#x(reg%d) -> reg%d",
-			     (u32)dl->al.offset, dst->offset, dreg, sreg);
+			     insn_offset, dst->offset, dreg, sreg);
 		pr_debug_type_name(&tsr->type, tsr->kind);
 	}
 }
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 2bc8d646eedc..aaca08bb9097 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -65,6 +65,9 @@ void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind)
 	case TSR_KIND_CANARY:
 		pr_info(" stack canary\n");
 		return;
+	case TSR_KIND_GLOBAL_ADDR:
+		pr_info(" global address\n");
+		return;
 	case TSR_KIND_TYPE:
 	default:
 		break;
@@ -1087,6 +1090,23 @@ static enum type_match_result check_matching_type(struct type_state *state,
 		return PERF_TMR_OK;
 	}
 
+	if (state->regs[reg].kind == TSR_KIND_GLOBAL_ADDR) {
+		int var_offset;
+		u64 var_addr;
+
+		pr_debug_dtp("global var by address");
+
+		var_addr = state->regs[reg].addr + dloc->op->offset;
+
+		if (get_global_var_type(cu_die, dloc, dloc->ip, var_addr,
+					&var_offset, type_die)) {
+			dloc->type_offset = var_offset;
+			return PERF_TMR_OK;
+		}
+
+		return PERF_TMR_BAIL_OUT;
+	}
+
 	if (state->regs[reg].kind == TSR_KIND_CANARY) {
 		pr_debug_dtp("stack canary");
 
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 717f394eb8f1..e3e877313207 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -36,6 +36,7 @@ enum type_state_kind {
 	TSR_KIND_CONST,
 	TSR_KIND_POINTER,
 	TSR_KIND_CANARY,
+	TSR_KIND_GLOBAL_ADDR,
 };
 
 /**
@@ -177,6 +178,7 @@ struct type_state_reg {
 	bool caller_saved;
 	u8 kind;
 	u8 copied_from;
+	u64 addr;
 };
 
 /* Type information in a stack location, dynamically allocated */
-- 
2.25.1


