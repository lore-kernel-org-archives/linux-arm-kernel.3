Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60586CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Date:To:
	Content-Type:Mime-Version:From:Cc:References:Content-Transfer-Encoding:
	Message-Id:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYlAhLyA+W59txuVdfGlHzgN9jui63GdXPtcMpN2dC4=; b=08t7qXKT/CWs3Caz7JDuvWozVU
	PEPdjxy//AoLPW9k1duMcaasI1ca+skQ0of/+h7CRfRjCPB1q7Qsjs8xGNZNuoqovvIoD2q6DDH0g
	GBOcTQfmekS3MgLpfP50edj4dGYpcO5IcpodrT/rVWnOV8V9BIvqbLzQ7ZpSC0xtWQMQMBaw8hL69
	y9G//J6BdZ2RT84FO3nEyFn0XyE1bTueFwlXRHHKLDLqUMrs9kOv3RwnmArllExfN3wFiIjNi8x1y
	pcAefhoBSyl+ush9Suugx+lma/ZRWkKTgw5yfdIogMDjqsCYNpw39nSoaoFDUBtW+VHb6auP3dIPP
	mEYo7vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnk-00000007i6f-2Ho8;
	Sat, 10 Oct 2026 08:51:32 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSni-00000007i5r-02Vj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 08:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622282; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YYlAhLyA+W59txuVdfGlHzgN9jui63GdXPtcMpN2dC4=;
 b=nZ0PBfpYyJN6aW72PaJJuO5pFjXlSSfuTsUfTMh+dD2/6rruhTIHyoiWg8nSuM957TktW4
 eNSSomyYpTQpF+FlJwQFebSJps9tSyjsAqluNraXoPMHDQUfItEKAFuaPPt9zC7OB1Oteh
 j2yUDcOmR03pXDx68bK4nO7c/L7knrlV4jHPtJJI3/6/lGCVq/JXG+4ipCIgD4wyGQnco6
 RKtTF/a13NwSE+kZNVjl1UpMi1Hm9zcVJJrkwaupbuWa3wSGoQa585zntlv7T64jem3zvz
 V86FErFR2njnejJOO9ebPvKhumCYQTiLAgEA4eKdVZj3AWr0QXlSO4hwn0/nlA==
Subject: [PATCH 3/3] arm64: module: Use text-poke for late PLT/veneer emission
Message-Id: <20261010085055.2200241-2-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <20261010084721.2197683-1-qirui.001@bytedance.com> <20261010085055.2200241-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>, 
	<stable@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ac9fc88+1c64a5+lists.infradead.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
To: <catalin.marinas@arm.com>, <will@kernel.org>
Date: Sat, 10 Oct 2026 16:50:55 +0800
In-Reply-To: <20261010085055.2200241-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_015130_121783_508DA51D 
X-CRM114-Status: GOOD (  13.94  )
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

module_emit_plt_entry() and module_emit_veneer_for_adrp() write PLT
entries into the .plt section by direct assignment.  Once a module is
fully formed its .plt is read-only/executable, so a late (livepatch)
relocation that falls back to PLT emission -- an out-of-range
R_AARCH64_CALL26/JUMP26, or an ADRP under CONFIG_ARM64_ERRATUM_843419
-- triggers a synchronous Data Abort and panics.

This is the same ROX premise that commit 91b89a634487
("arm64/module: Use text-poke API for late relocations.") handled for
the relocation writes through WRITE_PLACE(); the PLT/veneer emitters
were left using direct assignment.

The late path is reachable without remapping:
klp_write_section_relocs() applies .klp.rela.* sections through
apply_relocate_add() with the patch module already MODULE_STATE_LIVE,
so .plt is ROX.

Route the emitters through the text-poke API, mirroring WRITE_PLACE().

Fixes: 91b89a634487d5614e51ee773a889ed57f5551ca ("arm64/module: Use text-poke API for late relocations.")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/kernel/module-plts.c | 35 ++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..fa89ed014bd1 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -9,6 +9,29 @@
 #include <linux/module.h>
 #include <linux/moduleloader.h>
 #include <linux/sort.h>
+#include <linux/text-patching.h>
+
+/*
+ * The .plt section is marked ROX once the module is fully formed, so
+ * late (livepatch) relocations that emit PLT entries cannot use direct
+ * assignment.  Mirror WRITE_PLACE() and route the write through the
+ * text-poke API when the module is already loaded.
+ *
+ * Return: 0 on success, -EINVAL if the text-poke write failed.
+ */
+static int plt_entry_write(struct plt_entry *plt,
+			   struct plt_entry *entry, struct module *mod)
+{
+	if (mod->state == MODULE_STATE_UNFORMED) {
+		*plt = *entry;
+		return 0;
+	}
+
+	if (!aarch64_insn_copy(plt, entry, sizeof(*plt)))
+		return -EINVAL;
+
+	return 0;
+}
 
 static struct plt_entry __get_adrp_add_pair(u64 dst, u64 pc,
 					    enum aarch64_insn_register reg)
@@ -76,11 +99,14 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
 	u64 val = sym->st_value + rela->r_addend;
+	struct plt_entry entry;
 
 	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
 		i++;
 
-	plt[i] = get_plt_entry(val, &plt[i]);
+	entry = get_plt_entry(val, &plt[i]);
+	if (plt_entry_write(&plt[i], &entry, mod))
+		return 0;
 
 	/*
 	 * Check if the entry we just created is a duplicate. Given that the
@@ -107,6 +133,7 @@ u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 	int i = pltsec->plt_num_entries++;
 	u32 br;
 	int rd;
+	struct plt_entry entry;
 
 	if (WARN_ON(pltsec->plt_num_entries > pltsec->plt_max_entries))
 		return 0;
@@ -121,8 +148,10 @@ u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 	br = aarch64_insn_gen_branch_imm((u64)&plt[i].br, (u64)loc + 4,
 					 AARCH64_INSN_BRANCH_NOLINK);
 
-	plt[i] = __get_adrp_add_pair(val, (u64)&plt[i], rd);
-	plt[i].br = cpu_to_le32(br);
+	entry = __get_adrp_add_pair(val, (u64)&plt[i], rd);
+	entry.br = cpu_to_le32(br);
+	if (plt_entry_write(&plt[i], &entry, mod))
+		return 0;
 
 	return (u64)&plt[i];
 }
-- 
2.20.1

