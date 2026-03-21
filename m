Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A31094481
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW9iXIwkfVDTymVANFWr8ekGuRxWJ4kH6N7R1db0pcA=; b=nR4dBHV2vNjP0FtNb8jmPRibjy
	Cv0XTnpPAkKlHfnw1wFWWLHwDWCqsIjXlDpylR/Wm0YimPTrIzdsFhEhyrPu1iENEs/KxivC7IhRt
	+Fii11bBcMCqgTt2AwyUmTiakdJihNUxBxJOYXt7nnNOQCocmr4Nh/j4ZEKwhois1JHh6m8qRbjf0
	dNFmA+EKIR0OdqY/Kz7CEkEaIeq8dPKg421jsbgk4Le3CFgTU60UEr7jeVe/ykuxx3WFKqURzX32A
	RERk+9mgw+xZi5aVabU75QggQCn5Q754kNPkzfFydZlteWEG6MbnsXhsvz/8CseGq7fCA7zpOUV6D
	SqBGVvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oN-0000000Enqc-1hrQ;
	Sat, 21 Mar 2026 21:24:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oG-0000000EnnB-1D4r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 902D944556;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E13FC4AF09;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=563KpVrS+TBFZhl7NDTIVcn4JaQQA/lY4T69GmEGAJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KaxzJYJvUQ9i86qn3WyL7zPGIeenArehJKCmcRaLjCCdI4n/CchImuOdIdFuAJ4eE
	 xQjdbMEzv+Ef6eI8J6ocjZwBk9U9NqX49lc2kx74FXvPDBT3H7JWhWe9KqAxKaEilO
	 i94n525sEKGlVTGxr3U2nwHH7c1aVE9WKI5oKVPpSwfGhPnIFQ/kfBFAG8s918p7s5
	 zYhJKTKYOUy/VuW/vmKG8JvO2VmZMtW1R/aatuCGKl1vI104iDmoZOxy8Lr0iSY4r1
	 tnFYaVTVBmaIU5hA+Q9Nvt1gfVMkL5gHmttwvQPs6oMESg+nYJzTWSs2LRn+woIYcn
	 l6KBvRPrdQiqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oC-00000004NPB-01kj;
	Sat, 21 Mar 2026 21:24:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 1/5] KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_entry
Date: Sat, 21 Mar 2026 21:24:15 +0000
Message-ID: <20260321212419.2803972-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
References: <20260321212419.2803972-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_142440_343750_55DC8058 
X-CRM114-Status: GOOD (  10.89  )
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

We currently handle CPUs having booted at EL1 in the middle of
the kvm_hyp_cpu_entry function. Not only this adversely affects
readability, but this is also at a bizarre spot should more
error handling be added (which we're about to do).

Move the WFE/WFI loop to the end of the function and fix a comment.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 0d42eedc7167c..5d00bde092010 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -201,14 +201,9 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 	/* Check that the core was booted in EL2. */
 	mrs	x0, CurrentEL
 	cmp	x0, #CurrentEL_EL2
-	b.eq	2f
-
-	/* The core booted in EL1. KVM cannot be initialized on it. */
-1:	wfe
-	wfi
-	b	1b
+	b.ne	1f
 
-2:	msr	SPsel, #1			// We want to use SP_EL{1,2}
+	msr	SPsel, #1			// We want to use SP_EL2
 
 	init_el2_hcr	0
 
@@ -222,6 +217,11 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 	mov	x0, x29
 	ldr	x1, =kvm_host_psci_cpu_entry
 	br	x1
+
+	// The core booted in EL1. KVM cannot be initialized on it.
+1:	wfe
+	wfi
+	b	1b
 SYM_CODE_END(__kvm_hyp_init_cpu)
 
 SYM_CODE_START(__kvm_handle_stub_hvc)
-- 
2.47.3


