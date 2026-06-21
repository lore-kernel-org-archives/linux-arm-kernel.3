Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B291DCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=; b=b4NgIcQY2Okwa/IyteRg1gXjmH
	5MSDCVVdxHw0kmt3Fu5WkIfkvbVJi6cCfoQHRoa+9vbRjQGamO83TQNmj8Mgj9KbAVIjyxSsnPKTz
	fQFnixCak1V8gOmnGhA1nJBlChlJSMK6mVRMd7tWfcBnwuVPt475jzs9saApQESQoPnSU4r6dxWvA
	Y5LgbH5HQkwHoFb7vaZkSGYNhSLq4E2ux1/vJfhEKOVZLO067FAytFH/pIV9WRNJT/iPxIUC7w0vL
	dnHGtj0DH+zpBtVkFa4hUtoyxd9ItVbMB+l7/vbFP7KwXtI1yH1THyNx4KcmgWCfD8I2wc3OW8K6n
	K+Ce1ELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIfe-00000003yq5-21ze;
	Sun, 21 Jun 2026 13:57:10 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIfb-00000003ypd-2UKv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 13:57:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7fdeab38240so30526887b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782050226; x=1782655026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
        b=V2AZ8aPsl8c3ifYbmx5O2Dz4PX4n5Cqi3DNbO/TMW3nQymSmIVJw5xTCVYLxEECYgm
         sxlShhp33GieKv23XKWLiJfwWGrXseLHcH37gdLJjPj0jER+pbXZqNeOKzJ3s+6z/3Y6
         h6EzsNX+9+7tvxAMJSydJzNURMcO9kgmhOKvHn+Qw620q/YsE9fUGwAuooTipOebaRls
         bofvob7qBLcE5t2Id4wrPLC13KTtq1yM+Y6FtyOk0RCFr22kkTzVs0wnOCOCzyPMzAZA
         wC/dZ0IqMnFIQtaNKW56V6BsfIe+5ZCPKexUWhuOO0W6970M48QKLsFr7GS237jmINqN
         BHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782050226; x=1782655026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
        b=BoT2nLAU7ulF4Fud1mJjHtTTbyM1Y5VDRGKB4g49yYEXAKaApUnUDuf0DIbRcWckgT
         6NR7qQFkYUn4Vj4IbWtLug/99ZAj+9QjrmJQ23q3BBCiaXFnSpUornMZVepee3kMYj/R
         TDi5lrqSummn42R6qg+6cKQjqXeWBdJhi6merL/uu0Jg59IRapxxiojVk7MfdEy72+3s
         zpq9o0bBPnW6oNJfauUa5OqPL+wD0lW9krjGse4wiAmAVku9q986RFFWTm0d1QFKHRV5
         5Rbe1X2htWZ7Q3E1ejVPwKXNH8IPKdXMmw4xf5aBtQoQL8Dkyv8u2wH1VLAC93v1ndwY
         UYUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt70WT8UGb69q+a5iGEuC+wXwLg/OqycsagLlWXYPxxuG+DrPRHslB9U/n4F24nM5zs/7G6SDVlgC3b4bQSWQi@lists.infradead.org
X-Gm-Message-State: AOJu0YzNad7I+EjtVP7lDn3sDqvY8nC/2jL0SNK0dby9A49MsG1+8dxM
	Ztw/LxlY2FfYNDm1nslDwLIO1A/tdww3V0Bw6YQjGYU7dNxBIVhp+CVk
X-Gm-Gg: AfdE7cmRmpoyiKLj9l2fPxl0lvy+ftmmZCREFy2hkk69UUy5ahge1GYAmiYQJpR6kIT
	3HXcE07JGJe7s4r5c2PE/IU5CH16RNC3sXo3Kx16yXj3hrt2isZbrMsA/oOBHEmqyzlBw9MrdM0
	hzrPqZnbHdW4aTTIefNpELLyNQEifzUmfvrzalbT0UpUvUzKgOdmtHWWFMxNDHFT7AWCOShTG8M
	bfxEsvPdqX7Cy9Z7WE15BKbMbQsSllELHUfnsT8Xi+cTg+EwpEw9O4LaTIXGLHBj75LU2mfU1Bi
	IlHLj72umSVTwfJn64T5JbZtri53hnVy/sKt2sFzzT4nrbHE6fv4ohg1ZKt0Ls3bplXrxNB1QCO
	hGrKkunB9zG0iSIWFbyU5dqn8o1ADTiznJEsSOjgNVdllU/duawW0pjbmG1vIkdRH2PD0jxO+yC
	wNu8pss18mx19fAG1ZjqUT5ydGTYysxpClAwE=
X-Received: by 2002:a05:690c:4b8b:b0:7c5:f6c:d311 with SMTP id 00721157ae682-80131d97bdamr100779827b3.13.1782050226417;
        Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96fdb3sm21073127b3.1.2026.06.21.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:57:05 -0400
To: Yury Norov <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <ajftsRwe19fPTP1r@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
 <20260621054721.7cde38f0@fedora>
 <ajfphe4Z8BrfYoUX@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajfphe4Z8BrfYoUX@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_065707_688633_CCA758FC 
X-CRM114-Status: GOOD (  31.58  )
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

On Sun, Jun 21, 2026 at 09:39:17AM -0400, Yury Norov wrote:
> On Sun, Jun 21, 2026 at 05:47:21AM -0400, Steven Rostedt wrote:
> > On Sun, 21 Jun 2026 05:34:32 -0400
> > Steven Rostedt <rostedt@kernel.org> wrote:
> > 
> > > Instead of having trace_printk.h included in kernel.h, create a config
> > > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > > Makefile to allow developers to add trace_printk() without the need to add
> > > the include for it. Having it included in the Makefile keeps it from being
> > > in the dependency chain and it will not waste extra CPU cycles for those
> > > building the kernel without using trace_printk.
> > 
> > Bah, I only tested with the config option enabled, and missed some
> > dependencies with it disabled.
> 
> Yes you did.
>  
> > For instance, rcu.h also uses ftrace_dump() so that too needs to go
> > into kernel.h.
> 
> No, it shouldn't.
> 
> > I also need to add a few more includes to trace_printk.h.
> 
> > OK, I need to run this through all my tests to find where else I missed
> > adding the includes. But the idea should hopefully satisfy everyone.
> 
> If you include it under config in kernel.h, to make the kernel buildable,

I mean: in kernel.h or in Makefile.

> you need to include trace_printk.h explicitly where it's actually used.
> IOW, apply my patch v4-7.
> 
> Then, developers who use trace_printk() on their development machine,
> will be really frustrated when their debugging code will break client
> build just because CONFIG_TRACE_PRINTK_DEBUGGING is disabled there.
> They will spend a day, at best, communicating with remote managers,
> and end up with adding #include <linux/trace_printk.h> in the files
> they touch. Is that your plan?
> 
> If I was one of those developers, the solution would be simple for me:
> don't use trace_printk() at all.
> 
> Thanks,
> Yury

