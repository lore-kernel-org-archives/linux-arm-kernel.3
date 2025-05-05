Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F44C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP5PdwhIKAkH6+l1rocF8R+5yrj9W9WXQ2bzwkG7ITA=; b=kJ1Kok+P1uluPhsUyLPPdcUkYN
	nbUUTaJyRt0PUk+gWVyMcz1HW91bMCF2RyRl60zB4iH6D0zmFCwMnTi0hdqLoCEJVAFKU0Gwt8Psj
	2ezydLntEYkLvwWHIgygToXugSthiQyCM0LU7e2wus9l9pp4KS4+mliJBL/mUIYuKik+JfY4teAqi
	7XjB8SmfyqFtoIAQ6WB15rzzJ5smXguFjH4NQPcIdvN71X7CK0FU8SoxxXfGBDKZNCxmAEYoXL+q9
	vlyvBVgVSeFEXr+huJCbUyJW4LGsra2x+xGpJwCW5TYn+2qb0d9Li+O/uBJhAoWl+27Tn2pW4nFKD
	4F5e3RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5iF-00000009At3-2y3O;
	Mon, 05 May 2025 23:59:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ID-00000008lbw-3O5H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D32324A5FD;
	Mon,  5 May 2025 22:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7DFC4CEE4;
	Mon,  5 May 2025 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484089;
	bh=pa0KwOgvcTdl4NeBIz0JuwFGhxRnO/vyrgpOmB9ZJ5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVxc0Y8foZWuHbYD2WQb2kxdUQsUBMk+70CX6YJ4n8ZXiQES+O47apdkqoNsboP45
	 tT5b7ot0HiDmlKXxUzz+A+qx8zt+W0ePfb6g+2nSx6o2EnttmuOHMMQRwUCOLUBpkd
	 XRm0n7JB5sXVghplkOLQPRz6Olg6Y9BEh1N97ecBENu84FpLfcb8zBb283wLXMpXEG
	 qgILhzVGjzr1eIwaN5mk8Y+VLrEJNNlrlJLrzqsCG8NX0jnu9N6B2Hj6MZzUwTNpyj
	 gkRF6CVBIfJP5cer3tRiBM/ZgRTcPO9n9PpmgQrQCiFkoiQvn+yfsmK0L8uTmFWVp4
	 RLSi4CKnwZJkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Song Liu <song@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@iogearbox.net,
	andrii@kernel.org,
	puranjay@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 345/642] bpf: arm64: Silence "UBSAN: negation-overflow" warning
Date: Mon,  5 May 2025 18:09:21 -0400
Message-Id: <20250505221419.2672473-345-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152809_865205_B01CF872 
X-CRM114-Status: GOOD (  10.21  )
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

From: Song Liu <song@kernel.org>

[ Upstream commit 239860828f8660e2be487e2fbdae2640cce3fd67 ]

With UBSAN, test_bpf.ko triggers warnings like:

UBSAN: negation-overflow in arch/arm64/net/bpf_jit_comp.c:1333:28
negation of -2147483648 cannot be represented in type 's32' (aka 'int'):

Silence these warnings by casting imm to u32 first.

Reported-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Song Liu <song@kernel.org>
Tested-by: Breno Leitao <leitao@debian.org>
Link: https://lore.kernel.org/r/20250218080240.2431257-1-song@kernel.org
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8446848edddb8..7409c8acbde35 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -272,7 +272,7 @@ static inline void emit_a64_add_i(const bool is64, const int dst, const int src,
 {
 	if (is_addsub_imm(imm)) {
 		emit(A64_ADD_I(is64, dst, src, imm), ctx);
-	} else if (is_addsub_imm(-imm)) {
+	} else if (is_addsub_imm(-(u32)imm)) {
 		emit(A64_SUB_I(is64, dst, src, -imm), ctx);
 	} else {
 		emit_a64_mov_i(is64, tmp, imm, ctx);
@@ -1159,7 +1159,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	case BPF_ALU64 | BPF_SUB | BPF_K:
 		if (is_addsub_imm(imm)) {
 			emit(A64_SUB_I(is64, dst, dst, imm), ctx);
-		} else if (is_addsub_imm(-imm)) {
+		} else if (is_addsub_imm(-(u32)imm)) {
 			emit(A64_ADD_I(is64, dst, dst, -imm), ctx);
 		} else {
 			emit_a64_mov_i(is64, tmp, imm, ctx);
@@ -1330,7 +1330,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	case BPF_JMP32 | BPF_JSLE | BPF_K:
 		if (is_addsub_imm(imm)) {
 			emit(A64_CMP_I(is64, dst, imm), ctx);
-		} else if (is_addsub_imm(-imm)) {
+		} else if (is_addsub_imm(-(u32)imm)) {
 			emit(A64_CMN_I(is64, dst, -imm), ctx);
 		} else {
 			emit_a64_mov_i(is64, tmp, imm, ctx);
-- 
2.39.5


