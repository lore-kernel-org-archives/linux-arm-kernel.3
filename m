Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D95CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IARpYnZwNw+6tQOE7sm/tXnovQq3xCYNLbihLSie8XA=; b=PA13dpzMuc/MLQQJPYLaa7/EBT
	+NcuHN+Nfx4p/K0HjVSfd6tOSNLblLJpazmyvIS6VKRNNeYbD0z5zcKQsq1GN6hWVw9IIOfEgsodu
	wA5fi73qHyLYR0qBc4Q6Gr9O62ZUP0NBnKjZ/rPTgIkXRHobM0UlJMIvPMSCFBzpkHOizMYnxqXlS
	KnTbZ5+BdL3s5d2f7t/JuWKHjftvKcj3jCnj3QbiRnxdPHE3mfi8tH55l4pdROH3yk+flO7Acsbom
	won3Upja4jWBD6hVgAGA7J4tkupodon1lggqyeWN+FqN1bPzW4lPyEQNMavlpYrzphM69ow8DJxmg
	np6Gwgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcZq-0000000Ay4F-3dtW;
	Thu, 13 Nov 2025 19:01:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcZo-0000000Ay3j-2grk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6C544427;
	Thu, 13 Nov 2025 19:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7EBC4CEF7;
	Thu, 13 Nov 2025 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060507;
	bh=oDRRct8+8e6d4sESV9pqEb3O+7eJ3tDiXPVRXj0oYHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRYWWgdoyK2Dmc0eMVR+VL0/Vx4QMjFcxrj04kxA/BT4Lt61IAlsv99RJPGUKKhff
	 eEjsWbyKvdZsFnKoyMY844jlKQy9iSsnUFNznMjCBoBDKNZcZnL979tB9c+Q2cCJRe
	 UkPfJtmfbwO+Ovz0DNsbRyI7yXvXQgBHp6oRyzItZVPcCq5hv0ilCmLlGYjM2vYY2H
	 9kFD7vF2dX66DyAX6EDbh534uwno29thYSmTgZW6uHRa/VBfgzSOmhkNGiKW92hnuM
	 LHyS+0QxIV/rLr9DCrC/Q/B7m5wvTDxD4yYMAnfARapORcVrQaIweqF9j+DeGp74/E
	 9ztwxzRv30XBg==
From: Catalin Marinas <cmarinas@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	nd <nd@arm.com>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	maz@kernel.org,
	oliver.upton@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	lpieralisi@kernel.org
Subject: Re: (subset) [PATCH v3 0/5] arm64/sysreg: Introduce Prefix descriptor and generated ICH_VMCR_EL2 support
Date: Thu, 13 Nov 2025 19:01:00 +0000
Message-ID: <176306037418.2469077.5379528252615859360.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251022134526.2735399-1-sascha.bischoff@arm.com>
References: <20251022134526.2735399-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_110148_698972_8B9B94BC 
X-CRM114-Status: GOOD (  10.84  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Wed, 22 Oct 2025 13:45:35 +0000, Sascha Bischoff wrote:
> This series introduces support for conditional field encodings in the
> sysreg description framework and migrates the vGIC-v3 code to use
> generated definitions for ICH_VMCR_EL2, in part as an example of how
> the Prefix descriptor can be used. In addition, it fixes an issue with
> the tracking of incomplete system register definitions.
> 
> Together, these patches complete the migration of ICH_VMCR_EL2 to the
> sysreg framework and establish the infrastructure needed to describe
> registers with multiple field encodings.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

[1/5] arm64/sysreg: Fix checks for incomplete sysreg definitions
      https://git.kernel.org/arm64/c/0aab5772a53d
[2/5] arm64/sysreg: Support feature-specific fields with 'Prefix' descriptor
      https://git.kernel.org/arm64/c/fe2ef46995d5
[3/5] arm64/sysreg: Move generation of RES0/RES1/UNKN to function
      https://git.kernel.org/arm64/c/a0b130eedde0
[4/5] arm64/sysreg: Add ICH_VMCR_EL2
      https://git.kernel.org/arm64/c/a04fbfb8a175

I left the last patch to Marc/Oliver.

-- 
Catalin


