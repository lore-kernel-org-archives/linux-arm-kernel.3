Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DF9C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/CZYwUqsZsC4WZkgw4eFBh78uOJi0Jsf+zut7EQDaI=; b=0erCxjV1zsAvjiKAAYr5Nfwn53
	sKdjbqc2L+TjfBJoigwgxOcLjhAHNenXxGAx50AzGlYxMWz+F0aR/hdv9W29Pi7xtOqOzAoEbnRJZ
	AYA3aF9j/j60ixcBl/mEQOfisnpiau2xl40n5o752tzQ31cGx/1zORHTzYrlNM71l1yLYgSvsk7LM
	CDz0IGWEpsJWj7apc4+Ed9/rndCYwxngke5SVZdYfrAMBULZvLfhpwXTiaRsT8Jj2jk6hwC1DtGvn
	/I2qLsChNGLNVTgExIe3EZ/jkC2jSi0ajrZN04m/ChQt48HQL45yY9agy0ZzxEMcWVmH+nBcrShFw
	INInengg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLZ-0000000Cjhl-3V0r;
	Fri, 31 Jul 2026 14:36:25 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLJ-0000000CjXi-339M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:15 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c15fed5653eso80716366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508567; x=1786113367; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/CZYwUqsZsC4WZkgw4eFBh78uOJi0Jsf+zut7EQDaI=;
        b=wLmcaOTsSXSwgZc4dp+frhRk6I8HbEuoc6Gek8penRWGG7zbtZs/CAnIfaKNe1w+Fs
         RXg8U9oLx9ZDKyfZfkRYUzemia46Cf3eL7w3CFoQPQ68RNCeMi9XaRFBMjHIIiUHiRar
         e4As9Qae5VeSrIBiqh/Iu+S4TK3KpLK8fBUZAm2UqASeA8yfabpPDGU7GRFmFue50J/R
         upd6lzEBKVYTQ0TeCxWVa87k9dlBDSCYXj883prExRmgAaR1POVSCOGetlXsLCtmCSLb
         9ljz/X6093A9dBiHH8Fxje4EYPIjB8jwqlVLURIfS7J6aJ6VvRMWg5l2QjMADTlcX6WS
         zoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508567; x=1786113367;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/CZYwUqsZsC4WZkgw4eFBh78uOJi0Jsf+zut7EQDaI=;
        b=RCFpOBzYnZn3WRAaB4TjNuT+9u+ZqEi6yQj2ydPbK0LwFfIvL57IhRLdnExyx42UAX
         aUJGJO9TQ9Ws46Jdb1DnHFT/CfxJ8yjDSdkndovsROf6fPTVXxv6khLVYXxbf0GdVwMY
         81nK/NV2l8pevRIzJx66EqNnkkKUMxVJZ6z4NNJCTAcZCVSvg87tKlxpwreS0V4D6ep5
         ECz7ORCMlqhwRXAUjsL5w5vXkUYDzq9HIHvIdCNqGdmzGQth6nwButYzu+i7zvuL7LUY
         NSLrmpHNA2KscWa70bFbbQcKYhZelnF8VNDuAWvPBenR54IXmEtTBLZAp/ZxvPHCm7It
         y/9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrpJVtg4IexnAYRQi7kYN4oV3VQ7aoQ4wehvy64/i4hhS1ZBGOIQ5U2gYCdXp2BpXXnlzzcLW6qCi6ccKUNq6sT@lists.infradead.org
X-Gm-Message-State: AOJu0YyyWJZRC+3Pqu/Pdz3Xl3RfHMVGnlJKDl66nn+zMwvEAeTumyGE
	n7ix+1Iq2Glvu1GXTebPosKuss853pKLaxKIDJabXaeRnnTF9abVc9nZPQOuWMwOwOApdnDVrwO
	q31hDYShAOQoYy7zQVqxLnQ==
X-Received: from wmqg13.prod.google.com ([2002:a05:600c:4ecd:b0:495:5422:15f2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d09:b0:c12:67d2:3d67 with SMTP id a640c23a62f3a-c1fd28aeba8mr131003566b.45.1785508567274;
 Fri, 31 Jul 2026 07:36:07 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:35 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-12-vdonnefort@google.com>
Subject: [PATCH v4 11/17] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073609_775851_1F3903D1 
X-CRM114-Status: GOOD (  10.18  )
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
index 6eae7e7e2a68..d60e5f2de10c 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (!is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.55.0.508.g3f0d502094-goog


