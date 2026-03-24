Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A6E9A75F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqAmRTdXVRfS+U7m0yjiwlQtsaYIm6uefqtyvL7n9sA=; b=zcVnEHRFCtgiocnEO5t7k02ca8
	+vatZrJlkWIwU7a8IehUy20GHs6Bxw0Rgs+sMy6ILHNvis9M7iVba+PTozBhQC7b2pnHLiyULmDZs
	QPSgs1aC6j0vlUu/e7dJLyQThRas1noda6qm+xgcqrjHZSb/DXXhzxx0B2FQFvq3AEA2BsmF4nyE2
	REu6mXeDD97mJuHeQh5nmV4FxHa38nCm5mrwe7tCioq/b7hKNBohNot6/tdrgqQVIoDLXYvFYixj8
	+O+gVIO81fYIlnEe9YrQfELR0Mk4XTKLR5jaqjNBHUfc9gBgQgS9g/na3lSRVPuoDliNd6LKvdFh/
	etzIkSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yzj-00000001DIL-3nKI;
	Tue, 24 Mar 2026 10:28:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yzh-00000001DHb-2CvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E92640856;
	Tue, 24 Mar 2026 10:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8343FC19424;
	Tue, 24 Mar 2026 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774348095;
	bh=6sgVnhGfx/Gr8MffbxZCAPHDZSVU/xN0vvzwT8HpMXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwUPEMQIHDD077VI3busfNuril0YmxjbGwYzsYejnKrfkZDSC31QZyKmCQLu9fJdE
	 S5DNkNHd03l3ny1WkrAQmiEwJkMI2pwGC/B0vLv7fVXyePrr3Hv8/hzfrjcXVx70nH
	 2dXBt0+xytHW7OEPwLd3iYvC/yWcp0dnxi/vvifQowEKAxMbcOwjbqMR9xKJPST+I0
	 OFbGwwBwY34Rx2+NPSefHt/Aszh4h0sx00Ivsq31FzrhDORR9msiKkKuA3Xs32MAW6
	 Yvz0D7YxPYQSeJ9ltUfuOmYgJs35b8EJ6irK5Npyzij9GsMYDq+WoJsHm0MXADDHnt
	 ablF4wBqmilcQ==
Date: Tue, 24 Mar 2026 10:28:08 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrei Vagin <avagin@google.com>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, criu@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Chen Ridong <chenridong@huawei.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Koutny <mkoutny@suse.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
Message-ID: <acJnOB-rlyt-3jU4@willie-the-truck>
References: <20260323175340.3361311-1-avagin@google.com>
 <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_032817_610034_B148B1A6 
X-CRM114-Status: GOOD (  25.85  )
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

On Mon, Mar 23, 2026 at 06:21:22PM +0000, Mark Rutland wrote:
> On Mon, Mar 23, 2026 at 05:53:37PM +0000, Andrei Vagin wrote:
> > Introduces a mechanism to inherit hardware capabilities (AT_HWCAP,
> > AT_HWCAP2, etc.) from a parent process when they have been modified via
> > prctl.
> > 
> > To support C/R operations (snapshots, live migration) in heterogeneous
> > clusters, we must ensure that processes utilize CPU features available
> > on all potential target nodes. To solve this, we need to advertise a
> > common feature set across the cluster.
> > 
> > This patch adds a new mm flag MMF_USER_HWCAP, which is set when the
> > auxiliary vector is modified via prctl(PR_SET_MM, PR_SET_MM_AUXV).  When
> > execve() is called, if the current process has MMF_USER_HWCAP set, the
> > HWCAP values are extracted from the current auxiliary vector and stored
> > in the linux_binprm structure. These values are then used to populate
> > the auxiliary vector of the new process, effectively inheriting the
> > hardware capabilities.
> > 
> > The inherited HWCAPs are masked with the hardware capabilities supported
> > by the current kernel to ensure that we don't report more features than
> > actually supported. This is important to avoid unexpected behavior,
> > especially for processes with additional privileges.
> 
> At a high level, I don't think that's going to be sufficient:
> 
> * On an architecture with other userspace accessible feature
>   identification mechanism registers (e.g. ID registers), userspace
>   might read those. So you might need to hide stuff there too, and
>   that's going to require architecture-specific interfaces to manage.
> 
>   It's possible that some code checks HWCAPs and others check ID
>   registers, and mismatch between the two could be problematic.
> 
> * If the HWCAPs can be inherited by a more privileged task, then a
>   malicious user could use this to hide security features (e.g. shadow
>   stack or pointer authentication on arm64), and make it easier to
>   attack that task. While not a direct attack, it would undermine those
>   features.

Yeah, this looks like a non-starter to me on arm64. Even if it was
extended to apply the same treatment to the idregs, many of the hwcap
features can't actually be disabled by the kernel and so you still run
the risk of a task that probes for the presence of a feature using
something like a SIGILL handler or, perhaps more likely, assumes that
the presence of one hwcap implies the presence of another. And then
there are the applications that just base everything off the MIDR...

There's also kvm, which provides a roundabout way to query some features
of the underlying hardware.

You're probably better off using/extending the idreg overrides we have
in arch/arm64/kernel/pi/idreg-override.c so that you can make your
cluster of heterogeneous machines look alike.

On the other hand, if munging the hwcaps happens to be sufficient for
this particular use-case, can't it be handled entirely in userspace (e.g.
by hacking libc?)

Will

