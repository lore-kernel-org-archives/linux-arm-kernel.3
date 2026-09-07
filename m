Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14AFC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jH28rU+mnq1lsgGFv5viipgfUPbuK680E/2q+gPKoGE=; b=KY9cSxKNYb7kHf
	1dT8O1/Pl4RFGruwTDnw24rEuJjE9u8SpXt1MDU9O3PVVGEi68OIb5Ja+pz93FZivjcoUfQHdekPy
	WYVnDyZtec/dVR9rnZAyXl735am4EOj4oXTOqi3GzITF1C6gu9YBKHkn2LwKPUEt8icrkUmrVIu3R
	S8GZPv25+R2cxfE2YpBghMzjCyQiwDLcR2C6LtUmt0/eOMUXuHq+shiVLD2BbLQx5WbVjY8fyBQ2S
	DFoGS48aS0GwwPTwb9guZxBPRRWWrkOfqYuk51KYGWqrnv92ZnGYZ1PDwGdwtwKKBNuzzRxd2oYM9
	UTyB/oKv8PiJ6ZeZw57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRj-00000007NY8-2OWV;
	Mon, 07 Sep 2026 16:43:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRg-00000007NUZ-3hPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 558D8601DE;
	Mon,  7 Sep 2026 16:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3714D1F00A3F;
	Mon,  7 Sep 2026 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799428;
	bh=jH28rU+mnq1lsgGFv5viipgfUPbuK680E/2q+gPKoGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HtrEthrk4YJ570v367OewbhJ0OaY8Q3MQQOiNhFUQ0pKOzv6hqbvsIj2cS20df17d
	 p70KKwJDAsqwem0At8drTuNpFNb57H9hcRnctyqCw8nyApJ72n7kHHobs4LxI4Rdq/
	 mc7W1qg+8b7pPlcDwkfBw3B+IxV7AuFqOUBtmNVOegoDgb7daeOGtSVfvVJUAnWL2Q
	 5jf7LPC5fWvVDHZ7kxQp7FvfVfRfQW3l+EzLe1HR8Hd6Fh3nrZBorujR/EuaNPWzz7
	 9pDf7VAhr1JDh1i+MQ7XVmdy1WmWw+t1I1gMunSyHxQ+lwZIkNHuYiBiGm6cU7lrnj
	 Bpvc/hBGiAN/g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/21] arm64: sdei: Support SDEI events from kernel handler and thread modes
Date: Mon,  7 Sep 2026 17:42:39 +0100
Message-ID: <20260907164247.17223-15-will@kernel.org>
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

Section 5.2.2 ("Event resume context") of the SDEI specification states
that, as a result of an SDEI_EVENT_COMPLETE_AND_RESUME call:

 | SPSR_ELc is set to the PSTATE when the event was taken

In preparation for making use of both thread and handler modes in the
kernel, adjust the SDEI event handler so that we return to the correct
kernel vector for the interrupted mode.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/sdei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 778f2a1faac8..6337ce905593 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -208,7 +208,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	int i, err = 0;
 	int clobbered_registers = 4;
 	u64 elr = read_sysreg(elr_el1);
-	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
+	u32 kernel_mode = read_sysreg(CurrentEL);
 	unsigned long vbar = read_sysreg(vbar_el1);
 
 	if (arm64_kernel_unmapped_at_el0())
@@ -233,7 +233,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 		pr_warn("unsafe: exception during handler\n");
 	}
 
-	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
+	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK) & ~PSR_MODE_h_BIT;
 
 	/*
 	 * If we interrupted the kernel with interrupts masked, we always go
@@ -251,7 +251,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * address'.
 	 */
 	if (mode == kernel_mode)
-		return vbar + 0x280;
+		return vbar + (regs->pstate & PSR_MODE_h_BIT ? 0x280 : 0x80);
 	else if (mode & PSR_MODE32_BIT)
 		return vbar + 0x680;
 
-- 
2.55.0.979.g7e5102b832-goog


