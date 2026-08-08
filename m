Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A8DC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IJm04E1Jx6VRBFU9vtFpV6hpK6h8wmtKkvHTJRXIIk=; b=WpNDZpgJ0BHfC2QcttfaMBbNdh
	ZKfMc3ngKIyA40bpnLtu/b0+iuMF7E7pjjoDmBDBjOU2N9dWHNthexWN1H/B+bqusrLV6WgJvKNos
	HEPpDi462meb/INlqenoKuZ05spxDbsW7CF1Nb5Q0aVwruqlZLI4gsich6zLM/18ih9plkL2SVHwX
	t/Q1NBRvMcKKkCfFVInQyQw7TzHW0l6jkhWD7+nPtDCKPq54sxnADB1m87b1a1qSO4Zp73k1ZjDB9
	rktY3+81ILIyEekvQrdxTPmARicEB1lQbw6lwdY6lwnFF6MwAYBQbLmcuxQ1BsahRvkacGGLY354V
	8lcZ7Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJI-00000009mAf-462Y;
	Sat, 08 Aug 2026 23:18:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJE-00000009m6X-0Aad
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 737A260254;
	Sat,  8 Aug 2026 23:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2EF1F00AC4;
	Sat,  8 Aug 2026 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231111;
	bh=8IJm04E1Jx6VRBFU9vtFpV6hpK6h8wmtKkvHTJRXIIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hYrYrO3GWE5Ne93ezf2fcT3d/FJ+AsiTHKLc9c/ZlMmJUgtqy81RxerzfxRjoJkh7
	 +lMr6kZw+rwvrRFHt4ICuAbaCRhn1ZRiM4oQI9TAWCvjWWCaAOJExhZ61yp5uQmjhF
	 EOsNiUBP2c2VTjuZjjk05cQmmuaMK5it/Apa1kuhaQoTga5+4YTTPLNEQ5hqbk0+YU
	 G+pomKERkMtM8cmI8gShXr4auy1zISphl11+6ztbeIPXyBFQS3Jg5jQjGfUsGRzmjJ
	 ShU0uS+MS6t/1GCzxLMagrkioywKMpNprvWoUAnwZhZk5Y2zX5zECyLICylXJgeT4F
	 7BDSBTd7OQV4A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 06/22] arm64: vdso: Discard .discard.* sections
Date: Sat,  8 Aug 2026 16:17:10 -0700
Message-ID: <e246f9ed3b06724147ca801af3deea5e2cb3b80e.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In preparation for enabling objtool on arm64, add .discard.* to the
vDSO's /DISCARD/ section so objtool annotations don't cause orphan
section warnings or leak into the final vDSO binary.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vdso/vdso.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be291912..d5f96fa17e605 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -39,6 +39,7 @@ SECTIONS
 	/DISCARD/	: {
 		*(.note.GNU-stack .note.gnu.property)
 		*(.ARM.attributes)
+		*(.discard.*)
 	}
 	.note		: { *(.note.*) }		:text	:note
 
-- 
2.54.0


