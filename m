Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058210A88FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpIFiYycZKRZJx0smT8YS3xNMLz7hCECjJzZvJiQHXI=; b=tdX0WqKlJdRIv+H72vp3uRiUft
	SspCGecnHpOmR8xX+ffoYzJoKRP56wkIj739Csq0PGWqpl8n1NxDvP97/iDONSLBjPEKPwj+KxMl+
	GRE4imjDdBlv9ljf4i3QF0lMSDuK4KHgT6f8IxvKWXIuC9vIc7uuDFxBPp7lC9t6jYTUvI5kd9wXi
	KPTo92XOQTw53YBd5mkwJ/KWdk5XyMLg2SxUFI9KpG5cmmIhljdqybC/k+yPHr3hmN/7skEmJN5D+
	73002vWRNK7AkP10ELL4+O7MR8ZaztIFOLrMEQTnaWh3vxL592+AfPE9SRBDVMrHAErYbLJi+YLkW
	FgRXyM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pKd-000000061qF-1caA;
	Thu, 26 Mar 2026 18:21:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pKb-000000061pu-38VI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:21:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02306443DD;
	Thu, 26 Mar 2026 18:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1F6C116C6;
	Thu, 26 Mar 2026 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549280;
	bh=iUpkYvHbuGQP6Dw7lRN7ijRYKwL4SoItz2X0gx4MLnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0kplvyfivAHamFYFZxxfLFSvziykz+g1pxObnat8zxnPzTCgDAdRPCP+V1wa9KJn
	 2cGkRDmVZGww58rMsMNtXP5Fusw3j84nr1oenjeVIrQkPOuZO/wAZ8uiN0LLU17sNE
	 oO3G1jwYWQ66dzMdpDWWbq2NjWJMH9eDSPF/BQDOHTLK8mzEeJEykfOuDTVa3jREBn
	 K6Wkx5Ye62BD9jju3fw6HipLDbb1xkbM4bSlUmGfxNnjwuTHGAgqtWC5+mvxOVCn/p
	 zY/jFrqF/ZjQQiXpEOZvUJxjkhbg79Cc2Q/mTr6p23GkeXtVTGBPNliwuTliVKt9ud
	 xQIdHKzINpuJQ==
Date: Thu, 26 Mar 2026 18:21:15 +0000
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v3 3/3] KVM: arm64: Don't pass host_debug_state to BRBE
 world-switch routines
Message-ID: <acV5G3ntjXZKBGsm@willie-the-truck>
References: <20260326141214.18990-1-will@kernel.org>
 <20260326141214.18990-4-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326141214.18990-4-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_112121_813337_8AF2AB3C 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, Mar 26, 2026 at 02:12:13PM +0000, Will Deacon wrote:
> Now that the SPE and BRBE nVHE world-switch routines operate on the
> host_debug_state directly, tweak the BRBE code to do the same for
> consistency.
> 
> This is purely cosmetic.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 84bc80f4e36b..50413171bd1a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -156,9 +156,9 @@ static void __trace_switch_to_host(void)
>  			  *host_data_ptr(host_debug_state.trfcr_el1));
>  }
>  
> -static void __debug_save_brbe(u64 *brbcr_el1)
> +static void __debug_save_brbe(void)
>  {
> -	*brbcr_el1 = 0;
> +	u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);

Oh no, I've been sashiko'd!

The above is definitely not "purely cosmetic" and I should retain the
'*brbcr_el1 = 0; ' line.

Will

