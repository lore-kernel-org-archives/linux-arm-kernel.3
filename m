Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168CDCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZuqyDo8FgnZly99u+El2yb60RrRpt64vS8UrRgMEoY=; b=Cw9KDr7yskS6hpDQwNQUReTWdV
	x0IqnlFR6Ije1JOAX4EEi6gsBpAergSNrDDPVaNAyCzYHKUy0Gv7avfHs1UShuMwBQra1w9GBkRSM
	IxpJVnUAjpzws6OLz6di8bBAr1mI61n519Kuy60MGrR7pqdKHToOO1A1zn0QPZUY+Do18T5f4zQ7D
	RQZtXMVll9qPSGXzdYneIGfsjHknKzwEQ354xtYFxa5D43aICMucG+OKs0SWcKnJBb0oO4Uv2rj54
	EsX+mdroztwTo4SopSzqCMPK/jOha0JZthExRQVQUXhk+IUuy7KnTmnCjKMu6FPzIjSona85+iqVo
	I77wpsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6rE-00000003nfD-3ifk;
	Mon, 15 Sep 2025 10:54:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6rD-00000003nef-28Dx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 950EB60195;
	Mon, 15 Sep 2025 10:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0975C4CEF1;
	Mon, 15 Sep 2025 10:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757933690;
	bh=M8SkjZeU6dCQfX1o6+UMsowRF/3INQ8dsl4CaGbWqqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1U5sYUY5kz82KPEBxqntZ4xF+CeO4mdugufCCwjY2xPgnOpKd6lomFQG/BcIMJ30
	 px3qnfcuRYLH5IK6fPCMM1++uXk/u0qYlHpZ5jimcN2Ww+7H5GCSrAYZPlmqwW/0jm
	 ZZmvRjJs31fK8XefSmzks29tryaDMSzzCQsydp+v3O8DGKVUDr2tKSQpPfa07E6Qgw
	 bDNiw9u8ZgvL7dVnEYFOHciOo24iC4Or285ehQlAGewxgTbuTwOWvuYXKw2N2QqJ/W
	 rUzDVenaolwbBNgU3d68tswnHBnvjuVok/mtQanoOgo+rowaoAWFGgO9AuXB7xbTPy
	 xI19zRGDJCSYQ==
Date: Mon, 15 Sep 2025 11:54:44 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, perret@google.com, keirf@google.com,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Dump instruction on hyp panic
Message-ID: <aMfwdInqPCiqc8rn@willie-the-truck>
References: <20250909133631.3844423-1-smostafa@google.com>
 <20250909133631.3844423-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909133631.3844423-2-smostafa@google.com>
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

On Tue, Sep 09, 2025 at 01:36:30PM +0000, Mostafa Saleh wrote:
> Similar to the kernel panic, where the instruction code is printed,
> we can do the same for hypervisor panics.
> 
> This patch does that only in case of “CONFIG_NVHE_EL2_DEBUG” or nvhe.
> 
> The next patch adds support for pKVM.
> 
> Also, remove the hardcoded argument dump_kernel_instr().
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Kunwu Chan <chentao@kylinos.cn>
> Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  arch/arm64/include/asm/traps.h |  1 +
>  arch/arm64/kernel/traps.c      | 15 +++++++++------
>  arch/arm64/kvm/handle_exit.c   |  5 +++++
>  3 files changed, 15 insertions(+), 6 deletions(-)

Thanks for the respin:

Acked-by: Will Deacon <will@kernel.org>

Will

