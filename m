Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB845C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwCwkaALx2RQ9ZaH/h+nouISHRvT7NoTfQV+AbC1Uas=; b=bQrzFuhZ2xuhy9sxLMyfFHrZ+Y
	FTxRfULMWCvrjmBMcMNvrkSTYJxyoBPMxGdOAxiMuKUF3083VwB/fQXSs8G3CzRRE7i4TqXmwIW8t
	x5ppuFVN16kw3ryT/M6decsDzgEQ++FUWq+rHMtGR9RVuczDkINlKylszFyIqNM4diZWxNd8q2WpV
	h+nG+jwnY2lgYXgDjiYBwiIHRhSBxQsUrfupQ0rOe8H4nnflsx9idmxJFbBgkVH5h4o+BQakghyhZ
	3hb2du34ukfwclL4qoNNr1JEUXObCsc7kJfVhX1iLq/w1gq0W2+aEiEApp32qTE4//q4x45PPMzTF
	f31nok5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYBW-0000000Ayy3-0i6a;
	Thu, 13 Feb 2025 12:19:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYA5-0000000AynN-2ZEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90125A41F8A;
	Thu, 13 Feb 2025 12:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83458C4CED1;
	Thu, 13 Feb 2025 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739449064;
	bh=8JAGRpkkF4BFORpO2ZXJZWdxCcVAaj9LxZ7dG60lCKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvfBdKMjTF6yHhtWWJnipKdieoFAS1iI18bQ0krXYEafFa6Qci2NgBx/+El86NP/f
	 w72sM+X3TUAr/B22Yl8YxF1/Dz6GxUlqkHllYQajGxy+3TbY6IQvJVyN/ivLdwSCIr
	 UAbhuT4kRx7F7XudHWeLYscCY90UJas9N25Lbi5PVNfH5xSoPnyKrIr2eOzMVPmCq5
	 IC1ZVeWkFHBP255v/9lk1d6GqFXRWM93ubR7asVl6wYLzHvqMZuQrJGZcyZ5y1sPG9
	 6+JsvXU62+8aO3S1m60CM1zVgXzZKGkboNdqWSRPdr7gySmja6AF1Od0X29IeOhSg7
	 ecQiItnBhlstg==
Date: Thu, 13 Feb 2025 12:17:40 +0000
From: Will Deacon <will@kernel.org>
To: Junlong li <zhuizhuhaomeng@gmail.com>
Cc: oleg@redhat.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ptrace: Fix error handling in
 ptrace_hbp_get_initialised_bp
Message-ID: <20250213121738.GA11596@willie-the-truck>
References: <CAN5X4L9L2ught_h4M3_oe_aTMALki6nJPh9M-3KmdDx6WswffQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN5X4L9L2ught_h4M3_oe_aTMALki6nJPh9M-3KmdDx6WswffQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_041745_718925_60E0A395 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, Feb 12, 2025 at 07:35:46PM +0800, Junlong li wrote:
>    From b824aece318ed38666621610af7807e70831f964 Mon Sep 17 00:00:00 2001
>    From: lijunlong <[1]lijunlong@openresty.com>
>    Date: Wed, 12 Feb 2025 19:15:46 +0800
>    Subject: [PATCH] ptrace: Fix error handling in
>    ptrace_hbp_get_initialised_bp
> 
>    The function ptrace_hbp_get_event() returns ERR_PTR(-EINVAL) on error,
>    but ptrace_hbp_get_initialised_bp() was checking for NULL instead of
>    using IS_ERR(). This could lead to incorrect error handling and
>    potential issues when trying to create a new breakpoint event.

Can you please give an example of how this goes wrong?

>    Change the condition from:
>        if (!bp)
>    to:
>        if (IS_ERR(bp))
> 
>    This ensures proper error checking and maintains consistency with
>    the error handling mechanism used by ptrace_hbp_get_event().
> 
>    Signed-off-by: lijunlong [2]zhuizhuhaomeng@gmail.com
>    ---
>     arch/arm64/kernel/ptrace.c | 2 +-
>     1 file changed, 1 insertion(+), 1 deletion(-)
> 
>    diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>    index 0d022599eb61..3bf549b540b1 100644
>    --- a/arch/arm64/kernel/ptrace.c
>    +++ b/arch/arm64/kernel/ptrace.c
>    @@ -414,7 +414,7 @@ static struct perf_event
>    *ptrace_hbp_get_initialised_bp(unsigned int note_type,
>     {
>            struct perf_event *bp = ptrace_hbp_get_event(note_type, tsk, idx);
>     
>    -       if (!bp)
>    +       if (IS_ERR(bp))
>                    bp = ptrace_hbp_create(note_type, tsk, idx);

I think this change actually causes a problem.

In the current code, ptrace_hbp_get_event() can return:

 - An error if the note type is unknown or the index is out-of-bounds
 - NULL if the relevant breakpoint has not yet been created
 - The breakpoint pointer if it exists

So, in the case of getting NULL back, we lazily create the breakpoint.

Is it pretty? Hell no! But I'm not entirely sure it's broken, either.

Will

