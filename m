Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lN3XXhvZkEzmXtYd28YKRe70tCct3jaUfGTuQGGD+g0=; b=euVlrGXv64F+aZiTzKV/ybHO/2
	QR2Q682KGxfpbd0ZSnZA9JjqtfZFjyyr0eUj3QraaW5KoSOx+rPTxTKI0sYgU58wurZrDaupl1ypv
	xcd0K0h3YZ2IGKiOV15xPzsVanJ3wqY1wDmHRhsUGNsx20GMSteXm6p1/UsNCZddYeFS/236bl42s
	IZpRMetikVJzjZgimz1sqz13GRMxTIr+GbLC0zv2Wf/2XKAZSFjEx036d2tCVSsUGQ+INzxuyMAXI
	b7tN7B16evZyDSS1k1QHGejlNOJGQcuza00KLke+rbcmR9Wf3qZ2C8HKCN6RNu8ec6tzLfKsOgARf
	nDMQw41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Pb-0000000CoUS-2YkI;
	Wed, 30 Apr 2025 12:19:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Ne-0000000Co3t-2U5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746015457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lN3XXhvZkEzmXtYd28YKRe70tCct3jaUfGTuQGGD+g0=;
	b=jKTzSMH4UmYanCWsF4vLQkgVWNbav8gb6HbeBFdzNB+wAtv6QcILP2WLfTGseGj82/jSwW
	sZGD1pH1gKGVnbrdC0ZHs/F7epbUoEL9fUZFkOxsN2iQOEYsqA37kxXjXMDlHqgdtDHJ5n
	8DXGzJJ3CAhMXVhfJqZfEdqrhsU6fbo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-atAfpLw0MaC6pPE0BRTcmA-1; Wed, 30 Apr 2025 08:17:35 -0400
X-MC-Unique: atAfpLw0MaC6pPE0BRTcmA-1
X-Mimecast-MFC-AGG-ID: atAfpLw0MaC6pPE0BRTcmA_1746015454
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso43999545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015454; x=1746620254;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN3XXhvZkEzmXtYd28YKRe70tCct3jaUfGTuQGGD+g0=;
        b=D2EfFjciWACl3tqF/3asGOAdEMPcSydFiQFzcfMp0IBDthxfeyF0i0A7GQqDHwX/Ob
         n0WZvFlLKo+fZfq86zPevPzzX5apzVBL534F2Toq5e++gZuEiZgnNCa019lPj4/9hPmQ
         mLiCAJMSQzthSpXh3MDsCjtPUvSAMP5LGtHhjdadkarwisBxmd7j5syWbnUWy4Gzp5VZ
         GPqP/Vdja126bTFaCglS8eCPdb0l0xLew41enL/oLvtwYhxjunc/M3/HYPFELbxdIASE
         v0cqg05ZZk3tVrbJ5BItakEJrE6hLa1hvoXQOEB58L1nTFjZTO/ZtJZBW7VsezxsP9kJ
         fvJA==
X-Forwarded-Encrypted: i=1; AJvYcCXz10N6xlE96jp4j307J4LFaQeqWzaQ8MOuLH42jFXHASiU1f0HJwd/SWLCqr4QQ5mPSnXsmVAaYRYo7oyGCehY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+L7IIPEHYIfdO3XgEFlO+RBdXNVZzdoy7ncZbbqoq/ycIiiXQ
	PS2VXmDRdTHRBx6GRFAZG6EQyCFKTHuyqY3CZH7jRFVsBkamnBqDkUbE6dzwh15I8/K98EEoB/Z
	eSWzcX++yOuKnViBc5mSofe1+11T5SQFHJcHiy7SwM7KNZ8nd5ULDy1xyoH0uXfw6q9lRiA13
