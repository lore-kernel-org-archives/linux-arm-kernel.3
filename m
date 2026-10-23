Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA29606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iN2PpmMG;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FXncCubC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d0gKi9bpiz5OB7/rDKl6lal/fHmcINerAfxrtrB7vus=; b=iN2PpmMGtfTaXICFcItPbiUSLe
	5NlCm7oJw3JnsI/nIL87WddyGJWZKqeoJ982a6rVh8t6Roe52PNHQacoFFuEPE6Hh9CqU2AhRlLFx
	hugrZ/K7qY+1XJHnnuKRlrfX+LiGzy/HOm7GCkdl4IPTHE5Lf9hPO9nHEMjWCeCIBrh736nHSohWI
	uUqFGORcuN/phxX50pDf+TthGilS9i2/DhxIrLRhiscBaPjZUGV820zniInLEunKAWlAGyJ6+l1ka
	Z2iCrN5/3BSt3WczIENd3CvFIlLSpOwEw3px1zw5BiSyjmbCuwGNwiSADfVn5nQZd7ZJPudqsMP9x
	dlLKniGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK95y-0000000FddY-2BSy;
	Fri, 23 Oct 2026 06:49:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK95w-0000000Fdc7-0cR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0gKi9bpiz5OB7/rDKl6lal/fHmcINerAfxrtrB7vus=;
	b=FXncCubCCTG3aJe/f4AJ3ttamznrhElwQgrcXKC6K1ld3eC+TYBwzyVQ89vwEly1IM45py
	/2FJmUey5tyBIYUmxcWq+DWLQbTsYzZPLzPSIJ73yHDM3pFOZwUQAOvE2e1RtJ/MpBv4eP
	mXZ6ZoeV25kAEQ9FEqaeH1Oi8SjmLlc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-Qpiri9SrMVaNcnWCda3mbg-1; Fri,
 23 Oct 2026 02:49:35 -0400
X-MC-Unique: Qpiri9SrMVaNcnWCda3mbg-1
X-Mimecast-MFC-AGG-ID: Qpiri9SrMVaNcnWCda3mbg_1792738173
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6087C18005BC;
	Fri, 23 Oct 2026 06:49:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 00B081956095;
	Fri, 23 Oct 2026 06:49:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 03/13] ARM: PXA: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:40 +0200
Message-ID: <20261023064908.66707-4-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: RiwuXsehuvbxEq4Qu1NwoRSFUuXFk_Gky_WmEiom470_1792738173
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234940_260455_B374BE60 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/mach-pxa/irqs.h     | 2 +-
 arch/arm/mach-pxa/pxa-regs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/irqs.h b/arch/arm/mach-pxa/irqs.h
index 22bf536a462d0..07d7aa3a65065 100644
--- a/arch/arm/mach-pxa/irqs.h
+++ b/arch/arm/mach-pxa/irqs.h
@@ -94,7 +94,7 @@
 
 #define PXA_NR_IRQS		(IRQ_BOARD_START)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct irq_data;
 struct pt_regs;
 
diff --git a/arch/arm/mach-pxa/pxa-regs.h b/arch/arm/mach-pxa/pxa-regs.h
index ba5120c06b8a5..b56c8899042c4 100644
--- a/arch/arm/mach-pxa/pxa-regs.h
+++ b/arch/arm/mach-pxa/pxa-regs.h
@@ -31,7 +31,7 @@
 #define io_v2p(x) (0x3c000000 + ((x) & 0x01ffffff) + (((x) & 0x0e000000) << 1))
 #define io_p2v(x) IOMEM(0xf2000000 + ((x) & 0x01ffffff) + (((x) & 0x1c000000) >> 1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 # define __REG(x)	(*((volatile u32 __iomem *)io_p2v(x)))
 
 /* With indexed regs we don't want to feed the index through io_p2v()
-- 
2.56.0


