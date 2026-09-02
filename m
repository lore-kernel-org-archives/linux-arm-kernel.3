Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D79C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNWZLpQFf8So7isbdfRHNiNRkktdYQTRcSFjKmsQSY0=; b=sC0VVoAWXiKSfukyYuhh4ICz+b
	hTJlvLcnxv5uXNnNrX4SIGNrn2hGkPOj4l6adyupRS/I4r8ssFU7z4QySaJqTAbfKReR6oab69FZz
	mvNNnPhck6Rfe6eccV2/RXLwihT9hUIWS2b5A1apg4NkZFnHYp6ly3yVPBw8yaE0j92wjW5xhjPOp
	pONkIq68JW5kCMTDgSpFhNhp01y8128a88CC7bRrH0eS8xRlFJr66okU5VA0j4lJvwB4PlaXsKlzU
	C3B7v+oH571N3Whyv2Aso6niu8q1xx20Yj2U/P20hL5cEJVI/tp5gPcMxp+WqzuVqdT+8wrqyM2Lq
	z+LIPYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYr-0000000EP2o-1xY4;
	Wed, 02 Sep 2026 10:51:21 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYn-0000000EOvu-3wcs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:19 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso7828715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346275; x=1788951075; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNWZLpQFf8So7isbdfRHNiNRkktdYQTRcSFjKmsQSY0=;
        b=f3KRyq/shY9hM1p2K2spD5SSiFEZOpU/BjzAY6H8ejdkbyxdPSmgZ4irHnqLj5bTx6
         D9UOgJj+kIG/0C3pFNCphNX9p3sK1JjgdD7HEx5fzhvV+HbzkPYfOeiYXPgBI6+ttXBo
         sH5ceZdqjhaT3MhsJJtR6Xq9pCeTvRgD4tS9zar2lmYKTZlOL1nai/odQXP+QMCpe482
         ojhswqiQO5RhzjdSgv+V/oKsXVGyPaM7vNmw36Eh/9xypRmvUfV0XcQPMCJip+HRIOWj
         kdJbTYQwjPFwExX/6q2HxiOPKe+fmYlU+tL99ibBMqecEJZyZUtLAu9Ey/e1IT+wvVwq
         OAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346275; x=1788951075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNWZLpQFf8So7isbdfRHNiNRkktdYQTRcSFjKmsQSY0=;
        b=CFgoUe7AbBMsejJAMw1QN1HzxkMtYQqhXmzKtyu89FvGYpaOMSYRR3/zU6fPVjzjmf
         ftAshKRdmqW7xhgrfEDWtfzQyA8Mzt1oOgWn2JDJb2CPhYY+CvKvd3e62TPRvOA7djT1
         in4NrRT+PqgBZ200x7SoElf9A9QIEJ8UeoQYAGEKa6FP+l2cCPKfVzs17/ztdzcTP42m
         jpXzBnGu/PrfyMzQBHFiZJtDvrj/J8iUMCT7zGFUakw4DPoM93yy9YdIOha15QQhGKL2
         qf/lG+c4pR+TjfFgUYUYJgoyRpCMzGc2kpW0a2mcb2hXjSKkUoTs62aNw93fyJgcTwow
         jwSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhw+QE6xxLuAjilsuKhlFYZ0NtqPrPDwx5o5KzmCtr5QNWzuTcArgjnwPhAoiHQ0bl4wMbn0uPML+EGAZQAckr@lists.infradead.org
X-Gm-Message-State: AFuF++nWDfd0ftLMSXVAFdoHTU6gfydmPhTyT2rKUKWg52J6Hjr2GRLh
	vumT6WkBm4yVZwqUpx8RY+BZVQYjVA6wCotWkBqegwN13Ra/ckq1Ncv6PUbG1r6/1N2vd2hwdST
	zHEtrQ16oSJqzx/JqWNp9Vg==
X-Received: from wrpe17.prod.google.com ([2002:adf:f351:0:b0:484:3204:23be])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e93:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49ce57f5235mr66954815e9.7.1788346275192;
 Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:09 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-8-vdonnefort@google.com>
Subject: [PATCH v9 07/10] arm64: Implement __set_direct_map*()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035118_001387_9CD43E98 
X-CRM114-Status: UNSURE (   9.47  )
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

Add implementation for the unsafe functions __set_direct_map*(). They do
not verify for can_set_direct_map() and expect the caller to do so
beforehand.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 1a37f4ef130b..080a40846bbe 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -16,6 +16,10 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
+int __set_direct_map_invalid_noflush(struct page *page);
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+int __set_direct_map_default_noflush(struct page *page);
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index c59ef17eb0d0..28adab0edace 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -294,28 +294,38 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int __set_direct_map_invalid_noflush(struct page *page)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page)
+{
 	if (!can_set_direct_map())
 		return 0;
 
+	return __set_direct_map_invalid_noflush(page);
+}
+
+int __set_direct_map_default_noflush(struct page *page)
+{
+	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
+	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
+
 	return update_range_prot((unsigned long)page_address(page),
 				 PAGE_SIZE, set_mask, clear_mask);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
-	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
-	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
-
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE, set_mask, clear_mask);
+	return __set_direct_map_default_noflush(page);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.55.0.970.g62bdec98f9-goog


