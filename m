Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41668CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD6dvIl7J8wWJkas/YONpCBWDBu3WvjIWx4zsxh951U=; b=sO1j9C30zbSlU06BWbsTEk/X57
	wYFgGKgaeLXNICr56cTmgzkfLMkpMfdqd43Yeq12tfiuWbME9wtROsDwC8CIjuRJNqiRi+a7B8ikN
	lY0G5bvOnr+ZtQVjdtHJGzJyvBZOHFrEL5IjaHqOBqCnQj3swD22/ao86/kRhoxinI7DDl3BumJWX
	hx6OPmQHHpLDwSN9DEWhyuB+MmBbsF9nhVVgvJzGTlogJ3r6h+EPcFKB3GkW2JC0y8dCSO/R/3rFf
	nAo7AQ8Zc9iXLN2VolEF3KlFRP22tPeolmYvdOB9VG/6J/KXSfkG8x1e/T9j9AEJk3IHBftlG2F7T
	dG/SgNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Mi-00000001gTt-0NPs;
	Wed, 15 Oct 2025 13:16:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Me-00000001gRL-315Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760534182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yD6dvIl7J8wWJkas/YONpCBWDBu3WvjIWx4zsxh951U=;
	b=WCuN46obkcXO1LZdnnfLQ1G8dMenUUbvJpyaZXvoXSxMUlQ62kBQszMdsfmKMc9JMhm1AA
	yVEgRBEgMpJtjwFwGZQMhOGQTSJBvy9mQPe39QsJv7Y7PyVPQ+S5XUqRVT3rMPUcReYYVT
	qGtrprHbt3DPSDAnU7VaBB2p0KQdCGA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-uHPKdMZuMm2y50EVBOyeiw-1; Wed, 15 Oct 2025 09:16:18 -0400
X-MC-Unique: uHPKdMZuMm2y50EVBOyeiw-1
X-Mimecast-MFC-AGG-ID: uHPKdMZuMm2y50EVBOyeiw_1760534177
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42421b15185so4547119f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 06:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534177; x=1761138977;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yD6dvIl7J8wWJkas/YONpCBWDBu3WvjIWx4zsxh951U=;
        b=wuC9LGkPr0MUH2Z/sFxg+PoTDXHh+aQQNAyoqrHSXemgrPUc9uKZzY+jy7Z/W1BX3f
         1Bh+QoXq0hX7dEuYrlrz25M3MfL70AaL15eJtAbuz1zrJZvO2ojNll2GXyq1OtT3e90c
         AfqRjbAO5VwatpSI6Y2mWHBFImactBzx8tLHyAVfA5JBjBSTkA4HvZ/qzomZYTrbKHXg
         4LAboXKKK3uVRZHQ0wkpCJW+UyTwEM5D+pBsqI2AdrYIVMZLDH7QoqYrgfnRPVt5G29d
         chSWUAhBS8HrTyUYjWEjaM+R/hizcjAvFs4qTNmxz8FrZqZqLnTgZqhoHg36xh+DB2sJ
         11/w==
X-Forwarded-Encrypted: i=1; AJvYcCVjElUHdGgqTL9vR6LxQOZfx5MtVmUWvXUL1SGCXqurRNskTPs2AnMsyHv8C9gblCYfXXQnatc+7WQ4tbDAc6V1@lists.infradead.org
X-Gm-Message-State: AOJu0YwRlUz1uOJGYC80c/I0m83pNOG2NMSWTgQYvLYusxutD304IG6J
	m3yDeqdrHfmKj6+Qqc7+SC/MfOOsQuxKw2SYliKchM1Jh26248CqfwiaCZvdqWYfeVG2mhgndvs
	8iwnlaQngRdKkJVaxPo4hz7Xm2uP0UoMW3sedeUQMrilHKzzGElXdvOtZrYzZzUog9J4/gcbUO0
	WO
