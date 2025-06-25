Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ZgnHfrvb1ohAxqWBg7xDt3QN8B0f9Jh9ZGClguGU7k=; b=4BYCZSBW0Q9NQ1/L9r3uyTRsuw
	OUi8xRGvylWIfKn5dPUbZd/qcv7QYFLsTA9s/RKD+TYAa66bxCVG4W1gDWN6WEksO+K7nkBB1Vix9
	iWxh10BNWh7gzMHU/C+IJyLWb5X1k9ditMYe68Ax38lgdc20i7CR4YHBpS+ug6jZ3bEslpkwt/1bs
	Cz5SgZFzqyvX2Vt6+X8Vu6PXDGjCBMx5UOm9n8lB8EOIqUx2JFzJyzZu0W9blyjs2SoCc99WuF4HN
	xMcSM2gSEAwFklJknY903khQAh4ECZpXF1+5IxhhOXsbyEhus+/2kytJNJo7yirQlduULOdNB7/QS
	lrDEjgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMll-00000008BdN-46Ts;
	Wed, 25 Jun 2025 09:50:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULkr-000000080hS-1Ofo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 08:45:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1617575a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750841112; x=1751445912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZgnHfrvb1ohAxqWBg7xDt3QN8B0f9Jh9ZGClguGU7k=;
        b=TXn+r1gsSdF/JQQ2O71rQ3uhXWOMncb8w4DYH1BcqrlSLhbXQkR2XpoP8Pj+h15H3O
         mHYTL4BvP6u3mMLKJhZoy9RukDG9lPpeiwtCGYSGdiK377JSToW73kK0UrMBPlFSUfot
         zm2TSlxJDqABmDhRgpUrMaM97BIowG2upvjiq29OwUrM0crBsUna0D29hlkquO2SDJr1
         fz5POmZT4zXoZLjvPnCte2enuq+lkfqLOsIaNx5T2TsKAIBLnf/yidAyM12Wmc559lPL
         enTuPPNnIi5WtYY3B3KZ7MjVGDUbFIuFeZ/Kl1Kc8XGlTCvoxcFroH1HG36aDwcgg1yt
         HnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841112; x=1751445912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZgnHfrvb1ohAxqWBg7xDt3QN8B0f9Jh9ZGClguGU7k=;
        b=Vo0qA0cFqjHaPxIxE/9fQ5ZxRHMwP7gzwTBVOGHNQLWQhrDw3gjAqjah9dyGyeh0fW
         W8UJhrLT4J8uh4Qhyy0ULEWGONHnT9t12uX4ca1O6iiXT25ov2Y5ECTXZjg7UuFuej1Q
         acJqMIXIjP9Uveu4bqP6d9tpGjLPvzU9F5Tlk+HMT50t1Uq0fmRGRUQqMNpLEOFGNBbr
         LnbHHxf82BnQBex3yIm/4dwsiG3hroDgHBgNEoIzIvMEYHANG4sMa7QMmLTGyJ6P4uEz
         RtyoQeZeELvN8YHhLrew0UG95C+PV35Wge1bwAleSCKnxRqrN+FYk5wDbPFCV7meCYMw
         N3hQ==
X-Gm-Message-State: AOJu0YxI2yvhJ/JvNp8y1RxQW4rkoc6IVu018jMQp/4IM+/QfJ69GcIU
	c5HTi0Fqth6Of0zDUji9h7oT0yRcDYlWhtd81VxixzpsgVmu+GmZcsJu26EylKtuudZK6/741QW
	Xarj5BzgWC15nk+ppMmhQvOuDODVWz+E/5mclADVcaIVfuW0zBsE4SWVx8QXXZw0b2bWLyrhkQv
	z71DRbd/0nDA==
X-Gm-Gg: ASbGnct3+zlm1VAkmnUrRbkRD3cKuVz4LK+GUzJ3UQvX4WwAPm6/bUfMhPmbu7gehVa
	CnUe8uyoFdt2pD1CKR7t1ER/wYb5IQmL0NKO/82FgfI8gUszGR61AEMyAwXYMP9Oh2+7NpjNoEg
	sy/nJF+u842Di0vzCZEUdELQwCAKVxzwPSLmjGwBK+uuweEXFCfbnXhQHG0XonZJmg+Ebujvrv1
	grglttsQgxjuEsl987mtdKwFWOCT4xUWfoS7AS3U8AuCbr5QpikvlHcuuTnb4YHCtmxTihyX9UD
	3rWpp3vJCTpg4t371YWZNWR2zhADF9/2lX1EfrbW74TX2Q70QBNzNRryQBeGeLUJMV4zz5J6B7W
	9Sk3/Gh/oDotuKsP4iN86QrnU+c3SrwDZwpzoX08B32fTJX00Qqk=
X-Google-Smtp-Source: AGHT+IGyy6YLwss+HffP5SUP+oihK3m9EHxjRmtYMYfXhWdxLxeKPaeGlxm77RQZMQ31nRdwQyAxaQ==
X-Received: by 2002:a17:90b:1a88:b0:311:c970:c9ce with SMTP id 98e67ed59e1d1-315f268a5f6mr3098742a91.28.1750841112061;
        Wed, 25 Jun 2025 01:45:12 -0700 (PDT)
Received: from localhost.localdomain (36-228-0-244.dynamic-ip.hinet.net. [36.228.0.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5441770sm1264154a91.48.2025.06.25.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:45:11 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH] KVM: arm64: nv: Fix MI line level calculation in vgic_v3_nested_update_mi()
Date: Wed, 25 Jun 2025 16:47:09 +0800
Message-ID: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_014517_656086_9DA649BB 
X-CRM114-Status: GOOD (  12.27  )
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

The state of the vcpu's MI line should be asserted when its
ICH_HCR_EL2.En is set and ICH_MISR_EL2 is non-zero. Using bitwise AND
(&=) directly for this calculation will not give us the correct result
when the LSB of the vcpu's ICH_MISR_EL2 isn't set. Correct this by first
adjusting the return value of vgic_v3_get_misr() into 1 if it is
non-zero.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 4f6954c30674..ebffad632fd2 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -400,7 +400,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
 
 	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
 	if (level)
-		level &= vgic_v3_get_misr(vcpu);
+		level &= !!vgic_v3_get_misr(vcpu);
 	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
 			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
 }
-- 
2.49.0


