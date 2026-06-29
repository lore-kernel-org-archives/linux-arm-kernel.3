Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094ACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6bK/PN6A/7QZziIgNdwB0ThmToPDxMxFw3ywyUt3A8=; b=F45nveJPmT/MD4Rxyni9twKlzz
	9dGVVkMC9662mdn69hGDG2zI5BRfKIjDYPH37w8tZ7eUzcmqrV/s0TGzReiVPg0FIX+dLKzvRvnqd
	o2u5n2bkBefWByVGoZiTD4I3gqgOHlFCED3DFGCx3yNqZVBC/h/jRjFAWR3PBVES9fUoW+icGTdz5
	YaSqKLzrbO8dEk+jZOQHH9tPaAk985sSRzrDHVlQjGMIYMEVWEjZF3O36c68KtfZOeaBsbkn4wDK5
	nbMzZ36a/o1DdAGZsIq3UWzXVcLVTAXTgjrBFPViVgV5kwcKFdgPuhv/jp17av4Yo5b2lw2gSZaB+
	To1W0zJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCnY-0000000ErIT-398i;
	Mon, 29 Jun 2026 14:17:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCnX-0000000ErIC-2ZWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 067C24137F;
	Mon, 29 Jun 2026 14:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1961E1F000E9;
	Mon, 29 Jun 2026 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782742638;
	bh=S6bK/PN6A/7QZziIgNdwB0ThmToPDxMxFw3ywyUt3A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g17YYQ9pShtzfDZmFAtSORwWhh7WRru09j5kEv143sgw1CPB709Xa8Pg9UA/LG6sL
	 XMpq93KvOEctM9jhvR7f66zxvwTD398LBH8CcoL8ig5FR6igJbFYFNawq9Er1nGV6M
	 br0hRKbVV7WEWXphm1TsfXvDOz1kOSp7zNY8fF/UgP+jvlPD4SvWInKvwzB0F6kzlA
	 BPZ2hTfqE73zf/nEnMCZP7ltT/Ks+rDqEaRbupe5upQb1/5ZNWm8602zIpbJZc27yV
	 FoBoK0H2gHY9vgsfc6bWIVyx+Wc16Y3P926JTUs0L72tEAQLMiAibYjW6Plzcnqr3E
	 Iil0vBwYg8HUg==
Date: Mon, 29 Jun 2026 15:17:12 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v7 7/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <akJ-aNK7yWTI__RE@willie-the-truck>
References: <20260629093558.2425257-1-sebastianene@google.com>
 <20260629093558.2425257-8-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629093558.2425257-8-sebastianene@google.com>
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

On Mon, Jun 29, 2026 at 09:35:58AM +0000, Sebastian Ene wrote:
> Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> arguments checking when the hypervisor acts as a relayer between the
> host and Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Acked-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 96 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 712811e89435..334f8a28d942 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -74,6 +74,21 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> +{
> +	DECLARE_REG(u32, func_id, ctxt, 0);
> +	int reg, end_reg = 7;
> +
> +	if (hyp_ffa_version >= FFA_VERSION_1_2 && ARM_SMCCC_IS_64(func_id))
> +		end_reg = 17;

Sashiko gets angry about this check, but I don't think we need to change
anything. Yes, there is a data race on hyp_ffa_version if you issue
FFA_VERSION concurrently with itself, but FFA_VERSION is a 32-bit call
so it's all moot.

In fact, a 64-bit FFA_VERSION would be problematic for other reasons,
because a single (non-racy) CPU trying to attempt a version downgrade
could end up passing non-zero values in registers that SBZ in the running
version (of which it knows nothing about).

So my Ack stands.

Will

