Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E04C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS0xwMso+yCcvok/r94MuYfB3etF03m4rrkTQaFJ/mA=; b=q+qRckm4zFJIZk65OUXwnsBhqO
	tlxnEC7VGERPq21Cc6NeOHhHvdJ/FHbAWLZXI/gK9BjvlYB3LCDOHDZdQlhBsFGcXzHVKx03WdKbc
	vZcKtR94ToUB9xMGnT9NzJ5QvQAvmaZaKITDVogVaXi3xEubfYI16fECyujMaaesGVsqnR7dZA5Lf
	V9542L/CpUhqCmDd0KALN2bvJ0pG8N2bWTzuer7+5B0KlaXlHYGby5YzY2a+2ed/W7J2tz9aea+MY
	GT/8B/fwOM5dWWVyOUPNHb24RwrnRYTzOim/xx8SnpAo740ImvnbH4kuHcjxBE0m4kwOx2IaEz2Ai
	SAozmybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDeX-0000000FVHT-3M0R;
	Wed, 14 May 2025 15:04:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9S9-0000000EnoY-21pN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 512E8629E8;
	Wed, 14 May 2025 10:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238FAC4CEE9;
	Wed, 14 May 2025 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218909;
	bh=6xnfxO24XeMhZUOFnH7AZVi9lO940gonY1iIvv10IoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0vIT+d1T/KWB+Gwz6oiqrERfVUZCCZrJFP2uegVvy5hTjm7o3DjYMLBR/fM8kDOo
	 PPbcEB5rsF3nvmglD/HxqaKZ0YLwhxjQEGvpGQ6UJ4i+Lmh+3BrYDz6X7q46FAUX97
	 yt83Nei4dtDAIb0XfHOPu5PTYVb+g0zQNkuszasBR9tX2cTnMQUU5dv0yYVsUItlha
	 Qtf/h168HUFmxZQv3BpUFJPnO1N6jMDV4KMlehRMA60fD6jSws42tNRK65ekoYvKB1
	 xLfQy+OVUXeBk6oskZYC5ehSbU2rIN8RY+BQvONJhLlNLxVp4pjelPOSTHYC6GpL8M
	 66uzL4BTe0DHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF9S7-00Eos3-Cg;
	Wed, 14 May 2025 11:35:07 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v4 15/17] KVM: arm64: nv: Remove dead code from ERET handling
Date: Wed, 14 May 2025 11:34:58 +0100
Message-Id: <20250514103501.2225951-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
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

Cleanly, this code cannot trigger, since we filter this from the
caller. Drop it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f94..5e9fec251684d 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2471,13 +2471,6 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 {
 	u64 spsr, elr, esr;
 
-	/*
-	 * Forward this trap to the virtual EL2 if the virtual
-	 * HCR_EL2.NV bit is set and this is coming from !EL2.
-	 */
-	if (forward_hcr_traps(vcpu, HCR_NV))
-		return;
-
 	spsr = vcpu_read_sys_reg(vcpu, SPSR_EL2);
 	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
 
-- 
2.39.2


