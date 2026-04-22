Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6445F9B60A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5zVG8CK37G2H3h+/vsooWmb/JX2s+XnozBdTiycqzLw=; b=YqsErPfWYzv8Fj3b1LRmoJmMCz
	Eu3zCA32gGT8JKZDwB8ysc+WQcUMHz/5N+8A9H0g0fk1r0agAZrIf2frVIx9q81BvECU6ns6jQeHk
	j9+bTr8WXwSuD1ukrO7/Dk7Zk8FxXNf5x386QMqgaz3k4BjdUtS/vcYYD0Rq2uYgS8C8sBrYKObL7
	mUMc9nZhsYfjtdcyoNvMbXoawMmTKQZJ0z78ena+c+tuxSzbTp9DifdO7ZjXLENhpwMIpcJjreZDN
	tWrJRbzEGic0m9245Mqo56wHtLcbluKkSVdWYj7OUwuDzHWD4uNZsr6UWH0cEJTueL75iu8L4um+I
	kUyc1wvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUmT-00000009wkn-1jHR;
	Wed, 22 Apr 2026 10:26:05 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUmM-00000009wjO-40zG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:26:01 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43d1fec59c9so3199557f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776853556; x=1777458356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5zVG8CK37G2H3h+/vsooWmb/JX2s+XnozBdTiycqzLw=;
        b=vRkGW3kgpeEILaRUBbRn4G+nVnrP9xjKNqvRCaRbkF9wxPik29cXFF5KxLMfC0guAP
         1RclAREdoU6rwEx2Gu7VMLjsiUj8W3AN9OMRD5oGNVb54SAZAs6dY8/48R/T9waWv1hs
         tfvwzYblvf0pI6EHENLai+p6UoRYONeU1FsLK3S8KkhI+7MNjqU0MOS3jJjFoXqohUtV
         Vk4aIno49aRMa9PMZ5BFEV0L658jD5xWnqyI4LNnj9bp6kDcea+4bZfPqwXnkGNw1kmu
         Gev+osXH1suvsorEXSsPJ2BQOgHKbtX47COg2GBi/d6Ch+gu0quPmHrnbPFkDCJ3mx3L
         v8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853556; x=1777458356;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zVG8CK37G2H3h+/vsooWmb/JX2s+XnozBdTiycqzLw=;
        b=cmOtwBkbn3F9GaCjAzd9gtiq7RhkrzVxmeD1Jov/5VIxMsB362Hwkq7ob4wBj87Y6a
         atPXCtTbdLAd1uhs8ZNZ7lTT0soOjJQoGkF1sSiXpAOKd+B0UmYwN2RrrL8NF4F03ky1
         EfLt0Hj8icDdnpWvhtw/Jl4jG5dn5hbFTm+pq0i0P6oMJ5Dmnh7JXRqbYyeh5CqeK+En
         Tk3V0nnT8cvs6mvAFfgXCcrwwASZ6DGiw6raBGlulb0a0lApKtJFDXZJizO/+5tFpxSH
         Ch1W1+GnZC1haP3MM0xS/NoFrb8AfP3PmPQjEKxSPcuVAk0V3lQkSubjeagExH7rukp9
         IMyg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y98KaMEpZPKoYIDWz+KTTPyRQYxZ7rmr3Y871T7h1YwteglboYJo7HrbWd9VgEd2jOTGgLpqWzDeCNZhNIYSU@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvTL6UH6eUswU2qaEIShoXQ5b7lf4+gyWZc+ljbTKyzNUhCbs
	VL4mnMrrRCubGVDMTKJQgEm71U1o+4VEVJ/sI5IoP2Z5iPJfwUscvExXngC8eSkrXT9lTA+Oeuu
	1AzLAmWgvM9FSa9BRjgotX/2lZhcg0w==
X-Received: from wrnl17.prod.google.com ([2002:adf:e9d1:0:b0:43c:ff2f:44d7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2812:b0:43d:7192:2ca6 with SMTP id ffacd0b85a97d-43fe407e0eemr21607407f8f.16.1776853555738;
 Wed, 22 Apr 2026 03:25:55 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:25:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260422102540.1433704-1-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor placement
From: Sebastian Ene <sebastianene@google.com>
To: maz@kernel.org, oupton@kernel.org, will@kernel.org
Cc: ayrton@google.com, catalin.marinas@arm.com, joey.gouly@arm.com, 
	korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_032559_026362_48B5B9D3 
X-CRM114-Status: GOOD (  12.79  )
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
FF-A memory region header and enforce a strict placement for it
when validating an FF-A memory lend/share transaction.

Prior to FF-A version 1.1 the header of the memory region
didn't contain an offset to the endpoint memory access descriptor.
The layout of a memory transaction looks like this:

  Field name				| Offset
					 -- 0
[ Header (ffa_mem_region)               |__ ep_mem_offset
  EMAD 1 (ffa_mem_region_attributes)	|
]

Reject the host from specifying a memory access descriptor offset
that is different than the size of the memory region header.

Cc: stable@vger.kernel.org
Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 94161ea1cd60..0703c0ad8dff 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -508,6 +508,12 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
+	if (FFA_MEM_REGION_HAS_EP_MEM_OFFSET(hyp_ffa_version) &&
+	    buf->ep_mem_offset != sizeof(struct ffa_mem_region)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
 	ep_mem_access = (void *)buf +
 			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
 	offset = ep_mem_access->composite_off;
-- 
2.54.0.rc1.555.g9c883467ad-goog


