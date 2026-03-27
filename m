Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208CA10ED677
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPErFERDAqYRFC0XJtXQTnsaSahEG28xJEgIuWHpxu0=; b=sGsSecm2YxIKIF11wZmXgxM70+
	HDT4hhD1kSRROK0llVUrhKIesq9tnnpxdQ9HQsFpeFW221On9Y7WkUtuNrCvUwepb7MmZyortuQpJ
	KZK9Xb/RcoGTO1tYQbsmiSYuqdJwXAORUCJ7+oNhXKcdT9aeGRIEeehf9bPGN7n0QrjyDaBlqBXWY
	cj+Wcr7TGndb0DxgBHkuvQSVssLAQ0Q60gZPbbUr1fqYgToxVACDgm3UMDJQopVd5kobph+fwBYSe
	cFNgKe35k1wPFPkwOSXlooZKgVr9OgsZPtfHoKNEFEa983nWwigX8nler7zkQwEONaYIAmE1Dzn2d
	vZJ79xXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w673P-00000007QtW-2yYi;
	Fri, 27 Mar 2026 13:16:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w673N-00000007Qsg-08TI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:16:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86F7B35A1;
	Fri, 27 Mar 2026 06:16:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05233F915;
	Fri, 27 Mar 2026 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774617402; bh=hCvQnYCBMadBb41sDOIC7/X2d4bp47XZvczCJW89veA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkSN9AUQseR1kOgjTvOjuH5RoY7tsvhDl64v/ztTPODkcniNwe7c5605JdzGxvUMw
	 UGQmokfgFrWnwVukxlHV7Xpzq1mUZT6/8aOqS54x/7KzhguAR0NmZxP98B7cdJWSaI
	 jiTMrXgr1VBgaKt7sfDQR1ogiKHkXXJ1rWjf0DHM=
Date: Fri, 27 Mar 2026 13:16:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, maz@kernel.org, oupton@kernel.org,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, broonie@kernel.org,
	ardb@kernel.org, suzuki.poulose@arm.com, lpieralisi@kernel.org,
	joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v17 0/8] support FEAT_LSUI
Message-ID: <177461632621.2272468.5197255307509898250.b4-ty@arm.com>
References: <20260314175133.1084528-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314175133.1084528-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_061645_114392_EDAC7151 
X-CRM114-Status: UNSURE (   8.20  )
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

On Sat, 14 Mar 2026 17:51:25 +0000, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> 
> This patchset support FEAT_LSUI and applies it mainly in
> futex atomic operation and others.
> 
> [...]

Applied to arm64 (for-next/feat_lsui), thanks!

I decided to drop patch [6/8] (arm64: armv8_deprecated: disable swp
emulation when FEAT_LSUI present). The way FEAT_LSUI support looks now,
we still have uaccess_enable_privileged() working properly and we could
even support SWP emulation using exclusives. While it's highly unlikely
to see both 32-bit EL0 and FEAT_LSUI in practice, models may support the
combination and disabling SWP emulation feels pretty artificial.

[1/8] arm64: cpufeature: add FEAT_LSUI
      https://git.kernel.org/arm64/c/7181f718cb0f
[2/8] KVM: arm64: expose FEAT_LSUI to guest
      https://git.kernel.org/arm64/c/f6bff18d05ed
[3/8] KVM: arm64: kselftest: set_id_regs: add test for FEAT_LSUI
      https://git.kernel.org/arm64/c/42550d7d8aa6
[4/8] arm64: futex: refactor futex atomic operation
      https://git.kernel.org/arm64/c/eaa3babcceaa
[5/8] arm64: futex: support futex with FEAT_LSUI
      https://git.kernel.org/arm64/c/44adf2bf40ef
[7/8] KVM: arm64: use CAST instruction for swapping guest descriptor
      https://git.kernel.org/arm64/c/16dbe77a5be2
[8/8] arm64: Kconfig: add support for LSUI
      https://git.kernel.org/arm64/c/377609ae8b6a

-- 
Catalin

