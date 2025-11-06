Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95FACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVdSTjzPPKZ2l7IW0u0zSr5SxYY9yMb26AdkoDhOwNg=; b=KVwaFeU/GC/lPxYoMsvfApu68x
	OEG2IUSX2YrnBnSDq5HMGes5VxVDDGGdRwCLSkTSw2g3TDfrbB0nkWFMVoJU0a3VT8rRkraG+ae5n
	SbqJETqvtRR9jQQuHnU6GVi/bfBDjFIA+KHbBGRHYanbteoE/PlnkFa/GO/BZc+qLshLsSfW8o8nx
	mBrOffVfMpj8Yu32gj6jUvTaY8J0gAB5WPlVpUnHVvzME6kgCxZtxnTCJM5sqXAw6IRnPlfYzgyx6
	zQR80qjfxk0s/OPZ44M+XuOakwruQZPNIEXMK9USAYCr79bHzRX12zs6cKtxql9kMm/AWh+tVRCzn
	C/Xj8/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpm-0000000FFoS-2sVh;
	Thu, 06 Nov 2025 10:03:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpZ-0000000FFNT-0dHR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762423379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVdSTjzPPKZ2l7IW0u0zSr5SxYY9yMb26AdkoDhOwNg=;
	b=JWxdw8LGYTzH8S+ZZj50fQEgxDtnxvrOwJl+xr/XCxsZWBvGt2cQ674anbYp0R6RWbMm4P
	Oim9E9aMTsJpdrWD8/0AZwvypTkaArfR4KUcdOQTRjcFaOpdFcmSgVNVNOXOIHeavypMHf
	XUe2KT6gIygOpYJcrIqyD0lHyxdz/14=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-YEonhYx5OQOh-iR7HjVQdw-1; Thu, 06 Nov 2025 05:02:38 -0500
X-MC-Unique: YEonhYx5OQOh-iR7HjVQdw-1
X-Mimecast-MFC-AGG-ID: YEonhYx5OQOh-iR7HjVQdw_1762423358
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c8d07874so421998f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 02:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423357; x=1763028157;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvrt5C8X1gp1kp6b+KY8cbLTeVcvbbT6G6kNQJkblK8=;
        b=jTNCcumYFrHY7BK4PIQxaaEbmP/3jy9q1mDgamRWI8FDxKN+rbq21T3KKzjuWGwgj/
         quNSRyzYoLnsCUbWdhUH944J43uJYpnwXhsELIPnzhaQ9nwNYtx1QKMse5b/U++tSN90
         lF2PkPCbd1yfp5djd5Nlr8ayyugKrKwxnT8TC4lov+OqGkl1J2jCqSkQleoUU3f52yPc
         tid17rGZcEV492cOhTi88XvZ3vVk8+6I9nmhkIxcchTqbvXyTKQEg++87gQOiu3MkJjd
         mAZDDz4j4MCeBpwyrVY+2yyZviF8XUBoF+pVeK7GoQk3/nL1YOPFoh7dLAIW2WK4Yxv7
         kHfg==
X-Forwarded-Encrypted: i=1; AJvYcCXHb0fjYhKWKgM3T4QQzBghkfKL4dkO9X8vPyzPHlV7IrVu+pFMQop+NN1Wq9AOU2gpt4KyaHLq1tvknCq8tYxi@lists.infradead.org
X-Gm-Message-State: AOJu0YylQtI2xoTgcSf4H3QrMXmyAjvTLutYO8QXrXPL1SwplDOb6GoT
	Ly3edV2gsyQNlS8mgseYbFFwSSPD/mkFoRYn5WpMsddsYwts+JtjWM1u6UWT6vekDqA0wIi1Mr5
	eKagVwRdfSuOa5mFVgU12OU0HCyLCK1yVuK2w4W56cpuXga4virVmS1nQSQ2prfOB7A5hIkMogm
	iI
