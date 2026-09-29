Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACD5CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=; b=Y7NXFQjaPCWlDafOgx/JIEv0K3
	MoUJlmgBn+BS/byAwOMhCIhq0vjz1gqQsgMO24vtRhDl1iNrTZydOiJd8OlemQAuaOGn/kYi9FjI8
	vbBcbg7nsT192+F6i6jpF+DiSo99xamxosyCrFzXZtqGE8Cqj0vssHLdNmnJZD0I+plEkBy5vFKw4
	8NM9PvNKfcr5zQjqaPAUOGc8/akCHdf/w/5IMlsPGG6BrqrnDeCAyOMxcsyX5UlUUatI5wpnuDlmr
	WwEQR8e6r2aru9zsSus8BFWZj9baDCQFFEFfK1rW10nLF3djrFEQsgCdObqEb3MoBgxu5+KQkzkmy
	lGegRhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV3j-000000039lC-0v4S;
	Tue, 29 Sep 2026 10:27:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV3g-000000039ke-3jWi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=; b=hL9XvY0FJMbuoX0lw9bTPigN2S
	/n3QQr3MK6KZEGPlI5I6Jw8ynogu3YceVkrsNwnOuIrWqXCHtLOgsCxujyVbHodriDyuWT2HydU3x
	C2916uMjpcrIk5gkEQor5zUVCq0f7akHuMFkiSfdNOGMZaqDbXkoCBAHLXxrG4SHPNoD6XdseG3Hg
	K2iQPG+aYk3aERX32x3FDI4XDlXqAY7lQ6fHFFKOoNJkGF1R2Tj7XbLGT4fWW9Z+hNgAeU1PDIa8w
	gjTxMVhWFfsobP/MKzDnNYFPZ1igVszpeRtBJsEqH+kTTOmprGSkM6e7NR4uy1C4U0r5h9XYOk+fM
	qrgu1h4g==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBV3d-00000002Ti0-3qBh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:27:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a0061bf0d3so33645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790677651; x=1791282451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=s/y93EjsL6OWoD73X/TxJuNUS+aNF+IDat7asASYZaZWnBN/UKvDijnUUKT+CZRImu
         MpePhOhXQtVZPMQ9zYW071O+7Nxpa5ksFrqn4DCJqNVGB0EjR+HTTdkCU+yy6RlVxBWl
         DkG6QJ0ddC2R4G8E/JPHbySrKPaNWILOHXIUUnUcjmRrXFrzE+91LBxi8VHiGZC6FFeC
         XICrmM4aVKVqzfXWGsod6JQoNgDk0kL2gXIohB1+3t+ma8HMSAZ1t4kWkGrPBGflRBmP
         hnqGRey6jNn5NKhuslFVx0OQTI0H4UYW9ggH6Ac8I2FV4BXXuDN8LEmxoVFm2eQrsU5u
         4bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677651; x=1791282451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=B8LkB1+Gif96X/tzl9JXTxK4LSZQ2YJhtLFW8hVOb1XHs9LV6Y5YNAsLXbV53t2zsa
         XJmSm1f6P1/OTVzDJOmiYLDSYXwbpN/+odaeTc8Crb+Gfmmiav4VJPgAUqp20/2w1Ujy
         GHKibFoXUc3SQOQHAzhjubTOihXlZ8xF3/umj+na11TW9SLixdez19RZXUdyr0QEy2mC
         G2FzA7hQRlGB1A7trQ5pXaQMwro5uc3xsvO3AsP5URGr5awkEI6PsXbHTehBQ+r5XUH1
         1SIk9C7ln5ep3D8GzHKzQhAduyR4PWjKcnaZtIBywSdTbe6ZAGI6oWEaA82vqJixdUi8
         BNig==
X-Forwarded-Encrypted: i=1; AKwUvBxn/UI4m39CyIhh/eyo1FSwM/2WfTePg2MZBerdH80GN+g2LtXDU4zHPG9P4Bd497SPtQ8xIdiMJGG3dore+Fon@lists.infradead.org
X-Gm-Message-State: AFuF++mjP54PiOC3ypMw2klPtQlXPvp2oBtPKHZXnRLKIFhckrPQBCPJ
	kIJN8Kk1s9mIqEnCwJ/5bEj+iWfRgfgC0LQ8+OCKBWHt412lWTYjx6VN9oGDQT13Hw==
