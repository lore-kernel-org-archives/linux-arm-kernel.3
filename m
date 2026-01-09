Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53420D1A631
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2U0/vzSpQVBN6VvGhI+HXw371wwE1GrUgtJj2BxP0f8=; b=kqeH4KyE3rGG6fLcHpNJ8MddDr
	mmnNFrUYfkSHj+k4KWB9nwl94T+hnzdzAg2klpvqjGLIanXE21N+TkHbPVJSpqFVhA2AzW102+wV8
	lOnh3HM14Vvvxy0hgvMsaahfcRXYiLoPmtqDfslrekWd6Td8lKpEN8sa83jrECzYrb7UhwkawkQ5a
	xRm7Z+qgScUN5VAlIwxjrSxsFX5BucHbvTbGiSMJw6qxVNyLSO/XWHTPKW9zestVCTwtQTkLNvpwO
	bF39q1yAOPiIKINtjrtvcJjY26QGt5H7O2G4xecAf7uFevifeawCiS5/CsMJTUssyzjkQZuylegE1
	WMjAfXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDDG-00000002OOo-0h8j;
	Fri, 09 Jan 2026 14:11:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDDF-00000002OOi-1rd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FB336012B;
	Fri,  9 Jan 2026 14:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03713C4CEF1;
	Fri,  9 Jan 2026 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767967896;
	bh=Nc65wkMyCazsYeM+KI3rb7LhY4lOgQfED4l3qKX4Srs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQbDIfcbMQHPYaONy0xw9eDeUtqr6fNL4fM5tkLehvmUCkfobfoEcTA0ebVhwOpop
	 euUY3QVP9Pw7W8GAbH9hSjYS43dpx26c5gkwD9TEnnb3/OhKE+UlE3J6/SG24oBLX0
	 lyoA3JT/+SjKXC1C3wrikvNCNmJuCErVX/X1N0fnffoxWU55+RywqExZsTwdkN6pMB
	 vsjz27RPhRNXlgXwSPIzwiEh0HHdKf9+iVPFnLI4P6QNKK5Pp4AR6KkGd33FYlhDU3
	 +vxOFyg5OmvWHtnmGNfR5hFgAxbm2LfbVj4+qlNzYv8eNP2iQNd8T98G4x3ov2t3Sh
	 dJC7MnnXMnjLA==
Date: Fri, 9 Jan 2026 14:11:28 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v8 07/12] atomic: Add atomic_cond_read_*_timeout()
Message-ID: <aWEMkHbBOgOkx_9f@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-8-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-8-ankur.a.arora@oracle.com>
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

On Sun, Dec 14, 2025 at 08:49:14PM -0800, Ankur Arora wrote:
> Add atomic load wrappers, atomic_cond_read_*_timeout() and
> atomic64_cond_read_*_timeout() for the cond-load timeout interfaces.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  include/linux/atomic.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/atomic.h b/include/linux/atomic.h
> index 8dd57c3a99e9..5bcb86e07784 100644
> --- a/include/linux/atomic.h
> +++ b/include/linux/atomic.h
> @@ -31,6 +31,16 @@
>  #define atomic64_cond_read_acquire(v, c) smp_cond_load_acquire(&(v)->counter, (c))
>  #define atomic64_cond_read_relaxed(v, c) smp_cond_load_relaxed(&(v)->counter, (c))
>  
> +#define atomic_cond_read_acquire_timeout(v, c, e, t) \
> +	smp_cond_load_acquire_timeout(&(v)->counter, (c), (e), (t))
> +#define atomic_cond_read_relaxed_timeout(v, c, e, t) \
> +	smp_cond_load_relaxed_timeout(&(v)->counter, (c), (e), (t))
> +
> +#define atomic64_cond_read_acquire_timeout(v, c, e, t) \
> +	smp_cond_load_acquire_timeout(&(v)->counter, (c), (e), (t))
> +#define atomic64_cond_read_relaxed_timeout(v, c, e, t) \
> +	smp_cond_load_relaxed_timeout(&(v)->counter, (c), (e), (t))

Please update the atomic_t documentation to explain what these do.

Will

