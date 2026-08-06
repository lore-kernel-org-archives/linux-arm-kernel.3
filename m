Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F8C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bD4V/l6TaOwztjPNNJTucq6Cem66jlGJZTYeeEAXsMM=; b=Uemf+bHzDQfzB7
	1XCqnCbJ0m4oSqlXdpfNYpDwfGBftzjqYYlhJsplpxyxRROjbrGqHDhuPQkWuyEC6348/eqRAYDcV
	EVBrKKoFfanCcfgwMKRsd1hPWkxfFCHOBL4AAOExkY4cD5xiIs+qX5MJ0XAzXE4nMICWGiwTQO/qS
	ritFl/Y3btZ2aorAkQo0bHgiTi+6wiN9Du04GFeCxnI91FB3/XZ2wFO4NzzNPd86aQYfZreBaYQVB
	6eXP8mR50p3p7hOVgsmng1DuINEGyLSGVgqnHMl6J+nL5EMF41m6ASGF54cjY30nr5+b0hs0c7ppi
	Qxm9oAlg8PnOZaKwhaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry6S-00000005tOB-0xW6;
	Thu, 06 Aug 2026 13:25:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry6R-00000005tNb-2v9A
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 13:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bD4V/l6TaOwztjPNNJTucq6Cem66jlGJZTYeeEAXsMM=; b=PNKjhp+XtIJStFESKDI/ankd7W
	gmiDv9oom9gWJmHYDkDUuMD/jE2TGwuzVhjBfcAamZgSc1Wp+fzC5iCXIInaVuU4jZtCJE2C/lKh2
	I1ZsIXHy+k5w1W+0QRPZ4YE8Du+HBQsBqQ7bbGkG3UDEl+Qva1TgiRR1Oj6RflBLA4oepddn8ut7L
	9745X2zvS8Ay8ZKwGHQgnPpv7sUEPoXRfNd964M+54mVhukh9a+F+C3ZBIlu2bDhqlXx/QgOEx4TT
	E+VMuyjI4FnIJlDK7s7gLhNyNzDxZ9xfzpqR544dh/kFmv1NaWZFfJ4PDZ/Apk974CMyYyFxOI3KE
	A6IQh38w==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry6N-0000000AAJn-2PYY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:25:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1024739f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786022732; x=1786627532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bD4V/l6TaOwztjPNNJTucq6Cem66jlGJZTYeeEAXsMM=;
        b=TDjrv/o2w6hNKkcXsoi16iQyNoxTdSDAtQEWhF9C24vony8FW0zt+ccwG7N26F6DmE
         LmHTI7gyP7TZMVoyebGjokFxEsA54fWrWmSjiCLfvPqPZr/L0lpcIaQYgmnZFFmDQhT+
         UiP5GYAIpHgK/L2cDmVOyPHSkEev1H2cslmH4a4kf36hqbhfVPLrYRDnjDgqFRecRT6g
         ILcYMOiwClVwKnURf1RlaREmLeVVDuc8H6S7iM7i/uwa8JPhu7yHPG/WUSjUjemQcZes
         CVpVZm/IfCKjAktk+FSHffBSk9yvxmsE0cuyqFtTweggiBSANvlwLL+MTFGcoJOxM+9A
         dhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022732; x=1786627532;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bD4V/l6TaOwztjPNNJTucq6Cem66jlGJZTYeeEAXsMM=;
        b=KvdA4F7cTpVYtbAJniOoqTPXRxdhzJLNxCn84o2nAc0A9vzzp0yi3lzM3j3gFXXsVD
         GVoIVvzugQl+etsoDmyDbGn56DbB+0x/nZPAmnnnB3mJMQmm3hQoXJn1spusqSMGF1S6
         ccTHSX06sHzeu9NU8SrRzY5A6r5JqDdE4o5XSGdDxyrCPmPTihwS7tqksmgV72hkAefe
         hGkJD+QDl3U7EVKTIX3t0orMwM5Q0ITYLaWdza0R3WZkTTHqhHhrwIIbkkMidA29BZYA
         WOF5efj/8nXr59PQ47Wj1swOSxjAj91yT+zUktF9+X7oqPbFAdao32og1ko+LNJmhWgD
         H4Iw==
X-Forwarded-Encrypted: i=1; AHgh+RokT1eBk9H+ls65onfJ1VTj0GXwp48p/ogvVN94/zILKh6IZE8qhCKtmLFRI9zQltzIPc6ULTAhS8ZlUelQJps2@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMHmRcmFpAm5etrUUqr83Qs1pAJEJmG8P5uH0/HNRjLLmzknA
	T8XHNzkO/S+oAlMw5h/QgGVV4cuOuiRkJYMRkjwmt9nb89wbzJi9HU6g
