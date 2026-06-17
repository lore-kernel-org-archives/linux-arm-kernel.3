Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAB7CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y79oPW1dRkbvOFQ/8D6OY6Iq3f4xRjBQw7MgzYvcGaA=; b=o4c4RBVEFt28T4dUrcuJrwdLOQ
	VV9TYY+GkeuUx+kPhbDzaV3sQnXVBXQHWAUisavEsjLW2kndeF9QSnT+uAu1Q2APPJutOnJG7XGA2
	hk0g1SljdXdkv8vWHlt3BSMSAoSa2r7T32AJMlDfWVhrhXqN91WSG2MOjBUwgtCYPRjdwKpVShWB5
	2Nx5oJPRZ8ofUpP1daEba1SzrR4U//ZlhLuCCHQxMFwbxQIlxZH8U14BHmNsbkiYhUIHTmnla9zxn
	raKCdZsAKQoMAY0gW/SNFdCz+bf1mH14JjBYDMRLXoe+3cN9hVNBkf15PvqpYAGzznk+1RNiPVlRs
	+M2/VuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcc-0000000HVPK-2RPs;
	Wed, 17 Jun 2026 14:52:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcR-0000000HVFz-3KRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b37e1f48so41302995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707913; x=1782312713; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y79oPW1dRkbvOFQ/8D6OY6Iq3f4xRjBQw7MgzYvcGaA=;
        b=b2aQpJRCKOiZR+tceB2seQJ4XQYbohPn7y/M/+vmAjxAkd52hi2LrYcIuHqMGUXcED
         2pCJE8AyMRB4yEo1MxcqYlOP3s98pov7xtswGntleRWTvhw2f8S3Oy/RHIoPAM2sIuzh
         o8bV1ZW0nHXL7ZFrcO7Iga6LFJcJpoFElH5AZrPNj7t8rCFRQ40NKwMHHhCyh4uLl+0h
         B6EZobBskcC40LZZYa23iIz+Hy6gsqnrbd3ymRUStKkIVFmzMHik8zDgPBYXJicQvi7b
         s4oFWfDpgqBX37CGD9eFHKhEqk3Jakh1m0YqYMyABu35o+o8ykyDrgksayo/gsjigt6t
         zpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707913; x=1782312713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y79oPW1dRkbvOFQ/8D6OY6Iq3f4xRjBQw7MgzYvcGaA=;
        b=T4EP+MsRp7GLJxBRNNCu9SrgT7wVSQnDhAxNIk9Kx4mSiRiYZPTaThR49V6C9+Qc+y
         0bka9OZBLhcbrcxeDFFUyovVhS0MBVi63/LIdQkgQNO5/eeGc2P8dO8JF81WWsebXPmS
         WNf3OFL9CBwvTEhPB5HDBOg7y3jKB6desu7d1h5Gh7iYujMAhw+hszp/SDJa5WGIZyR3
         ewMNgBIQ8qNR2So8jiiU8moP5Q6kkKIJn54KzHMZPvRpel9fCdHeGxAJmi5uVbkyeyxD
         igtU1EYVXz+1WhJAW+dWjf5LbZVvGyyFDwOpKtPAVCrqbc+2qp3zIdT01YqPmP+/VzFp
         Ib2w==
X-Forwarded-Encrypted: i=1; AFNElJ8Iw/o0XH/zQ6d7gKSfhPgu2D2SvUcIa/98dbD+p42GYXKqv5aXM+mLQtqbCtdBOQUdCPeJ+HDiNX9hvzlu3z86@lists.infradead.org
X-Gm-Message-State: AOJu0YwnUL3fX32WEVZpqq8pvJKTPLfCflOPE+0kzLq3AJUU4XCo8+DO
	E1scG2ojTb/DzsxLKaxD+A3sMLmA5/fzpWbQKyJasVSBPgLUkhxTzPtxAfLCMIRHohudz5CEgIC
	bkNYksjawIHUoTQHzAczQoSsb0KgMnw==
X-Received: from wmxb4-n2.prod.google.com ([2002:a05:600d:8444:20b0:490:4477:50d3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4743:b0:492:1e36:bb03 with SMTP id 5b1f17b1804b1-492333f829dmr72605705e9.36.1781707912951;
 Wed, 17 Jun 2026 07:51:52 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:30 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-8-sebastianene@google.com>
Subject: [PATCH v7 7/7] KVM: arm64: Zero out the stack initialized data in the
 FFA handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com, Sashiko AI <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_075155_839535_C86B6015 
X-CRM114-Status: GOOD (  12.53  )
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

Don't leak hypervisor stack data when using the FFA_VERSION call.
When the compiler doesn't support -ftrivial-auto-var-init=zero option
we need to zero out the stack initialized variable before returning data
to the host caller.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes:
https://lore.kernel.org/all/20260616160016.C62C81F000E9@smtp.kernel.org/
Fixes: c9c012625e12 ("KVM: arm64: Trap FFA_VERSION host call in pKVM")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index d7c5701d0584..b321682ead04 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -883,7 +883,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
-	struct arm_smccc_1_2_regs res;
+	struct arm_smccc_1_2_regs res = {0};
 
 	/*
 	 * There's no way we can tell what a non-standard SMC call might
-- 
2.54.0.1136.gdb2ca164c4-goog


