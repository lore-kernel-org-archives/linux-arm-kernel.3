Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF56CC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V1GXLq2HqBHIx1U8RtZLo2I2pqPpplv4UNHwKqoIWBU=; b=tIfu330KnlvHoO/KxrrBTIkzQz
	oSyn8rxYGFWrBslVmucSBUzjfvcUNDVo5H1KkW574yDPVTrPyMkPO59e/Rjfhzub8u7Y4SGCimIkT
	PlvV9NkLLbItxGVAZhvlHslboEgoT8sh/YwtoAx/0yjoG8gQ1KX97RNisIIXIfFQ2cDk6g2XJwHEu
	BmRsEuMMzSHAz0YvX9D3zqavHHoSlUFSDMfEA5GS9YK+GKxgYTz+v0ontajKXdcUatUWo2M5UzD+E
	WZfpp+8PiAZf32oteoHTau5Obo/VGTStTiDznKOFs8Djr0+/+Xd+rcC583/pvfBUNh/YtGk7wYAOz
	5RKjY1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQrY-00000008v0W-08JL;
	Wed, 25 Jun 2025 14:12:32 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNnF-00000008O91-2ZHc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:55:54 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-606aea61721so1403388a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750848951; x=1751453751; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V1GXLq2HqBHIx1U8RtZLo2I2pqPpplv4UNHwKqoIWBU=;
        b=j98XbCuqh5eM219r5C7+c8PDl15kRw4xxqwLSNjc7adHUjYr/MXCQPEl59F24eaxiW
         Zrqr9f+sZ5e5anlzuja2qGmKhLc/IRdjQnCa2PbVVcOR0OcQ5sYxRS/eQF4a5rztPtky
         YTzF3LVVSwQG9r4SStQrrEUophCKr+mYCGXTs2PnpDBHb1mXY086hVQnIlh7qDKsPNm/
         PRokA1xIwUqAtth2FnOEckgxxA8CrfEgpV54CFE8g1fTp708fjOCL7G3JB5g+x/KAke3
         37AVH4u8l4Tupv/FemFEiFpwu+CXl6uMtPsufxOi4b+4J109Qlk329th5nbPrTsWBOMC
         FfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848951; x=1751453751;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1GXLq2HqBHIx1U8RtZLo2I2pqPpplv4UNHwKqoIWBU=;
        b=pklDELNnSHoyvWbk6gobRf9IgwOpDBIWwcT61RF1DwlkxDENR5FdwQ6OMbqtQnnZhm
         /3GMgZ0SHnnV/Iq3ZmIZZ8ULF23ZlprLnBM5Q31IMBFbxMt5XjmP8k4rrDLLRHfN6LuJ
         V0dhMGA6y/4S1RqCqfD8LPnTWO5mc/Wz5zNmJWbRQIPFChm7pAdM5uzGaNIEEuqXFIy5
         0tdvaI0gpqZzL5u4UIqxpeHYQ7vLSpJ2EqezpflPRO1/i2u6dBI0Tzm3dwxGVtJhOnGy
         UpZ8gk1/FFJaOax3Ny+KRv27VC54mWGsXXPrDNqjJCwNuyosLIHH3QUK3kAk7hz6oNGj
         8x/g==
X-Forwarded-Encrypted: i=1; AJvYcCUNQ61Em/kxoFXOlA/mWlKbVZc0aMuI2EkawzIqzftrZxqvEA6bRD7YmDWxZLRfrM3AgZ7Uqr8VeK6+CGjrG3qf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhy1XvfnSJg8ybTydGSenc8TgvlZOjork2z7KJDZKJavMhlrPj
	/fGMOkO0B9Ys+GODgU/RKMGeR/zh1mVNbLiuQyPGpydqhtLHX2gGcgR1Td25KEpp0rqldEQyzRn
	95FM5Xtm11Q==
X-Google-Smtp-Source: AGHT+IHUR8NzJ9FFoX9Hr5oMdShDNs6NRkAE3kBsnjpl89mkWn7cGms6VUHj8zcgECBy48WdUiyOSlbMzG/D
X-Received: from edtb19.prod.google.com ([2002:aa7:c913:0:b0:60c:5b8e:e20b])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d3:b0:608:8204:c600
 with SMTP id 4fb4d7f45d1cf-60c4d31789amr2084880a12.3.1750848951221; Wed, 25
 Jun 2025 03:55:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:55:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625105548.984572-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Adjust range correctly during host stage-2 faults
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035553_667451_340665C2 
X-CRM114-Status: GOOD (  15.34  )
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

host_stage2_adjust_range() tries to find the largest block mapping that
fits within a memory or mmio region (represented by a kvm_mem_range in
this function) during host stage-2 faults under pKVM. To do so, it walks
the host stage-2 page-table, finds the faulting PTE and its level, and
then progressively increments the level until it finds a granule of the
appropriate size. However, the condition in the loop implementing the
above is broken as it checks kvm_level_supports_block_mapping() for the
next level instead of the current, so pKVM may attempt to map a region
larger than can be covered with a single block.

This is not a security problem and is quite rare in practice (the
kvm_mem_range check usually forces host_stage2_adjust_range() to choose a
smaller granule), but this is clearly not the expected behaviour.

Refactor the loop to fix the bug and improve readability.

Fixes: c4f0935e4d95 ("KVM: arm64: Optimize host memory aborts")
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 95d7534c9679..8957734d6183 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -479,6 +479,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 {
 	struct kvm_mem_range cur;
 	kvm_pte_t pte;
+	u64 granule;
 	s8 level;
 	int ret;
 
@@ -496,18 +497,21 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EPERM;
 	}
 
-	do {
-		u64 granule = kvm_granule_size(level);
+	for (; level <= KVM_PGTABLE_LAST_LEVEL; level++) {
+		if (!kvm_level_supports_block_mapping(level))
+			continue;
+		granule = kvm_granule_size(level);
 		cur.start = ALIGN_DOWN(addr, granule);
 		cur.end = cur.start + granule;
-		level++;
-	} while ((level <= KVM_PGTABLE_LAST_LEVEL) &&
-			!(kvm_level_supports_block_mapping(level) &&
-			  range_included(&cur, range)));
+		if (!range_included(&cur, range))
+			continue;
+		*range = cur;
+		return 0;
+	}
 
-	*range = cur;
+	WARN_ON(1);
 
-	return 0;
+	return -EINVAL;
 }
 
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
-- 
2.50.0.714.g196bf9f422-goog


