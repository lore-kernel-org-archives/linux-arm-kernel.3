Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08610C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go/rSw9bkr3V2Z7S0UpAa5FZKtjaGuIC5hzD90cfQFg=; b=X0E6bHqf+d/Q43TN1YXqbiN8/T
	SekgxxQhq9MMAiCsZI/1LrQioZST2sTznv6lV2Xx5h0H595mUKCpAfgQ+2fRAvA1i/93LWanowszG
	FCkME3mHbJpiNB5fd/OJ0yJIGpiLvwUd0xfZe0e5G63+JfGSzOkmLaXB/0D+Ke7f3oP3yc89RdKmZ
	loBYeUjOShtLQDUm34M8Xog209sx3PEpgxOTEVlAohQ6D4hv2yIJVLGCP+OBHosvSmBmaVKfJaYna
	L5KNYNcLt2S0Br3w+EQKWqeeTOOkMDVh2Z//IV7FctlErSS08RWi+dobJDp8b8st052+pBkoaMCH9
	sAuqCzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnS0a-00000005qVV-23HS;
	Thu, 27 Feb 2025 00:44:12 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRqB-00000005otW-1iRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:28 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-abbb6fa430fso22362866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616405; x=1741221205; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=go/rSw9bkr3V2Z7S0UpAa5FZKtjaGuIC5hzD90cfQFg=;
        b=LWRwlv0Xm6twLigy8fRLmEp/r0gbXmnFR/Zbc+BgHlmaBfAiGsAktaaEOOGc71hMvX
         2/ZHIACN1+PQo3vXjhU7vrrWvNv/Y07qFcOFq9GcNthKLxCIGczjJmEAl9Lz5FLAbqEC
         FrP3tk8yQFAA7hVLnpyxu0RJEU9FLxCV3aa7YwVTNS9dWT9MvGtqpQBoVJL6yiv/aa8G
         S7SEEaTj6MAVKIE2JONnFj2x5PwnXHUhxbjGkcpODijmGqzgUPP+8XVMdBeO4bqSa5cV
         ZC9mgCAgtvyfropc628y0iP4+E6POhPqMpfpQ0u5HKvQSigdVJAoE5fXGs6wyg4ukBdK
         NPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616405; x=1741221205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=go/rSw9bkr3V2Z7S0UpAa5FZKtjaGuIC5hzD90cfQFg=;
        b=mA2YSA+IFlW5bNHTh5d2+ueUV285OdYXdDwry+covVeiWio6rW6dDkz6VbgQ0zxOiV
         Rw5bn4+kzWoW9TcSQfkjfdJlhwHF1NClRwNDpiv0ow6LGpStLeb6DPmP14PPgchisy4q
         Omg7GX0GwIHXcwJbi+ZvGFu4BCpF2XwhXj5sb+EkejC3k8ztqqUNNOkMQKb6h/eiEimG
         xrLzwkK+VSiYFkH0MNkJVFI9VoxVrhSGf71SgVjyBgbFCxouJAdKxQLLd0PO1v9rlj65
         7TBvTG+5YC0QE2iTumcUGePvhOtPccJqTb2PPj58xci09hfyWBXATfKTdg8jzo6MX7G8
         /RIw==
X-Forwarded-Encrypted: i=1; AJvYcCW9uX+qgqV20DTmwG6UEJRXspa2GoF0KaQgjiRajEX9dLFiRGqgapFEciFoMHlC/jCsHg2rWl4YhCutunTAJz3i@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Hpze1C7DX2e/Z6zRhvVuWrDyrpsAp/Pns7zLZm0bu7li+8cv
	DKEgcMmGKb7DJw2l6DJU1aJwf/mqiyLbpiDIciGYyjpv96qyU4SUO5/8yB98QCldaWjfeUZ6BgY
	7o2vOKA==
X-Google-Smtp-Source: AGHT+IHoE0D/+VTxFu9mBffqWU8TmUIEm77P7VHQouobm1YsZoARZri0ZIO8rfS0b5y60ajdzwb57L0Mwq80
X-Received: from ejclm3.prod.google.com ([2002:a17:907:18c3:b0:abb:9896:c72f])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5202:b0:5e0:8c55:4fa
 with SMTP id 4fb4d7f45d1cf-5e444853ef4mr25783357a12.6.1740616405565; Wed, 26
 Feb 2025 16:33:25 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:10 +0000
In-Reply-To: <20250227003310.367350-1-qperret@google.com>
Mime-Version: 1.0
References: <20250227003310.367350-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-7-qperret@google.com>
Subject: [PATCH 6/6] KVM: arm64: Unconditionally cross check hyp state
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
X-CRM114-CacheID: sfid-20250226_163327_448881_C6DE77B0 
X-CRM114-Status: GOOD (  10.07  )
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

Now that the hypervisor's state is stored in the hyp_vmemmap, we no
longer need an expensive page-table walk to read it. This means we can
now afford to cross check the hyp-state during all memory ownership
transitions where the hyp is involved unconditionally, hence avoiding
problems such as [1].

[1] https://lore.kernel.org/kvmarm/20241128154406.602875-1-qperret@google.com/

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ae39d74be1f2..22a906c7973a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -695,11 +695,9 @@ int __pkvm_host_share_hyp(u64 pfn)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
@@ -755,11 +753,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
@@ -785,11 +781,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
-- 
2.48.1.658.g4767266eb4-goog


