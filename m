Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57280CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LdpmtjSiidN7Icp/40zzSnCBgArAOaSHpyOKHF+30zI=; b=ecZBhnqxtfCMR0KtCSD9zzI4m3
	QruL7K9wkeqmxg1amPJEZRiHIEEszk7KVaI4ObOBHj4i5yhA4YUq4BM4HDjCqxsNH4MatW1BL+ZtP
	6mqimJlc2KS/OvZJBw0goqgO2WyvNZWQgvEt1syaMsxRp6+A0jHw9zJ57LL3/Y1rs97pmAZCCx4/d
	lj3vZ87WvD6obTpaoC2NZzswJweov2YaRXXUb2DW7L/i8JcR5kbd3eTOhvErHWpmrKOESKF/9Jcgm
	pS3GXRSp820BrA02CBF4CsD5I+1hfcW+pilkeHblhfZ+tnSjiiltj0A5tDgjqnvsYZIZkdAQOObOg
	1Zs0PcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURS1-0000000DNA9-0YjR;
	Tue, 02 Jun 2026 15:54:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRy-0000000DN8c-350U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E704051D;
	Tue,  2 Jun 2026 15:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A683C1F00893;
	Tue,  2 Jun 2026 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415681;
	bh=LdpmtjSiidN7Icp/40zzSnCBgArAOaSHpyOKHF+30zI=;
	h=From:To:Cc:Subject:Date;
	b=Nq+qOgoWxcnO1mJd+Iml5im8ytupjPhSM6o6I+dDc1bKCECf2HtPtmSdyuvh+Id33
	 zVpyFP6CB608an8cAUDFSLoE65upD7Jho4C4kL1f+eMjsR5np6MkEPZ6FC0LE323ls
	 ZM2lZM+Qbbo3R9b+0dWzShg4hBUwwQVKEHwPMnWrT/bZeyLA7+ZccuhmhzQWxOeISS
	 zGANEIz/YbkMaZu/MWI3lmLKGDl+Y4GzBEwAm4+ElPRFAtGrU4beOAXAWgz0lbSeor
	 zIXuVDdFlLpLvHlpaCQr2Kx3TxFTBng/ClzhR63w34sbFcilvs2ggxD6+P3x5vYpkD
	 8G/Pbu+NSQGCg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wURRv-00000008fVv-3HqS;
	Tue, 02 Jun 2026 15:54:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/3] KVM: arm64: FEAT_{S1POE,ATS1A} support fixes
Date: Tue,  2 Jun 2026 16:54:26 +0100
Message-ID: <20260602155430.2088142-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_085442_833727_8F1CE530 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Whilst working on a slightly unrelated feature (FEAT_NV3), I found out
that an L2 guest wouldn't boot if the host was exposed to FEAT_S1POE.

Upon investigation (and hours wasted in a SW model), it became
apparent that while the AT S1E1A code was ready for action, it had
never been fully plugged in (blame the usual suspect...).

This resulted in an extremely odd failure mode, with an L2 being
unable to make forward progress, but KVM at L1 not taking the hint
that something was really wrong. Additionally, an embarrassing typo
was spotted in the CPTR_EL2 handling.

With this in, FEAT_S1POE no longer breaks our NV guests.

Marc Zyngier (3):
  KVM: arm64: Key CPTR_EL2.E0POE propagation on FEAT_S1POE
  KVM: arm64: Wire AT S1E1A in the system instruction handling table
  arm64: cpufeature: Expose ID_AA64ISAR2_EL1.ATS1A to KVM

 arch/arm64/kernel/cpufeature.c          | 1 +
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/sys_regs.c               | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.47.3