X-Gm-Gg: AYBFou0CpC5u9shkTyDNqUvsnETI/uwTzRCHAJr0xlXI2WdWRTN59JQFreFAJk4dXIR
	Q0PC0+Ka3yf/Qw+mUsT2blRL7dFHQfp0ovA8lEz1LV1CJSNIUOT/lyK4KYGEJ2AABHQEst1aXrA
	40Wz2gONj4uBJ0C3UCFWO7dfv2eXkOISBdJh2MRIBsML9xTupTWgmXNU8rYCx7COu0fHycdTGcD
	ngQCEZM4hw//u3Ef50UVRp0k2hOBin/d42+qE/MRVbTw4kD3zcjadbfpNb8xiQ7Zxp6IpYZNgxd
	lKdbL1HLvsKbRaUBRT50EnuMpFW8oaHK8gjQO0eph9T7RZpqyvr6qwOmo0mEfNtj2E3opAMgMeb
	n79Yr3yC8PkKFiZsYTEAySkRD7lNoV3vRC6NVOR3alDGKZjDz5fQc/B4vYkDluiW2bsI0S40h9d
	rFNYvI1H6wykobkwt+iyRFNe84RVur3hiirwVLPq/Vrfxar/Sv8YheQJeEAt60Pd8fdAC/qxmAo
	MwC7gKw3R51LVDE+GYlG7ldVnDaDRT60YNXmoXA
X-Received: by 2002:a7b:c7d0:0:b0:49f:e312:54ea with SMTP id 5b1f17b1804b1-4a00f46d761mr379975e9.12.1790677650115;
        Tue, 29 Sep 2026 03:27:30 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm103565205e9.2.2026.09.29.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:27:29 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:27:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org,
	urezki@gmail.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	kees@kernel.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, gustavoars@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org
Subject: Re: [RFC PATCH 12/15] sched/task_stack: Introduce
 ARCH_HAS_VARIABLE_STACK_SIZE
Message-ID: <aruShxHCUWEHr4i1@google.com>
References: <20260928174122.3380703-1-smostafa@google.com>
 <20260928174122.3380703-13-smostafa@google.com>
 <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112734_181330_6EF73810 
X-CRM114-Status: GOOD (  31.65  )
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

On Mon, Sep 28, 2026 at 01:37:37PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/28/26 10:41 AM, Mostafa Saleh wrote:
> > When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, the kernel stack
> > may not be fully populated with the THREAD_SIZE virtual area.
> > 
> > Teach task_stack_size() to return the size of the vm area and not a
> > fixed size.
> > 
> > This propagates to end_of_stack() which makes functions like
> > stack_not_used() and set_task_stack_end_magic() to use the lowest
> > valid stack address instead of THREAD_SIZE which would cause data
> > aborts.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/Kconfig                     | 10 ++++++++++
> >  include/linux/sched/task_stack.h |  5 +++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 45c657772362..d6fa2ccb0599 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -431,6 +431,16 @@ config HAVE_ASM_MODVERSIONS
> >  	  <asm/asm-prototypes.h> to support the module versioning for symbols
> >  	  exported from assembly code.
> >  
> > +config ARCH_HAS_VARIABLE_STACK_SIZE
> > +	bool
> > +	depends on VMAP_STACK
> > +	depends on !STACK_GROWSUP
> > +	depends on THREAD_INFO_IN_TASK
> > +	help
> > +	  An arch should select this if it supports dynamically configuring the
> > +	  kernel stack size.
> > +	  For example the kernel stack size can be from the command line.
> 
> 	                                    can be set from the command line.
> ?
> 

I will fix it in v2.

Thanks,
Mostafa

> > +
> >  config HAVE_REGS_AND_STACK_ACCESS_API
> >  	bool
> >  	help
> > diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
> > index 4a808f9c4631..07d73adaecd1 100644
> > --- a/include/linux/sched/task_stack.h
> > +++ b/include/linux/sched/task_stack.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/magic.h>
> >  #include <linux/refcount.h>
> >  #include <linux/kasan.h>
> > +#include <linux/vmalloc.h>
> >  
> >  #ifdef CONFIG_THREAD_INFO_IN_TASK
> >  
> > @@ -96,6 +97,10 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
> >   */
> >  static __always_inline unsigned long task_stack_size(const struct task_struct *task)
> >  {
> > +#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
> > +	if (task->stack_vm_area)
> > +		return task->stack_vm_area->nr_pages * PAGE_SIZE;
> > +#endif
> >  	return THREAD_SIZE;
> >  }
> >  
> 
> -- 
> ~Randy
> 

