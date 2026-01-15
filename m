Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C85ED41178
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2eEHI1RcQwXpr1qVMMa/Qj7mYYEH64V17sGaZjxOf0=; b=sFTt87zUr0oou3aJ7n2UjvA/bV
	jIvoGm5pcjFoNSMOrQeOZkBgGgcNWd9khcXHvNENNBIddNaDa8C4qmH/LESoSV86sD0cVlvl2Ll2o
	xM/ZlVeQWj2HWdac1oEBGp7Up8osK6EAUgYPeIBu0SX3/kKMKhLS7qRPD211WS3Zarh8PgLb7kZmn
	IooPBNYk6LTT07HBu8yEQsdWd0zPH14RbKcBqca3Sffv9H7YiLcjsxCZmnVLCgFISRZKfIvSZIW9/
	GpSqyY5W5aSBEUw+4blUD1ximRPERIsDS0weBX1Lovz1gSQDLRk5BHTbCN9e4r0+BjtCaBJXd0XwQ
	Q0aTZttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgM8T-0000000CIRA-4AvF;
	Thu, 15 Jan 2026 12:07:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgM8R-0000000CIQk-3rtA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C9142D57;
	Thu, 15 Jan 2026 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CC3C116D0;
	Thu, 15 Jan 2026 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768478850;
	bh=f9T+RVKITvC3zGHO9fSKmJDHGMMiKmOzSVT26F83cNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2dIoPLxARHFp6Wt9YYVD65OkaRzS6qKuuOMzIhOCpfcMkc94p4VpEEiiGCQ063QI
	 ivQL6K3tIdrgQXsyhRhjqXDT2VeXRqGkCAjHfF/3WE3qNGK3WDZpyKTvkbO6DNvsuS
	 /14JK3r3wWVrZ2BScofbQbl3r4a1eUZd1BCqn2iQaDQJU7AplAWk0o0aFg7GaDXVhY
	 CB7+44tkTPhNEUhDau5kaHq6a9m+Nkulvy4ImNk+HLLtuFzUdwC9I7phmjCBjGPJWb
	 9Da+p6v+u5RvQ3/XGpiqA9VFAH8w2dFJUf5fIOtnVEazRRaEom2briQBnh4hdr2nY5
	 Ps+oU0G7G7dBg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vgM8O-00000002W0n-3UaY;
	Thu, 15 Jan 2026 12:07:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v4 0/9] KVM: arm64: Add support for FEAT_IDST
Date: Thu, 15 Jan 2026 12:07:22 +0000
Message-ID: <176847883532.3732984.5442091537766378905.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_040731_978974_B970BCFB 
X-CRM114-Status: GOOD (  13.30  )
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

On Thu, 08 Jan 2026 17:32:24 +0000, Marc Zyngier wrote:
> FEAT_IDST appeared in ARMv8.4, and allows ID registers to be trapped
> if they are not implemented. This only concerns 3 registers (GMID_EL1,
> CCSIDR2_EL1 and SMIDR_EL1), which are part of features that may not be
> exposed to the guest even if present on the host.
> 
> For these registers, the HW should report them with EC=0x18, even if
> the feature isn't implemented.
> 
> [...]

Applied to next, thanks!

[1/9] arm64: Repaint ID_AA64MMFR2_EL1.IDS description
      commit: 4a7fe842b8a3f3c173c3075f03c60c3f9f62e299
[2/9] KVM: arm64: Add trap routing for GMID_EL1
      commit: 1ad9767accfcb81f404aa3d37d46b3eb494dce2f
[3/9] KVM: arm64: Add a generic synchronous exception injection primitive
      commit: 19f75678238734ef383f9e10d8e1020873e97170
[4/9] KVM: arm64: Handle FEAT_IDST for sysregs without specific handlers
      commit: d78a14decd494caf72ea0144624621e7e43ae451
[5/9] KVM: arm64: Handle CSSIDR2_EL1 and SMIDR_EL1 in a generic way
      commit: f07ef1bef67ca08799df262cc901971ac274783d
[6/9] KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
      commit: 70a5ce4efc0e1194718aad6f26332c99e6a119db
[7/9] KVM: arm64: pkvm: Add a generic synchronous exception injection primitive
      commit: e5d40a5a97c1d57e89aa5f324734065c6580b436
[8/9] KVM: arm64: pkvm: Report optional ID register traps with a 0x18 syndrome
      commit: 592dc2c020686536dae1c427c78cf558a3df4414
[9/9] KVM: arm64: selftests: Add a test for FEAT_IDST
      commit: b638a9d0f8965b98403022cb91d8f3b31170eb35

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



