Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB71CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONCcGd6ZlJNr1bN8d4F4ClrTccrd587NfTSM5w0oxJM=; b=GASjNRF08JRVy6Z8EOe9XhXmVa
	QimVkn4v+Z6YLRT5lFrkxKuiVIiv6qkgOJ7lDrBYxOtcszgeCgXAZyOqd1NSJu7da4hCRI8N+lSkX
	dlKdEwj8an9DE3+wBmWrDkdQBf68Km0SGvGXxjXOkUEyZJvuU9veXfi14G/IKIb0Hh7RXmdl7WC6I
	VT3dZVzNj6XRXAPYnv/ZUGM6DZTfdv4omhk7XADnVsIY3B18O/pQJGXaD3jd62HRy8qUL/HtqXDdx
	6GD0D66Xcc1eybLWUMGAswWgzEWuJ1OLtdIw78gtyQTq54SMd3EgitIr2stMKR5RiQEiMoaR7NsRD
	3LXPJaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Dp-0000000B9A1-2qUt;
	Fri, 26 Jun 2026 10:55:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Do-0000000B99Z-0y8n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:55:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A83E4600AE;
	Fri, 26 Jun 2026 10:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890841F000E9;
	Fri, 26 Jun 2026 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782471343;
	bh=ONCcGd6ZlJNr1bN8d4F4ClrTccrd587NfTSM5w0oxJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfyLggfPWAdZWacvjfH8rboMlo1IOYnUIXJA0CoLhVw8dMs6+XPDJsUya1SuQadkN
	 rd4VbdIu6cux/zcXSwlNQ6ILwpmJBcPGtlFQKQdqlKMTOni2smREFTzZePYyAiWv0U
	 zrUOa7PsjZxVkqKV51z0na/Tok1fOawfiKmtwwDsWfZyzT5L5ZOy2zYdK/qDrLZCBm
	 pxz+qqpHJaTnNLd6pfYFGYFNssuvOGECgtAErECjFZA9ZAoKhwnBHqZfcYZB42GL7m
	 AX9T5VE1Dhi49gAsNLyfcMU0D6JQIF2ufuw1Gx/aBrAZKROWmGQjcqr87As5g1GehW
	 EWktfONzWNYvQ==
Date: Fri, 26 Jun 2026 11:55:36 +0100
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
Message-ID: <aj5aqMyLGWw1IMAJ@willie-the-truck>
References: <20260626074545.433234-1-sebastianene@google.com>
 <20260626074545.433234-8-sebastianene@google.com>
 <aj5CMsyQ25xuxISV@willie-the-truck>
 <aj5FZBO7FJ4r219O@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj5FZBO7FJ4r219O@google.com>
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

On Fri, Jun 26, 2026 at 09:24:52AM +0000, Sebastian Ene wrote:
> On Fri, Jun 26, 2026 at 10:11:14AM +0100, Will Deacon wrote:
> > On Fri, Jun 26, 2026 at 07:45:45AM +0000, Sebastian Ene wrote:
> > > Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> > > arguments checking when the hypervisor acts as a relayer between the
> > > host and Trustzone.
> > > 
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 96 ++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 95 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > index 712811e89435..bd50ddc5b61c 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > @@ -74,6 +74,21 @@ static u32 hyp_ffa_version;
> > >  static bool has_version_negotiated;
> > >  static hyp_spinlock_t version_lock;
> > >  
> > > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > > +{
> > > +	DECLARE_REG(u32, func_id, ctxt, 0);
> > > +	int reg, end_reg = 7;
> > > +
> > > +	if (FFA_MINOR_VERSION(hyp_ffa_version) >= 2)
> > > +		end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;
> > 
> > This looks like an accident waiting to happen if we don't check the major
> > number as well.
> > 
> > I think you should just check:
> > 
> > 	if (hyp_ffa_version >= FFA_VERSION_1_2)
> > 
> > instead.
> > 
> > You should also add a comment.
> 
> We restrict hyp_ffa_version major to 1.0 here
> https://elixir.bootlin.com/linux/v7.1.1/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L962
> but since this is an easy fix I will include it.

Thanks, Seb. I'm just certain that if/when we update that check, we'll
forget to update this bit at the same time (I know I would!). So doing
it now is the simplest thing.

With that change:

Acked-by: Will Deacon <will@kernel.org>

Will

