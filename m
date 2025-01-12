Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6AAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyIy8GtA35Ll2OXyAXvzedloNkPHXyN/g/QIGTVRt2M=; b=kVWMwi6P1tUABPb2ZgXkf+zWLt
	rEdJZByhmEv5MldmnHfVr7j4vfs0DcVztL3AmzFe6VA5dSkrO8JCG4NKYWpKhi8tsmz0ZHQN26FUE
	zne0WUPc4d38uHT4kSVzgw4E48RYfd7FaFVHUVLPm9nY5UYzPVL5PCAEmiiPKKlFPAgZ41RTGyeKo
	8ACaqzwitTAmdv7/p1Lm1c1FjM96uJl43t3pdwWxLlnfQ4gqZ5+/lcQH3Wz+KzGj+csW+M7pPFANm
	FREis1T/J5WH/BvWrhl6LWFPJq3HlRjbFTHvqZ51Yy9mZL/6gvB/xiiV8a8HmHpZHpVq1DSPEXFIc
	n/o+KvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1n6-00000003BX8-3eK3;
	Sun, 12 Jan 2025 17:30:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SK-000000037jS-3NRz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44C65A40ABB;
	Sun, 12 Jan 2025 17:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645E8C4CEE3;
	Sun, 12 Jan 2025 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701734;
	bh=JSBW8RAszUnNeq0jMTzvpSWQiVSVXM9WuQg/Gq5vzbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQaGsGduLX0+lNmOAkzJ8F3V66zQlcQ7aCO8kS8pugCChbZ7iH18QraHSUYC3to/C
	 J5X+mODSakreDf8Xv1hBtcszEGtT2DHfOBYDipQzINs1GAKUezpELQieBASlN0tVdH
	 JY44Pj4nTkkvs0c3CE4aMdn0m2Rqi/FN+B5hkFrRj0K14dTYtLOOP+OHHIBRYWtD6O
	 lL7/HiVAO3xeqPdvubfl1+77vshmb+ivWPTWa+DjfAbTXeaLSA44jVkCRt1oMXyVRj
	 6fsRaSJsJZz/6CtWNyQn6V5gNJvkqXi2h5iDdPvbbbh6YzWOzqyCNUD4nCNKiE3+69
	 15SL+OBWm3x5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SG-00BNxR-Mz;
	Sun, 12 Jan 2025 17:08:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 17/17] KVM: arm64: nv: Fail KVM init if asking for NV without GICv3
Date: Sun, 12 Jan 2025 17:08:45 +0000
Message-Id: <20250112170845.1181891-18-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090856_921570_AEDEED84 
X-CRM114-Status: GOOD (  10.57  )
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

Although there is nothing in NV that is fundamentally incompatible
with the lack of GICv3, there is no HW implementation without one,
at least on the virtual side (yes, even fruits have some form of
vGICv3).

We therefore make the decision to require GICv3, which will only
affect models such as QEMU. Booting with a GICv2 or something
even more exotic while asking for NV will result in KVM being
disabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 756cc4e74e10f..0154480828aa9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2318,6 +2318,13 @@ static int __init init_subsystems(void)
 		goto out;
 	}
 
+	if (kvm_mode == KVM_MODE_NV &&
+	   !(vgic_present && kvm_vgic_global_state.type == VGIC_V3)) {
+		kvm_err("NV support requires GICv3, giving up\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	/*
 	 * Init HYP architected timer support
 	 */
-- 
2.39.2


