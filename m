Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD7C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyGZakZ2i/l8Ijp+dx1ly7m47WNFgufwNDcjOd78FW4=; b=rXDdLqIa4uPmosQVa596Ttu5Bg
	dq5YPa5ESirHIL3QYVphs2qBsHDueZ8oXIRNKCexxzzX7kplXKSvlhppRCrO3jVPvguWRADKNtxN2
	r7Yhsoa1ibC2AQ/YGeSPILHilnBr7q2eBhWr6Jo0V76fuKt1Ncukx6L7Dz0oWwxZVDB1/ZYZoNVKt
	10KWhEMd/VWzg9PfK4rkUIxARSV/jlFlPutQKqKKZzo5ddtI6dOnhjrQ6j14mm64Saenf5J/AVIeG
	CVhDiTVBs+I4d06IMTUVlr063F+GZo3P6Zu3ikAP69oHTUw2IJuuGOjgs4XcKYN2N8QNP0iWfGc67
	q9jHJU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVb7-0000000GcRW-3M5m;
	Tue, 30 Jun 2026 10:21:45 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVat-0000000GcHc-1vwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493bb6a4336so3938975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814889; x=1783419689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gyGZakZ2i/l8Ijp+dx1ly7m47WNFgufwNDcjOd78FW4=;
        b=aWXWHUEu6Iuar3Pch/nkeca48eLKMl2WCrfdy0c8gNiWEZfSr2AvaxzKfojT7KzYdK
         jkzkuImhcGpb+My9VRpWyn5CFUbQAuGg/sYNXfiwsS0sJ/SqPqdnMRoCOIw0GJj8fvSe
         KV2XsAvX/WPSp84WeK0XgKeu2uZUQLCufD3AapchBJm4kHgbWLhcTjwYpgIUTNrhkBMa
         QH/u6BKtWqKf5OfWqCLkLEJMVTdpAEuX6+ot3JQdbK2adaEvdFfmOyHH89V0Wv2fL/uV
         prATOQ9Ss7+VgiTtmH4MB6XeATCAv6YYsFFB/mmoZM6evKFMXpS9GKMXbhd1KpPmQNgb
         vuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814889; x=1783419689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyGZakZ2i/l8Ijp+dx1ly7m47WNFgufwNDcjOd78FW4=;
        b=OKS7M7DoMV1/o20rYfJOD4b2KkJUf44XV9CdgR1ktKO3k6i6n/9kIFoJcMuzcykKfW
         5CrcDD7Bdgd3fU4xPSfhce67vUJ67inRUK8J+CvgbdWATuiezV5Q9gFx4jDQyfzQAmO1
         LUL9VcfKnVgcKD4ioVFaR96CEsnpFgLupipXsg9S0oivQRmt1isy+qpru3v2RUQg8wKj
         iKxPqq7EN2vgb1/BEWO3RQ5peQ1CgGZBz51CZLC+vHfe9ti+vKiIha1SheYeorcdruRG
         L8y6qtZ/ghcjciDV9pK0jHoSXiY1xVbOnzCxlYQcHlNb4WRlvpkHbvnV8b1TOi4VJ0SU
         SxNA==
X-Forwarded-Encrypted: i=1; AFNElJ/QiQNYj9IRqCMsuJPxYTncyrB+e358hb5ovymilXjqNWiNqvaGuBT9UvQ/VTu90x2ltcwvpLZbsaLQnJNvTntu@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3HNqZaphLrtPT/c8CbgsOaGzSi9YGw6wXuhiS66fIREUIvcH
	00Z4eda/rUquUAAQ7HX4i1xKJxc8lZnVDYos8lOFnNt/I1HudOyWnIPeWY6nPhyYV/01ggBZqjV
	yoqx+wW8m11/2HYBqqWd0OkhfzpfrcA==
X-Received: from wmlv8.prod.google.com ([2002:a05:600c:2148:b0:493:b8dc:89a7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b32:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-493b82b504emr46612095e9.25.1782814889210;
 Tue, 30 Jun 2026 03:21:29 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:58 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-7-sebastianene@google.com>
Subject: [PATCH v8 5/6] KVM: arm64: Ensure FFA ranges are page aligned
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
X-CRM114-CacheID: sfid-20260630_032131_527545_B97E4EFD 
X-CRM114-Status: GOOD (  12.76  )
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

Harden the check for the constituent memory region page alignment
to prevent over-sharing when the negotiated FFA_PAGE_SIZE size is
smaller than the system PAGE_SIZE.
At the moment we only check that the size of the range is page
aligned, and truncate the address to the page boundary which can
annotate more memory than needed as being used by the FF-A.

Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 14aa37846059..bb01d8f83056 100644
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
2.55.0.rc0.799.gd6f94ed593-goog


