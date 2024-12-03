Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B9E64AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNLP9eLhojQC88qp2LK3ww/TK8pltUy8qFda5EwnphM=; b=OKHPyj5tPuJ7Ydagi3jCjpCCle
	1IvGqqcn8cSRL7UI4t1IsLTUX6KDC/rHzxw5GXmrO/hwT4YRCQApj27K8rvrB6Bci8bB/Ow1a4/fM
	6gbc45Kkf57Js02s95nJWo4b4JE+vpNHQDfMkALAhm1+v0Ghzg4ewZP/Dqyfwh/LxkgV5N2xGrH+N
	5MNSBOtyU928/lOD4oyafPitU+Ac0qz0NojJb7b1Jo03IFp7hYEkDqslJM8OhjLu/JukEIGT+zZkI
	tLOFqlaTz5gH61GGA0jwpky0bmqR0r4OL0DQi7snUurlnnPDgpIZaLB4MWAMunxw86E7JI780F4mv
	kfv8XQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUUr-00000009s8V-1hkI;
	Tue, 03 Dec 2024 15:07:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUTs-00000009s1R-0zyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:06:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5BDFEC;
	Tue,  3 Dec 2024 07:06:54 -0800 (PST)
Received: from [10.57.68.85] (unknown [10.57.68.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F172A3F71E;
	Tue,  3 Dec 2024 07:06:25 -0800 (PST)
Message-ID: <a9aa36eb-d5c2-4d1c-bf5d-e63e4cb55404@arm.com>
Date: Tue, 3 Dec 2024 16:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: signal: Ensure signal delivery failure is
 recoverable
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 catalin.marinas@arm.com, will@kernel.org
References: <20241203100322.1626805-1-kevin.brodsky@arm.com>
 <Z07x69L6Mssncg/7@e133380.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z07x69L6Mssncg/7@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_070628_327860_4ABB9AD0 
X-CRM114-Status: GOOD (  17.60  )
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

On 03/12/2024 12:56, Dave Martin wrote:
> On Tue, Dec 03, 2024 at 10:03:22AM +0000, Kevin Brodsky wrote:
>> [...]
>> @@ -1462,10 +1462,33 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
>>  			 struct rt_sigframe_user_layout *user, int usig)
>>  {
>>  	__sigrestore_t sigtramp;
>> +	int err;
>> +
>> +	if (ksig->ka.sa.sa_flags & SA_RESTORER)
>> +		sigtramp = ksig->ka.sa.sa_restorer;
>> +	else
>> +		sigtramp = VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
>> +
>> +	err = gcs_signal_entry(sigtramp, ksig);
>> +	if (err)
>> +		return err;
>> +
>> +	/*
>> +	 * We must not fail from this point onwards. We are going to update
>> +	 * registers, including SP, in order to invoke the signal handler. If
>> +	 * we failed and attempted to deliver a nested SIGSEGV to a handler
>> +	 * after that point, the subsequent sigreturn would end up restoring
>> +	 * the (partial) state for the original signal handler.
>> +	 */
> The same is true at the call site of this function; could problems
> creep back in there?

That's a fair point, I could add a short comment after the call to
setup_return() to clarify this.

>>  
>>  	regs->regs[0] = usig;
>> +	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
>> +		regs->regs[1] = (unsigned long)&user->sigframe->info;
>> +		regs->regs[2] = (unsigned long)&user->sigframe->uc;
> Nit: This looks like it should work, but it's not really anything to do
> with setting up how the handler returns (we're in setup_return() here).

setup_return() is a bit of a misnomer, unless you interpret "return" as
"return to userspace". Aside from setting LR, setup_return() isn't about
how the handler returns but simply how it is invoked. For instance the
line just above sets X0 to the signal number, the first argument of the
handler. Setting X1/X2 here seems pretty natural (they're also arguments
for the handler).

- Kevin

