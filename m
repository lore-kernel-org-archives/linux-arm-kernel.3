Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCEDC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=; b=TWIoL7iOrDCN6d3mbhbAW1NtlR
	KsowCjH3iU37Vf8p+7ZI8FIQ24rirP+NIVQl4bFQpsml3Y6ENhPe1ns6i2aeRLe9vDzCbkIpRldT/
	M8cS3QgolIjmbE+89Mvym63isdxn4f2lyQ9AGxepEIiPEA1DiOyLT2Q7Xk3fSilOGZW86lwfixryh
	IFZyXG7jVWQFsyWJBdRYvSrm6LIiRgsc72mlkEunQXBibEP7/4+mLe7V82RbwRGfwrtJDzR6ym0Er
	OhB/z3RQMMixshidq9HdIRCEnglhsYP5i8SPgPlF3NOlJDtNjV0tCodbnENwPiWo1ZO05PmtqW2ZR
	/uT3ET8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blp-00000001oJd-2eIy;
	Mon, 21 Sep 2026 11:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blh-00000001oH0-2fIX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=; b=ZvVNHHN8HVP47sj8P6oDKFhXxS
	zF9zawU/8b4JX5lt3z8oIwG+gm8/I/jfIeH472BhNt8x69w0oXjwNbBfq/A70m5IY52hUwORao2sW
	W4Wsiq2pOiPO2Ad+p+taTiJAtQA+ZVVgVN3J/lXJck9W9qA06bYX9OxHMR+HEsWZ1DbL3QLkPpXfO
	JOivqPPwxpRtwMVF/nEcg+ermLDoF1ylUkg+B6kXoWObkgNx/64uiEsvSe22oT7hBDEPUcg7jV711
	P9b1a/LxDxKnK6M+mOkROzCHueZ9r9PKiesq0K2lAsF+NNrf9qtRj/n6XYtNWEwneFPezJJaQ5hAN
	8xnlfu7w==;
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ble-0000000CA1X-0XLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:04 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c294ca8193eso112992366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988460; x=1790593260; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=;
        b=slNmzaNClKCb1ZthPMz9isf24v1OE8k706zAbvqX/V+wS2v7OAn0/zFIKGuCcsU9Aj
         Znxwx/JWcWCvCqqLOPH7qoLDUb+AM96BUhzA1V16g7rq1DBtzyuIRGSn+WUP79Ud4slZ
         hyXi5kJ641HjaFZRJ2h4Pkt3D/vHqV61CDWb1hL8GCzGgVkDgypi4uzZn9KdsBJU/N17
         p7E5mLkBu6ERbwJuZd+sSGDnr7kG2VRfXvg8kxR8yCymv9p96hNstGxuTqzw4gub72rU
         MuF8qTD8TRfqavaB20ITdM3JoMtQk26D8vusdXhivEbIoqbJ5mAk1xYrFyZB2XhpNk+Z
         y70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988460; x=1790593260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=;
        b=2ct8QxHlvBBiHbGAXbHR/uq4aNxr5h/Au1isBhOhbYNwdT+OZJssDx0mfz3HGnKYw0
         eQOZQoq5P3ZX/YeXsSKsY+a+9yQfSPJwaOTVG6Y0QG3VuqQ7LMiApJ4Paxy/YMM97mY3
         u9ajJPCkw2Vsd5i7Hfq/ig/miafxebKmlZVEWPxuq0VPpeXvaNOdahTLsIkKkGJ754MZ
         vwYhMg9kXqMFj2j/tYMNEmsvjNwLUH/gG8R97JITKOtKRkx1Xi9NUpIGODvdp86rf6xu
         LNyxHcqWncpzK/3h2Fucvh9Oos1op2IW1l5Inw7LE5WaUJ0M8MoVWY1AAhOlKMafKqxi
         Ov2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdfrTdiUOBXwtIPZYwtP2dC7HNGaKEHp4OivmokhiQRIx3e8XXPfm+ByM917Qda5tj5i2G/VYAOgQ5eAY86FL4@lists.infradead.org
X-Gm-Message-State: AFuF++kw5Cc4svE2KQAbwkRRQIoYpMe2tOBxycyEx90+gMre2ZGCoeUq
	+nMrdOlBkPou41Sd1xmaUZridkMcZ8nklGHbYkr7D1MqjIvKd/8VjZXnyhASoJ9aqg7/dqmdFzs
	ygXeV8HG0Bq6Wgek8om9ayA==
X-Received: from ejcew23.prod.google.com ([2002:a17:907:9517:b0:c2a:25e5:645a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d17:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c2a15aeb6c4mr860923766b.27.1789988459841;
 Mon, 21 Sep 2026 04:00:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:45 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-4-vdonnefort@google.com>
Subject: [PATCH v2 3/8] arm64: Introduce __set_direct_map*()
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
X-CRM114-CacheID: sfid-20260921_120102_683121_8A6B7595 
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

Add implementation for the unsafe functions __set_direct_map*(). They do
not verify for can_set_direct_map() and expect the caller to do so
beforehand.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  4 ++++
 arch/arm64/mm/pageattr.c            | 22 ++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 80bb94a340fd..5e372a02b825 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -16,6 +16,10 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5fcdb292905f..3aaba7f988ce 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -301,28 +301,38 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+{
 	if (!can_set_direct_map())
 		return 0;
 
+	return __set_direct_map_invalid_noflush(page, numpages);
+}
+
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+{
+	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
+	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
+
 	return update_range_prot((unsigned long)page_address(page),
 				 PAGE_SIZE * numpages, set_mask, clear_mask);
 }
 
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
 {
-	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
-	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
-
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	return __set_direct_map_default_noflush(page, numpages);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.55.0.1082.g2b9226bbc0-goog


