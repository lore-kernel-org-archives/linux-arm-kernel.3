Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F015E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 02:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=; b=aZ5kmDvh3F+edum3Hv9fSZ+u9v
	hTqX/emI7Y3s81dY/jZvsKD6Gm/jz9TTjiqLk7XhiNiMCuiZGGBrmMkkuIONzLTeA2xXSxcDGC62W
	10GhYDabPRw4f8Nj4LGQtTLmmmMZw6E9KuzO2LheRGYjpczPl/zVeKQUsPp//hYo5KPkJGHR8VL+x
	eyuaXNG5N1QTCZqcBoDKeCmU9A6ZDYiYDjr+XKgOUZpCfmVMqf5kWbx6Cy1BUygVYOJprgW8b6eP0
	HNrv2u7bOgAxOb76/YdzP1KqmhkJRXTMD+Rr8+5CxWC/m914bOqeDhUmD8kUb8q6NjMT5EsfWha+W
	/Xx3Pr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqS1-0000000A3Dj-1DfP;
	Tue, 10 Dec 2024 02:58:17 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC9-00000009ztX-32pW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:55 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725e59e41d2so1743145b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 18:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798512; x=1734403312; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=k1PcLdXaNfKwDwl2YxLwMTSvhJ0sWCsGWsuC/rScCSfld0e60G4Q6uzfHYmaXCwIui
         iBpBu4HKZS0dsqHK7odSQiOg2VqKaCSEplmkQFCjtGqSYN/GtUHYSuqkbPzvPB8zBIVx
         hPsoMV3dKK4FtPPjZ0/KCH2rTzB0jFSLJgtPs1o00gCcwwyBjKDcHJ5F1V5DYIMPUmd1
         tKKcypuQCCIyFlowSgldod0TkrZaS4fZrz+P+zY1PeW8GvL3+Jy207iIC7scq1WjUINz
         Xhkt1GANU+9ANQXCv+NdXfh2Sr8I9J08obSo4yGqXx0TWlh7Icfj3ookMdpVJ0GwWqJv
         2P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798512; x=1734403312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=GdHZB7j6siz7Ge0ZFXtEVf6TSTfeWLqPIr7XaIfyBRyXhCSO/XwfpcGdhM/AKWY24d
         IbI4vzfJmbT1TGvUoD3qbhA+VbOc5/1CW1UioVdN6dXTQ9AG48rrS/lKZ24hea3C/azu
         Mb/wq6cyKT3CS9zhIdVpGCKLv+g9NQXK0292BGcCSKhoSBIAWskZAppRAJQ+sx/96DCm
         xIk36SpHIq2s9M8ITpt2kfNeXto4cyA0jH9M/cu8A86kAsyI+wvFevMjnhPR564NOjsX
         zWiIhW+dzpYuMS3SlJJC8PdQERoKuV6J3nIjlTO1KUmx0VVtn/JAf7891B8OYmjGb7Ko
         wkBA==
X-Forwarded-Encrypted: i=1; AJvYcCXo7qSZ5nU+O+XOsVUph1UUXR89RJbFIka3UH8poYpSfpum+eqfN0S8VAlPAWtfpt0B5NKR74IUvzF8wHbJaJGt@lists.infradead.org
X-Gm-Message-State: AOJu0YwsbRQ3ZMvZC9hCvN1rFxrQz4A33/51CONrWPZHlSCfe6S2lnjd
	LSFfwT8I0zUvmES9VWbsTKjlPJCpzdp9TgqgS22r4HiwZFX2+U18Z8vMJFyvG8VlIazDKG9w8bU
	06iuFUFtmSBHn7psvaCl2Qg==
X-Google-Smtp-Source: AGHT+IH+U5NNduIwURg0BoDlPsKnnOIwfCnZdS3eRXACF/uPNRGoE141bvOCCDVesMcVlUE6OG1mnMpg0Q9mT2r6sg==
X-Received: from pfu5.prod.google.com ([2002:a05:6a00:a385:b0:725:f376:f548])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3016:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-725c8eab756mr18454838b3a.14.1733798512543;
 Mon, 09 Dec 2024 18:41:52 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:18 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 16/17] mm: Fallback to generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_184153_756894_844682CD 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

If an architecture doesn't provide arch_mmap_hint() fallback to
generic_mmap_hint().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e97eb8bf4889..59bf7d127aa1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -691,6 +691,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


