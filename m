Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9F5D2F35C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIhN6dRLokM9eZt/p8tgQxPQl4snplBSSr5i8hEn3SY=; b=WWBSI7/F3wdXf+NxIj7bvjKLAx
	NFZVbY06wtINGy3FjVmfoQ+q6taYCfR2uo/bgwsuItePbXTPUMkiXgTSVzfCfsmjTKF0DOqekRfiR
	PuNKiGsUiOrDPvQhqGgLQDDl+FLTTtOIZqJTcs2d8xS8ssOK8pXmz+mLFtn2w4UCIrVezObIvxJCt
	J3kBF1nKIPOm33c/A60zvpycK1h3O+OiDpK/6E4/ZCM4P2UwXTSV/ovcwP1CadP9sECTb6DC4d3Wa
	DlWcvt6AAautd8J5eu9kC1dAX7xrIXqPaJCAj0khLK535IaicjNLzC6bGUSDBGQ9RPllv6OFUdfhn
	k/loY9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkJO-00000007dzA-2eNn;
	Tue, 13 Jan 2026 19:44:18 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkJM-00000007dyn-3eWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:44:18 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b04f8c5e84so9008357eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768333455; x=1768938255; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RIhN6dRLokM9eZt/p8tgQxPQl4snplBSSr5i8hEn3SY=;
        b=trjpm4fQbdYf27FznIl5teHtG2jtcG3+b9Ydv6CaHEy55QSYdhGVgUeap0HobwARdY
         CYEigJzVcRaAaFRRbPjUXUxwTnrqTLUl88sL+sSN+LLYDWlB7jHuT85/WUV+Izz5CRqG
         Xe8XjshFgPayeegXIEJ5pFusmUXgw8Bsro0wEabbKwefo9DiDO7EAZRwkdF2+UPxITd7
         YHma/ez/frg1AudvhW04loJILTvD47NJ3y72pDriEMZKklqh+im4lFcNCFKR2xJ0dlaQ
         HsK6my5QoIkYys8j5aVatg8Mdl9ohNkwpoOvCBN1pbtpneNOYejUDQD71XpNXEZcIw/f
         Jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768333455; x=1768938255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIhN6dRLokM9eZt/p8tgQxPQl4snplBSSr5i8hEn3SY=;
        b=gMbgqymXO6weSfVZ4frc6rC7Y/VtsZZpqlskGye43MrVeq+eKCuYd0nvAFS7l7HIAu
         W0Sf1Zj5IxtJXQiaT4DH4knd3387eIc5/0X5jTUjOyh/OewJVRAvuNcZ072mifz5F/vH
         wlC0+alIvQ0vqneqjKGWqMApkeGvAyI4yGuOBsbQYHpsldux7VuzIsFtL2gSLyQhzgeV
         PBobhl6hAgIce3wu31UoYLYrNqSPfmQor5Yi1YiEiuUUTS+WLGBQyyeCzRXZb2RPJE3i
         cGxhh74G5ky+sx5dXHPGDRzwQTQtoMSjlxmXP2UMkjsBzdGpfMwn/bEwyJ6uGqVwP0j6
         S8nA==
X-Forwarded-Encrypted: i=1; AJvYcCWr9hTCv/EBNUhyFRAp2bgLD9+4EwvyFXiJ6ep+vAbumu4gOqmIjB9SrPBcPpQ7zfhXbF2ytxsPIGvpriGl2onY@lists.infradead.org
X-Gm-Message-State: AOJu0YwYjS+Eykrv+pkXRxx8Kx/eEwg/9GXFLLs4IBp+DPwC59/EB8nq
	kb0tx2c+mEqEmB9SNhqs85wSJ2vdGq56KJiqC5Pupj+uTJTDRMFQl/xEU47vZVwZplacUH37SoC
	r5cwbCgzfwEir2A==
X-Received: from dlbrp10.prod.google.com ([2002:a05:7022:160a:b0:119:49ca:6b8b])
 (user=pekangas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:7f14:b0:11b:9386:8256 with SMTP id a92af1059eb24-12336a9084emr94672c88.43.1768333454899;
 Tue, 13 Jan 2026 11:44:14 -0800 (PST)
Date: Tue, 13 Jan 2026 19:44:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260113194409.2970324-1-pekangas@google.com>
Subject: [PATCH v2 0/1] KVM: arm64: Calculate hyp VA size only once
From: Petteri Kangaslampi <pekangas@google.com>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Petteri Kangaslampi <pekangas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_114416_912981_234B4DC0 
X-CRM114-Status: GOOD (  11.58  )
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

All,

Here's a reworked fix to keep VA size calculations consistent between
the MMU and layout initialization code paths.

Previously, if the kernel was configured with a VA size of less than
48 bits (like happens in our environment), the assumptions used to
calculate hyp_physvirt_offset in kvm_compute_layout() and the code
that determines the VA size used in the rest of the system (calculated
in kvm_mmu_init()) would get out of sync. This could eventually result
in mapping failures.

The patch here is against 6.19-rc4 and tested in default, nVHE, and pKVM
configurations thanks to help from Vincent Donnefort. Detailed
knowledge of the address map remains somewhat distributed inside the
codebase, but at least everything now uses the same VA size, and
further refactoring is probably best done if/when Will's pKVM changes
have been merged.

Petteri Kangaslampi (1):
  KVM: arm64: Calculate hyp VA size only once

 arch/arm64/include/asm/kvm_mmu.h |  3 ++-
 arch/arm64/kvm/arm.c             |  4 ++--
 arch/arm64/kvm/mmu.c             | 28 ++++-----------------------
 arch/arm64/kvm/va_layout.c       | 33 +++++++++++++++++++++++++++-----
 4 files changed, 36 insertions(+), 32 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog


