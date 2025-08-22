Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F3CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucW5TqvXSFl4ARAEgmgO1++0Jhipt96vounQfr6Zybo=; b=1p4ArjbbKUdpA0G6ph9nIJZJcK
	V50UA5S6+KYWsBF7MYDLwPrjKlZn6rr2N54GfpxLFVsm7Sh0Wn341W2g+WaOTmTUREH5KA9EczLBr
	dqgfdt2leP/eW3SJ1usJEqW5rf9PS5qvilMSSYFB6tm73DTCKEQE5yt3T2u32ETBS7YDnjnyXoTu3
	v0ZL3FD++8yMo1+3K2pBHoIRBz5sE9UddzkpL3nJoi//RyNyQtU02f/yHqchbm6U7t1OlL+LAbNDr
	SUrdOj6rms1cvnTxuYMGRMOsI+es1w1JnQmZ1J91HR2y0rrVpHqRbn1bGXVCMxeGQYuzbTspubC/K
	RxorB24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPj-00000001asF-3shK;
	Fri, 22 Aug 2025 05:34:11 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFEU-00000000zKj-0w2j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:02:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755820931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucW5TqvXSFl4ARAEgmgO1++0Jhipt96vounQfr6Zybo=;
	b=JT73iF4rjnd4Iy29P/fnGsFVmZ0yBnBwk5yn05z2bblCN/Z9ixfOS9rERLTbPQvUMP/DCq
	W6QZBWJwRk6XAT0CHe4j+jLmYlyion1XoXC8E1WyOpJaG/nlXm1DBvApM7Y4iJblp3V/bm
	v/xo5pRaZktkHiPEVv4RxstIblUeIjY=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 0/6] KVM: arm64: FEAT_RASv1p1 support and RAS selection
Date: Thu, 21 Aug 2025 17:01:59 -0700
Message-Id: <175582091318.1266576.11766063075536898345.b4-ty@linux.dev>
In-Reply-To: <20250817202158.395078-1-maz@kernel.org>
References: <20250817202158.395078-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_170214_687554_5A300ACA 
X-CRM114-Status: UNSURE (   9.50  )
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

On Sun, 17 Aug 2025 21:21:52 +0100, Marc Zyngier wrote:
> This is the next iteration of this series trying to plug some of our
> RAS holes (no pun intended...). See [1] for the original series.
> 
> The difference with the previous drop is that we don't try to expose a
> canonical encoding RASv1p1. Which means you must migrate between
> similar implementations for now.
> 
> [...]

Applied to fixes, thanks!

[1/6] arm64: Add capability denoting FEAT_RASv1p1
      https://git.kernel.org/kvmarm/kvmarm/c/8049164653c6
[2/6] KVM: arm64: Handle RASv1p1 registers
      https://git.kernel.org/kvmarm/kvmarm/c/d7b3e23f945b
[3/6] KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's EL2
      https://git.kernel.org/kvmarm/kvmarm/c/9049fb1227a2
[4/6] KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable
      https://git.kernel.org/kvmarm/kvmarm/c/1fab657cb2a0
[5/6] KVM: arm64: Make ID_AA64PFR1_EL1.RAS_frac writable
      https://git.kernel.org/kvmarm/kvmarm/c/7a765aa88e34
[6/6] KVM: arm64: Get rid of ARM64_FEATURE_MASK()
      https://git.kernel.org/kvmarm/kvmarm/c/0843e0ced338

--
Best,
Oliver

