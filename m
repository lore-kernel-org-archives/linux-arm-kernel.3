Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9A4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeZJskDrLdyI31cFaw160l4iI66D6Vs9RjJCvNrmuS0=; b=PuImWFEfjF20qvGEX/q9JOSuCI
	DSJdQ7b+Ij5mZLq/Q1+3UOccd+9UiGRsuwzDmal22NER4Fvhbb76olJkX+gfnh4nR1eIwj0Lr/+nq
	gsaIWoLy+XYnTV42prczoVmJpBOZa2K8uoIRrH0QaxUw9oQK4tcBvO4aQH60hocI/7HPYps8gJvc9
	uNvQbeuYx99vVTTCK3yoJhqVscnQcziqMjIMkUMT0GZcXSgma06I6f0avFQ7HseVESu6Iim2rhLXU
	hHyBMxjgjoM5EhmQBXF0Jr/Oj6hFqzK331NBJYK6rOwsxlazCleyxPZfgHl0H1qRpA5m60wUINsjh
	hHzN+HMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBgi-0000000BirP-0QfB;
	Fri, 12 Sep 2025 21:52:12 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBgg-0000000Bipe-0Hey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 21:52:11 +0000
Date: Fri, 12 Sep 2025 14:51:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757713924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KeZJskDrLdyI31cFaw160l4iI66D6Vs9RjJCvNrmuS0=;
	b=RBdbbhgjcHEyfj2dOzPwo9K7/WXxmFcSrY5PcSj9ybaMhFFXF4ySWXr2Xfqd3wqlxQDaA9
	ZwlGCinuMV3u8Hu53xZR/N5pdVHx9aqpV1aJoKSTT00Rug9BB7k1PldTYm66ontUvmhLUG
	MRPF9Ff8BZvypxYSFejo8gfph6/R7Dg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: yuzenghui@huawei.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v3 1/2] KVM: arm64: Make ID_AA64MMFR1_EL1.{HCX, TWED}
 writable from userspace
Message-ID: <aMSV_tLO-W4VKYRX@linux.dev>
References: <20250911114621.3724469-1-yangjinqian1@huawei.com>
 <20250911114621.3724469-2-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911114621.3724469-2-yangjinqian1@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_145210_256167_B9961DA7 
X-CRM114-Status: GOOD (  24.08  )
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

Hi Jinqian,

On Thu, Sep 11, 2025 at 07:46:20PM +0800, Jinqian Yang wrote:
> Allow userspace to downgrade {HCX, TWED} in ID_AA64MMFR1_EL1. Userspace can
> only change the value from high to low.
> 
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 82ffb3b3b3cf..db49beb8804e 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3002,8 +3002,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  				      ~(ID_AA64MMFR0_EL1_RES0 |
>  					ID_AA64MMFR0_EL1_ASIDBITS)),
>  	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
> -					ID_AA64MMFR1_EL1_HCX |
> -					ID_AA64MMFR1_EL1_TWED |
>  					ID_AA64MMFR1_EL1_XNX |
>  					ID_AA64MMFR1_EL1_VH |
>  					ID_AA64MMFR1_EL1_VMIDBits)),

I still have a bone to pick with Marc regarding the NV implications of
this :) Attaching conversation below. Although for non-nested this LGTM.

On Tue, Sep 09, 2025 at 11:10:28AM +0100, Marc Zyngier wrote:
> My concern here is the transitive implications of FEAT_HCX being
> disabled: a quick look shows about 20 features that depend on
> FEAT_HCX, and we don't really track this. I can probably generate the
> dependency graph, but that's not going to be small. Or very useful.
>
> However, we should be able to let FEAT_HCX being disabled without
> problem if the downgrading is limited to non-EL2 VMs. Same thing for
> FEAT_VHE.
>
> What do you think?

So I'm a bit worried about making fields sometimes-writable, it creates
a very confusing UAPI behavior. On top of that, our writable masks are
currently static.

What if we treat the entire register as RES0 in this case? It seems to
be consistent with all the underlying bits / features being NI. A
mis-described VM isn't long for this world anyway (e.g. FEAT_SCTLR2 && !FEAT_HCX)
and in that case I'd prefer an approach that keeps the KVM code as
simple as possible.

We do, after all, expect some level of sanity from userspace of feature
dependencies as we do not enforce the dependency graph at the moment.
Hell, this could be useful for someone cross-migrating a nested VM from
a machine w/o FEAT_HCX to one that has it.


Thanks,
Oliver

