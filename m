Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D4CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50SfSxS4nKgs8hxb+bOC3hzEIaH0AgAoPcaR+jSb2yk=; b=w/+vKC068gk9heOPllTSJX4XqA
	UKoHqT7DNdp37anoiMyZ6A+UN4bg7X1+za8dvbbhsgWg+Hkrg43h2oET9//+883bRSnb42bOa3BEY
	DBJY/BzN6K7NFKsBAXwSyNAHwcTaczZeiCNmvFwajwFVKDwL+TEOr9HBLXev+B8Jy79nLg1RdcOh7
	db6wDwRmHZ6cfnkCHf4cH71u/tbCzXeZTEHqCFCEzatsC2t/32hoJnwdBbssBB8+l9JNdhau0g70B
	EcSk+JCfVyLaQutCak0HawWS5toaRBu62aUIXhIN40gxC5ck1WYuR0GwA6NfXodNaXkYKhOcKulUt
	z/q1KAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxVf-00000006ndt-0YhM;
	Thu, 23 Oct 2025 15:45:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxVc-00000006ncs-35LU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761234346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50SfSxS4nKgs8hxb+bOC3hzEIaH0AgAoPcaR+jSb2yk=;
	b=ZedjYDZp1IFEy1Azf72R8spjexepm0UyKY4hiC9MaNrUMfHkoT22XiR7QnTQHZ0yML1GQS
	TQNQqFFCOqElgqs2xMEoLO8+rUnnYBzQ7+YydbSEECAsgkiMANjdSWLprEvyyJgToyqubI
	BZ0LvoHvPRr4cSeV9LSKxhnHzfMonFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-5i4ZTAB-PgCy0O0aRO1xwA-1; Thu, 23 Oct 2025 11:45:45 -0400
X-MC-Unique: 5i4ZTAB-PgCy0O0aRO1xwA-1
X-Mimecast-MFC-AGG-ID: 5i4ZTAB-PgCy0O0aRO1xwA_1761234343
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471125c8bc1so13218685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234343; x=1761839143;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50SfSxS4nKgs8hxb+bOC3hzEIaH0AgAoPcaR+jSb2yk=;
        b=eLb4jLgSd5ozp+XIpKtY5mLs1e9PU/kCTq3Cz6VD98gWBPdZmL+ylkpXgFQV6uFK0V
         l7M6wU7SpJSUIijU4dkBUCEQgiUhTn+UEzLa+/4qWQvcRKyxcnSoB6MSXFJKIsDH2APo
         1qgy8KB2APTa8c1Wojizce2m/infCbXBdeD1LMtVjCySCPgaWJ78rdf9Ndy7sQzmEU3X
         Knu65WklyGG0hp+f44RYZq8hO3XwaE3w7yPWIdYxB22O0Ux/hGblY++a6CadFYQ+4Olc
         U46S8HSVYkCv2kFsJyu449EjBDX9xpGeRQv2tQGP/DmblbFxblr2OPZs+WnAUtkiiccK
         N8XA==
X-Forwarded-Encrypted: i=1; AJvYcCX8oSyl5A9ZJqGLCmCwlm5vMFlwM3TOHMjxIuDKq2nFHYjJ7vJAvT0TwGkhAZeN8mFHEVV9BC8mlJP5gc6+ArdJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyaF86hWOJ+DvCx62/BibOK/krSXSwuYc2QtOZE3Y0WbRb7tGmJ
	P/7D1XfwvhCPkgunFu4zNlFPYtIATuTpNy+LnYXkFvJz0F3U/6vMuF+5P0jHhCIEGZvXlqqRtEL
	5k3c9coLPdd4bOAVAdmMQoeu0ZBdKb090vIPFTrmXpV7AaBrr5hX5MlQ+YtGo/pn3EAvDrFMN8f
	pK
X-Gm-Gg: ASbGncv5avfc37SNJhqd30h2oBNXpa8Aoi4l2knl9ONee4V3+FG1Ew39tumgMQK9nhZ
	lIb0gD8xCJ8y9mgBfd3jnHKbBf0GPfnQ+nmutkGFkZ1gMOfgd2jeiYu5jQZCnWuMuRQF0tg1uF2
	FvQT6bYjvD9XwPf/mXio2Me7p7xc+6klBbDJqjhogczoMDrR0D79yFV0CZ1ih3F4EQNRhWarbFK
	OpnKM4RkJNVqCLORxoaJWDUxkLa9zUluWOIH+VCl4bUk4kTw7fpLUega68D4P4fx9cK98q2xpnQ
	n1jqxF1MXDw2hp+iSQnHIDnYqxs8ddgYFQfJ3Q/aO1jk/m3P8aPyDbaGuhQIPCbymdwAcQ3RR0J
	O8Zk3ix8+r22csWGB7NhI5HZYLNQ1ZzdrLFrEg/pBCLq1X5xuFjNDrz6k4z0Z
