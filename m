Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DCAC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSO7Ga3dp+JvrDttxvl/PRm5Rq8XH6ajiyAtvo8Jwu4=; b=ml0Xc7ykDhdSrRF+uc5WZl+w7E
	aNRa95MdsxtKmmn0NoGaraufmA8NxCXn7w4oqYJZPL9RD/cI37Y4udjNM8s+1/VfOnE+D0J1KMb6/
	c+AENG5eL8SUh1jYed47hJele5XpvOrAPBfUtaazpKzikRlro1laIH5NTFv4HevqlRV8ILNZbD2EU
	JLcgCLOvcRc+2lFIgTfQ0Y61wYkHaLxohJZPbuUgpxqUEQq/npJweCPhlLFvxKCmAY1fzN1yTjseF
	CzRVk/x8cJje0PEOVW8F6H+UZyYi9/kv/SSHOW9K1S2o7gX+7AR8r5DcwWT1mvcBfEb9zWJB63HVj
	oSwr+jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdE-0000000Deke-22kF;
	Wed, 28 May 2025 16:27:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIXM-0000000DX5U-3daC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:17:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC9E1A2D;
	Wed, 28 May 2025 08:17:26 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75A83F5A1;
	Wed, 28 May 2025 08:17:41 -0700 (PDT)
Date: Wed, 28 May 2025 16:17:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 06/11] arm64: debug: split hardware breakpoint
 exeception entry
Message-ID: <aDcpESO2rYX_7V3Y@J2N7QTR9R3.cambridge.arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-7-ada.coupriediaz@arm.com>
 <20250520153638.GF18901@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520153638.GF18901@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_081748_947004_DE4AAFED 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 20, 2025 at 04:36:39PM +0100, Will Deacon wrote:
> On Mon, May 12, 2025 at 06:43:21PM +0100, Ada Couprie Diaz wrote:
> > +static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
> > +{
> > +	if (!is_ttbr0_addr(regs->pc))
> > +		arm64_apply_bp_hardening();
> 
> I think this is a change in behaviour, as arm64_apply_bp_hardening() is
> now called before enter_from_user_mode() and debug_exception_enter().
> Is that safe and intentional?

Yes on both counts:

* It's safe. The arm64_apply_bp_hardening() helper, and the callbacks
  that it may call are all noinstr, and are written to be safe to call
  in this environment.

* It's intentional. The goal was to do this as soon as reasonably
  possible, at least before unmasking exceptions, without incurring the
  cost for exceptions where this didn't matter.

  We've already executed a bunch of code to get here, and moving this
  after enter_from_user_mode() should be fine.

This is inteneded to look the same as el0_ia() and el0_pc(), which both
call arm64_apply_bp_hardening() before enter_from_user_mode().

Mark.

