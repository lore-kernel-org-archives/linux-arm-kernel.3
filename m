Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4603C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se0PI/BskJehrTSp/kAwz19cA4Xuimd8Lk9oU/vOpuk=; b=fr9kJ71r85qkf71p1VBcNHONHM
	sJcd342dD4p39U6Ks/hc9Qd/97Zzo8l+l51gvQc/Ap3yPiqVyIk+EzcUPRg5XSgaDkQaZYo9150dh
	24DpKMOaJmYeKO9bQ128ro81CilxewFdMHx+SOKOXNLkezoUU3VRZ4kyIZFas/7Dztdbsxcnv2Hqk
	jJ0DrBkPta1pmJSDvFxoiHRJsKKLdr2NmFeVRo8C9VquMAyq3+yGH3y+7FOVmpTcgQ3aTcqQABEzw
	irn+DjF4vVtgR8eePoTraLS9pHAJswBY7z712kK4LI4blRKONUySDSVy2d9O9dxYLEksgoiu6D0Wx
	W6/4Ybiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFSq-00000002aUE-3SQg;
	Mon, 03 Mar 2025 23:44:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFRG-00000002aMC-3qZe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 23:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22A58A44DE9;
	Mon,  3 Mar 2025 23:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B5BC4CEE8;
	Mon,  3 Mar 2025 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741045389;
	bh=a8a9IK/kNpa34r9G10IOTtk/N5+iTd8OkmB8cSTMxgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U18h4J6eHzdpV/lQruFiVfI0FCi9kpiJl21LupatW+d1VqZD4BijRx2feSVu4Pdg3
	 I1k6dRx8/BbjL8eOwBQkWbzkNdxB+nwD3qHtRNjhiTI1mS6wzdzppN5KN8CUXcWV5U
	 45xubGB5Zm0UtnScNszufU1Qn96OKzP8XYzPQVXopp+JVl1/+2iDJRL+g6Lzn8Dmc/
	 TnuQzfkJrNW/FuufAKgebUxjOol8dvfjv7U55kvM7WK3e8WI3QpQ8e5ZJGDMD8eq/K
	 2O7iDJ4TlE7KLPoZi7RPcuQtg/QjuJQ2d3ljc2+f/dqjwqDWxkR4iqLqm7T0SjINVq
	 imaYnUzij4rMw==
Date: Mon, 3 Mar 2025 23:43:03 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Map the hypervisor FF-A buffers on
 ffa init
Message-ID: <20250303234259.GA30749@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227181750.3606372-4-sebastianene@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_154311_021313_21E63DFF 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> Map the hypervisor's buffers irrespective to the host and return
> a linux error code from the FF-A error code on failure. Remove
> the unmap ff-a buffers calls from the hypervisor as it will
> never be called.
> Prevent the host from using FF-A directly with Trustzone
> if the hypervisor could not map its own buffers.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
>  1 file changed, 17 insertions(+), 29 deletions(-)

[...]

> @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
>  {
>  	struct arm_smccc_res res;
>  	void *tx, *rx;
> +	int ret;
>  
>  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
>  		return 0;
> @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
>  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
>  	};
>  
> +	/* Map our hypervisor buffers into the SPMD */
> +	ret = ffa_map_hyp_buffers();
> +	if (ret)
> +		return ret;

Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
the host to negotiate the version lazily?

Will

