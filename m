Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4EACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaj6P95p1omXuGuXaewrI14IMIfu+JxOvewo9OT0phw=; b=lnuW3M5w4MhbLyAZ/NNfpb2Dp9
	Y0VCug9kqiDrQMfSOEU0R2FBZh6jkIHGdkUEPpFIw3bZaZ9Vtw7Y4v43+uqQi/B1E7d1B5mWumANY
	TUjhP+nAJZW5rU4/whhZ1kR64//RRtOfU4Yqd5dkggfBcFm2w4wGL+kxGYdb57qrKCNnPq4szQaeD
	opCDL7JCYI++u2J32zuzpFTZB9lc6bUHU91rbq0AbsHBLebgXiChEquZeAcBHkSGZ2+77pj/6DgOZ
	Fj8gwE4UqLDk0042SGfOUwAYynrWq7PsYg/SvuAYDh/ODT5LGw7aDIVoDAy/G4JAnWVQ2LOowHkLF
	CkZ/jpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUW-0000000DMWj-12cY;
	Wed, 17 Sep 2025 16:58:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUV-0000000DMV5-0vNa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E06660239;
	Wed, 17 Sep 2025 16:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5C4C4CEF7;
	Wed, 17 Sep 2025 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758128326;
	bh=lfE5dcjv3uWH+89g23EZCRRzk3NgPDLaSKgxceY/RUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vGRLL+j5TGVpCQ+KyUodnMS3MpUflaQEPDvOpxjWU54gvBJYEfhILhVKj4Bo/SlmJ
	 JHnd8FtIOgKEimWV1xLp6P8xx+nNrsVfiXlvIiK7owQK1o6aupOcb3MkU5pr7/grz7
	 9gDJMClBZEzpOUV3fL+jUmarc8Fq9BxtIcADSmvEegg/lWtHahoBlXX1HxB3IjKCjW
	 TFVY7qjTZM26RgNs20JCFXGuVdO7cFbFejiU3g/kYv4GnoUZWXCFOc8fl8gahmCiVR
	 UAxTiSKh6ZIwKq1743qhi3oBnSPTrUHwWdzZEMSR4d+0btpvdFAePETgFkpmmCq6vS
	 Zt8H5TUaHs6Sw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvUS-00000007AQw-01Uh;
	Wed, 17 Sep 2025 16:58:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH 0/8] KVM: arm64: Handle effective RES0 behaviour of undefined registers
Date: Wed, 17 Sep 2025 17:58:32 +0100
Message-Id: <20250917165840.1633412-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
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

When a feature is removed from a guest, we ensure that the trap and
control bits for that particular feature are made RES0.

For example, SCTLR2_EL2 contains a large number of bits. For any
feature FEAT_FOO that is controlled by a bit FOO in SCTLR2_EL2, we
make sure that SCTLR2_EL2.FOO is RES0 if FEAT_FOO is not visible to
the guest.

However, nothing makes SCTLR2_EL2 RES0 if FEAT_SCTLR2 is not visible.

This series aims at solving this sort of situations. It is still quite
incomplete, but aims at bridging a couple of other series:

- 20250911114621.3724469-1-yangjinqian1@huawei.com which wants to
  make EL2-related fields writable to allow migration

- 20250912212258.407350-1-oliver.upton@linux.dev which wants to align
  the NV support with the rest of the kernel

Hopefully this helps getting to a point where we everything is
sanitised according to the architecture, EL2 on the same footing as
EL1, and everything migrating in every possible case.

And winning the lottery.

Marc Zyngier (8):
  KVM: arm64: Enforce absence of FEAT_FGT on FGT registers
  KVM: arm64: Enforce absence of FEAT_FGT2 on FGT2 registers
  KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
  KVM: arm64: Convert HCR_EL2 RES0 handling to compute_reg_res0_bits()
  KVM: arm64: Enforce absence of FEAT_SCTLR2 on SCTLR2_EL{1,2}
  KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
  KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bits()
  KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits()

 arch/arm64/kvm/config.c | 385 +++++++++++++++++++++++++---------------
 1 file changed, 240 insertions(+), 145 deletions(-)

-- 
2.39.2


