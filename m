Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3F6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yY1niH8bXpIvQxfdtYMW2hEB9nSt1maMeFqvo9y07nE=; b=Qoq/lGSbv85rpOrJrY2dex0zZi
	9L9xVYF0Gt0qPnrtAXlBpkNCDF6Tu4G/xCbsnC+6Zc6v5ZJH8+dsHpp4Yk9PUf+PxUlYMgbWQ8JMU
	eDNtQkBcD7iQ02N1JRmbSIk1h3GsFdgkRm4AUnV0ysWcvgJeB9GJDI546yL6av+0qHXXFBYYI3oLq
	77qJ1oLSO3zawjb8r6MTtrwKgJB8oLYun1Jpyai6sz8IdSSpHHv+eTFnQ5sIIHUOF7yL1sVFmIGnE
	jUYlu4J4fAe5e5p7cIE2uOgGbnoFDLCupm+efAM2C7Hjs6320dd1J3rI9SweSzP12nFFeMzK/jWlF
	X1n+zDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiblo-0000000BgnR-2gJj;
	Thu, 13 Feb 2025 16:08:56 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibGF-0000000BZ0p-2ydJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:36:20 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ab39f65dc10so126026666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739460977; x=1740065777; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yY1niH8bXpIvQxfdtYMW2hEB9nSt1maMeFqvo9y07nE=;
        b=xZU6uhjNLy7ucU+8XEyR3XIfUW/bPfpPd/oRIgO/NgKTBmUlkd6RzUWTncfNNXjvcF
         iiXS16j6lZOwqAWo1XkxT4S3PPeHuMqvbrG3rIysD8oHbRiCtOG/FV2+rELBngLsP7z8
         Z8C2jREfmNBfuVWhXum1+Paz3O9+OP8dNr+eMZGpP4ysVKOERbmrKohydr+G9b3s+dY+
         9FNV46TnFIVKl2nhM9pQlD+RhLfiIntfXn24wEVf7XpcDq+9s3kmQ0ThRbSyM/AtIzdC
         fZNhGVQEpDsL628NLAzpjRY9x+iyTqQPCQUt139EQPHk3DR4yFPIqJGd8kTkGMzbsCJA
         pfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460977; x=1740065777;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY1niH8bXpIvQxfdtYMW2hEB9nSt1maMeFqvo9y07nE=;
        b=Tt/xDMX6qtoMWrKDfgSKct0raJr8B0NRygWSvXQdJ0Or2q0vtzZc4m21m2nzb68/t3
         fG+duADDm5M3Vypl+CxjtVWdMUPP2RQB7JCBdgMZ3HoE4//fBH+/X7Q46qJHxQEegIrr
         1HhOqK08mCIJ5iKDD0i7LHVF1R8+OmVV4/WKsjQHwKAJrSKHv4TpmPqh4kZVOiLUM/U8
         fV23B79/YloBHk2/WH2ZztNoRrOlHBXIuKOGmd5fHzg+iChrBIlFD+LRQRC9clsgM+4e
         SGG/t3MGlSh0XcDPHbkirIu6jzXZYx+ZPpCKmMWvNYifX24uCnH0frsdVzbWWbOsnlOI
         Hclg==
X-Forwarded-Encrypted: i=1; AJvYcCXODmRNSVbfSrFaRWkSBajDn34SVOAgM/ErfQBWu6XWO4wA0NBjOwu2THiXlOreGbOa4tMiFAZbMFbRQ5yNekOf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo+ZcHcVx5ClBxdV2aSWkBfO6mGzbCm6cL2Y2f1alVcmOazzd2
	y+jtziKy1EocpzhXscuVeCZ+SIOQaGg61XPw0jWY3fMGQerypa9c6bzlAtbVj7ffLMQTdD0Uosk
	20/CceQ==
X-Google-Smtp-Source: AGHT+IGNnBpl+X2qDDZkAqsl1W2uWg0qrWcC8MQ3Hvm0c9bsOTfUcxx6R0kvEkmQWiyS31Y+rdhEd3ntyWG8
X-Received: from ejkk8.prod.google.com ([2002:a17:906:32c8:b0:ab7:bfda:26f5])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:730f:b0:aae:fd36:f511
 with SMTP id a640c23a62f3a-aba501a9d85mr376452566b.47.1739460976992; Thu, 13
 Feb 2025 07:36:16 -0800 (PST)
Date: Thu, 13 Feb 2025 15:36:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250213153615.3642515-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Fix alignment of kvm_hyp_memcache allocations
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Keir Fraser <keirf@google.com>, Ben Simner <ben.simner@cl.cam.ac.uk>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073619_750230_D6098645 
X-CRM114-Status: GOOD (  11.77  )
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

When allocating guest stage-2 page-table pages at EL2, pKVM can consume
pages from the host-provided kvm_hyp_memcache. As pgtable.c expects
zeroed pages, guest_s2_zalloc_page() actively implements this zeroing
with a PAGE_SIZE memset. Unfortunately, we don't check the page
alignment of the host-provided address before doing so, which could
lead to the memset overrunning the page if the host was malicious.

Fix this by simply force-aligning all kvm_hyp_memcache allocations to
page boundaries.

Fixes: 60dfe093ec13 ("KVM: arm64: Instantiate guest stage-2 page-tables at EL2")
Reported-by: Ben Simner <ben.simner@cl.cam.ac.uk>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..d9db6dfbad09 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -100,7 +100,7 @@ static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
 static inline void *pop_hyp_memcache(struct kvm_hyp_memcache *mc,
 				     void *(*to_va)(phys_addr_t phys))
 {
-	phys_addr_t *p = to_va(mc->head);
+	phys_addr_t *p = to_va(mc->head & PAGE_MASK);
 
 	if (!mc->nr_pages)
 		return NULL;
-- 
2.48.1.502.g6dc24dfdaf-goog


