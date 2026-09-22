Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274CDC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6rXdzRPRFaAkzJK2CTbotf/X0PgO5pvJQVZtTI8XXN4=; b=XyfZi7dz1evXsikAZPnvHTaUnt
	KCrX9M97GnksUuLTh+5FoRn6aWoae1hmzKicnkZZuLEdbeu4Z2czxGZT6n0zfZErz6YQ07YoLCbzs
	nYiP2zPziTdxF8lUpKKpHTWoMMJyR/gX9hNxri4hYSDNvwW6IuxLIS8kVwXXJqoAFEw2JKyp/u/LE
	tozmhFBXDFlZQmtZjb62BL4k+6GsSR+UANAY5I2yHAP6epSC7q41QvYHeS94oqU1FIB+ZJRD7/UUk
	/URRY9LmPE0yJ0ZWNUn9jIOulZ+EZ+P6tOSRaya73o5YHk05jWSOYv6c5Hsj/BUoqmW/IFujeB+by
	R/RqJWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dPo-3y29;
	Tue, 22 Sep 2026 21:42:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dP6-1vs1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D812741288;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B717C1F000FF;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790113344;
	bh=6rXdzRPRFaAkzJK2CTbotf/X0PgO5pvJQVZtTI8XXN4=;
	h=From:To:Cc:Subject:Date;
	b=esjP7qAaLzUReZuUkYkPuocF/yKfoJxpuO0zFP9b3dxw4ydnOI1aEZzI7EOLOKs8O
	 V9/trT+ZtO3X2bVXgc7+SoOEKd8RWDlbg/rPOBqyvOlT/KJM1mkOTlJo8hdJtm/91O
	 hOpf8olk23q1yQtTDvHNYJkZ++BBuKfiiQ2uDOhpeOysm/QG01zLDqTAsVWEkC7aU2
	 2WSGEwCRIHPC+1ApnXsijAvmshnwgF77BrHUUqou6mmceN44RU9homJK3CfkfWJarO
	 f7wSfZAQfi9oq2MjKSjxjxaw4wuerk406DH6s7YebmqCLEvO/oMk+0yF2wYe+hj2M+
	 xAezx+rJD8tlQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x98Fq-0000000CFxJ-1mQv;
	Tue, 22 Sep 2026 21:42:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/3] KVM: arm64: vgic-v3: Make LPI disabling robust
Date: Tue, 22 Sep 2026 22:42:09 +0100
Message-ID: <20260922214212.3327146-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Yuchao Zhang reported that disabling LPIs on one CPU from another
could result in UAFs and other horrors.

There are two reasons for this:

- the last_lr_irq pointer does not contribute to LPI refcount, and
  that LPI being removed results in a dangling pointer

- LPIs can be deleted from a remote vcpu by disabling them while that
  vcpu is actually running, and has LPIs in its LRs.

Address the two issues in one go, by actively taking a refcount on all
IRQs referenced by last_lr_irq, and making sure that disabling LPIs
force all vcpus to be paused, making it safe.

Marc Zyngier (3):
  KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not
    overflowing
  KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
  KVM: arm64: vgic: Stop the VM when disabling LPIs

 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 10 ++++++++++
 arch/arm64/kvm/vgic/vgic-v2.c      |  6 ++++--
 arch/arm64/kvm/vgic/vgic-v3.c      |  6 ++++--
 arch/arm64/kvm/vgic/vgic.c         | 21 ++++++++++++++++-----
 4 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.47.3


