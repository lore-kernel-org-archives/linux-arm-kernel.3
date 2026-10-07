Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B933CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um9DIN1VQq6Fe9AECVFWfBhzFZQMTDd/ZaQ8TuPlfn4=; b=Wu42hyTpPu9g/poZG2Eu7FdYqD
	KOxkb1WAQJNLEvnJlxjOiCXvSL7nI3jPKp7cYFFrQxdQEVG8frgNHVVYUI1NDxlERMULQcLhJUarw
	mBsYPbG4b2AQC1ciCKOcqRZH/NBMgIMCwcXcdeZabMNmrg1cPAYSxUpU92d1K8QaDZaAcBpgnb5l7
	ZGbLJ1A9tx11ziZr5VzeHnqgJCA+KnkeHgIYjGr2y/PrDkOQQCGJwhaWXhQQReKo/QWf5kf67+x21
	lx01eTEnB97Gbd8ooBqOxFppocwn/jbFkzVTZ9C09UDSR0/P9vBjB21z6/7H9AaSDAnuCjzrR1bL7
	WF/Gfh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB9-00000002fsE-1iLd;
	Wed, 07 Oct 2026 15:03:35 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB5-00000002fqJ-3d5U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:32 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c2e5d6c4e8fso536403366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385409; x=1791990209; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um9DIN1VQq6Fe9AECVFWfBhzFZQMTDd/ZaQ8TuPlfn4=;
        b=kNLGoZ+/pA1qsqkH0qLfT7Wm4aKTeqjYWlMZfgo8LOuYELCKdpaj5xKPuzXbsWUGtx
         Ny8xYdRY+ieMj/nm1An6+iII/4uy8H2sFvOyNbyYY5ixVeTY4Mevip6dvQ8ML+/pIfn9
         B9VXuhEhZXIoUmp3RadjK6Zr0KeWB5PbxpqBS5wnTzok1Ti5BlnxyTqfQ9ppRPEeiDOU
         YnYEpz+ZWccyVDXWhswI9s/J5epYeiE+H03fvDZwRpS2rvgDilzGi3klF+wYuVgMno3p
         4iiYR3cabD4sGJhg25ZDzEXCcUFap1S8F3CP64R2QJq0I48/PQEPH8j3++QWS4hglwUi
         Ia8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385409; x=1791990209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=um9DIN1VQq6Fe9AECVFWfBhzFZQMTDd/ZaQ8TuPlfn4=;
        b=eXH5JL0NwwH6SF29SqMavrcX9ypGgesSLmbssil4lQ1m+HYzBrHo+2IGzlkHWEXWxI
         Vv7XgfGe08qt2kvE0k2Gyf1YUwdfG+E21g2D8sf+H/jl5/BJP2ujjPyWtF7nGNaroREL
         OIITBd96Vhg2evgt1hARqCZDoZlRzFzTMeWaPN2rWIBw48cr+xOQk3mxr4cIvULa0tIk
         ETKdYpzKpSpnD3RxPpSNbNrIMoXuU8Q6+PfmY7mYPtsWSQvkuRHmRR5RV56EKcRW4qTl
         n8RgT5CsF2LazrKOfl9zO3o+oIIo04JQ2qMM2f3cg7+QFLKf4xCxr7JwU0j96aJ6bWut
         67wA==
X-Forwarded-Encrypted: i=1; AKwUvBzDOtX4bdrH8FYR62N5XoaejSh+I+CUovR3NopAf/Te0UEABJTy+tIhQpHA5G+BYEKFKzIzWNXYGNzEABVd/kdF@lists.infradead.org
X-Gm-Message-State: AFuF++mCgmVA2ekF1Tj9vOmQmx9Ylm45UQkBYuHbs13OW1933bgbKU4D
	6NG96pA2+KHU4eDl+okZrtlWQnXptjzGMDEodAZJlvj1Lx5DgpXP/SNTXg86P0r7GBlUwYhQSjY
	pnVMwmOWM2p/hRLXqYZTQNw==
X-Received: from ejcfz7.prod.google.com ([2002:a17:907:9587:b0:c2f:15d2:2eb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e90:b0:c31:5d7a:eb97 with SMTP id a640c23a62f3a-c317c12e94amr256988966b.40.1791385409106;
 Wed, 07 Oct 2026 08:03:29 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:51 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-2-vdonnefort@google.com>
Subject: [PATCH 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080331_907226_E8145F66 
X-CRM114-Status: GOOD (  12.00  )
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

pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
which is already marked __init. Mark pkvm_init_hyp_services() as __init
too.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 26fe9c3f22e3..e7d7cedf7f6f 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,6 +9,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
@@ -96,7 +97,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	return 0;
 }
 
-void pkvm_init_hyp_services(void)
+void __init pkvm_init_hyp_services(void)
 {
 	int i;
 	struct arm_smccc_res res;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


