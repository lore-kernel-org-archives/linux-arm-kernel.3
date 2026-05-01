Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE7CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYwcKF+O9BRV6I0nh/EUmrDeLL0Ut6fk04SddS0PCXg=; b=0iIn3+IQW4y7/P9f4/M7eY/Hoe
	uTX9wzo4us5rqbWYDn5g8i88RC1/vNTSX0IdQwvkjQ26W6gOGEngtbrXjbo6s27qFnHuZ9jpJaRaO
	TNfHO0CsTHjpl7mE2lkJIvW/RRixS1vaYlTOWtig7pZjjvTHb2/zEN3b3xOrFQ3Oy7Y9XzJwf7kQa
	z/xcKFiryQikHHoMglpLwUZLHIrRm7aPa8RhNUl457yVo6elcvEHeOQi13fPogzE7NmOjka8I326e
	30s+1EKSBQYZHlM9cAlSnRh7dshsfZsiT/OLEANKY42AADrepxUld85au16Dr+Gh3lEVcdW8GgjOF
	Xm7GqzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwW-00000006ep5-3Gw9;
	Fri, 01 May 2026 11:22:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwT-00000006ekx-2rFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:21:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488cc31ea57so12584645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634516; x=1778239316; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYwcKF+O9BRV6I0nh/EUmrDeLL0Ut6fk04SddS0PCXg=;
        b=N00ThzU9UbuyW+69IOrNV//BBlvsRgQyja5Y5l+OIRF23t2PgTtSyvJF2+LI1+fnU3
         i1QMGkA4aCvwzXx9Cj9vYc3Sj7SMnoOBEa/iuoFzOIZaVWUMYTeTxbxB4t97NfTSK2RH
         2RrVaRfqU4gDZF3c2p1Tf5NTksXgTLbjpDRyqJb6jd0bWVn4G88YsICBBEIW44qeBMs4
         +2DZcIdi+LdJ6E8ytmWeasW9Gf/Mmv5/P1npGLkGD7CX4Kg1YSL5LMFr29NlM8POCfyP
         DGhXLihaIZzR/y6S2yupkEL0MxjfKyYV9MnaVMRRDiOTZqWFgitSviPvqCnKeAHoF7ZK
         z8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634516; x=1778239316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYwcKF+O9BRV6I0nh/EUmrDeLL0Ut6fk04SddS0PCXg=;
        b=I9pm1gqXeOEUSFzLKkxaj+R9gTvinNCtWLdiOBZDc78g01jhHt3AJmaVpp/JZi/seO
         Vx81TkW18lcDP5Hi1kdwg4K47bhUQeASO2vQdIScnjS+T6R2CNhMUn2tDwTC6JfDSIdT
         q12IZgrHLUC0cmkdU9sZz/6S9BEzHAE0fFKhKgMu8ZRv554JNSXSZJ3sys5pWYa2uCqT
         G/AjAZuKxBTPO/f37X5dB4jsRmIsbKd1z6vIFbcYu5FWbJQzeyRO7r6iMG2y/pTfzLqs
         vB0wcXwaAz3APbkGuqifK9j20FcU9kBWuIH/xzVo89q0l//cMZ4UXlGTjZo7uQwH/3P8
         b1tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NRR+VTRLJtefQEL4XvZ/BFddsTH2Qcffmf5U70UK1c+8rL4M1z/16MvPGzSaPkvyROH2w7TA7z4Kax02tBHN0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfP4cFpsTi/AqyKL4nHkm881JFvEaD3QbVsDvyzPSlsO7r9xQy
	HoDZ6exCv9F6JAape71eenFdlsYcqWmCHmFjzv0pPaNQx4OAZViuwQ81KxXso9lff1ByOH4nYiz
	TWA==
X-Received: from wmog7.prod.google.com ([2002:a05:600c:3107:b0:488:a71c:cf48])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4594:b0:48a:52f2:a0f1
 with SMTP id 5b1f17b1804b1-48a8444fac4mr110930795e9.18.1777634515632; Fri, 01
 May 2026 04:21:55 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:47 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-5-tabba@google.com>
Subject: [PATCH v2 4/6] KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042157_755968_844AA61E 
X-CRM114-Status: GOOD (  14.67  )
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

The hypercall handlers call pkvm_refill_memcache() to top up the
hyp_vcpu memcache before invoking __pkvm_host_{share,donate}_guest().
pkvm_ownership_selftest invokes those functions directly with a
static selftest_vcpu that has an empty memcache.

Seed selftest_vcpu's memcache from the prepopulated selftest
pages, leaving the remainder for selftest_vm.pool. Required by
the memcache-sufficiency pre-check added in the following
patches.

Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 7ed96d64d611..deee7947d694 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -751,16 +751,30 @@ static struct pkvm_hyp_vcpu selftest_vcpu = {
 struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 {
 	struct hyp_page *p = hyp_virt_to_page(virt);
+	unsigned long min_pages, seeded = 0;
 	int i;
 
 	selftest_vm.kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, virt));
 
+	/*
+	 * Mirror pkvm_refill_memcache() for the share/donate pre-checks;
+	 * the selftest invokes those functions directly and would
+	 * otherwise see an empty memcache.
+	 */
+	min_pages = kvm_mmu_cache_min_pages(&selftest_vm.kvm.arch.mmu);
+
 	for (i = 0; i < pkvm_selftest_pages(); i++) {
 		if (p[i].refcount)
 			continue;
 		p[i].refcount = 1;
-		hyp_put_page(&selftest_vm.pool, hyp_page_to_virt(&p[i]));
+		if (seeded < min_pages) {
+			push_hyp_memcache(&selftest_vcpu.vcpu.arch.pkvm_memcache,
+					  hyp_page_to_virt(&p[i]), hyp_virt_to_phys);
+			seeded++;
+		} else {
+			hyp_put_page(&selftest_vm.pool, hyp_page_to_virt(&p[i]));
+		}
 	}
 
 	selftest_vm.kvm.arch.pkvm.handle = __pkvm_reserve_vm();
-- 
2.54.0.545.g6539524ca2-goog


