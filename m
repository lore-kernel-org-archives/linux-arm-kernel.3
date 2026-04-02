Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BAD6AB10
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wrzblJBnuO2RTfpLM9BJI19asD5d3lrNjqKPOWD7QM=; b=1qc09KL8armOLcwdzx60QgiFCi
	bvfjXLoPrCzdBEwEt9LVVn7VjplHdbqp76/mu9i1LSUN+vgzS0jQGKPGMSqV+L+RsLoWJbfXNK+b2
	nQgMqTIxhKZ6tPczVM3Rz++CuFbpLwZQk1FNyU0UpHo9zH6M165hPtdMZ5MgHRrK2Ai8vXIULGecw
	Hju+OoU2SjKp2H1PMos19anp8/bXt8UKe7nPvBtFaXV9e/dem4gkUr1q2tUUFDvYlPhRNuIz6qBih
	2VjgWDAzcuF8mGMXXgzbBKI/sVUSdMehObgHSOv0zD4bG2uN4r+GQ7WfW30OXAv+VnGtn5L1gRrVt
	U6CB+Qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8P6L-00000000ls0-25HF;
	Thu, 02 Apr 2026 20:57:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8P6J-00000000lrf-0C0I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 20:57:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C92B91692;
	Thu,  2 Apr 2026 13:57:06 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B2443F915;
	Thu,  2 Apr 2026 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775163432; bh=fZl342qtKB38he9YQmesSx4GGcj0I4dAAHkc0sOsHLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgvMaCiqbCN/lyG0i3b+yh8LEvUAjeo/0QxdTvnIrbA0vhMYZXmCMfhjisiv9bNmA
	 MO8WXAvJZksdQYC0e5hWYXkzR36DtrFduME5GSvJOwUvXMXlHuF3fWBbhjG49Nrbhp
	 kD2ke6G1Y1wwHDSdgZG8aDR4PyNYPSqsdEMNHYSU=
Date: Thu, 2 Apr 2026 21:57:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] arm64: clear_page[s] using memset
Message-ID: <ac7YJPo4Np2zxxEp@arm.com>
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_135715_125246_99B1D498 
X-CRM114-Status: GOOD (  12.08  )
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

On Fri, Mar 06, 2026 at 09:57:50AM +0100, Linus Walleij wrote:
> There is no need to try to second-guess the compiler when
> clearing memory. Just call memset() like everyone else.

Hmm, that "like everyone else" made me think - why not move this to
generic code and only the 1-2 platforms that need their own should
override it? Could we do the same with copy_page()?

Sorry, more work all of a sudden ;).

> Since memset() already has an architecture-local MOPS
> optimization, we do not need to do anything else to preserve
> the MOPS optimization.

The custom clear_page() had the (very small) advantage that it can skip
the length/alignment checks as they are always page-size.

> While at it, implement the shorthand for directly calling
> the new prototype clear_pages() for larger page chunks.
> 
> No performance regressions can be seen, the fastpath
> benchmarks differences are in the noise.

I assume the benchmarks ran on real hardware (had to ask, last time you
mentioned qemu ;)).

-- 
Catalin

