Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE981C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsJ5Z8DyAJvdmrOoxOJ7TrWR7XLa3prh+sP2FotAqRo=; b=uOq8k0L5v6VLFbjmvNkaORqP1p
	/hj0vzAYQLLJ1DUSgXn3jT5npF7EwS4EUVbfJkAwEnWu6K7jkQaflen//NULaOFgXI3chRroDJrAq
	46MdHRMbvTZNHkjiCzM5NMbcQYYh3sI06M0NlBQN0QvMvNwO4BUoYx1L++s3Q7MMpUmLOQCeJIyuG
	JGnfHI3TivtwTJS7ITzDA7n1Dcj0EIiFMXtJGeMUOBE3B+B03NrDijtQIHlsQoqNsrnHFPqJEPOGA
	2HdBzcJeL7vwqMd8STEBIurUPg/RorNqlqMqhBzE3XIWrEqbmlVJfOaM7QxkTBgpTN9IKcAdbleIQ
	G2Jils1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVat-0000000GcIj-20Ue;
	Tue, 30 Jun 2026 10:21:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVap-0000000GcG4-1g2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493a6135742so26625395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814885; x=1783419685; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsJ5Z8DyAJvdmrOoxOJ7TrWR7XLa3prh+sP2FotAqRo=;
        b=RdZt8OfcYD8gWW1ERq/L3ul7Ypm9hxB15D6JEO4uVmGXJ/mf4PLYMGZr51A3aw5KCo
         qUNz4RtzLJ+y5mnfdDnQbw9Gu30A5oKI9InKpKH9PJm1dK5NhnWrOK2TC6wsDQKdRoN+
         yhhGwzPg/uHE5uGCoMWAFlr1ZuS8IS+4rrkzunzxbu2pDISH5tTqhOfF2ZWWK2ZAzr9Y
         nTebnTWmoPeSkWH0O0C5n2gFlY46H5kAtLuixCpWBnX/m9IHg3QxvAxJDgWKm0oEAMwh
         rcU1NQPoiQDH8Xnb7nvIU4NR51GuGZDTnKrdqsM3p1pclvOQLAUjXY09SILnBha29ZZR
         Iv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814885; x=1783419685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsJ5Z8DyAJvdmrOoxOJ7TrWR7XLa3prh+sP2FotAqRo=;
        b=KdFxenXNW+rhqArMvDoW+MFwIgv2d3oIpJ8jML7sosqyjrFw1nB88Q8FOW/40puult
         y/UUJio09MTp7aP5uwG7Nyrle5Yd2U6FzpjFfYRMgV8z7N37Zxx1VoRPuwuFuu8dgYKm
         T8sI3fWHrq4v6EVTB57HmfhJOJ6KLpfXdUJrWdR3v7Ougi78t1PugYYJJ8Mm7BVJXW9u
         HvuLYkCYS3tICJKjWNhGAp4HDKdcEvyu1MEY1G9+Cqy7+Tsnaerei+nBohs3fVCm0ENy
         H/zR4FXvZbFvbpienx8Wk8DtCigo9x/lNQ7MeznHWxN8scKw9qWEzYBXCd4/N1gtOL5R
         +W5A==
X-Forwarded-Encrypted: i=1; AFNElJ+IqSxCn4IoDP+S7wScofBySF8aDCREwqTzrxI+GmhTmBYk2R4QCns0FvHUFxsGQ/Q21idNGwnOOWhP87Gi1cO2@lists.infradead.org
X-Gm-Message-State: AOJu0YxB4mjaN5yQqnTObVd/uYPUOBjgAyNNbp2tSJaFYvOCnNeRSwXC
	xx0AJnS4uZD/4QzWU/h/I7AsL3jE4kFPnjdPIL2hXf0Jq16k98xhfxSPC4UTy3b40tmHoR1NzU4
	o5Db+VRz9zpwJ1AOOjaoWUyhkyaVSOA==
X-Received: from wmcn17-n1.prod.google.com ([2002:a05:600c:c0d1:10b0:493:b636:4efb])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6218:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493b8289c5fmr47379145e9.9.1782814885168;
 Tue, 30 Jun 2026 03:21:25 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:56 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-5-sebastianene@google.com>
Subject: [PATCH v8 3/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
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
X-CRM114-CacheID: sfid-20260630_032127_485872_2BC2CB74 
X-CRM114-Status: GOOD (  16.09  )
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
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
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
2.55.0.rc0.799.gd6f94ed593-goog


