Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CWe+za4+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MODeXnLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vsmRRVaV1+5+TACeJIusWgJrEDczJxQiGTc7WIupIyY=; b=CWe+za4+ehZZOEDjv6nFo1OHjE
	yP/wimpbU2w7AAGI2U8t+doaotYyZv9bbmOTJI3YVcHxkCS2jnjTcRGkNftjr+8ukf5kj6obZchcs
	f0pp/oyJFISNqgJ7XE8jaiZGkMsRbd+NJ1aI9MmizrnWiNfhkZmg8tRMfos1T/kr3VnnMdXM6jemS
	Dw4qrtMAsufR06hx4whoATudOJFn6DzK4I1M67hc4zkoFzZbTwqJl3OB13mjqK0N2d4zF1fx9tAB3
	7nZ4YXXhVScoEZuyO0Xhui8UneT65nv+DPqZ6bjUcOl3bPG+4On9+WYsrQeDvGt2j+ocl2D4dIAmT
	V4b71k+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN2-0000000EFkg-03nc;
	Thu, 22 Oct 2026 14:02:16 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtMz-0000000EFje-15NI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:02:14 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so18492875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792677730; x=1793282530; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsmRRVaV1+5+TACeJIusWgJrEDczJxQiGTc7WIupIyY=;
        b=MODeXnLRBTxgH6j/0EQKLTN8Jc1loWJ+TMndPFLtsXOZjnX2TQRHIfSOmBUA1tHZi4
         4slsO/sWvr9d0zDUwDddsmKon1vVNsNwZyi1OYw/KN77/Uvd9NLUoEvghp8idJCenuo1
         Syyh7n4CeYtSczjhKoqhm8bLQwXKI8Rwm7MQ53NRy5LqKGBNU7u0hNSxQQx16H7Ul1OZ
         0UeAyi5bTHmTO0TKSWVWTipn8CmPQsMKEeX4LxZjodJbyLKFODwwDWU1ewpA5pG18Ywa
         HyJSdI4LeUs5OOn6RA3kPUPmke6g5uoupCcykR3u5l9gbotwqkEtor7ypHNJRElt6I4L
         wRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677730; x=1793282530;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsmRRVaV1+5+TACeJIusWgJrEDczJxQiGTc7WIupIyY=;
        b=Ftv1+qfMoSTlRmdNyeu5dXPX7KgxnCyQVsyLb2qsAxfZ2cxSLzbi46oFLN7my1i711
         CrPifb1rZu3fK6tnsUyPciAgRKefngsSWg84QmZ+EkfPqpX+fpL3Jh7wgygYtNWBhEoF
         nC0I3eH/B+MTLAI/uTOtBxsXmCaJyVGc7ejqxOJPm/bM+/Xee5rd3njlDgdDToglN0er
         0SKN+Xe0blZuAqpCCW0LQCv4od2cT8yPCn379r9kjGD3KnSzYGjlfpm+f1I/lhheYIFN
         9AjjcdIH/GFZ8kjaxy/lu6K9makcM/91LO9hVKshykM4ajPioQyCsv54EllMFSVc2zhB
         m4ZA==
X-Forwarded-Encrypted: i=1; AKwUvByscplaIWq6oA2mopXKyQH3wvL2TgYe/piDAUGJajnDwU7ZAFpfCZF2x82viOg/ZkLPjd88/T/w6CXrx7J2G+qv@lists.infradead.org
X-Gm-Message-State: AFq9FYLQENE9TNgE1wby2lklx26EQ+f33j3y7rqJa+esj6/KAoc5R2y+
	RF5Jayz23Ruzbmlt8ZHxO7RebETQ2RSiJqQx3fXWNSZvV/AKu+AkO/YNRDPcqRfgEm0FCkZGwiv
	1OdVnY2iN0d4VFxLl3TBsFQ==
X-Received: from wmby14.prod.google.com ([2002:a05:600c:c04e:b0:4a1:fc99:15d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba1:b0:4a2:d82:11bb with SMTP id 5b1f17b1804b1-4a20d8214a7mr12734265e9.30.1792677729944;
 Thu, 22 Oct 2026 07:02:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:00:44 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022140048.2522787-1-vdonnefort@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070213_333197_B5DB6904 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 List Registers (LRs) are architecturally UNKNOWN when a CPU
boots or wakes up from a low-power state. When pKVM is enabled,
__vgic_v3_init_lrs() is currently never called on boot, CPU hotplug, or
CPU PM resume.

Following Marc's comments on v1, instead of handling the LR reset purely
inside the pKVM hypervisor, this series fixes the host CPU init, hotplug,
and PM paths to properly reset the vGIC LRs even when pKVM keeps the EL2
installed. This removes a few calls to is_protected_kvm_enabled() making
the whole hypervisor init machinery more generic.

Since pKVM can't trust the a deprivileged host, keep the reset in the
CPU_ON/CPU_SUSPEND path.

Changelog:

v2:
  * Make the __vgic_v3_init_lrs HVC always available. (Marc)
  * Propagate __hyp_reset_vectors() error and remove
    is_protected_kvm_enabled() special-casing in the host CPU init/PM
    paths so the host resets the vGIC LRs. (Marc)

v1 (https://lore.kernel.org/all/20261021110000.508827-1-vdonnefort@google.com/)

Vincent Donnefort (4):
  KVM: arm64: Make __vgic_v3_init_lrs HVC always available
  KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
  KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor
  KVM: arm64: pkvm: Avoid trapping on HVC_RESET_VECTORS

 arch/arm64/include/asm/kvm_asm.h     |  2 +-
 arch/arm64/include/asm/virt.h        |  2 +-
 arch/arm64/kvm/arm.c                 | 58 ++++++++++++++++------------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  5 ++-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  4 ++
 5 files changed, 43 insertions(+), 28 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0.257.gf7497c7d27-goog


