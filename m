Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2894E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqJAm+kSytYxVvAYW4fxQLPPZZDbz/LJCZvGfh8JEeM=; b=0SPNxIBHCmZcmisJgxqn6iMctg
	XlrnyLu2hmzXS1t18wPPKfmS+y521sMkWenuBeYteRYLS8wsa4mEe28euT8YVTL1/gO+SwFCK73eA
	I31tcrIwYLfSFFwaIJ76R6cbbUtYKuh77Y71XaZrTCLMNWjqjOrnQxKnNofBRk16PBMqMHPDiRtqU
	3hIeIHYqrZTAmKtCWvl/etSGn8k39SOHxltkinEsiuRbg6ZrMdwnBQcsBtTqL/yCqzfBibs3RI6Nl
	FVSPfwT7xm3vfpnXfz5KuXk2tPFCfHVYnxBsIDGbMMt7hdi3LeTdapVx3+C/ZmWsjvS2sj/D0TZ2E
	oSiJkMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQJk-000000096Ef-3CTI;
	Tue, 03 Dec 2024 10:39:44 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHl-000000095W3-1v3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:42 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d0cfaab94bso2236968a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222259; x=1733827059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJAm+kSytYxVvAYW4fxQLPPZZDbz/LJCZvGfh8JEeM=;
        b=FNchEBCAdD6h6+/c6T0cnU9fW8so0c4zX1bucWwoH0zwCzQhl6s0a6/9ICBktnu7I9
         JM1kwWC0TxaL901xgATZ383L7QO18VYWlAZ/UHOU42ekS9JP9ZwtEoUwWttrFy/wkPSJ
         Sjg9VoX55WPyEdbqPYme63qTkWZjU7pOWNlSI44Vd7xNGAnEQO9Ec6V3HjWv9CzHHKkJ
         J3X8ee/y5qXg2zAo6cVZ73Ua9RHlTYkCMRMC8EI+VBdArqEwh1T+79DmdnEAMD4cQ3XS
         9y4kLzZR0yu/NcdxisAqzYUZa/PiOQeaZRryZjWIc9Vu/neS/mKVEAnj+imNfUV8sNOz
         XmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222259; x=1733827059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJAm+kSytYxVvAYW4fxQLPPZZDbz/LJCZvGfh8JEeM=;
        b=OlPok2y+O1x87v3ZsbFnezrQiiAoOBrO1L/21+Kf6dZlWxZfAmRou19aPG60iHvSTd
         s9Ow7iQ/ybwvIOxNZeLp0r0jWSg8iuDlSjrwaol0KXZEzcFuR/QVtEc+tSByoOD23LtC
         Z+Uve/Xnvb+0053FoEy8tM/ZdQqwGXhdgJ5Xrqh4RigYFLyAx9PNT+M1CuYFogL86PpS
         bCFEIQ9XN/ne3ooeUq65apckPxyPvyHAPYdJFrFsgtpVfbTVVZOiruZkKYSX/Pe6V4Vj
         dau1OyD6hdg7CQxyZNwJbbUQnXSH6+yJHAYcAWaDruO5SgqTkhKOGv+3ugrFFDhsVX8x
         Tyrg==
X-Forwarded-Encrypted: i=1; AJvYcCU3OWYn2yUhwa6PGcVQjfBmaAPe03vhbee3KSudGP+vJ/bW5vn+3r8VF2YsyXAtRfIe3JMbkIPIWR+4M9NUZz9Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwMxBqLFkEckiZOgKs65g7p9jiMyYZAhIOdKu/CRTOeNbgNwoto
	kEDqQ1TeX6PYS6W/q6FqYp7VI/e2nblfW3B+Uc/FkOCG+FJ0DzYHuCsAuCRWYPs9RKMK/hbHAvt
	3esCmFA==
X-Google-Smtp-Source: AGHT+IEEJ7rK/bdiM0bZrA50MGLa30le76F10afOeSti4NHKLxb/Hx80hARIZU6bFlY0t7qoOHZgeSespPMG
X-Received: from edb10.prod.google.com ([2002:a05:6402:238a:b0:5d0:d98a:2511])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5186:b0:5d0:214b:9343
 with SMTP id 4fb4d7f45d1cf-5d10cb4f1fcmr1754647a12.4.1733222259494; Tue, 03
 Dec 2024 02:37:39 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:18 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-2-qperret@google.com>
Subject: [PATCH v2 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023741_494856_168571DD 
X-CRM114-Status: GOOD (  11.61  )
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

The 'concrete' (a.k.a non-meta) page states are currently encoded using
software bits in PTEs. For performance reasons, the abstract
pkvm_page_state enum uses the same bits to encode these states as that
makes conversions from and to PTEs easy.

In order to prepare the ground for moving the 'concrete' state storage
to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
purpose.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 0972faccc2af..ca3177481b78 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -24,25 +24,28 @@
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
-	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
-	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
-	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
-					  KVM_PGTABLE_PROT_SW1,
+	PKVM_PAGE_SHARED_OWNED		= BIT(0),
+	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
+	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
 
 	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE,
+	PKVM_NOPAGE			= BIT(2),
 };
+#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
 						 enum pkvm_page_state state)
 {
-	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
+	BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
+	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
+	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
+	return prot;
 }
 
 static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
 {
-	return prot & PKVM_PAGE_STATE_PROT_MASK;
+	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
 }
 
 struct host_mmu {
-- 
2.47.0.338.g60cca15819-goog


