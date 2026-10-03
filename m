Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9ECA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnNuPBOFoJ+E4mnM/5WK9CbF4T41g018LxYJP+6Inbc=; b=slzIiQiGm5qJrAc2fd9F4yH9rT
	f4z32ijSOuR6+QKKcwUDGElKAJe/sPfK5nO/muhP2FxSXO94fuIuz01ZNg6n1Ieb/NBAzzoP452OK
	yzWEjlheYmRvrH+tl1xPvqLYmmtGvbK8OshRvLugLOul6JDCHv9T7ovkPLaKdGgE7LtWgPgOubMrM
	a4sPyhXWR6jHC6HOv9OPqtk9UUahWDcI1GbUAXEIlHiKBcROoUNp7AAtuNXrwfAEFD6ZjrCC5wfdw
	kXDoLxvz3eqQoXYK9cBIgOI9k1Xg37cv6A/XaZkmJU/htacpuy5qkTAvDOq6/09Wxp+w/FwKRq/ZF
	QbZ2OITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCycx-0000000DTsb-2TNa;
	Sat, 03 Oct 2026 12:14:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCycw-0000000DTsH-0Pgd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:14:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE7BD411FD;
	Sat,  3 Oct 2026 12:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9101F0089B;
	Sat,  3 Oct 2026 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791029645;
	bh=rnNuPBOFoJ+E4mnM/5WK9CbF4T41g018LxYJP+6Inbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VUw/il2bzsw+6JTG9oiEg2OoLA10RP+J828Xw8zZRzdGe2qVKHTPJqpuyZh7EQrx5
	 xj4sn+Rav34r2lrW4e3QGdPQiyJNFrS9tR+akU1HYoRP/mtPtEed10LKlherZSXF8N
	 M73lIBqYJCdY1D8NkuIIdTaaqFvt8djh/tjMzR2JSu35xIt0fEFGris5GwDq89/ya6
	 Cf02ufpPTM3PiSzGDWT/29u92hfflYrarWRHAy0Ia6FPmsJe0gf5ExWoQoELOSgq5S
	 Z0Y6aFTZE/PvR20YdyWu8LrZ5kfCDJBx+a+tiW/qXPpdiMjGVC2PX9dFtAZceQG0Pn
	 zReuy3uGP839A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCyct-0000000GWmb-2c21;
	Sat, 03 Oct 2026 12:14:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Colton Lewis <coltonlewis@google.com>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	pbonzini@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: arm64: Handle hidden FEAT_PMUv3 in ID_AA64DFR0_EL1
Date: Sat,  3 Oct 2026 13:14:00 +0100
Message-ID: <179102963296.607377.2477246563507237480.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930211834.2773546-1-coltonlewis@google.com>
References: <20260930211834.2773546-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, coltonlewis@google.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 30 Sep 2026 21:18:32 +0000, Colton Lewis wrote:
> When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 and hides
> FEAT_PMUv3 via ID_AA64DFR0_EL1.PMUVer, KVM hits a WARN_ONCE("Unknown PMU
> version 0") during reset_pmevtyper() and continues to expose PMU system
> registers instead of emulating guest accesses as UNDEF.
> 
> Patch 1 handles ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() and
> removes the redundant kvm_vcpu_has_pmu() check in reset_pmevtyper().
> Patch 2 updates pmu_visibility() to check ID_AA64DFR0_EL1.PMUVer via
> kvm_has_feat() so PMU registers are marked REG_HIDDEN when FEAT_PMUv3 is
> not advertised.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Handle ID_AA64DFR0_EL1.PMUVer == NI in __kvm_pmu_event_mask()
      commit: aa41a7c3beb59f9dac4e60c9cf1d146f6c9025c4
[2/2] KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()
      commit: 517cdec3d4b28ccf5dae2dd03dee2a0a1eef1981

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