X-Gm-Gg: AR+sD10yLuENknWx6tXi5YNhECg8XWYAt6MY1YPNq3JYrGxwJvslp7PzeKpoFIYT6Gq
	IJjUATAS02k5dcfTZAPN0ElZ0y4Wst7zjDfWyinIX4s0Cv3zrmHKC2V+iWuvJk2hV7SUa0GCy4I
	mSewl7dplLf7vJ2AA/g/5VhMXi8SM1XZOQ1d9K5XXdzgv+RbU+NJ1QiydS7pt5kKHQKZbI7dPXo
	DUSiVKbStvs0UdrRufoUWSO8+SLxfWQwwxhgS8kW1AWxXNb3vmNmsIAGtrP19boAKlDTo6PmX6a
	tmkn6Rh8aFtKy9EOmt5UAWIDN2nYdcC9Zc4FYRuenDwl/xvkMO80rjMUg4nvsgylMgfhKmyx/rn
	t3OyEWbAFcUwwlfpb2HJz9hYZr5X3eqIF4G5IJPzKBpvV733/grlPYN2H49C3zCWhKE6O0Qxjzf
	GAndkzpU1g8uZ3bRAfHToDhHrReFORrfrIyLNRJBzOv9p6DqbUFhv03b15U5xm52LOmgidBaM0W
	b1tiPgq4/mKxSYg6bBlNXKtHg==
X-Received: by 2002:a05:6000:29ce:b0:47f:7c4c:8144 with SMTP id ffacd0b85a97d-47fec523d1fmr18139537f8f.10.1786022732116;
        Thu, 06 Aug 2026 06:25:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7302sm6663653f8f.1.2026.08.06.06.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:25:31 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:25:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v2 13/20] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260806142527.0c784b42@pumpkin>
In-Reply-To: <9c3feb9d-3111-4f37-90f7-3ad3c2e094c7@kernel.org>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-14-mark.rutland@arm.com>
	<7df18d5e-886e-43d1-b53d-52a1d08aba49@kernel.org>
	<d600d0db-5109-4386-9a49-955be74cc432@kernel.org>
	<anRuT1Psmar9mW5L@J2N7QTR9R3>
	<9c3feb9d-3111-4f37-90f7-3ad3c2e094c7@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_142539_766162_5742A2B1 
X-CRM114-Status: GOOD (  23.74  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 6 Aug 2026 13:32:52 +0200
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 8/6/26 13:21, Mark Rutland wrote:
> > On Wed, Aug 05, 2026 at 08:47:08AM +0200, David Hildenbrand (Arm) wrote:  
> >> On 8/5/26 08:45, David Hildenbrand (Arm) wrote:  
> >>>
> >>> FWIW, in a recent discussion on some prototype hacking [1] we saw some overhead
> >>> in micro-benchmarks that would really hammer on a path that would now do a
> >>> preempt_disable()+preempt_enable().
> >>>
> >>> Switching from preempt_disable() to preempt_enable_no_resched() made it turn to
> >>> noise. Of course, that has other undesirable impacts, and I am not sure if we
> >>> are in the territory of code layout changes affecting the numbers.
> >>>
> >>> Just mentioning it as some data point.  
> >>
> >> [1] https://lore.kernel.org/linux-mm/20260630174852-mutt-send-email-mst@kernel.org/  
> > 
> > Thanks for the pointer.
> > 
> > IIUC in those cases you're using preempt_disable() .. preempt_enable()
> > directly, not this_cpu_*(), right?  
> 
> It was purely preempt_disable/preempt_enable experiments without any percpu stuff.

Did you check that preempt_enable() isn't likely to speculatively execute the
schedule() call.
Even if you write:
	if (unlikely(a == b))
		function();
the compiler tends to generate a forwards branch around the function call.
Since the branch is likely to be assumed 'not taken' the cpu will
speculatively execute the function.
Adding a non-empty else clause (eg an asm() comment) should get the function
call out of line and hopefully not speculatively called.

This is likely made worse because the condition is reading the full 64bits
of a location that has just had 32bits written.
This almost certainly has to wait for the write to 'drain' from the store
buffer before the read can be done from the D-cache.
(A read of the same/smaller size might be snooped from the store buffer.)

I'm not sure of the mis-predict penalty for a typical arm cpu.
I see ~20 clocks on a Zen-5 for a simple (value in register) one, here
I suspect an extra 5-10 clocks get added because of the memory accesses.

	David


> 
> > 
> > If so, patches 5 and 6 of this series [2,3] might have an impact, but I
> > wouldn't expect a significant change unless you're calling
> > preempt_enable a lot.
> > 
> > Please beware that it's not safe to use preempt_enable_no_resched()
> > UNLESS it is immediately followed by a call to schedule(). That's not
> > documented today (and I couldn't find a good reference), so more folk
> > are likely to be tempted to use it...  
> Yes, that's also why we abandoned that (including for various other reasons :) ).
> 
> preempt_enable_no_resched() helped to identify that the preempt_enable() was
> really causing the noticeable overhead, not the other minor stuff we added on
> some hot paths.
> 


