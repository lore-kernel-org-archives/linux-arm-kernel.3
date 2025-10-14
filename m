Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2402CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPklb6K1+lkU1jV8UO4c/obMd20v1vJ9fV4tt0H1zPw=; b=ql/5jk/+2TDEk73l8dWQXZXdWh
	N1xKF/1/9s+KFX1SNI8fi2QwcLI8PHCNxG5+HZZvNuVDPM4c53TdlBHhCo1tczv635tXj8S1KPOed
	v2PRvTc4ggxRx1BMyJPsnqbLBumICgPMN6T4bTal6Vq1mAPe9spwPyMVxGKWhpPN//Xf+1nRM73/V
	NSQc5kQeCY3TmWCtqW1SDNaRKKVaoJIddfoBwxgm77CBiofGo6C34iJUsPICzSzCxO0glemyI5G9D
	lJyhY6WK9InA3+OVpOaccVQ6WrVVwheEDcWtwDh5FKpE/ybg2oVLWqndsAwtCjJP4NueGt44DCHJ4
	la7zXT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8guq-0000000GpcE-10YN;
	Tue, 14 Oct 2025 15:26:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8guk-0000000GpZJ-1Yxd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760455573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPklb6K1+lkU1jV8UO4c/obMd20v1vJ9fV4tt0H1zPw=;
	b=eNnFI59PLn/+wqhTTgbfZqG5Kz1ZR6W9z/SSjNbGSnSULLqwGqse39dygoyOUZE59gzj8g
	pvKr84S4veGO03JHOoF+0Hgd2n8N+lUTD+UVtMAppnIbb+r6bpr2XqMGiMQTZdKghC04Qz
	utBp88WczpnPKuOzGroW0Q/MxpHeWv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-nSUJkrI_Ooed8f-LaaT9XQ-1; Tue, 14 Oct 2025 11:26:08 -0400
X-MC-Unique: nSUJkrI_Ooed8f-LaaT9XQ-1
X-Mimecast-MFC-AGG-ID: nSUJkrI_Ooed8f-LaaT9XQ_1760455567
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e3ef2dd66so36601725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455567; x=1761060367;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPklb6K1+lkU1jV8UO4c/obMd20v1vJ9fV4tt0H1zPw=;
        b=Ho0aEy1iNzvuYJMavgT6AJXGu6s0Qt5hq3K/cXuR81K7QJ/3zqOxuhjeMHsCvuFPI7
         8GkkN+Cyg39dybLZJamRfs85cQAVisPMUuNW0CnAAIMkIVHPlEjBZ4SKgRrWDz/PBGBv
         bsBFbzanBHb3vo0jVpvYTKUOKMWoRKhBNBb70QUgZPVQM+B72rh9jNjd8E6i7GjgpF36
         AMAPYNhyMqBpgtIiUFCVtzCoTJJANVffEKWC3Qr4bKVD4+hWOkxgOsldGbSLXjv2UIjV
         s9rIoevWq3LWu13+tskvRquU9262IREtgxDYArySOTaOJ01WiRxR8RqCrLjl3B84Udty
         L5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl9LsthU/QsxS5cu2cpYmtzgro311Di3GeMehLtPlrcSZ5OmmkagVKZcQqNyGR7Mj+DH+FPIcJYMoCARtQZmWp@lists.infradead.org
X-Gm-Message-State: AOJu0YyKD/9QU/61/Hev4QQNAfn09ealQXTru/QWOg5qseHNZT7LkVs2
	UR7BBsgSzx85ZRIr4ZoJ9xsbmWEYo7OvGGylMCgMXaH/Ggd6lqSlHS965FMWx1bTd1QgAot3LyD
	ysBlZeUYHjO0cW1s93lfOLajXLDeEFj1MLMx7JTQoL0UGIA3eNUjrm08xo6VOu2EJLI6oSz9MGy
	Y8
X-Gm-Gg: ASbGncupiHQvjvKmrqYOXoRTefyl8zFa1kDxfGnnzn9LbeQQXr0w9CklechuIJgP39X
	i23V60xgAzfR/ODb3vabxC4ZpCZrHSMW0CcqJPIzsG4m1M6XK+ivUH05k5Ks4IGkdrQQN2NmmTb
	0JIRWn552WiOA4a+qDeBjwEFi1mVrKKp+4h6h3NI2fJn8nEm4iSvRkr3bhutAYmR/zGTarSkDax
	b4R4ZUvib8pu4mgfQugJa907pGp/3GuDuKEqYpejgxPofgsSD4PHXfNEN6ITe4HlksCN36qCkTr
	LjSuPtMiFd5rXDLgZ+C5/Griig+p5XXr/gBCWI1ajC7gVrC7xQWN5C4bI6Kl4twAj6tv0386qyY
	o6zxi/fi+SUssl4WkcpWxsRWCkw==
X-Received: by 2002:a05:600c:8115:b0:46e:711c:efe9 with SMTP id 5b1f17b1804b1-46fa9ec7556mr181898865e9.13.1760455566792;
        Tue, 14 Oct 2025 08:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW593XOgtaLpqw6H4D31qH5lmbNbujonLfE4h+J4hQ9AwSFy0g3uK3ztnKvCXj4YJKI0uSVg==
X-Received: by 2002:a05:600c:8115:b0:46e:711c:efe9 with SMTP id 5b1f17b1804b1-46fa9ec7556mr181898575e9.13.1760455566403;
        Tue, 14 Oct 2025 08:26:06 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3b9sm24483884f8f.11.2025.10.14.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:26:05 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>,
 Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
Date: Tue, 14 Oct 2025 17:26:04 +0200
Message-ID: <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xf7Xu5i6K65dUltDpgPWG3o0Bh6snSjeb5O5u2tsdHM_1760455567
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_082616_712315_5F178D22 
X-CRM114-Status: GOOD (  17.44  )
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

On 14/10/25 14:58, Juri Lelli wrote:
>> Noise
>> +++++
>>
>> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
>> RHEL10 userspace.
>>
>> Workload is using rteval (kernel compilation + hackbench) on housekeeping CPUs
>> and a dummy stay-in-userspace loop on the isolated CPUs. The main invocation is:
>>
>> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}" \
>>                 -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
>>                 rteval --onlyload --loads-cpulist=$HK_CPUS \
>>                 --hackbench-runlowmem=True --duration=$DURATION
>>
>> This only records IPIs sent to isolated CPUs, so any event there is interference
>> (with a bit of fuzz at the start/end of the workload when spawning the
>> processes). All tests were done with a duration of 6 hours.
>>
>> v6.17
>> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
>> o About one interfering IPI just shy of every 2 minutes
>>
>> v6.17 + patches
>> o Zilch!
>
> Nice. :)
>
> About performance, can we assume housekeeping CPUs are not affected by
> the change (they don't seem to use the trick anyway) or do we want/need
> to collect some numbers on them as well just in case (maybe more
> throughput oriented)?
>

So for the text_poke IPI yes, because this is all done through
context_tracking which doesn't imply housekeeping CPUs.

For the TLB flush faff the HK CPUs get two extra writes per kernel entry
cycle (one at entry and one at exit, for that stupid signal) which I expect
to be noticeable but small-ish. I can definitely go and measure that.

> Thanks,
> Juri


