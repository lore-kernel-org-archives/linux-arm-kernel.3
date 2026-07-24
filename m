Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A138CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 05:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q53deWRRK/b91M73sD9YZ3ZgsNtt8lj3y8LlgTKiW5A=; b=vabuNDhCnE0kzLx0OtX0xzlxyg
	6VOjr9p3dlJmLzLfguZpYZhhigHQZqe+h2wymIqxkL8YLMhV4Tg+ge+6jdp2bkGwQ0H7XV+eyL2c5
	JsOxh9S0BNFj+PNgE16H2nX7CHQWwaPoMgx2urHcYjYtG+/8O8wIbrRvGejE8tsdyvVI7e0jtx6dw
	U13NKMueh7jhoEaHOJfh5JxLtOQSTqUz8f6fI40UQbyZWStTfIt/WH4Amy125A6pkNoWNS+hJZ8lc
	ARRsckgwNbK4sOCoWZtaKjAaW2yLP3QuHRDLDeuTzlCMlWFGDkuGU9bqd0dAk1G2K/wJkxwb4hmX0
	hlx+SpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8T5-0000000FVg4-0le2;
	Fri, 24 Jul 2026 05:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8T3-0000000FVfx-3avY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 05:29:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0306543FE7;
	Fri, 24 Jul 2026 05:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657471F000E9;
	Fri, 24 Jul 2026 05:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784870944;
	bh=q53deWRRK/b91M73sD9YZ3ZgsNtt8lj3y8LlgTKiW5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+bk7VgwsbrJ8l4jJtUHhfiAwHSs/8g1M3vrAb3vwvR5wovGNLum4KO14XHHWT/MD
	 qK6s3m9ftLdWqrK7FdCDXZBpydWxM9N5PxHJcggouPF2KI41ZDqjep5KSjujBHKGM7
	 ZQlidywgGaNOsnom9QTwGrLwfwVXobaMDi8eorHs=
Date: Fri, 24 Jul 2026 07:28:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <2026072410-drained-acts-3502@gregkh>
References: <20260724050645.223799-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724050645.223799-1-ebiggers@kernel.org>
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

On Thu, Jul 23, 2026 at 10:06:45PM -0700, Eric Biggers wrote:
> This obsolete driver was already marked as BROKEN.  However, keeping
> BROKEN code around in the tree is unnecessary and causes problems.  It's
> much better to just remove it entirely.  Let's do that.
> 
> Crypto acceleration remains well-supported on Qualcomm SoCs via the
> Qualcomm Inline Crypto Engine and the ARMv8 Crypto Extensions, which are
> what Linux actually uses in practice.  The obsolete QCE driver is a
> dead-end approach.  It's extremely slow and just doesn't work well.
> 
> While there's been discussion around using QCE for restricted media
> content protection, that functionality has very little to do with the
> current crypto API driver and belongs in a separate, clean proposal
> (likely under a different subsystem/directory).
> 
> The extensive reasons for marking this driver as BROKEN were already
> documented in commit df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN").
> 
> Since then, it's also been found that under realistic workloads, the
> driver is not only ~48x slower than ARMv8 CE, but due to massive driver
> overhead it actually consumes significantly *more* CPU cycles than doing
> the hashing directly on the CPU -- with much of that time spent in
> non-preemptible hardirq and softirq contexts
> (https://lore.kernel.org/linux-crypto/20260724020608.GA51735@sol/).  The
> proposed BAM locking fixes would only further degrade performance.
> 
> Additional bugs have been found as well
> (https://lore.kernel.org/linux-crypto/20260723205801.GD110634@quark/).
> Pending fixes for some bugs don't change the big picture.  Nor have
> security-related claims held up.  Of course, these issues are largely
> moot anyway when this driver's functionality isn't being used in
> practice, beyond the module loading due to it being in the kconfig.
> 
> Note that this removal does *not* imply that various other drivers in
> drivers/crypto/ don't have similar issues.  They do.  Rather, the
> evidence is just exceptionally clear for this one, in part because
> hardware availability has enabled independent testing.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

