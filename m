Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95364FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Quj/ZX3jySC8QUhwpNbHp+WOB42xKk81qiHexqqDj7Y=; b=cZ20cDNbjyBU1VrSOOCF5rLyn4
	LRtClEr6jCZhOjxpYPxrb+F5r1KSsKyFI1bgEm/IdTAkOmiW0XX6gvCWgW5P04xHkn6zlz3nodj/+
	MueWQ9rkUNqIiGRFaelJYkPr18ZhQIV2OXzFwgCv4PfWHWi4m8L91GgSMmTHQ3xst3A5dAbtgc3lS
	kHz1csoNjFbYimRyeILci3H499yOdFxMHWJ9R4AWuyK2KSms/3zmU6yv0QTyesjF+I3bnt0+L8PkK
	+EwV1L6wUSlryGStHgSKJ8fSA3aMMd528p9bp49rFeVCLhKdVkpaWs0qMJT8SrEqLQRTgVMw9B2j8
	M4dX3whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzd2-00000008b8r-3oRJ;
	Fri, 27 Feb 2026 15:19:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzd2-00000008b85-1Zzx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Quj/ZX3jySC8QUhwpNbHp+WOB42xKk81qiHexqqDj7Y=; b=BmfUcpMjapH6i8n6m33e1zzGH7
	aJlOlZg6wwzwpa07C4oREOVuQBUZAYY5qOgaLei+QankN5T/tXhIkgj8gqeEYzxXJmn4qQ1Uf6qqt
	zcVKcFJa5BvK+1tQyQ7HGEbxR7prSRIwJABi2SOwAT80PgRNllDLd8rUY4ZhSb1WZLe/tb3EJtLYt
	rzr8HzpQQYvqiYeIXp7r3zlqwitHL4PcWbO+L6ZfmPXJ1W4RqzoutY3zyqoIzvXGiNZ+TK4LNbx38
	e0tKHkPfM+OvbdAjrK6ZOGWPXqRjM+IdbqaG8Rq5222KZYO07iNRTxApEGx2PMrmqNGYUX9mVKn9O
	vDUGv9TA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcy-0000000DLI6-3rBp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Quj/ZX3jySC8QUhwpNbHp+WOB42xKk81qiHexqqDj7Y=; b=p2nIOp+r/R1AJ0S/b3Hsx32+kU
	YPyf6ZMm6vc7PBc0g9Gh8zVlf7j5Puulfl9L2HBYANi4vNn5hoOWChJ+mIeC3iw704ZrjtCu1gFI6
	eqP0RNic7I3IkLfUMYzBs7mr9gkM05g7fhStT8Pu/GzNGgx7aBU9xMlpWMwGj5jS1dOLw+6Z2gqOL
	5NDIpnRRif0HdX20yZ+2yKXuRN1EQe6Rb34R0/1MATK6HrknQdXYDNz95VQ744FEeeYcEMOqkMYT3
	dZg1tb1BHT2JGx6M5fhnS4z5AS/fCf/Mu07eYZshUOwQ3GVP3M4i2EFmFxPkZbJIYrMITzFxQSczF
	RpLf7X3w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47428 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvzcs-000000000yw-3hES;
	Fri, 27 Feb 2026 15:19:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvzcs-0000000AwoO-03iq;
	Fri, 27 Feb 2026 15:19:34 +0000
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 6/6] ARM: provide individual is_translation_fault() and
 is_permission_fault()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvzcs-0000000AwoO-03iq@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 15:19:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151941_686135_96C99B10 
X-CRM114-Status: GOOD (  10.12  )
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

Provide individual LPAE and non-LPAE definitions for both these
functions, rather than having ifdefs inside the function body. This
places the functions closer to their associated definitions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.h | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index 44c0fad29cce..207f1b06941d 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -21,6 +21,20 @@ static inline int fsr_fs(unsigned int fsr)
 {
 	return fsr & FSR_FS5_0;
 }
+
+static inline bool is_translation_fault(unsigned int fsr)
+{
+	int fs = fsr_fs(fsr);
+
+	return (fs & FS_MMU_NOLL_MASK) == FS_TRANS_NOLL;
+}
+
+static inline bool is_permission_fault(unsigned int fsr)
+{
+	int fs = fsr_fs(fsr);
+
+	return (fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL;
+}
 #else
 #define FSR_FS_AEA		22
 #define FS_L1_TRANS		0x5
@@ -35,33 +49,21 @@ static inline int fsr_fs(unsigned int fsr)
 {
 	return (fsr & FSR_FS3_0) | (fsr & FSR_FS4) >> 6;
 }
-#endif
 
 static inline bool is_translation_fault(unsigned int fsr)
 {
 	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_TRANS_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_TRANS || fs == FS_L2_TRANS)
-		return true;
-#endif
-	return false;
+
+	return fs == FS_L1_TRANS || fs == FS_L2_TRANS;
 }
 
 static inline bool is_permission_fault(unsigned int fsr)
 {
 	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
-		return true;
-#endif
-	return false;
+
+	return fs == FS_L1_PERM || fs == FS_L2_PERM;
 }
+#endif
 
 void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
 void early_abt_enable(void);
-- 
2.47.3


