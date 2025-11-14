Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D4FCE8D54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgj9CxrHwYCw1CKORWnO6T5T4vh7qxrQUOJpbT2xpAo=; b=no6PFDpjiRPDJ3ruTQ7FpBVP+X
	VTzH7+pMkyudloxLjqHYSsCt+b61qUAHYraR2saAjc1I+iPH831KsT2rKbMqoBMvxG/XfRfYd1oox
	xFmx0A4aA1KPoBPNNaQrfqQls+bJ3otVd9kZRZlzCsjxid5mbirqxPXRqaNDRnuPcHYQKeWv6CFJM
	OEAbxjA0XW4Lw/bnIEzzCLzbL2QAQuT5oePrJuyGswduaJoSDlIkwuXQJAvuA9jwKiMT42yeOU+4o
	+NJEr4JwcMo5YKzCo0ssDZMFtJsaOET3ByCwUneux0zhVCZY8vVoulvCbwQs4eIFT9n7xHeZPbpU4
	ha8WVdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwbe-0000000CjoP-45da;
	Fri, 14 Nov 2025 16:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwbd-0000000Cjnl-0Qfs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 976964453D;
	Fri, 14 Nov 2025 16:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA69C4CEF5;
	Fri, 14 Nov 2025 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763137499;
	bh=9ADDlwiObOzy6aRdDxf35MgMRl6YQt/8mloSpSA44HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5mJIe1DWlBXSMgELsnOTYDVlb5JEtqKs3y0KjBE5zQgrbn7GM0bSKHJ7mXten+WS
	 ZZthJR6fmmcDceL3yMb1Yc0iMdf6N2HCQvJZPK75slYDXD2spgYkkCTnWNc7cbClDS
	 VKM2/2f0Ji8KcB/cce0d65t0G0A8IG35ced5I3aq5WvU0vwdU17xrxJffNdAYaYlzm
	 HEQkSM+EdT9qumGnQLZxmCeotn8GAltCR31E3I0TOpJs31J1hyksakve3zuoAACkl1
	 SPwLSaNbORtMZu2+IDPWja5nvV+RrrthXZBBM2TKomzmEJeEMBFSy1SJrFBOCoxYIV
	 F0yUmTwUjMfgw==
Date: Fri, 14 Nov 2025 16:24:53 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, perlarsen@google.com, ayrton@google.com,
	ben.horgan@arm.com, sudeep.holla@arm.com, stuart.yoder@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: fix FF-A call failure when ff-a
 driver is built-in
Message-ID: <aRdX1YM0Y8WMP05w@willie-the-truck>
References: <20251030102245.2313898-1-yeoreum.yun@arm.com>
 <20251030102245.2313898-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251030102245.2313898-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_082501_182144_0561FE44 
X-CRM114-Status: GOOD (  24.20  )
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

On Thu, Oct 30, 2025 at 10:22:44AM +0000, Yeoreum Yun wrote:
> Until has_version_negotiated is set to true,
> all FF-A function calls fail except FFA_VERSION.
> The has_version_negotiated flag is set to true when
> the first FFA_VERSION call is made after init_hyp_mode().
> 
> This works fine when the FF-A driver is built as a module,
> since ffa_init() is invoked after kvm_arm_init(), allowing do_ffa_version()
> to set has_version_negotiated to true.
> 
> However, when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y),
> all FF-A calls fail. This happens because ffa_init() runs before
> kvm_arm_init() — the init level of ffa_init() is rootfs_initcall.
> As a result, the hypervisor cannot set has_version_negotiated,
> since the FFA_VERSION call made in ffa_init() does not trap to the hypervisor
> (HCR_EL2.TSC is cleared before kvm_arm_init()).
> 
> Consequently, this causes failures when using EFI variable services
> with secure partitions that rely on FFA_SEND_DIRECT_MSG.
> 
> To fix this, call hyp_ffa_post_init() and set has_version_negotiated
> during hyp_ffa_init() when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y).
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 4e16f9b96f63..0ae87ff61758 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -984,5 +984,17 @@ int hyp_ffa_init(void *pages)
>  	};
>  
>  	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
> +
> +	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT)) {
> +		hyp_spin_lock(&version_lock);
> +		if (hyp_ffa_post_init()) {
> +			hyp_spin_unlock(&version_lock);
> +			return -EOPNOTSUPP;
> +		}
> +
> +		smp_store_release(&has_version_negotiated, true);
> +		hyp_spin_unlock(&version_lock);
> +	}
> +

I don't think this is the right approach.

If the host starts using FF-A before pKVM has initialised, then we've
got bigger problems than the version because we have no way of knowing
which pages have been shared with TZ before we initialised.

Why can't FFA defer initialisation until after the proxy has initialised
when pKVM is enabled? The fact that the driver is modular indicates that
this should be do-able.

Will

