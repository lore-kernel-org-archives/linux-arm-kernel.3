Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FA9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC6+qUPkhowtfU2NgiHXARr9iM9+065XZu7LiNs5Cmw=; b=S3e9NEE442QszLjEPM/F1Zxx0U
	dxfs5NN/JWaYswHEJPYKqS/gqKHw0B1g3Cr7voQFNQC8+1TlFl7GY4vkqA7QZteqEilkAr3Og+ot2
	K7tiSH5tcj5UI1bOJpt3qvGz3D2eAgfh7/mI3sVlLZ/o4SE4kU6ZrpMVbBzOFAv593GeBKYhcOvyG
	3GwwGvdNNQfOlr1VUkq3hDfkVWAnHI9Zi2KQGCyteWASC2oH+DFkwUlDNw1Q33hvXHYmTnyaNPzgV
	MQtDEz1Zq0N2CiZC+C+4zCr3APzi6WfkkHpMlMllZbS1Igsz4ZBbjsMZxEtytxPHXysAuXXxxzQMq
	ot3TU99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzhZ-00000000wUQ-2pTh;
	Tue, 25 Feb 2025 18:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykf-00000000eAh-0YQn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09A1B612DC;
	Tue, 25 Feb 2025 17:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ECAC4CEE8;
	Tue, 25 Feb 2025 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504588;
	bh=EcrOufC+9HluOly/HaFks9e5qYg1mD0Q7YaQCzKYfj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s26eJsZ4ZCkUr40JDqjXSQMziL3UsOHOVQ1WIuizgLPCCHPydJaq+ImDk7P25+99M
	 RmVA4tATAqADohH0lvgld1cpUd9UVhhbkcKo+/tRnzxj6JrSl2C4LvPLcUA6dBvSLB
	 rpRwDNFFME4tffYzvNENvm4Vnm6y98isqRBY3HHO+ultJHcIqgehxvhv+pEUzkpnKZ
	 +y0GRXw5YbRdJGv6v6rZEI2GGCJro/gDMfjEBiGwN3SFNi6wWOehbwToC7FgpkVj7k
	 Fb53GYm6pHdMaH4ipVI4l0E55hYZO1WedMutCe4IjppDq7rsY3UWTz30nSlsgkq8bF
	 hDj7mZ0BARaLg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykc-007rKs-TI;
	Tue, 25 Feb 2025 17:29:46 +0000
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
Subject: [PATCH v4 16/16] KVM: arm64: nv: Fail KVM init if asking for NV without GICv3
Date: Tue, 25 Feb 2025 17:29:30 +0000
Message-Id: <20250225172930.1850838-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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
index dc27eb66d4e90..cae93fac60703 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2321,6 +2321,13 @@ static int __init init_subsystems(void)
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


