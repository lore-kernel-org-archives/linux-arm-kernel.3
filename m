Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904AAC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etbcsch4QcilvSyBQAF3RxNP3Gl+idZnVnuLeHsdrpk=; b=tC8xSsExjNUHbG
	H/l4sTELYY1k3LurhtafhW7V5T2r5Sc0VHg+HDR8v66sesoVwDUf9CGzT/6dTx2M6Azg7F+g5jWTY
	Phd9IM10L9XRUU+l0nRtsRJCj50QNRDLy6F6Ej8hX0fR4fZvBRAf+V/Wocckcc6ei6GQMIqwHuzMN
	dJhwXmbGtGZGfQY3wcWS2lCo+FwrTX6LeiN9HYtS7HKbXyrmZQUAm0Uemp0dlSV0VkLgDeH/VEwPZ
	24IlLmScxheW2WZappC2DUOmph+GbAN33681GTqPwRmWQkjOV8kfetql5ZeT5kE/8ZdwSuS5fuxz8
	7i0Kdty6hPRlLPcEqY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRd-00000007NQR-1ROU;
	Mon, 07 Sep 2026 16:43:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRZ-00000007NNC-1ko4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3175F43876;
	Mon,  7 Sep 2026 16:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6AC1F00A3D;
	Mon,  7 Sep 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799421;
	bh=etbcsch4QcilvSyBQAF3RxNP3Gl+idZnVnuLeHsdrpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jnfY20oNgXj012V/khZlVSp+qpxna1T1uqFca5dEDuqQ4E8xQQrHqiiHTWssX7Umz
	 plmSMPw/pb/GwkN/X2j8SpZSdHMug2c+CNLxMxG/sjqQ3NYrJptOmUK7rmQRXvvQPI
	 qvTxufELRqMHo59cqDtmMXSVNgyYpPEtghSGOWYylSC68cJBaEgp32ZwWwhZsXlhvt
	 y0M2QAX3PeVvcd39+6+byr8isG9sI0zYqFqbzWDyKNAZ/e/i+mZ2NZp4U8Gv7eXTv9
	 wilPNCyR3xIbgyx559xkbB9MAXXkh/lpwA/RdJ/hgChf+0Q0KCT63nBZcbQCB54xCo
	 kimXZKgbO4gjQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/21] KVM: arm64: Preserve handler/thread bit of EL1 mode in __finalise_el2()
Date: Mon,  7 Sep 2026 17:42:37 +0100
Message-ID: <20260907164247.17223-13-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


