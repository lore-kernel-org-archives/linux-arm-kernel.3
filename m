Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A5C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL1guVDD9UTKGUkKf+l7bjgonMYEE9LjjwttOmgr0Yg=; b=hypmWSD3wzsTYPqSoRSP3r9vK3
	olh6kOXVJYrlClCOto1Mb8W7pTpQ6ZvCd0Pka7sw+0IzhJBS1WKlcvBYfFqoJPdf8YDTApFbRjcr6
	E5Ajz50ulX8TENPImV+SeYm7wbbG+i0h5VtTiqirJZS8xJvxUcD8AH4JfbWkzyloUEZY/uIhrD2Y+
	u5sBecj9RmjG23P9jb2HLR0zWRadQhsmLdYFRm3EVd2Md7w2srBuloXRpJuL9+xr+bf0pZscTJRda
	KHq5wLyFMibheypmW5Rjd26YnjUEdzmKBFMkOIj1myYPdBF9kqimYmGXt5+1seN61mDb7bZ6HZ21H
	nbI2ZjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZH-0000000BCzV-4Ajb;
	Tue, 01 Sep 2026 08:10:07 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZE-0000000BCrN-1lzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:05 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49554715277so41128955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250202; x=1788855002; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nL1guVDD9UTKGUkKf+l7bjgonMYEE9LjjwttOmgr0Yg=;
        b=HnTuot1UeAFXeBSr7RdoISTYuXCXv+P3G+WPYXxRDkOqnsXqfzbEHXhDJ8k8tuQZ4p
         uAKm7iRmEOWcNYAAjaO3JtPbj8HGwXRwO0rej2JJYBemO35UGgfj2Sixbb9Wey8bwyt4
         feQUy+Ex6GKmFk0qXG+mQ0C3KPjdUhm/Nam4M6tU58zFPjmnvU+yTUhtcF3t9O9gMq4J
         QA71DF5oOUD8ZVnMiRfKs3pTe4BEwuchHaED40A+3yaR5U7hqWZ/VngUaLIV8pOgI1LQ
         sJb0VRE/k4GNXrpFkCYqJ8NBEb5CzAYIzzw/BfiGTb2QVIds3//3iwgX4eak5biuRNP/
         ydlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250202; x=1788855002;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nL1guVDD9UTKGUkKf+l7bjgonMYEE9LjjwttOmgr0Yg=;
        b=M3Bnv+PC6IkE1wTP6Bh2jQdDbGcl/2UKqv9EUdwHzejEYTu5n1qtIzElFHbAWMKRvi
         wJtzf+KWRRPeTMpu10tuzTc0CWYGDWW4CWQbkJZunLuSRIyTxrcdGieL6V86kxAtVaGH
         pq0EdC2LLdLi+cnMQ5kSGK6DvsbxqZTJlhypIWCqJuI6/bxvLLi5fWkah2y/TgpG11g9
         5MQ3+DeP1fFl1ju9xf8wBwf4qLTnZbslUzrW8w7gYbbvcW+1q3LcRSM7W8W7T3EwgSgh
         h4OtLAhyxJIxhKrfF2Ye4+naJJJTcj5tL2nNygkB8NPM7WKvwuUeDLvOetFLW7Z/Ne+3
         QUsw==
X-Forwarded-Encrypted: i=1; AHgh+Rrjb7xhbUbGyYgg5JvscrtFB1yAmUaJdkARF8b4gluilV1XSTovv6p5QkTN4CLLH8bI5jqdDB1UB2tS4y9xuYyX@lists.infradead.org
X-Gm-Message-State: AFuF++l2zf/4LSpan0BrcKmSXsxsiYMyMQRmz5rsG5CRr89SajSNPFHR
	K5DCWq5rRUA/vJk1ABUc7pBBhyCERpMrfaEgOrTlbUOBVkjhT5idbTVE6VIyhgaxmD2Lzp324m/
	B4v+L4EEUhM/H1TeF9AvmLQ==
X-Received: from wmbb13.prod.google.com ([2002:a05:600c:588d:b0:49b:e69:99f3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd4:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cdc59f62emr114474425e9.9.1788250201805;
 Tue, 01 Sep 2026 01:10:01 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:34 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-12-vdonnefort@google.com>
Subject: [PATCH v5 11/18] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011004_503144_C3B99E1A 
X-CRM114-Status: GOOD (  11.19  )
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

kern_hyp_va() is idempotent for the hypervisor linear space. This is
handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
pointers. Those pointers can originate from the hypervisor space (when
protected mode is enabled, we don't trust the kernel and the hypervisor
uses its own copy) or from the kernel space (we do trust the kernel in
"non-protected" nVHE).

This idempotence does not hold for addresses within the hypervisor
private range, like the ones you get from the pKVM heap allocator
(hyp_alloc()). To resolve this, filter out non-kernel addresses based on
PAGE_OFFSET.

Leave the assembly version untouched as it has no current users.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a68..d89864c4b961 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (is_protected_kvm_enabled() && !is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.55.0.897.gb25b4bd76c-goog


