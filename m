Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BCCF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiKF0mE03FGkmmjP/MWfvyrJqdsZtsXm3bpabDcGIag=; b=tX6i5y9740vy/bz4inVvRvcE6f
	+eed91BCm+RiHdHtYkyfs6c3o42MEqiySYylY7mHmJyuKcQeBZ1hfyphSkenaEmDph2nsaBvoGqag
	/jdzcWsHZ6rZdXkGXpTnSJZ5aTRHueP8Tsx1hWYvsMvCL850c0FnGqd/yiyIsqhDcE1SnMw0hNSyo
	1eAYwQA8b9Vzt0PzRD8OCbq/aQq3cyT4dsAKOhxF3hvXJqK90PMuF/uyKg+bg73z0LFSx3WZXoR0G
	xR9d1rr1lprKI14U1MBKpdHmLBYt7W41FnjQc10DkhGgOUHSFqvk4PPbzvNXN3NoE18582OyOpKEC
	mAXeFCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QQ-000000076O1-0qtL;
	Thu, 20 Nov 2025 17:26:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q2-000000075hy-3mdq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5801E6020B;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E902C4CEF1;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659566;
	bh=UnQ/IIjw8T0EtLazTEnldrHhLchJDlIoYY39GEWerpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rVRqynxq9Qj9tCrE4/SNFltdeWxkF62oxHgGl3qGE4A4AWc731CjGYePBtZ0mYpg7
	 jANLQcZFmLhFcYdDNCNcbk8bgpEV4DwZIvUEmVRT8ziVV5HHGeflqVTYso4dtqRtx4
	 ocOD2BGQPntICwTwDt03QWlMJgCIVJl54IGJ8HdbDrkJKXrkybmWiKAVBNl0p6twlJ
	 /Ij56HicvzU1DNpd81GBkY6DTySViEW5etUk4ZCJ4KeDILpdWSdK732ih5o14vCIg5
	 ppB/Ym+McJTIz8UtPpruxxf9VRfUi6zq2kk8gfdS6OaZ/Bi0KT4uCWXZTy5G+R2rGz
	 FCKyiwP1IhIDQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pz-00000006y6g-3ult;
	Thu, 20 Nov 2025 17:26:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 41/49] KVM: arm64: selftests: gic_v3: Disable Group-0 interrupts by default
Date: Thu, 20 Nov 2025 17:25:31 +0000
Message-ID: <20251120172540.2267180-42-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

Make sure G0 is disabled at the point of initialising the GIC.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/lib/arm64/gic_v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
index 3e4e1a6a4f7c3..5b0fd95c6b48a 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
@@ -342,6 +342,8 @@ static void gicv3_cpu_init(unsigned int cpu)
 	/* Set a default priority threshold */
 	write_sysreg_s(ICC_PMR_DEF_PRIO, SYS_ICC_PMR_EL1);
 
+	/* Disable Group-0 interrupts */
+	write_sysreg_s(ICC_IGRPEN0_EL1_MASK, SYS_ICC_IGRPEN1_EL1);
 	/* Enable non-secure Group-1 interrupts */
 	write_sysreg_s(ICC_IGRPEN1_EL1_MASK, SYS_ICC_IGRPEN1_EL1);
 }
-- 
2.47.3


