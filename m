Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A23FD2B92C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycjBm7Hg0nkHE7yql8uf+iT25iCukbCSEp+i0HpjwBI=; b=ShDjhpNpIx1VgUmZw5qzl8Bs4X
	Ei7rxMAhvNkiLWyEdQzZHMLLcL26N6oC6CK79gzXbE5L8haVwgTwwsKmFttcQu0vHmIQanuNZ+80J
	gLvFkefAZn5ISs7anItLeiIr6KUXYqpNhYmCBGUYmbvzI8rdeeBhcTFj4wKAy/pzDRT88JGJo/AOx
	mF/5anNnIOWi0Ezj6Zl8ViNmH8eZN5cl9KKnapOk8p0DHdW3vGNltQ1EH72mP0CBVPwpck0Cvcdw7
	FM3vXfLDLCo71MCUQFBidI0cY9STi18V7zoUaMZ7MSmB0NQj/GSbFB6rUbdtgAohulPQqsAv0/R5U
	kqvNYC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jzd-0000000HBBR-1d9B;
	Tue, 05 Nov 2024 13:53:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jxv-0000000HAza-15R5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3EABA43218;
	Tue,  5 Nov 2024 13:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8962C4CED0;
	Tue,  5 Nov 2024 13:51:21 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	maz@kernel.org,
	mark.rutland@arm.com,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: oliver.upton@linux.dev,
	ryan.roberts@arm.com,
	linuxarm@huawei.com,
	jonathan.cameron@huawei.com,
	shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com,
	xuwei5@huawei.com,
	wangkefeng.wang@huawei.com,
	yangyicong@hisilicon.com
Subject: Re: [PATCH v4 0/5] Support Armv8.9/v9.4 FEAT_HAFT
Date: Tue,  5 Nov 2024 13:51:19 +0000
Message-Id: <173081454978.3479783.10267483524486359062.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241102104235.62560-1-yangyicong@huawei.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055127_383692_29CD3D28 
X-CRM114-Status: GOOD (  10.71  )
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

On Sat, 02 Nov 2024 18:42:30 +0800, Yicong Yang wrote:
> This series adds basic support for FEAT_HAFT introduced in Armv8.9/v9.4
> and enable ARCH_HAS_NONLEAF_PMD_YOUNG. The latter will be used in
> lru-gen aging. Tested with lru-gen in below steps:
> 1. Generate a 1GiB workingset by `stress-ng --vm 1`. Then hang the task to
>    stop accessing the memory. (AF bit won't be updated)
> 2. try to age the memory by /sys/kernel/debug/lru_gen
> 
> [...]

Applied to arm64 (for-next/haft), thanks!

I added back the ID check as in v3 following Marc pointing out the
Ampere erratum. Who knows, we may get similar bugs for FEAT_HAFT in the
future, so better have it covered.

[1/5] arm64/sysreg: Update ID_AA64MMFR1_EL1 register
      https://git.kernel.org/arm64/c/aa47dcda2708
[2/5] arm64: setup: name 'tcr2' register
      https://git.kernel.org/arm64/c/926b66e2ebc8
[3/5] arm64: Add support for FEAT_HAFT
      https://git.kernel.org/arm64/c/efe72541355d
[4/5] arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG
      https://git.kernel.org/arm64/c/62df5870ebf7
[5/5] arm64: pgtable: Warn unexpected pmdp_test_and_clear_young()
      https://git.kernel.org/arm64/c/b349a5a2b6e2

-- 
Catalin


