Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A05CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+QYNntd07WS7zMODeQXAyVckwYY6XqiZdZf5eCLe8k=; b=HfAW8EJOSINaac8VXBSxCPdxci
	psh6Ida7CbnOhqgc9DIPOVnb6OP8WJs/8zM4ejvVTgZhA6LN9GHy8VZzrs49gwiakq89EwP+Itgm1
	eCRB/pvFh4dfWIPBpQYzU8lEEdVyWzv3mXwqYsCGA6pDxwd0vNtpPvhqFD7haWebpSdJeFvAEgLiF
	vcKz4yJbSt1u6W1nHFSPSNfimdKzx8oWlwMT+tmfiHnXo/zSLMeW6iiqOaX4MDMufOqUHo4BhSw79
	9m/F+32ZayLydxkqaSroUT3TfJKdniEZRCjXzlFqiumM4WTRK6HnMHMcJ8LR+vd1u3Kwd5mvUjZbY
	PYc+PPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGNr-000000099tx-0qrp;
	Thu, 01 Oct 2026 12:59:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGNp-000000099tq-2Xv2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:59:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 251F84042E;
	Thu,  1 Oct 2026 12:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E16D1F000FF;
	Thu,  1 Oct 2026 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859573;
	bh=2+QYNntd07WS7zMODeQXAyVckwYY6XqiZdZf5eCLe8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPtdhrZLZS6IvmpaxQATO4OuteyezqkuAoyWrhPye1VvQ14ST5gu9mgOvbSfuyjDB
	 UH5zO81vNqRp1IYbp/78IVOmIVhYhGjofsmECs5n3pQswCILJFth7eGwNr2SFudd5M
	 gjIMBBAVwxo2p/78Jx8e6Bc/NMHv1+T4HbnnepH/4JEYDkRt9zbbgHaX3BEjH9r6UZ
	 eWd9at+tcDUmTXy6Eab3A3eoxdNB1j8tsBDsDNVNV4bAFFr/NAvPoEKj2wn6e0xD6H
	 K7XhGzsB6JfvfamVI7Shh7EqDontlUArSPxlI9o7WYa4x+M74v8PZTTX+ASwIhEFty
	 t8/xTfDToBQ/w==
Date: Thu, 1 Oct 2026 13:59:27 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <ar5ZLxL6-mz98tpN@willie-the-truck>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113338.159227-11-fuad.tabba@linux.dev>
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

On Mon, Sep 14, 2026 at 12:33:30PM +0100, Fuad Tabba wrote:
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 855cb77c8bba1..d970cba12ca47 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>  
> +/*
> + * Reset the vCPU to its power-on state and commit ON_PENDING -> ON, on the
> + * target's own CPU. Returns -ECANCELED, with no side effects, if a rollback
> + * raced the reset.
> + */
> +int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct vcpu_reset_state *reset_state = &hyp_vcpu->vcpu.arch.reset_state;
> +	int prev;
> +
> +	/*
> +	 * Pairs with smp_store_release(&reset_state->reset, true) in
> +	 * pvm_psci_vcpu_on(). The acquire must precede the cmpxchg: reversed, a
> +	 * winning cmpxchg with a false acquire would leave power_state == ON
> +	 * with the reset skipped.
> +	 */
> +	if (!smp_load_acquire(&reset_state->reset))
> +		return -ECANCELED;
> +
> +	prev = cmpxchg_relaxed(&hyp_vcpu->power_state,
> +			       PSCI_0_2_AFFINITY_LEVEL_ON_PENDING,
> +			       PSCI_0_2_AFFINITY_LEVEL_ON);
> +	if (prev != PSCI_0_2_AFFINITY_LEVEL_ON_PENDING) {
> +		/* The only other writer of ON_PENDING is the rollback. */
> +		WARN_ON(prev != PSCI_0_2_AFFINITY_LEVEL_OFF);

If you go with the idea we're discussing later in the thread, then I think
you need to drop this WARN_ON() and the comment that goes with it.

Will

