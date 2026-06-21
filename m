Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64793CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUsaj7vv5ecLJDUQ0RmLhOH3YlF5lnncSJLJl2FpGbU=; b=HWVx8nOSn/b8Exz54DST7nufRt
	fZAP/PkywyhQm+WN0bKJxZb9n6p/d7A4a4CnUXzZF8Rwh4LkD6DO9MN21VMIf7hqZxlwhRk3SlNT8
	OOuBTSxeJL7RnT8kpELZWByXeLPZbsjsUZweu3vGdh0cbVOm0mv4SNxxXFCKQK1bd5JlkWiPlVOnL
	+cbkkIFNrAltUENHeWysdol++m/qoI0YPS+Sce/WikdK/0a20VqKZGwZTlanNW8vnPimj6Ox4R8H2
	J+TS3GmA8xj9b77o8NTKaYYg4dOlmUBW1qA1EsKjSWVoWdepYPFOOiF8vbIGltzYyJOvdObafDPf7
	sKz7ENOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIOQ-00000003yI7-0Pnd;
	Sun, 21 Jun 2026 13:39:22 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbION-00000003yHj-1jRY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 13:39:20 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7dc6fbf3e86so41709627b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782049158; x=1782653958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUsaj7vv5ecLJDUQ0RmLhOH3YlF5lnncSJLJl2FpGbU=;
        b=jEPlgQqQ3W19h7Ojb5EMad39MgjyhK1x/OaQ8CIjX1tL3w5J6AcLxCZdK/EkoImLE2
         6/uTTDfn7l7MncDpV94AZpXA63QAwWGyynBMELQA2eRT1hYoBI1Mp6XjbnQplPMU/Dvp
         EzvCClclceJC3Qe/rvk7/P2+i5xNKoyWdBdc8Jf+Nn+lhIDlGTwInjG7/7/IWTY8M75L
         uFSUAJ44IUmZ+e2zuheFJwA3enstXFgVw9lQEbokPLJmd4Rae8EkZjHdAnkCtQJOFkY7
         qKY3AFFUYwhNpYO55dm0dkDEjgQ/NG2VOBQGxKzOnz9jYEznIuKt4kbpA1KkglcPdI/I
         2dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782049158; x=1782653958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsaj7vv5ecLJDUQ0RmLhOH3YlF5lnncSJLJl2FpGbU=;
        b=LN9jS5yjGy9LlanyQ8dMrbHLFD2zMtSa/4BWkXmftK0kZ3v2Szd7PuEx1zKk9osRZV
         6KkiOOVCYdwpSonRIHGIEXK/6MXqtQIyFvbyuEq5Bvp8B/7E19BrQeh/5l1jx2Tm8f5R
         AaqdCzhcv9qJflGQIxxk6bI4PjCFA8GC6D/fQBjoCdp6NGGEfKfKz1A1xmig1MA74y0R
         N/+uNnt2Gg2AhnKklnSRP+bJvzst63aQRlQzGRzGJ5fbujLi4smoAi6hIl5wu8WjQ5lJ
         aoGe0OAfNXJwKCqsydkPcJP2DJLPJ/I4Y7UZKing9axR5jcUmiVSlcJmIryobwhIMXrH
         3PJg==
X-Forwarded-Encrypted: i=1; AHgh+RrcR3ftSa0i7Kdr2AIoOFTziBpPR3ctuApM32wLVPwkZehGb836iAt2WCt3zBQ3MocxmDZ9AiwWjnZb0W42AH2q@lists.infradead.org
X-Gm-Message-State: AOJu0YyBhf978zTpHNgOLb1HiSPNfAsEzwzgRTiYrgMIzFOQsXjVoyd2
	/SZNNRIU5/KU/TJsGGYcwBWxSLyBLmNr2NZDBLtMqBMuMvAHI954biKn
X-Gm-Gg: AfdE7cmPhjHvQQPdlVLiBp+QAUPlvvx79qZfYDK4lwHjzZFkA2aX2Sq+0bvooAy6gGy
	qmerbhuqSfUCEv22y12a0RTSlEyNJxEXQeAMxQNe77uSaB3bPZJzWNBM03kq+k+7YOZX3vV+BHE
	JZjgdJgKf/MWumtt1QGeHmRkj6HuVKmBoEawhq8E2kHT8XUGLMfY904m+tb8iEx6Ry3rdskNE4J
	apJlyWmFD0Q9LVgEl9dWiVXIqiZPelITiO0vIyB++tXF02RxF1MsUKNo78MtyKgea05QXHI3+V7
	v1cflnKHW0QBIyiXYBb90Kz4SZuC0s8AZnfaThef9mo+rMVK5tv3/4B2255b7vW3owjhKkprrLr
	rbbxVYmY/OitThN0kBeU82pmGgQu2fnKRa6zGSV4z6SyMvPI2pYn1wqFTUX4D9k9lrLFbZvW2ZF
	9gIYr2wLM3w3SkWUJllRcB9x1+hMjIIGZO734=
X-Received: by 2002:a05:690c:e347:b0:7db:ccda:a409 with SMTP id 00721157ae682-801759e5070mr88778787b3.9.1782049157948;
        Sun, 21 Jun 2026 06:39:17 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025f8dde30sm20893067b3.27.2026.06.21.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:39:17 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:39:17 -0400
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <ajfphe4Z8BrfYoUX@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
 <20260621054721.7cde38f0@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621054721.7cde38f0@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_063919_483456_C8C9495E 
X-CRM114-Status: GOOD (  24.54  )
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

On Sun, Jun 21, 2026 at 05:47:21AM -0400, Steven Rostedt wrote:
> On Sun, 21 Jun 2026 05:34:32 -0400
> Steven Rostedt <rostedt@kernel.org> wrote:
> 
> > Instead of having trace_printk.h included in kernel.h, create a config
> > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > Makefile to allow developers to add trace_printk() without the need to add
> > the include for it. Having it included in the Makefile keeps it from being
> > in the dependency chain and it will not waste extra CPU cycles for those
> > building the kernel without using trace_printk.
> 
> Bah, I only tested with the config option enabled, and missed some
> dependencies with it disabled.

Yes you did.
 
> For instance, rcu.h also uses ftrace_dump() so that too needs to go
> into kernel.h.

No, it shouldn't.

> I also need to add a few more includes to trace_printk.h.

> OK, I need to run this through all my tests to find where else I missed
> adding the includes. But the idea should hopefully satisfy everyone.

If you include it under config in kernel.h, to make the kernel buildable,
you need to include trace_printk.h explicitly where it's actually used.
IOW, apply my patch v4-7.

Then, developers who use trace_printk() on their development machine,
will be really frustrated when their debugging code will break client
build just because CONFIG_TRACE_PRINTK_DEBUGGING is disabled there.
They will spend a day, at best, communicating with remote managers,
and end up with adding #include <linux/trace_printk.h> in the files
they touch. Is that your plan?

If I was one of those developers, the solution would be simple for me:
don't use trace_printk() at all.

Thanks,
Yury

