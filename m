Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362ABCD6E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e46ed4u5Cv0I3gq+GXl599KXwFIbkYlwQRCW4+ScRKU=; b=nk4gr2NcG+yyK9M1VefD92rTEZ
	+uhd+0k0Z8pg8EClU3zEWaoNQsewmvk9xMaRLbWdt95GOD7S8sDxm4VzshOF+wytlcJTaN5EOhz5S
	E2Wc+nleIfrnuQgygIwXdaizskPsXkHYc9mL/A7sPjwp4tcevxBcNIIk/yMSpUOK7Q21WvMxzVfoi
	qIGhtrvGw51yq1kE9NX80JE9ebKOxS5QlqZKn1tppp1KhHnccEiyGelB8kry/h4RCBxgxLLSusaOa
	Bmu/5JFzMPfU5oksdC7sqiJoAH/w4f3ezNiOOUfG6zOZbed2HgF0fnT69yJtZEpJO8UFVeSVt7T1C
	00vAEVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZX-00000002LdZ-2zAc;
	Tue, 26 May 2026 15:19:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZR-00000002LZD-2vBf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490402ae2c1so45516895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808792; x=1780413592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e46ed4u5Cv0I3gq+GXl599KXwFIbkYlwQRCW4+ScRKU=;
        b=aE65WmC//nx/esCPE8LETHmaQxaqhF1Yc4kAlDFXzUBHLL/LxmHdWgffUpZQvDPQJX
         l6g04JlZP3ti4piiwk8fPq7gXltQQUmGV5vnNs1zG/+5wugenbbzQMYDMMJJ4DqFFTBH
         xDAkwEK3/4c+5hLF6COplkIoANGBv8eJG7xSyXo4WW7EAuOpLFQ9BnsLjLwGM4fyH4ul
         oSJ1xlm6XX7Xkno8tuOsD8jZGTjcQDcYUvVu7Vk7gWHeoJ6RGVPSlYIHm8QQM/+maUJW
         t45n6xIqIU5h9QEwBXoeuCLozHN24jo/5IT794b6rMJqg3CxDpKrlSF4QgHmFfaKICBY
         82VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808792; x=1780413592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e46ed4u5Cv0I3gq+GXl599KXwFIbkYlwQRCW4+ScRKU=;
        b=r725OF76q/lXAIF7reSh4Fgkv7o/EDJzaRJ/FItuZ5nJHhrel4CmLo5lc8tJPDmTcQ
         RPUFOIyZEtHN+gvnB0sfO1F/e2hsyyV1QEEFK8fgLJIjvkOuypJt++v9WK4TYHJzNGs6
         yFQAPRz2rt5PUIe9v+/y01Ttzb2dFdBZ3GB0F3CVubI7Y2Anvqpw/7eQYZj3enCDRUpA
         OKo8jJRSELrL6WAaVdWOuRjUhlesvWCqwlPou+HNLKvgdAtwGA4QTLR5h/BKGH42mpEx
         kLU/LQ4odCiVxwDOjBz8GeJ365CgGuE7zjiCft1Lq9u/xZ2RVbETMwWFP6ddJE51APFZ
         F4JQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w/2pLFMBKMtlucOAVyi658PkvqBLWCl0PyZe8MqFCWhAKLXLblYsSVTA7hfuk0/hGDnNwAsUO5xa4Xu7H9I5m@lists.infradead.org
X-Gm-Message-State: AOJu0YzRiHbnGkCtUgvZvD8DOKPrYErf5OL6MjAp0fup1Hy+nvd4IGt2
	IbguZkN+hEHOfifYc2lWQ/aH7TWzvNfi1w/l5+fFtMggxVNn0GLNsnXXgzQM9bCchBvZ2UaqUGK
	PNWWA+0gNr66vOQ==
X-Received: from wrpj7.prod.google.com ([2002:adf:f547:0:b0:45e:75ad:a480])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5681:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-49035f53c64mr252846105e9.10.1779808791592;
 Tue, 26 May 2026 08:19:51 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:33 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-6-smostafa@google.com>
Subject: [PATCH v5 5/6] KVM: arm64: Validate the offset to the mem access descriptor
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081953_758295_BC8DB3BE 
X-CRM114-Status: GOOD (  15.84  )
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

Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.

[@Mostafa, Add missing call to ffa_rx_release() and use fraglen
 as the max buffer size as it is the only intialised part]

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index b6cf9ad82e12..79de358333e4 100644
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
@@ -489,7 +489,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	}
 
 	if (fraglen < sizeof(struct ffa_mem_region) +
-		      sizeof(struct ffa_mem_region_attributes)) {
+		      ffa_emad_size_get(hyp_ffa_version)) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
@@ -508,8 +508,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
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
+	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
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
2.54.0.746.g67dd491aae-goog


