Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11589F588E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnlkNSCmjBdcpmwNyc8GeIFciUhmZ5OjT8wXGxSQm54=; b=Xxzqsr6QU6CjoVhePxoqnT72Ov
	+NOIwHy826jJ2MkhZfzCNZ8DoqTkcvnuJlM0IEf1p5/xE//SVE9U0WjPWViB3PL8ablYLwIyvBSfi
	5TLmSf0AuRAuvCsHLw91zG18Kq/g5jZAV9vu7srOH3opZfL+4Lleb2rBHoGmCz6wZOJIB2+6NzYzz
	GalnEwdDP+mVJU3PVDVFqjf2HgyErvmdCUxDXpBTaMYhnDDhdLACI4xZyZsD2DblPptWcf3uuXgL4
	dvKoifFneG9HC+FIviK5lH7vrtFQxUXbgHDzwGjzC8eB8W3ttwQMPFdM7AWzDMw9WlgEt2aVAogxB
	rhixoIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpkj-00000007BLF-0w2o;
	Mon, 20 Apr 2026 14:37:33 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpkg-00000007BKR-1jT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VnlkNSCmjBdcpmwNyc8GeIFciUhmZ5OjT8wXGxSQm54=; b=EEmzCfCvEsxW/AZAWePnCi/ZqS
	yEp0H5pXBi70SruNlG6gGDrhQGSJUMpAWLWX3Sy8WAUpsgtWHZ5oMQPTFyFevt0ZZrAUdcw5CAVm1
	wke8yeEtovoCtKLtg+xv6qwZhBT7t+4U5GAG7raGQ0P6j+QDuW4itX1cnLeKyBGbWgpIAEd2uyD+u
	RJIrO9/wnN0rRUzY/JMq4jHkFHrZhFH3DnJ8Iv16FjP/NnAFi8EpQVqvQHRKqN1QvwsE5HlD1MdqU
	rCv27T6dVIcxtLi3coum9Z59jExT3hqh5T4Mk9vMyUC0Evj4Je6k40Hn991iQ3deFXAcyAS60i3wI
	dR7NQl9w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wEpkb-0009Rh-0z;
	Mon, 20 Apr 2026 14:37:25 +0000
Date: Mon, 20 Apr 2026 07:37:20 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, leo.bras@arm.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	paulmck@kernel.org, puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] arm64/irqflags: force inline of
 arch_local_irq_enable()
Message-ID: <aeY5e0Y3Ua2DoPxF@gmail.com>
References: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
 <aeYkz_4WKDdb1NTp@J2N7QTR9R3>
 <aeYmHr_lgPJbBoL_@gmail.com>
 <aeY02X5MDWPhGPCK@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeY02X5MDWPhGPCK@J2N7QTR9R3>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_073730_537931_A6E54FD8 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, Apr 20, 2026 at 03:14:49PM +0100, Mark Rutland wrote:
> On Mon, Apr 20, 2026 at 06:15:24AM -0700, Breno Leitao wrote:
> > On Mon, Apr 20, 2026 at 02:06:23PM +0100, Mark Rutland wrote:
> > >
> > > Are you happy to try that?
> >
> > Absolutely, I'll work on testing it that and put together a patch
> > addressing all of them.
> >
> > Should this be targeted for stable backports as well? If so, which
> > commit should I reference in the Fixes tag?
>
> I don't think we need to worry about backporting, and can do this as a
> cleanup for now unless someone shouts that they're seeing brokenness in
> a stable kernel.
>
> There's no specific commit for a fixes tag; this has always been a bit
> dodgy, but we've evidently been getting away with it in practice.

Ack. I'll run this through production testing for approximately 24
hours, then submit the patch.

Thanks,
--breno

