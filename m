Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D5C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39P9T/VJ5C2MXV9mPbSHTlmvddUcLRGzb1iAxJYjdJ4=; b=2MDmjlvB8DT1ET/ZL8a95UmFUS
	d/HaW6FAMFEaTv72v8OF4PpR6fYngy4IAJpyOYV2DTsw1pOFfSJmfEsTmew9z9mcWe+akV6aOuWac
	0hWUL4QDVXPLKtRCBwWX7x/wb9m0asYSZ0xGM1IvADNai3zH4mj7KpkAFTy56xRxaR9xfzvBy80g1
	Rke42fXjZHXe0hmrfeuObptIxhHcF4isU1vMkRDiNgoWZykvUDlvaO3pXBqC8WJOrkVOra/Kj+1t7
	HDizIOR4VrZInaMSZJyvmFLn1X9HwYrwUo8/akw5jPZAz9hjrw7/nu5O5nECh/sF0tJABC254S9VZ
	vOTK1VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eBD-00000007aMl-32Fa;
	Mon, 07 Sep 2026 18:34:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eBB-00000007aML-0ITk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BD011476;
	Mon,  7 Sep 2026 11:34:46 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E44E3F528;
	Mon,  7 Sep 2026 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788806090; bh=Ox53w8vlukQqk29PxMv7Of5O2VoRl9viNkh3MI9BUgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsTMVaqyP/VWuAhLNnQQpYB8ddw7IBWV7Q8jbcfyZ+kOJYAj44jj5UYtNph0sT1VJ
	 G/spHE65/+01gqUlv7kTaDRoBEmzV5ARLYR8+1zOSQ6cdbx6PZbunfUm21YKusnUPv
	 a2Imhi0CcQEnpwhsqfnvLBWDEiGx5RT0/Rw2Eesg=
Date: Mon, 7 Sep 2026 19:34:40 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 01/20] KVM: arm64: Prefault host stage-2 entries on block
 split
Message-ID: <paokd4d2c3x2rnkoa7pwtsa4t6rwdgbcbtaytt5qbhxe2xk3kr@2nsyoy7i2hst>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-2-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_113453_222028_BD9DFE49 
X-CRM114-Status: GOOD (  11.90  )
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

On Mon, Aug 03, 2026 at 11:08:45AM +0100, Vincent Donnefort wrote:
> From: Keir Fraser <keirf@google.com>
> 
> For the host stage-2 that is idmap, we can avoid lazy-mapping on block
> splitting by propagate existing valid mappings to neighbouring entries
> of the new table.
> 
> Co-developed-by: Quentin Perret <qperret@google.com>

I believe the co-author also needs a Signed-off-by line.

Thanks,
Wei-Lin Chang

> Signed-off-by: Keir Fraser <keirf@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd..34f78a58cded 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1030,10 +1030,39 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
>  	return 0;
>  }
>  

[...]

