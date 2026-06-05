Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1C9CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=80P5JojD6lxQG8AaZDlXxzSX2ulhvqu/o5FnknnieX4=; b=TfBzXbOyIS0VaglAqRErHy5ZW1
	pqHa59gkfqH8y+9VmZQmOFrTA7lQ3VDmwv50mjSsKFIutRbhcOMlDy+/25QzH1bSU4NJlbzG5kZxC
	BLy2M6NC7X/nG83eCh+ktUUEN2KyN46yMtksqaCEcJqN/Q8mBKuv5LHMu0ruEC+QrEp8uOyE3QN5A
	ryVpBvaJcB+51E66RFkRDagd4cIzIPgYA0d713GBqvzl1MfDx6NCfD//EoohqwbHg+hnS7adQ8RYm
	JTOT3vbyBIrspYhCtAWgUD8RvAQuj/2aku1A4nu/qiPfsM23jaLAdC4YwgRKnuvjahbxuobcSECJJ
	oQ4KUAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPtV-00000000JNc-2bQX;
	Fri, 05 Jun 2026 08:27:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPtS-00000000JNH-1boI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:27:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842848fd613so1259617b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648025; x=1781252825; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80P5JojD6lxQG8AaZDlXxzSX2ulhvqu/o5FnknnieX4=;
        b=VEQvDhL69eJD/1+5YM5bnqjyQyg6Wi+PP7yFm5sOR5qHp1Uy8wJfXbibsRMLFW2uzg
         9z/7x86FMIWirNR/E6c9cWgTK1VdlEZ0ESkLTq8yfGCZGeml+7HIMU+GkK05K9ng4t2s
         GHojBaB6P0/SDuSyH/pz4sSyloYXGSnTOWujlbq4YOIAnEwGJoMzfiqLeuZqEXQkQIUn
         6IAYXEN6Iy9oX7d5+T62sARi0qyi3ywAVxdoxQQHamiPGLWV5EnVr3+fd6fN9xEF7JrQ
         WsJP41ws2KEfLc3Ag6ZpD+aBvSLIUi6PZSqo/kShq+xVZLb8dl6NozQXNP4CkVwon0I+
         iPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648025; x=1781252825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80P5JojD6lxQG8AaZDlXxzSX2ulhvqu/o5FnknnieX4=;
        b=LWYiKImciaPC6nyQ6AEpmzRZF1Em9+ZHFoW/YgILhYLqi2+v8nI4l7uj8c10MQQ5Tb
         Vi4VV5jExHMCaKOxrPOPqC34dm6xza9J5fceb691e9tRb40i6wChrUqIvFEhNS93/OB0
         LpWjfVNK2+rMqwpJoHlBiMJ9W+Gyeaa9BMoiaYA1HFhtphuX1QflxJj4zd6/02UecvKk
         wVb6l5/DuOgf2HHIBW2sKAqou0UgyduvjIwFWwp5994UQroPECwOeENy4arlqF1tY0Vk
         dmmbmWy8tIWfgo6ktU8OB3w80pq1MLw0xasYEhY7Oo2m3za3VmTTNnlP/OgNVpkSGRCV
         6BRQ==
X-Gm-Message-State: AOJu0YyCusAlZgkXK5eK6YcJWn7OWItYi8EYxBnwUdKpLx/8AP7IAyWK
	egU58tRQneghklrOx+8Av1lFunIcsU3c5k2WTtTTZPotKBTTsusmOWMP
