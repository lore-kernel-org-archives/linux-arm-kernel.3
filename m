Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE63C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13Lc63hGPrqKDFv0C7nKqUdQv5N1T5qxtfFNzi/6oZ4=; b=OVnZg+26X7kq2KV+/6OGQopmY7
	uOhlzSAYThEhunec/ElcOkv2fQEl7isV+NVRvkf/pu5w+rP85SGuGKDN/+a2RaVqhZj8kZpb0Bprd
	gl6ZkuW0bNDF9mM74fXgtGYaO0gvOONluUzMTJsPMHT4yjZPhVYS4rRqlMUBm8/LMhmmlxhPy4HoZ
	NPE8KE4E0Diu4MhwahLTB+nWc8Q1wmKaaM8umh+uU8JwuMo3xFtj1VKSV5ZVe+tr02rdmWs7wmsGl
	ITX09IfIb0PuSoBjeVUyB2tRqMNec3DxBcwekIz/kdd7RhvIQdLApOYOxrScZJdCYYnwJthHHb+na
	sgnLWW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqXc-0000000CbDB-0V2l;
	Tue, 13 May 2025 14:23:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqVW-0000000Cb67-27oi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14FF15C6A3E;
	Tue, 13 May 2025 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E6DC4CEE4;
	Tue, 13 May 2025 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747146081;
	bh=CleVcc0og0R0I/ZNcQtinsoFZO2oVo5dhJzV7xbtVzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnGZLGeoK7Asc4TqW1psqQgBMl7gMhbYoPXdf13r4wAcr5iwDyza+oM8gGEWjCG7/
	 6AUW7ZVViM66GigZ0bW/6cXOkAGlciAU7nOYc/7zPdsIhLWPUuI5ATPzc2T54t1Ntb
	 y/qzUPfVS+MTEb4D/99nupsyCP/Ha/nR1Psa8tt0TtXgSm5z0NTsomBdyiOQxWTa2u
	 tOToARSU0tyPYT4zBADk5M8hPI8wXMfD53f4Hcq8PI8VHZ3bh7hMM+ziaiR0l1cLgY
	 Kwm6WSar34DsACq+28Mo5jLyQEhN07TLy8pBoTpIaK2azW/P9A8f2bzIgKNi8kO7mG
	 +76T5BeW7NvIw==
Date: Tue, 13 May 2025 15:21:14 +0100
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
	lpieralisi@kernel.org, arve@android.com, qwandor@google.com,
	kernel-team@android.com, armellel@google.com, perl@immunant.com,
	jean-philippe@linaro.org, ahomescu@google.com, tabba@google.com,
	qperret@google.com, james.morse@arm.com
Subject: Re: [PATCH v3 1/3] KVM: arm64: Restrict FF-A host version
 renegotiation
Message-ID: <20250513142113.GA9443@willie-the-truck>
References: <20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com>
 <20250513-virtio-msg-ffa-v3-1-d66c76ff1b2c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-virtio-msg-ffa-v3-1-d66c76ff1b2c@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072122_589360_13C3CE91 
X-CRM114-Status: GOOD (  18.88  )
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

On Tue, May 13, 2025 at 06:28:30AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> Prevent the host from re-negotiating a lesser minor version with the
> hypervisor. Once the hypervisor negotiates a version, that should
> remain locked in. Fix the current behaviour by returning NOT_SUPPORTED
> to avoid the FF-A interoperability rules with lesser minor versions that
> allow the host version to downgrade.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>

I'm not entirely sure why we need two SoB lines here...

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

... but the patch looks fine to me.

Acked-by: Will Deacon <will@kernel.org>

Will

