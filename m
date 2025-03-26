Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B439DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=; b=dddlwLMGTze35Of1g2T+a9BXvu
	Sv5ID9+0Y1T6TVN602CjeawK3WER/mE8zv5dkXl7VldjnRQRGxKnOyTrDHtTR5ESffACWjd7inleU
	OutVDe4VOgE+ugwP9AnZQkjpP9Emjxh7CxCOdt7f8HZiOhCI9KXHV7BtZ4yj4C30PzqQPOr1nKqxE
	Jjxc4oDG/VV0Mio0OREKBMNGB/6JObqvSHk2uwYvcVyuteYf+4WN1dyeRHuz7QYsSO5VigI6yL5a0
	+MV0BvI1bNQw+PQ43okgDbIbdwyqWCtzXE8FDi15R25uvV2+6Yuon+mT8m3yUG9aynYj/NJ6eZ3uZ
	9SVVadLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOao-00000008JNt-34HC;
	Wed, 26 Mar 2025 11:06:42 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOZ5-00000008J4Q-0b81
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:04:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so36296305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742987093; x=1743591893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=;
        b=mWfsEWV7rzrQ2Dn+3ZkENOTc/OilIZMh/nAadacxX/mSnAvRdKRKpthUdIMIcMn50C
         ymqndw9p4rnb+F+EkdwfPh1NSnohAfsxODPf+mQmkU+IrS1fL9P4+X5TXFJQNFzVvPHo
         vdYixh0vvB0nR2smcFj7epqwQgqyEUxrjufwrZ3U0BWcpUEIwT2QowNwANV3wtpvjtI4
         MxccQdyOkQTpaiDiFdIi99HtIpJMzoTPms2WIVIYZt+vtiESxWEXh4WkxzgFjXahoEmE
         CvLr4aT3sAGbD8OVDimj28+ZudAMkNWXhsC9V9TgAMVtqr0aXjOTPWzrbe8/nXaGSfqj
         vrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987093; x=1743591893;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=;
        b=QP5xAtJ/ftNKnN21KiuFE58qROqpW2W95WdJ4JEhUKFEdqnFoYSIVXoYCyD7EtKyFF
         bme7Ov2YpFexxWcRdl6m1sTYSoN08YNigtesZ1mYUq8/1FcnCcGlvBi9IthvyzPK0JGg
         0QBwaPjJ6NXI33ITUlRzFSfQOGBWokbZ3F8oaWvtRr/jyOQQfLoS6ly70rsvbbyA1c8u
         zPz/w6/4J72m43cdtsNcneTiUGsSKhc/3TFZRcG1aMiOIZ47x3lIfybiQwvpIUsXp9OW
         FZjfB2iIwAmrAlH2nxm5OmggGUmIQmRelxNiXEYdRvOvXAXbZM+Fjlwi5vVGudTezWif
         K0Bw==
X-Gm-Message-State: AOJu0YxVHRyc9vYcTlMWcEj4iyHCkxcnjhUqMm0hyndadRpPwZzqGwO9
	ZTEkhyflVi627ybsIPCeaMTMqlRjxixciG4IrHTSmSMKLeq9jvTPvEfK4uJDWKFwMAUjqvD2nDV
	vIT2YhdBR73WGP7PNI5i3Acy2KIgMw/WLbQ/GLDiGCQfqDHHBqDA9I/Ja/3jdkBezAbT9bTc7/r
	hQaoQIasot4u8wjzJ3eT70bqAguSi21qZjeftO9XNWNr19Sg==
X-Google-Smtp-Source: AGHT+IFE7QB78vQyOL/wlLJW8RVd/ZNnGkr6KLJbVri+z1rNmymt2uSjxG1NGSBhHuOotLBvKBi8D1fjsw==
X-Received: from wmcq22.prod.google.com ([2002:a05:600c:c116:b0:43d:b30:d2df])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:cc6:b0:43d:16a0:d82c
 with SMTP id 5b1f17b1804b1-43d509e6539mr206451605e9.2.1742987093272; Wed, 26
 Mar 2025 04:04:53 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:04:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326110448.3792396-1-keirf@google.com>
Subject: [PATCH v2] arm64: mops: Do not dereference src reg for a set operation
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Keir Fraser <keirf@google.com>, Kristina Martsenko <kristina.martsenko@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, stable@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_040455_178141_D3368FF9 
X-CRM114-Status: GOOD (  14.80  )
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

The source register is not used for SET* and reading it can result in
a UBSAN out-of-bounds array access error, specifically when the MOPS
exception is taken from a SET* sequence with XZR (reg 31) as the
source. Architecturally this is the only case where a src/dst/size
field in the ESR can be reported as 31.

Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
use of pt_regs_read_reg() prevented the out-of-bounds access.

Fixes: 2de451a329cf662b ("KVM: arm64: Add handler for MOPS exceptions")
Cc: Kristina Martsenko <kristina.martsenko@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/include/asm/traps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
index d780d1bd2eac..82cf1f879c61 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -109,10 +109,9 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 	int dstreg = ESR_ELx_MOPS_ISS_DESTREG(esr);
 	int srcreg = ESR_ELx_MOPS_ISS_SRCREG(esr);
 	int sizereg = ESR_ELx_MOPS_ISS_SIZEREG(esr);
-	unsigned long dst, src, size;
+	unsigned long dst, size;
 
 	dst = regs->regs[dstreg];
-	src = regs->regs[srcreg];
 	size = regs->regs[sizereg];
 
 	/*
@@ -129,6 +128,7 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 		}
 	} else {
 		/* CPY* instruction */
+		unsigned long src = regs->regs[srcreg];
 		if (!(option_a ^ wrong_option)) {
 			/* Format is from Option B */
 			if (regs->pstate & PSR_N_BIT) {
-- 
2.49.0.395.g12beb8f557-goog


