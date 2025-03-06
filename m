Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF11C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3EIDfh3bzz6FZ09T3hzG7XWiQpkIRvJOzVpoxagQuo=; b=o5iS1PaRgdg5+4wXfuPqUq8gBf
	6Jfa3T1cPaFTkji/HLc85ke1WbNltgSTA9DpKJhEXYAFcOVA9zIjHU3wk7224s1lSGQ8Ef/DdE3iz
	LecM2ywsfwdIeEay7J0kWr0u+ZM4ivwms06IRA/Wcdgq9CWie97QrhuPqsqLihAIelrSBg3TkCeHP
	mLAorjndR/cioV2zylUHBG0pdzaF7NAui1TCqwat7sKGDdZb4+EmmIRfCHQ3OZDYUFWtTzCQPdgFW
	7GL07z/pZhorws8FEpQHtJ8buzrQvkKC3qY1CgNtnPTKjC02FV++NYqLrHhYfvPAFeGXUBQa9Rh+Y
	az51//uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq91I-0000000Aj4O-3YyW;
	Thu, 06 Mar 2025 11:04:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8y9-0000000AiVx-39J4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:00:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so2240955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258847; x=1741863647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3EIDfh3bzz6FZ09T3hzG7XWiQpkIRvJOzVpoxagQuo=;
        b=KxkVPfwItOM85BanyxsI1SaQY2POTILUAvN1I1qQCvTHZbfUOOu0GOMlJwUrVO+9VH
         7c++DZbnOKV+BMWw/iMQBG/yWf9c25+QaktsU48NvdgZ1kZ5iLCR8ajiyr9Abt4ELRjm
         A870PDrxHpTaaqVwyEh7eixwobYN9CES8868apRgio3arw2cx/AmmzJZ7edFjjByQ2ga
         cFaQq8ROv+63VLI3O2aF72aMiYp7uPTl1BPPLpxzm9f+/znGD4RrFvLnUX9d4ly2EM9A
         FgGtbL6S5cfrbehLCvoO8pFs8ZjGSzyMYP+/5ZEnAN5dhUu0dKfhM9vwZ5PjVilLxdUv
         k6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258847; x=1741863647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3EIDfh3bzz6FZ09T3hzG7XWiQpkIRvJOzVpoxagQuo=;
        b=ns03NxfZ9DiQXfu18LIWwR9hWEdz528/lod2WK6dnHcWNBdReX/G4ir95YWZ78v7nc
         +i9M9iy3OMp8+s9Paki/ztn4gW54WhZv5AkLJJWT1e+Lc5SCMfok5i8ATu+q5mq9vitA
         +q3dODvxCetMXciZ3ElFeyxipIrhBvk1vDHop83j/89j2t0uVqV2g/qRtRwUoKbKo/MJ
         cpks/SiR0QZHGdNYoGnhRx67S38Og22/zcAGbmYAbJnjMdBQfu5czMYcyldgm1hh3rz7
         uOI2coWH+nCcHBlaAmeI362ZVbp9b9vDwJMEMNzF4P1x/vTMZ4NLGkZksqoCa0ZX3h4T
         +I5w==
X-Forwarded-Encrypted: i=1; AJvYcCXpO4ZEL2a/H/Sm/b2mf9Kv/nfQsI9PM9Iphwlidt5y1MdqHU2B4nuEqcqJrtFmp62PV4CQdluNRXb+zz4tQiHs@lists.infradead.org
X-Gm-Message-State: AOJu0YydXv5ernqUEBlNvZ4C0GRPOgn5Ls/O9PihgxsQWyYJkVvuKUKp
	CTx/CNWnboXz0Ke8xoqqqQlODsHF41IEt+s+ksv061n9f/owBOaZn8AwVxcpSGQ04Cs+4e4wnX3
	AslQZoljr3QotPF9T6w==
X-Google-Smtp-Source: AGHT+IHc9gvpZKIAvFGYxWaWiTqhy0gbG8Wikxg2XkAF/4yfzSNV6Mp0Ztsi5081XwxCLqL618nGLsdLrgFavXUx
X-Received: from wmgg12.prod.google.com ([2002:a05:600d:c:b0:43b:d4fc:1dee])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b95:b0:43b:cfbb:3806 with SMTP id 5b1f17b1804b1-43bd29d2d84mr55969355e9.14.1741258847657;
 Thu, 06 Mar 2025 03:00:47 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:30 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-2-vdonnefort@google.com>
Subject: [PATCH v2 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030049_787067_30A26DA3 
X-CRM114-Status: UNSURE (   9.12  )
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

clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
size as an argument. But they also rely on fixmap, which can only map a
single PAGE_SIZE page.

With the upcoming stage-2 huge mappings for pKVM np-guests, those
callbacks will get size > PAGE_SIZE. Loop the CMOs on PAGE_SIZE basis
until the whole range is done.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 19c3c631708c..63968c7740c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,30 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	if (WARN_ON(!PAGE_ALIGNED(size)))
+		return;
+
+	while (size) {
+		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					  PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
-	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	if (WARN_ON(!PAGE_ALIGNED(size)))
+		return;
+
+	while (size) {
+		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					       PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
-- 
2.48.1.711.g2feabab25a-goog


