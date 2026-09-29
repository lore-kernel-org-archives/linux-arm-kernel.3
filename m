Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B6FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCkJjBBff/AJibyur95WsljmL9G7qJJd4uMEIUoBaII=; b=olnM+oal/bVQ+FZLP7zsRvQ0zU
	wiF3KR1UxSC6kfrLVhr0mfsUcXzH+74+WGz459Sl8tNXsKIHViNi6ABDPB3EmyMmKXTv/LcO7bzo3
	qSRaCWgRPoH0aK+b6mbUtu2QLyI9F6fe3Vdodz2moJArwGknUOp2AomfGX7u67PGMDobqeBI1V/RK
	l87YLxZslJzr2nrRQpqESqEqZExINMhPpv45VA6Y3dQsuv0pNNZxoDz2Ic3vsgshT5k4XzKpxRgEj
	DrQXW3PAe0/XL+WCP1UgR35ez8fXrGB9+QTPmeZf0VKGNY/tsJyFVu7EDKWIOZHNOF+OUoYNvvipU
	FLzwyCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXMw-00000003bGW-3nA4;
	Tue, 29 Sep 2026 12:55:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXMv-00000003bGN-1fIV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:55:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DEE6600D1;
	Tue, 29 Sep 2026 12:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE951F000FF;
	Tue, 29 Sep 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686535;
	bh=gCkJjBBff/AJibyur95WsljmL9G7qJJd4uMEIUoBaII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0IrFkyEUym09hmYERwCoeXE5FV+rViVAoFgvgV/1Z7djCEdl0r14IYM7huhcz/mc
	 UXeYWz/TWgjulH1qt2vR8LzeT+VYQxWvIRiazSBnnnCkMnzMkQU72ji4xB/bFZ2nwe
	 pB2bidGM0WdrtRQT15AhEkgJLz/H+7w2S/EojnaAInelokEKJct7M77W2Pq33/FVLq
	 8LsxVemswmK2xRwo8hYCF2kvXqmRFg5qPySS3OOOcNbQv4hRZSnRcsZHfeRsmXDHwC
	 /XGQKdl3JkNLiUzk8XKrAXQ92MqOS6F5A5ABGgFP492Y0QoLkpVVZr+r/fE/NFDpE+
	 RSAvWP5DxQPwQ==
Date: Tue, 29 Sep 2026 13:55:30 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/arm_arch_timer: Expose a
 direct accessor for the virtual counter
Message-ID: <aru1QvpaQ8A-OnQq@willie-the-truck>
References: <20260802165327.385217-1-maz@kernel.org>
 <20260802165327.385217-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802165327.385217-8-maz@kernel.org>
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

On Sun, Aug 02, 2026 at 05:53:26PM +0100, Marc Zyngier wrote:
> We allow access to the architected counter via arch_timer_read_counter().
> However, this accessor can either be the virtual or the physical
> view of the counter, depending on how the kernel has been booted.
> 
> At the same time, we have some architectural features (such as WFIT,
> WFET) that rely on the virtual counter, and nothing else.
> 
> If implementations were perfect, we'd rely on reading CNTVCT_EL0,
> and be done with it. However, we have a bunch of broken implementations
> in the wild, which rely on preemption being disabled and other
> costly workarounds.
> 
> In order to provide decent performance on non-broken HW while still
> supporting the legacy horrors, expose arch_timer_read_vcounter() as
> a new helper that hides this complexity. Obviously, this is simply
> a global alias of arch_counter_get_cntvct().
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/clocksource/arm_arch_timer.c | 2 ++
>  include/clocksource/arm_arch_timer.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index b3b31d4f4815f..9c7501ce57073 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -128,6 +128,8 @@ static notrace u64 arch_counter_get_cntvct(void)
>  	return __arch_counter_get_cntvct();
>  }
>  
> +u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));

nit: compiler-attributes.h provides __alias to make this a tiny bit cleaner.

That said, why did you decide on the alias rather than just having this
as a wrapper function?

Will

