Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA72BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRpBPCfFRyioPG8rK+sBd/OfEwOTtyraMttaVaNP7UE=; b=lJ44tN3ce7Jho4M7pEOfYGRENc
	NMoGw9tTYnxeQJZM4oeY2EW0cWpyHsUowiHJelF0GTknftEy5mr0Yb0gvXt9r/F3LmSeEL05taGQc
	o/2JP3E6M+JyNVE8j6nP2SEA9WShjtE3qdAPp5f3YF9nclwUN3z63yLFQJeRn1SgDhUbheDbU8Kh2
	2xFr6qxBhkyipBPeGOahZNXAsvSopv+o0X8BJcmXOo/EN8XRkxZ6v6gYrCo+q9CkoF0XmdZjwuwEM
	AcPQ9k7GDZv6Key0gkrusRwDfD1mrgq1O8ULS+EgOjnY8u4nPpgC0lDml6D9MEAiLnihksHwy4Ags
	+ESruIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWZ-0000000DFc7-38HX;
	Mon, 06 Jul 2026 17:54:31 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWV-0000000DFYu-40vZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-470cb859d96so1707929f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360466; x=1783965266; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRpBPCfFRyioPG8rK+sBd/OfEwOTtyraMttaVaNP7UE=;
        b=CECLo1J+w6xKRBURIAVcSlbScnHDk+twCoOWfNVBKvSqvMPilbi2jCa39Jhw1q5hFJ
         uAwSLBGaPfvjjvRmPCBo8N1Byk8U0H/OmI2UCGySfHOJmhbwnE5Dmugv3h1ItiRk5DMQ
         CbH2P11AStWvx+8GWiV1670fYl1IesLtUHqns7kvVJKXPFHQcfqliPk0vHqj/2gQrDBc
         XWLaVAt36Cvx7f8FksvGBwpwhlQ4/6oFgvVKwhGV332M92sNhnHOxNJ1TSXI4rmhEpXy
         xIm8uz/Kc3V0MUywPwTybOb2ZC5dczwr2RY8eM/IirID8irZMADqfdZ37wqvvl7/EpKg
         Hn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360466; x=1783965266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRpBPCfFRyioPG8rK+sBd/OfEwOTtyraMttaVaNP7UE=;
        b=CzTgtOQskvZuGcDE7j47+utDxWKxB8n3c6sbSP1NpiSH9Qs5mvZkEF0Dj1n3nrlsN1
         8cbIeCGdD/UlUKQHxAW508U5lFie2nNR7TqBVhqF6MX+iiClzo72BehTcBRFKcFiR5JG
         i4aDteXHs4Gf8zL6Hn5W0emip1KHMZHPfmTijiHdO+KLaELXLtYhAs+3KXWVFKM3Xpxr
         Zpaj+fBoD74OxrCNGSaOcOwnvSzZse5YLQ9/40lcq9szk2bTPuGIblPLHwAuSP5NvK97
         wUHMpbjsQ80dW0AehOn+Hdd4LviAx3sUiX4WlauZii/+Q25GPW7hTbGnToFx978SQmTF
         er5A==
X-Gm-Message-State: AOJu0YwCsHUeGVl8wELqjlIVRBzPIY9AC2ABG1N8I5QGekaPO35OP0VX
	/EYbjMhvgqZP8wOrq4fzIcjjT5EMwloB6YB5wQilqGreCa9jjkVI4AQt7rt9aWdc7vI5IF1MwkS
	YjKbm7/3VJSrqjo5qoHjl8Q==
X-Received: from wrbdj18.prod.google.com ([2002:a05:6000:b12:b0:45e:f31a:842f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c2:b0:475:f0f0:9ec6 with SMTP id ffacd0b85a97d-47de6718117mr1506948f8f.49.1783360465417;
 Mon, 06 Jul 2026 10:54:25 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:00 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-4-vdonnefort@google.com>
Subject: [PATCH v2 03/18] KVM: arm64: Add __hyp_allocator_map for the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105428_024320_1E63F55D 
X-CRM114-Status: UNSURE (   7.94  )
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

In preparation for the pKVM heap allocator, introduce __hyp_allocator_map()
to map a single physical page to a given virtual address in the hypervisor
stage-1 page-table.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 725bb0fb941d..98a7774b541c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -32,5 +32,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
 phys_addr_t __pkvm_private_range_pa(void *va);
+int __hyp_allocator_map(void *va, phys_addr_t phys);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ec59da1322a7..c1c01f81ac5f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -160,6 +160,11 @@ void pkvm_remove_mappings(void *from, void *to)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+int __hyp_allocator_map(void *va, phys_addr_t phys)
+{
+	return __pkvm_create_mappings((unsigned long)va, PAGE_SIZE, phys, PAGE_HYP);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


