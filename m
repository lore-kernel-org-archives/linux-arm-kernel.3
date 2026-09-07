Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50001C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+K80nAxXhSm5NIt4T8l1ArolcUXrF2HTgu45U32pCw=; b=li+A3wUdHNYcb4
	ycMMZhgW0OZHRR6Md8zi9nt5EN00wLYDfKQ3sYHlmU5LNOqFHsBX2ylDn+8knDT8fd041LHhmHAsc
	GShVyvOhR2YMlXa1M+mEJH3I+l3PqaE26a2mxgs12k/ww2cF35bx+6/IPX0DTZu1dseZi7he2qZqn
	+GD4A5vNWmEZj3JE9Wnb6/sDnGrsBamLSKfM+GZSveasO5foQaHsaSpMuxeO0R9IO8GL75lyYQ8m9
	WgueeMh3V23ndsxCsU4alKVRkKhYZftAn53TWYJkrlCPsDeB+sEYa165CKffW84gpMxWlWqeiixRZ
	gU/nSr1Sr4ZGycVyF+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRX-00000007NL7-0tOo;
	Mon, 07 Sep 2026 16:43:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRW-00000007NK0-27eY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EED9860258;
	Mon,  7 Sep 2026 16:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06851F00A3E;
	Mon,  7 Sep 2026 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799417;
	bh=n+K80nAxXhSm5NIt4T8l1ArolcUXrF2HTgu45U32pCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dpz8P5flXB+f/mwxgnYVOmBx3XGJ4U0LMXVV6eh377oHMDt3NQEZHqh3xMpVKJFqU
	 7ke0Vf52rXfj34OteLR6GA/ECF+K9jB5o1NzSwM3lCRsb05RwZkXbeDN0RfRSzdqZp
	 D/vznvXSkPJe3edlXmBm2omlgTele7/zVMKnMo0lZCGFdThsZQe9SgcaaOUXS5bqT3
	 L+Qn0iHFlfUdLLpTHvPbav4gutLllDuIhlaoB9ROZy+GamkVzSOgh9lvEtamSIuXv2
	 sjN67/YA33G/e0TT1SwarAWb9U8WNAQ/8njsj7pPj1cB1gdIgeyfkq4OOVUQE9WjSR
	 TgdujM6Q7XTew==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/21] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Mon,  7 Sep 2026 17:42:36 +0100
Message-ID: <20260907164247.17223-12-will@kernel.org>
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

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3dc7291b16e9..cb9ae8a1ae87 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -21,7 +21,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.55.0.979.g7e5102b832-goog


