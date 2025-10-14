Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F216ACCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+P2Dsj3XLhA6fMrQYgh8OLSwYB2MUOQP3SbJkXqJVA=; b=qvdp0H57epIMz03FG1I/is6Aiz
	37FxsexWMTAwAPfdoPJd4FgOD3vbHdtv2sjBdu3qJGyxu/QdNwww6c1SpvxmuffeCP+amLNhnPYde
	fmQn/5TS5Z384eZGjla/n2G9S3++pwQW7Kqa0U4MnVfi/JwAEtyuvLSYLQ71RxXT+fVseAGBPm3Cb
	79etVwGvaDzpfiMj+YWZyFLrhw7PtfwL4W4Ynppak1dpZIg9pTdPzgkcLMj0TI9zaZrArWy0lcmLl
	ZiB52rxorakNH3kGJiEbUZVkBkw2BJ/M1K4Kd/zvYZScQLbZV4qfGYOnGypXJdDjIrZ1xLzFRiYnR
	Vu0zVTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ebV-0000000GKSH-2KW3;
	Tue, 14 Oct 2025 12:58:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ebR-0000000GKQm-33QA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760446688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o+P2Dsj3XLhA6fMrQYgh8OLSwYB2MUOQP3SbJkXqJVA=;
	b=F25wjcbomtI84IuH63y3uCwMe59HV5IiwauKpiD0sHsUdXIpr1gs8FLbLTlt7g7NNTucDn
	pxXrgcizjcEAVg5AzEb65bkVPcHPq0tEww1Mu2shf//a/rTUEZQSXBZS3zxgeS0OdkZFag
	2sqexAC7GHWcCfQQUcgenQ5DS7xbtiM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-cJ0KbBOhPFe580MdHKrKEw-1; Tue, 14 Oct 2025 08:58:07 -0400
X-MC-Unique: cJ0KbBOhPFe580MdHKrKEw-1
X-Mimecast-MFC-AGG-ID: cJ0KbBOhPFe580MdHKrKEw_1760446686
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso4237158f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 05:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446686; x=1761051486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+P2Dsj3XLhA6fMrQYgh8OLSwYB2MUOQP3SbJkXqJVA=;
        b=IjjGBnafAPHyicUhRtH3TR9+LbBeRp9lP6GQHHmzkGJSIId8fZ73RH7u5sIO77Ky5I
         CPDuFfCE1wUMKeIsh1/1xFjT5dIcxu+pbmvV/N8txyKD6XlbqU6RVKuKiJ1At+XRJdQn
         flM3RY1sz1ar/8jLT/AW8pBZvchEuxSLNaU1Z0Om/ucFxs6ML8gmp7jzmV5RfOAn7Lv9
         6Q9j3N1TVJ47HnKU3qaot6El8dnRR5qaO5tz7zSXKlyBNnrVHEF3MYTNKsHbnJ2uitWa
         LbHqKqUIa2BrkZvu+mjrpMoWvpf+/bvYDAkwO9DJe+xCx1w2ivfv+R6ClLDGDqDjKMqb
         4uMw==
X-Forwarded-Encrypted: i=1; AJvYcCV9iqL34jcGT44j5JCn+yUqnjOHq4l4ELoWqCvVqe9jKNp69IJfgkLCfPEpNxSDqvWmJWvznnAg4+XBjo2/bumv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4mWnwvj8r8DxNKTvZHxchb5PjagoZrq6/fnhPflywPiobi1mX
	89uurXRm0L2v5sUKUvv4aKrwbEhu+Zo5Tym7TTQ0MhPwpDbNHtNFcDH/0uG4CvE7K3HjXLFNOu8
	kd8tcsBBO5VX7sXVK5PGhmp59scUN7WIpys+5ED2jtszhXcYUOLLFIgJP5PpPjtscPyUtlFMlhc
	Ip
X-Gm-Gg: ASbGnctUibjc/gkxdJZc83FEOuYQtiPsgwnALJBql2WE02dpx578Q4NW2nPuT6uKAb3
	PrZ295GGthimLc0LOuDrW9mkJJDR3uOp3dk2d8nt7shGUH4rcx118F6dyD/5+EJ2Wx0VVMAkbP5
	rn71LReQUsFyLrSAqCgEI2rmY5KdMW/JVNW2y74zOLc5jCry+RyLDNn2YCjtEp04DKsuyAQGj5Z
	SGBd+gdr82HsCepqrSgN87D1tulZKfZmhOiUDLG4g0zwzU//CdbZ2q27pEWpB4WnNSF3BlY0HKv
	8pxBX0CozBrBacaxD6V54R61O406uuvsi3Je0uvz9LX+e3t7QImEXGAD9PmOv+2dPF/ozo3e
X-Received: by 2002:a05:6000:1888:b0:401:c52f:62de with SMTP id ffacd0b85a97d-42666ac39fdmr14487403f8f.12.1760446686034;
        Tue, 14 Oct 2025 05:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAh3YZ5oKpPdr7WASiDkPJn2IILu8/Rh+37A13TS4n2FwBRRVC0ByNWYf0Uu33Aqxt+5Ldeg==
X-Received: by 2002:a05:6000:1888:b0:401:c52f:62de with SMTP id ffacd0b85a97d-42666ac39fdmr14487377f8f.12.1760446685024;
        Tue, 14 Oct 2025 05:58:05 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.13.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582abcsm23624651f8f.17.2025.10.14.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:58:04 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:58:01 +0200
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
Message-ID: <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZrN7WnEuhjjKoPRrMDR51SpHpE8WOOPTugR4Nbn1_Jc_1760446686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_055809_836473_49AE3913 
X-CRM114-Status: GOOD (  19.91  )
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

Hello,

On 10/10/25 17:38, Valentin Schneider wrote:

...

> Performance
> +++++++++++
> 
> Tested by measuring the duration of 10M `syscall(SYS_getpid)` calls on
> NOHZ_FULL CPUs, with rteval (hackbench + kernel compilation) running on the
> housekeeping CPUs:
> 
> o Xeon E5-2699:   base avg 770ns,  patched avg 1340ns (74% increase)
> o Xeon E7-8890:   base avg 1040ns, patched avg 1320ns (27% increase)
> o Xeon Gold 6248: base avg 270ns,  patched avg 273ns  (.1% increase)
> 
> I don't get that last one, I did spend a ridiculous amount of time making sure
> the flush was being executed, and AFAICT yes, it was. What I take out of this is
> that it can be a pretty massive increase in the entry overhead (for NOHZ_FULL
> CPUs), and that's something I want to hear thoughts on
> 
> Noise
> +++++
> 
> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
> RHEL10 userspace.
> 
> Workload is using rteval (kernel compilation + hackbench) on housekeeping CPUs
> and a dummy stay-in-userspace loop on the isolated CPUs. The main invocation is:
> 
> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}" \
> 	           -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
> 		   rteval --onlyload --loads-cpulist=$HK_CPUS \
> 		   --hackbench-runlowmem=True --duration=$DURATION
> 
> This only records IPIs sent to isolated CPUs, so any event there is interference
> (with a bit of fuzz at the start/end of the workload when spawning the
> processes). All tests were done with a duration of 6 hours.
> 
> v6.17
> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
> o About one interfering IPI just shy of every 2 minutes
> 
> v6.17 + patches
> o Zilch!

Nice. :)

About performance, can we assume housekeeping CPUs are not affected by
the change (they don't seem to use the trick anyway) or do we want/need
to collect some numbers on them as well just in case (maybe more
throughput oriented)?

Thanks,
Juri


