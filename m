Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D104CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4coEQbrBUmFUrjDBw9QngC1TQrHyKn5HQ1tDIlRoapE=; b=kWSSIsFrbVzCqU3ZLVhgkfih2H
	olAJMcDwuESI/14f83uAj1UTqoWd5OEg7FAd7kv9GpaFhSGXj6Q00/FbHD9IK0Lt7SpIVFonIv6jo
	W1zN3/KCde0qyIl9MoPWuJmdvvAJlSxwZlDycxS9GMykQuAf20aDlsH8v+YR8iHMEn8+6GfQ43QN3
	g8dhvtu5QaHz/iigGMPkQ5wwTBFZe8DH/AKDQsGXXvR+eQIZQ6KClx5bQ5MnqQlYO3+2CfAIih+kW
	XJlaR9d/ar8/UWuloG98WiQRpv/Ya3DpsshnZ09GGe92aKOlcyVAV29E1Tj2tRY+gXpxbMtrH4vNT
	calaJh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITqt-00000005hoA-0m9u;
	Thu, 30 Apr 2026 16:02:59 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITqm-00000005hly-3rO3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:02:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488c0120047so8777485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777564971; x=1778169771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4coEQbrBUmFUrjDBw9QngC1TQrHyKn5HQ1tDIlRoapE=;
        b=gPMhicgNBndG4+FYmGwjOAsSRvbVvw+v9MuRaKc4o3FxQBXSslRIC+SZ2tAAAu0TCO
         FH9oQkG5Yk5wxspGD9zqUH/6l2SWorndAAqe777TUtf4wJnm9zxiIdKTF93dEQsynBLQ
         ubTdmDetpB1Mfwi7y918CSmOcyYBi39NmNpV7eXWiIldN4IJnhV2Lax4efDOFJW/l+cO
         xWg/ZSq2VwPIIWU8DzDHcCeS/JSUNyUqHIlRpIGyrFefLn71yEIm++RD1Y6FR9ke3qFr
         xqw6ICpQS8oQAcsTnErPMrP7b82QDuzCGFga1m1E6uBhN1c6HkWU/yEv08knXsfAGyjH
         dVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564971; x=1778169771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4coEQbrBUmFUrjDBw9QngC1TQrHyKn5HQ1tDIlRoapE=;
        b=ZVRrNyyhRQz4WpfARvbi3LLRVgc6ABOCF1SHGYYxJ+otpjBaKT0U+UeQVyIbP75Ttz
         mGUy5t5rb3XXfJc5nh6bL5tkGiL6h9g1fDi/JYQdOgFgJPloph7pmwGhkcrJLzOWLIHH
         YTg8ObjoC5IgYN1k0jDDhAESE24EGWPS6MRlJ1yq6zmIhYsztlM/Ob79GmaOXrXiwEwq
         2vjkMW2gb+0whCSTNXHzRJ1Kf7WJMMun7B0TeNEh5E0P54Wl1pPBDpEg6V5Y9ZIM44HD
         wFasaqA3eLAaqxmzwV8lfEjIs5GFbKE0ADR+B1x9pS4hoqzpTgV/dwTQ95ZY8V868wV1
         9s3w==
X-Forwarded-Encrypted: i=1; AFNElJ8iamn/kpRenp+Seef3/sIkQMrhKzBQcMQ1bqDsUZozBRfrObxB+qu67TS57kBFBJEEg8IYhw85/FPa1v8IvKr/@lists.infradead.org
X-Gm-Message-State: AOJu0YxXJZxL77bIYaCYrqyeH/AOZnW1vfJxgiPa05DfIRPt2nspufeh
	dgtj+j5Ge3gtOWOsrOjkvauS7Kae87zES1qbz/jZhIOpNmYEd/c8Oq0rAZ4vxjApEAwDBryKXwU
	6i3U4rT0rDRGKzkIrquysgV6Hit4nZg==
X-Received: from wmjx19.prod.google.com ([2002:a05:600c:21d3:b0:487:2186:fcf7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a14:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-48a84451bccmr53589865e9.18.1777564970647;
 Thu, 30 Apr 2026 09:02:50 -0700 (PDT)
Date: Thu, 30 Apr 2026 16:02:41 +0000
In-Reply-To: <20260430160241.1934777-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260430160241.1934777-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430160241.1934777-3-sebastianene@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Validate the offset to the mem access descriptor
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	sudeep.holla@kernel.org, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_090252_973296_E532077D 
X-CRM114-Status: GOOD (  16.12  )
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

Prevent the pKVM hypervisor from making assumptions that the
endpoint memory access descriptor (EMAD) comes right after the
FF-A memory region header.
Prior to FF-A version 1.1 the header of the memory region
didn't contain an offset to the endpoint memory access descriptor.
The layout of a memory transaction looks like this from 1.1 onward:
Type | Field name | Offset
[ Header | ffa_mem_region  | 0
  EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
]
Verify that the offset to the first endpoint memory access descriptor
is within the mailbox buffer bounds.

Signed-off-by: Sebastian Ene <sebastianene@google.com>

---
v1 -> v2:
 * don't enforce a strict placement for the ep_mem_offset since this is
   not compliant with the spec and we should not make assumptions about
   the driver.

Link to v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

---
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..8e9017fc8e39 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges, checked_offset;
+	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
 	int ret = 0;
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
@@ -508,8 +508,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off >
+	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - (struct ffa_mem_region_attributes)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -576,7 +582,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 3);
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
-	u32 offset, len, fraglen, fragoff;
+	u32 offset, len, fraglen, fragoff, em_mem_access_off;
 	struct ffa_mem_region *buf;
 	int ret = 0;
 	u64 handle;
@@ -599,8 +605,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	len = res->a1;
 	fraglen = res->a2;
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off >
+	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - (struct ffa_mem_region_attributes)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	/*
 	 * We can trust the SPMD to get this right, but let's at least
-- 
2.54.0.545.g6539524ca2-goog