X-Gm-Gg: ASbGncvE+orh7Fw/hpYztIRKQ0zmxSa+lXnHaNst4eQ1eFpjfTDJpiyII7VIi9zu0td
	Fw/OGgoL9x/uaaM2IJnHwHFQgCFzfU0iX84R1BlFDdpd5SaCnkGiIYoMnZ+PbjhfXDRzb7f3qX7
	PCP7q23nhYbOy0mB9zNMu0Mu2+oUovgG5qN2sVuKC+EUb74jJWr0nr/y+nt+2MR9Vj6LwpuG33X
	taNcdCZvPrUIsXzGwpiXZczEjy3qddonvf23Tm9ydDJ1O7NpYhOfCuuw18nl1aEPRFiQtUZjZFP
	9s+xoiHEhxtR4NsoyXl2/jpglL3kbGmFyGtokg==
X-Received: by 2002:a05:600c:3b08:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-441b43a6849mr12659185e9.31.1746015454192;
        Wed, 30 Apr 2025 05:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDRQpH85Tjf5lCeTC38YV5zFGOEEWEJ15Q43zpvFHsUBUREIV9t8rFVVspwP+av3krGaKQA==
X-Received: by 2002:a05:600c:3b08:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-441b43a6849mr12658865e9.31.1746015453815;
        Wed, 30 Apr 2025 05:17:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a9dsm23611265e9.19.2025.04.30.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:17:33 -0700 (PDT)
Message-ID: <cbcefdb80d5e10b8fed80de17bb97bf61df81386.camel@redhat.com>
Subject: Re: [PATCH v6 00/22] RV: Linear temporal logic monitors for RT
 application
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, john.ogness@linutronix.de, Petr Mladek	
 <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo
 Molnar	 <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav
 Petkov	 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin"	 <hpa@zytor.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra	 <peterz@infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, 	linux-arm-kernel@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 14:17:30 +0200
In-Reply-To: <cover.1745999587.git.namcao@linutronix.de>
References: <cover.1745999587.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GccL428kudjYGbr0IqiiAPUvmW_K1cLgREvPdAFrpxc_1746015454
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_051738_705456_378D5911 
X-CRM114-Status: GOOD (  35.66  )
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

On Wed, 2025-04-30 at 13:02 +0200, Nam Cao wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page
> faults, or
> may be blocked trying to take a mutex without priority inheritance.
>=20
> However, while attempting to implement DA monitors for these real-
> time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to
> understand,
> and error-prone.
>=20
> For these cases, linear temporal logic is found to be more suitable.
> The
> LTL is more concise and intuitive.
>=20
> This series adds support for LTL RV monitor, and use it to implement
> two
> monitors for reporting problems with real-time tasks.
>=20

Steve,

From my point of view this series is ready for inclusion, what do you
think?

We may still need Acks from the x86 and arm64 maintainers regarding the
tracepoints changes, though.

Thanks,
Gabriele

> Patch 1-12 cleanup and prepare the RV code for the integration of LTL
> monitors.
>=20
> Patch 13 adds support for LTL monitors.
>=20
> Patch 14 adds the container monitor "rtapp". This encapsulates the
> sub-monitors for real-time.
>=20
> Patch 15-18 prepares the pagefault tracepoints, so that patch 19 can
> add
> the monitor which watches real-time tasks doing page faults.
>=20
> Patch 20 adds the "sleep" monitor: it detects potential undesirable
> latency
> with real-time threads.
>=20
> Patch 21 adds documentation on the new monitors.
>=20
> Patch 22 allows the number of per-task monitors to be configurable,
> so that
> the two new monitors can be enabled simultaneously.
>=20
> v5->v6
> https://lore.kernel.org/lkml/cover.1745926331.git.namcao@linutronix.de
> =C2=A0 - sleep monitor: Drop the block_on_rt_mutex tracepoints. The
> contention
> =C2=A0=C2=A0=C2=A0 tracepoints are sufficient.
>=20
> v4->v5
> https://lore.kernel.org/lkml/cover.1745390829.git.namcao@linutronix.de
> =C2=A0 - sleep monitor: Fix a false positive due to a race with waking an=
d
> =C2=A0=C2=A0=C2=A0 scheduling.
> =C2=A0 - sleep monitor: Add block_on_rt_mutex tracepoints and use them fo=
r
> =C2=A0=C2=A0=C2=A0 BLOCK_ON_RT_MUTEX, instead of trace_sched_pi_setprio
> =C2=A0 - sleep monitor: tighten the rule on nanosleep: only
> clock_nanosleep()
> =C2=A0=C2=A0=C2=A0 with TIMER_ABSTIME and CLOCK_MONOTONIC is allowed
> =C2=A0 - add comments explaining why it is correct to treat PI-boosted
> tasks as
> =C2=A0=C2=A0=C2=A0 real-time tasks.
>=20
> =C2=A0=C2=A0=C2=A0 It should be noted that due to the changes in v5, 'per=
f' does not
> work
> =C2=A0=C2=A0=C2=A0 as well as before, because sometimes the errors happen=
 out of the
