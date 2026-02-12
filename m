Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6CCEB48EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyyYRiwc6FqhQlyFBFLg66ihDNCGyZfWrA54Edi64Eg=; b=UtfEOmsflSuonXpc7zfE5BepUm
	q+8iuDLRn+ipx8vCow9onWKE/0elD+t6JuxV2hZu0yryJFfYhmoPiDn9VVyh4O4+nJHjTXnPrGKtU
	QjHBNj2WzlRMzEQrgNTJufw/zxr7QVmu+sXYDUMwQrBHMILKQ2liZH+vGmnUE30JO5XoxNzEu6+1o
	Z10a0eFM6P69DmYPf9EcuvI2wNfaHXkDhHZ1Cw8txC4YHw0S3nFelcKW0btzmQc0PWD0Wlmx7ztfh
	djBi1JATUwjMLYBj7ZY5IMTueUuVnT6QYwUqJVnYQwvSRe4kU/mNGmCChHC0FUQ97ZIIBnDkPRBrG
	uoZ3iiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbN-00000001njT-205v;
	Thu, 12 Feb 2026 09:03:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbD-00000001neW-1YQI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:03:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48071615686so25099345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886976; x=1771491776; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cyyYRiwc6FqhQlyFBFLg66ihDNCGyZfWrA54Edi64Eg=;
        b=3LrlNIgxKtNi2tsdOvJo2E4BnN0D6zyrA2fS1D0SPv0HkmDPHi9fScVF55umVedq5i
         q01OT1kP5In1FHm/ZygkdNtrPlzV0LHTXY7koOPgDAzcdajfLi0MkxJluicCnAc820KP
         msWKi8UH1lP3ipvoZEg0gv4h4pd6GzmsbQ24GCmzZHlhg9RacG7NwFPwD3j/oLZp16Gr
         NmCLwptqy7bsKDoA83qSquoPomddiZFuB+KbFXOonQy1TbQlkPV0M5yRdEGnRxyvQVKL
         CMQXepbrCUosNUD/YODSfhbzhuALDqeBZkd5vLkjqdiwNfKrP4808vJNsG2U/M6mXTwB
         F9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886976; x=1771491776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyyYRiwc6FqhQlyFBFLg66ihDNCGyZfWrA54Edi64Eg=;
        b=NRGjDqlqgpttSb/ojkS7onrvQYv9cDpGALz7l9FNv3ZDuYIxvR7vIGwopAM9dF1JXu
         yfZHO3mTGlDcc/Qvjv35HEjszTTFW7Px5d7o9LqFu7IkCHWxAAtRIm6NvItH0febrLPj
         G/AiKYQsvh5A+qYm7fqfbkBkXes/e/tNK+6OBelQ/53NQHdr2ohPswWVLd2aBIFDKB/h
         rFH5hXtYkJG8JYY57s4+Ll/Hk74gdCBnKJL5tKy4ynuK+FaUFHno+9PXHkCxJECrfU+u
         yVrljfnSMXHpVtuLMZsDZuJ+nYQ6LWMmJRsbCovXzbKQk4Fc5qC3EA1C/fJ04mhkS9cx
         F0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVLJlFbzYE6jLNznYX+Q8gmRlys/xM5hJTGNVyP2dbse6IFPc7O4UurU3prSpLkA/tV3E/UIIl0Fu3/q8N86MDF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz93VF5cn7e5NPRthjUrMpO4Fq8oQWVwKTzPYICYPQK1PVfcIJ
	/k+bOFQWAU2Gd42TWscwAGvBeEfNN/fs5Hp1CaKWZubeUyltSd8iHjvceHJt5RXB32b33M393b4
	/mg==
X-Received: from wmqu17.prod.google.com ([2002:a05:600c:19d1:b0:483:29f4:26b8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:608b:b0:47d:8479:78d5
 with SMTP id 5b1f17b1804b1-4836710a0afmr20458865e9.7.1770886976534; Thu, 12
 Feb 2026 01:02:56 -0800 (PST)
Date: Thu, 12 Feb 2026 09:02:52 +0000
In-Reply-To: <20260212090252.158689-1-tabba@google.com>
Mime-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212090252.158689-4-tabba@google.com>
Subject: [PATCH v1 3/3] KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010259_417320_55BECB3C 
X-CRM114-Status: GOOD (  12.17  )
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

The `sve_state` pointer in `hyp_vcpu->vcpu.arch` is initialized as a
hypervisor virtual address during vCPU initialization in
`pkvm_vcpu_init_sve()`.

`unpin_host_sve_state()` calls `kern_hyp_va()` on this address. Since
`kern_hyp_va()` is idempotent, it's not a bug. However, it is
unnecessary and potentially confusing. Remove the redundant conversion.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 267854ed29c8..8b9e027ec86a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -393,7 +393,7 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (!vcpu_has_feature(&hyp_vcpu->vcpu, KVM_ARM_VCPU_SVE))
 		return;
 
-	sve_state = kern_hyp_va(hyp_vcpu->vcpu.arch.sve_state);
+	sve_state = hyp_vcpu->vcpu.arch.sve_state;
 	hyp_unpin_shared_mem(sve_state,
 			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
 }
-- 
2.53.0.239.g8d8fc8a987-goog


