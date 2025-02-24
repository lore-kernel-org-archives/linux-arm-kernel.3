Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0EFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA+X6mmVUTj+Fwy2eA0enXAYeNRDahzcxnhY2l62vxg=; b=Qz3/b/xkw2+X+k49nPyWmKfZQu
	j9Fb7SK2iyyvb6Ipz7BN8iJHAfODnDiMd7tBrn/z5ky9eLkLr/MrSoj0uqem4x6dJCYOq+aVKyrxl
	vMmJcAxbrKPtOtlynLHZEL/5y94NEp147AbdYwDlTqKSfey2XeV9+NpWBtoZgAJp00hxJSySQRGP/
	jE08GGtcb9MjXT3n2rQyGpmu9QuVz+XWgZG2RZciGQdKQTCLpMYE9/rTyJfdOPdYnvxM/6m4Pd+4E
	srbJD77pbpMmnqsgXpzRf2SoMzWizokHFicgmoepf94kndQVFnPU0c9u6sbYVkc8NE6KrpJUoJTpf
	NOntbFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfHq-0000000F8Eu-1lYG;
	Mon, 24 Feb 2025 20:42:46 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([2001:638:a000:1025::14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfD9-0000000F7Ks-1EIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:37:56 +0000
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Z1sxY6QrJz8sjf;
	Mon, 24 Feb 2025 21:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1740429474; bh=UA+X6mmVUTj+Fwy2eA0enXAYeNRDahzcxnhY2l62vxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=fOxu1qXIDDJ7OxnH9V4Rd9zBejolTzZGr7/1mmYmxJHP0MTpwO5bzQ3iUKYn6puUY
	 1kKJx7c96Cj2O9jlsjqCxs82GuMeH9ZyH7bWQCUI9Yk//1gubDZAiVqQAeSetUd08C
	 4XjwTqdyeUbV/rzcH92zwVe8YeExDMhnoSiSAC4ftnFWCITRTi2271O9GgJEoebHAJ
	 C+Nj0/Ku56dySKBhegP7mtZN8BWCVvo2vqeKTbnHnf2lLWNPA3wdFTbzW9hR+0tWrF
	 j/CVz/hfMMOhXV8/9AXBdNhL+jcDHt2pu5JB9BT3eZ7tspt3il/jWGYm9i0XuOccN7
	 OJsdiG5XIoDVA==
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:362e:e00:55a6:11d5:2473:17a9
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:362e:e00:55a6:11d5:2473:17a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18cE53wlyYjOUljqa4wuvt/kwPDr4UAD6I=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Z1sxV5pgkz8slY;
	Mon, 24 Feb 2025 21:37:50 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [RFC PATCH 1/9] bpf/arm64: Unset bypass_spec_v4() instead of ignoring BPF_NOSPEC
Date: Mon, 24 Feb 2025 21:36:11 +0100
Message-ID: <20250224203619.594724-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224203619.594724-1-luis.gerhorst@fau.de>
References: <20250224203619.594724-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_123755_487299_12AA24A7 
X-CRM114-Status: GOOD (  20.38  )
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

This changes the semantics of BPF_NOSPEC to always insert a speculation
barrier. If this is not needed on some architecture, bypass_spec_v4()
should instead return true.

Consequently, sanitize_stack_spill is renamed to nospec_result.

This later allows us to rely on BPF_NOSPEC from v4 to reduce complexity
of Spectre v1 verification.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 arch/arm64/net/bpf_jit_comp.c | 10 +---------
 include/linux/bpf.h           | 14 +++++++++++++-
 include/linux/bpf_verifier.h  |  2 +-
 kernel/bpf/verifier.c         |  4 ++--
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8446848edddb..18370a45e8f2 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1508,15 +1508,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 
 	/* speculation barrier */
 	case BPF_ST | BPF_NOSPEC:
-		/*
-		 * Nothing required here.
-		 *
-		 * In case of arm64, we rely on the firmware mitigation of
-		 * Speculative Store Bypass as controlled via the ssbd kernel
-		 * parameter. Whenever the mitigation is enabled, it works
-		 * for all of the kernel code with no need to provide any
-		 * additional instructions.
-		 */
+		/* TODO: emit(A64_SB) */
 		break;
 
 	/* ST: *(size *)(dst + off) = imm */
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index f3f50e29d639..bd2a2c5f519e 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2423,7 +2423,19 @@ static inline bool bpf_bypass_spec_v1(const struct bpf_token *token)
 
 static inline bool bpf_bypass_spec_v4(const struct bpf_token *token)
 {
-	return cpu_mitigations_off() || bpf_token_capable(token, CAP_PERFMON);
+#ifdef ARM64
+	/* In case of arm64, we rely on the firmware mitigation of Speculative
+	 * Store Bypass as controlled via the ssbd kernel parameter. Whenever
+	 * the mitigation is enabled, it works for all of the kernel code with
+	 * no need to provide any additional instructions. Therefore, skip
+	 * inserting nospec insns against Spectre v4 if arm64
+	 * spectre_v4_mitigations_on/dynamic() is true.
+	 */
+	bool spec_v4 = arm64_get_spectre_v4_state() == SPECTRE_VULNERABLE;
+#else
+	bool spec_v4 = true;
+#endif
+	return !spec_v4 || cpu_mitigations_off() || bpf_token_capable(token, CAP_PERFMON);
 }
 
 int bpf_map_new_fd(struct bpf_map *map, int flags);
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 32c23f2a3086..2af09d75c7cd 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -561,7 +561,7 @@ struct bpf_insn_aux_data {
 	u64 map_key_state; /* constant (32 bit) key tracking for maps */
 	int ctx_field_size; /* the ctx field size for load insn, maybe 0 */
 	u32 seen; /* this insn was processed by the verifier at env->pass_cnt */
-	bool sanitize_stack_spill; /* subject to Spectre v4 sanitation */
+	bool nospec_result; /* ensure following insns from executing speculatively */
 	bool zext_dst; /* this insn zero extends dst reg */
 	bool needs_zext; /* alu op needs to clear upper bits */
 	bool storage_get_func_atomic; /* bpf_*_storage_get() with atomic memory alloc */
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 60611df77957..5be3bd38f540 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4904,7 +4904,7 @@ static int check_stack_write_fixed_off(struct bpf_verifier_env *env,
 		}
 
 		if (sanitize)
-			env->insn_aux_data[insn_idx].sanitize_stack_spill = true;
+			env->insn_aux_data[insn_idx].nospec_result = true;
 	}
 
 	err = destroy_if_dynptr_stack_slot(env, state, spi);
@@ -20445,7 +20445,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 		}
 
 		if (type == BPF_WRITE &&
-		    env->insn_aux_data[i + delta].sanitize_stack_spill) {
+		    env->insn_aux_data[i + delta].nospec_result) {
 			struct bpf_insn patch[] = {
 				*insn,
 				BPF_ST_NOSPEC(),
-- 
2.48.1


