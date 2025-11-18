Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E283BCEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clqFkk5QMErRdxE/ex0Hwthz5N8MB3BzZsm2/zTzYc0=; b=13r6P4Ps+BRD1/Bd/dCbNi5EDb
	YHL1r4O3XwV1OCsNCD9sM0otiNc19i5WeDlP/HpTXMAnCeoUzfUjyBRcggj2vr3f72eZg0tLSUwy8
	wjMqF0ozMd7bQhAHDrvDY1R+UvroLyi7ETkbpdQYxllSEl3XDcbqH7H95bJ0dHfvnAtt2pWpqFwjN
	qjvkCCeTRWvzTlhzqzeY4DrGcW1nUrU3+OaaiQ/9Owk4OT5y4KYpLjVeLNp+tsAi7QpB0mAMddz+Q
	aCAI2teWIYlGMMzMln72CbiD3j7te4fkbKqZdiHkdpevovSGvr1IHKh4YPRZg+Nf9GOyduB4LpukV
	lz5MQatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLG1H-0000000HYR8-09DS;
	Tue, 18 Nov 2025 07:20:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLG1D-0000000HYQn-1olg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 773B2601A7;
	Tue, 18 Nov 2025 07:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CC7C4CEF1;
	Tue, 18 Nov 2025 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763450450;
	bh=j+MYg21RyAED4d0T7A8bQOMTtInQi6sOoDxd6eR1Muk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auyuCTfQWiotWzkuYWbY3kpLpU1Rx9vv6Ce6mePeTlvdStH2Mlq/MJ0L17XFdeYHr
	 rPw5mvZiWtV57Bti6p32Ki0iGz8l0N289niGMqWyULzI2S67/OF2J2ClZ30l1NVMZT
	 SwqYRKAUWiAAv2xwzyJNP8fdeAyHQlfcYj0oCMYZ6booge8jwliQKyLdy4KrO1P5qs
	 Ri00Ujz2q199Go/WiONfVpbVz5whlik+KM4Hc9EY07glIlJ4A2oZ8lkJOL7X6yscjb
	 O0ztnAYtRpuGe0AkCAO6a1vh3BIgj40zKn07NAprKsSCqHXxqe6/UW5CI5k5V7CaWr
	 UfncsehknxHEw==
Date: Mon, 17 Nov 2025 23:20:48 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
Message-ID: <aRweUM4O71ecPvVr@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
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

On Mon, Nov 17, 2025 at 09:15:22AM +0000, Marc Zyngier wrote:
> This is a follow-up to the original series [1] (and fixes [2][3])
> with a bunch of bug-fixes and improvements. At least one patch has
> already been posted, but I thought I might repost it as part of a
> series, since I accumulated more stuff:
> 
> - The first patch addresses Mark's observation that the no-vgic-v3
>   test has been broken once more. At some point, we'll have to retire
>   that functionality, because even if we keep fixing the SR handling,
>   nobody tests the actual interrupt state exposure to userspace, which
>   I'm pretty sure has badly been broken for at least 5 years.
> 
> - The second one addresses a report from Fuad that on QEMU,
>   ICH_HCR_EL2.TDIR traps ICC_DIR_EL1 on top of ICV_DIR_EL1, leading to
>   the host exploding on deactivating an interrupt. This behaviour is
>   allowed by the spec, so make sure we clear all trap bits
> 
> - Running vgic_irq in an L1 guest (the test being an L2) results in a
>   MI storm on the host, as the state synchronisation is done at the
>   wrong place, much like it was on the non-NV path before it was
>   reworked. Apply the same methods to the NV code, and enjoy much
>   better MI emulation, now tested all the way into an L3.
> 
> - Nuke a small leftover from previous rework.
> 
> - Force a read-back of ICH_MISR_EL2 when disabling the vgic, so that
>   the trap prevents too many spurious MIs in an L1 guest, as the write
>   to ICH_HCR_EL2 does exactly nothing on its own when running under
>   FEAT_NV2.
> 
> Oliver: this is starting to be a large series of fixes on top of the
> existing series, plus the two patches you have already added. I'd be
> happy to respin a full v4 with the fixes squashed into their original
> patches. On the other hand, if you want to see the history in its full
> glory, that also works for me.

I'll pick up these patches in a moment but at this point I'd prefer a
clean history. Plan is to send out the 6.19 pull sometime next week so
any time before then would be great for v4.

Thanks for ironing out all the quirks :)

Best,
Oliver

