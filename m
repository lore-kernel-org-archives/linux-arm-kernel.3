Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B7BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzI1gstnxb9weSMJeZFI0ZuIvfgMs6aH56AjAYTE9IY=; b=YyLudk51fDuVayz1u7bqInaHcA
	dqhhenBISdxuNDa4x7hpxnzDUiTHgaH020pYl3/WR9pfiQ/IUli4q4POELLvh2LHELZ+a1qXaMu6x
	szBtQ/fhjv3ZlXuPxMa5yuMs/4LS86pA7MOqTjf3dnh4B32yY4kzY47ckwD0F+pObzUBKz6dynxvY
	vXjTEYFrgjNXieC9cl1NDcV3BGjnUVa2HE8qo16a2P3Mb64l1DFqRke5M5423gT0mBMU6NJoEcyRR
	2SnWfsR4g+NiZThVjx/o6y6P7J41F3ZRKYf+otHSoPoAS6hu68vvfuaV1WzFww5YT+NPt7h6y4eed
	Yut3uwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rvM-0000000AnJW-2lvo;
	Tue, 29 Apr 2025 20:51:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rZ5-0000000AkYt-0pBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64E1F5C02BC;
	Tue, 29 Apr 2025 20:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD32C4CEEA;
	Tue, 29 Apr 2025 20:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958506;
	bh=ox3lx5JlJ8b5ZVrs7yb4Ryi6efyD6oZG+SX4GVnpUQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgK0Q+KTnoknBdI0qBrfZEEOVwiUsIiTq7TZOWSVo5nqxDmsIIOI5tQCsQOejuIXM
	 ZmhoDXq8c4JlVXS8Kx4eo1MN/bkEtdwWYIBiiRL7+tuHShNIydxOl+Ir5Iuc5LR7nz
	 5k4QOqzSs+CziwyNEBW8e+v2uKZjNEEcYwVieS/Lx7j7IKHmL0xhpaZ65U4urXN9ra
	 mIcoawHkHAK5hvo7xhHrwOe76zpSL3X4uQk3AjZwjFFmeVZt/a/4cRYXo7HobGuT6I
	 TNxxY/jCii66xs4U2yJg70ZpRG3TouPBlWj70rp/xF5POQ4kzsN/Y0w9ZPgoiuUG0C
	 I13Toccn/EaMA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Yicong Yang <yangyicong@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com,
	xuwei5@huawei.com,
	yangyicong@hisilicon.com,
	linuxarm@huawei.com
Subject: Re: [PATCH 0/3] Two minor fixups around FEAT_E2H0
Date: Tue, 29 Apr 2025 21:27:53 +0100
Message-Id: <174593019872.429067.18438816126339860301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250329034409.21354-1-yangyicong@huawei.com>
References: <20250329034409.21354-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132827_287470_E63F9DB4 
X-CRM114-Status: UNSURE (   9.02  )
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

On Sat, 29 Mar 2025 11:44:06 +0800, Yicong Yang wrote:
> Two minor fixups for the FEAT_E2H0:
> 1) add missing feature register update
> 2) fix boot warning with kvm-arm.mode=nvhe if !FEAT_E2H0
> 
> Add a cpucap identify the HCR_EL2.E2H RES1 (!FEAT_E2H0) support.
> 
> Yicong Yang (3):
>   arm64/cpufeature: Add missing id_aa64mmfr4 feature reg update
>   arm64/cpufeature: Add cpucap for HCR_EL2.E2H RES1 (!FEAT_E2H0)
>   KVM: arm64: Fix boot warning with kvm-arm.mode=nvhe on !FEAT_E2H0
>     platforms
> 
> [...]

Applied first patch only to arm64 (for-next/cpufeature), thanks!

[1/3] arm64/cpufeature: Add missing id_aa64mmfr4 feature reg update
      https://git.kernel.org/arm64/c/35382a364640

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

