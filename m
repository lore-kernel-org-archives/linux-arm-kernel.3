Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE08CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEFq2rr5EDnNpZBggFgHhQUVCsgLj0Cjnpte+1iST0Y=; b=MXogEbFmhEpUQB+yo1hHturQrz
	CHi8+pE/yZiGZpVIwhWTtK64gnejYDVZt5+MwrHwIcw+/ol5MwrTNBefwobTXHrdDdIas9OFmoNFo
	mjReHMApU/wc2v4dQK9QIscezAp3zIv6BrlNtNlPmNAZAlhHBAHtF+jg3W1fnDY16S8baKXF5wdXH
	sCBw9wrpz7wULgtHufGHOQh1uQ5G0fpDgJuOzD5xXjbYnKCdR4TRx5z8JEyuuR/cU4i54GeXxVAJG
	s2eIDlIV0e1JTu3IXHdm4mMwfWikP4tqlWLoNY7lOtKBLQDZIXu8IhKaVWMqEja+l+UAavRM8OBAo
	+ccr2y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmj-00000009NTK-01tL;
	Thu, 01 Oct 2026 14:29:21 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmc-00000009NI7-1CZy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:15 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48afe67dfc2so668042f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864952; x=1791469752; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEFq2rr5EDnNpZBggFgHhQUVCsgLj0Cjnpte+1iST0Y=;
        b=GTD11Gt0pYQLjkU81dM1lhOrjief9jQDeOuv8SwxDC3CrsE7V5kwyydW97vNX1QlDu
         o2hgcrKuhx2CHrmOZ+j++pnIDgXRiiFAmqd3nVWiWRAeWQgGuXHOEwes2rK/qpQ8uEBE
         Pg6yqm8kWjUBT22/yWAJzRq3Xz/vCOuymeZF+e6MHeCi6Yvk5iAX7EhPdwvu8AExIXP1
         uCbEDwTK58/m5aqrGmkFRe4mMSKMpZSlc1o4/i4GPyWnVmi9YsaF2l7yFuuFm9KisgIP
         rsILt0WnA4zeVCCw6BYflqokSShAMY7YmU+K+jmCt8nVuULDP8RyFuVmpGuCvetI5mVg
         3Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864952; x=1791469752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEFq2rr5EDnNpZBggFgHhQUVCsgLj0Cjnpte+1iST0Y=;
        b=rt3zRhObvRLXP4qcv3lgHKvB6+BtNoHjOblXQNdLw+uZHx8qx5y6ycgKCnll6kuETo
         cBcZU+t+k5ufPINRxr5A7Kx1RD0XL5awTUQoc9CJKh9RANxBnMXf6ir9sUwZgqH47Vv0
         PyQSq3ypfWyrPpEgL2RLvNC/TLT7CST8mRuhOb/xdcORWTMsBtlMhBkgxdEG3l83mYQq
         zSqg7qUnlaNnyXJEqokts3N3+SkgMFNGv25xmJcWxz/mznv5ITxgztJJ8cMdWBM3PYn3
         SYGppaI+asNQjDArlbzSYMGH/xHdm/w6jvNwQNk1mpE0OH0H3CjzlTNvmpJ84d6o7r5M
         T9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5kKPWKkiZBlpKeZ/mMB+uOErnpA0BbA+fNcv2Kxsg1Ma5FwpR2ZEAG63nn8njt2Zjs8vkuzXxQ/y2rbzf8LZ@lists.infradead.org
X-Gm-Message-State: AFq9FYK1JgKVmlw20z08pzuYKxVfC8YsTTu3sNA7sqmuS8xp5ZIXUizP
	uAFvkkGfNKhNRnjAXARDF8fs5VXAppotgAtSiOUnMMaLM21DcOPIEIBwVBkAH8a732NCu/JHyFj
	SEJQPBAtVKfVHEqj/1AOr5g==
X-Received: from wrck9.prod.google.com ([2002:a5d:5249:0:b0:48a:fb3c:e7c3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6791:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-48b068c7fd4mr5362558f8f.16.1790864950779;
 Thu, 01 Oct 2026 07:29:10 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:42 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-12-vdonnefort@google.com>
Subject: [PATCH v6 11/18] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072914_345637_1AB21CEB 
X-CRM114-Status: GOOD (  12.71  )
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
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_mmu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 57f65257bb56..04d9f59db976 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -128,6 +128,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (is_protected_kvm_enabled() && !is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


