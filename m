Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C3C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wiE8+652mpRF5Wv8L5JLUzS+AMRGr+ZL9tPVtw3Wc2w=; b=aK9cYO2RGjwJdypPl/Etp+n0JQ
	BUySVtvYE+cAO28H0xejk8wIbPro3KQvCAUBX2ICyKs/6eIx9tZ5dJ6obtLtExaDm3v6caxa9QASj
	Jrc6VVxe6mFRbR3nKzFJswsV+tOSkaHtc9YzNpUyHn8JEhI5U7zeyFVOdtDPGT4UFcM7RSwL2Wgmi
	dLs4mw+PBooocgE26S/fDUhuYK1oZsRObs6YE78j7O+KQqfrs8QUOLU3qp2R1GvRvBxMel65h7GIt
	+eduhjlh2/dDgt8UDpMLk0LDt+aVK3xAERpu3oTKJD6LwNn+A9Up5ihJav8LvEYSmQeLyAuxPwYWE
	mFHoY5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzG3-00000004IWL-08oa;
	Mon, 17 Feb 2025 11:25:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzEZ-00000004INt-3PxG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E690F5C4876;
	Mon, 17 Feb 2025 11:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F6BC4CEE2;
	Mon, 17 Feb 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739791459;
	bh=VW0lRx1jn83lC+Kf9zPv7uSmERzJHKkPsnqIFNwgmSA=;
	h=From:To:Cc:Subject:Date:From;
	b=sUpNClV3tERLKS5FBDJVLSRNP5avrwqxwAST2S3SxEfxT8n8HJFeMk2iC0DvUHHvB
	 W1R8Pq0+cv/0OYxcw00dZmjCghAvpGV0fenf1OcmqaWtQJypc1zwhzfEf28zIccDyj
	 4+KTOzrAUaj/41S0kDP2bwo57zxAruqurK3t4kAIC1DxGLSakmtuPmxTP1SXXleIYi
	 kAKhGDA8d28Dx1cJ3kcDwg9e7zXXXQ8XYXazCfnoHdFxn7Yv3j9vJuu0SzUbA2ezPb
	 7Y9c1B8oLjM4ZqXwBqsupA6PGIdK5CUu17TPTW/p90dcR5aQvwkxWr/aIUyTxpHxyc
	 OG+MppQLy8Fyg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjzEW-0052DP-ML;
	Mon, 17 Feb 2025 11:24:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] KVM: arm64: EL2 PMU reset handling fixes
Date: Mon, 17 Feb 2025 11:24:10 +0000
Message-Id: <20250217112412.3963324-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_032419_891082_58EB2695 
X-CRM114-Status: UNSURE (   8.46  )
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

Joey reports that some of his PMU tests do not behave quite as
expected:

- MDCR_EL2.HPMN is set to 0 out of reset

- PMCR_EL0.P should reset all the counters when written from EL2

These couple of patches attempt to remedy the situation. Note that
they have only been compile-tested.

Marc Zyngier (2):
  KVM: arm64: Fix MDCR_EL2.HPMN reset value
  KVM: arm64: Contextualise the handling of PMCR_EL0.P writes

 arch/arm64/kvm/pmu-emul.c | 21 ++++++++++++++++-----
 arch/arm64/kvm/sys_regs.c |  7 ++++++-
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.39.2


