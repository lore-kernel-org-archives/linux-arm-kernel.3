Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A519CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFUi3FlPm9KOXLVkivG1TPAn4U/BsKfwoh1VfKcakJg=; b=nlFNBaX9OqVhKeuzBn2dUtVGQU
	GIsGKw2z9tRrgXnLOh3pYLveJXGGlr08tm01+62Xt0lHMS1RARadCmS2Nu8DLeCq8swBwXYBLzoqB
	TMhiBkGo0O4Nkx54jpu5+7uU0NdaEqwJf8AO2Qur5pglOhQycQt/Ufxi2K7CwAaPVVNfexTp4Zy+/
	i5d6TDOPWbZQYWg9e6eK3HdRtGcraykY0YzDtjaqjlxEhQkALedyF0dF5WNvf5M3QJN7J4qHqdb+Y
	D5EIHs4YSoH/Uch7+MP1lY3UnQTCKAnOgq/887vsI/tP1EUBKVLyjK7AiZMaM8dco/d7dVvWuu9Ab
	eEWpqugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubRM-00000003tFO-0LLD;
	Fri, 05 Sep 2025 18:45:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWe-00000001zOh-3DeP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so20572795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079047; x=1757683847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFUi3FlPm9KOXLVkivG1TPAn4U/BsKfwoh1VfKcakJg=;
        b=TkIcfWvkV4YxoIyt8DJpsxpfWKtHB+H9uRvWuLu+EraHKIi8TyEk/7VVAA8M+AH5/v
         D5nHgxpwgOwEzNBqeq4+l4cAlaRhr10lrcSs0ICiK6e4yjIQYPpdk5kRH1bsEjj/O6+R
         PIbGhGLXXHjW0NSudHdf/8nZYh/LabOy5oOyDRmleFRXPR9yXv9ohnkJhJgC9ESeJhNn
         G7BeLK7A7+lByUDwHRZhAwtFsVmgbMIBkspNdHt5swA95AcoYqILLmvHOvn6nRXsJxB2
         7j41ADYREs7NxSQmZDlUwvsTah9wfOMW6S71NdHCxwqI4Ngp2pN3NnLiDcFqdHOQd0lU
         qjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079047; x=1757683847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFUi3FlPm9KOXLVkivG1TPAn4U/BsKfwoh1VfKcakJg=;
        b=PitNtykK6GapiWB5C1M3VaHtdLThBP1SKYew4H4LNNtt58+b1Xw1LdV+jAbi0ZZM6r
         8XtfR4AqHdJ8X+25hMyFCyxLj9ZnBREozJkgkd1MZabd4601sTA6FPq4iw77gCr105r/
         udIe8qkNwTOTUIzixOSp3VOM9kzFhEeXaDW0Eu2Os5JCTDPjP+PkBJ0iMrQC9aOsb6Fa
         5JSLLMRReKHXnKIPskddcXUN5BSbJ1k4DOsH7uyVytJbXEq2Pdhzdp54b5P9HkLYsEJV
         006ta2b0D5OpRqvJ5fpBJ6h0zZnJWdhQ2eeHFpxFze1C5oI7Vpfbh1Fy6EV7/mBLvngh
         gnyA==
X-Forwarded-Encrypted: i=1; AJvYcCWhFUYa7HwOYWtIHPyTdpqr0vhhuB0VUGlMDaNnPdoimABWifCpdCUpOVvYVwMk/ypgwEv2i4uN/7/bc4+Q0OI+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDK+Z7jbV2MjcET3SBC0QdMkmsQpAawAOiPOf6TDa9+k7iKA04
	VS9T8Wva0ZXUbqip97B5tl1TIun1RRo/WX7nOjPdt+z+PYvz9vBnw6bO/BnR7bSizPSGUDoqfg=
	=
X-Google-Smtp-Source: AGHT+IGf+vRi3XmR/QGP16LgsrUNxoVVujkhlQmO0eAfjGcLlZWZe2h4Qdaq8UaJGcAf86n7aeIE74J6
X-Received: from wmbez15.prod.google.com ([2002:a05:600c:83cf:b0:45d:d3ef:abb8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35d4:b0:45d:d259:9a48
 with SMTP id 5b1f17b1804b1-45dd5b456c0mr26381175e9.9.1757079046680; Fri, 05
 Sep 2025 06:30:46 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:37 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=ardb@kernel.org;
 h=from:subject; bh=RXdT7wNu/pdGAxus7uiLMzLf2wBNTNItEYxQJXgozmU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPX07+PF7pdfzyJ+/va/jMpCWVesYfLU/VO3srL2bJD/
 4fqsgueHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAilj8YGT493y9u4lk5z1xi
 txTTy/Lzcl7Ji9u4P7zflnZWYklnqS/DP93qaRt32exPZ3yexOYXL//w9rNPK+5sdlVi/yC+SiB rAicA
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-10-ardb+git@google.com>
Subject: [PATCH v2 1/7] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063048_806067_AEDE368D 
X-CRM114-Status: GOOD (  10.76  )
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

Initialize the cpus_allowed_lock struct member of efi_mm.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ce428e2ac8a..fc407d891348 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -74,6 +74,9 @@ struct mm_struct efi_mm = {
 	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
+#ifdef CONFIG_SCHED_MM_CID
+	.cpus_allowed_lock	= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+#endif
 };
 
 struct workqueue_struct *efi_rts_wq;
-- 
2.51.0.355.g5224444f11-goog


