Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB36C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP2DK217auQwxvsOG1WozMOEW7JRurQSEHABv6OLU9E=; b=pmoSzntrWjfQiCdWqEtyTJC53a
	eHsX+lw8qqBHG2sud+a7DunVQutYfwjiG4+tCKYuONJ9kj53jhC5dT7mDd8ahAHN0cX5Mf40U44R/
	fPv2qV5y7wqnlH+iS1tYUlarHhPEIh0lvCj5mkkyaqsnq1OXn0rkorrWv6T60E7vO8qJ54BDSxI8f
	guwlHsvoUWPuvEuKOVaH7qhw2DGj+MHl+Oed4S7yN9JC2tHrrKvdGOmbrO73CJmr3MSeha0hoI/AL
	vVbdBZFBwWcOknWbiFCjQuEMWz488Q8JWOZZ8mn7cMDc5lpYrKYfDCaeXJUx7za9U+a01Inb42Mxr
	HRp4OUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nY-00000006OVk-3kc1;
	Thu, 06 Feb 2025 13:20:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1fj-00000006Mop-2bLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 563215C1713;
	Thu,  6 Feb 2025 13:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BA1C4CEDD;
	Thu,  6 Feb 2025 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847518;
	bh=h72wiez5LaKWAjXyjifazgci+glCYULS2S0BV8GupBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNA+y7ECh0SZlizVJZZd6xU9z8ia/ntzLNJss9keXfvhbORhZoDhwDJcrO3nWDSSb
	 g1FD1NCl/H8L21L5ZGEzjkKkKHocHkewXpk8SGlc3sQmmz2Ccq1Ow7cuyfDfP+6nnl
	 SqWLD+3/WSJ/8gowtfRDnocBcxY0BZXlERkpQfcmMTqjZba385nMGzjbg+mEl4WwNi
	 lwTgRMmPg5wJsO3PoS/O3LMVPZLluWuqKrPId/otZ3tYrH5xcbDyyI81NFItTfiui8
	 PK3kW2+UjWGonB0J7DtMZ5ctU+dK8e9SL4N+zs9xOh/zzMN5TOiLYPynxh2G4Khpyf
	 PGdv3EoeIg6DQ==
Date: Thu, 6 Feb 2025 13:11:54 +0000
From: Will Deacon <will@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250206131154.GD3204@willie-the-truck>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
 <Z6OWxUFxkK9plrm0@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6OWxUFxkK9plrm0@NH27D9T0LF>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_051159_703134_2F00B554 
X-CRM114-Status: GOOD (  15.69  )
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

On Wed, Feb 05, 2025 at 05:50:13PM +0100, Emanuele Rocca wrote:
> Hello Will,
> 
> On 2025-02-04 10:00, Will Deacon wrote:
> > Emanuele -- could you hack the code to poison the other unused result
> > registers () and see if they are also cleared? ARM_SMCCC_TRNG_VERSION
> > looks like a 32-bit call, so that would be W1-W7 afaict.
> 
> Not sure if this is exactly what you are asking for, but right before
> the call to smccc_probe_trng():
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/smccc/smccc.c?h=v6.1.124#n29
> 
> I did the following to write to all registers. First I tried W1-W7, then
> I went for W1-W17 too:
> 
> register unsigned long w1 asm("w1");
> [...]
> register unsigned long w17 asm("w17");
> 
> asm volatile(
>   "mov w1, #0x1234\n"
>   "mov w2, #0x2234\n"
>   [...]
>   "mov w16, #0x0234\n"
>   "mov w17, #0x1234\n"
> );
> 
> The values I wrote were not overwritten, see https://people.debian.org/~ema/w1-w17.jpg

Hrm, now I'm confused :/

In your screenshot, x6 looks like it's retained its poison value, but
that was the register being corrupted in the initial report. Maybe you
could share the diff you made?

Will