X-Gm-Gg: ASbGnctgLZgWR+5JR+r2gQS5MhimPqPNxcUQbRnI5Fg0sovlwdH78BGsM51RGapSNl7
	GhXtftboFxF8M30MS/nxvy0OiioinNuFtQfsr6VHva4Y9e7ggP8B8UyLYOGuQAgX0DelJp128ac
	6VJ2soNkLufuTn93+yAXn+gSgKI4xJDJ0o29x6HBBp2BQYDf3SzqIbll3KRRMhcKDOA7zgGzVgk
	N0ZiJMHPmpSKQCKV8ftdyT1E3Sy+FtERoBWGA5HKF7HQXW50qGHMvAIs2bnqgpm6wgzgCA0nHxI
	dv70UF22U7QcMmuSSTUSv2oXiAdtAMIgHOrFyVNrCWQ2cSVNJaLM4a5Q2r+7d5cnhPNzOVik5tN
	8X5K9zvaK72pR2FLSAxJjdsjGFw==
X-Received: by 2002:a05:6000:248a:b0:3f2:dc6e:6a89 with SMTP id ffacd0b85a97d-4266e8e4c29mr18416343f8f.57.1760534177128;
        Wed, 15 Oct 2025 06:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcUjf8Yi428dP9FWOn2X364zzJqp12CDvIxSjruyz4UDGZF5I3K12BFelQ7PlgEZWXYUZIhg==
X-Received: by 2002:a05:6000:248a:b0:3f2:dc6e:6a89 with SMTP id ffacd0b85a97d-4266e8e4c29mr18416272f8f.57.1760534176503;
        Wed, 15 Oct 2025 06:16:16 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm28976327f8f.8.2025.10.15.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:16:15 -0700 (PDT)
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
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg
 Nesterov <oleg@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>,
 Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
 <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Date: Wed, 15 Oct 2025 15:16:13 +0200
Message-ID: <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Kq16cO3ecxFrAJcnRpSNj1u7ohPp_sUG9CoqdRE9AY_1760534177
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_061624_821025_2793376F 
X-CRM114-Status: GOOD (  17.99  )
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

On 14/10/25 17:26, Valentin Schneider wrote:
> On 14/10/25 14:58, Juri Lelli wrote:
>>> Noise
>>> +++++
>>>
>>> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
>>> RHEL10 userspace.
>>>
>>> Workload is using rteval (kernel compilation + hackbench) on housekeepi=
ng CPUs
>>> and a dummy stay-in-userspace loop on the isolated CPUs. The main invoc=
ation is:
>>>
>>> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}=
" \
>>>                 -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
>>>                 rteval --onlyload --loads-cpulist=3D$HK_CPUS \
>>>                 --hackbench-runlowmem=3DTrue --duration=3D$DURATION
>>>
>>> This only records IPIs sent to isolated CPUs, so any event there is int=
erference
>>> (with a bit of fuzz at the start/end of the workload when spawning the
>>> processes). All tests were done with a duration of 6 hours.
>>>
>>> v6.17
>>> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
>>> o About one interfering IPI just shy of every 2 minutes
>>>
>>> v6.17 + patches
>>> o Zilch!
>>
>> Nice. :)
>>
>> About performance, can we assume housekeeping CPUs are not affected by
>> the change (they don't seem to use the trick anyway) or do we want/need
>> to collect some numbers on them as well just in case (maybe more
>> throughput oriented)?
>>
>
> So for the text_poke IPI yes, because this is all done through
> context_tracking which doesn't imply housekeeping CPUs.
>
> For the TLB flush faff the HK CPUs get two extra writes per kernel entry
> cycle (one at entry and one at exit, for that stupid signal) which I expe=
ct
> to be noticeable but small-ish. I can definitely go and measure that.
>

On that same Xeon E5-2699 system with the same tuning, the average time
taken for 300M gettid syscalls on housekeeping CPUs is
  v6.17:          698.64ns =C2=B1 2.35ns
  v6.17 + series: 702.60ns =C2=B1 3.43ns

So noticeable (~.6% worse) but not horrible?

>> Thanks,
>> Juri


