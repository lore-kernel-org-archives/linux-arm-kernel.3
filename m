Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=etoiHHyRBq2rLgJXv5Y9hE7Q7cEfLHiNK8ewd9bv5mI=; b=x0edp5KdkHdeiHL3261cbDDY+c
	7iPoa9d1Nz3qnn7R+VN8KZjuG7lLzG05DchmRSkx+CJ3V3zlUZ8/0bx+8Ds4gvLdUA/s3XRoataih
	/FoTnseA0JRf50d0oYWLHmlp+MaOhLxQqTXv3Om20X8clSYHfmlrrl16Eq8Yv2pwJkoy0a7ihgP3T
	HowLiiBi9JR+z6jz8v+th7xZMgiuqnXUwv5+MPuGWHcyP7YIP3f6hPU3AMctncMrT97mqx7sUZc0u
	r9CzvQ/R4TiUFA9NY4QZdK488T5tnOujTv+WzrEC5q4M67XkCD0v3LZJhrjonobEGgGEOqbOe3ZDT
	LhiNwdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLDp-00000003KFK-0M0e;
	Fri, 09 May 2025 10:44:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKWY-00000003Bg4-3dsL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:00:11 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-740b3a18e26so1433996b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746784810; x=1747389610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etoiHHyRBq2rLgJXv5Y9hE7Q7cEfLHiNK8ewd9bv5mI=;
        b=iF/UDoXesuhMFHWwwTjoeOg3aFmlEqCGuITSdqzcK1uCMp0iSR2DyaKmfSlTjLdKjN
         ytf1iz6pF+Hv58znqXndkz9LSFX3tR+Q5SMhlbkZQi1JG5bzjtv0w/U9xUavMIlAZ2Y6
         MZTGQ9+dza/jZ9KMoNHCxjEpM2HMm4vzfnF/u3CUX+vzl7PjiLr8jcbyXDIYXCCmW9FE
         c5Bw4xZZMtJpyVdfkDMRAj3Scjrtdzjrdg+o1nnOupxbG+k24wWZX2UmqchDeYuQP6ji
         no/RjRodzu55Hcc/HdUjFGsnrLJDJJIqDSz243mvzKpqfNbKUt5PRQu5+ecn9xQwNxjz
         9faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784810; x=1747389610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etoiHHyRBq2rLgJXv5Y9hE7Q7cEfLHiNK8ewd9bv5mI=;
        b=qSAdzYvDNWchyJmkKvC1O4X4O9L8boz9Nl/d//xKaNsJYWhiDMYyVN+ChH5odut/hX
         RBZ/xYFMvLzoN/n7wNwvmNcEkrxz6KkmWg4MrKWozHcN5o+aphXYhlIZBoTFOI16ALXZ
         /6UXgus7ttKy8lenf93KEV7sJsPD/0x+64OkG15Fp0BXxJvvLVByl55IXP6ltA87O/3d
         MZMMqLzfN8/BJRNqO8ETGLyLsvsOwY/WEdE2AATxlt5aaVY8lcySC19YUVu50FIOaLBy
         l5UZs/5IHqAtJXP2Ie6D9/kYlqA7EfvsBlgDkCMz8rLAAYrjQPAAWU3z5OJeHK9p/OQe
         know==
X-Gm-Message-State: AOJu0Yx/aBcaqk3c7lwD4B6atqX9dqEZOPp+uKD4UE+kn5bCVJfGUr0U
	pJFZdbvZQvfMQ68GeheVnOVTRoQZFQm5zEvv2nEO2NTfmR9rN1pu
X-Gm-Gg: ASbGncu1e2XrvhO/tWQr2KkBGIUzVb8aI4ro3FxHn9VhaOrOLnfmBAdVGLk1cqat9bW
	pXNZEYAVG2P22WFYM7qW/I5eGAcHTBlPbsCARfJ3ina9rTN3FMg6CWgOkd+eCHBqusfTvEZrCQl
	EnQ/IylkLHMz1uThBzVVk6gI2MaZ6AFG+x23Chu4Ut8n20vu+wOryNTKSLD88rjdkGCtN0d+G2D
	MEP61vrQCuIo79AnxY4wP9oYm1oPARc/RO+RmLcpRqpJZ1rcufQ7OrVx9w60pA/xt/CSTZw9j6a
	4rODWc9jbT93Q7DDl3n4rfyqx0AOqoQ7LkaDLliEcTDgm6m9XP2Q
X-Google-Smtp-Source: AGHT+IEQRGYYdmuOQpYE6EFYgcT85Xf/QwhETlpYtJ33rrK6CmDFYaOZXAoRcYjJE621GAnYX0Yxzg==
X-Received: by 2002:a05:6a00:9286:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7423c032792mr3999373b3a.19.1746784809483;
        Fri, 09 May 2025 03:00:09 -0700 (PDT)
Received: from OSC.. ([106.222.230.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704f36sm1419403b3a.36.2025.05.09.03.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:00:08 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] KVM:FIXME comment is removed since no longer required
Date: Fri,  9 May 2025 15:29:57 +0530
Message-ID: <20250509095957.6271-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_030010_905959_2EFBA8AD 
X-CRM114-Status: GOOD (  10.67  )
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

FIXME comment can be removed since finalize_init_hyp_mode()
is invoked after kvm_init()

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 arch/arm64/kvm/arm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 19ca57def629..36a4b6277537 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2856,10 +2856,6 @@ static __init int kvm_arm_init(void)
 				     "h" : "n"),
 		 cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) ? "+NV2": "");
 
-	/*
-	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
-	 * hypervisor protection is finalized.
-	 */
 	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (err)
 		goto out_subs;
-- 
2.43.0


