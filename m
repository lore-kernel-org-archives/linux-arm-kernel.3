Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78F2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ibeby9VV7UvoZoRwDk9gv1xyevLF90376HcQemb98w=; b=dYNvL+Q72KjGTSgGCP1rqBcsdi
	Ja6qimFb/xAJKBZ1VSiMRN1P6xuta9H7rjTJuaKsEHfxz/Wm3MZ2aC4Sjho0cefHJ8TmtFxGYPtUF
	IEWQHvivZpPfhdI7Ur4kefKmlQUDi3NoJkQNjCILpWc8bOxmK07ruS2HzQce/xbworDCX8kntkwXh
	EXSdbD30w3spi1sY680Yinfup3uzcSZRS9DF0JY8c8AxmghiymcBw1tG0ZrsXxPt4s2oSSB7Lxobp
	vRQhcztmd9TAzBtNYEQQppu/BJd7ZTEWlMVuupUJi/dqd/cL6VhqXsxK3jcXtqxFEqxM7Vrs5JxRg
	mGiQP9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EDj-00000007PtU-3VNE;
	Tue, 22 Apr 2025 14:03:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CuD-000000079PK-2tSN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09893614B3;
	Tue, 22 Apr 2025 12:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD14C4CEE9;
	Tue, 22 Apr 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325556;
	bh=64yiAE3W4ZJTOG58pLVENVGyfqZ4s0C/3rjyV7DX7uA=;
	h=From:To:Cc:Subject:Date:From;
	b=CdbRw2v/x0vgIdzw9glg8T/PRAB96626Aom+yfUcHT5jhn9ZIN7oYEym+5s4QfnMj
	 ns5PdqraI0bjyNsgdzyTdRz4BD/ZBoqeqvaTcPh4ui/MX6Nh1OmXk5pUjG4IpR6iJH
	 jKbdD45S6mUQ0qi4j3m7befSy3k3AMYWW1X7zz5OeQftKHjqhp6vZEpsyTmZRtfEgV
	 PFKFJ410tSIMBb8APtKCe1c3TDTQbYZ4wH1gAibf6YSmwgEFqLC37HQZp9AMkFH5g2
	 DiSSVTDrdyzr3JxcCzv2xg/EifG/WgwXfIGhsEPSsJ8DJ7HGzdGSqaJZ6Hxm1LaYiY
	 JWLo2dKE7gmew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7CuA-007cSc-GI;
	Tue, 22 Apr 2025 13:39:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: [PATCH] KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
Date: Tue, 22 Apr 2025 13:39:01 +0100
Message-Id: <20250422123901.2675976-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, scott@os.amperecomputing.com
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

We keep setting and clearing these bits depending on the role of
the host kernel, mimicking what we do for nVHE. But that's actually
pretty pointless, as we always want physical interrupts to make it
to the host, at EL2.

This has also two problems:

- it prevents IRQs from being taken when these bits are cleared
  if the implementation has chosen to implement these bits as
  masks when HCR_EL2.{TGE,xMO}=={0,0}

- it triggers a bad erratum on the AmpereOne HW, which catches
  fire on clearing these bits while an interrupt is being taken
  (AC03_CPU_36).

Let's kill these two birds with a single stone.

Reported-by: D Scott Phillips <scott@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 974d72b5905b8..bba4b0e930915 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -100,7 +100,7 @@
 			 HCR_FMO | HCR_IMO | HCR_PTW | HCR_TID3 | HCR_TID1)
 #define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK | HCR_ATA)
 #define HCR_HOST_NVHE_PROTECTED_FLAGS (HCR_HOST_NVHE_FLAGS | HCR_TSC)
-#define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
+#define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H | HCR_AMO | HCR_IMO | HCR_FMO)
 
 #define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
 #define MPAMHCR_HOST_FLAGS	0
-- 
2.39.2


