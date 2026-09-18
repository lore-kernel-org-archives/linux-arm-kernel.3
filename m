Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D3C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPmtMvErDChPnAkncAvX9/4lDdnZXVCa66ctdGe0lWk=; b=UERiDz/j77ThbV
	tnDd4vDouaStyraZUL+/rdApvP6aCrgq/BxCJ1H4wGda2ODMCcytbotJdatt8BL+rQj3HrpcGtD3E
	pEK1PFPFCmuKhK79C+ZjyTr9Yf7IaaoS60C+HKd5bm7Fyvi/8cN/uBcOlenqSXe1WJwfkp0DGyRO2
	1SmZE/XQDu+iqzD91CXAPmO7Phv4bk9nnq4lP3PRA/uRRT9D4Z+bpoR0to7LFGdG08Acgj89VnF1h
	7rAr9nWIaRaCTaglsRtXAGLDKvAhBuPx/9NoQScrPJXSJDgxeUAH4o660lL2XnmgjzQqeqqk5yUp3
	22ayj1+owo6z1mSj2ZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF6-0000000EzOA-09Kw;
	Fri, 18 Sep 2026 16:15:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEo-0000000Ez9d-0Q9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFBB543BC1;
	Fri, 18 Sep 2026 16:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6371F00899;
	Fri, 18 Sep 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748097;
	bh=OPmtMvErDChPnAkncAvX9/4lDdnZXVCa66ctdGe0lWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KjrujF6I8y3AN56jW7bSdjLKy8uypi9i70m0KIMGyZzzAZOpzq6tSGxK4t1tdRAml
	 j4isO93RUuPAhEifUXnYxsswhXO4mAj1efZp0KL+1wnE47A1YQcZwkN43GqxvstJ5s
	 wed0kDmZZwVnlLug6QXUj2vwe/lpG6HT5LU4TtMHOpn3q54KSDwvaCEmB7JzJOvSxY
	 3D2EWtoM5pjXNy4ZFI91JATLqj+mSK+cKzU5H60uiRzkkhxalzeQ2UEk4w1iAhqPQ1
	 WSFKUUfUSXJtSP/EtGUdrszLLl+2ce2vYjHztTN2vPLJdGhNQYwwwSMD3pYUwziXg6
	 PHiiyoYRz7N5g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/21] KVM: arm64: Preserve handler/thread bit of EL1 mode in __finalise_el2()
Date: Fri, 18 Sep 2026 17:13:56 +0100
Message-ID: <20260918161407.2300-13-will@kernel.org>
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

__finalise_el2() unconditionally returns to EL2h when VHE is being used.
In preparation for handling callers from both EL1h and EL1t, preserve
the handler/thread bit of the calling mode when rewriting the exception
level in the SPSR.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h | 1 +
 arch/arm64/kernel/hyp-stub.S         | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 15649a253a57..25d9d9a0a6f7 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -37,6 +37,7 @@
 #define PSR_MODE_EL3t	0x0000000c
 #define PSR_MODE_EL3h	0x0000000d
 #define PSR_MODE_MASK	0x0000000f
+#define PSR_MODE_h_BIT	0x00000001
 
 /* AArch32 CPSR bits */
 #define PSR_MODE32_BIT		0x00000010
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 37c6976e44a4..f61778cccd3c 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -149,10 +149,11 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 
 	isb
 
-	// Hack the exception return to stay at EL2
+	// Hack the exception return to stay at EL2 ...
 	mrs	x0, spsr_el1
-	and	x0, x0, #~PSR_MODE_MASK
-	mov	x1, #PSR_MODE_EL2h
+	// ... preserving the 'h' bit so we don't swizzle SP.
+	and	x0, x0, #(~PSR_MODE_MASK | PSR_MODE_h_BIT)
+	mov	x1, #PSR_MODE_EL2t
 	orr	x0, x0, x1
 	msr	spsr_el1, x0
 
-- 
2.55.0.1082.g2b9226bbc0-goog


