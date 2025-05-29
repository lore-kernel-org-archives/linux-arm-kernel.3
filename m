Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB9BC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YL3cCrAmduC3pAr5lj+i53+3Rt7gqGymhRdZHiv1+0=; b=FxY7Hvj3B29ww3Lz6XJoXCQMy7
	2eN79cOeACV+INkX5AO9nJ1VCLucpS1jwxeGBqUK+Y46yoOZsc459DXLJjc2L4kbJgsww65pG3wxr
	Dq49lIxwj+vRFxIaqYG3nWzpNcw4baWq9wuxeRcu2LxNECfD2jHqUbdPyv+WxZGPXsnLGSjGMqejA
	KGPhy4lOqZNvtpZGkIJVLOZ9+Vg3A1DO5GIaHYlaEkipw47q9ShYcImMZG2d+nuLg0rdOiuN5qBqh
	KqqB6VQHxU13Yu+c/ZadfGBEGm9/MvMMfrwJC3iyTkcVRutmNqBuBDfFzm317A3uhE0XpD9QpDJCZ
	rHtVSCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKa3P-0000000FT49-0xDV;
	Thu, 29 May 2025 10:00:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZyT-0000000FScj-41G6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 609EE5C63BB;
	Thu, 29 May 2025 09:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3766CC4CEE7;
	Thu, 29 May 2025 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748512494;
	bh=p8bTd3R8QqEl2fi6VDqo5Vv2oBJDWSobyKoefPozxi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mm/BJaqT9j09R5484NuixQcFzKwi1VxzPF8w9ohL6UpDzW3Nuy9sNqoWYzQ+fBgJm
	 iPCQY/Zvtn/O307jaW7bu82luyPbql3adEAHxAcmR3gyff3tzx1ZiWDSbR7o3Lf3yP
	 LfuHyVnnmsJaGcbmwt1umAq5VWuqP/XsmaU+1n/byW7wrWzsYhCTUG59MuGI4Ij+7d
	 qHbku1cXZLvAOc5Rb91nYnQl167jvT62uTXHfU018CvB/kx/3WNekACdsG/jv+GUCr
	 WUGUf8vRR5M3ddJoNQCuki+aUz7NqQzAfKShJ6eteiUUVEA1x/M5+Eay/saQrZHx8w
	 g1uPc2PYWlAgQ==
Date: Thu, 29 May 2025 10:54:46 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, sebastianene@google.com,
	qperret@google.com, qwandor@google.com, arve@android.com,
	perl@immunant.com, lpieralisi@kernel.org, kernel-team@android.com,
	tabba@google.com, james.morse@arm.com, armellel@google.com,
	jean-philippe@linaro.org, ahomescu@google.com
Subject: Re: [PATCH v4 1/5] KVM: arm64: Restrict FF-A host version
 renegotiation
Message-ID: <20250529095446.GA29035@willie-the-truck>
References: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
 <20250516-virtio-msg-ffa-v4-1-580ee70e5081@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-virtio-msg-ffa-v4-1-580ee70e5081@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_025458_046262_E8CD86D2 
X-CRM114-Status: GOOD (  20.50  )
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

On Fri, May 16, 2025 at 12:14:00PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> Prevent the host from re-negotiating a lesser minor version with the
> hypervisor. Once the hypervisor negotiates a version, that should
> remain locked in. Fix the current behaviour by returning NOT_SUPPORTED
> to avoid the FF-A interoperability rules with lesser minor versions that
> allow the host version to downgrade.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 3369dd0c4009f84ad3cf9481c747bdc57a162370..2c199d40811efb5bfae199c4a67d8ae3d9307357 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -712,7 +712,10 @@ static void do_ffa_version(struct arm_smccc_res *res,
>  
>  	hyp_spin_lock(&version_lock);
>  	if (has_version_negotiated) {
> -		res->a0 = hyp_ffa_version;
> +		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
> +			res->a0 = FFA_RET_NOT_SUPPORTED;
> +		else
> +			res->a0 = hyp_ffa_version;
>  		goto unlock;
>  	}

I already Acked this one:

https://lore.kernel.org/all/20250513142113.GA9443@willie-the-truck/

So please add the tag to the patch if/when you post a new version of the
series without any changes to this patch.

For the bots:

Acked-by: Will Deacon <will@kernel.org>

Will

