Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBHDYTHQuD+7hDiMCy60LWuK31N8uebgNh3zqIFzM+s=; b=rpzoc8hTkgqxhGsuk4AJpaO9Lg
	otN7gGO7hC/sFQ5HYl9aMJr7b5t/UMSma3IOmYkQa/JVLRMAMqwY5QFTBsNSsvq6aagM2ORGdsDfs
	dHpcL2JDK/KU+3TtE6OYnfRXrSQg3UXx5yHv7piBFQaD/2wkN8wyJp2zw2QmjfwSaHtr1pArDb7CD
	Z144RDG7NEy2w4eW1WEC3rRBkF1l2opk+oZPDgAbDy9IyfqWFjxs1fY28PxKJj0TzjoQSn116mvOi
	nhHpddU2/oCWbtYwKO8Cjq5TkhTfbTt/5gy8QktT4jq2dwoQnGHqz8vg4SSeI+Jc2qDRRLoYafUAH
	sbeHsmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEW7-000000014Tg-3z5p;
	Mon, 28 Sep 2026 16:47:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEW6-000000014TV-2e35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:47:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AE5340744;
	Mon, 28 Sep 2026 16:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B901F000FF;
	Mon, 28 Sep 2026 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614070;
	bh=bBHDYTHQuD+7hDiMCy60LWuK31N8uebgNh3zqIFzM+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCZ+hg67XzC2jBoGZl4v2d3k4A9DhpNvXtX3hMhlpjuq6qKiUPqSjlMgVgO1XwH6o
	 PSIszuGRmTWG2fuVfM/iqrvhzO93YywJ0VzwvxZXYrR40h0YyrSJhUPBwVIPqktQZG
	 +f9OWW2Zo8jahPDqDzpGtNkp8sg3jinGCF6rxX/fRN1E9CzaKJI4w6asKjgQ9C6jYp
	 rU5gdTMA0wo7ojyLC2wWubmtGOzmA+S7NtTbtkDLWG+ldnKUFhblUOv1UXNq+lN0Ug
	 gcLKGqbLWIJZdeR8Tgnr7n+3EdP5l8h0hBcnwhky1SpHbcf1YAH67E5GkZ47Uv/RHV
	 2ck0j1F6+yENA==
Date: Mon, 28 Sep 2026 09:47:48 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 04/10] KVM: arm64: nv: Return a failed stage-2
 descriptor read as a fault
Message-ID: <arqaNHGzVfMpVha5@kernel.org>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-5-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928152507.2116110-5-fuad.tabba@linux.dev>
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

On Mon, Sep 28, 2026 at 04:25:01PM +0100, Fuad Tabba wrote:
> When KVM walks an L1 guest's stage-2 tables and can't read a
> descriptor, for example because the guest points a table at an IPA with
> no memslot, it sets a synchronous external abort on the walk but
> returns the -EFAULT from kvm_read_guest(). As with an invalid
> VTCR_EL2, KVM then leaves AT S12E{0,1}{R,W} unretired, so the guest
> retries it forever. On an L2 abort, KVM injects the abort and
> returns -EFAULT from KVM_RUN.
> 
> Return 1, as the walk already does when it can't update a descriptor,
> leaving -EAGAIN from a descriptor race as its only negative return.
> The AT then retires with the external abort in PAR_EL1, which is what a
> stage-1 walk records for a descriptor it can't read.
> 
> Fixes: fd276e71d1e7b ("KVM: arm64: nv: Handle shadow stage 2 page faults")
> Fixes: 92c6443222ca4 ("KVM: arm64: Propagate PTW errors up to AT emulation")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index a67be19e73250..f9a2e50c0b567 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -304,7 +304,7 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
>  		ret = read_guest_s2_desc(vcpu, paddr, &desc, wi);
>  		if (ret < 0) {
>  			out->esr = ESR_ELx_FSC_SEA_TTW(level);
> -			return ret;
> +			return 1;

Hmm. Rather than fixing these things individually, I'd prefer aligning return
codes between the S1 and S2 walks. I agree with the approach; negative
return codes should be reserved for host-visible failure reasons whereas
everything guest visible gets communicated through s1_walk_result /
kvm_s2_trans.

Thanks,
Oliver

