Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBB5C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=; b=lqcw/Ov4s+jCNMTtl292PTRHM6
	Wo/nzUwU+iJpKF3A989M6VzCVsP0le02G+vE2K7IPIiRH2DtqW1R9iQJ/ZQDEf2JBnvoZhyVFqxWF
	dgPpZA+sMUR97nNG/aHqEhNxztBiKbuj0wn/nHhlmCTiq2GwyypzxxTVcFItRHXRjbxVsGTgRo+OD
	MmnFQb1OzSd8QNhi6G/M5p2FmqJVPoVZTBNIXfMiFLlOzY4N+UdJuIEARZFTjGwxLVan9bTMxAMWz
	w5soMfEladoXlZOfTDcJyQ1qgjUnKWvbf97T/P7YUYgtwAjaSeHFiJUArTYPDG+rXFXJ2IOadhNym
	FYOcr/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55P6-0000000ACs7-43qo;
	Wed, 16 Apr 2025 16:14:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fH-0000000A4U4-1EOQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Apr 2025 15:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=; b=YcNdP12PqFn2mFOR1xRVIfIZj6
	rbZn930bh3dqHHByLNweNvl7htC5VpvQCmsqWPF5y1y7d9b/tbUvHFkahQvlj6iiA790znxJkkf2c
	sPn4CYZiezMk8AQm9LLDG91OkPmfZnudLHZIwvZ27P5Sv/oXzhKZKEmKapeLQN2Rn7bhnuFu/nl3s
	iKOCktWHpR/nQJJBegazB0WpSBN1gFxLiOVRwIjCdRhwmUvjX7nbspXHlQKzSYHx/fCx/uun4cS+j
	z2h4+8/FAfvkxvBfWgz83oaNEF/O7bjTVzt2suLyn65iGZE1kLPYZZlt4N92OqWMMbaiojulJTe1E
	AKawndmg==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u54fE-0000000A7fV-2HZQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:27:02 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so80008366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817217; x=1745422017; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=;
        b=Dtd8WBxA6q2wEzh86luH6HtQSavEuH+0CqLEchFyIaQqnZ3ifzQmYd8LhhdS4sDGwz
         3TIlPHBFP8GMDzBaB3JSJcrUby7AGEe/1tddFzpJ6fi7DtHOYQ6PMBXYtQvvpE1fJ2Or
         czTqJc6BqQ7AZDAR16vtRrtlPIgY0K1fCWXrn12uLwuVNvFDg0e11JueEI+LbNvOJY9x
         xy3/rPbniHvNdJHHpSDJD7oZl9ncDMc8iURLbBdXZXCiBN/ijv5q8EdfUH2reKqlnVf/
         YByhanG7Vwl3Vhc1v+RBsSxZVuYgUrMHRLnX9MMtNJRaLT+mLMAYYQfvMyKpFidVN5W/
         NIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817217; x=1745422017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=;
        b=fHjB+cHElhUA7rs/xu6n77/1/bRaNfnFUIT03pwHAfTqW62UwJhXQ4hb7q0DshmJa/
         dDytEJfzQJ1J1FDylpB8EJczSEfcY38e/k3OCieldT2/bTaE2NbOPdzClHZBkuoaqJF0
         ARZX6nqbfQ7Lg/12an82okkRhTgfLJevduCMmOky8R3KLLKH9mvqVv429VQbJKUt3RP2
         8Hw3e6AAw5nnSHPUz6AQGI06tZL+tys+a2YVfkyFIBsJn9Jq5OD0g9ih/SCKw4oeT25I
         us1N0mlQDfq8xkFA9fdGeHqPgqY9bae5CM6SGOG0hnq5I97g9J0jHFK1O7PTyQ4D4LJX
         6y8g==
X-Forwarded-Encrypted: i=1; AJvYcCXclml023MUtqR594J0TO0xk6l1YOsViSL08UhdniclCplu/VUwleVsOWwvs5AHWeA5sytOOXiCBR3UuwI0lLea@lists.infradead.org
X-Gm-Message-State: AOJu0Yy62XXnAjKBDFEebX9ICgF997X/AVTUMfePnknkICEfzbQJi2iI
	eVkQ9dWsYtI6mdvv4HtaE+3Oy9fbY7rkQwDN5FUG849PDyADj2SLsIW+XAu7EwmQNKWdJ0lmFlv
	x5Lod+A==
X-Google-Smtp-Source: AGHT+IEoG2AXXZ1tWBUhjh5KrFg0jiFxDBUl8QZtd9ikeeeP7z6vejMB73nvwGYxLNaTouC7ucA8ZutxaU7j
X-Received: from ediq14.prod.google.com ([2002:a50:cc8e:0:b0:5e6:e69f:4a7f])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:34cb:b0:5e5:3643:c8b5
 with SMTP id 4fb4d7f45d1cf-5f4b75c8c33mr1934847a12.30.1744817217576; Wed, 16
 Apr 2025 08:26:57 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:43 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-4-qperret@google.com>
Subject: [PATCH v2 3/7] KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_162700_703234_C8C84CF4 
X-CRM114-Status: GOOD (  12.60  )
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

The page ownership state encoded as 0b11 is currently considered
reserved for future use, and PKVM_NOPAGE uses bit 2. In order to
simplify the relocation of the hyp ownership state into the
vmemmap in later patches, let's use the 'reserved' encoding for
the PKVM_NOPAGE state. The struct hyp_page layout isn't guaranteed
stable at all, so there is no real reason to have 'reserved' encodings.

No functional changes intended.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 178028172c0b..bf28f9f9de65 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -23,7 +23,6 @@ enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
 	PKVM_PAGE_SHARED_OWNED		= BIT(0),
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
 
 	/*
 	 * 'Meta-states' are not stored directly in PTE SW bits for hyp and
@@ -31,9 +30,8 @@ enum pkvm_page_state {
 	 * entries). For the host, meta-states are stored directly in the
 	 * struct hyp_page.
 	 */
-	PKVM_NOPAGE			= BIT(2),
+	PKVM_NOPAGE			= BIT(0) | BIT(1),
 };
-#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
-- 
2.49.0.604.gff1f9ca942-goog


