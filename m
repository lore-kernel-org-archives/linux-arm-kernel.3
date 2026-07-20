Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A58C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 18:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S5nupuNnvy1/UCEDFI+j9MKHZfxLvOVR3hoi5nrd1M=; b=gQnecm54EylPJ7F5qgYbPQWq5b
	e/6yYoQaY/seH7vWKihGgCSU73BMzal3/K7JQejoaVmEQ64Np5dE9pCIR2lrKEF+heeeeDMPD/ola
	ZVq5Bsgnhq1OFvCOBY7D/GPiZG/nOeyYyDcxTyGR0iiksRmkT4T94XwIG+BPZXMK8ludX8gbTqsny
	EcreIEZA0N9LjmLCoPyvF5sT0D72rfzdtpHKUgW38zBWUsecCz7ZzHQJZ2+ruvh2In3uJ1Nu7mQcF
	T54S2RD9f4cojVZurQ4hNTVLUqBRkXVDRCpz+8MWG5ZYH2wQBZYsHTI1RWtt2+jOvgdRgVyDMvUFy
	9cQiZEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrae-00000007Uym-0t8M;
	Mon, 20 Jul 2026 17:15:40 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraZ-00000007Uq0-1Yrm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:36 +0000
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955ce558d8so14255085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567732; x=1785172532; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1S5nupuNnvy1/UCEDFI+j9MKHZfxLvOVR3hoi5nrd1M=;
        b=oVcpDkUUFg4EwGhUSA43o2vK/K6+r/TAEoD9QS+A31Y28IuY68B16TPCu/7A7Iu8xS
         OfGsPlbu7WNCXb66uqj1SrKbY9UxyRjYM61lPkG0300uEvwKqXH7Z3KpuT+8VFwQvVx2
         slnH0pwHN7eqvkx4+Igx1ioELTqgTw9Wen8v0Vo+ZRBEXwUa6Hfrkldvs6Nb8itY3dJY
         JT1g1tCIpkyxMEGF/ub8gzVX8vO81uKgybtQ7uBtcn0uFxv7HfhCF/FVjwsveHvFkJlI
         3kIQ4mLxwd52vSEm6NTuNkyhKozlB/EeF3kBDPGyYkJ24YZWEBUy+XLE6P9zKPBcBtPY
         1hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567732; x=1785172532;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S5nupuNnvy1/UCEDFI+j9MKHZfxLvOVR3hoi5nrd1M=;
        b=dbvDO4xLdtW8j1hNzozAz49PvYavDkGLt0FICxyNNNTHG8TcRlhCWziM5+IBKdktde
         k71FW0VYTb3yUAjUm3rD8HbZOdwGNJXqMpHbG1DK+jLxW63xX/toO+clXr1XD+w9xb5P
         9YotrOa0l9iQG7n+RY7Rli1kMIiVEwQDZ9g4cN/WDApvz4A5rhQI3XkmkZMKB+3Rmeyh
         DSFskIfa9zp8SFKEi6Uzsqp4omWjz+tYIieynZYf5Vv40j1thtHsWDzr3gf78ncmvw6u
         4Yz73bjzv9Tb8JNT3278Gs2oPhs9cvNYSe23QvAgCiim3phS4rN9Vz92A8PehWLGapE+
         pRCw==
X-Forwarded-Encrypted: i=1; AHgh+RqSO35hURb7GeXGPt/YelmOiLEbLgix174UBuOBw3L/vLtLviLTUQwD3ohWoSnQiI0szxfy0HK/aywrXeNkKF9/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb1DUmNhFOsOdFDR1WXYhZb3H0M/5ENSNUP2NDRyR4F5ODNW+f
	aqwyihd+BMDjtjJI0DOgrjxoGHug/yDWzrtH7kilr5nIHSCyX7XOBSIyT3jMzz4/tfrEtId6off
	s4Q9YicFCJKzc+2pZPv1pVA==
X-Received: from wrqo17.prod.google.com ([2002:a5d:4a91:0:b0:470:41ef:7017])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr154472795e9.15.1784567732287;
 Mon, 20 Jul 2026 10:15:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:07 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-12-vdonnefort@google.com>
Subject: [PATCH v3 11/17] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101535_508801_956F3801 
X-CRM114-Status: GOOD (  10.15  )
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

kern_hyp_va() is idempotent for the hypervisor linear space. This is
handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
pointers. Those pointers can originate from the hypervisor space (when
protected mode is enabled, we don't trust the kernel and the hypervisor
uses its own copy) or from the kernel space (we do trust the kernel in
"non-protected" nVHE).

This idempotence does not hold for addresses within the hypervisor
private range, like the ones you get from the pKVM heap allocator
(hyp_alloc()). To resolve this, filter out non-kernel addresses based on
PAGE_OFFSET.

Leave the assembly version untouched as it has no current users.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a68..d60e5f2de10c 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (!is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.55.0.229.g6434b31f56-goog


