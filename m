Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261DE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9I9TydWVo15yKzkAGFLtCWQjvdOPQocpTW8F8p/JRI=; b=e+ursJaeK7X08FQGZSKyHTvu1t
	X0yLtkB6vuFMqALDlpoicxdy6G64KdSg3D4sWuQCByFLJ3npelnObsTa9+r71FzDujq89JJNsxKkg
	Hmq18O9wRKxZ0Ask7EBW/YopRx2j9tgFIwu9D5ZEbbZfmXUvauEg8w/EG6wBPOvSaLQE+wYbuwSOq
	bBnt1mg/ayawLcs6S1YP8eHXeX+X8/96umyi09PHUKGNBzHbKJIWEcTn2odAa48fry8OTjpfMOQtj
	ogliPDf72Y+oztc/rSsWf3QY7+ctTZgX5zZRyr2YN11qj6lOkh1NWyFeFTFtbygT334k0od+gp8vF
	duk20lAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt545-0000000BSGn-1y83;
	Thu, 19 Feb 2026 14:31:37 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt53z-0000000BSDq-36mL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:31:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771511487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9I9TydWVo15yKzkAGFLtCWQjvdOPQocpTW8F8p/JRI=;
	b=XDu1ztxsOwv2MmylQD0qb4UCW5fqcEoF4pFpbhXOIVlzj8Js4KnUzKViS3VL1nbB5t0aI6
	C0VmxmzJKZmbudyuazDQ2XpWcujZ2AsRVwShzv0kR39Hbv8mwH8uz8qS4aJawcAPwkLhxh
	vTPPAFLMR1eemfo9bIwXvWuSpLfUEVs=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v2 3/6] bpf, arm64: Add 64-bit bitops kfuncs support
Date: Thu, 19 Feb 2026 22:29:25 +0800
Message-ID: <20260219142933.13904-4-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-1-leon.hwang@linux.dev>
References: <20260219142933.13904-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063132_330987_86C752D8 
X-CRM114-Status: GOOD (  15.10  )
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

Implement JIT inlining of the 64-bit bitops kfuncs on arm64.

bpf_clz64(), bpf_ffs64(), bpf_fls64(), and bpf_bitrev64() are always
inlined using mandatory ARMv8 CLZ/RBIT instructions. bpf_ctz64() is
inlined via RBIT + CLZ, or via the native CTZ instruction when
FEAT_CSSC is available. bpf_rol64() and bpf_ror64() are always inlined
via RORV.

bpf_popcnt64() is not inlined as the native population count instruction
requires NEON/SIMD registers, which should not be touched from BPF
programs. It therefore falls back to a regular function call.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 arch/arm64/net/bpf_jit_comp.c | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 7a530ea4f5ae..f03f732063d9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1192,6 +1192,127 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	return 0;
 }
 
