Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315FACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Dq6c0ZGM/PcmsQNtaG9zqEgKMUiGLsTw4kpN5BfNGA=; b=SaZVRt52aC0X1DLJJ8E3Y878EJ
	DYrJjWA71YpqwdP6bW8RZtHKiUwI/+/eUsfV/BVhfzFXP+2H4Jup1JLGGUR3FYW7dElqnxSoPsndN
	49pkfkXR318pjvxAZIUwltMhvZTvNRFyWEuzHPhsjRSGxhNSJzJo3MPg/YV0gA+xGt+L6fbrn62yy
	P7G5BBDZelTlWtsq8OjAS6gdmUn6Excu78z/jlDki7mnBctVJ/LMs3yqqZ8iBIfYv9dOeLMDGXFew
	XxbrnpqhHckzlkuqDvDGY+qAftKPlK5putI26YMU3JCOc8AyZkxlS40kyVNMMZ09boFYkEoFcKH4Z
	LAXIHVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP5-00000001FKs-1m0L;
	Wed, 24 Sep 2025 15:27:35 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ROy-00000001F9O-1lds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:29 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdf7b5c46so1404f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727646; x=1759332446; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dq6c0ZGM/PcmsQNtaG9zqEgKMUiGLsTw4kpN5BfNGA=;
        b=evfLylomyQTtzAq2ziIxpQZFZhHBAcmqUL/VHEAjr/URUim77nIOygHZ/g6xPaOQZ/
         UnbSP69oBnHYrgX4KQ0X2uzYI5np1rJp5DUE+h3v+tabROzpiiY1JUmmY/0iDlC3bnG/
         JSCo/j3ZP9LVYbQEx39e0hvXOPlII40jckJxDaKIdJn+mQea9e7aE9b3cmsz99cGRf9s
         ZvQDHLNmAE7sn2XEyoNZp5+xChGGiuAyu6Up39AR1x94a/OrQeloNUrtySaf5IuQrVCp
         mQlGR5LcFBui7XvSEyvyrKUY0qks/xPO7niBaR/XR+3OfPYO+TvKliCxwQmIBNTnMna7
         GWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727646; x=1759332446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dq6c0ZGM/PcmsQNtaG9zqEgKMUiGLsTw4kpN5BfNGA=;
        b=uSdRxQZbn0V8uQP2ZscZtaYJIRwGnaONEn3G9owqo6Gyk+4C+nuoEZlwpECAKYxATz
         kgR+TkksCPvF3lD8hck6F4A7rzfJvCY1EtABAydKxOuSmKLSrINX6tEvxrF2+h/1ppah
         Z24470Y+n16vAiodUw1KnqScVB2qhC6PrkaU/KiQvAvQm2s2o6gX+SzlSedkkVY1tMHV
         +FDeCAA/bF9o9ioFj9LGN42Yo5z2qLC4Q+YNoNRqyjv9m4tyCZBRZaucTh4PTIIA1K6v
         POtmzeQxX7XUrB2fI7RYSHAIE/vgpmAktWhqKv4HriWwr21gSLOHm94vca8suqm+RF8Q
         44Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWdQoEtjE0vX9Cikv/0DnwnNxZKI8WU8ADouSDEJTnPD2qii9BtbIKdkAlja84UM1kzmxdcmaKIv17pOmiOLaNV@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJPkcJnCYCgacYekTfnND+uoRriaqEjz9rqFYqUjzoeX4QBpy
	R3fuZ8BYMUCy1D7hfJ1sbKAMLJoh645RilCU4PvxxwJvECB00WdFVCB9oy08Ts8EdGSLUXkCPg=
	=
X-Google-Smtp-Source: AGHT+IFEdA9MBtNZtoCuFX5LdOx2I1XqFRDSTgfNjpmBTAhcuyQh7YpEfjehwPy3DZrnvKS1vcvIWvse
X-Received: from wmbjh7.prod.google.com ([2002:a05:600c:a087:b0:46e:297b:900c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3105:b0:3fb:9950:b9fe
 with SMTP id ffacd0b85a97d-40e48a56cb5mr294011f8f.47.1758727646359; Wed, 24
 Sep 2025 08:27:26 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:53 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=ardb@kernel.org;
 h=from:subject; bh=430ZoAUsLaGRjbsT1dmBVnqyeLcQQst70F5MXr1Sm+A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK7z6nI8LhS+KvvXC853dwu7jtO5brkVs70ndXeG6Yv
 rXK/Ix1RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIa26G/yWXNv/sbD8Uoucg
 ty7/un116hFW7Wlba/s7MmdmlUyx52Zk+Of3+/+aar6yKRzC6q1PleeeyW3mjxAXDDNldw7Z1bW UFwA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-10-ardb+git@google.com>
Subject: [PATCH v4 1/7] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082728_478508_4783F7B9 
X-CRM114-Status: GOOD (  11.26  )
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
2.51.0.534.gc79095c0ca-goog


