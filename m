Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1F5E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBCoEYAriT1n5TBLDxHN1IR1rNjp3IoURGW7adz+RGU=; b=V6NJJfv82+eOV5ZrZNyRoNwgAF
	5EAoQ9Z8bKXtw4BszxllqevsbUhQTwrmu901vEkJwYM/jx8fk7/W6MsxFzVy3PZ95vNwDTKbftfk4
	NlMGoH1PrPW5dvLxIJL8z0igJAA1VGtaV/cFqjz4uP/CP6LyeKKhVtpUcPCyqepK+wu4Z19w7e12x
	XsSZoTlwXQ7Iv3IHmdzhhvTM/0RlexLWSAPjXSUspEqPq3l8Ub74Y1I2ovaJZxuxWId+jxXaTe9ih
	lBKiERG+iYpn2RxkydIV+osc6feEAFCPTfMg0n14s/kKN16ZnAbFSDIoj6tOrKuS7fpYo2lSxS8YB
	ZRPi7Gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInRu-0000000CMYV-400A;
	Wed, 04 Dec 2024 11:21:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInQt-0000000CMSA-1VRC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:20:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47B3B1063;
	Wed,  4 Dec 2024 03:21:06 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C32E3F71E;
	Wed,  4 Dec 2024 03:20:37 -0800 (PST)
Date: Wed, 4 Dec 2024 11:20:32 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <Z1A7ACC+0Vb2bT9p@e133380.arm.com>
References: <20241203100322.1626805-1-kevin.brodsky@arm.com>
 <Z07x69L6Mssncg/7@e133380.arm.com>
 <a9aa36eb-d5c2-4d1c-bf5d-e63e4cb55404@arm.com>
 <Z08l0Q9KO6haeSSI@e133380.arm.com>
 <3da4f6d2-5869-4515-a86a-e821d9276640@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da4f6d2-5869-4515-a86a-e821d9276640@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_032039_439968_43C8CB09 
X-CRM114-Status: GOOD (  25.84  )
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

On Tue, Dec 03, 2024 at 05:48:10PM +0100, Kevin Brodsky wrote:
> On 03/12/2024 16:37, Dave Martin wrote:
> > Hi,
> >
> > On Tue, Dec 03, 2024 at 04:06:24PM +0100, Kevin Brodsky wrote:
> >> On 03/12/2024 12:56, Dave Martin wrote:
> >>> On Tue, Dec 03, 2024 at 10:03:22AM +0000, Kevin Brodsky wrote:
> >>>> [...]
> >>>> @@ -1462,10 +1462,33 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
> >>>>  			 struct rt_sigframe_user_layout *user, int usig)
> >>>>  {

[...]

> >>>> +	/*
> >>>> +	 * We must not fail from this point onwards. We are going to update
> >>>> +	 * registers, including SP, in order to invoke the signal handler. If
> >>>> +	 * we failed and attempted to deliver a nested SIGSEGV to a handler
> >>>> +	 * after that point, the subsequent sigreturn would end up restoring
> >>>> +	 * the (partial) state for the original signal handler.
> >>>> +	 */
> >>> The same is true at the call site of this function; could problems
> >>> creep back in there?
> >> That's a fair point, I could add a short comment after the call to
> >> setup_return() to clarify this.
> > That would make sense.
> >
> > (Or refactor so that the point of no return is at a function boundary;
> > but since this is a Fixes: patch, it's probably best to keep things
> > simple.)
> 
> I did consider this, in fact this is what I did initially. However I
> then realised that gcs_signal_entry() itself modifies thread state that
> affects control flow. In other words, if it succeeds, then we are
> already in a situation where failure should be avoided, so pulling it
> out of setup_return() wouldn't necessarily be clearer. There may be more
> operations that can fail like gcs_signal_entry() in the future, meaning
> we'd have to "revert" such operations if any fails. I think it makes
> sense for this to be handled in setup_return(). At least we don't need
> to complicate things for now.

That seems fair.  A one-line comment at the call to setup_return()
should be enough.  I guess we can live with the slightly confusing
function naming (since it was already a bit confusing, and this isn't
trivial to sort out).

So, with the comment, feel free to add:

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

Cheers
---Dave

