Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2A1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nP/0ASv3gZv6Dq4JFLJ6V0xk++r2sqgnKrNUADZ27XI=; b=Xd4r9PEB0JQ/qxx7dLFrZS5F3o
	pVBugpky7CX2Zem/WNyiNOvUpGTgI1pcNiC1adF6cImcAktePfeu38OoGjk8pf3c8Nv1tplKZdJjk
	OO6+ou6sgUPV6FJUjECyg2DQK6B/JXSaMaXcTRm0LebnRgdLEJpuhbNyM2jlS2dGmSA4eZz6jTJoG
	67czTaInOmnpxykP/uBgg2RvMZEIzWxiUOpf8a/kR2ntNRNuybAHGYiOivH7WZSmmmkpsjDpZQ5gd
	XSoD5YEzUPXSzr9LCNjZsK3lWE26ajYepvjlKb54ppc06tUWZrBn+0eP0QojqCIL7doDQnAAgRtpM
	yths3rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRuY-00000005pq6-3S80;
	Thu, 27 Feb 2025 00:37:58 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRq2-00000005orU-1x35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:19 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so34139666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616397; x=1741221197; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nP/0ASv3gZv6Dq4JFLJ6V0xk++r2sqgnKrNUADZ27XI=;
        b=hsX3QLe3XLmmsNOkKNYN4fzdIKDhAi+pujA/SeaSM2Zq9Yy5qoKfGNS0G7vTlNveHP
         5wEGPyDBeQcnRdRhTB1C4zrJM2PUEJ5fGBFxuxTkuvKAxaV8G0jLzvB369F4ph9SF/E2
         aHtYecUAABI0iCIbAuztQHyaxGkU/MTQjLMcb8BX91PP3CEXgLIO37BbgXXINMRtQ8Kr
         tMCddkyoib5XtT/j0dO3b9SABIGg75Vx/510MLEUx6iFJDm/r/0T3yxBgYgOamBMZID2
         TnIvju9E46qQK820/zQDZq2mc+sJxpqk7xiSlrogVL092hMvKdSFAEuUINdz1Ud6Co/f
         veoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616397; x=1741221197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nP/0ASv3gZv6Dq4JFLJ6V0xk++r2sqgnKrNUADZ27XI=;
        b=XA+lS6adg75ytGiKnt13Dyp0S9Ob5pQT4glHUN63wuvBONCf9jZzvVbFaIYSXn2qMn
         kNSWyULB3A9Z1p9fgQO1KTBNIX0qVQ20bUQXPqIwrw2M564Eqx5ltKb/9VkrFONAtO2x
         9bjqsSHiyF1bBTLTnunP1350a5bC9EwqwKqUf1C+UY/69PFYSWULFvv+0oL1czygpjy0
         UW2onyOOZVp/tXKlWqHNBSWih8Sc2G58qn4t96Pm6zfVQhjSZ7kilaJYgE4+wugBlFmc
         XNIEWPcdqv3Wq+l59gleCID9JA6ZWAF9FHtMaWCdjO3E6SJrOnMTyBCJlhjSiH8wWu5G
         RVrw==
X-Forwarded-Encrypted: i=1; AJvYcCW4xl+xjLth6w7536C33QoZxhg0NPIqUCvGTkBsfHsbjmETTXjps3ewpnEJ8cbtLqbQycHTs7LtUO4E83cuBYxh@lists.infradead.org
X-Gm-Message-State: AOJu0YxO1C7b1OVK7hwcXLpWS5Q0gSGglxxhPTXZxene29pJKJwUru0a
	x3Sx2od1KpfgQr2WZNZRxxKFKquvwi2bbhWXXcgDQPKYNpGAKeI+q1BNelr3itgr9AG/7QDgrnN
	Zz3AwCQ==
X-Google-Smtp-Source: AGHT+IG1YIW+GqBALCieMnU4BqI9X9ToFAuUlbxFKvAcEIATQsa5h/n36+QHjYaFBr4TgnPvu4HEXBtbRBDi
X-Received: from ejcrr23.prod.google.com ([2002:a17:907:8997:b0:abb:9ace:21a3])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7841:b0:aa6:5eae:7ece
 with SMTP id a640c23a62f3a-abed10179f1mr945776366b.43.1740616396839; Wed, 26
 Feb 2025 16:33:16 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:06 +0000
In-Reply-To: <20250227003310.367350-1-qperret@google.com>
Mime-Version: 1.0
References: <20250227003310.367350-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-3-qperret@google.com>
Subject: [PATCH 2/6] KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163318_502599_C70ABF0A 
X-CRM114-Status: GOOD (  13.22  )
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

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 34233d586060..642b5e05fe77 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -13,18 +13,15 @@
  *   01: The page is owned by the page-table owner, but is shared
  *       with another entity.
  *   10: The page is shared with, but not owned by the page-table owner.
- *   11: Reserved for future use (lending).
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
 	PKVM_PAGE_SHARED_OWNED		= BIT(0),
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
 
 	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE			= BIT(2),
+	PKVM_NOPAGE			= BIT(0) | BIT(1),
 };
-#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
-- 
2.48.1.658.g4767266eb4-goog