X-Received: by 2002:a05:600c:548a:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4711787a2cdmr173963635e9.12.1761234342942;
        Thu, 23 Oct 2025 08:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENvjJfnRqlEPVbQJG/5+2SRFe/+XvUSWY4e9vS8wIYZ+gnFtpWxD3L8rMa8r5ek+Ptfbuv2w==
X-Received: by 2002:a05:600c:548a:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4711787a2cdmr173963305e9.12.1761234342435;
        Thu, 23 Oct 2025 08:45:42 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cad4c81dsm44883515e9.0.2025.10.23.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:45:41 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Michal =?utf-8?Q?Koutn?=
 =?utf-8?Q?=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Gabriele Monaco
 <gmonaco@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, Lai
 Jiangshan <jiangshanlai@gmail.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>, Muchun Song
 <muchun.song@linux.dev>, Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>, Tejun Heo
 <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka
 <vbabka@suse.cz>, Waiman Long <longman@redhat.com>, Will Deacon
 <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 05/33] sched/isolation: Save boot defined domain flags
In-Reply-To: <20251013203146.10162-6-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-6-frederic@kernel.org>
Date: Thu, 23 Oct 2025 17:45:40 +0200
Message-ID: <xhsmhecqtoc4b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _zZwnrRfIsDe186tkcsFD9kQS3fZXpNW9uTtVZYKi8E_1761234343
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_084548_868572_6510CFCB 
X-CRM114-Status: GOOD (  20.66  )
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

On 13/10/25 22:31, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
> but also cpuset isolated partitions.
>
> Housekeeping still needs a way to record what was initially passed
> to isolcpus= in order to keep these CPUs isolated after a cpuset
> isolated partition is modified or destroyed while containing some of
> them.
>
> Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Phil Auld <pauld@redhat.com>
> ---
>  include/linux/sched/isolation.h | 1 +
>  kernel/sched/isolation.c        | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index d8501f4709b5..da22b038942a 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -7,6 +7,7 @@
>  #include <linux/tick.h>
>
>  enum hk_type {
> +	HK_TYPE_DOMAIN_BOOT,
>       HK_TYPE_DOMAIN,
>       HK_TYPE_MANAGED_IRQ,
>       HK_TYPE_KERNEL_NOISE,
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index a4cf17b1fab0..8690fb705089 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -11,6 +11,7 @@
>  #include "sched.h"
>
>  enum hk_flags {
> +	HK_FLAG_DOMAIN_BOOT	= BIT(HK_TYPE_DOMAIN_BOOT),
>       HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
>       HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
>       HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
> @@ -216,7 +217,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
>
>               if (!strncmp(str, "domain,", 7)) {
>                       str += 7;
> -			flags |= HK_FLAG_DOMAIN;
> +			flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
>                       continue;
>               }
>
> @@ -246,7 +247,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
>
>       /* Default behaviour for isolcpus without flags */
>       if (!flags)
> -		flags |= HK_FLAG_DOMAIN;
> +		flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;

I got stupidly confused by the cpumask_andnot() used later on since these
are housekeeping cpumasks and not isolated ones; AFAICT HK_FLAG_DOMAIN_BOOT
is meant to be a superset of HK_FLAG_DOMAIN - or, put in a way my brain
comprehends, NOT(HK_FLAG_DOMAIN) (i.e. runtime isolated cpumask) is a
superset of NOT(HK_FLAG_DOMAIN_BOOT) (i.e. boottime isolated cpumask),
thus the final shape of cpu_is_isolated() makes sense:

  static inline bool cpu_is_isolated(int cpu)
  {
          return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN);
  }

Could we document that to make it a bit more explicit? Maybe something like

  enum hk_type {
        /* Set at boot-time via the isolcpus= cmdline argument */
        HK_TYPE_DOMAIN_BOOT,
        /*
         * Updated at runtime via isolated cpusets; strict subset of
         * HK_TYPE_DOMAIN_BOOT as it accounts for boot-time isolated CPUs.
         */
        HK_TYPE_DOMAIN,
        ...
  }


