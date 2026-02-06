Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA5BEE6B68
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 22:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SkrnoM+yB6QcHJ35a48eFfOb45bt+SNhercvF9FzoQ=; b=wg6NnGQ6E5WnuNSBGJOd2EXe0C
	IP3Bi2Ld3hDvA4s/28SH/KjhzvcfOm5Mzv77lxqeRjTQpxOdLvw6+vTCl526m50blAgoUFTN0g58o
	PoXxkgXhkQKOV/P0PKfVKuChg5kla4JVkdusz/k/AszAqHsqxU3NF93q4HtJuzdY7sGtM/0eRKQvA
	7w4fhhp8uc3lixf2OZ6QZBUXmKt3GvRBjQ4YtefnG+eXOglxbPXk6pzfOm9YFAda1QGf/me2Qq0dd
	1dASlXDgiyR3NMlliWzY36jsxpCADnFuFDjnTltdVeFnMJRvd6AF3+drHZ/stkYx7jDGhzpSn9jei
	e+p+tKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUKd-0000000BstZ-08vx;
	Fri, 06 Feb 2026 22:29:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUKb-0000000BstD-2FsE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 22:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 005D860137;
	Fri,  6 Feb 2026 22:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4886C116C6;
	Fri,  6 Feb 2026 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770416980;
	bh=B6i1AY01mf6+Or5Bod2QPlTsM8AkTOEprb6IK6po4dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLtZpnFtqhRUa6BntvNQngKuRUYxjj+rJ9l8Xg9KYLRb2RMTciq07c8/mD1IvXA4o
	 A5vYd8c54TzHc/gf2mjbuWLcwiFJgsm4D41Y/VimDAUCWlTL2gJd1EAWvVdqJ+9qAr
	 xNJLvl4oRgFLR927qQbaR7gLImKdPupsKVQGDA8Q0TBFIqcn4iptmJCybxp4xi8Qd6
	 Jpd/R8YO8Aa6J8GJNBoX4aVvnBZasdWDNalvTH0bSUwJQj8zqFg8rFi3eb8FU5MN9X
	 8d6jC+bRwGvNZJIk81iA07xIacWLI+4CHoBj3PXX1q1NefP3CFcl7blmiTjdWsrEPu
	 5fGz5UZoQZ2MA==
Date: Fri, 6 Feb 2026 14:29:40 -0800
From: Kees Cook <kees@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Keir Fraser <keirf@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: Handle const qualifier from clusters
 allocation type
Message-ID: <202602061429.4FB68A777@keescook>
References: <20260206222651.work.438-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206222651.work.438-kees@kernel.org>
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

Oops, bad Subject... sending v2

On Fri, Feb 06, 2026 at 02:26:53PM -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct gic_kvm_info", but the returned type,
> while matching, is const qualified. To get them exactly matching, just
> use the dereferenced pointer for the sizeof().
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Zenghui Yu <yuzenghui@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <kvmarm@lists.linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 86c149537493..a53f93546aa0 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -654,7 +654,7 @@ static struct gic_kvm_info *gic_kvm_info;
>  void __init vgic_set_kvm_info(const struct gic_kvm_info *info)
>  {
>  	BUG_ON(gic_kvm_info != NULL);
> -	gic_kvm_info = kmalloc(sizeof(*info), GFP_KERNEL);
> +	gic_kvm_info = kmalloc(sizeof(*gic_kvm_info), GFP_KERNEL);
>  	if (gic_kvm_info)
>  		*gic_kvm_info = *info;
>  }
> -- 
> 2.34.1
> 

-- 
Kees Cook

