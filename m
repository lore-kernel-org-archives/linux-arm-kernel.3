Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6777DD10F24
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WN9Z3q0nVk9z2xNssb2ym9NxSDAUJcp5Q1Sd4eN+q90=; b=4W+lZVNrPdHUqM2YbJChlouzHJ
	0IznEcitGv0T+ppVZP+AwdAc4oBTFVbIqIEwkm6Sfd2B66k1IVJPcZZvkjVyfcJqIgRvh2OvdygMI
	xCq+EVqCa0KbQ4/zXHowPiM2FfNS1Ylsp+4Mam5eSlw/jGQTNDD+M/qNxfe7iZzUBEz3xyfx2ILLM
	U9bkgoEE16LBqkktafdWT2Cq4WKCFEoHRCyGR5ASeagl4d19lOeR7OhLp/NY9CnfLETN1GWFmZSaR
	KEKp4xwEqUZ9CxLAu8y++yj5GZvkFh4Wsf+oU8d02HnfCu93I+SaE54WYoNoP8YwIp0JV4FWX9lw3
	0M6iGmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCic2-00000007aK2-25tq;
	Sun, 17 Nov 2024 16:59:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCib7-00000007aGn-0roJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 16:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6480A40F9A;
	Sun, 17 Nov 2024 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE88C4CED0;
	Sun, 17 Nov 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731862683;
	bh=NpH4jY+JCjKP6r6zSnex/nzywYVAlfjvb617sL0GkLw=;
	h=From:To:Cc:Subject:Date:From;
	b=EBxv/TOZ8w81qYwE+diW+f9Y6u0WGIiXFdsVP1oLEBc82WtRLuiclHWAZQDIkugEz
	 2xJhKxhAXhWWyUeHErd3vdaHY2vwNZIdoV4G7g4hRx9N4bygnWwG0dptFO1fopnKKB
	 IuN2PbdjMC2wAak/zwU1zclKvuVjgesAt+yX38xasOm5wW2i002CWWmt1I1ap+RwKM
	 FumdE9rJVc2BXfTv1HmGSdc9rHTYMGZiKdMHQuOGREe86eeYPWRhpRZ6ykun8E1HOA
	 YEnBr3dBHE5P7xjsC9OAIu6sER39SvP+ri+m90/ra+zgzCBRmbMhAGRxut952avkWK
	 WT40++aBR6JNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tCib3-00DYt6-1q;
	Sun, 17 Nov 2024 16:58:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/4] KVM: arm64: vgic: Collection of fixes for 6.13
Date: Sun, 17 Nov 2024 16:57:53 +0000
Message-Id: <20241117165757.247686-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_085805_328693_D261C89F 
X-CRM114-Status: GOOD (  11.50  )
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

This is a more or less random collection of vgic fixes, addressing
issues ranging from "purely cosmetic" all the way to "pretty annoying"
(of which patch #1 is an example).

The general theme is around the tightening of the internal API in
order to make it a bit more difficult to get things wrong, something
that I'm particularly good at. There is a bit more I'd like to do on
the ITS, but I'm testing the waters here.

Patches on top of kvmarm-6.13, tested on the funky x1e box.

Marc Zyngier (4):
  KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR
  KVM: arm64: vgic: Make vgic_get_irq() more robust
  KVM: arm64: vgic: Kill VGIC_MAX_PRIVATE definition
  KVM: arm64: vgic-its: Add stronger type-checking to the ITS entry
    sizes

 arch/arm64/kvm/vgic/vgic-debug.c   |  5 +-
 arch/arm64/kvm/vgic/vgic-init.c    |  2 +-
 arch/arm64/kvm/vgic/vgic-its.c     | 77 +++++++++++++++++++++---------
 arch/arm64/kvm/vgic/vgic-mmio-v2.c | 12 ++---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 13 +++--
 arch/arm64/kvm/vgic/vgic-mmio.c    | 38 +++++++--------
 arch/arm64/kvm/vgic/vgic-v2.c      |  2 +-
 arch/arm64/kvm/vgic/vgic-v3.c      |  2 +-
 arch/arm64/kvm/vgic/vgic-v4.c      |  4 +-
 arch/arm64/kvm/vgic/vgic.c         | 43 ++++++++++-------
 arch/arm64/kvm/vgic/vgic.h         | 27 +----------
 include/kvm/arm_vgic.h             |  1 -
 12 files changed, 126 insertions(+), 100 deletions(-)

-- 
2.39.2


