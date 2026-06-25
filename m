Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0541CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyakJI5GD+PPIi44Smd0pGSoFVHMmc9YUMca9wIzM/Q=; b=x1XAdmJ8Cb5B7HABuke//W8ZKg
	yKrvh0tMO4ozayd+DwGDBxYYxhmSxYEYrZ1LiSIccsj6XSjl3xf6cgdpLK5ftwnbdMFs1juN9J4CN
	AixAHyPNqOjyoK8Caic87KI4JwFlwy3ZoWadHA7H2P3jmzEJmwlbQon9cVxngq+Kg03V60AN7D0xt
	TfpY7JXQpaQMR32Oay0A36QH/1E7FDtT4YmccuqTnNNIARn6wG5Ly2fH8bSulyeY96yqvsdUQKpcO
	17BbtwP2lE7JX5AKpWSnW/bNv6x6r3RF2t94pgM9NGSSklKT9L4iu+CpwL3zds+0gn2z+Hv8LSREs
	prZ865ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjwn-00000009ETm-0SAh;
	Thu, 25 Jun 2026 13:16:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjwl-00000009ETW-0xCn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 13:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BBE843CFC;
	Thu, 25 Jun 2026 13:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BFD1F000E9;
	Thu, 25 Jun 2026 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782393406;
	bh=zyakJI5GD+PPIi44Smd0pGSoFVHMmc9YUMca9wIzM/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V7RNqNMtT8EQbl8j+mRtB5l3CkkFA8q8eOgYGPMBzwPHRtjhPy+Qwsk2m+rqWkrPq
	 iWQPr1L5YtnwkHmC7gUyUUIcQ3j9m+4DrqD62tOxbXA5j8kc75G56f1q84kfIsoB4E
	 LF+M2nGWlSOge7hXVNobOpw9S7KSCZ67i6c38EjryAbDGHgBVtHTM16eT27NAypvm7
	 HqcWL+hf6ZwajOgUBiy0KDluFFEQYUeSAGvekRvwDbjMrG0b6RKr8VlH+o5Btoyh85
	 pv0jGp9g6o9nNvSDUYQmf03mMdKYnugjiZvA8VnHwh+mwks4Z25LYWQC/PZ1teCmBk
	 NXx5wLl6LtSKg==
Date: Thu, 25 Jun 2026 14:16:40 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v5 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <aj0qOFO3pRA-U_mL@willie-the-truck>
References: <20260623115354.632361-1-sebastianene@google.com>
 <20260623115354.632361-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623115354.632361-2-sebastianene@google.com>
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

Hi all,

On Tue, Jun 23, 2026 at 11:53:48AM +0000, Sebastian Ene wrote:
> Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> arguments checking when the hypervisor acts as a relayer between the
> host and Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 54 +++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..78bb043b33ee 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,20 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> +{
> +	DECLARE_REG(u32, func_id, ctxt, 0);
> +	int reg, end_reg;
> +
> +	end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;
> +	for (reg = first_reg; reg <= end_reg; reg++) {
> +		if (cpu_reg(ctxt, reg))
> +			return true;
> +	}
> +
> +	return false;
> +}

Seb and I tried taking this for a spin on some Android devices and, sadly,
it leads to fireworks. The reason is that the FF-A spec quietly changed
the list of unused parameter registers for 64-bit SMCs from v1.1 to v1.2
of the spec so that pre-existing calls were affected.

For example, in v1.1 a 64-bit RXTX_MAP only has x4-x7 as MBZ, whereas in
v1.2 the same call has x4-x17 as SBZ.

We can follow the spec by predicating the additional check on the FF-A
version being >= 1.2, but I'm not hopeful that existing drivers are
compliant. I also suggest moving this patch to the end of the series in
case we need to revert it.

Cheers,

Will

