Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C658CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bdxg0o2btss9qMTZzYA98i+uvFmpv+cRF90VMWdHIeA=; b=zLU7wI4ZBBdg4bcaiBXfIfharN
	Wvdo0LS0pjxRq9I3c5uzm3iQp0y3btCS1CbYhpu/uFwyynQuzDck/WlHe0HuNMe1I1bwRjQo/7Rp1
	CCvrG8DbfwKJPpslSiOjGJ39VneVXxGI7/7eFpL5eayHH39Lbkw9uDZuJVjGuQ2xhD+O0yV4yWU1S
	JBXPhv3QLr8f2PJA+fODnyK25ntk5LpL0aQRGslN/eiGuk0qO7sYLfGcUoKQhledX9HGzk7YgLHEo
	iRrCaWbbXFe9NKsES8ALI6SgFQC1ukLf0GvdpwUA+1bNVge62Q6mX4xUEikyCUTDbWzBbyYKLMtXg
	Yi9yrRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnri-00000005lNI-33Kg;
	Wed, 20 May 2026 20:50:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnrd-00000005lIe-0QbA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:50:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48919890a95so27949735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310198; x=1779914998; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdxg0o2btss9qMTZzYA98i+uvFmpv+cRF90VMWdHIeA=;
        b=VOVCyePGrs4plEb87etTXhs4WAV2DH5tb5Owl+Doafe92jytb9udiEMd2yzHrJQMQL
         Wf8/BSUODtFYP0loNZIjZ9dv8cY7ymQUZyYGy3g5Yy392VTOU5AH0QjsnTQaYDgyWGML
         BAyVHrywvKSRsHEUt1Ry6MPbHemUdPKdM9f2NfJxHgNfL2aeLX8BTU1hpkphwzm9L4Dj
         V3mRWdkYfYK0OSOF2ALRzSVrGIZaCb+sHIX4k3JV5Ls40ZX8T3ZDmEzav4ardjmTtz6y
         i4/ypH7XsgiTl+lbw9Xn2udRH9rVeDK0WSfmukOSgRWeyS6hlADpKsQDOgfrHjlrqM5I
         79Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310198; x=1779914998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdxg0o2btss9qMTZzYA98i+uvFmpv+cRF90VMWdHIeA=;
        b=f7n7XaMjMjmHRJzdecd7pOCGh3asM8/eOYmtKU4Pf4RNq8Cpcq6X6hp3xzrSovM0W6
         RTpnNfe9chAna5Hz8nwYcKfhOtE4Xvc1z7dQZukxvW+2z0/FALTri8KE9LfjjjStTHCw
         W/3+PAqJITM1mW4RU7Kr/w84ieg/XHEVSVAgd5LSGjtHH8q7fjWHAHzJJeUH7ZozUntC
         +5wRZLTDzO77XSJPNY+04wa3PqHJGUH3Q6DkW9myyvAb15itMSK9S2CWiP4yqyI1/abV
         UajyCbRNAvRk6oIhZURgpGIwScSHq9ZcBvF8g/gyl6S3TtbBuyfYFfZXdvguNz7OgC/F
         PUcA==
X-Forwarded-Encrypted: i=1; AFNElJ/NdwSIaO8hyBMf6nIfPnuxN/4rc36+mZohUro7SX4LgDX1UzJ6Z1IsmSz1ySwyaZpvAfppzuGsZF/SO6GpYc4v@lists.infradead.org
X-Gm-Message-State: AOJu0YwVc/e0fCqL69dSDHDwmUDdFw44fpva8HbOovLXEqyAzWFoaPD6
	O+3zfV1vs73VoBUWooJpH2xDMsfS6UTH+4qmU7WxuZf1L1INcZbSWPGyuOQExPJvf3Ddkuws8Yp
	nUy3WppOtuI1ZIw==
X-Received: from wmxb16-n1.prod.google.com ([2002:a05:600d:8450:10b0:48f:e53a:e4bf])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e53:b0:490:1640:8269 with SMTP id 5b1f17b1804b1-490164089c7mr213656225e9.18.1779310198457;
 Wed, 20 May 2026 13:49:58 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:48 +0000
In-Reply-To: <20260520204948.2440882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-6-smostafa@google.com>
Subject: [PATCH v4 5/5] KVM: arm64: Validate the offset to the mem access descriptor
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_135001_191364_AC2CB963 
X-CRM114-Status: GOOD (  15.43  )
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

From: Sebastian Ene <sebastianene@google.com>

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

[@Mostafa, Add missing call to ffa_rx_release() and use fraglen
 as the max buffer size as it is the only intialised part]

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e6aa2bfa63b1..38f35887e846 100644
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
@@ -508,8 +508,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off + sizeof(struct ffa_mem_region_attributes) > fraglen) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -576,7 +581,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 3);
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
-	u32 offset, len, fraglen, fragoff;
+	u32 offset, len, fraglen, fragoff, em_mem_access_off;
 	struct ffa_mem_region *buf;
 	int ret = 0;
 	u64 handle;
@@ -599,8 +604,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	len = res->a1;
 	fraglen = res->a2;
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off + sizeof(struct ffa_mem_region_attributes) > fraglen) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		ffa_rx_release(res);
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	/*
 	 * We can trust the SPMD to get this right, but let's at least
-- 
2.54.0.669.g59709faab0-goog


