Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318DCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQFj/8TPJyuneEGc/c18D84EbHbY3hzTyS99LAP/4do=; b=q84iJCIRxrCNULHjEGU8inRuB4
	tZGSZ4TpOi7QtphkbmJtaqZHolQe9F4mlt9MHNv+gQX0SVhj8vtpYNanwDlH7ctBwSpDQmTnBzhvd
	pxm3AijoLwMQQpamqY+CVEsWhJpMLEKfAQMY5ZXsJcM1G3gLqmNXHmWvunxNGVYz6lFmi7WAp+lSj
	VDWd8LcqccGxCVN81gJp+SR11zMM5kL4rVCuGz7ieJPfHO1V3Qw0UTKwcBJ5mQZFXTtEGux93elH4
	lMANcNLTrzP6mC3szPY/qu4y0r6Tw4ahwA/rw9ujDstDD7jCvzHqjuZWRBJJaFS8f/DxWEDpAVNIx
	HLmQ4YqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcT-0000000HVHS-0qyC;
	Wed, 17 Jun 2026 14:51:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcL-0000000HVC7-1Di6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490ae461f8dso44676405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707907; x=1782312707; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQFj/8TPJyuneEGc/c18D84EbHbY3hzTyS99LAP/4do=;
        b=gyhGyCjVMT+8v9la1nVnlIPL6dRX/VlFPn+VunHS+Z1/Ow1oUp8q/QqS1RPqrbkNbL
         Q58a9y5IVGD2nwEJ3iH9v6UTumutNIMxfaEWk0iVSwkTngp99QmvC9+Mkk+AuBq0UfH/
         3ucxBdfcbPwm22/cIVFjli6X/UBI1RnoqpatBMJc7hP9u5DglO/bBxLHVH/xp5hymxcm
         Z9ge0VOtfDF+XGk5Aa57H+BggdidFl7fl3m5WlMrZ81b4qy1ds/uFSDfmLRx9mJ318hG
         vsDtfx06wjPHmafwJLowdTIN6YLKfljPfw4wIozJVnfbEP/I3eyvyCYNwDE3p2zka/T9
         ZvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707907; x=1782312707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQFj/8TPJyuneEGc/c18D84EbHbY3hzTyS99LAP/4do=;
        b=UapETAWeT6cMVuZRyOWB0aTvFERCXHHkYkXn6MmSuEzK7oaGGioYJ/srYT39xF09/Y
         4rTBG/B/aJhxWGurdDkpYo9or8+lKbnf5J0g1HQFyLYe7M7YadzyKufJljuya66QXnwm
         CeiMx5lzUHGxvmIwcQKjExWnkwPppLYiHfVtFoA7WQiB62xLxBap6EaDzfmlJsMK2lwN
         JzTjNJmt0TJOB3tKL7mE8Wps/5T5yvI9WV5JHuo/hfMXxQc7X//1uYsbV+XyXgj1ZIZF
         Gr9k7OhVkr4sgtpOcQm0eXHS4qGC0fcJeL8qCFc8SE8qzXcfjZVABlaiiJVHnp8a6oor
         AJtA==
X-Forwarded-Encrypted: i=1; AFNElJ/yLRTXe2iOMi53MXZ4FmL8TehDDF//RC7zuxCVLZCD+wcfKv638KuXs/BDbzIp2haEq91eqLmujv4YkZTnzZ70@lists.infradead.org
X-Gm-Message-State: AOJu0YyhDb5R3MmKbiRJMLIixZN6S9bR36zmLBISqY9X8NGKIEHcai/t
	W991mJjuDqnst+2u0m3Y5Ivqe6Gim5wxZwmjXA8i4RT05Ly6u211JDPPf65Nb+IgHsTlChw70a5
	s1thmOHcdugCf8XgKmrI7qJ0B6ZLgtg==
X-Received: from wmbju24.prod.google.com ([2002:a05:600c:56d8:b0:490:b18a:b4e2])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:828e:b0:492:2e7a:9ba7 with SMTP id 5b1f17b1804b1-4923339fca0mr74090555e9.3.1781707906450;
 Wed, 17 Jun 2026 07:51:46 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:27 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-5-sebastianene@google.com>
Subject: [PATCH v7 4/7] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
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
X-CRM114-CacheID: sfid-20260617_075149_344869_E31F10A7 
X-CRM114-Status: GOOD (  15.55  )
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

Sashiko (locally) reports out of bound write possiblity if SPMD
returns an invalid data.

While SPMD is considered trusted, pKVM does some basic checks,
for offset to be less than or equal len.

However, that is incorrect as even if the offset is smaller than
len pKVM can still access out of bound memory in the next
ffa_host_unshare_ranges().

Split this check into 2:
1- Check that the fixed portion of the descriptor fits.
2- After getting reg, check the variable array size addr_range_cnt
   fits.

Also, drop the WARN_ONs as that will panic the kernel and in the
next checks there are no WARNs, so that makes it consistent.

Fixes: 0a9f15fd5674 ("KVM: arm64: pkvm: Add support for fragmented FF-A descriptors")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..2d211661952e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -607,8 +607,8 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 * check that we end up with something that doesn't look _completely_
 	 * bogus.
 	 */
-	if (WARN_ON(offset > len ||
-		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
+	if (offset + CONSTITUENTS_OFFSET(0) > len ||
+	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
 		goto out_unlock;
@@ -636,11 +636,17 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		ffa_rx_release(res);
 	}
 
+	reg = (void *)buf + offset;
+	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {
+		ret = FFA_RET_ABORTED;
+		ffa_rx_release(res);
+		goto out_unlock;
+	}
+
 	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);
 	if (res->a0 != FFA_SUCCESS)
 		goto out_unlock;
 
-	reg = (void *)buf + offset;
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-- 
2.54.0.1136.gdb2ca164c4-goog


