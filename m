Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80853CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prmt6wujZXZEYu4jILQGXIbirUOdEqPv5dUXUHxMI1Y=; b=z1Zp1ptJCu2DYMvfQYa7bgqh3/
	ykFz4nxehA00DfNrZeEhCoqrrTWWyEanNZtnM157yYwBTg8zntZWZTvMDQdKH4wHorSOEBuuKVRsJ
	TI1YZ2DtgDM4l7/sGyMQnuE175QGNmhtG97aeiuglo/5rObcu9WyrMJhijTVeJBebujbi9siSKLKB
	SKccdq06wup1M7cCFKQvAapqWpnaI7UQc/xMervwAcWJrG4HtKo5JIBa1BVLrj4Bm3VcBz7Y9B9Uq
	9RyvytSxFyZKUIicwf80Ml8wkf7nCCAt1pkq9GEZdMF/6iURECPwo3NM4eiWF966khRVXCSq3Ve2a
	gfl85+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaCa-00000003T3m-2Ob2;
	Fri, 05 Sep 2025 17:26:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWi-00000001zRA-3e8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b9912a07dso15340305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079051; x=1757683851; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=prmt6wujZXZEYu4jILQGXIbirUOdEqPv5dUXUHxMI1Y=;
        b=3VbH5rnNJREvWot0B2AKH6WIp685QoUfRD2XCY62mkKzqE9Vx7Q/w/dqh476WwtePH
         V9/oUk0xgH7eEof8eRnENx8h7JZ8nb9e43RcQh5co09Kg1hM+HRJx4F4FlzYCkxuwEVX
         NoR/SYQv6IRWq8U5QaBdgEC8kkUsJR79SJ1VLaxO/HoSdpd4YkDOb4KVu33UK/ghqup0
         nxN6THhFE88oe2rgzCNzqiBJ02cjKNbVasXFhP3i4HqoE2SCx+LRhcY6r/GW/zmubfX+
         hMBFjEh5oSZdwSL/kzAwyMBGk8ZLg5MDRZ04iSk/JTAOS61edVlaFjS4YvJmc1WPMMEL
         +4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079051; x=1757683851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prmt6wujZXZEYu4jILQGXIbirUOdEqPv5dUXUHxMI1Y=;
        b=uS4XkAamSZnXV8Yj3iGJz1j9ovuRpnzNuCZGwPkNA/DdeTeR6d5+HutWrmRcoaj1HH
         2wsPH/0XoyjAO58bYxPm2xzrOzvt+VaZCNZtQ8jUmqX+e4xuQtVouEvmb/xl8OZkWVMa
         crotUGiedcWoVLRhufA9VD7JBKXXwWzQackC9A+rRNeEQ5tZMVilUfmYBfEMues4j0tc
         bZ0AJbbYf/sYQ++MyBEeVbzq2aajMtV5WU7CMJ0OD3nhfKCI7bCgZbCPzYeDt+FuS/m4
         JyctMo1+xhXI3AdgNiiuIWdnviEfKhe1tHU169SUPbgwCFITR+KnlIaPcEuxS1kY/rbG
         IpYg==
X-Forwarded-Encrypted: i=1; AJvYcCVwx5VYJPPaqiYL+Bt6b0xnjvESlKj0rcDSX9F4Sw7059T+bi4HgVNi/ksDkULVwR+7ylFlWiv/7/nmIWcY7f4E@lists.infradead.org
X-Gm-Message-State: AOJu0YwLdwQD+rzXosJWOE/196yDW64sAZi5Q1xis4W4U9+EvfFI0UUY
	8aDSBttoxFrYCABHWNO6Bqx3mk4bGediq/fhdXWTfNndsm4NicSsFtADzJo/J8lkiLge1yWSfQ=
	=
X-Google-Smtp-Source: AGHT+IGcrXQUr4V8mfgwMOKWStLEjIiWgtx5sJLHPBI6rSUhc/g7n+CYYfQRUgy3XXrsY4OjTKbfO2Oh
X-Received: from wmqc10.prod.google.com ([2002:a05:600c:a4a:b0:45d:dbd2:ec9a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548a:b0:45c:b5f7:c6e1
 with SMTP id 5b1f17b1804b1-45cb5f7c990mr92681555e9.0.1757079051352; Fri, 05
 Sep 2025 06:30:51 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:40 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=ardb@kernel.org;
 h=from:subject; bh=ymeoG2jyFnfZxHt/XMud96BPHY4rNxDq3fGtVI/uoN4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPX0/86gcet7k75+ikp4N/VlzWbwz3MFzX3nZsSJbTfe
 Mrlys9+HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiLa8Z/ukpNH9K793d5xX9
 gO3t6erK2Tt3XzghVfr337TlRnsmpzcyMvTJHGnzzFyjnTCjaMLd7e8XO6x7ZlfDxzbt1OKi0lP dqxgB
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-13-ardb+git@google.com>
Subject: [PATCH v2 4/7] arm64/fpsimd: Don't warn when EFI execution context is preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063052_904827_8FD230A8 
X-CRM114-Status: GOOD (  13.42  )
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

Kernel mode FP/SIMD no longer requires preemption to be disabled, so
only warn on uses of FP/SIMD from preemptible context if the fallback
path is taken for cases where kernel mode NEON would not be allowed
otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..d26a02ea2bb9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1933,11 +1933,11 @@ void __efi_fpsimd_begin(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	WARN_ON(preemptible());
-
 	if (may_use_simd()) {
 		kernel_neon_begin();
 	} else {
+		WARN_ON(preemptible());
+
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
-- 
2.51.0.355.g5224444f11-goog


