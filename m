Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C65EF9003
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oCJqMFMJBFzo1B9Dat2jPTYOPY6jcDnrEpSARx0ibE=; b=Bc14NNJzNxgEVNMRxajutjVObu
	PHHYZQ5oIaIu2zXtYJUe4v298tK+DL/MhxubsYcvJGFy/LYCcMiEAuOg8u2mKIUFNpFjMXypj8r5q
	7W+l3wmthP1Z07FlplM2qEUNJt5JL3dotJYTpNROYn/A6NwiYT4Ry9jcpMXN81RCClkFVgMcu2E9N
	4fNEjQnlRPrRoHxkrXpQoCEguvomuidE81Td0aGkCIdI30It3tSDXWBBQSJzQdTHAAN8PhtMbAU31
	11wcIOl/58gkjzqDrytf/RiVNeZnP8F5i58zMdsVpRFltAAknReUygjuHGmtmze3Aa7RL6j2ftdLS
	wRZm8eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozX-0000000041X-0onf;
	Wed, 04 Mar 2026 16:22:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozV-0000000040O-2dak
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 16:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0oCJqMFMJBFzo1B9Dat2jPTYOPY6jcDnrEpSARx0ibE=; b=oWY+bHm24hU1KeU8Rm1E8d8pcB
	M2Vy0pLunevW3Vn5qGbHkZc6SehbaVC3/hNcYHhtN4Cr++nhR5BNBapOKLGDRLBxw/kdJNoNvfulL
	3teYL6x55K/pqpEYX2A69M91vN6HVvt+0N5wI3NNGa6FKiUdSFxeeAHEq81UYmr1fOHdLec8PTcn7
	F/fKM8pS28M2/kQxiI2pw8Uk3u+9fL1PSONwX6DDKkYDl0PLjwCvyS9JN4X0sPskDae1dNB2sEt0O
	cnvRbn80Kw/h7uTs7rdovvONL0opt/mb5rkRAo5rrQIGtYuVYTo8Fdhd0iDdAVpq7ohA/CDAj5eGb
	q9bD3ecw==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozS-0000000559s-3W4p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:22:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-439a85832c0so3243914f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 08:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772641345; x=1773246145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0oCJqMFMJBFzo1B9Dat2jPTYOPY6jcDnrEpSARx0ibE=;
        b=uQGfGnS/pb4RQBNcFHTgRLxk1OoaRrZsgSfBKrnZ40O6RC4SyGUAHqB7K1Tafsz2Ds
         Dwyn/ZbDvIRkm9SSvs8XC+sLyoSizgLsuTrHraKLEy9tz2hbBT3Z8j4XzFm3acYqSi7g
         pK/M0gkS2wEbm9igdyk+L6CqNnha3/3t5wNOwOS8GBQbUGrxBTPIteWA5szZnRlsGgAi
         cjStXRFBSYm00ASiju6MUFL4m+IctuCNzFNGWSPn+aQ88OH2UdmEX1M0fWJIPjyUHC+e
         j8XanyU+DigxOKcoJIAkSswTDap9ffn0CpJ81AZKYJJi441xff0Ri+qEpBx6eyJLwGyv
         413Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641345; x=1773246145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oCJqMFMJBFzo1B9Dat2jPTYOPY6jcDnrEpSARx0ibE=;
        b=bhAO8F0dOawT5LuczS+p/nNxsOIyZM9lM38Fax3+HJjPdsmAOd2Szzx0Gwe+Y9YGpK
         h69RLNTsJYucIO9Q8YBJzx3fZtqAoyCm6f2DtB1vSk7+sBPt5P+G3/MGVrEUkMnPRoEE
         4tLiYsx7uv6bGTs6YmLdHYVps1C7RNR93EkgkdVIPpUJZEPMiTwgM3/p94vcO0qv4U24
         w+QE0ZzPB5MiDy2WxtKUpVlILDEk51T3vVrzgdTtyFDdT5zmGd6nsU0g3Oz3lYadVb6+
         11UPQtGsCL/K1vvWcl4/70jlDyGDH4de623Hb0g5xYmFxJLNeDfKG1egInkSdzCxVj5C
         av1g==
X-Forwarded-Encrypted: i=1; AJvYcCWxjBnzKt9r5XIl3Cr5i5vJfwjoyzwG+M5Sx3Z9WxHg50gmsA+UAhc32Bch+XEAxJ3SgzI2WBPMNz6XkpmjgQti@lists.infradead.org
X-Gm-Message-State: AOJu0YxbbgKTuCCnLuZChUY9bWNXEYpgVdDzQGJXsaXx9skklwtR+HEy
	CObwtjZN2c58zCI6/MX4mN/uMIiX3auOiWLzodfsbBhMc1lQu87S9NhCSNFBZlBhn7MD2cVlLgL
	aFA==
X-Received: from wrid6.prod.google.com ([2002:a05:6000:1866:b0:439:cc48:d5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1acf:b0:439:b3ff:9ab9
 with SMTP id ffacd0b85a97d-439c7ffcb29mr5321494f8f.48.1772641344607; Wed, 04
 Mar 2026 08:22:24 -0800 (PST)
Date: Wed,  4 Mar 2026 16:22:21 +0000
In-Reply-To: <20260304162222.836152-1-tabba@google.com>
Mime-Version: 1.0
References: <20260304162222.836152-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260304162222.836152-2-tabba@google.com>
Subject: [PATCH v1 1/2] KVM: arm64: Fix page leak in user_mem_abort() on
 atomic fault
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, yangyicong@hisilicon.com, wangzhou1@hisilicon.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_162226_957394_E97388A4 
X-CRM114-Status: GOOD (  14.93  )
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

When a guest performs an atomic/exclusive operation on memory lacking
the required attributes, user_mem_abort() injects a data abort and
returns early. However, it fails to release the reference to the
host page acquired via __kvm_faultin_pfn().

A malicious guest could repeatedly trigger this fault, leaking host
page references and eventually causing host memory exhaustion (OOM).

Fix this by consolidating the early error returns to a new out_put_page
label that correctly calls kvm_release_page_unused().

Fixes: 2937aeec9dc5 ("KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ec2eee857208..e1d6a4f591a9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1837,10 +1837,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (exec_fault && s2_force_noncacheable)
 		ret = -ENOEXEC;
 
-	if (ret) {
-		kvm_release_page_unused(page);
-		return ret;
-	}
+	if (ret)
+		goto out_put_page;
 
 	/*
 	 * Guest performs atomic/exclusive operations on memory with unsupported
@@ -1850,7 +1848,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
 		kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
-		return 1;
+		ret = 1;
+		goto out_put_page;
 	}
 
 	if (nested)
@@ -1936,6 +1935,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
 	return ret != -EAGAIN ? ret : 0;
+
+out_put_page:
+	kvm_release_page_unused(page);
+	return ret;
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.53.0.473.g4a7958ca14-goog