X-Gm-Gg: Acq92OEa9WjYY1AeirBpZxj/CWOhKD9R8lRq6bhebYay47xhxpwULgGbrmSrEkkm/xF
	UgGG3+HvCBULuQRWRRMe1vsJPApsaB08Q2Y/CtomCC+m50BZfKprjH8CgCWRxaQ6Fv1QZYWLFZz
	6jPj8gSDdIPM09cTaJZEYzmSuwnqvUL8cTsj+hUohJ4iCVZv6RBvwOwI9JeNztxTmm0tSbQjTDf
	6g/ETrFC7BsWirXJM98osh2VE0ibLvqI+/ehkJriI8/Uig7yySfcVLR6EQC2GGHfrri3AtGxWj+
	vwxYzKxZYKcVNndQZAHS+PxbDZTNAcvvNaYuv0lW3aZwVKvQKzoq/GxYQfCHD2D2Gu8G3sEOLQz
	t/vYaKSr7s8kZwKVRAbN0SVGlDib5m5p4mU19Xnk2Gy/fReLVdgxxQfYrDsAdch8wr+FTnd2u4W
	HAYBWPF5Sj0cfFDKTPL/X9j7xoUELZTiEXZrWq69FMWXhy0mZ2atmGYTZRtssxNYcm
X-Received: by 2002:a05:6a00:bd13:b0:842:6a97:52f7 with SMTP id d2e1a72fcca58-842b0f1f25fmr2432559b3a.19.1780648025515;
        Fri, 05 Jun 2026 01:27:05 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm8388636b3a.48.2026.06.05.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:27:04 -0700 (PDT)
Date: Fri, 5 Jun 2026 17:27:01 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, christoffer.dall@arm.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH v2] KVM: arm64: Reassign nested_mmus array behind mmu_lock
Message-ID: <aiKIVVeIr1aAB1yp@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012706_446921_17820A9E 
X-CRM114-Status: GOOD (  14.90  )
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

kvm->arch.nested_mmus[] is walked under kvm->mmu_lock, including from the
MMU notifier path (kvm_unmap_gfn_range() -> kvm_nested_s2_unmap()), which
can run at any time. kvm_vcpu_init_nested() reallocates the array and frees
the old buffer while holding only kvm->arch.config_lock, so such a walker
can reference the freed array.

Allocate the new array outside of mmu_lock, as the allocation can sleep.
Under the lock, copy the existing entries, fix up the back pointers and
reassign the array. Free the old buffer after dropping the lock, as
kvfree() can sleep as well.

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Reviewed-by: Oliver Upton <oupton@kernel.org>
---
Changes in v2:
- reword shortlog and changelog per review 
  (diff unchanged; kept Oliver's Reviewed-by)
- v1: https://lore.kernel.org/all/aiHEKOeZMVwsRlvP@v4bel/
---
 arch/arm64/kvm/nested.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 38f672e94087..6f7bc9a9992e 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -89,21 +89,28 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	 * again, and there is no reason to affect the whole VM for this.
 	 */
 	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
-	tmp = kvrealloc(kvm->arch.nested_mmus,
-			size_mul(sizeof(*kvm->arch.nested_mmus), num_mmus),
-			GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!tmp)
-		return -ENOMEM;
 
-	swap(kvm->arch.nested_mmus, tmp);
+	if (num_mmus > kvm->arch.nested_mmus_size) {
+		tmp = kvcalloc(num_mmus, sizeof(*tmp), GFP_KERNEL_ACCOUNT);
+		if (!tmp)
+			return -ENOMEM;
 
-	/*
-	 * If we went through a realocation, adjust the MMU back-pointers in
-	 * the previously initialised kvm_pgtable structures.
-	 */
-	if (kvm->arch.nested_mmus != tmp)
-		for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
-			kvm->arch.nested_mmus[i].pgt->mmu = &kvm->arch.nested_mmus[i];
+		write_lock(&kvm->mmu_lock);
+
+		if (kvm->arch.nested_mmus_size) {
+			memcpy(tmp, kvm->arch.nested_mmus,
+			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
+
+			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
+				tmp[i].pgt->mmu = &tmp[i];
+		}
+
+		swap(kvm->arch.nested_mmus, tmp);
+
+		write_unlock(&kvm->mmu_lock);
+
+		kvfree(tmp);
+	}
 
 	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
 		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
-- 
2.43.0


