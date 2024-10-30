Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD5DD5CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt+GDj8bSCsrOuFvhauMB0QKz25eKh57Bb5+kpwY7Gc=; b=U4uBCXrUGjJYh1n4CVT/UQWQih
	kcDle94sznlOQFYv0IcwGlzMZQP7qy+3zAdnKvNQGIgBacU3I0oNmYTW3S6qFhr8a6xRt50XFVzZK
	DfIZcy9QOmp9Gy7rtYkW0B62rgHQNbIaQsMhoduIA4qu8bNFjZFdtFQkqmPw1Xe/j47p+nh2wj0Q+
	psBcOXCyihVtG60KSGyfJmRlPspvW8yYYh4RR9kLZuSHpSSc/O005PT9J1aM78vV5yQRPcN6jlCJ5
	fALb2hYVPDzy4rey52YJ1GVUqKTinOENmDrZvDqnF+uEMlZsVj0yZsdV9o5YOb6KeP+g0LCZ1CMf/
	FUE5J7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65rP-0000000HXUi-0nCz;
	Wed, 30 Oct 2024 10:23:31 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65ma-0000000HWWH-46J3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:34 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e59dc7df64so10059937b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283511; x=1730888311; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt+GDj8bSCsrOuFvhauMB0QKz25eKh57Bb5+kpwY7Gc=;
        b=EP31fTaTvOoc6QMKKKq+z6sr2BPWizgGuYhzdSb9tcMwlfaAgnI2dXK1UdRjEbByq/
         nDYQKbpnD2TMM8t7rPIHTBXMJnpXiAfaM1SOeDnaqP/NH/m1//XB83vUXOFaSRWShh+k
         PZRZ6/zhyHWxUnGlgB6x9DSU9W0NXjkDjAJYONAYNiHnW8m8wz8QzHt5ge01XGeDlCQ3
         2wYLHiNWGBWoJ3yJndJwIH/RKoVmHt7KuQdv9trUcTHYc1XYmxgjnrWOFQnLGVDfeZBf
         tPfDXhYA3it7zAICVNg/pHaI6Z8jQ8RlO8Tkg12Tcc4hXVnQod+LClwlM07uZPOVBdhQ
         j7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283511; x=1730888311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt+GDj8bSCsrOuFvhauMB0QKz25eKh57Bb5+kpwY7Gc=;
        b=cOsfEVtuTVLq1QW9MX8vzxVbW9gWbl8xWwK2AIz4de0n/qiTBirBp6Ug8zU19I0Mpy
         VuxpaLzuKsUssaiccCPVvr2p8HIVGKJoiLlw0wmBm/xsJo09bMYRgQSp3AmgASM7Lx0r
         JVUtlJ+/WKQBRYIcv8IFGjK8lbl73rbgXKBgGzKTks0tRDmRIgZay9Po4j517GuD3+PT
         vVS9zckxgF+WBFzeA+z0qBDOF6vCvW2Zn3L+2BU0j8UadFxBgvvu9hiV1UPFszYoMlll
         X/tKduPboaLxUOPwX32EP1o8QUDcrkodo4Kf3AvbZgRBMwPWfqRTbv+EvLYweezknDFG
         Gisg==
X-Gm-Message-State: AOJu0YzAFfItbRz3EdYtdgkq2sUpU8FcdLrVaEL/tNk6yIOz3kaMwVJ6
	cpUjxaF7cFb2Ite7/1e5xVp16WWDeyYZTh6BDSj9+zuFraJNym1M/Y00tsBn6Tg4UkxT1dHVxDb
	wzGhx8n6FfdY2EAXwokZaXcWi3xO7fq2MEtuU4M1xWG2C86rj32Ob2hhg6785sSTuDRb/Hf9nwU
	ZMnmqr+mKd9QXawg6oZDqR+52C30MTi+l9IyD31siQ
X-Google-Smtp-Source: AGHT+IHkg/m0TjIto84EqA/r5FuO1zVU5A4uj4lUTPcQZpzUFb+a+5T9IxFqqsZLyYJRz7Dar4t9cHib
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:4d45:b0:6e2:ac0a:8982 with SMTP id
 00721157ae682-6ea3e59140amr1606947b3.0.1730283510742; Wed, 30 Oct 2024
 03:18:30 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:06 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276; i=ardb@kernel.org;
 h=from:subject; bh=5xf0c9c6JVxVeaGrMTt8Z5pUMYFzvmJMGfwOWomg+o4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/f6zFT9nH5hVuODhimtszh7iS2sfqq4Kapj3UKp46
 dHqRemNHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiQRsZ/ofeD8s69o3zJWun
 a6LH1Um6UXe/Ti/cwyAr/ih6ZY29QBsjw6vpRqe+3yxvS1rY9kF3artwwL+mVLMe+7vMc/7Wbnb 25wUA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-12-ardb+git@google.com>
Subject: [RFC PATCH 2/8] arm64: Kconfig: fix ARCH_MMAP_RND_BITS_MAX for 52-bit
 virtual addressing
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031833_039568_7D2DD1A3 
X-CRM114-Status: GOOD (  11.92  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The default values for ARCH_MMAP_RND_BITS_MAX fail to take into account
that we now have support for 52-bit virtual addressing. As these configs
are compatible with hardware that is incapable of 52-bit virtual
addressing, use the same value we use for 47/48-bit virtual addressing.
(For the sake of simplicity, use the same value for 47 and 48 bit
virtual addressing for 16k pages)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ec218ef22f2b..ac8e7550430b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -324,13 +324,9 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 19 if ARM64_VA_BITS=36
 	default 24 if ARM64_VA_BITS=39
 	default 27 if ARM64_VA_BITS=42
-	default 30 if ARM64_VA_BITS=47
-	default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
-	default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
-	default 33 if ARM64_VA_BITS=48
-	default 14 if ARM64_64K_PAGES
-	default 16 if ARM64_16K_PAGES
-	default 18
+	default 29 if ARM64_64K_PAGES
+	default 30 if ARM64_16K_PAGES
+	default 33
 
 config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 7 if ARM64_64K_PAGES
-- 
2.47.0.163.g1226f6d8fa-goog


