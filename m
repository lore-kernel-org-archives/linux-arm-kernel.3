Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DEE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=; b=ci5A3154gLG3oufL01yJ4i3zYf
	b0NDMuoK/JnUfcvG6MUwyWFt1S/jqxfzakDbUW4eEmPE+LYVNRGpmLj4t8wHHQ6d4R8mrkJTWI8Or
	5n8d0Lk/qw2Sap55dj9TPV7004SXHpwn3bsK/6qTDO8NghnOf9LgXgzdT9NqVbz/SdwDAul4BHlxp
	thxHpJe5Q1WVbpQUHha8e8Joq4e5zk0x7ijRBGgcOXCoN1Ud20U5Dp99/SG7ZZJC3XCey3X9l60Yb
	8biuj2C6MJiKD9ssA86ojr2JwHpqmd/qtjXhFhnBPMDJ2WhzyZ/FaWGRW/HlWVnzyvJh/zOks/wjB
	jrYfnkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOD-0000000GWRE-1gfk;
	Wed, 11 Dec 2024 23:45:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW87-0000000GSg8-2mzc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=; b=i05RCnvtMavUltFhHITwzp2mga
	8ZyKxenTWAcGOgWIn2lL26LOl7j8zp/4a1fxy7RtFUck7KD3Lz53u51e/Yb04F6Nz/6hDOXhtFzuf
	hjQDg3o2OwCzjrcpQ1cKgiwjrM92gLMgWodamMmiggHFx2mEKlYtV1+xqXWeL9yVMCpjHbLU1z3xt
	0hKL1zxIvGs+hp6pyg3FhRGc+qbssyFcO+EcSmvRDQtAMfzBtCQFA/VrN7/Z8BS149dClDTCb/F+U
	3hYnt+Sv/G2tBAknPxizx7vQRJiO82DTPe/AViVkQHHg2Zgh5vVKZfYtbEnQwCduoKJifAI0uxaHI
	u9Hot7+g==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW84-00000003w80-2ms5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:30 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-728f1c4b95aso25742b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959706; x=1734564506; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=atHxoZkgPzOb167a+gg9+6HJa/uSE3oa6MxP06OsnIKHKAktm+M3IzhPNoFJQb9TQM
         9GYxMScNVhNF3WD0OdwyQejV99XYuT1NfE8ImbuqOfH0P1q5ebQjJKjz05JulLZZ9rXJ
         /KAv1e5w1AS8IhCXPNCmqn7LkR4xi43yW1j1YDZxQNtNgvvMpGlieK5K25KGhYP15dMb
         ufWBximLoruAoADRzjs4ir+CEU6mMCJLYFacB3PdCzKsipnm/tIqm/yh1BGtKeK5qOGy
         0CyH0+FC9/Omh2u8SEYuwWdmahvLAwppA7KPS5An4EgzY9lCnvv8oy88RH/wYqhEvW4B
         6vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959706; x=1734564506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzI/WChqoEagnx9fXIUsiKk2yVJ1VLNiv4KjzJVNd2U=;
        b=OVMIwj4ayp5MKkwUbAK0C5V5Swm9lzv1L/gYC+yOwtXbTPNGwN43yyRfH9OngU+Ndo
         TRFm1e30XzPiOvwa/yfg4Fmvqxalth7r8n/Xjn1HQgoCrshwOZBqOizBOuq0Eh4hSjbB
         soIG28vCmczJ98CLtDPcOvIy+oY0N5W1hOAeY46Knqay4d8AL2vl9uPtIX54rWGOaubl
         mi4sWJq5MrNT9V83ePNLPREmsw27/TteWM7qODy21I6xFk1K4Sz0ENv1LOVjZZxl5qv5
         sP/ak8VL8K4yTUaMtcJwRj9FLBwdHwAhmeE5CyOLHAxAReAbYCuLojWIPSKth3sP53qh
         PbxA==
X-Forwarded-Encrypted: i=1; AJvYcCVpD9BIpYKm6HlY7oQZc/shXrGeHda0CPZ9uWkGtIWm66X96OP1BIv1J/VBoygJ3hVYmAJk88mk4JE1zctlm0E5@lists.infradead.org
X-Gm-Message-State: AOJu0YzzkHwjm10uBOyMos7FKQCjZR50votFgtdZvfJXmP3Uze+xIwYk
	smM5omyko576PYyU6h0M1EkU+DNCNI1b/jr/suMOswrwsTurwHOxnb5Hw4qjsWAViY6q4aSQF6T
	cn8JdyUUf+UBVzVobOZzaQg==
X-Google-Smtp-Source: AGHT+IGnJnRJXQZ5IIc8W3PGTGxBtDfE/sIYeRjCrJpkHMTtOgcOp40OoEyKbTRESGUAjOdqxtzUpt2F+EP39npdAw==
X-Received: from pfbcw14.prod.google.com ([2002:a05:6a00:450e:b0:728:e4d7:e3d3])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10d:b0:1e1:aef4:9cdd with SMTP id adf61e73a8af0-1e1cea82ca5mr1784516637.1.1733959706098;
 Wed, 11 Dec 2024 15:28:26 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:53 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-16-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 15/16] mm: powerpc: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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
X-CRM114-CacheID: sfid-20241211_232828_912479_8A47A9E3 
X-CRM114-Status: GOOD (  10.54  )
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

Introduce powerpc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/powerpc/include/asm/book3s/64/slice.h |  1 +
 arch/powerpc/mm/book3s64/slice.c           | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index 5fbe18544cbd..89f629080e90 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -10,6 +10,7 @@
 #endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 #endif
 
 #define SLICE_LOW_SHIFT		28
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index bc9a39821d1c..b4067c57c778 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -647,6 +647,37 @@ static int file_to_psize(struct file *file)
 }
 #endif
 
+static unsigned long slice_mmap_hint(unsigned long addr, unsigned long len,
+				     unsigned long flags, unsigned int psize)
+{
+	unsigned long hint_addr = slice_get_unmapped_area(addr, len, flags, psize, 0);
+
+	if (IS_ERR_VALUE(hint_addr) || hint_addr == PAGE_ALIGN(addr))
+		return hint_addr;
+
+	return 0;
+}
+
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned int psize;
+
+	if (!addr)
+		return 0;
+
+	if (radix_enabled())
+		return generic_mmap_hint(filp, addr, len, pgoff, flags);
+
+	if (filp && is_file_hugepages(filp))
+		psize = file_to_psize(filp);
+	else
+		psize = mm_ctx_user_psize(&current->mm->context);
+
+	return slice_mmap_hint(addr, len, flags, psize);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
-- 
2.47.0.338.g60cca15819-goog


