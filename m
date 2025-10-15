Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D65BCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgeXfG5LCk279qOJi22HRVqctybfIOuy71nuUr9PHL0=; b=lTNlJiILH2MHwoSOnzNxITOrwd
	7ty8R2h70Z2ptYV0iUcugtXBilsc++OI+JyBr3Qxd4SHz33n09S35G7FcjqWYlxp/GIs/KSGXfze3
	xe0aFqfxmL6GWCwn7A0XSWU+mcP0vO8X6E9IqpRYD4ROpPOFerzl9H5CB9QXJ2UKiV5kLALVPKxPI
	GLvK2yoI9Iejwx9azj+luQaO1nI9KEfD8XKsuaeNQNfZbR/s+8cERnXZ3FoV88EQz3S7HwWxbaseL
	DggP4VZska9e8ZH5TktOLoC2op08wLOJ4DHmpodcDUG4s7zWzziQF/bHrZNJ3Te6IMEMruzvVNR4R
	iW3DlXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Ub-00000001sPq-40xE;
	Wed, 15 Oct 2025 14:28:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Ua-00000001sOm-0FR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760538519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgeXfG5LCk279qOJi22HRVqctybfIOuy71nuUr9PHL0=;
	b=EfbcsJpJ6cnKwhLjlng/eoHGa/Nc5llZURJPOX6HITedcF7h/YL3kzq2UnWCeha0B6BFE8
	C+UqqHFD0CpGyOUgwG428ZeTyZLFol8Ay7DNW7A0qr/fASx8TnCLAs1qHPeLcpRYdowN8L
	YR+D43t+ocZYZ/StljT59xcA64NPlmk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-T1EcDXWXPXWa5vrnL1uyOQ-1; Wed, 15 Oct 2025 10:28:37 -0400
X-MC-Unique: T1EcDXWXPXWa5vrnL1uyOQ-1
X-Mimecast-MFC-AGG-ID: T1EcDXWXPXWa5vrnL1uyOQ_1760538517
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46eee58d405so36000865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538517; x=1761143317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgeXfG5LCk279qOJi22HRVqctybfIOuy71nuUr9PHL0=;
        b=hZhBQGL+c4N9Lr0K91eUzDfnefHRnkZ7YSCVaqECoeZ1to26UERUz//j/w6SbKkN41
         eziEbIjVWWSf/1OsZJrFlZnTqjV3UdH8EFu1usXaD2+0Xwhr70oVnOOzO5jkBS0/TXNc
         OKcsRTjLmVkM7esRBGaG6QQQTh4hficvBH/yVj//94rTWyqN4k2TIJDk11HP7WN+gKKB
         I9xGXwE+PQ8p+JxixRNtCJuMFhcVLcSo6A3Kx7TzlfLsPAW1gnrgjKaAFC8fmFVXO8KH
         t5ShX6S8MKl+wkoU7OS4pyYgcpkASbL3xJQYrl9QMbkgukkjIU5WvpLNePS0QIEAReJJ
         uEbw==
X-Forwarded-Encrypted: i=1; AJvYcCWNN4Lz3nV+rhW6EPyxrfqlUbpEMlZiZbCPPHBzsvw/iE8pN7tLK68dgomqHM4w35elg25HnEyDol3xg9zaN0LK@lists.infradead.org
X-Gm-Message-State: AOJu0YxbgYoRUNgaFOWGhxExoEEmpfNcnZgOSVZqTiZ5JFMiujcwwVd8
	sTZkCJGtDwHJldLy9O6HF7aYARYlhFg8akVfwbaa7uiB3Uu6AGmKsoM004ayANihTZ2PQgSHot/
	SndlI/L6FDtFOztcFJ9o6PqdtyAPZX/r+K53dP1Zqj8YSNznLPb8M+OGe1J060xDkcbvsXMUyGq
	2c
