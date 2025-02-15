Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A859C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gl8tLLIhQsuuX1Is8aJx0sKsvi1/qbSpMIt2XXxRRVI=; b=OWh/pwxOBEqtc+2svIYd9/wPRO
	FnuVf5PdqNr9C9KYOOIUsPLjyDQ4TqEfeT+x9KyWmbSu85x2bWP0gAVUYiSus4K5vKUbBOULyuMNo
	K9Q20mCIiHLCiAXVj2Bsbgv+WCwI5lkwa//OUad+dDw7mF10dFHsc1hnE967g42pXdZTTZalHx/JG
	vTuQjiTXuNRMAjZmO9JL+5xqvdOghS072474YnluxZDlxEu650+ZWmsGeuRSkZt5e7KsRYI2TkOzN
	eE6jg8+T20wgvA7x0p2meHJjRFUVkUVBqCyIPbQKvaXlPf0GrG4rDSnT1R7CEygzRLmYMaB4VGIN/
	wcRaTB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMG3-00000000WMH-2TuF;
	Sat, 15 Feb 2025 17:47:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7U-00000000UpZ-1VPp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37D0EA40699;
	Sat, 15 Feb 2025 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3240C4CEEA;
	Sat, 15 Feb 2025 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641103;
	bh=mjigrhJTQih8m7VA5C/kcuPrCUbXNvrUzYxrPtFBC4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/6E8OUNIPEtJkg80JA8nnXIIHGr6d6atrpEjjOTef4WaC+QHyx2aKjRojhapG74s
	 ppfVO6J2t8H8QBRH+80lrLvZZn3+JGKpet6dEqlB7WO3fpezLhkrk+wwg5FiGoDf4x
	 aXgLB0NnA7mmcFXg7fbCp8U5/W1Nt4gJJ/gk/M2su0qhDJtweErUIUdwLw15KEgAwP
	 b8GA5Wh529IpK/1KDq1BiVq32PsTGgFJuljQlniF1c/w89SFt6lpbYciCsTzc4nk2R
	 i6Pd8LVzCEC5UE4IqG2nrN17oS/YFBw6/mhCQT8Eb6hXRi64ADQkfJ6VN0ZYzV73Cl
	 /JKvt3eChuaqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7R-004Pqp-8D;
	Sat, 15 Feb 2025 17:38:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 05/14] KVM: arm64: Advertise NV2 in the boot messages
Date: Sat, 15 Feb 2025 17:38:07 +0000
Message-Id: <20250215173816.3767330-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093824_490158_54B693EE 
X-CRM114-Status: GOOD (  10.85  )
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
index 071a7d75be689..4746c6cace2a8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2814,11 +2814,12 @@ static __init int kvm_arm_init(void)
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


