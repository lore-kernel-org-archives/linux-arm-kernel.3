Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2155C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3ZHgVGIk48paRdnp42FKFdF4gsFUlRMB3lF0NpOMwI=; b=sbjB21VoPdy/yLh1GJ2fQUWonF
	rpjJCvGVxv7cjG68+8gkC18ldVytZPFGiuhd7SIQcuJWKKtFBr4ny3CxHSQQDrn4hd0xR6j4F4iPH
	fg+zfm6vduJwWMRjoL7fBc7zAXPKxjqPy+r3fLdoKFq7POsWNbqxYgCOPqV8tGg/AUFbLwLDmZJXc
	7HFio22jMPu62NQ4l1Oud+f74injAdbSNg9C956tgDa3nf0TAbxCnF7mrhYVbI8TN4TtgQfYa5OaL
	xN+7PYTBG5taQWC8wPzTbZXs2H8A+I8tDQwrsKU+4FMmnvRoFtezDJZp/lu8NtiNA7gtRxiMkKcEh
	OCSKmpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmtp-0000000HEWW-39rD;
	Tue, 29 Jul 2025 16:09:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmXh-0000000HB32-1X3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09FEC4564C;
	Tue, 29 Jul 2025 15:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECC5C4CEEF;
	Tue, 29 Jul 2025 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753804024;
	bh=asf759iARhCsqlW3LV9P1RiiwlEqeEAcEfX9/r8vZSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2DgZaQS6K3Vd6+mPAu9iGvuNRMCHZcr9QOs7zi3mtZ/f8s1gvwO0vy1CDZDba40p
	 FDUoNHvYXjZNzwchfQuacmVUX75jrVU6vkEndnGuv0bhr8/y55eJXEdvkQQdFqJYcJ
	 e7G98H90edHlHhCzx4/acrH+yRp2NHhVcvCPxvhiXrVpIUuW4KX4C28NUUs8lpcmtD
	 6WdKnq44DhRYOSKpjc0oQ7WPoc82VNIt/gP1mZNF3nVhDBnnLFxCegG/VbSeHuh9wd
	 OUFr+mMfae87IM6Tf4X2Tv55W2L+++e7QbSYDrS3BRP6iuYnHBhrJdMrB1avRrO9IZ
	 hiIGOLFkTQmHQ==
Date: Tue, 29 Jul 2025 16:46:58 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v8 5/7] KVM: arm64: Mask response to FFA_FEATURE call
Message-ID: <aIjs8p5Ti0pXbf2Y@willie-the-truck>
References: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
 <20250719-virtio-msg-ffa-v8-5-03e8e8dbe856@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-virtio-msg-ffa-v8-5-03e8e8dbe856@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_084705_424154_9892F84C 
X-CRM114-Status: GOOD (  16.45  )
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

On Sat, Jul 19, 2025 at 02:11:27AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> The minimum size and alignment boundary for FFA_RXTX_MAP is returned in
> bit[1:0]. Mask off any other bits in w2 when reading the minimum buffer
> size in hyp_ffa_post_init.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 2 +-
>  include/linux/arm_ffa.h       | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 5a173ea481940236356e2bc4248d094a858a0923..2cbecc9af5d27a9e7c8497001cf9b0987c72bdb4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -733,7 +733,7 @@ static int hyp_ffa_post_init(void)
>  	if (res.a0 != FFA_SUCCESS)
>  		return -EOPNOTSUPP;
>  
> -	switch (res.a2) {
> +	switch (res.a2 & FFA_FEAT_RXTX_MIN_SZ_MASK) {
>  	case FFA_FEAT_RXTX_MIN_SZ_4K:
>  		min_rxtx_sz = SZ_4K;
>  		break;
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e1634897e159cdc208931938649eb0fb04d5a070..cd7ee4df9045dceca1c4e0dca2d533b770b1b056 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -128,6 +128,7 @@
>  #define FFA_FEAT_RXTX_MIN_SZ_4K		0
>  #define FFA_FEAT_RXTX_MIN_SZ_64K	1
>  #define FFA_FEAT_RXTX_MIN_SZ_16K	2
> +#define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)

Acked-by: Will Deacon <will@kernel.org>

Will

