Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B0CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtMTRcfS8t3A0zoUtO5rbb4BAKaZHdusERWAc+kj3aw=; b=q0HKCZwyeNTRUEyrigHB21m7o4
	aJtBPf5XiWNDHR2BfClb+U/ZzImhdYER2/Fyh22hpEVor1gQzNkpVLieMJ/oQ68foIsDPLQxoXb30
	P2KcTDEpYbOI7smI65WhcKtTc25IBUNKBMcU2AMZ/kBwyeGO2zuCkNCknI5L4ulcJaPtC6WK6QbsR
	VOhagtrM3+fs9NdWDyLiYgpvkzwgTto1JUcRlG9KCGtv8VzEsPMUplDiCGykJIIYpM0hB/73eenkL
	PHAIB6/1IDDeTifD2pLaLSK0UBix8+aHzfprSc6R1T8O9AoiLJLtxqmJCZPwLe1Mkf8S58vxGbcjo
	IJnS5ZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkPl-0000000F2LC-2oVx;
	Wed, 03 Jun 2026 12:09:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkPi-0000000F2Ka-31sR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:09:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf237e1433so56223825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488578; x=1781093378; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtMTRcfS8t3A0zoUtO5rbb4BAKaZHdusERWAc+kj3aw=;
        b=psA0x7vq3Z56oHQjs94lyWKLeaAvR3AfXAEXQ8UJsAm/asfl+zZqkzifWB9zXlFk5A
         /gg4Ql5Gvk+Neo/evIHW8wtv1/PKeRvnxwmvfA+QX7gY22kBaNvzg4jcsGq9TCJqXcpL
         KnTw5vHOxEUuS2fPqzCpYae6JmNIvMxqHcvf8XiN2VmnlCOAeNSG/awHWd8N9D6xPk0s
         pGXnTsd1bAqWAMSijbxdGXPDVXJ8m9UQhw2Ivh3+udKIIP05vlRoXxANrZyhVZ3GuGsb
         pQKX4KasLkqjFKTozw7Ls6Nyprxjk/eoEoY50d+VOW0Ww3Sc3chBAWiT7JnBbWjsnyZG
         SjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488578; x=1781093378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtMTRcfS8t3A0zoUtO5rbb4BAKaZHdusERWAc+kj3aw=;
        b=DD8nyuxgH+xNaIioh838VxEjMMdT46Bithv6zN9i71oIUJcRmFKGUSDQZXLLBYgm4+
         MK19AUfBbhlo0HRCznKVWrUc6/nKglszZ9t4qaA8Fy/8ZuZ7oIwbtHqhQatzY9fkYgkk
         mCo3hagiKRuyFTiO1iHI/8X61ZfThLqwlOag9+QYBP4XzVEM7iPGOW16o6jv7n48f/Hc
         FuUY9/u3L0hMRvsCC12Qg6Yhn7BMrEWMOBJcKCFww27R+jL3NmG5mREuAxJVdesSmKsH
         DHAPhDW6mjFD2eZss8OudMq25X3f3QC6pDhFdqi9A0aBKzKqc6CXBj2hq4rqvQw58qSG
         AOEw==
X-Gm-Message-State: AOJu0Yz0n3tYFxw9lJ+XsMwyXo+nKf5OwS96u7RhtD1WG6pOBWwCM9Oz
	ZQWMOCxVAbVDu7yrHgoB+x+2mebYgRwO3TnCJt4zjaVpAj6k9M8tcnM2
X-Gm-Gg: Acq92OHzhAbOpANJLaGOxTfKbqbcT4GHaoRewpMTrkkO11lWTlKtTBJClg9rbTxqTIB
	nSN8KA0qyNGs9K6O9m8ys1c8yZ48yzvKv/CVk69zCO0c6ntGOedwXZgOrLpws7m8NzGDrT6EhqJ
	UyqdH8THkPYQIFUfxlXu0sl8eFJ+BSXTO7+A5oNHOeLnZr95u8uyOdhFEKXhjSycE2pCjJT+/oB
	2UoAGc1peetLYb2047n0YKbKuHkpQQ/vEBQJm1XyXsDS0a17/EY25S1dR5eoccFqsAfG/Y/FHdk
	DKHRlGPrK8iTYTYJjzfA8H+DFiz0vsDP4xmB1aR7AGhqb0IWAWC/8TumRuhruHtwO0+YPAMvDGG
	5rN4mZ6ulhpLjLIbxKxJf88oayKSmNlD/So4sYVABm2YWjXmV/KqSnsolMZUuS/yDKzdTHJkn7/
	fWvwj7OM+6y+WH8GTYj32zeal7HfDVXNnvXMZx9TaKFZpcIsOrXuyj/g==
X-Received: by 2002:a17:902:da88:b0:2c1:69cb:441a with SMTP id d9443c01a7336-2c169cb4529mr27294735ad.18.1780488577735;
        Wed, 03 Jun 2026 05:09:37 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm25082855ad.59.2026.06.03.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:09:37 -0700 (PDT)
Date: Wed, 3 Jun 2026 21:09:33 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH v2] KVM: arm64: Take the SRCU lock for page table walks in
 fault injection and AT emulation
Message-ID: <aiAZfdeyanIvP8SD@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050938_763791_8F85A4D6 
X-CRM114-Status: GOOD (  14.22  )
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

walk_s1() and kvm_walk_nested_s2() expect to be called while holding
kvm->srcu to guard against memslot changes. While this is generally
the case, __kvm_at_s12() and __kvm_find_s1_desc_level() call into the
respective walkers without taking kvm->srcu.

Fix by acquiring kvm->srcu prior to the table walk in both instances.

Cc: stable@vger.kernel.org
Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
Changes in v2:
- Wrap only the walker calls with scoped_guard() and move the injection
  lock into __kvm_find_s1_desc_level(), as suggested by Oliver.
- Reword the commit message as suggested.
- v1: https://lore.kernel.org/all/ah7_BAAzHggzdZeI@v4bel/
---
 arch/arm64/kvm/at.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 9f8f0ae8e86e..889c2c15d7bd 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1569,7 +1569,8 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	/* Do the stage-2 translation */
 	ipa = (par & GENMASK_ULL(47, 12)) | (vaddr & GENMASK_ULL(11, 0));
 	out.esr = 0;
-	ret = kvm_walk_nested_s2(vcpu, ipa, &out);
+	scoped_guard(srcu, &vcpu->kvm->srcu)
+		ret = kvm_walk_nested_s2(vcpu, ipa, &out);
 	if (ret < 0)
 		return ret;
 
@@ -1665,7 +1666,8 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
 	}
 
 	/* Walk the guest's PT, looking for a match along the way */
-	ret = walk_s1(vcpu, &wi, &wr, va);
+	scoped_guard(srcu, &vcpu->kvm->srcu)
+		ret = walk_s1(vcpu, &wi, &wr, va);
 	switch (ret) {
 	case -EINTR:
 		/* We interrupted the walk on a match, return the level */
-- 
2.43.0


