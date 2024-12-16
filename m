Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6141E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd1/ZR7yY7ReH6NCWgcpm0z1q63UQhmB9TeGY0t0ioU=; b=uXiSNmuVWcZYR2NIkv2rsbJTxB
	aC4R4L3aaU6A8o5KSeRr8BO1sOP9Sm+Vm2WVPnnnnXf+7T/NW7JIRdePBoeQmVCbY85HIBGF/Mz24
	Qc2749Tk0UtWYIpX6icoutjvVsEnaLEoCNSHKFMbaKLT/Tp3wC9AcsUNg/b4UllN/7BkbI/65gSnq
	4ccrlCmR/M64ZcrCMBGdIyCmRu+3MhoyjdwvaVLOLvAB1wdn3JbqrpoeyAG+Vq/ewzH/1n/Ay/GqQ
	5dy1Lf1UeOEKYZduNhHOsKW8t6KC4rc4CrWBGG+zF7nQhSDeN1DTJqMwveu2ZSX/VptzjRfCaVJ8B
	RrrKVTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFW5-0000000Au2d-2AOi;
	Mon, 16 Dec 2024 18:08:25 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMN-0000000Aqxy-1N2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:25 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d3eceb9fe8so1856430a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371901; x=1734976701; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qd1/ZR7yY7ReH6NCWgcpm0z1q63UQhmB9TeGY0t0ioU=;
        b=xnQcopw75O+ZS8sTSJu1H3rs9rLC4L9XZYskXmz0b4HbAzX7ZQaQzkwEa/5BBconmc
         tHurqH6ZblSsZIfTxpqEOM3iDQoWKYkFEP4tahrRytA+aP7deRbPqStwro1naz7Op58z
         PtfQ1aFZ4ZXkU7Prj/9R8RsEYpZaIA45vEviKTar8yyKtVAmtAhtCeueISgILLdRceWs
         2UnboV8wAfko+jpZ60q5xp2MZke1tRfAArCamAtWWwMlryPmVxi+jy9+0Z78vbw8h2rw
         OfkXq7BWPCnEMjhw22lC7K4F77OM0QY3JlsFh8egQoC3PbPGS4AwReEW5iGwt8s/i01y
         1YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371901; x=1734976701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qd1/ZR7yY7ReH6NCWgcpm0z1q63UQhmB9TeGY0t0ioU=;
        b=ZnDQIGjI1qzCpWFn5HUj+hOvVn7gtXWeCo0Z2QcXuSRGUWIxwQn922fBwhFjYcTB/d
         enzBmx2BxQsi89bvKyTE6avWhMMTFDIDPsT8gIFws/WGSGt2hyhSNLbAMsVzIdruVTak
         O8mDRg9SP/YACHjkyAFzxPT0bjekljmk4eVFuS1Rgfq50eB6XkipVyb5z6EL+/+5Ikha
         bDNAOq2yg97OqZkhiuA5NnMlRVMZtvEgG+/4jeOgxdPn+YXRpueunHRir+ZZ4e1xPk+U
         zsnp6UAGMRgoCBiZxFAzcXlHb+C3bfWKviK8ltpS4JSGbG1b9X0o4gQSTRUH7ncBtgiI
         JBHA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFOpj05sc4VA/23+iYzkxvPMLLzmeNAzQbfGFW2gMTURlAoeJ6Zm7zWCbFfrhcYZKq2LuH+Jf107AxnLa5t+x@lists.infradead.org
X-Gm-Message-State: AOJu0Ywygtwb6twyF4qAsB0WuZOlj4VwHtgSPqN7Z5hec4mxO6D4pXjQ
	uKowJeFFALQ/jzww495Gimv2Hs70vWSjCMgs/aRXfNOkOApkizQqqLpp5AFMGUhoOe4BSf7ot3I
	0ngNNbw==
X-Google-Smtp-Source: AGHT+IEZAZq2KaUjkxJv0f3RrehRlI6rnfYsshuZuD5/X0wPwG8guYjpqgqhcPwLPFFRfZ50xXtdhX2JySHz
X-Received: from edyv15.prod.google.com ([2002:a05:6402:184f:b0:5d0:1fec:60a3])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:270f:b0:5d0:bcdd:ffa8
 with SMTP id 4fb4d7f45d1cf-5d63c2e7bcdmr11529217a12.1.1734371900235; Mon, 16
 Dec 2024 09:58:20 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:52 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-8-qperret@google.com>
Subject: [PATCH v3 07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a static
 inline function
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
X-CRM114-CacheID: sfid-20241216_095823_365976_A673060C 
X-CRM114-Status: GOOD (  10.03  )
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

Turn kvm_pgtable_stage2_init() into a static inline function instead of
a macro. This will allow the usage of typeof() on it later on.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index c2f4149283ef..04418b5e3004 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -526,8 +526,11 @@ int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      enum kvm_pgtable_stage2_flags flags,
 			      kvm_pgtable_force_pte_cb_t force_pte_cb);
 
-#define kvm_pgtable_stage2_init(pgt, mmu, mm_ops) \
-	__kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL)
+static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
+					  struct kvm_pgtable_mm_ops *mm_ops)
+{
+	return __kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL);
+}
 
 /**
  * kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
-- 
2.47.1.613.gc27f4b7a9f-goog


