Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B588C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 01:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo5DrBnN3Oqy/iM8W0kKn0LEA5mVqLqibe68g+poWzQ=; b=JfTF1v9LqkcUB4XxkV0gaS57Ra
	XnShwJ01q49CElpTF6yzrBVtFzgnHMHso3kKdIzYdGy0NHO4AWxPvabFQDS5MKR4hUOgAAn+12Izm
	R0cwn6D9y9PBY31C46lEU08Z0cmq6AsB2rb0aM3/tupnOr0wESPJfq5mOiZJzCnX94Gc5Lx53LZ4R
	E8WGxN9dg/NQAHJy6BuGur+5tQHMtTGZD6xI0OPApjrsQXLZaLuFUfKZHAYXTREjHXJjpgu1a50JZ
	DKDt+FL8rhyofpE2hcJcHoJHNJUiawKd4dzaaXyHU3PrcY+T13uuai0OKg5B+9emdzeQP06D1RiSE
	biqUgxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdoX-00000006kJi-2g0M;
	Wed, 05 Mar 2025 01:44:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcnS-00000006eMm-1y9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6AC25C5BB0;
	Wed,  5 Mar 2025 00:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5692C4CEE5;
	Wed,  5 Mar 2025 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741135177;
	bh=YGhbZ2YK+fELRvv5nvPexW30rexltktFwBDOg+g4tAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCKltC8nO1n/x9FzpGkuzK7IPNaPvku4mXheM33+ixq1UepD9sU9j8/FQwlvEIeBk
	 TyWlme3bMxIVPoC5Ki0YD8raoOermliT3Da7XazHIVrf5oRr1gxF5s8Q491zKsYc3E
	 n8qR9kr1f9cjiskUqmrh72064ga2fICFtUIv/9E7rM/X55zuNLwEuEczjY0WrtBKOk
	 biOUboK8Ze8Kghd1vnzlbnxMPOxZQERJ2iGeXAV1BFQY36zA7/jr+xU1mgNgYNPEwc
	 Zt4H3g7eNxPz/h2biOlltuzp8lUQw2Kdd3Tflhj+pLQ5Ip5SIQEgaXIZJKdgNgOl6R
	 HCzm52ElFXvnw==
Date: Wed, 5 Mar 2025 00:39:31 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 1/4] KVM: arm64: Use the static initializer for the
 vesion lock
Message-ID: <20250305003931.GB31667@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227181750.3606372-2-sebastianene@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_163938_545463_52B6E527 
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

On Thu, Feb 27, 2025 at 06:17:46PM +0000, Sebastian Ene wrote:
> Replace the definition of the hypervisor version lock
> with a static initializer.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index e433dfab882a..6df6131f1107 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
>  static struct kvm_ffa_buffers host_buffers;
>  static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
> -static hyp_spinlock_t version_lock;
> +static DEFINE_HYP_SPINLOCK(version_lock);
>  
>  static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
>  {
> @@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
>  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
>  	};
>  
> -	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
>  	return 0;

nit: typo in the subject (s/vesion/version/).

With that fixed:

Acked-by: Will Deacon <will@kernel.org>

Will