X-Gm-Gg: ASbGncsrgpKYLGoKmeskt4T1v6f0O8V2VbKvolwtXXuzJuAFvB28uPNQ8QQVJEIysJU
	hGyLF1s5rpQec2PAKcicRlj4RH7QvPiWIeOOou7u/jR9MwOsPyCCAhtevt5Houp3NID79bk2t6l
	TunmfL/PPlw/dA7T6Ir1BzQTmZxgz4rpJ3UPNchjY6J6wIduKlWHGs7HH6knBmBcgUBAiiOK1jb
	7efr8G7GfG293Qeg8WAmz5gRDlc39V9E7mHAr8t0PbVwjxXpVwEwlhR9HO93W+Lf4Ph2btdbxTU
	Yw85QMICgRxXn60iC4/d07mY0vjVfc2A03gWI7ED0WAiOSXRUoOuHe4T2Hocg0rPe+dsyqky
X-Received: by 2002:a05:600d:4346:b0:471:9b5:6fd3 with SMTP id 5b1f17b1804b1-47109b57585mr1427435e9.0.1760538516628;
        Wed, 15 Oct 2025 07:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzbrALSQ0Dm6MxbRBonwa/fKtFwvctLkCr56cdjw1iTmex8obFsv5mNCQ28ZCIBWNfB2voXw==
X-Received: by 2002:a05:600d:4346:b0:471:9b5:6fd3 with SMTP id 5b1f17b1804b1-47109b57585mr1426975e9.0.1760538516058;
        Wed, 15 Oct 2025 07:28:36 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.13.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101be0c5bsm48687275e9.1.2025.10.15.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:28:35 -0700 (PDT)
Date: Wed, 15 Oct 2025 16:28:32 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <aO-vkAAk4FCdnLZu@jlelli-thinkpadt14gen4.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
 <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
In-Reply-To: <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oluwt6bqvH_3XqrejtDJ2-akzbz367eTUxE40ms6wHM_1760538517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_072840_173946_2F629E63 
X-CRM114-Status: GOOD (  24.28  )
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

On 15/10/25 15:16, Valentin Schneider wrote:
> On 14/10/25 17:26, Valentin Schneider wrote:
> > On 14/10/25 14:58, Juri Lelli wrote:
> >>> Noise
> >>> +++++
> >>>
> >>> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
> >>> RHEL10 userspace.
> >>>
> >>> Workload is using rteval (kernel compilation + hackbench) on housekeeping CPUs
> >>> and a dummy stay-in-userspace loop on the isolated CPUs. The main invocation is:
> >>>
> >>> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}" \
> >>>                 -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
> >>>                 rteval --onlyload --loads-cpulist=$HK_CPUS \
> >>>                 --hackbench-runlowmem=True --duration=$DURATION
> >>>
> >>> This only records IPIs sent to isolated CPUs, so any event there is interference
> >>> (with a bit of fuzz at the start/end of the workload when spawning the
> >>> processes). All tests were done with a duration of 6 hours.
> >>>
> >>> v6.17
> >>> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
> >>> o About one interfering IPI just shy of every 2 minutes
> >>>
> >>> v6.17 + patches
> >>> o Zilch!
> >>
> >> Nice. :)
> >>
> >> About performance, can we assume housekeeping CPUs are not affected by
> >> the change (they don't seem to use the trick anyway) or do we want/need
> >> to collect some numbers on them as well just in case (maybe more
> >> throughput oriented)?
> >>
> >
> > So for the text_poke IPI yes, because this is all done through
> > context_tracking which doesn't imply housekeeping CPUs.
> >
> > For the TLB flush faff the HK CPUs get two extra writes per kernel entry
> > cycle (one at entry and one at exit, for that stupid signal) which I expect
> > to be noticeable but small-ish. I can definitely go and measure that.
> >
> 
> On that same Xeon E5-2699 system with the same tuning, the average time
> taken for 300M gettid syscalls on housekeeping CPUs is
>   v6.17:          698.64ns ± 2.35ns
>   v6.17 + series: 702.60ns ± 3.43ns
> 
> So noticeable (~.6% worse) but not horrible?

Yeah, seems reasonable.

Thanks for collecting numbers!


