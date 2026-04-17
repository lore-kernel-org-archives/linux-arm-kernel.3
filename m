Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5501DF43697
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTiinE/0SQ20J6DB/zy4iKyGYuVzUlLORFLhSyEK0Gg=; b=m9e7tGy5vipO74ec60KWPF530G
	XG6+ZrRmPu+YTDk3OhytkALlr3K5MwMZ6vCaWhcZEFQsQnaMzyLmXOST9uD61W6hMqZlZ6xyG+Sir
	3ZqqEMcLS1RmLYXVhDcT0YOGkGvVSJhNlzog1sQ3OmMzb3mSp2SW6YlPqZyEEg1s3K/HKUKIpKVCu
	+FCGSuGvYsroTCjxB+OHWfbEFVt23X8h71yjLcvKQSjn5bI83L60Z1CBJNSTQBf8V7MsSggZP3RlH
	OWQQboillQrs2Iw23DT+8QljTa53MyPkFvqnnbMv7vPTS1TDhZZsg1pfrKs5zH0la1EK3MZ3xrdS0
	QR2lvKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaa-000000043Cl-42cP;
	Fri, 17 Apr 2026 12:46:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiaS-0000000439n-0WrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 12:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8FA43F75;
	Fri, 17 Apr 2026 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F9CC2BCB4;
	Fri, 17 Apr 2026 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429978;
	bh=fcY9/bxgeTBj4WyEJ8FOGvH3mRT2+ql85biNbBG6aG0=;
	h=From:To:Cc:Subject:Date:From;
	b=sQOA1at0E4Qyh0cqwrJbq3zj5N3ULS6hC9LY3WEbwL1O9sy2uEbniqp9Kk6bu/ojW
	 nWye97QN8JeXv3f7ZTgRTlswS/J9lwL/Puvf+jzRzTIWBqxlkEKydao1w3nrINa/rQ
	 qQ19sbnfolS+/sYJXbprbG/fU3P6kTXtv2tJXfLktbrKFxCcwbcPSk3mhuG+69u/Bf
	 q06gu1KIHFRHTqD/RqTxh+X+xTPGjz0rghEuFwRE1bdCZ8L6oToFV1W6k9YcNOqLSp
	 +7XtYutKxGM9HOdA9WKgcOvZnD4LRRlUNt5h5Mu41Y/RDs9tcXV59kVD+7z0bwJVpi
	 66jcOtqF+Ew5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wDiaO-0000000CRo5-2GOT;
	Fri, 17 Apr 2026 12:46:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/4] KVM: arm64: Don't perform vgic-v2 lazy init on timer injection
Date: Fri, 17 Apr 2026 13:46:08 +0100
Message-ID: <20260417124612.2770268-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_054620_205646_068E8DAA 
X-CRM114-Status: GOOD (  12.38  )
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

Syzkaller reported an interesting case [1] showing vgic-v2 being
initialised via the lazy init path on injection from the timer reset
path. Yes, that's convoluted. This resulted in a splat as we could
end-up scheduling in an atomic context.

Deepanshu proposed [2] a simple fix that unconditionally init'd the
GIC on vcpu reset. While this would do the trick, this is only
papering over the real issue.

The situation is that we currently have three ways to lazily init the
vgic:

- on first run of any vcpu
- on access from userspace injecting an interrupt
- on access from the kernel injecting an interrupt

The splat is caused by this last one, and it is interesting to drill
into why we end-up with it.

All guest interrupts generated by the kernel itself are level. Which
means that they cannot be lost unless the generating device is being
interacted with. So there shouldn't be any need to initialise the vgic
for that reason, and we could defer it to the first run of a vcpu.

However, the timers are extra special. Each one has its own little
single bit cache that contains the last level set. And as long as the
level doesn't change, the timer code doesn't call into the interrupt
injection code, making it totally optimal.

A side effect of this optimisation is that the level interrupt
effectively becomes an edge (only the changes are reported). Which
means that the interrupt must be recorded in the vgic, or it be
forever lost. Hence the need to eagerly initialise the GIC at
injection time.

But frankly, there isn't much to gain by having this cache. All we
avoid is a lookup, an uncontended lock, and an early return. The other
interrupts generated by the kernel (PMU, vgic MI) don't have such
cache, and nobody has complained yet.

So let's drop this cache, and remove the vgic init from the kernel
injection. If someone shouts about a loss of performance, then let's
improve the interrupt injection itself, and not paper over it. Also
use this opportunity to repaint kvm_timer_should_fire() as
kvm_timer_pending(), something that is way less ambiguous.

Patches on top of kvmarm-7.1. The reproducer didn't trigger on my
boxes, and syzkaller is down at the moment. But nothing bad happened
in my testing...

[1] https://syzkaller.appspot.com/bug?extid=12b178b7c756664d2518
[2] https://lore.kernel.org/r/20260412080437.38782-1-kartikey406@gmail.com

Marc Zyngier (4):
  KVM: arm64: timer: Repaint kvm_timer_should_fire() to
    kvm_timer_pending()
  KVM: arm64: timer: Kill the per-timer level cache
  KVM: arm64: vgic-v2: Force vgic init on injection from userspace
  KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt
    injection

 arch/arm64/kvm/arch_timer.c  | 44 ++++++++++++++++++------------------
 arch/arm64/kvm/arm.c         |  7 ++++++
 arch/arm64/kvm/vgic/vgic.c   |  6 ++---
 include/kvm/arm_arch_timer.h |  5 ----
 4 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.47.3


