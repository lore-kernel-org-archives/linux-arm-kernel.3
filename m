Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE8FCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJ3aIExDf7Vwm1ZzRemWe9zF2SleuBxqq66clvypQjw=; b=V/Cz7tm4QkFDOfmgq8G6QpxMCC
	JGfC902HELuHrZJDOdZjBRDHEy7KHuxLZlGD8luVvv2GVYkPr+BSl6qNTbx7DtHnSA7Enf7WGkrP8
	uL9yUV/TKUCwI4SpEHRMVCtwkhx3A/RjfUAIickDVzWuXo4kitwgRf6WwpxzgM1+2dlG9Wnx9h5Q4
	h2MA4vGdKEr496Et+l6lCBD4druXSZGu6Dgop+b1pcUHyweiHI9Ieg012hYW6aKETx4UP9w1mnJKE
	AAVe9ijnkCgSEaQAnXxhEN9woAcrCNLtHmGltu/BxOVYIBz8RJvi0ANHwLp0hRP8hFwWEty4X9saQ
	RDQqsDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDd0K-0000000Fmlt-1aAp;
	Mon, 05 Oct 2026 07:20:56 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDd0H-0000000Fml6-3qQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:20:55 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49e6862e924so14475115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791184851; x=1791789651; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJ3aIExDf7Vwm1ZzRemWe9zF2SleuBxqq66clvypQjw=;
        b=keNNRktd282TyE/WzQA9NnanFyu3vOA1rCmPqgcrUDrNdXYGObrGmHDsSPmgS8fYWD
         5Nl79CEXuv5xDlB+N+1x8Ad//1VO8trJFZVcr9Or/YcaaKQhz/W3rRb/5RUYIYPEi1pp
         T0PxEa2xvzHqIlKVNXwrjJympj5JzdXU0vxvAcC7O9892+fCcFqTeFLpLI2RdX0zW2BZ
         ZWJno7ix7y15a1/5MDiVdxz3mX9P1v3bRqv1LpOg1zidXMWKh2HQqcfudW8JgBzcAhK2
         l5LN9c9HbZcpZ5dezjF+zwN94XSQzC2PvgfdQnL1Zd9l7I/5fupRqtVeuKoht85QuWe3
         AlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184851; x=1791789651;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJ3aIExDf7Vwm1ZzRemWe9zF2SleuBxqq66clvypQjw=;
        b=XTHC+sadSmhGUo0nt+arI2ujOKgd4h51RA42wgYmi0urcd2GvHNR5D9ZJZHNQ3eGsX
         dgLrDRd89jzfaiQDkFEqIKzfFXZgDKI2OCH4oZsxWoHjJPNydINeKmdOw+XJOU5F/PIv
         jRb/IoOhpOefhOPel6QUIjwv8ZV+LlHqA10mvvgidkQEBGb4AUk2a3KRV9PI4PNJdrQh
         uItWzF9SlyxZ99msUb7/5TP5O6fbg/hA/WTHNvtiqXGk1idqByZoCg23+Yb4bo1P2sxn
         HoBZy+TEs/WxjkezGd1cLvIkCrWDicPAUeqxtUUtsGEGncBiBonsZR/EIrMxzzJxVgNT
         7/YA==
X-Forwarded-Encrypted: i=1; AKwUvBxwll25dlSO8BoVAjgiREB9DGiUZ2z8jf/CJgDJNTILJSOdp6+Igep8bszogsl5AhzsFY6MnAYK7jDBmmjAMuYl@lists.infradead.org
X-Gm-Message-State: AFuF++kSwzQGZcjStqg570Ta+1FpBWZoceEfBgs15TNODpiDI2lahow+
	M53/QdaJJ6dwR+ldFOQ0PrIOAKGS59yC6abSwPXl3lVDM8GYGLI8Uee3Sd7SE7vQLih7diiJ+QT
	jCfeBw2m+l8GvcZdjM0nNmQ==
X-Received: from wmbgy25.prod.google.com ([2002:a05:600c:8819:b0:4a1:738b:7acf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6287:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-4a1680f5050mr86675175e9.18.1791184851211;
 Mon, 05 Oct 2026 00:20:51 -0700 (PDT)
Date: Mon,  5 Oct 2026 08:20:46 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005072046.2246900-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: pkvm: Drop keneldoc markers for the allocator structs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_002053_989885_B9EC78E2 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

chunk_hdr and hyp_allocator are private. Their description is not
exposed to the API documentation. Drop the kerneldoc markers.

While at it add the missing description for chunk_hdr::data.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/alloc.c b/arch/arm64/kvm/hyp/nvhe/alloc.c
index c1881c0011c9..e1e6dd21cda1 100644
--- a/arch/arm64/kvm/hyp/nvhe/alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
@@ -28,13 +28,14 @@
  */
 #define MIN_ALLOC_SIZE 16UL
 
-/**
+/*
  * struct chunk_hdr - Chunk header
  * @next:       offset from this chunk header to the next one.
  * @prev:       offset from this chunk header to the previous one.
  * @__unmapped: Internal field containing the offset to the unmapped page
  *              boundary, multiplexed with the allocation state flag.
  * @hash:       Hash computed over the chunk header.
+ * @data:       Chunk payload.
  */
 struct chunk_hdr {
 	u32			next;
@@ -45,7 +46,7 @@ struct chunk_hdr {
 	char			data[];
 } __aligned(MIN_ALLOC_SIZE);
 
-/**
+/*
  * struct hyp_allocator - Heap allocator
  * @start:		Start in the allocator's reserved virtual address range.
  * @end:		End in the allocator's reserved virtual address range.

base-commit: f0406245cb9855e6318335a8a223551354291a46
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