+static inline u32 a64_clz64(u8 rd, u8 rn)
+{
+	/*
+	 * Arm Architecture Reference Manual for A-profile architecture
+	 * (Document number: ARM DDI 0487)
+	 *
+	 *   A64 Base Instruction Descriptions
+	 *   C6.2 Alphabetical list of A64 base instructions
+	 *
+	 *   C6.2.91 CLZ
+	 *
+	 *     Count leading zeros
+	 *
+	 *     This instruction counts the number of consecutive binary zero bits,
+	 *     starting from the most significant bit in the source register,
+	 *     and places the count in the destination register.
+	 */
+	/* CLZ Xd, Xn */
+	return 0xdac01000 | (rn << 5) | rd;
+}
+
+static inline u32 a64_ctz64(u8 rd, u8 rn)
+{
+	/*
+	 * Arm Architecture Reference Manual for A-profile architecture
+	 * (Document number: ARM DDI 0487)
+	 *
+	 *   A64 Base Instruction Descriptions
+	 *   C6.2 Alphabetical list of A64 base instructions
+	 *
+	 *   C6.2.144 CTZ
+	 *
+	 *     Count trailing zeros
+	 *
+	 *     This instruction counts the number of consecutive binary zero bits,
+	 *     starting from the least significant bit in the source register,
+	 *     and places the count in the destination register.
+	 *
+	 *     This instruction requires FEAT_CSSC.
+	 */
+	/* CTZ Xd, Xn */
+	return 0xdac01800 | (rn << 5) | rd;
+}
+
+static inline u32 a64_rbit64(u8 rd, u8 rn)
+{
+	/*
+	 * Arm Architecture Reference Manual for A-profile architecture
+	 * (Document number: ARM DDI 0487)
+	 *
+	 *   A64 Base Instruction Descriptions
+	 *   C6.2 Alphabetical list of A64 base instructions
+	 *
+	 *   C6.2.320 RBIT
+	 *
+	 *     Reverse bits
+	 *
+	 *     This instruction reverses the bit order in a register.
+	 */
+	/* RBIT Xd, Xn */
+	return 0xdac00000 | (rn << 5) | rd;
+}
+
+static inline bool boot_cpu_supports_cssc(void)
+{
+	/*
+	 * Documentation/arch/arm64/cpu-feature-registers.rst
+	 *
+	 *   ID_AA64ISAR2_EL1 - Instruction set attribute register 2
+	 *
+	 *     CSSC
+	 */
+	return cpuid_feature_extract_unsigned_field(read_sanitised_ftr_reg(SYS_ID_AA64ISAR2_EL1),
+						    ID_AA64ISAR2_EL1_CSSC_SHIFT);
+}
+
+static bool bpf_inlines_func_call(struct jit_ctx *ctx, void *func_addr)
+{
+	const u8 tmp = bpf2a64[TMP_REG_1];
+	const u8 r0 = bpf2a64[BPF_REG_0];
+	const u8 r1 = bpf2a64[BPF_REG_1];
+	const u8 r2 = bpf2a64[BPF_REG_2];
+	bool inlined = true;
+
+	if (func_addr == bpf_clz64) {
+		emit(a64_clz64(r0, r1), ctx);
+	} else if (func_addr == bpf_ctz64 || func_addr == bpf_ffs64) {
+		if (boot_cpu_supports_cssc()) {
+			emit(a64_ctz64(r0, r1), ctx);
+		} else {
+			emit(a64_rbit64(tmp, r1), ctx);
+			emit(a64_clz64(r0, tmp), ctx);
+		}
+	} else if (func_addr == bpf_fls64) {
+		emit(a64_clz64(tmp, r1), ctx);
+		emit(A64_NEG(1, tmp, tmp), ctx);
+		emit(A64_ADD_I(1, r0, tmp, 64), ctx);
+	} else if (func_addr == bpf_bitrev64) {
+		emit(a64_rbit64(r0, r1), ctx);
+	} else if (func_addr == bpf_rol64) {
+		emit(A64_NEG(1, tmp, r2), ctx);
+		emit(A64_DATA2(1, r0, r1, tmp, RORV), ctx);
+	} else if (func_addr == bpf_ror64) {
+		emit(A64_DATA2(1, r0, r1, r2, RORV), ctx);
+	} else {
+		inlined = false;
+	}
+
+	return inlined;
+}
+
+bool bpf_jit_inlines_kfunc_call(void *func_addr)
+{
+	if (func_addr == bpf_clz64 || func_addr == bpf_ctz64 ||
+	    func_addr == bpf_ffs64 || func_addr == bpf_fls64 ||
+	    func_addr == bpf_rol64 || func_addr == bpf_ror64 ||
+	    func_addr == bpf_bitrev64)
+		return true;
+	return false;
+}
+
 /* JITs an eBPF instruction.
  * Returns:
  * 0  - successfully JITed an 8-byte eBPF instruction.
@@ -1598,6 +1719,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 					    &func_addr, &func_addr_fixed);
 		if (ret < 0)
 			return ret;
+		if (bpf_inlines_func_call(ctx, (void *) func_addr))
+			break;
 		emit_call(func_addr, ctx);
 		/*
 		 * Call to arch_bpf_timed_may_goto() is emitted by the
-- 
2.52.0


