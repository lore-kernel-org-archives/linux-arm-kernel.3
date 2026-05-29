Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2ACCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSXsbIdnWInVilAPlZA6JhRFyCgRtF4/KyoHf0/oPWY=; b=MpfD/y3GPOtC0yM5ZqigKkYHv7
	U3mOzm5wHGTvCtu3L31EMzct0hncR8JWR0QilGcTpHhjFwVolzQP2RYFaNQGSGOUkrwcat0GmDKhs
	Ac4j+alLcQunBCiFRmwWPDcPrC+3hkk2fFTA4oOk+u8dAZxwmHwdhHhVdFRtCQ4P/2+epr3Pr3ekh
	rKXdxSNqGVWGZpWVAuiLAVIfBPf05b9REW+0/WTerBn7hYG1a/V895iR6SPBFSkzWbBQKNCxmHILJ
	WpgvffVv5iDWgrJ4y3xQLnXqUXHHP6XxqIUMcfa/I5LUmXcv9XtULRlIMiqjrzUZo/HH/bgIskBa+
	PO0Mb75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwAI-00000007MMh-2r9P;
	Fri, 29 May 2026 12:18:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA7-00000007MI7-16Pf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:18:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4909c0f0ba2so5352005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780057081; x=1780661881; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSXsbIdnWInVilAPlZA6JhRFyCgRtF4/KyoHf0/oPWY=;
        b=q+zJLdmcZ32TbZAzWRQUfN2Kf1oRK7LIRp44V+wo70c9VkdyMsixv84gTlqzrPpEn1
         rPDRU5zMW8Zu/AoA4vDgrpHS6eLlvud+416jYkZUunecdMbIIKideCDH2B2vXwM1BqAK
         UJzw7R1mUpM1gNFlAcAA6FqT6kWhGnaCWEMjLca3iXyKM2fe6P38HcYPgLhN7jshoowj
         02YrsokwiR1L1VGoAULLxiNsDjWOIYQO9427tqxvDRUtaPIpOsQDm4ShZe5pzWAX2NHR
         ImJRsnCws+rmn0QmlMYf5x5v1ORCq4YVECt9TZICUtUh7kG9hAzdtP+RFPzn7CUDHoSO
         vOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057081; x=1780661881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSXsbIdnWInVilAPlZA6JhRFyCgRtF4/KyoHf0/oPWY=;
        b=gAWNWCr+QLa16xYt+NO5e90yafZ6NnoK9fo1LciW4Folw/J4h5N92A2hyRvJZ5MWlt
         HKrjPCdLoclUVMb/iOZmmL4Nlb5QNBP6uURr7kNtI18A3lHa3gGQsa/WacoafBd0LMmC
         22IMBX87mpXYOv7/jYo7OMoLeepiRxraRtP3TeqlKwQAX7lGZDUizwaYhk9x4PzZoO7T
         01jgesyE0QMCCkfGIHWHmdX9EtMOBWNML/JI/dLocMG32ZMZyLlLYY7aMpeNBnBmCU+7
         YfAJ7LQHFCuTyhrXoI4Djt98h3WGa9lbCT7kucUnyKrv18ds9byaxa1BmmlVBDTlHS6f
         EHNQ==
X-Gm-Message-State: AOJu0YxdXresh6/AvPK7k8sR/7OlPhxVePykrCTXmPBIj3+q/+32uPJo
	J4ZLb2Wgefp0UwAiekUFzJ5vl5PwG6l/Q4gEj8S3Om0PDhlSng5207jpiUWbKfmd2xxo4+pgzPf
	A5g==
X-Received: from wmqa18.prod.google.com ([2002:a05:600c:3492:b0:490:538a:ee3a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a00a:b0:490:9d5c:a3e0
 with SMTP id 5b1f17b1804b1-4909d5ca570mr41853905e9.9.1780057080700; Fri, 29
 May 2026 05:18:00 -0700 (PDT)
Date: Fri, 29 May 2026 13:17:55 +0100
In-Reply-To: <20260529121755.2923500-1-tabba@google.com>
Mime-Version: 1.0
References: <20260529121755.2923500-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529121755.2923500-4-tabba@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Roll back partial shares on
 kvm_share_hyp() failure
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051803_306325_BA8E942E 
X-CRM114-Status: GOOD (  14.65  )
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

kvm_share_hyp() shares a range one page at a time. If share_pfn_hyp()
fails partway through, the pages already shared by this call are left
shared, while the caller treats the whole range as failed and never
unshares them.

Unshare those pages before returning the error. If an unshare itself
fails the page is leaked: it stays shared with the hypervisor and is
no longer reusable for pKVM, but no isolation guarantee is broken, so
WARN and continue. Not expected in practice.

Fixes: a83e2191b7f1 ("KVM: arm64: pkvm: Refcount the pages shared with EL2")
Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e08503e89fc4..8811ad60cf72 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -544,8 +544,8 @@ static int unshare_pfn_hyp(u64 pfn)
 int kvm_share_hyp(void *from, void *to)
 {
 	phys_addr_t start, end, cur;
+	int ret = 0;
 	u64 pfn;
-	int ret;
 
 	if (is_kernel_in_hyp_mode())
 		return 0;
@@ -567,10 +567,24 @@ int kvm_share_hyp(void *from, void *to)
 		pfn = __phys_to_pfn(cur);
 		ret = share_pfn_hyp(pfn);
 		if (ret)
-			return ret;
+			break;
 	}
 
-	return 0;
+	if (!ret)
+		return 0;
+
+	/*
+	 * Roll back the pages shared by this call. A failed unshare leaks
+	 * the page (it stays shared with the hypervisor and is no longer
+	 * reusable for pKVM) but breaks no isolation guarantee, so warn and
+	 * continue. Not expected in practice.
+	 */
+	for (end = cur, cur = start; cur < end; cur += PAGE_SIZE) {
+		pfn = __phys_to_pfn(cur);
+		WARN_ON(unshare_pfn_hyp(pfn));
+	}
+
+	return ret;
 }
 
 void kvm_unshare_hyp(void *from, void *to)
-- 
2.54.0.929.g9b7fa37559-goog


