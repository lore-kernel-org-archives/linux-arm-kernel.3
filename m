Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3425CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7lgfLWLXsNQsRRZmoBhOWuV7UpGg1q0waf+EMxc2Ls=; b=xG4mvHGEXFEg0PjxX8Y59SGGvP
	WOUmY3uQrLp70zyLCiIFnVFYxsl3EzhROIQUgbFQoTdZpus6jq8q5hnsQ7fhnCmHlFOesJq8B2FDe
	l6zTXC3F+dqOMm3T47f20rQMbGgpDktDCeK6CeDwXocgt7KXHuvaHzZkljm7MsG4FmW5NioogNNII
	UxVMnpRHOlM04rFcERFLtVriF4rIQB5x4wE9WeP59v5p3l1UKZvZULpEqh6egAvK1zxzL+KnVJc9M
	tpesYd9xK1SWD/Bq5V0znypyfse0cq3i1YIWxtNWohVjXYfxpTJLs1LgNVXlK3ei6Tb55URg/pwDz
	JO7n43og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOz0-0000000F0ww-0y0S;
	Thu, 01 May 2025 08:09:26 +0000
Received: from mx-rz-2.rrze.uni-erlangen.de ([2001:638:a000:1025::15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOwX-0000000F0Py-29za
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 08:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746086810; bh=+7lgfLWLXsNQsRRZmoBhOWuV7UpGg1q0waf+EMxc2Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=Lqd2L4ldlMmQ2gYtXZSlS/Y77iMiRck+x3bM/dJ6ZkzW3oV4kFaLBOfTQiQkOFEts
	 DjWT2k5qkUYPm9ILbCG4gQl1Cp3woNOruD7qo0LZTWvbEmXmzwXjz/MTrP+yvwWBLR
	 yu8DyNeORk6O4VHW6yei05nuITwD3nmHHPp2Aq5iu7EndY5TBH4Xm779zVyZqcUHNh
	 am2c93hN34xXs49lcmkZXvIjvgqibeQuj9cJBC5Xb2rAwyqUz0wxdfwa8NVyDg11WP
	 jfbOXs3mHR4ViA+2BliT+xoNH9+NcnEpF5+k3U5bLEVbnBN6hNPeKFA6GYPAdXluMp
	 m7bSbtjZHJt3w==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zp68V2PYfzPll2;
	Thu,  1 May 2025 10:06:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3636:a700:12b2:e53f:6cbc:f48c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3636:a700:12b2:e53f:6cbc:f48c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+e9ts1dicdnWz1vSIwCnh46LNHnyIP/DE=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zp68Q6NQ2zPkQk;
	Thu,  1 May 2025 10:06:46 +0200 (CEST)
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
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected var-offset stack access
Date: Thu,  1 May 2025 09:36:01 +0200
Message-ID: <20250501073603.1402960-11-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_010653_705948_00F4F069 
X-CRM114-Status: GOOD (  16.98  )
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

Insert a nospec before the access to prevent it from ever using an index
that is subject to speculative scalar-confusion.

The access itself can either happen directly in the BPF program (reads
only, check_stack_read_var_off()) or in a helper (read/write,
check_helper_mem_access()).

This relies on the fact that the speculative scalar confusion that leads
to the variable-stack access going OOBs must stem from a prior
speculative store or branch bypass. Adding a nospec before the
variable-stack access will force all previously bypassed stores/branches
to complete and cause the stack access to only ever go to the stack slot
that is accessed architecturally.

Alternatively, the variable-offset stack access might be a write that
can itself be subject to speculative store bypass (this can happen in
theory even if this code adds a nospec /before/ the variable-offset
write). Only indirect writes by helpers might be affected here (e.g.,
those taking ARG_PTR_TO_MAP_VALUE). (Because check_stack_write_var_off()
does not use check_stack_range_initialized(), in-program variable-offset
writes are not affected.) If the in-helper write can be subject to
Spectre v4 and the helper writes/overwrites pointers on the BPF stack,
they are already a problem for fixed-offset stack accesses and should be
subject to Spectre v4 sanitization.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index db26b477dd45..1fbafea3ed69 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7894,6 +7894,11 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
 	}
 }
 
+static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
+{
+	return &env->insn_aux_data[env->insn_idx];
+}
+
 /* When register 'regno' is used to read the stack (either directly or through
  * a helper function) make sure that it's within stack boundary and, depending
  * on the access type and privileges, that all elements of the stack are
@@ -7933,18 +7938,18 @@ static int check_stack_range_initialized(
 	if (tnum_is_const(reg->var_off)) {
 		min_off = max_off = reg->var_off.value + off;
 	} else {
-		/* Variable offset is prohibited for unprivileged mode for
+		/* Variable offset requires a nospec for unprivileged mode for
 		 * simplicity since it requires corresponding support in
 		 * Spectre masking for stack ALU.
 		 * See also retrieve_ptr_limit().
 		 */
 		if (!env->bypass_spec_v1) {
-			char tn_buf[48];
-
-			tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
-			verbose(env, "R%d variable offset stack access prohibited for !root, var_off=%s\n",
-				regno, tn_buf);
-			return -EACCES;
+			/* Allow the access, but prevent it from using a
+			 * speculative offset using a nospec before the
+			 * dereference op.
+			 */
+			cur_aux(env)->nospec = true;
+			WARN_ON_ONCE(cur_aux(env)->alu_state);
 		}
 		/* Only initialized buffer on stack is allowed to be accessed
 		 * with variable offset. With uninitialized buffer it's hard to
@@ -11172,11 +11177,6 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
 	return -ENOTSUPP;
 }
 
-static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
-{
-	return &env->insn_aux_data[env->insn_idx];
-}
-
 static bool loop_flag_is_zero(struct bpf_verifier_env *env)
 {
 	struct bpf_reg_state *regs = cur_regs(env);
-- 
2.49.0


