Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41216C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHMoz1vySQvYeQW+hJXZKhFp+T//bo0AG/CTIQJNNJo=; b=egqxy4V3i49Fk5
	EVGULIiQp/ZyqUC5SuR2tD9Chx7YiTomRgAOotRGz2ZLHa54gy3LtJuJq75rkIJh3QxJrO+5C4b5C
	toI196pzWe0LOIECgrcIHu9v6VWQtFzNWNxCcmMQ7ECfzXOXSCmSAqFdsH8AvqamM6HrN7UPLe600
	Muun9a6WbNzbxtgsJ44UreGnnOjVzVKoVx1wf/iUF6ZQbGYaC8T9Fzfneo/d+9E70UPffz/CqTpKm
	/r8P3qazMhrFx9A9Ymsxc7+bYX5ThSJklTYGc2C6CoOp9PVt7T1xKYqwKIZmBmN96fe2AWvPrSPGc
	eaAgTQfPSBmO/eHpPw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEW-0000000Eyw5-3pql;
	Fri, 18 Sep 2026 16:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEM-0000000Eyso-39xM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F8676053B;
	Fri, 18 Sep 2026 16:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07361F000FF;
	Fri, 18 Sep 2026 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748069;
	bh=aHMoz1vySQvYeQW+hJXZKhFp+T//bo0AG/CTIQJNNJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Edp8R+bBPQqImx1+AnsYjmOnuRIOuZBNv9WinTHaoT2DaiptqJx27nbkcCY8+1zLU
	 peekFHkhOw2J1WKN44ohH3bDuRpgH1lqV8GkyKcFKG1KjapgQHnyVDf0Sslq++JjFa
	 2kRTowqnTeUg37ewHZQ7yuWYaGpnjk4GrQ6UN/jeec3jsd/wCXHG8NF475UmF3JIPI
	 +NqXQs5Mow6EX4NSCPmfNjqJmyTm5paYlW2mbLzrjMxhw/HWMXejN/5sONfC8hsm9g
	 qKS8tHj98Eh8MQxxT0DUmDbARLdqk3QEXt+tCJIfBgSM+KErRj8J243E/rwLS/pYfG
	 tY0NDIM1gutHg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
Date: Fri, 18 Sep 2026 17:13:48 +0100
Message-ID: <20260918161407.2300-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


