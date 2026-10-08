Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4F8CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yw+/KyODhQGlE9PVW/UB15lvPyjHuqtv5OR4/2DWzv4=; b=nVa9zJA3mbDyCOwcLsajVlaQo6
	ewlmL+4RdHfi44CJbASXHFBBsgPN8+5LDeP0YjgWoDjIIvCi94zVLXE7WXJjPGEuivuDTXFLdftL9
	Yw9oejeuQk5so0liRWJIHLup/tqiqk/yi2ymEXLFX2ZiGGayKLRP/zFSRoa9gZcA7V9Q4/mUjAc68
	fzyhs48HrT3acko+LDiJG4SM3exulvjcxhODkXX7R75gAwDamjNVS3UDbFFrh1rlP9Hh1rKBUHcvG
	jxhx7wsZ5li+VPf89hQEWPLIvSVFxKO/HjcbqaCE6oU6JR3SjhKaDEMwVqf/tU2uU0zeNr88mJo2w
	tsY6FoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaN-00000004AXJ-0NOh;
	Thu, 08 Oct 2026 10:42:51 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaK-00000004AVF-0sUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:42:50 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so47517345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791456165; x=1792060965; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yw+/KyODhQGlE9PVW/UB15lvPyjHuqtv5OR4/2DWzv4=;
        b=JUaX40AqOU7QZyxfKGtr+CmdD1VEOJraPEJJ0iwNUK1TD84BB2IuFMSffxifiBtsCF
         YI2dziWG8UFMPTp9PQvFbWOBWCF82fpLkLL9uuEFHXhwIEeELUUphHF+dnHRnNd8KZJe
         tDekYOCosm5l7/nj5dBSIvQkpcOOEOo1o7b3ECUnd6IiPF7Mu5R/Ye24SWZsnEAOgEEc
         eWhOzfOmUtiazmCWNsauozjELZsuaAb9EJBoOSRrlvPc/yAnoFQzgMRwppddlUoCCSBV
         D3pxrwIrIXmYqcsEPZPsJBzz/ZPpTSolYNE1+Z4k4WT9CdxVxRtLi1ctEO7s7J9VJmRY
         7aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456165; x=1792060965;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yw+/KyODhQGlE9PVW/UB15lvPyjHuqtv5OR4/2DWzv4=;
        b=oO7SUHaxBipoQzjH3GbyT7ImogrZb9h7kbwZdoPuQZx0z7FEeSMdxAHScU9HYjglaL
         Vd4vrnu0r51rzs4ST1T0HUDSDsinhugHC/GSq59JAFEMtva/PgRejyVZUONW3gxWrxbY
         a1rJMrZwCBZpHmYZ9wVodzT59joE8sDpSSIgS64IjV82PWtJ1EJ7ZiKMxbgN2RY4oyNL
         T8iR0puoIHctI1Hkj4+LdSYVvOLoFNNzCptaoCgmN/vOXekj/1JX8G91GALft+SB77K6
         gZKAAOXsVtE8c6KzovWzSZ1/WssOwK3PgcPUQS1TWzaATKZi/L2uhan87Z7I0SSqSBmv
         Pu1w==
X-Forwarded-Encrypted: i=1; AKwUvByfjAxShgcHPWMXOBS56CRZbUkxxw87Ie23yzXP9GvbudPFRsqdjW0Ekp8JBzRjTYd0R4ICjUyNVZzh+TJGzv30@lists.infradead.org
X-Gm-Message-State: AFuF++mGjnAZRi2lKpGlskANQ0ZiCFduwnxqJl8zPpMnA/xPS5qbgIAx
	qWAw3OvjuFPxpxHMFbphHRoAImGNrh6gXfdcH9Avs6CEJdgYMAk4/vkHoR9zSo6rnKjWAaYr2oX
	axmxg6ZTTPZVqlxoySIm+Cw==
X-Received: from wmpd9.prod.google.com ([2002:a05:600c:4c09:b0:49f:e58b:90d5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c4:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a180660fc7mr81234745e9.28.1791456165231;
 Thu, 08 Oct 2026 03:42:45 -0700 (PDT)
Date: Thu,  8 Oct 2026 11:42:10 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261008104212.3134550-1-vdonnefort@google.com>
Subject: [PATCH v1 0/2] KVM: arm64: Fixes for hyp_trace
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_034248_251672_F8FCB5ED 
X-CRM114-Status: UNSURE (   8.50  )
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

Here's a couple of fixes for hyp_trace:

The first one fixes a potential 64 bits overflow in the hypervisor trace
clock.

The second may prevent tracing loading for certain buffer_size_kb
configuration. This one depends on the allocator, so I have based the
series on kvmarm/next.

Vincent Donnefort (2):
  KVM: arm64: Prevent 64-bit overflow when computing hyp clock rate
  KVM: arm64: Fix bpages backing allocation size in hyp_trace

 arch/arm64/kvm/hyp_trace.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)


base-commit: 8ed245078003cc5f61ca4c8f9920374086f2515c
-- 
2.56.0.360.g66cac248cb-goog


