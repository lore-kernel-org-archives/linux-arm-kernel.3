Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3232C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDzhVCGue3W4kwX6q3tsgotgwxJZX9yA0SsacigpNYw=; b=LYRQyddZAWT3LQ
	DoD/vQ0/3g8oSczX3dO4FLbDd9hF8K6SfMgbAIU+CHRRnbE/XbRcuaqytP3+0f58KAGKc3UnowGEC
	1CVSMXULSMrT14JDC8fhRsy8z1eOKZa08PniObVUBNK7eZoYUOrUy9ooH0MpiIVxqI1pjvfse4Jle
	xjt6cRIprhzovXqzv+NIIkQFRWI0v1lUMZgqutBL38qdtljnEYxI2jpgGvEwTwAvthiejHziJwVFX
	MusGoVJQnswGt4GhRgImJnh72PU9SmMgxwr9gsNg28RMPSdCWZ0lR50AN8EoGEeomx1wc6BGpI2ry
	13VCo3jYuBJOSFyx8NwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRg-00000007NUQ-1ttI;
	Mon, 07 Sep 2026 16:43:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRc-00000007NPs-49FZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBD4741FD7;
	Mon,  7 Sep 2026 16:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3631F00A3A;
	Mon,  7 Sep 2026 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799424;
	bh=BDzhVCGue3W4kwX6q3tsgotgwxJZX9yA0SsacigpNYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YZAOrzDFErWk3qZZVEGDOIMnCekrj4170ZlGWStK7PD50ym+iC3IY3aj+kuuwp9IY
	 B0avZObpJ/Y9ymL+p+BNseiK/9qb3m392BtWLOwUZXQDs/YReY54IZjdSRf84q26zX
	 FcpMciaj7TZay4t7sVRKnAXiTDVIqMHa6HiSNY892+M3ptpl+K3ulEwwBYWLjzrE9s
	 4MBO08lLI5NPBV6UGitz7r4Qo2yagHRQVTJ0d5M3blebpb+dvFNrSr/+VnbsRuL7N5
	 D3vMW4c7Yw+QKY4Mva6xFM8DpaUY1eR2uZTBOmsltFx5sCVdSYwPsmGthjIQC/4nJz
	 FxVi4mbwg3sSg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/21] arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
Date: Mon,  7 Sep 2026 17:42:38 +0100
Message-ID: <20260907164247.17223-14-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SDEI header includes are a bit of a mess: linux/arm_sdei.h only
includes asm/sdei.h if CONFIG_ARM_SDE_INTERFACE=y and then goes on to
provide a definition of the sdei_arch_get_entry_point() macro if it
hasn't already been defined. asm/sdei.h, however, defines the same macro
unconditionally and so this breaks the build if CONFIG_ARM_SDE_INTERFACE
is not set and asm/sdei.h is included after linux/arm_sdei.h.

The kbuild robot ran into this situation with randconfig testing, thanks
to the transitive inclusion of asm/sdei.h via asm/stacktrace.h.

Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE to avoid
redefining macros provided by linux/arm_sdei.h.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/sdei.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/sdei.h b/arch/arm64/include/asm/sdei.h
index b2248bd3cb58..b96eb9e22d4b 100644
--- a/arch/arm64/include/asm/sdei.h
+++ b/arch/arm64/include/asm/sdei.h
@@ -9,6 +9,7 @@
 
 #define SDEI_STACK_SIZE		IRQ_STACK_SIZE
 
+#ifdef CONFIG_ARM_SDE_INTERFACE
 #ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
@@ -50,4 +51,5 @@ unsigned long sdei_arch_get_entry_point(int conduit);
 #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
 
 #endif /* __ASSEMBLER__ */
+#endif /* CONFIG_ARM_SDE_INTERFACE */
 #endif	/* __ASM_SDEI_H */
-- 
2.55.0.979.g7e5102b832-goog


