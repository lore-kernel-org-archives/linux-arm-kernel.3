Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0535CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHkz/NgFKwMRIi/FlTPVEcadP4L/5L+4bREFqEJc294=; b=c+nUwH5tD/Bguu94DrHo8H7z13
	KhA14PJHTim/rcPRacPWY/glJlD8tGAIOwtIz1Yvq7tIVupoXFR1OqGsestrGvNdITPRdzXHAxjA+
	oPBSvwo48q5Dntcwv1mTQWpTq03gBb+iTWhG1HAlhA74flu0aW4+gQ8wAFgPlFVg2jG1eHgib854r
	oE+DPBHzlXIQZXE+fVgD3WM8yEQi0z5SE+Xj3SyWmpq7PSASCKPvV9uSWgvhS3v2R12EIZLGYngxh
	7fKa8E1xWY5c5aLlMaHvx2uPLnZZtTgxUsijHqOEhRrQRW7miMCNySlTJF5mpg6lJ8cLUIaxla1tt
	3W9N02cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHd-00000000Oh5-1G3A;
	Tue, 19 May 2026 06:50:29 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHV-00000000OZv-4BZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:23 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-83536dc3be5so3155529b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173421; x=1779778221; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHkz/NgFKwMRIi/FlTPVEcadP4L/5L+4bREFqEJc294=;
        b=IxP3TpP5c2NI5n8HgYuGlu/RgIEee4uBG64/u5kOvlh5doQCMFEr6JhZfZHDSmZMcV
         skvkF6BUQOzknD3FjffTFU1eqYrjUA+Wpwt0Nzy/QXKAirRX6CxXi+ANn6VT73DHyaQr
         40jKDSZZZ3uidcuycbw3ypTtvQmebhDeFr5BCeTfYvs0W/ibseT5NTjo/XBhHFoPpgre
         ROP7ZmsBfYSsMMbJjG/xjUwpa4FhdNNNY0zMWDGgI9w8M40Ep20F94M6Hd1+FydpYP43
         OS3QUcub7W1wysXDIlVjOkn+6weXGUYbD2IyoptGr1Uw4kZ+Qa/DvVnb55RC5tt2NO2I
         EGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173421; x=1779778221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHkz/NgFKwMRIi/FlTPVEcadP4L/5L+4bREFqEJc294=;
        b=AIAOkdCODmZDUYuhxu1iR0oP74mkYxBE2w5mTO/dzoorLhzbKvGx/9Y1KNFKnatiiv
         dFrfjsDkYRyOfAlVWDkhmbKuKkjDrXHGlLL5GgeGilsy5WqSbOf3YcqyFWQuCszvSAU9
         UgIymaCjw7ZKEMCNf9tE2KIm6wfqjkFMHwa3/LEfAYs6PKfHpeiVqlXJ+xvR5zHUDRcW
         Wx1O52ftSzJzrLPtWQDU6mocB4eniactatGq9ZWOqkPkhZxVCsWjptKbjI8wG6WQed+H
         r32jjeS7svg0Ct5bVjHHvNmLbVYmUxzDh/ArPK/aC0NRgS9xiYULnXYBdKW9cW4EODAK
         l1ow==
X-Forwarded-Encrypted: i=1; AFNElJ/hE2RjniNVLVqyGLktlTLmkfTmAYPnC5ccB0+duEng4RqHzwE6ctqcHxC1E8Ln7Cakgw++RH4qxnohLz2mXmw0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi7IrwMN02jjMOz3aXeMjA8nyKWQJFOPuanZG3VOtufCOpGkYF
	JP1BbaJ7bbICYwiUaCb5RwrRmEXjBpHuDmbJfp8OUmaWxgnbHxixAO6eQP+7pSeKmCgesTkAV7e
	XMaeBfzz31jyqNyFXjIs3LhPuow==
X-Received: from pfbg11.prod.google.com ([2002:a05:6a00:ae0b:b0:83a:68c:e1c6])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4214:b0:83d:b11f:796c with SMTP id d2e1a72fcca58-83f33f31c40mr20319191b3a.49.1779173420344;
 Mon, 18 May 2026 23:50:20 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:49 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-9-dylanbhatch@google.com>
Subject: [PATCH v6 8/9] sframe: Initialize debug info for kernel sections
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_235022_051308_0CF89BF1 
X-CRM114-Status: GOOD (  13.36  )
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

Setup the optional unwinder debug information for kernel .sframe
sections. Modules are indicated by the format "(<module-name>)".

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 kernel/unwind/sframe.c       |  4 ++++
 kernel/unwind/sframe_debug.h | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index e8ede0343cb2..d256e72620fe 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -1036,6 +1036,8 @@ void __init init_sframe_table(void)
 	kernel_sfsec.text_start		= (unsigned long)_stext;
 	kernel_sfsec.text_end		= (unsigned long)_etext;
 
+	dbg_init(&kernel_sfsec);
+
 	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
 		return;
 	if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
@@ -1099,6 +1101,8 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
 	sec->text_start   = (unsigned long)text;
 	sec->text_end     = (unsigned long)text + text_size;
 
+	dbg_init(sec);
+
 	if (WARN_ON(sframe_read_header(sec)))
 		return;
 	if (WARN_ON(sframe_sort_fdes(sec)))
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
index e568be4172b1..6c7ab3aa7c9e 100644
--- a/kernel/unwind/sframe_debug.h
+++ b/kernel/unwind/sframe_debug.h
@@ -32,6 +32,19 @@ static inline void dbg_init(struct sframe_section *sec)
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 
+	if (sec->sec_type == SFRAME_KERNEL) {
+		if (sec == &kernel_sfsec) {
+			sec->filename = kstrdup("(vmlinux)", GFP_KERNEL);
+		} else {
+			struct module *mod = container_of(sec, struct module,
+							  arch.sframe_sec);
+			sec->filename = kasprintf(GFP_KERNEL, "(%s)",
+						  mod->name);
+		}
+
+		return;
+	}
+
 	guard(mmap_read_lock)(mm);
 	vma = vma_lookup(mm, sec->sframe_start);
 	if (!vma)
-- 
2.54.0.563.g4f69b47b94-goog


