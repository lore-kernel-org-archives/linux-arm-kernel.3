Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DgW8tC8S;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ucq1Remg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=; b=DgW8tC8SW9teJC4sVVQ9sSIPBG
	sD2oJy3wvuGyE6aTzUNO41iLK5Oc9S+3rDqz8LPJg9G4lXRS6WResyFB5jlupKSApndzzHSGOWlqw
	Rp6VJVJUaGyk55WrYg/zUcboqMv56qpZK8iGPqwM+ClnvKcBxHf3fmVVIislOzmZhjWtdqEhyejXF
	c0TU7hbhYt2SepNvtByocJAhuq8MwXhXIfb6MQuZqI9x3ruDqu6vu+OSKBjlzfLQHM4njyxxvlaUo
	akjONcNbBXRM2AmpWvnWpJDWhdha88juhtd/hm3OynFolRXIjpF61BAhA0Mr9Cn+gglyOsc63jA8T
	txgEhA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK96D-0000000FdmZ-3F6E;
	Fri, 23 Oct 2026 06:49:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK968-0000000FdjN-1qbk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=;
	b=Ucq1Remg4fBsg1vwxQG0BAqnjmFF6J8NFoQPKTcqbrr7QTYGHTGPon/Q4bL/aS1DvTKAwH
	sa1WPXZpk/2n9XUUSpJH9a+NQC4SX5lQSbHyLzymx3uWj+ayz19mp7gwzX28eQIe55lCGS
	iAgKgAB3CUODb7k7inEi0NyEXSjhMDg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-SuGaaj_gP5aM0W7KkKCVMg-1; Fri,
 23 Oct 2026 02:49:40 -0400
X-MC-Unique: SuGaaj_gP5aM0W7KkKCVMg-1
X-Mimecast-MFC-AGG-ID: SuGaaj_gP5aM0W7KkKCVMg_1792738178
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CEFC818005BA;
	Fri, 23 Oct 2026 06:49:37 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2707819540C2;
	Fri, 23 Oct 2026 06:49:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 04/13] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:41 +0200
Message-ID: <20261023064908.66707-5-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: bjuGnObXWLQmraw9--KCoa0TBH9gxikYJh7a7qh35EQ_1792738178
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234952_618944_A42EC05F 
X-CRM114-Status: GOOD (  12.32  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/asm/hardware/cache-b15-rac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/hardware/cache-b15-rac.h b/arch/arm/include/asm/hardware/cache-b15-rac.h
index 3d43ec06fd359..b96365bfb2a87 100644
--- a/arch/arm/include/asm/hardware/cache-b15-rac.h
+++ b/arch/arm/include/asm/hardware/cache-b15-rac.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 #define __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void b15_flush_kern_cache_all(void);
 
-- 
2.56.0


