Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D8E9B36E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/QhwCTwy4AMVoDMPIZfUoIHetvpm2/Ja5aNkOS8lcHc=; b=H6aB5do9pwyRldF4xMugd84k2y
	SYYgxOTfO/h0fAdhMeVG5ELAeiH5BedGXaouxva4ua69OyQSUOpQrm1m4Xdd0zk9kO3JENzG/Ot0f
	J1cb/Rqk4NTPJIRuiY4f6nIVRdjTXcaa0YwpIv0BdqYXSD/Z50P33uypj/VbkqZzc5/fKMBad89YR
	3fP5n3i0jV7HZ+HdM7eNQk0nO4TRCDyyUh9jsdgo+y3r5DNRgWYmsF3PRMHVV+O8w1bjMuM57i9kg
	vYvuiJ2PoPdEPWWcNspRwf2rKDQNh1sIrI1nkdevpZmBNDjARiB5mZL7fqlvf0UYGHoKPXGZgJEZn
	n90tebVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tm-0000000CsLH-0Win;
	Mon, 02 Mar 2026 11:57:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tj-0000000CsIC-3LlH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16EC74180E;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7764C19423;
	Mon,  2 Mar 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452634;
	bh=c49Vj6dYxBjCUX5m63Z1mVVfVLMWdQ22PCQzSa8wfQ8=;
	h=From:To:Cc:Subject:Date:From;
	b=UVmCX3IoDgCmqpqpmjBui/OrryISQMxnOSAkik4i17ixpSSw2tiNjZ1t/gsIRzcCb
	 84gB8YdIaCncB9PIEo23HzIKTvZiPKuSqGlZRpjvSmWVrQC6edK6rNp1mUknBpcf2o
	 8kcovZ+SSoYDGq6EksYR4DOc22uQMWubcoKpFTOAqcHpOkQyDp0hBSGtr8bNbDApKM
	 Aqjn6BtI7I9NFiTAniRhnaaYqBVKYZ0NktGpjF5Oj7sQ+/K+rPauDr9PDFEaR4Nrpu
	 3URiicXMHyeWxv9rR6XQuq8PFOnsNlvpsms8DOzfNH/MordQ5MxNduJ3qpwfT3bowo
	 Bp6hVzQUfoa1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1tg-0000000FDFJ-3ap5;
	Mon, 02 Mar 2026 11:57:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 00/11] arm64: Fully disable configured-out features
Date: Mon,  2 Mar 2026 11:56:41 +0000
Message-ID: <20260302115653.1517326-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035715_859331_73A41FA9 
X-CRM114-Status: GOOD (  11.42  )
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

This is v2 of this series attempting at making the handling of
features that are disabled at compile time a bit less awkward for
non-userspace consumers of the sanitised feature bits.

A few things have changed, thanks to Fuad and Suzuki spending time on
reviewing this, but the overall behaviour is the same.

* From v1 [1]:

  - Mark ALL_HIDDEN and HIGHER_SAFE as incompatible

  - Don't update a feature that is ALL_HIDDEN (or overridden) on the
    secondary boot path

  - Reduce the size of struct arm64_ftr_bits

  - Add a helper for setting a field to its safe value

[1] https://lore.kernel.org/r/20260219195533.2455736-1-maz@kernel.org

Marc Zyngier (11):
  arm64: Skip update of an idreg field affected by an override
  arm64: Add a helper setting a feature field to its safe value
  arm64: Add logic to fully remove features from sanitised id registers
  arm64: Convert CONFIG_ARM64_PTR_AUTH to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_SVE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_SME to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_GCS to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_MTE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_POE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_BTI to FTR_CONFIG()
  arm64: Remove FTR_VISIBLE_IF_IS_ENABLED()

 arch/arm64/include/asm/cpufeature.h |  15 +--
 arch/arm64/kernel/cpufeature.c      | 141 +++++++++++++++++-----------
 2 files changed, 94 insertions(+), 62 deletions(-)

-- 
2.47.3


