Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DE9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cbck0pzfqNKYOgjwdn6Kg8XWhgYfnZCyGqXoB6xeks=; b=iKQnY9QVlGfi7DkXoMkksC6bPL
	T7mNN+bnQbstet++QEdPE85UKocTgNYzG9mVdOtP68v1AvcOIVX5rMeNNsQh+gJ3Kd/quuKbIwxPD
	9Yoy2kM552MrFtMMQBJiS8dEpQLtsdi+RMmBgDsdduNhhuIPckdnmOQkYTBCOePWZajKAsY4sP2OA
	jr8jCxd41c19pqaUIkFVM5Y/aAFvR1nk1abhXrFpW+tOJhndxa+tZgawj53n5XHA6+1+6jWVj0OET
	JlPysLyAmoc4HYKRHsj5U4suul00fk6VraspLjmCI8cGn4Md3jY3+FVaJ44+BkRWfoKgr7xhlzDw7
	WKcJo7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmdW-000000016St-14nP;
	Thu, 12 Dec 2024 17:06:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlct-00000000s7L-2sz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:01:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA9B1762;
	Thu, 12 Dec 2024 08:01:45 -0800 (PST)
Received: from [10.57.69.209] (unknown [10.57.69.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0753F720;
	Thu, 12 Dec 2024 08:01:15 -0800 (PST)
Message-ID: <adf75d67-e665-47c7-a0de-9bfdf5406d40@arm.com>
Date: Thu, 12 Dec 2024 17:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 catalin.marinas@arm.com, will@kernel.org
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
 <Z1r0zO3BrYrt1xNY@e133380.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z1r0zO3BrYrt1xNY@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080119_772593_46814365 
X-CRM114-Status: GOOD (  14.77  )
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

On 12/12/2024 15:35, Dave Martin wrote:
> Hi,
>
> On Tue, Dec 10, 2024 at 04:09:40PM +0000, Kevin Brodsky wrote:
>> Commit eaf62ce1563b ("arm64/signal: Set up and restore the GCS
>> context for signal handlers") introduced a potential failure point
>> at the end of setup_return(). This is unfortunate as it is too late
>> to deliver a SIGSEGV: if that SIGSEGV is handled, the subsequent
>> sigreturn will end up returning to the original handler, which is
>> not the intention (since we failed to deliver that signal).
>>
>> Make sure this does not happen by calling gcs_signal_entry()
>> at the very beginning of setup_return(), and add a comment just
>> after to discourage error cases being introduced from that point
>> onwards.
>>
>> While at it, also take care of copy_siginfo_to_user(): since it may
>> fail, we shouldn't be calling it after setup_return() either. Call
>> it before setup_return() instead, and move the setting of X1/X2
>> inside setup_return() where it belongs (after the "point of no
>> failure").
>>
>> Background: the first part of setup_rt_frame(), including
>> setup_sigframe(), has no impact on the execution of the interrupted
>> thread. The signal frame is written to the stack, but the stack
>> pointer remains unchanged. Failure at this stage can be recovered by
>> a SIGSEGV handler, and sigreturn will restore the original context,
>> at the point where the original signal occurred. On the other hand,
>> once setup_return() has updated registers including SP, the thread's
>> control flow has been modified and we must deliver the original
>> signal.
>>
>> Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> v1..v2:
>> * Added a short comment in setup_rt_frame() after the call to
>>   setup_return() to discourage adding failure points there.
>>   [Dave's suggestion]
> Assuming that this was the only change, I was OK for you to add:
>
> Reviewed-by: Dave Martin <Dave.Martin@arm.com>

Apologies, forgot to add it, thanks for the reminder!

- Kevin

