Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B84FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEDF1h4DToBH7xC2ataksBPzKU9iqPLKYlA4C0KD+CM=; b=yAmvshTiySmwNSDIXtH/gWNpbo
	ofXMq+fjcjbsYSnStq+0RpMginFEE9uoasq2qXqjsdeWreamq3WpGrTNxZ3sIGNZjeDzzPAty3DyH
	pgMdNaiHpUPrdEtsCtydKiTjNqFWdZBAMZTSXXimwqQLDZTJe9maHmjsKTKYG74wNPx5G5G78I3MA
	xQLwg0GSbF/9EknAI/9tcKKT5UW6ZMIFo1QR7HemSWoqIa/H6c6wEvna2sH99HLR5V7Z1oJ/sRLen
	hlAIvSpXKzEiwaL0ThNSSIPt6c2PiOJ3MEWA5vica908AVNlS8aEbg88DPL+atTaU9vYRl3IOFqnv
	CBeJeusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzco-00000008azA-1HJc;
	Fri, 27 Feb 2026 15:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcm-00000008axo-2J92
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=NEDF1h4DToBH7xC2ataksBPzKU9iqPLKYlA4C0KD+CM=; b=iCIeDu6OGyg8xOuxAm/NCqNQ8c
	LAsSFenj2tDi/HeCrbIoirt6GpKb1pOPnVS3uFmoAp0oEKX133GtbrECc0qktkk+6jxxEtrIkjtEW
	Kmhwaos1BGHhSJOLfWRoqDlutQ7/5haTnI9DLWLkaTYQ1eRAsEGZy7PClMEmZFOnmeyLtTMyhNkqo
	570CKSAI8tA7rmx0ocHQ41rvqmwU9ZSpCFr5ToxkKjLzqj0jh0RL/klSzO9SjReEWQqRj73IbAOVz
	7VFiozOJDjyBe//lbLL+vtgYoStVqUNOqljMTu5E5cq8jlVFrzztyuyiy+97Vmwfx3LsxwZp36fdX
	ue8k8eVg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzci-0000000DLAv-48kJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NEDF1h4DToBH7xC2ataksBPzKU9iqPLKYlA4C0KD+CM=; b=R8LXlWlPnb/TAijZszftYnBn9h
	UcPa99aAXrQzjfR+ekgs0kgW5pOSZEFGM8ZO3GPd17X5GqB0hJMdcwM58whrbsA+l2g5wMUGu3E4H
	jZQq0Fli5bGZK1m0EgDO7PIfyHBaczVcFSujcUwV0FXLmgyrDjHYrJEsMFGVkoWeho4llEO+RgAkt
	yqANjntpRbQ9LK6UKA5WfjGk5zDlCi/HP3n9ZRRCNcWy759iMxLjb2gACWug9t6zx3m7SlwpIifST
	urahw+rylEHe5uB/fjt9tvM/D6yRXfwskbo7VBv8ujJgr0x49ylNkL/3il5rXw3rkOT0MmCBvdPB5
	IwMqC88g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59014 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvzcd-000000000yI-23Jg;
	Fri, 27 Feb 2026 15:19:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvzcc-0000000Awo6-2oph;
	Fri, 27 Feb 2026 15:19:18 +0000
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 3/6] ARM: move is_permission_fault() and
 is_translation_fault() to fault.h
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvzcc-0000000Awo6-2oph@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 15:19:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151925_535395_831B7D57 
X-CRM114-Status: GOOD (  10.05  )
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

is_permission_fault() and is_translation_fault() are both conditional
on the FSR encodings, which are dependent on LPAE. We define the
constants in fault.h. Move these inline functions to fault.h to be
near the FSR definitions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.c | 26 --------------------------
 arch/arm/mm/fault.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 0f3b6cc516c1..e62cc4be5adf 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -115,32 +115,6 @@ static inline bool is_write_fault(unsigned int fsr)
 	return (fsr & FSR_WRITE) && !(fsr & FSR_CM);
 }
 
-static inline bool is_translation_fault(unsigned int fsr)
-{
-	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_TRANS_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_TRANS || fs == FS_L2_TRANS)
-		return true;
-#endif
-	return false;
-}
-
-static inline bool is_permission_fault(unsigned int fsr)
-{
-	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
-		return true;
-#endif
-	return false;
-}
-
 static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 			     unsigned long addr, unsigned int fsr,
 			     struct pt_regs *regs)
diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index e8f8c1902544..e95f44757dc9 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -35,6 +35,32 @@ static inline int fsr_fs(unsigned int fsr)
 }
 #endif
 
+static inline bool is_translation_fault(unsigned int fsr)
+{
+	int fs = fsr_fs(fsr);
+#ifdef CONFIG_ARM_LPAE
+	if ((fs & FS_MMU_NOLL_MASK) == FS_TRANS_NOLL)
+		return true;
+#else
+	if (fs == FS_L1_TRANS || fs == FS_L2_TRANS)
+		return true;
+#endif
+	return false;
+}
+
+static inline bool is_permission_fault(unsigned int fsr)
+{
+	int fs = fsr_fs(fsr);
+#ifdef CONFIG_ARM_LPAE
+	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
+		return true;
+#else
+	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
+		return true;
+#endif
+	return false;
+}
+
 void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
 void early_abt_enable(void);
 asmlinkage void do_DataAbort(unsigned long addr, unsigned int fsr,
-- 
2.47.3


