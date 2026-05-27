Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6uwZLDJElwupGK+nwh6orc1Lp+c9SwLCI+Jblmet4Q=; b=aantOAw8ecnEaQV3SU8UZ9zlFT
	ABcrK2y5QpdgbZeOmQyKoH+Yfazd33nhTzAgmfbnpBeKxyh2eQBvXx8MZjJz/uthEGUB6SnW2H/2F
	siL0ifGuazFA7lTdM2gjPv3nseIF1fnJJJsEWH62QJfcYUCRrNR091b4ofw0I/4q3ZJaj05K6GzBf
	ZzL4C7VU82LXHMhuosygAy+4znPvOMITl3RDKgmLvuE3DIpdNELqWlr2Il/ijhbkhLg1NJB9DlkHb
	cUn5sKwmQz7y+Q5eYS1tZKxf58zDJmvTA+lNbillWTMl2JxmgvWDR3AnF3aFjoGXoUNePJ2qHjJWO
	YWoBpVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH2p-00000004V7j-0KJz;
	Wed, 27 May 2026 16:23:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH2m-00000004V6y-42mb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:23:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F14B435B9;
	Wed, 27 May 2026 09:23:37 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE3D63F905;
	Wed, 27 May 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779899022; bh=InqS0OB5sXHJnaWxKY98YA1/vqiX1EgRZ7YEPyZzGxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5AGH8PfHk7vb+yoJ0nscckmvGxnZGjktW9L9rRBYjdcN4FCfTyLGrS+yUO39DMMP
	 p5H+P4Y5GnRAfsvjBYVmJTHQ/PZzrAHZJWgtgv93++KALizHl9h1ZByVCshMLHsnBk
	 dy8zYvLS9BLaS3a3/HRhpHJpx3n1Eb0Q5l2hJMNE=
Date: Wed, 27 May 2026 17:23:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 16/18] arm64: fpsimd: Move sve_flush_live() inline
Message-ID: <ahcai1BV71rDmGLa@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-17-mark.rutland@arm.com>
 <0f34443d-222e-42d3-b6c2-d15bb656e1d2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f34443d-222e-42d3-b6c2-d15bb656e1d2@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_092345_064930_3A4DC48A 
X-CRM114-Status: GOOD (  12.88  )
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

On Wed, May 27, 2026 at 01:54:42PM +0100, Mark Brown wrote:
> On Thu, May 21, 2026 at 02:25:54PM +0100, Mark Rutland wrote:
> > Currently sve_flush_live() is written in out-of-line assembly. It would
> > be nice if we could move it inline such that control flow can be written
> > more clearly in C, and to permit the removal of otherwise unused
> > assembly macros.
> 
> > +static inline void sve_flush_live(void)
> > +{
> > +	unsigned long vl = sve_get_vl();
> > +
> > +	if (vl > sizeof(__uint128_t)) {
> 
> It feels odd to use sizeof(__unit128_t) here rather than u128.  Whatever
> colour the bikeshed is:

FWIW, that was just to match __fpsimd_to_sve(). If there was nothing
else to be consistent with, I agree that using u128 woul2d be
preferable.

> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks!

Mark.

