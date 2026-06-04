Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BABDCD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfWDnkDwkkfbnuCPMrlh9TY6xMPQgUKPCYmPMT1bj3Y=; b=L4UzWLSE/uGHuFiSFFIfta2Fd9
	tE5Wr3d/GvS1kqtL63V55qFdr2dcH12rI+xhG+ce7k0/dIR9aTczkYPORlBlkjups2zQirKajNgI4
	NpoyHCFTRvj0fZ6xVO5H400kn/zYr8kFwvy7hKHw3gV0jSttBD2lZADIGDEOUH+JgO6vL4MggHA5i
	neBLp7JARHxSFfpb7PpqSkmkkVk2/u+0l1iVPI6VNnY2FAzg+/cQTsNfDAGy4/u9fRz3XfCX52Eew
	jAJPMZ7pZEJzCThR9tyQI1ONz5Ih8UmxAY8DQINEbv4E6L/L4R5HhyAC8Q+rSsRu4B2y27nD1y7OM
	xKt373dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaR-0000000HGHt-3Cp7;
	Thu, 04 Jun 2026 20:22:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaP-0000000HGFC-3BKG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:22:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 713A4C63453;
	Thu,  4 Jun 2026 20:22:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13DA95FED1;
	Thu,  4 Jun 2026 20:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3C85106A1D2C;
	Thu,  4 Jun 2026 22:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780604558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RfWDnkDwkkfbnuCPMrlh9TY6xMPQgUKPCYmPMT1bj3Y=;
	b=DmC5uD7Ufj+9BtNRuy5VfbgxYZpX1m4cXOJ8liQembdGsvxTu8kssq/pi6HlrhNOWCiWaB
	Tb6vGElU2Vlafl9+fpmnZhj1IaXDxPnt+cjEkjVeABuufocl2HUs3JJhAX2QX+Fj3PpUh3
	g4sZpGl6prt/hZCI+kKP5oS5xY9j0fSYd/Df7hfxqJwlzL0ITG/Z+Ixck7kHpjniNJIMEW
	wt6XfQs3M8gOKP26Y0CMmp/njdD+dyBiKSyFGOMe9GdVDbeYaON6mF9aeyzZjvKbYbgGRJ
	VOkK+/Va/TqY9jKJhpOc2+P4SHS6KNoJZSMU+c85ZaJQKneIcU9Zyt9Gp8xb+A==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:02 +0200
Subject: [PATCH bpf-next v2 4/8] bpf, x86: refactor BPF_ST management in
 do_jit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_132242_129590_840C4192 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

In order to prepare for KASAN checks insertion before every
memory-related load or store, group all BPF_ST instructions that indeed
access memory in a single block of fall-through cases to allow
instrumenting those in one call, rather than having to instrument all
cases individually.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/x86/net/bpf_jit_comp.c | 53 ++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 0981791014eb..943a0f315cf2 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -2300,41 +2300,50 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 			EMIT_LFENCE();
 			break;
 
-			/* ST: *(u8*)(dst_reg + off) = imm */
 		case BPF_ST | BPF_MEM | BPF_B:
-			if (is_ereg(dst_reg))
-				EMIT2(0x41, 0xC6);
-			else
-				EMIT1(0xC6);
-			goto st;
 		case BPF_ST | BPF_MEM | BPF_H:
-			if (is_ereg(dst_reg))
-				EMIT3(0x66, 0x41, 0xC7);
-			else
-				EMIT2(0x66, 0xC7);
-			goto st;
 		case BPF_ST | BPF_MEM | BPF_W:
-			if (is_ereg(dst_reg))
-				EMIT2(0x41, 0xC7);
-			else
-				EMIT1(0xC7);
-			goto st;
 		case BPF_ST | BPF_MEM | BPF_DW:
-			if (dst_reg == BPF_REG_PARAMS && insn->off == -8) {
-				/* Arg 6: store immediate in r9 register */
-				emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
+			switch (BPF_SIZE(insn->code)) {
+			case BPF_B:
+				if (is_ereg(dst_reg))
+					EMIT2(0x41, 0xC6);
+				else
+					EMIT1(0xC6);
+				break;
+			case BPF_H:
+				if (is_ereg(dst_reg))
+					EMIT3(0x66, 0x41, 0xC7);
+				else
+					EMIT2(0x66, 0xC7);
+				break;
+			case BPF_W:
+				if (is_ereg(dst_reg))
+					EMIT2(0x41, 0xC7);
+				else
+					EMIT1(0xC7);
+				break;
+			case BPF_DW:
+				if (dst_reg == BPF_REG_PARAMS &&
+				    insn->off == -8) {
+					/* Arg 6: store immediate in r9 register */
+					emit_mov_imm64(&prog, X86_REG_R9,
+						       imm32 >> 31, (u32)imm32);
+					break;
+				}
+				EMIT2(add_1mod(0x48, dst_reg), 0xC7);
 				break;
 			}
-			EMIT2(add_1mod(0x48, dst_reg), 0xC7);
 
-st:			insn_off = insn->off;
+			insn_off = insn->off;
 			if (dst_reg == BPF_REG_PARAMS) {
 				/*
 				 * Args 7+: reverse BPF negative offsets to
 				 * x86 positive rsp offsets.
 				 * BPF off=-16 → [rsp+0], off=-24 → [rsp+8], ...
 				 */
-				insn_off = outgoing_arg_base - outgoing_rsp - insn_off - 16;
+				insn_off = outgoing_arg_base - outgoing_rsp -
+					   insn_off - 16;
 				dst_reg = BPF_REG_FP;
 			}
 			if (is_imm8(insn_off))

-- 
2.54.0


