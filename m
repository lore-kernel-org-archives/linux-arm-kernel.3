Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5BCCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:Message-Id:From:Content-Type:Date:Cc:In-Reply-To:References:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US+Gg57swXQ2D9e2dltsJCvKtQB77YrVn7jqeloa4eI=; b=LjUIqjpbRhO9d8gp4N9toYOQr5
	SHJVqTaBpUX+67/sW86wxBOrUiUe58aD5aZi4POk4GuCF0M+M0XPp3sa9a4pGWsc3H2u+NIzJOsE+
	8KPFBw6ZS3Wsp5ljb6KrnEWdPvaptNsPelddfmRDY/tm9wvaKocsffKE+pfncGMEMIlPzRS0k/u7U
	S1e4+f10ToAtAV31jD7fTpbXb4KQf7uCeIfzig0VVB7J/Ul+Tt4kef9FlIZ1F8y6pdLneT//YPCEa
	RUoTBj5vWKvNZciltPogsqb1C4uy1WFTaQA+yBNLiYzgG0U+KxuD6J+y+oXCoDsHZEBHIqql7Q86c
	bWbqKceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnX-00000007i3u-1rEJ;
	Sat, 10 Oct 2026 08:51:19 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnU-00000007i3N-1hlr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 08:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622271; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=US+Gg57swXQ2D9e2dltsJCvKtQB77YrVn7jqeloa4eI=;
 b=nMoo/SF1pWKjC+qel/mkFZOq902NvICMhgxq46LNnzUnpGTXrZgp/BLtY42qb+8nahyQI+
 pzKcIEBtRkBDyCnGoBJ50nKFnba6kFEhzFt+0N0yqqkFNwK/XusKc2Wudd9mSkkcDNLDCf
 t51jmPkv9z+TVfF+CLSZqi8G1pnLyTTSr/oa3X/zJoUII50H4x4OQhj8bp/VDD3Jo8ztjH
 RSzJQ876Dt03ZyyOC9GPDhKrhoz2dw6v4aieyfMV8KjUH9O+NFUxngngvVITdQ4FYjq7oB
 echs45WRoWauLHTRBo4dwFqZgy4goWf4yGvzBaR7oRbzNjtaua9YxCHdCvFoNQ==
To: <catalin.marinas@arm.com>, <will@kernel.org>
Subject: [PATCH 2/3] arm64: patching: Fix instruction byte order in aarch64_insn_set()
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
In-Reply-To: <20261010084721.2197683-1-qirui.001@bytedance.com>
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>, 
	<stable@vger.kernel.org>
Date: Sat, 10 Oct 2026 16:50:54 +0800
Content-Type: text/plain; charset=UTF-8
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20261010085055.2200241-1-qirui.001@bytedance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26ac9fc7d+605c49+lists.infradead.org+qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_015116_533943_6583F169 
X-CRM114-Status: GOOD (  10.13  )
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

aarch64_insn_set() passes the host-endian u32 instruction straight to
text_poke_memset(), which memset32()'s it into memory in host byte order.
AArch64 instructions must be little-endian in memory, so on a big-endian
kernel the written bytes are reversed and the CPU takes an UNDEFINED
instruction exception when fetching them.  The sibling aarch64_insn_write()
already converts with cpu_to_le32(); aarch64_insn_set() does not.

This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
BE kernels with BPF JIT.  The direct-fill loop in the same file already
cpu_to_le32()'s the constant, confirming the expected byte order.

Convert the instruction to little-endian before the memset, mirroring
aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
unchanged.

Fixes: 451c3cab9a65e656c3b3d106831fc02d56b8c34a ("arm64: patching: implement text_poke API")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/kernel/patching.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..ffd790b2b277 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -170,10 +170,12 @@ noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
  */
 noinstr void *aarch64_insn_set(void *dst, u32 insn, size_t len)
 {
+	__le32 __insn = cpu_to_le32(insn);
+
 	if ((uintptr_t)dst & 0x3)
 		return NULL;
 
-	return __text_poke(text_poke_memset, dst, &insn, len);
+	return __text_poke(text_poke_memset, dst, &__insn, len);
 }
 
 int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
-- 
2.20.1

