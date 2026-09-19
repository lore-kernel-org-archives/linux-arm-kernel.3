Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C8DC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBqFniyZ3g3+J9Du6G8y0kPV5tZ80T53Bvj1N2LISzw=; b=WflFvEO+gA0ySaW1QPhujjGPco
	8rGKGjv5bywmoee7hN6/QaZqTryZmYlu2w2+GVKaKn7CHrTCOTkwIB2lFMxPP4qZhH6nyxXBtiltO
	YZVSgdZV5dibMoTLCwHIkw0Rub3tDTBDKt8hdOu6x/ffTKb6RFdh8IRjulFOimkcs1Q45dEu0E9bi
	4IgyTvE68WWAmUAFHCE0f4Jnp2Jc1h+ADRcLIbgyNznWjzKfNSUSFrtA3eSdxM8Tl4GsOzDX5Ue7p
	gaByxWDNOAb9k6I4XHkwOHtJbWdwgCuQbhk/Z9vDOCYdOMRzK4y0eWRJVcVZdxmWcA0ndbh8ze+rz
	feKBf4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEr-0000000GFl5-0oIb;
	Sat, 19 Sep 2026 12:32:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEX-0000000GFcW-34r9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C2D9601F0;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300B71F000FF;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821115;
	bh=GBqFniyZ3g3+J9Du6G8y0kPV5tZ80T53Bvj1N2LISzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YZIdgLXELNEnTvoOi0DxTzoE2DAGAHWLUO64Q1UJ39nmIpz+UNYa7dhOzBDgi9BEy
	 vfgwgBeBhf/Mm42rFMBOj7WS+o8SJSDSVpxBXTcu0m6M4ZVUYABR3DpI+m7DuhBfPb
	 N+Kz0jQ9ZluYO3lTSHmvPygkGil/4jCXT0p7Bhcg7V27b63r1NHlJDZ0ZLJk/I3kIY
	 SRz2oZGBuVkExi1Ud0Wdwi1XtPZdTA6i+kY3d5V5IbwJ27Bd9AZI0nem+BD9EQYsSk
	 jPiCuY8jfBUzCCDp+th8E8WcpSzk7TxJYpoDG1v+FKQncvIbuziyOg3dTQ3sZ7g4CZ
	 P7tUbNFe/TB/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x7uET-0000000AwvV-1QLo;
	Sat, 19 Sep 2026 12:31:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 1/4] KVM: arm64: vgic-v5: Drop __iomem attribute from {vmd,vpet}_base
Date: Sat, 19 Sep 2026 13:31:47 +0100
Message-ID: <20260919123150.3283606-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919123150.3283606-1-maz@kernel.org>
References: <20260919123150.3283606-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, sascha.bischoff@arm.com
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

Both vmd_base and vpet_base are pointers to kmalloc'd memory, and
therefore cannot carry the __iomem attribute, which designates pointers
to MMIO.

Drop the abusive qualifier.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609190650.liMAzwjF-lkp@intel.com/
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5-tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
index b2ffbe68c05b4..89096926563f7 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
@@ -23,8 +23,8 @@ struct vmtl2_entry {
 typedef __le64 vpe_entry;
 
 struct vgic_v5_vm_info {
-	void __iomem		*vmd_base;
-	vpe_entry __iomem	*vpet_base;
+	void			*vmd_base;
+	vpe_entry		*vpet_base;
 	void			*vped_base;
 	u8			vpe_id_bits;
 
-- 
2.47.3


