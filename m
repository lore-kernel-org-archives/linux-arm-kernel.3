Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71EDF41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02qnO6q+Y2WyzRZ55saENhptxHHaPB8mtl4fEi4I0kQ=; b=V0qv59IVPROJYaCWVJIb2S5IBV
	u+rm+BGDcS7Q1XyPkSYLnGqtV6CcL+UiPxyCKFUkkcsJJqbn9Agmjrgf4N9D3S/sSWgJ+8FQs7N6u
	tlGXDepe5P/TdVQyCdLtXZeHLlda57jA32W5IZNYIDelFZWQM1aO7PeidHRGitMLo/s8fRq9UHkn0
	/xywjrFLXILXF2nLOAq/8ll5i0RvgiYbwGN40dtCJma8KoqZTKsRJ7mWpRCzbxxsTpv0YIoEBS030
	CN7W7VFwGn2Vdwurw9OeWQnTAll3FB4kedCySom/rHrYkChHhSPRx6oQYrUsIUKPd6d9h37njrhHt
	Ee+dx0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrI-000000014KX-1UUg;
	Wed, 15 Apr 2026 11:56:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr4-00000001478-0HRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DD6343BF5;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316DDC2BCB3;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254184;
	bh=rRhz56yIoRfzm5lLrNbTpKXQobUyeg4eP1h1LUt2eq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rywnk2Kp62odGRynhLhGFWi4bKCBQBgNwc3krmVwU5+fWGNbJFLU5L5e4+11oU66U
	 VlzTDtfQZf5IcVXwdS2S+2Fw50gCToyrTUkrfZJAS5JxH0OpKFFRSCX+ARJF6c1AVU
	 o8y7TL5YAoyQLpFWPvCrHays5DY4RozaQ4QqaEAWOTZ08cNpeio1xg+UmokRzpejjA
	 vi0RaH/6FtZha3U9TPkpiPHSuz6fExWmnkreOxtUHB/fwrz+sPjVh2Mq5tVI/XW/BN
	 9vULtXrPbOcRHmSNkHs0Lm52EBaNS9PZQabJgk4ngCJWErbfp/AYonSA/8uXkP7IIO
	 JXeCvLvyaWAww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyr0-0000000Bqsi-1ZS1;
	Wed, 15 Apr 2026 11:56:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 16/18] Documentation: KVM: Clarify that PMU_V3_IRQ IntID requirements for GICv5
Date: Wed, 15 Apr 2026 12:55:57 +0100
Message-ID: <20260415115559.2227718-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_045626_160872_8BED1119 
X-CRM114-Status: GOOD (  12.09  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

When running a GICv5-based guest, the PMU must use PPI 23. This,
however, must be communicated via the
KVM_ARM_VCPU_PMU_V3_CTRL->KVM_ARM_VCPU_PMU_V3_IRQ ioctl as a full
GICv5-style Interrupt ID. That is, 0x20000017. Optionally, the whole
ioctl can be skipped for GICv5.

This was previously not clearly documented, so bump the documentation
accordingly.

Fixes: 7c31c06e2d2d ("KVM: arm64: gic-v5: Mandate architected PPI for PMU emulation on GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/devices/vcpu.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 5e38058200105..66e714f2fcfa7 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -37,8 +37,11 @@ Returns:
 A value describing the PMUv3 (Performance Monitor Unit v3) overflow interrupt
 number for this vcpu. This interrupt could be a PPI or SPI, but the interrupt
 type must be same for each vcpu. As a PPI, the interrupt number is the same for
-all vcpus, while as an SPI it must be a separate number per vcpu. For
-GICv5-based guests, the architected PPI (23) must be used.
+all vcpus, while as an SPI it must be a separate number per vcpu.
+
+For GICv5-based guests, the architected PPI (23) must be used, and must be
+communicated as the full GICv5-style Interrupt ID, i.e., 0x20000017. This ioctl
+can be omitted altogether for a GICv5-based guest.
 
 1.2 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_INIT
 ---------------------------------------
-- 
2.47.3


