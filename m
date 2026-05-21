Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C457FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nP4J9fw6WkwrBkWENfxjLXAdxOioe0P1zdEKW/zD1r8=; b=Ck1aey1l6c7JoeR9sBOo3WKWA/
	AMhPxg29/Mh6/xTTsHJnrfGGHCTaHCgCTtqL+TY1QfRKANHPzIjaOw6Cs5qfxKtsfBbh6gGTmNPuZ
	2cNgEn8qSybZL+TdU/wIlXZabeSr227Jsn4lkGLhjuqT6aCop7t8IyY+11cT2LC2yQpb8+nTjtbRK
	zWriofB/NEKSUtOdqfDmK1I2VDWzIR8xD0gOlyEP5lnIuThn7esOS/CM/dm1i0PsObH/aN9TH03Sr
	u1Feq7CWJli0JCHZyy/Jpu8l6bm/w8162lSMsMR/reEVKLd4hprmsqIUoWDlrl7A6kttC/U3ZwPpW
	BzlQhAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Xe-00000007RsU-1fw5;
	Thu, 21 May 2026 10:22:14 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Xa-00000007RpH-1Ugy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:22:11 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-67fd8b662ecso6182042a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779358928; x=1779963728; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nP4J9fw6WkwrBkWENfxjLXAdxOioe0P1zdEKW/zD1r8=;
        b=iW3HGULT2uMzCSexL9aQFpSQKNX8GB0/gSIaYVjrVP/h3tbmVYfhFhgv49DgwRh1/R
         2c5kAP1eK4HSr2Owwq1j7emIABmaAYKh9vKvYCgMQB98pmBGIM+KOQIlYPh0b+gF57Xn
         o3WOk1JZKmJUBbqvmRLqCOOsQqklqKCKCKNZ/omJTu5z8i1/BRcQHij6KhmSQULSzrAB
         HUSeqbCIvKNeYsnmyPaaCGiYpTzAwgBX51GsB5xKOQfz9inAdPfQ9zmIeZwGMt+hrFps
         Ix0uNSmLYbVPcI+729vIy/9n7h3/C5uAhePYZRyhvo2O8RVwRmJD8FCYklh4VDJBEmMG
         FahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358928; x=1779963728;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nP4J9fw6WkwrBkWENfxjLXAdxOioe0P1zdEKW/zD1r8=;
        b=BZCrxQdNREBhTD1ESzWW7gA0UfbJc5VJJu+QyjWaHz4JugrzR0598mdVhIqOba+GUv
         gcdfyiEQxETY6ljIyyRK3Txzy0rM8KJP30mHNtVkzrfA3jRKfJBl12z/KCvNcBmA+QM7
         QSgsdCCHtBRL38SmhLAM6ahNfhS9Xc9QtmU5g6NAtjm3hN3WAzQ77HJPA9WiKp8kfucq
         4R9IqX6QrTqMqZDUmbKpLCFug7S9/HCe7M/dDPTsuKPqGZvsX5Lf819dNzGJFRT3g7lH
         1TalPt00BYVbnwdZbP/hhREx8LejlrvnxncbxbuH5XfBKHOw85o/glScOk7cTz6HFW73
         vxZg==
X-Gm-Message-State: AOJu0YzEd1y8zAmiRf8DwX+fQeNwWyXgm8EOANOv2MDSjXhdqzycJGkr
	6AOD+vRw2eOcInSkbKrUKUqhKx+vUzEPF6mx1gVv5ut2/qAynjzMzzzESeg9HJ2q5FdCtOEoofX
	LxLLqAGSo3UzRJOHYhBUhmQ==
X-Received: from edrb20.prod.google.com ([2002:aa7:d494:0:b0:688:57d9:5a0c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3586:b0:670:8b38:5717 with SMTP id 4fb4d7f45d1cf-68836ecb198mr1175738a12.24.1779358928033;
 Thu, 21 May 2026 03:22:08 -0700 (PDT)
Date: Thu, 21 May 2026 11:21:49 +0100
In-Reply-To: <20260521102149.804874-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521102149.804874-4-vdonnefort@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate_host
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_032210_415424_1D5976D4 
X-CRM114-Status: GOOD (  11.28  )
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

A previous bug in __pkvm_init_vm error path showed that the hypervisor
could leak refcounted pages, (i.e. losing access to a page while its
refcount is still elevated). This poses a threat to the pKVM state
machine.

Address this by introducing a fail-safe in n __pkvm_hyp_donate_host.
Transitions are not a hot path so added security is worth the extra
check.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 42b0b648f32f..bb97d05b9b25 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -855,6 +855,16 @@ static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_pa
 	return 0;
 }
 
+static int __hyp_check_page_count_range(phys_addr_t phys, u64 size)
+{
+	for_each_hyp_page(page, phys, size) {
+		if (page->refcount)
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
 static bool guest_pte_is_poisoned(kvm_pte_t pte)
 {
 	if (kvm_pte_valid(pte))
@@ -1053,7 +1063,6 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 int __pkvm_host_unshare_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 virt = (u64)__hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -1066,10 +1075,9 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	if (ret)
 		goto unlock;
-	if (hyp_page_count((void *)virt)) {
-		ret = -EBUSY;
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
 		goto unlock;
-	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
@@ -1132,6 +1140,10 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	if (ret)
 		goto unlock;
 
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
+		goto unlock;
+
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
-- 
2.54.0.746.g67dd491aae-goog


