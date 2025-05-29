Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2915C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7svFlp11RbClh8FbgGUfvdo4GLC93rZE5pcdoP+hbLA=; b=Bka1pKUlawpFm97qpPSqaPL+dG
	H6zYKOkbPixRKvzLbAeQEtd8fTUizLZwowRlJqJZ5OzUQeZ3b9ljceD270efnCKt0y/lQl2JwHdsj
	JF+VCJCXqDLRMQyUisPETi9qmiHXtEoOmrQ3X4ug2A1FuBzmoZjjQ506FIIbFteFWYzDO1fHIj/+Y
	zlHxhHpPk9sgVrkRnJQZV6t1gD49z+4PmXXeNuVKMV2dHqHRkeMG5WbiwdYT1oIk3TK6cfOYvs3AA
	T6FWb78fGDscLvpv+su3L2axEjMGgCQxUhCQtnRBthuYF2a2/YPF+XJHUzxBetTk8mLfPG5tVjxQZ
	z1AiIyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcjR-0000000FmuN-14ro;
	Thu, 29 May 2025 12:51:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKc0s-0000000Fha5-38IK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0AD33A4F87E;
	Thu, 29 May 2025 12:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCB5C4CEE7;
	Thu, 29 May 2025 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748520331;
	bh=8I/UWuszTYHqaey/kP67a900h+P9udkFPXSQpcAGIl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4dxqYAvZ54FKoVTj+yydgfIVvF/MnkLhnLXZnTR4ayNz5QvjWEoq4myi5AvbFfAm
	 DUik26A7WJfdEZn2Oavw5VB35a7oD37DLB6bACy/AcZYQJ1FsQhdQ6z874mM+rKNyK
	 NE9lT1NtdwjTyJULJvVgf3R175yapp8HcDemurLEuVAOniMKakZp7ko/pODiWSIRLw
	 mfQMlaQP9ooRzSAvU+QH//MLMNUffj17tLGYdBF5hLOb66qByfsDMtQ5zRdSqDfZMx
	 AaBAGFzMQFa8zQ6ZBpjrTm+58HiFVK+uyN40qv4cgPpby02raRrBdrtmWjJjBDzkZv
	 MwR/NA+c4+urA==
Date: Thu, 29 May 2025 13:05:24 +0100
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
Subject: Re: [PATCH v4 3/5] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
Message-ID: <20250529120523.GA29242@willie-the-truck>
References: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
 <20250516-virtio-msg-ffa-v4-3-580ee70e5081@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-virtio-msg-ffa-v4-3-580ee70e5081@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_050534_862162_00738010 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, May 16, 2025 at 12:14:02PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> Prevent FFA_NOTIFICATION_* interfaces from being passed through to TZ.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index b3d016bee404ce3f8c72cc57befb4ef4e6c1657f..a545d25002c85b79a8d281739479dab7838a7cd3 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -632,6 +632,14 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_RXTX_MAP:
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
> +       /* Optional notification interfaces added in FF-A 1.1 */
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> +	case FFA_NOTIFICATION_BIND:
> +	case FFA_NOTIFICATION_UNBIND:
> +	case FFA_NOTIFICATION_SET:
> +	case FFA_NOTIFICATION_GET:
> +	case FFA_NOTIFICATION_INFO_GET:
>  		return false;

Acked-by: Will Deacon <will@kernel.org>

That said, I wonder if we should revisit this denylist along the lines
of the discussion with Oliver on the initial FF-A proxy series:

https://lore.kernel.org/kvmarm/ZGx0QBZzFCmm636r@linux.dev/

We check for is_ffa_call() already, so we could invert the above to be
an allow-list for calls within the FF-A range rather than a deny-list.

What do you think?

Will

