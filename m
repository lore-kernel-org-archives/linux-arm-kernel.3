Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9DBC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mqUawLmvEThg+sQnp0qlmkvEmeyB8Jjt+nOVa3ju8Y=; b=PggI14KFnQALA54gII7/f5DvyK
	hny/igbT9rQq9JY1bkGEFdvyObTl2rUfJHw6H6BIJn1ICPN+fKHgc2eq+uezc1oKjWTBaFR498lGJ
	/quFA2Tcl7WE2cvmf4E30dEUFmy/lfUwK6iUCiuXAMx7bfWutruAOoxZXjb85nFtdZvnwNiB9XcTa
	TT5pxD7g47DGCEBD5cR32SLFv5O63yTR5YuL+hWqLZfxjRpZciVmknl8FCNNAO6rMT61Y5q9YA6jV
	L9qpb0Ae3zwrsQB4c7lmqYkZUfarLXwCkw7peCFX43t90PnCNY7dXUdRlIT+WdjoWL7588mwDMnKR
	KR04Kfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl71N-00000001APL-15J9;
	Thu, 20 Feb 2025 13:55:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6vT-000000018iA-36Cv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:49:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56AF961455;
	Thu, 20 Feb 2025 13:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAEDC4CED1;
	Thu, 20 Feb 2025 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740059354;
	bh=4L9e3x4dCeFSSHA1otQ4XS7vmrkCkOdcXz3bm7vANK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDRDzYNdjy42OOJyWBgWmxqB0to6d0ML42uNMqLtYV4qCjTG+2pLRA0zFV8MYBhev
	 dg5n4UySvizp3QlEBCmE7O7czFFlfU3bhAtHsJR0q7NVwynDav+Xn8XBcsdC2yQijv
	 Gfs6QuNU66gMRmzQ8iIjYKBL8+BwGHr88e7y0+/UgvIsjm9TD9d3XVowMq2aNg6b69
	 g+N+o2pz5OWgNQrKQJJ/EN2iVshPlr6SKNkaEgrvwuZIK4k+4AnxCTsSXbXAv5/2aR
	 3J3D46nx8VnEUF47CiW0X1W2ePO/LiHRq/D8eWAtVlEahkIj2NCxawhm5Ufwna6Ckl
	 nrUCnRieP4vYA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tl6vQ-006DXp-KR;
	Thu, 20 Feb 2025 13:49:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: [PATCH v2 05/14] KVM: arm64: Advertise NV2 in the boot messages
Date: Thu, 20 Feb 2025 13:48:58 +0000
Message-Id: <20250220134907.554085-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250220134907.554085-1-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_054915_830079_6C5C45EB 
X-CRM114-Status: GOOD (  11.21  )
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

Make it a bit easier to understand what people are running by
adding a +NV2 string to the successful KVM initialisation.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b8e55a441282f..5ea09f13c7bc0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2806,11 +2806,12 @@ static __init int kvm_arm_init(void)
 	if (err)
 		goto out_hyp;
 
-	kvm_info("%s%sVHE mode initialized successfully\n",
+	kvm_info("%s%sVHE%s mode initialized successfully\n",
 		 in_hyp_mode ? "" : (is_protected_kvm_enabled() ?
 				     "Protected " : "Hyp "),
 		 in_hyp_mode ? "" : (cpus_have_final_cap(ARM64_KVM_HVHE) ?
-				     "h" : "n"));
+				     "h" : "n"),
+		 cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) ? "+NV2": "");
 
 	/*
 	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
-- 
2.39.2


