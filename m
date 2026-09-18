Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB393C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otp0k2i4YCw4bQ4ES7pDpC2btKFgr9S5MNUmkPBiGJY=; b=w/8lusJibh6RFC/4tASzS0f2W0
	owK3wWee5JKNLJZcQSUIkHLV973zNxx+Wa0gCGLiStIMYxE9K0kP2FXL0zwcOfXas3qVwKLv9C1/N
	k8YLJpqeuuCdVftYpiKkYXEcCoOA+e9Mgy01s9q4axqNaPlMUG0A1DY3OS8HH+iA0Dr+/oVBWOh90
	W83vRP8ZBczB1Gkoo4Y9rR2ldWYywerqhJbkY7WbY7HM6kKi5pJe8gmVwR6jdkVJ5kmbf0IiCic1I
	rmNn5Sg1SLjqFm++9dVHcgDhwrbgdtZhBi8PJCBVQXpvb4+3RhyIFmMeBPjlJzX8tMI5tna5qnfQI
	4ft33Plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUi-0000000EUFF-18ou;
	Fri, 18 Sep 2026 13:19:12 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUe-0000000EUCH-0lgL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:19:09 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49e6422198fso5557395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737545; x=1790342345; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otp0k2i4YCw4bQ4ES7pDpC2btKFgr9S5MNUmkPBiGJY=;
        b=Sz0ILgOTWACDpY1EKgOxTDd/lf+oyyaJESCcCpShgAJ7/ifrVPFn6kkshwCiZDW+A2
         Lge0zXcaCI8RdShrIinnpH09Agmu8arQ5pBn4X8OBt/57y2oZq3HEfv8Px0+IV1TFIjF
         it6znl4vJmWEPJB8sPwjW8Q2wxOh4k3wJAajbsTg3mu+3zJaCabPaojc4ibl60ZdMxEd
         AT4m/Z6286ZJcihO9bz61vYXb1heP9NiNlfwTNMnOxA0kAtDljKDmcn6UNqXSB1hrcAK
         jKRFXGNpkBLEaQNEYHJvF5jEQtGVKp1mQHDONpj9oWTLSF9oR1ILhufOf5hcrwlkz/tm
         wTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737545; x=1790342345;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otp0k2i4YCw4bQ4ES7pDpC2btKFgr9S5MNUmkPBiGJY=;
        b=opYquGfuQyLHjI8BfvXYyD+k9W04HxD8eNzUDEs4linM7N6HAL6DH2opatDXPj6xd0
         C23DNamU6K3VwWz1TFEWsbngYxMVuCLVpPAu5rIVDqrjXJDtXuTKI/y+Yu3Fvj/7q/dl
         uXWKYrEFb77psq9SUH8sp7vRv6Kui//1voJMfZ1dkw9ke0V+RxGN+W+K9YbVNTxWo5tw
         ivnd34Ti5baG4Kd3zuagKLNi30UC1FZSrDlBaN47sCs2K7Y9GU968AAXZrTzaWFNCWM4
         jpWBXTPayVl6ea6rQPPtu0VBmkRZLhLA5WUIyKCzWmBtsKMGGlNp5s1VNf59ZcFqQ/yh
         VGww==
X-Forwarded-Encrypted: i=1; AKwUvBzRsWZlvWhTXvffbKg0rH3bofhbpp5Ht+sOvHCwF7v9XlJGAd5TY3hnR6U2gy4qWbyGYVm4FaLhtaGDljGs/eRK@lists.infradead.org
X-Gm-Message-State: AFuF++ny9NbKl0gcn/nrhwYwudtBy47jYwnLVH0U8q6FazcNLYKhv9TX
	U6gHnq4CCApS9DneM/EpP9JD0jH4YaMYUCdqonu71L/Ddn2D5C5j++X2KXUpzkKnytepK8HB44i
	CQ7kCpzyFFEuM5tZoxBgCEA==
X-Received: from wmps28.prod.google.com ([2002:a05:600c:319c:b0:49c:caed:426c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c5:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fc56aa4e7mr86535595e9.7.1789737545460;
 Fri, 18 Sep 2026 06:19:05 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:56 +0100
In-Reply-To: <20260918131656.3710047-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260918131656.3710047-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-5-vdonnefort@google.com>
Subject: [PATCH v1 4/4] arm64: mm: Allow can_set_direct_map() on BBML3 systems
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061908_269775_510D360F 
X-CRM114-Status: GOOD (  18.30  )
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

On BBML3 systems, block mappings in the linear map can be split
dynamically at runtime without break-before-make faults. In such
systems, allow can_set_direct_map() to enable set_direct_map_* users.

split_kernel_leaf_mapping() must now allow splitting for BBML3 systems
where no feature requires a split (i.e. !linear_map_needs_set()). As a
consequence, it can't solely rely on linear_map_requires_bbml3 anymore.
Instead, deduce force_pte_mapping() value and filter out non-lm
addresses.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/mm/mmu.c      | 24 +++++++++++++++---------
 arch/arm64/mm/pageattr.c |  2 +-
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index c18ed601f0a8..4c345065d33f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -811,24 +811,30 @@ static bool linear_map_requires_bbml3;
 
 int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 {
+	bool force_pte;
 	int ret;
 
 	/*
 	 * If the region is within a pte-mapped area, there is no need to try to
-	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
-	 * change permissions from atomic context so for those cases (which are
-	 * always pte-mapped), we must not go any further because taking the
-	 * mutex below may sleep. Do not call force_pte_mapping() here because
-	 * it could return a confusing result if called from a secondary cpu
-	 * prior to finalizing caps. Instead, linear_map_requires_bbml3 gives us
-	 * what we need.
+	 * split:
+	 *
+	 * Do not call force_pte_mapping() here because it could return a
+	 * confusing result if called from a secondary cpu prior to finalizing
+	 * caps. Instead, retrieve that value with linear_map_requires_bbml3.
+	 *
+	 * Additionally, CONFIG_KFENCE may change permissions from atomic
+	 * context so for this case (which is always pte-mapped), we must not go
+	 * any further because taking the mutex below may sleep.
+	 *
+	 * Finally, set_memory_* can be called on PTE-mapped vmalloc mappings.
 	 */
-	if (!linear_map_requires_bbml3 || is_kfence_address((void *)start))
+	force_pte = !linear_map_requires_bbml3 && linear_map_needs_set();
+	if (force_pte || is_kfence_address((void *)start) || !__is_lm_address(__tag_reset(start)))
 		return 0;
 
 	if (!system_supports_bbml3()) {
 		/*
-		 * BBML3 systems should not be trying to change
+		 * Non-BBML3 systems should not be trying to change
 		 * permissions on anything that is not pte-mapped in the first
 		 * place. Just return early and let the permission change code
 		 * raise a warning if not already pte-mapped.
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index c1ba74eb602f..f952cc125705 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -89,7 +89,7 @@ bool rodata_full __ro_after_init = true;
 
 bool can_set_direct_map(void)
 {
-	return linear_map_needs_set();
+	return linear_map_needs_set() || system_supports_bbml3();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,
-- 
2.55.0.1082.g2b9226bbc0-goog


