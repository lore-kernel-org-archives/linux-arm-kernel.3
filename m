Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDFFCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85gj1ffDyGndAMiyS2A+jf4wwjz9v1ON8M3WpC1uUQ4=; b=NWlm/Vf3gyUH8llDT1/XYq65Oc
	gcycq3GbbRs9PDVHPKNP5I+NqGoAdZ6kW2cPQReOD500ZCn0skggmmEEj2/xsuBK8A96mLXoLiDXZ
	nJX5ysfOCnSOJUATjJVmqfcXmK7IaN+5qyqP1XDfg30DWSKUNn9vP8UXeBZmBu8dT7tnTr+QVPcRN
	kvxOIoEM8Ah2kn4JFk7vB+BySekAABMJJGhjux2GKQpB3WGdTn0DyWCzwQsHjW3/jLGa8XQdBIms/
	k7oMr1Bh9bW7jNWXY/lzRvQpoKF6MV0DBGYNfmigY12yWdBN+5O3BvHntoP9r2OqrZOQuZOPj4AwN
	qkUPMwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZX-00000002Lds-3hKN;
	Tue, 26 May 2026 15:19:59 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZT-00000002LaM-1zea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:56 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44696b11265so13206196f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808793; x=1780413593; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=85gj1ffDyGndAMiyS2A+jf4wwjz9v1ON8M3WpC1uUQ4=;
        b=Uh4zUQQD5+AleFt759dmVOKtuSmWP9A2xtGIY+ZFkA2Hd9LljFT2hb9riUh+yTve1H
         i2IrRi7zgPoCY3UtzHL226tHnvLbsv6ICmFauf+5yR993W5H7rSm4QXp+v9NSwLWgjHX
         5+bQ3eaYwhZVxFkD/6unzxEMExDgEr89xx60QW6WeQEWhZyNp14Ia8bd6IY9UwMTr3hc
         FUT1TU4CxIwVfuqpbWL1YwBL2waOPArVOaDIu/GxSM7eDLXGN2wTOsnuC6BCzaKDfQ4b
         xRlEdiuqGyBfPQmvBOC9sNI90SBtVo1ARZ/EQo94OkFc3GFW1PpDaFrBburrUAbUut8e
         Lr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808793; x=1780413593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85gj1ffDyGndAMiyS2A+jf4wwjz9v1ON8M3WpC1uUQ4=;
        b=hY/x46++EuGZoppzkm0Lhxidv3gmj0xiKY6n+o5MJQ9xLTSz4wD7wJQjvmwYIJFx9M
         C99cVhKILOYPyIEe8lGTA7Hiv/CdEe9OwAIrqF7aS9oQvmUsAQ+1XpKUs9R0GXjBIwDJ
         hWUq7YpKN2XSATnEhgn/UF0NQmBuQhxpPRRrHPbnvd9UZdNL8R0b1sWQm95v1GU2vZAl
         8WSPnXRMoKEB/QXZVNV0sCUiY3QWDcKHcHl7hVmqutF5187ArV506sD+Ix57I4L4IbNs
         Wk7ByDQIHZDV5nXfC0iKLj0oQofFNk8izQH+rTlNMMHR4eou3YmNXAUWdFXLJ5HEH2a/
         mfeg==
X-Forwarded-Encrypted: i=1; AFNElJ8EUmzHFG6KC0H4oWpEEfrakYLVJHeUQB0aZCxWmUl2j3a4t3GXo1wHGD/DauDC5MzCbC+xBTa1aoCwpYlPsNNg@lists.infradead.org
X-Gm-Message-State: AOJu0YxGZfHepV2oVqfTrFZX2Dj0bwGL2sS0AllVC+ZMViAAWY/1BHS/
	Vpb5v6qTd7G89D8U3bE81rLmXgt2waprNqfR0ZsnLHLg07X++qcsfrsWpmWs+DitlngsBDYUrDw
	wJt+MD7Pd/lNWBw==
X-Received: from wrbdq16.prod.google.com ([2002:a05:6000:cd0:b0:43f:dbbf:52fd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2883:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-45eb38c8b80mr33942919f8f.35.1779808792997;
 Tue, 26 May 2026 08:19:52 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:34 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-7-smostafa@google.com>
Subject: [PATCH v5 6/6] KVM: arm64: Ensure FFA ranges are page aligned
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081955_519231_E8CF2A54 
X-CRM114-Status: GOOD (  12.25  )
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

At the moment we only check that the size of the range is page
aligned, and truncate the address to the page boundary.
This make an assumption that TZ will do the same.

Harden this check by also checking that the base address is aligned
and reject it otherwise.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 79de358333e4..ea39e3362efe 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -352,7 +352,7 @@ static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
@@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
-- 
2.54.0.746.g67dd491aae-goog