> =C2=A0=C2=A0=C2=A0 real-time tasks' contexts. Fixing this is left for fut=
ure work.
>=20
> =C2=A0=C2=A0=C2=A0 stress-ng is also far noisier in v5, because the rule =
on
> nanosleep is
> =C2=A0=C2=A0=C2=A0 tightened.
>=20
> v3->v4
> https://lore.kernel.org/lkml/cover.1744785335.git.namcao@linutronix.de
> =C2=A0 - support deadline tasks
> =C2=A0 - rtapp_sleep: use sched_pi_setprio tracepoint instead of
> contention
> =C2=A0=C2=A0=C2=A0 tracepoints for BLOCK_ON_RT_MUTEX, so that proxy lock =
is covered.
> =C2=A0 - fix the scripts generating an "slightly" incorrect verification
> automaton
> =C2=A0 - makes rtapp monitor depends on RV_PER_TASK_MONITORS >=3D 2
> =C2=A0 - make the event tracepoint output a bit more readable
> =C2=A0 - some documentation's format fixes
>=20
> v2->v3
> https://lore.kernel.org/lkml/cover.1744355018.git.namcao@linutronix.de/
> =C2=A0 - fix a problem with sleep monitor's specification (around
> =C2=A0=C2=A0=C2=A0 KTHREAD_SHOULD_STOP)
> =C2=A0 - merge the patches that move the dot2k/rvgen scripts around
> =C2=A0 - pull panic/printk changes into separate patches
> =C2=A0 - fixup some build errors
> =C2=A0 - fixup monitor's init function return code
> =C2=A0 - fix some flake8 warnings with the scripts
> =C2=A0 - add some references to LTL documentation
> =C2=A0 - fixup some mistakes with rtapp documentation
> =C2=A0 - fixup capitalization mistake with monitor_synthesis.rst
> =C2=A0 - remove the now-redundant macro RV_PER_TASK_MONITORS
>=20
> v1->v2
> https://lore.kernel.org/lkml/cover.1741708239.git.namcao@linutronix.de/
> =C2=A0 - Integrate the LTL scripts into the existing dot2k tool, taking
> =C2=A0=C2=A0=C2=A0 advantage of the existing monitor generation scripts.
> =C2=A0 - Switch the struct ltl_monitor to use bitmap instead of an array,
> to
> =C2=A0=C2=A0=C2=A0 optimize memory usage.
> =C2=A0 - Correct the generated code to be non-deterministic state machine=
,
> =C2=A0=C2=A0=C2=A0 instead of deterministic state machine
> =C2=A0 - Put common code for all LTL monitors into a single file
> =C2=A0=C2=A0=C2=A0 (include/rv/ltl_monitor.h), reducing code duplication
> =C2=A0 - Change the LTL monitors to make user of container. Add a bug fix
> to
> =C2=A0=C2=A0=C2=A0 container while at it.
> =C2=A0 - Make the number of per-task monitor configurable


