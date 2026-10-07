Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68FCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkV7aWutgjFpbY2mI5Akvl/9Cn2GxgJ/KIs/Ot1aoZM=; b=k6PW8XxFuFQOKxGM6GsMkihxi6
	QDLCa7QNydhJnds+jKa/KX52EWyJCU+vJAw/hHSf+LS8p8tBq8eRnFWdU13BEhtHnJm9n3yl2Hh+X
	FqGECbi5wxSPKtCRFLRPEaiwSaPBTqRExndoL/GxAEw8K0VK2/zAy1QLd+/dZOrpSrQ5azmy07Yfi
	WBTgUShfVW2ntcX1qWqLKSfnTtN52SpS4BB0yS8VtI9kgxPbmIiW7rybL8VOoKrgOZQdIGXrkFPxw
	5jqwvmthOytsYVD9kbb1i1ZQmoqDvMZFcRg3mPQd/vC1YMZ2FZGldRF6rfJjp8pgbki6L1weMjcf/
	cOBA3/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOVb-000000027sh-2f6y;
	Wed, 07 Oct 2026 10:04:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOVa-000000027sP-3w7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B4AF601FB;
	Wed,  7 Oct 2026 10:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00A11F0089B;
	Wed,  7 Oct 2026 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791367461;
	bh=OkV7aWutgjFpbY2mI5Akvl/9Cn2GxgJ/KIs/Ot1aoZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1QmOhj/T/jVqQOyBRwu5c6J7dAbbLrI4gMImRCkaGw/DZaPMBfqK8qoww/kbqKuR
	 iaqYfJJuECPvknLllTY2Jgw1iCsCGMkSeMvLk0jfa4xOTvQNZSD1Q33WleAt1J+Cux
	 KKuivvuUU6CnxYvwDAZrYGqddAneVKlHjN4klWQNtFSEO2ybCZ3f0U1BV6+jOW7ABf
	 PYLgJAsXRNJfHoOep3aIgzg82583sBfYgmvjoy6l8Yt8NpvJk7JLDh8YYm2u14YLgq
	 kDLEo2sRL35t7pOktGGIQx8deqEqMoRM7KCfOehlpPikv2LuORUT2XfocDqxZlXHBA
	 8MCjc6r3SNsrg==
Date: Wed, 7 Oct 2026 01:41:43 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v3] KVM: arm64: Only emulate an SError's entry for vCPUs
 with NV
Message-ID: <asYFx8g_P9H_bjb7@kernel.org>
References: <20261007080833.371899-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007080833.371899-1-fuad.tabba@linux.dev>
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

On Wed, Oct 07, 2026 at 09:08:33AM +0100, Fuad Tabba wrote:
> kvm_inject_serror_esr() emulates an SError's exception entry when the
> host's copy of PSTATE says SErrors are unmasked, although only NV needs
> this, for a nested context whose guest hypervisor owns the vSError. A
> protected vCPU's PSTATE lives at EL2, and the VMM can unmask SErrors in
> the host's copy before the first run, so KVM emulates the entry on that
> copy and the guest never takes the SError.
> 
> Emulate the entry only for a vCPU with NV, which protected VMs don't
> support, and otherwise pend the SError through HCR_EL2.VSE, as KVM did
> before commit ce66109cec867 ("KVM: arm64: nv: Take "masked" aborts to
> EL2 when HCRX_EL2.TMEA is set").
> 
> Fixes: 872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for protected guests")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20261001142109.794CA1F000FF@smtp.kernel.org/
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

