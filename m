Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DF6C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5no9wGlK5spCJBxG4ErnHviy9e0r+ADRkPa+NjDB0E=; b=TxvdysP3ScuP2rhxztm20nrt5H
	QTw3nSTD5W3c/4+6hjvXgLgXZ1Tqs+uNuzBdVRraumQ5aLSbMNbxh0sThwRmNkOWHiTK+jK/UkKqy
	sA+ERGgGKJkEifeVfKCMykYNwMZmuXCs7XKUc53nhvreMs1KO9KmXfBdUlsGOw1Gkk6K0Jw0v0fpW
	wWJEeU5HBIZIfyOQpEtK9byLPpnafddhau6Ksd9aDu36AU8JUZO9pyMtV/97OjdrietCI1bobKAst
	MmGnJGy+v/rlNtkLaZDcZuIHXsfXAUMAnqSkZBBjnmTd7vwTJbUNWrNs5Alq4rsbtpoHM53GVfghi
	7UW2vwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5mT-0000000CieH-18pU;
	Wed, 30 Apr 2025 11:39:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5A4-0000000CbsJ-3bjE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D02D4AAC6;
	Wed, 30 Apr 2025 10:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BBC4CEF0;
	Wed, 30 Apr 2025 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010771;
	bh=S7W8DRIj4nQb7EgQ8CiHg8cmsjttjAH3R0TpvHpNW6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OgTl/Q3I4PR8gwxxWS87zwESe+f7XQjWRbhF92O4fhDcE33F0A1BlIYARk6Gns9e5
	 X2jhcFESTjKEeXXNyb917E+J4alHnx8P795RH4P2XzDoxD2lNCPyd7hUg77FtgZaDQ
	 MLST8qC6gU9/yFADO5Cb8bKEQGlQtNzcFNbFN+/AuMZjeAd8rl4ErAbR/xO1E/ofBC
	 Pq6aUWJ4BBU6CEiggNZaKqvCZOWj74DFhT9CBYuJBqGpzRzTAnN+suDgtILR74cvyd
	 2hHFDrMLweuQBz4hiG2/KGPwRwNAK+VQJd/vaPQM5iev0y0cZE3h9q1Xc4cdFSfA5j
	 MaImO/UWfFokQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uA5A1-00AFD9-E8;
	Wed, 30 Apr 2025 11:59:29 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] KVM: arm64: Kill HCRX_HOST_FLAGS
Date: Wed, 30 Apr 2025 11:59:16 +0100
Message-Id: <20250430105916.3815157-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250430105916.3815157-1-maz@kernel.org>
References: <20250430105916.3815157-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_035932_954316_82C3B923 
X-CRM114-Status: GOOD (  12.51  )
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

HCRX_HOST_FLAGS, like most of these hardcoded setups, are not
a good match for options that can be selectively enabled or
disabled.

Nothing but the early setup is relying on it now, so kill the
macro and move the bag of bits where they belong.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 2 +-
 arch/arm64/include/asm/kvm_arm.h   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749b..d40e427ddad94 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -52,7 +52,7 @@
 	mrs	x0, id_aa64mmfr1_el1
 	ubfx	x0, x0, #ID_AA64MMFR1_EL1_HCX_SHIFT, #4
 	cbz	x0, .Lskip_hcrx_\@
-	mov_q	x0, HCRX_HOST_FLAGS
+	mov_q	x0, (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
 
         /* Enable GCS if supported */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 974d72b5905b8..3eb722a7ad7f3 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -102,7 +102,6 @@
 #define HCR_HOST_NVHE_PROTECTED_FLAGS (HCR_HOST_NVHE_FLAGS | HCR_TSC)
 #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
 
-#define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
 #define MPAMHCR_HOST_FLAGS	0
 
 /* TCR_EL2 Registers bits */
-- 
2.39.2