X-Gm-Gg: ASbGncsPDf3+9KY6HGMnYWDNxEUlMuchrLj/VVUC8ROGUMs6Aa9aNubG3V2x5dRbNvk
	bT20JwntYii5UXuoy1iV1L9K9Bzbsqqs0gn6iWm+EAAwQUq1PJLcsHzoA2Q+sBykrUBRrNVoe3m
	Ny3vykz87Y1Tfvh1VcCiw+0BbqAJQtryUsq1Yn36HnSFjeV7VYZcrHHSzObS6VKB0Oe5CAtNSR2
	56zs+MGFIaaJ0vzTy3Vswg5Aw1edPo/d4iXdhakFeTUusAB7aUegrnQjFSePSDTze4XqI0Tj46+
	6BXSO+2pGfYA9TCUI8MUX8L48vKQsMP98m72FB+h8qR9Iefbtzg8NojvBRAjFpjuYwFkzr7Zd/W
	WBsc6sJzx42rw6KNM0TgP0IZ1zjhwnoaiF087ftqtJ8sPXgOcBfi4oUfycmXO
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572219f8f.18.1762423357511;
        Thu, 06 Nov 2025 02:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFeAmOLmzeYzGPgujTP1e064ll50Q3Ih/Pj2s9y519WV4ZUw6Tz0GJFNvPvZOTYQG+myOLaw==
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572131f8f.18.1762423356748;
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb477203sm4112751f8f.29.2025.11.06.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQuNdOEmPYkI03my@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
 <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQuNdOEmPYkI03my@localhost.localdomain>
Date: Thu, 06 Nov 2025 11:02:34 +0100
Message-ID: <xhsmh5xbn5vid.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6K249T5fS9SlyLPfKMPmMnaCLMbxWMRXt7GvLuJVXuQ_1762423358
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020301_995998_70748839 
X-CRM114-Status: GOOD (  29.12  )
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

On 05/11/25 18:46, Frederic Weisbecker wrote:
> Le Wed, Nov 05, 2025 at 05:24:29PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> On 29/10/25 18:15, Frederic Weisbecker wrote:
>> > Le Wed, Oct 29, 2025 at 11:32:58AM +0100, Valentin Schneider a =C3=A9c=
rit :
>> >> I need to have a think about that one; one pain point I see is the co=
ntext
>> >> tracking work has to be NMI safe since e.g. an NMI can take us out of
>> >> userspace. Another is that NOHZ-full CPUs need to be special cased in=
 the
>> >> stop machine queueing / completion.
>> >>
>> >> /me goes fetch a new notebook
>> >
>> > Something like the below (untested) ?
>> >
>>
>> Some minor nits below but otherwise that looks promising.
>>
>> One problem I'm having however is reasoning about the danger zone; what
>> forbidden actions could a NO_HZ_FULL CPU take when entering the kernel
>> while take_cpu_down() is happening?
>>
>> I'm actually not familiar with why we actually use stop_machine() for CP=
U
>> hotplug; I see things like CPUHP_AP_SMPCFD_DYING::smpcfd_dying_cpu() or
>> CPUHP_AP_TICK_DYING::tick_cpu_dying() expect other CPUs to be patiently
>> spinning in multi_cpu_stop(), and I *think* nothing in the entry code up=
 to
>> context_tracking entry would disrupt that, but it's not a small thing to
>> reason about.
>>
>> AFAICT we need to reason about every .teardown callback from
>> CPUHP_TEARDOWN_CPU to CPUHP_AP_OFFLINE and their explicit & implicit
>> dependencies on other CPUs being STOP'd.
>
> You're raising a very interesting question. The initial point of stop_mac=
hine()
> is to synchronize this:
>
>     set_cpu_online(cpu, 0)
>     migrate timers;
>     migrate hrtimers;
>     flush IPIs;
>     etc...
>
> against this pattern:
>
>     preempt_disable()
>     if (cpu_online(cpu))
>         queue something; // could be timer, IPI, etc...
>     preempt_enable()
>
> There have been attempts:
>
>       https://lore.kernel.org/all/20241218171531.2217275-1-costa.shul@red=
hat.com/
>
> And really it should be fine to just do:
>
>     set_cpu_online(cpu, 0)
>     synchronize_rcu()
>     migrate / flush stuff
>

That's what I was thinking as well, at the very least for the
cpu_online_mask bit.

> Probably we should try that instead of the busy loop I proposed
> which only papers over the problem.
>
> Of course there are other assumptions. For example the tick
> timekeeper is migrated easily knowing that all online CPUs are
> not idle (cf: tick_cpu_dying()). So I expect a few traps, with RCU
> for example and indeed all these hotplug callbacks must be audited
> one by one.
>
> I'm not entirely unfamiliar with many of them. Let me see what I can do..=
.
>

Here be dragons :-)


