Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A719D3EE97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXmOKutpf4oJjvVcdpuA87UDape5QgA7pWscPvH2510=; b=xEpRDEPxMdNaKclDVxUemGrz9o
	K7T55mStaAvjWO5hLjR2KUrP1cv6gPL7L6qbIVwGQTNgpFDcT4Q7pzord7QranxZswBcuENM4AHbI
	3Ka1V6LGYCP/PvNo8OfB/olw2v64vpabBtbvFW6/F9aGhWr6c9b2ZO3i4g4u/l0ui+JivOCaH9kRn
	RCSc0jVKdX5ztVc+AEv/HZxpdfJVso1EirPz6GODZnGCkoeNGXjVmgCxP23Q9RT9ikNibZgi1HPiE
	0vYjMPvguljl9pv6Z2v9zuGspDpKL6YSjK/mBO3KjncnBfgvRnAZvCy7n22ypn42Fuow3MC/ivsa6
	LAdHD6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2Y-00000007WH5-1iOQ;
	Thu, 22 Jan 2026 17:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2V-00000007WFT-3yku
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6305E60053;
	Thu, 22 Jan 2026 17:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C151C116C6;
	Thu, 22 Jan 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101211;
	bh=V4PTp6AWZI5MWQxX8DtA8YX5B5nuTx9/oXx6sLHPHns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sll4VSfPLggvYsQbc3VOhucDxRupzWN1AuuHZ54KrRTjWY9lINoovHVXg7KRwOqCk
	 r6WlpQn5X1ma2kC4jq5sqLD3uD7Rj4Ri7VrdV2k24Un8X/XFxzblxPIWlHEmFpq8Zv
	 hu6pu2xR7q1aP7xVNQuLYSEQVVTZg5jdd+bIHSaj5Tw0YHuxCZScdzUDn9gKrU4nxj
	 UiGiDk4X5WV3yCNam86OrMAsRIMZegnv3MLJJ7ZonSSZkHpIZgqjR9gqwLKMV0ByzO
	 zU9P7UIm7SslBOKhALIOCekPuVHiT7xn6rPnAxGQf0l30MJzM8KN8HT4OqpWpkKtm0
	 7zDhOUAE+cguQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	maz@kernel.org,
	arnd@arndb.de,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	Oliver Upton <oupton@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yangyccccc@gmail.com,
	prime.zeng@hisilicon.com,
	xuwei5@huawei.com
Subject: Re: [PATCH v8 RESEND 0/7] Add support for FEAT_{LS64, LS64_V} and related tests
Date: Thu, 22 Jan 2026 16:59:45 +0000
Message-ID: <176908829115.2153926.13840796658975178943.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119022928.149358-1-wangzhou1@hisilicon.com>
References: <20260119022928.149358-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 19 Jan 2026 10:29:21 +0800, Zhou Wang wrote:
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> Add support for Armv8.7 FEAT_{LS64, LS64_V}:
> - Add identifying and enabling in the cpufeature list
> - Expose the support of FEAT_LS64 to userspace through HWCAP3 and cpuinfo
> - Add related hwcap test
> - Handle the trap of unsupported memory (normal/uncacheable) access in a VM
> 
> [...]

Applied first six to arm64 (for-next/cpufeature), thanks!

[1/7] KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
      https://git.kernel.org/arm64/c/f174a9ffcd48
[2/7] KVM: arm64: Add documentation for KVM_EXIT_ARM_LDST64B
      https://git.kernel.org/arm64/c/902eebac8fa3
[3/7] KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory
      https://git.kernel.org/arm64/c/2937aeec9dc5
[4/7] arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
      https://git.kernel.org/arm64/c/dea58da4b6fe
[5/7] KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest
      https://git.kernel.org/arm64/c/151b92c92a45
[6/7] arm64: Add support for FEAT_{LS64, LS64_V}
      https://git.kernel.org/arm64/c/58ce78667a64

and the selftest to (for-next/selftests):

[7/7] kselftest/arm64: Add HWCAP test for FEAT_LS64
      https://git.kernel.org/arm64/c/57a96356bb69

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

