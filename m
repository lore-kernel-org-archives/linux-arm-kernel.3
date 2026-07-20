Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943ADC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4di4LOaQ0A+3KcJ0AQoWnaq05/jwn7QirA2DB77Ss6c=; b=4jCqXyzcBXxkvnYwSZmlLNroLg
	PxC86n/mc4rgFe1hNqHFswxTA7SqwOwvYNoWTHX1+6MM+jZfWyQQhhqvEq2UWvvYLVAwIk8Mstf4/
	bryUz/NMIgMAJQ6zRy3PDzLq5t1oXOdNpkIqT6q/6sHSvzpOchH9JVwnDChm4fxqp4RBYFPfqIgNF
	H9OgRf7LegLmy68KqhU4hxZ/suNABFoCqwgiaA0no73veywlkDxiDr+AzrL7LGXH8zlQfDhkAwWbh
	pdyzSY35k9wNelVuk2nyRhbb+kqVAcxu6m1dRuHWJMcKBGGewIcV8ELQuDEMjdfQB3Yx+ws+yoMdS
	Gtm+7NKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrab-00000007UsY-1Jp0;
	Mon, 20 Jul 2026 17:15:37 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraP-00000007Ui5-1WjC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:27 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4955edc851aso6023325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567720; x=1785172520; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4di4LOaQ0A+3KcJ0AQoWnaq05/jwn7QirA2DB77Ss6c=;
        b=ppUxaLn3qyzy9zK0G6iFu3yI5mi44ACwT6lmkyqXRW7sdH1JyhD3zJ2mBK403XriA5
         g66QFpbHpF06yk6W51iZGpwK9/NivnLw8AIk9OSQzgZhr0raDNv7DbNPRyAF2O09I4+u
         WfQRA3EGwXV8kdzyWsearcD/ogMS2N34fp7BIjsFZmECdEiivLj3+Y6xJiPv+AqETp2N
         3smlSNvJz2BCVtDr+R/KpGxLR/gp+2gNEU+/eV6i9vvhYFhwKFsgFca1Wm+mW5CdCx/v
         h2ZQBIgRoKHKLpvtMPCyKRR4syNBkk7iyGYlMGwUF7eo9SlAIAvaA4cvnUFxCI0TYXcT
         8N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567720; x=1785172520;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4di4LOaQ0A+3KcJ0AQoWnaq05/jwn7QirA2DB77Ss6c=;
        b=IFBcMmpVktzcqDhYyVc1IKPKqfBXGW0+/GRWcrFaMfdOcpBeRWPZtxy20Vpf1bOZ6c
         7fLYUQKoiTt87uBXuAw3e0Fxji8GdE5F/AfmSCYjoTGDxRjXbSqeds4EvmAb0VKt45o7
         VQbUM2j6r1aJeHFAmV4XoXogpMu9S3vcQyx2GIhn64T0GHPSILbAJsr1jo95LbcS5Vr1
         kCO1FNphnTcJF49m+NSEdmM8z8Ngl+HMbSL+MneyWnpMce5nnC8l5OjiKsm7vaGNv7vD
         wvICwKrpnOWPLam2nKaINjHFVxhtMr93DWmbKF0yv/xqBWV4h1iVt9MRYWpSk5Dzc3KN
         VdGg==
X-Forwarded-Encrypted: i=1; AHgh+RpyfXOsCH+KKG65A4Kt2Kb7GdaPI5olhLmUv6eSNTnNaJawCR1fFVJJSGk95vcWxOsPk3WYNagPfdpddQagKgqN@lists.infradead.org
X-Gm-Message-State: AOJu0YwbNasawy8ceTiU8lzU5e20V7pmtAvB8X8iTmyKeUIWvZikNAJj
	oQ61d7HEoMI7m+J+CoobIjqBaw2wCXHT9fDoVO1sWIfkgEadiO7SMGmRfSHBLN1ofJJWR9j/O5K
	eVlOELyygGx69FbpYi8PUGw==
X-Received: from wmcq16.prod.google.com ([2002:a05:600c:c110:b0:495:43e1:542c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6d82:b0:495:4072:4194 with SMTP id 5b1f17b1804b1-4954a40c4acmr115784495e9.28.1784567720395;
 Mon, 20 Jul 2026 10:15:20 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:14:58 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-3-vdonnefort@google.com>
Subject: [PATCH v3 02/17] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101526_314274_4A4979B0 
X-CRM114-Status: UNSURE (   7.90  )
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

Add the counterpart to pkvm_create_mappings(), allowing previously
mapped ranges to be removed. This will be useful for the upcoming pKVM
heap allocator to manage its private mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 85f1e3c711d9..00cadd13ee5d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -25,6 +25,7 @@ int hyp_back_vmemmap(phys_addr_t back);
 int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
 int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
+void pkvm_remove_mappings(void *from, void *to);
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 8b8c9d3dc82a..5cd2f1fe51e4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -157,6 +157,19 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+	WARN_ON(from > to);
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.55.0.229.g6434b31f56-goog


