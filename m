Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDF4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iFUw03iAYkA2yPtETYQdaDhPmq7j8x1+kmN1DGn30Jc=; b=AMJ/UILMPEww5xJ4WwOGkmVjv6
	Oxp5jE24JQ6GSApnthejGk9+J1gIojlQCs1D5CzMGzznC/7tpDmCR1xi/MeFiyPx30OGMt25m03Vw
	mjUxPNd9dUShTG6Ekpx3ikGhEt4ITKeRBTmidy2uG1QEEmVDkUpWNVmEJS8Wv8xlsbSKUsPsBRfAJ
	BfUarbk9pfk4DpyCgcfxCrfnu1pOI/gHWDua5sHIozw0lNj9l92iTzGo2Qq+W0vnp9HhYTcfbHJdy
	zdTBuPoh1kV5ZNZGAKtYBbzdnGVuLNeMEU9Tadv0VISUfLvOyt4IERu3xb9jNWtpkdXKtnFR9vToC
	xXNEKD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiVp-00000008nTI-07XA;
	Tue, 14 Jan 2025 15:07:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiSt-00000008mi5-1cfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:04:24 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862e986d17so2199630f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 07:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736867061; x=1737471861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iFUw03iAYkA2yPtETYQdaDhPmq7j8x1+kmN1DGn30Jc=;
        b=RYxDYeCfOdYq5HiBRJ0zfA4CTYFAuDxmBmdIxKZNAxWHxn6EHkO1Ehv7/4aJrFUiXK
         3p7PadAj53T9u/qfM86ySTySYhwHO7jeHa9j89HOFf4F+puTo8aBtwFoCAJ+BwONeIpl
         lmXvCZerB2/XejuEWus77UqGr4+0SxYlgZSbjsxnPQZhRZZaiXezlbyxILwnM05xP2EN
         HajPqXp1BUf0LSinPcX5Ekv3WSnGFyh3V1HFnCjBUuQ4VdChoNkimMZqlssUVLw2iC3A
         wEaAzDyVZp2saNpzZ+5iMWszlQD2bfiuwgwqtxGj1lNnjyoThm6TAQwfHtwtOb47E4gh
         rFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867061; x=1737471861;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFUw03iAYkA2yPtETYQdaDhPmq7j8x1+kmN1DGn30Jc=;
        b=bsa/Y3fTXxPz3iaVoATB/TCE2XAg0WURAtNEiXasgL9IiD4A0wCWwxCOkQ8RdA1FYr
         nNz6NeobBoVVOLBzGBgJzIQZ3L1VwXMfQENx3hWHdbYm02R5uz4cn71SrB8UzJSYpSVW
         vHFAkNe40nACTTL7U6qyhb5xKFx21jb8+jl7fxaoaoR9IPOWAi4kaI5FXedC3RsRG0kV
         fP2VtXdv6NHl6vP58p+LHY2Wis1xxtiZ+hki7gVhKnX6xNinc/UVs+SogDMIHa+qQ1/E
         bTLzmzGZmW1zMNGsfTt5g3JQV+BJ17Awnb4+Q63kdbN64NbL/lZ/cp7lzjGYdEZKCQGO
         QN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVw3dDuCO8bWN7e830jvRLAIsqMZjFjJNc1BcOG/g1h5IpzB2Sjo/sacu8uhPhYLbstjzgaGGtNywqehnJtLwFu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5n48r2T2OEJzKKItSbyXlP4CLGZpPAz4taZiqYCPo8XbO7V25
	uVChWGbRAAPGFAoOFwVCbd3/C8UwRdd3p1zerHVdVQZZ8FNu6koQzCrIYmtBqsO5e6T9b3+wjnH
	wEY4ot6kHWuNxvF0PldFFR4W6fw==
X-Google-Smtp-Source: AGHT+IFpiqH515zLDuPDEl5YMg0JiAtp3YAmq0zTvt8gaVtr3+uGQ4dNXSPwKEF4OV6mX+3fdYiNTQoSKScQSyAyQUE=
X-Received: from wmbhu19.prod.google.com ([2002:a05:600c:a293:b0:435:4bd2:1dcd])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2cf:b0:385:e961:6589 with SMTP id ffacd0b85a97d-38a87303d73mr20369063f8f.20.1736867060920;
 Tue, 14 Jan 2025 07:04:20 -0800 (PST)
Date: Tue, 14 Jan 2025 15:04:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250114150407.566762-2-sebastianene@google.com>
Subject: [PATCH v2 1/1] KVM: arm64: Fix the upper limit of the walker range
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, sebastianene@google.com, 
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_070423_420820_ECAE9BC8 
X-CRM114-Status: GOOD (  12.57  )
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

Prevent the walker from running into weeds when walking an
entire address range.

Fixes: b1e57de62cfb4 ("KVM: arm64: Add stand-alone page-table walker
infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966..2ffb5571e 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -260,7 +260,7 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
 {
 	u32 idx;
 	int ret = 0;
-	u64 limit = BIT(pgt->ia_bits);
+	u64 limit = BIT(pgt->ia_bits) - 1;
 
 	if (data->addr > limit || data->end > limit)
 		return -ERANGE;
-- 
2.47.1.688.g23fc6f90ad-goog


