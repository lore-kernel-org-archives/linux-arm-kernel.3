Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331ECD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DH0Mdn/KagvmDg4Z/EV++hyijZYneNwGz7BKyvmi2lw=; b=1pyxLyzP0+P27UoUiEZxv7GR+k
	TaGrsLm87Avu5O0zUh3ZhwDcSTCHIR5FBWDGvWf7P3dBRUNrXw41x8BJFpbxsqPppN9cLjrGczBi+
	N3JU8vmpgvEDuoAxwOAO/DEftIfSCQDorPSKZreP0YebygXG6QCve/Ff8W1Tx8+No0D4gPWcinsY9
	fhK1asafQLK6XshmXmQ2s7rL2wzYXu+Olu1MMSEYdnS2KoZxqBr7QlO07ToOq1st3ROgWmAW8cyIZ
	RwqP4jB9dG2YFQF/N2Ekck02G1RyK7ohHV370D8cvactthzjehWpVrOGiFrMnywQiJfDytBLpaDVK
	EZFuH4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSEy-00000002p4X-3vVB;
	Mon, 08 Jun 2026 05:09:36 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSEw-00000002p4A-3CwY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:09:35 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-137dd523634so6023072c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895373; x=1781500173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DH0Mdn/KagvmDg4Z/EV++hyijZYneNwGz7BKyvmi2lw=;
        b=WOWM7dbb/Tx+IVtGhYJvre4TEYyJxr8uOU++CSsKVFapVkOP0+6oUgI/EBYk23+i4k
         EJEDd4Fs6nlfLKu6v/Y9+Dm/mMmNxWjNlVeGNgMEDq5qNYFuY3uGLH+KYTz0MHrAPlT/
         voEk183y5zM+R2DoDQ0glw1YFbSBa8aUHA4lz8HbrXZgd22+XXpS4eGpOjkyCVygegj+
         ouClhS9B7NiG21Qs3KAk65Ac3X0j2OZouF3jjDOj2xRSpvixgaG8z1tMVKesIW02Zl7F
         Kj+QC/Yq0s1SfJzVkWHm2pEZQMj9CTV8Mlt6j+MDz8CmVSbKVQ8yuXfIjW4cmmCdWvRz
         hpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895373; x=1781500173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH0Mdn/KagvmDg4Z/EV++hyijZYneNwGz7BKyvmi2lw=;
        b=Wf3eNX1dBtjNTvDiCkvvr0RXQHt82R10GOKARcKGu9qOYfXtqfVjcSLrpOqf4QYAEA
         3Tb/7aXyoxya6cpzi+dULQF5708SoNNLgh4TzsUs7iAwP14esFl7nb1l6X/rnxPTFdbH
         d+y35TuzRjNkNFz5tce/cKtNW5wzeb/WOC25jZU32neEiF21/BIa/NvtO1bzo+E4H1Pm
         E0CZ0OBTYe5wn3MOp595aItWTNngzTBzCJhsDrkG5nAeRSt38nmZRZ/j5qWcRBQT/BVg
         g26w12EGKH/U0dadXJaYcVJIZ3XXChpRDN0qLH87R0k+151LqcwHTSNk7J7oqX5Epr0S
         PONw==
X-Gm-Message-State: AOJu0YwLzXG60+K+Ns1a7mC1IiWmLu41buPV/GpkBJngy5PEhrLG9nmB
	WWgDo0sdLfGntDNQsxg4S9xX6YPdYMZlTAIEm4x9J9LFoDfSgMVdSYy+JS464YQm
X-Gm-Gg: Acq92OHoru9t9KdyBR0ydvCImty06Uz63+ouHg5VFdxLL0P/p6MqzEh4o8eAWIvGI5+
	wgy/tnij+cbNHyqrx2at3hHqWjdmGK24kl3tBlSjTj9Xy75ZRwQddk+d96uK3Y4sun0ojqq8wo4
	BnPXRMWrpHwicDHNDusS+TJgThFEqFoNxdFU+7264MIjuJiEWQFwDL/uBbbXKeOd658Cw+qT0uM
	MTQCyFgJVLuyTwBkLBJA5C8kruJJiNNkAWL/0TIeiTVVuyTC7FcwdG78PGaOXcB5Fgmc2LeZbbC
	BAB6rGh2rkk/TSidhiPH5ByAs12xu1vgbWp+LwwRAJvL4vcC/lLOANUrs+Is4Rf9b65m4rwBeif
	Nb98C6I8y/X46h79bDB7T5xcB7mqjmGgUvRRD8Bly+Wg8kbCHEPAIXpEkMbOAhLkB0awaR+7ZjU
	criy2VzYcmhsWFECwfE5EUH4QY2A1wBdMedKb/oqYDvSlAvh0yc6vK4PYeeWteI3k4JnaVxwvur
	jNKSxy37j7yZhkft9yvUGmbl7s8QxkXCRDaAhNH+20gO07fRjjCOajKZOD6kFWlHYFDQrW/G10m
	VcKDZrtWM3xOjZu+bHeShdFl/WWO
X-Received: by 2002:a05:7300:a498:b0:2fc:9d97:d59a with SMTP id 5a478bee46e88-3077b31111cmr7569406eec.32.1780895373322;
        Sun, 07 Jun 2026 22:09:33 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm16237994eec.24.2026.06.07.22.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:09:32 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [PATCH] ARM: arch/arm/kernel/signal.c: resolve set-but-not-used warning
Date: Sun,  7 Jun 2026 22:09:24 -0700
Message-ID: <20260608050926.88446-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_220934_804375_D55018A8 
X-CRM114-Status: GOOD (  11.77  )
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

If neither CONFIG_IWMMXT nor CONFIG_VFP are enabled (which is the case,
for example, in rpc_defconfig), the variable "aux" is set but not used,
which generates a warning during W=1 builds. Resolve this issue by only
defining the variable if it will be used.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/kernel/signal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7be9188d83d9..1d015b696a76 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -140,7 +140,9 @@ static int restore_vfp_context(char __user **auxp)
 static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
 {
 	struct sigcontext context;
+#if defined(CONFIG_IWMMXT) || defined(CONFIG_VFP)
 	char __user *aux;
+#endif
 	sigset_t set;
 	int err;
 
@@ -171,6 +173,7 @@ static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
 
 	err |= !valid_user_regs(regs);
 
+#if defined(CONFIG_IWMMXT) || defined(CONFIG_VFP)
 	aux = (char __user *) sf->uc.uc_regspace;
 #ifdef CONFIG_IWMMXT
 	if (err == 0)
@@ -180,6 +183,7 @@ static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
 	if (err == 0)
 		err |= restore_vfp_context(&aux);
 #endif
+#endif /* defined(CONFIG_IWMMXT) || defined(CONFIG_VFP) */
 
 	return err;
 }
-- 
2.43.0


