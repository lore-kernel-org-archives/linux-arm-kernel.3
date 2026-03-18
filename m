Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1607FCD0A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdvmO0cOUOqBBEEmENufgIzZoifolXGZTk0cz5OyQMw=; b=y4odQLdMj3XA/lxDN1OlOHxxSB
	wFWRmGvTtiGvfWdqW2vJzHoxEgEh/gmowRQEtHHuq6+ZodJBzuDX2ho8YVjQumKTMhqN+cLKVkzio
	LpNXrC5w/9dF5D36xxRg+eNOE4dQ8pflIMxk63w1MroH2QPCwb1qgflYV0ET77VZrpTTIG+q8sA1I
	rQXYXht6sZ0cxMrh2TCMcSYZ4g9kIETwJGHKBaNo87ztxcsfw6+FUprCt4LkVg5jVakChaQYPQ+B/
	/VxsDiJbgYsRZwnMYH5GYXwgAotdIyrvCCVdnlGPqoizisPIUVESL3vZVcOVLj8FlwNUuAJLZvgCX
	n9mgiGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uy4-000000096tE-3NmW;
	Wed, 18 Mar 2026 17:46:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uy3-000000096t7-2Rlg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D325560132;
	Wed, 18 Mar 2026 17:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251F2C2BCB0;
	Wed, 18 Mar 2026 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855962;
	bh=MOvYZ+RP0OfudcUMaKcfufnIX4ujNiNNOumMn0yDLZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nw6fvwjChuu9h9boR8PWVh8oMq3fNZcpVkGAlB6dnRfDYzkTvYVG6QvmqH528lQQB
	 RFwUl9kDYy8+tzI9GZECHOISPPFPxRdd5DvWxwZPoLGh2HlEcarnpbWrzYcGiRuOKs
	 LTquVZZ6vUqYSlHPzb70eN4o2AOh4rv5hTUI/d2hDQ1YiitHyF+G72jmO+hmfvQW4h
	 WEy1nrxrFQla4YrXfoYzS+DnnHtq8u7i+GHUtRzIzAdJVnN/OjUF+2oO146+nQ/l/T
	 qR+Igk1X2rJhqEcKzitkvzrP9n6xCtK5W03QpDFHd1OUxpx5lxqdzD1KOqRCNgV+FG
	 b4DlKGmx+TPIQ==
Date: Wed, 18 Mar 2026 17:46:14 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 10/30] KVM: arm64: Rename sve_state_reg_region
Message-ID: <20260318174614.GH2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-10-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-10-43f7683a0fb7@kernel.org>
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

On Fri, Mar 06, 2026 at 05:01:02PM +0000, Mark Brown wrote:
> As for SVE we will need to pull parts of dynamically sized registers out of
> a block of memory for SME so we will use a similar code pattern for this.
> Rename the current struct sve_state_reg_region in preparation for this.
> 
> No functional change.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
>  arch/arm64/kvm/guest.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index d15aa2da1891..8c3405b5d7b1 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -404,9 +404,9 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   */
>  #define vcpu_sve_slices(vcpu) 1
>  
> -/* Bounds of a single SVE register slice within vcpu->arch.sve_state */
> -struct sve_state_reg_region {
> -	unsigned int koffset;	/* offset into sve_state in kernel memory */
> +/* Bounds of a single register slice within vcpu->arch.s[mv]e_state */
> +struct vec_state_reg_region {
> +	unsigned int koffset;	/* offset into s[mv]e_state in kernel memory */
>  	unsigned int klen;	/* length in kernel memory */
>  	unsigned int upad;	/* extra trailing padding in user memory */
>  };
> @@ -415,7 +415,7 @@ struct sve_state_reg_region {
>   * Validate SVE register ID and get sanitised bounds for user/kernel SVE
>   * register copy
>   */
> -static int sve_reg_to_region(struct sve_state_reg_region *region,
> +static int sve_reg_to_region(struct vec_state_reg_region *region,
>  			     struct kvm_vcpu *vcpu,
>  			     const struct kvm_one_reg *reg)
>  {
> @@ -485,7 +485,7 @@ static int sve_reg_to_region(struct sve_state_reg_region *region,
>  static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>  	int ret;
> -	struct sve_state_reg_region region;
> +	struct vec_state_reg_region region;
>  	char __user *uptr = (char __user *)reg->addr;
>  
>  	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
> @@ -511,7 +511,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>  	int ret;
> -	struct sve_state_reg_region region;
> +	struct vec_state_reg_region region;
>  	const char __user *uptr = (const char __user *)reg->addr;
>  
>  	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
> 
> -- 
> 2.47.3
> 
> 

