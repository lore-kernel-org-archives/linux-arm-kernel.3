Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20318C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc8GR7rTTo27bA7yHyZhX9hh9yph2GkWra5UE2xqfbs=; b=M72QeAW11enh1G
	IeH+/rG5uY5dGpXrVGc767OANdrShzlJlw6rVkcrWrvsNlo049MXD94ckMU/FAfrok4Pyg34C4m7J
	fjyqBMFVGmzjUW5Zh07EKKfTpmxHuci70uzMC+NcbQTIHVhydr7t9RS/0bLp48Pnf69M8cn4dg6yY
	FaDDIcsAeaHA5JF8cCPuc7VivCkUGzzcIFLK+ZwYMv8IEyhwL12NMLhbHSwcfgiUP0eBAjaJtPf9f
	zEdLCBy5C0Slue86ntWtWZI+cdWSAG6Z9qTqOflkytWjCXvD55ipxHO3soK4iJB0WCK0pnScuC2rS
	n6hnMztAZ5HYqfBhtvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF6-0000000EzP5-3fss;
	Fri, 18 Sep 2026 16:15:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEs-0000000EzDx-1JRU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:15:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAB706022B;
	Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF501F000FF;
	Fri, 18 Sep 2026 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748101;
	bh=Tc8GR7rTTo27bA7yHyZhX9hh9yph2GkWra5UE2xqfbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BpMwUcXtxZXvVSt7IywpT3I566I5Wb9vA+b1HRQ0SPTXq31VO5Co5iAq1W1lssnp+
	 IRFyEi/tH1AwRv4wOS9f00oUX4wA4BGBgQYEFHmVRtbVwkEa7E9ynmxDJoyxPQHoza
	 FqFdiKbeyxonu1drcwS0+otlkvWbj/Cm3sc6R9u9TW3VMtSLcqnugO3TFIKBJ659P3
	 VIBg6/F5AoGPaTLb0A27uHciXsGIElTW00LAeCsI5a/w372TjfMF4FF4S2wb4RvnxS
	 h0aTrKhu6AtkY1O02DW3VjZqu+oUnMuAFU7prdjm+52PTI1QjUvir49tbHIunMVEVO
	 w1JYAxdBenYQg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/21] arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
Date: Fri, 18 Sep 2026 17:13:57 +0100
Message-ID: <20260918161407.2300-14-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


