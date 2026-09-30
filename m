Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20354CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=631pnrFuqDRXd3BfizV2s6nQYFa+PIycK6cr0Zp6o9g=; b=ZeIcf/Lb0hu4cwORgDRwV8XyKV
	xzrfmhQGE7BR8mx59ZobK6i4/Uuns+1kr3cUVxng93yroyGU5nqM0alYgUgZ2vMYe/2hwg8iZ+WN5
	4MDiwyGP/BYRUiWU/RfiJzn3+LL5HhBTQxqwyJHJEvsX0L2oB1RTmjcyV+CyXiJtYu93v58bjuWPb
	ra46pqt9/tzsyYObNYlddSUuFTdek9m44qMn/BpOAUa20Fd26QRmQo2FRJe4A6/xZy4oN5pRIkEnq
	kJAfTEN7bCy9ASvH01snZq8KUtNr5mzaS0IMY0YAORMNRQUin3Uu+Jjl6SVx3YCPhRn5sMkhr0KX2
	YaTo/TBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1hH-00000007Eqg-2acW;
	Wed, 30 Sep 2026 21:18:39 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1hF-00000007Ep8-0AeL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:18:38 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4b28dafb8e1so9949854b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803115; x=1791407915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=631pnrFuqDRXd3BfizV2s6nQYFa+PIycK6cr0Zp6o9g=;
        b=EzSXitFHG4UhVunEtgaFUUmPjIAkbnWfxQVAC6Er5PhzHN8EegOQoDfjyogLu1Jfj3
         +g2GZUq4lctLsqWsvbFMCGYeKjpqsEif9snwQqYql2pNu8hQF5bhsZM/EbYmTs8UGqQl
         N/PJpuo6MSFUSF8IkryBfcJVqabY1m7bRrNQkDx3PemIannfQgZqBNG0OAqTZoQZDBoQ
         5mQF7tk37PQXBRpUesu91e9KhzDryIpccsQ+c80fjcgR7n0dAm0dgERtmo/IUjsrf1Ba
         wi9EwOEtoK0Hv0AZGFGxbqYU50G2CdKiU9rPZg4F7FlalqUNZm/2YcUBAf56hNR6W1q9
         rn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803115; x=1791407915;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=631pnrFuqDRXd3BfizV2s6nQYFa+PIycK6cr0Zp6o9g=;
        b=Cm0FNEKd5t4u+Z/RYdD7lCyUDvLUR5eSYdmu2TG0qRt0iWKGZsWEu67pTHF/NB/lPM
         0edw6U8HfhuYw+wuOrpPZlLtUyaq+H0aDP5G8shs7rpYVZr7hyZ3BMbfXAJbYfZ2SkBG
         pkTOoozy6jnNOJUuTCyhFGpUuNPwhOwqC+Q0+Q3LJqalQzWZPx9LlWeDV+8aCWZ92FpX
         L49b4MdrlBda5G/DvuN3JeAXwtub5iRTke05teJtv/U2pxQ67KiyOcK8D7MOnHQPT2fy
         9Q7O+GNzyXuclO6uy7CvJ3M7hzvs2mvcwYUa3Q0LjhWg9RtOH8LFKxaLrfurczTDjZBf
         sOcg==
X-Forwarded-Encrypted: i=1; AKwUvBy+c0voxaba9IEP+jKzd1zyPnFstwlMKJ/UBvRlzwTabfqvvIsw8ZUjWvuuePdqPIUt6rBtcHzgdKmwVHpmmQ4t@lists.infradead.org
X-Gm-Message-State: AFuF++mi4dD1Ja3mVyVjvyj+RiIguzTsF/LasWXwckDzwJzqoFlVEJlc
	u/l81C2b7QhK6m0nbb3C1ibfPBPclhK4898a0+zcupuDDfU9Dyalfz/ItuNLygyR3avapDNPIcU
	9gFBt/M7WCuV8M0z8b6suA1sKFw==
X-Received: from iocrj27.prod.google.com ([2002:a05:6602:a71b:b0:9c7:5b85:f7d6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:14ca:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-4f1bafb3d3bmr3357156b6e.67.1790803114797;
 Wed, 30 Sep 2026 14:18:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:32 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Handle hidden FEAT_PMUv3 in ID_AA64DFR0_EL1
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_141837_083648_C6315D9E 
X-CRM114-Status: GOOD (  10.50  )
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

When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 and hides
FEAT_PMUv3 via ID_AA64DFR0_EL1.PMUVer, KVM hits a WARN_ONCE("Unknown PMU
version 0") during reset_pmevtyper() and continues to expose PMU system
registers instead of emulating guest accesses as UNDEF.

Patch 1 handles ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() and
removes the redundant kvm_vcpu_has_pmu() check in reset_pmevtyper().
Patch 2 updates pmu_visibility() to check ID_AA64DFR0_EL1.PMUVer via
kvm_has_feat() so PMU registers are marked REG_HIDDEN when FEAT_PMUv3 is
not advertised.

Changes in v2:
- Handle ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() and drop
  the kvm_vcpu_has_pmu() check in reset_pmevtyper() (Oliver)
- Drop Cc: stable@vger.kernel.org (Oliver)
- Add patch 2 to check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()
  (Oliver)
- Link to v1: https://lore.kernel.org/r/20260929220411.3756519-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Handle ID_AA64DFR0_EL1.PMUVer == NI in
    __kvm_pmu_event_mask()
  KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()

 arch/arm64/kvm/pmu-emul.c | 5 ++++-
 arch/arm64/kvm/sys_regs.c | 6 +-----
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


