Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF40E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+l2XPDmo8OlxC18HXWwEZE7/988344K7Y2uupyThLFw=; b=4NcwD8TOVXXG+s0gAhGWfW1cKL
	pJ3UwwLWcIpRir2wCpwFEauifKctLByGozcsLqgapF2cCsRgG3LKgRq4FW224l8Pgs7ubk5wnPj6i
	oGcJQ/zweGeHJKXeoaIkl76o5BI6JwubdLMg8pkNrUWV1OfTLpzY5dgPtdR1I5hZ2nNgH35kL6AAt
	UKPWfa8YQAMM/xxynn9uI+O9BFqYQNFh6msKh04je4fjyQ6gGGJRkjvT47zNpHopp452TGonT+CVw
	PJuGb9g6CoZ03w6+slF6xVTTem1RDIJJvmqY+DAQFApSXfQ707v76JjVRIyyHZ92BtfzHfcAGarwC
	ayCuxleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW5N-0000000A9Rg-1xif;
	Tue, 03 Dec 2024 16:49:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW4N-0000000A9JA-2p0I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:48:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4D6EFEC;
	Tue,  3 Dec 2024 08:48:41 -0800 (PST)
Received: from [10.57.68.85] (unknown [10.57.68.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE1283F5A1;
	Tue,  3 Dec 2024 08:48:12 -0800 (PST)
Message-ID: <3da4f6d2-5869-4515-a86a-e821d9276640@arm.com>
Date: Tue, 3 Dec 2024 17:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: signal: Ensure signal delivery failure is
 recoverable
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 catalin.marinas@arm.com, will@kernel.org
References: <20241203100322.1626805-1-kevin.brodsky@arm.com>
 <Z07x69L6Mssncg/7@e133380.arm.com>
 <a9aa36eb-d5c2-4d1c-bf5d-e63e4cb55404@arm.com>
 <Z08l0Q9KO6haeSSI@e133380.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z08l0Q9KO6haeSSI@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_084815_760586_090428E1 
X-CRM114-Status: GOOD (  17.89  )
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

On 03/12/2024 16:37, Dave Martin wrote:
> Hi,
>
> On Tue, Dec 03, 2024 at 04:06:24PM +0100, Kevin Brodsky wrote:
>> On 03/12/2024 12:56, Dave Martin wrote:
>>> On Tue, Dec 03, 2024 at 10:03:22AM +0000, Kevin Brodsky wrote:
>>>> [...]
>>>> @@ -1462,10 +1462,33 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
>>>>  			 struct rt_sigframe_user_layout *user, int usig)
>>>>  {
>>>>  	__sigrestore_t sigtramp;
>>>> +	int err;
>>>> +
>>>> +	if (ksig->ka.sa.sa_flags & SA_RESTORER)
>>>> +		sigtramp = ksig->ka.sa.sa_restorer;
>>>> +	else
>>>> +		sigtramp = VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
>>>> +
>>>> +	err = gcs_signal_entry(sigtramp, ksig);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	/*
>>>> +	 * We must not fail from this point onwards. We are going to update
>>>> +	 * registers, including SP, in order to invoke the signal handler. If
>>>> +	 * we failed and attempted to deliver a nested SIGSEGV to a handler
>>>> +	 * after that point, the subsequent sigreturn would end up restoring
>>>> +	 * the (partial) state for the original signal handler.
>>>> +	 */
>>> The same is true at the call site of this function; could problems
>>> creep back in there?
>> That's a fair point, I could add a short comment after the call to
>> setup_return() to clarify this.
> That would make sense.
>
> (Or refactor so that the point of no return is at a function boundary;
> but since this is a Fixes: patch, it's probably best to keep things
> simple.)

I did consider this, in fact this is what I did initially. However I
then realised that gcs_signal_entry() itself modifies thread state that
affects control flow. In other words, if it succeeds, then we are
already in a situation where failure should be avoided, so pulling it
out of setup_return() wouldn't necessarily be clearer. There may be more
operations that can fail like gcs_signal_entry() in the future, meaning
we'd have to "revert" such operations if any fails. I think it makes
sense for this to be handled in setup_return(). At least we don't need
to complicate things for now.

- Kevin

