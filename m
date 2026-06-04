Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096F6CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7T8kJ0gjf2hk3Cxd2ChpK32DU2yBtKAlDAVK83XkRZA=; b=Gecvwjp/4NHhnbX0Z25mfLzxSG
	309wgCR+LgyzNjJcMEVJpblWk6R6Ujx6AiRKj4X6+VUhaUZd9lOyAhA4LinbD6eKJ7+RPO2FWSduT
	TABmwD+hSj2QFE+WpONPIc2UAsSDsaY9udDZasVQJtQ08vYLTfkqu2U5nuOP8AiOqP5FgcixrFKLV
	8N8OKPw4eGK4JSX7uZW84F0bQn2b/T+DblUGjj6/sJLUCAxmCGLQF2YFSaUS2UDvqditA/UMNHNEt
	I2QHw6Gu8G0nUtVKcDt09ojj2aV8aMj1t9RBEEz7+xwvJMnE/EYyU6fRYQTPYSL2lAl25fbCivVLS
	8/YQtLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVCpU-0000000HAsQ-2bAs;
	Thu, 04 Jun 2026 18:30:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVCpS-0000000HArY-0YVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 18:30:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso821107a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780597805; x=1781202605; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T8kJ0gjf2hk3Cxd2ChpK32DU2yBtKAlDAVK83XkRZA=;
        b=YCUxmBNo6wF6Nv5AuVObbRwQWxRPgFcUg7RfJRBlOnDwXf1EDYT+zoCpC4GSUUqu0U
         ep0Rq+2QreH8WGUjVdTUYJRJth60B6yRvCvpCFwiIjQb4vCNJ/ug8ukhtMzHgb5rCrMn
         ZPW6RmM6178v4EvnEo2WMdm/k9LFZe5dH4MizL39CR6Ux+pVf9lpeSe/IRh+g1N/4ujA
         2JtlizRAqxUfGxjPS5HbBmzm3oS3SYKa3aKN3b62GNb4u9778UWByUSS/qnARAOJjiQw
         buGYr9cu9fgJGbP8sSD5FEQybzL9tUKSDKeSex+yGdD/dKf6OaQCzDyaUxKMAQT4LTkm
         6jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780597805; x=1781202605;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T8kJ0gjf2hk3Cxd2ChpK32DU2yBtKAlDAVK83XkRZA=;
        b=aK/K5qZlvQmkyoRU49OE3396lD94n4Iy4B+ptEheRkXpGfUzKSnTivLTNBZza6m4Kb
         8tbjzyeHfYao1SI+FjEWI+xoOeFt01sL6AuvNNeowx8TTSa5CmBZXPqayNnTUxlKzRfX
         yEMX/WOJssgOnPvejRyGbxiWRYKNbr+4lpK+BntsCmBKZUivFOWdzIQUcuvl5X+rzviP
         SqTeVrQFNphC7qwfd2oDPh1cwY/SCQojGXTWtq/HtoPxhCL6DRf5jKfdeKtiIhPIbp35
         ykMspX9RS6uy/XiEuXjETGyvd9R7heUq0z88TXLV/iZLjF2JkK0gbROY3/8XiF3eCn83
         XRkQ==
X-Gm-Message-State: AOJu0Yz8LonHIMeSi7KXRwCWsWDxrDdNprdw1arAJq7tI02TZb3BQQCJ
	NnHAOqQ+cDDU6E3V5U7+DgK+VRCNykHXvcCzI0XdcJm6fsvgXQW3KhOV
X-Gm-Gg: Acq92OHwBFi2J9T8G/twASfWHkpakJoT4bXxNRd9sAeGuyou4Si7p9pnTy4tu5xzcH5
	55hc3wtXpKwBGkVyGAJGzn0rmu+YGzH3FZYXh8SSBlLgvEgxNcgE+H2SSCaYiGThEOEBkYiJuyy
	5b6MVcv16Cp8BdVQ/HMF5KpQqzofIYFA0z2OvTCRi+9d/0O1Gik/52W6fhpPwbeFIj7BFCc7UN0
	V3VImJxv6d8TKsiySuU45PNB4+zgp3nsuCpf9eYFTlJa/Ta5sjfyIBOsCroHJXBDfIO8I8YzRPa
	cAUS3XdXDRz/UodMmVVhnBxmVFlQr+01j9KrI9WgyE4baw3Tfzfz33FExXySMeZ13eC+5poOFtF
	2PGyrEGUqdSBYhjAZ/mArXQj9LIKuSP/tiqIsuROdA8Jxb3NzVck+Rmb31POK7F3GzAnvVm8Vin
	NSF2Kae8lgc7G1RSELVIl1QM2wX12Wo3XkFSEzTKzpd+ONW6GrrsudQg==
X-Received: by 2002:a17:90b:5210:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-370f0967012mr114863a91.19.1780597804928;
        Thu, 04 Jun 2026 11:30:04 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm5494310a91.1.2026.06.04.11.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:30:04 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:30:00 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, christoffer.dall@arm.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: Reallocate the nested_mmus array under the
 mmu_lock
Message-ID: <aiHEKOeZMVwsRlvP@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_113006_185306_CBE4AA8C 
X-CRM114-Status: GOOD (  14.21  )
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

Code that walks kvm->arch.nested_mmus[] holds kvm->mmu_lock. By contrast,
kvm_vcpu_init_nested() reallocates the array and frees the old buffer while
holding only kvm->arch.config_lock, so a walker can reference the freed
array.

Allocate the new array outside the lock, as the allocation can sleep, and
do only the copy and the pointer swap under the mmu_lock. After the swap no
walker can reach the old buffer, so free it once the lock has been
released.

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/nested.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 38f672e940878..6f7bc9a9992e0 100644
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


