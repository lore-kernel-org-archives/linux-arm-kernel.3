Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D6FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHSmidgSt8AbjYT2raXqIZZYXGrQJOWrMI3DNUPT/To=; b=X6IJG7qoZUuuzd
	0h3/yCCaq+0pUdB2IkyoE0XE4ssHmwJ2BzXf7n9VL4uKgz0cL6Yi2q3+JGG3aADt2FAhGZ/K6r0d0
	tQZsdr9u5nzFPTYpCBY6g4FgVl+l8JsLmfetEW+OFF9zMehYdaptUOkVHqfTfvnPD7enaiqzSu3CE
	S+CwkiFgVVi6j/fHDMkbhPPmP77DL2OMB8L4wX8c9uAPydJ7LLZfi1QK1uCQlOtmlXfhWXH3Ay/ke
	z7TSLubrloNVahwieoRh0jsTGvSeemiRVL74M5mdfpn5vF4pP97WB2n5ZqkU25LGxALsnv02ssWvL
	K6MT+f9RT3QaO34kakVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR8-00000007Mxk-3cJp;
	Mon, 07 Sep 2026 16:43:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR8-00000007MxW-1Yo5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BBCD4387D;
	Mon,  7 Sep 2026 16:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1832E1F00A3F;
	Mon,  7 Sep 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799393;
	bh=VHSmidgSt8AbjYT2raXqIZZYXGrQJOWrMI3DNUPT/To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CocsL0/aIfzLSNLpwpHRNrvHm73Fw4AxTaKa1B5XmrTYXs2CzVdSXLcHcOp+COqUY
	 29ibwMG4DS8UME1PQwp8zvZv/2x+NtEiqr0oEn0CpLBYqjXjvlcDvQRGZUp+ofcGYf
	 3VjlMrzyLNTmvw5JYTd6XM1ylg5FA1vlDmYxlB9x9et/IjlI5thJhC/5INjTfElgmn
	 c7++bVGH+cQfjkEmRAOPFFn478E4rlNbDyNRVFtVSAAtq5Cj9o+6ThvZu3SN5aAAkx
	 BqwSOoqJOq2sNHFJ/kZn6TWGgFep2pJrbeUxslZxvN/quGadOAcC5RPW6VLZalg2A0
	 53aV0tlsCEEow==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
Date: Mon,  7 Sep 2026 17:42:29 +0100
Message-ID: <20260907164247.17223-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In preparation for storing 'current' in TPIDRRO_EL0, add support for the
instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/insn.h | 1 +
 arch/arm64/net/bpf_jit.h      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a442638..0e739740513d 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -136,6 +136,7 @@ enum aarch64_insn_special_register {
 };
 
 enum aarch64_insn_system_register {
+	AARCH64_INSN_SYSREG_TPIDRRO_EL0	= 0x5e83,
 	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
 	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
 	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index b2fe6e6dcf44..df469a005373 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -331,6 +331,8 @@
 	aarch64_insn_gen_adr(0, offset, Rd, AARCH64_INSN_ADR_TYPE_ADR)
 
 /* MRS */
+#define A64_MRS_TPIDRRO_EL0(Rt) \
+	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDRRO_EL0)
 #define A64_MRS_TPIDR_EL1(Rt) \
 	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDR_EL1)
 #define A64_MRS_TPIDR_EL2(Rt) \
-- 
2.55.0.979.g7e5102b832-goog


