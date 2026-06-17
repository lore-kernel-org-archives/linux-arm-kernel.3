Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB30CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw1QEoh+UiZ5XFZdVoOucXmJoUZRDixdHeCpCeuLYa8=; b=MJZpkeHP2DPVnVG86mUcBVqpwa
	EyiAPOCJUJHLOs4Fx70mktRU3jrdtEtCo4uMi3Tcu0P8ZNxLBkGVqaAGrGeNxFIc58ysUZcz9uWva
	5sArk2ifZTu8iiwfRwsMhsgdM0DzVZcymLPtAYfo2hAuzqyJHpPDuLClcbrY6ZCJmN4NbHjXiDKnk
	JZomsoG0bMqWttr1S0O6D8zfgLEz4MSkaN0tNcpEajZaJLCWavOhXhxEdyOCmDzLyg38qtV1//4t8
	Q+bOY2s5Wd9EyI4c2hZfjVNhqDRsYMJQTSwbyJkkVgsq/MRfjTVnOW1CpURC9AuOffAGBkBtTg8Em
	nwxtfqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcT-0000000HVI5-1lHw;
	Wed, 17 Jun 2026 14:51:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcP-0000000HVF2-1z9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490c4f61a34so40255795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707911; x=1782312711; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw1QEoh+UiZ5XFZdVoOucXmJoUZRDixdHeCpCeuLYa8=;
        b=G7ZwNOlRYUepHye1KEFq9wsbZSa87KIfNQ5BoJvdCPR6HWvJz8sUMMhQN7yn33zpYx
         t0Q9XTUyvuNPlVEJ4ZRqQPeYTv7RROEnNTS0WJq2trhK0WFTWloUkPL0g46Ldbf+wOud
         9GGsRCe3jsq/w+Z2TwR2fZqZ7YRXiSalwkZnrCeyLWzUN5P6LtIf+YVFU1MuEp3zQHcm
         Vrjvdf5IqBdgGY/vuajc9X4SR3RW7esoB44HYiZW1SvnwGcSIYe6jQ9GYPlW+MhXCy9C
         RUuvyo0bLcu2l0uid5O6HJQpwjLZ11sLqGS3ruQjM5NG3fUrv0mY0fyMKcw11cGuAcpy
         7X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707911; x=1782312711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw1QEoh+UiZ5XFZdVoOucXmJoUZRDixdHeCpCeuLYa8=;
        b=R3pjlcsO0Fqf/Tj0rh8mfuS00sLbpYrzCbxJf6EIukXWaImv//2f7YXMggQIXX8vZP
         LSh7MQAmkaViqkVmqDZDqxfe5K7Mg/YpJBV7kLrC3TUVhKkfaQVI3HhPjNARIgTBWYV0
         THxkTCUChW9ohGliHEisncKMI8pkKHhFgHhwcXLcsbV8fUQdcdMgBuEQ6GV51saYAsrh
         Yd9iIW0diamY8L0udJwDh0S4+k1FqKm/Dhab8pMLGGJNcMe2ZuyOWZSC71rhZyhwkHgr
         eYNO+o+9mJOqlOVYaw3DX0jVnKp40Z8ytfSJzL0ORXGjkzjwbjY/+pGIft74QBTDujZ0
         TY8A==
X-Forwarded-Encrypted: i=1; AFNElJ++ze2oN/ahOeaVKDuxgepMwMl5JuPkQCVlNDr4hyhl0L4mgYgYOCffpNUk/BnvrfQ6enoq1J5/lmTibH47fOAs@lists.infradead.org
X-Gm-Message-State: AOJu0YxHW8KxCvJt+zQMNjHPP1lMEEGQF94zzULlvN4japQZS6NWNNGD
	ByfnEwxhKps1ehyuGVnvqzE+c3MZ3fgxtxSGZE2AXO6P560Sk9AwYghcjiHORKMyy2rnL55/4Pe
	C/GzvwLAmlKBvRR39R1zNL7KfrziWzQ==
X-Received: from wmxb4-n2.prod.google.com ([2002:a05:600d:8444:20b0:490:4477:50d3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3148:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-4923412f0e7mr58923595e9.21.1781707910745;
 Wed, 17 Jun 2026 07:51:50 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:29 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-7-sebastianene@google.com>
Subject: [PATCH v7 6/7] KVM: arm64: Ensure FFA ranges are page aligned
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_075153_523316_5F8E549A 
X-CRM114-Status: GOOD (  13.11  )
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

From: Mostafa Saleh <smostafa@google.com>

At the moment we only check that the size of the range is page
aligned, and truncate the address to the page boundary.
This make an assumption that TZ will do the same.

However, it might decide to use the extra offset of the neighbour
page at the end, which is valid under FFA if NS is using larger
page size.

Harden this check by also checking that the base address is aligned
and reject it otherwise.

Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1a2abd0154c6..d7c5701d0584 100644
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
2.54.0.1136.gdb2ca164c4-goog


