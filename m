Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792EECDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pA6ANVNRahG4M8H0EzLwtjvJO6D9L1tq/SMvgZGvxjw=; b=VQAWbQyL5/4q4ljoblZNU3CnVx
	gC91zU29O17bhC+8L0gBdgrhNWNJ2vcU3g2eOMJfK1ggR0LVK3rnMr32pzQ3m9eNPEpo8WKHZedMK
	SujzAXt2a+dvmDKdrnHTqHqdxHaDuNRB3VdUZuq0++qP+uV3bzo20MqpdGv3bgmxx9WRMe1zqL0aU
	GOEKQfzE+JpcaflLlzLtg28X3tNdEwB8n/qvfcTrzBVBZXtKWHDedkg4G9+dGBm6hW7aR7xleNS6v
	XbX02hPUsw0aiUZxk22CmfsQavlUFc2V4bQouwakT/L4wDIARwqLRzbOMyP2FbUQ6MChNJzib8t4z
	/RdKrFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2aq-0000000AwdS-0paf;
	Fri, 26 Jun 2026 09:11:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2ao-0000000AwdL-1DC6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:11:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10F2043772;
	Fri, 26 Jun 2026 09:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673391F000E9;
	Fri, 26 Jun 2026 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782465081;
	bh=pA6ANVNRahG4M8H0EzLwtjvJO6D9L1tq/SMvgZGvxjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fo5SDURMny5tovLJ1rjldIVlET7xcvGvD4yNr1ZArm65N5c4bcLN9MuYIYUzKKxDg
	 WkrPAptCQuxPji4utdJ4ANcP5SXh/pCB3DdgafbulfuT/eAddupZrIUE2flc2wrTlz
	 Pz9ru7Vn0qhdagu225b7bqXu9cJWz9Dfhtlu9MWuXlzUsageN396y4CMsOyGUgAgum
	 FD7hBS69whCDqntzsy4QcWAqwd1k75rDkra4g4dQ/P5NHegV/z58HU4O4TgVUwlGwz
	 WFojdZ4MoB7DlDmsAQ0pmwfaJS18yHFnUxAunR93dSAMgcbpUoQmvv4wOPBZmSsuR3
	 /1jbGUnYvVVNQ==
Date: Fri, 26 Jun 2026 10:11:14 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v6 7/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <aj5CMsyQ25xuxISV@willie-the-truck>
References: <20260626074545.433234-1-sebastianene@google.com>
 <20260626074545.433234-8-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626074545.433234-8-sebastianene@google.com>
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

On Fri, Jun 26, 2026 at 07:45:45AM +0000, Sebastian Ene wrote:
> Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> arguments checking when the hypervisor acts as a relayer between the
> host and Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 96 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 712811e89435..bd50ddc5b61c 100644
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
> +	if (FFA_MINOR_VERSION(hyp_ffa_version) >= 2)
> +		end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;

This looks like an accident waiting to happen if we don't check the major
number as well.

I think you should just check:

	if (hyp_ffa_version >= FFA_VERSION_1_2)

instead.

You should also add a comment.

Will

