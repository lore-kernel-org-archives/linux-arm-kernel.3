Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391CD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEgql2RjEPQnq4TcSo4Zcz1aExil9ZMRbcIeSUjJfSw=; b=WYqhhoCxzzqQfdC/7JcUcRdxfZ
	sfqBH+uKMopUHs9shHyHVZuuYdJs4xHrK42PVJWeJ869iQFW5IYCCHFPr11fg/wlbLq1+u2ezB98D
	pj/Kj5eXEBJsM/N/+NOeiCUjececJCFg37L3q6fR2AJ7YFjpwdfgyoznKKJO511bM5TfgwEoQNxDV
	TfYzm7PMngk+tDEwVS8RHmfaeKlT+SuSDX9XrWyA0TzvOumOUo+zF6UCi3Zi8YXwS6YnYarP6LZPB
	kUpQ2HVGC31pFQPl5BosozTRZed7/FourBxp3cGZKK0dOxxq7HV+AL4JXA/zpoSxmGu3YHieciR1B
	8ncdy0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOW8L-0000000G5ue-1hwL;
	Thu, 27 Nov 2025 07:09:41 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOW8H-0000000G5rn-45D7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 07:09:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E3405BCC4;
	Thu, 27 Nov 2025 07:09:36 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B2CC3EA63;
	Thu, 27 Nov 2025 07:09:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rslFBTD5J2njXAAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 27 Nov 2025 07:09:36 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v4 08/21] arm64/paravirt: Use common code for paravirt_steal_clock()
Date: Thu, 27 Nov 2025 08:08:31 +0100
Message-ID: <20251127070844.21919-9-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
References: <20251127070844.21919-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 6E3405BCC4
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_230938_156670_93881AB7 
X-CRM114-Status: GOOD (  11.39  )
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

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm64/Kconfig                |  1 +
 arch/arm64/include/asm/paravirt.h | 10 ----------
 arch/arm64/kernel/paravirt.c      |  7 -------
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..3a463027538e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1560,6 +1560,7 @@ config CC_HAVE_SHADOW_CALL_STACK
 
 config PARAVIRT
 	bool "Enable paravirtualization code"
+	select HAVE_PV_STEAL_CLOCK_GEN
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index c9f7590baacb..cb037e742372 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -3,16 +3,6 @@
 #define _ASM_ARM64_PARAVIRT_H
 
 #ifdef CONFIG_PARAVIRT
-#include <linux/static_call_types.h>
-
-u64 dummy_steal_clock(int cpu);
-
-DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
-
-static inline u64 paravirt_steal_clock(int cpu)
-{
-	return static_call(pv_steal_clock)(cpu);
-}
 
 int __init pv_time_init(void);
 
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 943b60ce12f4..572efb96b23f 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -25,13 +25,6 @@
 #include <asm/pvclock-abi.h>
 #include <asm/smp_plat.h>
 
-static u64 native_steal_clock(int cpu)
-{
-	return 0;
-}
-
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
-
 struct pv_time_stolen_time_region {
 	struct pvclock_vcpu_stolen_time __rcu *kaddr;
 };
-- 
2.51.0


