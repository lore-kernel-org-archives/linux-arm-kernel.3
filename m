Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B6C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BF23L7IjgM1pfHyM3ghg4jPhGbV/DtVtyTw2lo+n/XU=; b=APh+cEw/EPSMtYVFybpnxB4EKw
	1bQH+lXZpioIWzTT7o8qEvzSiEAOrlyHDbowmv3c156RKM12EHDLAYWLqmQxpqdN3Pg6CR47PhYJf
	5S89EEmSezTg8vC6mT83IuTt4HehqazKGtIrgcfJN10st1rMzob0Ycn/9AxxNabzJrq4TXCAnDbPH
	6juT3mPn9JWCG7DnQvHFMiSp7+iUe5B0MYaLSp6RUI25b+XQ2Vn3hvum7Av+lsCTaGwh6nJo4MlOw
	chtsEmdS8EqdJi/rON6P72mU7OF4qxVHjVlpj949xi8pobj2jgkuZQnqd98yMg2tmo1u27rgvmwer
	kwjAx5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F5A-0000000BvvF-19Ed;
	Thu, 17 Sep 2026 16:35:32 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F58-0000000BvuV-0Ctx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:35:31 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-52fb76c9df1so12233991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789662929; x=1790267729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF23L7IjgM1pfHyM3ghg4jPhGbV/DtVtyTw2lo+n/XU=;
        b=MAfTcPId1w3aGeBzjG6VHtMrV7+bpRUFMrvET6DwvDtGnPMCDEbJCg6UkGoW1f8vzr
         50CeDOlUT9BcfpDNLKCbgJ9HF/Xzhzfzbnv7HoLLNlC18/6ewu865Wzo8hU8y/8FaK2v
         AWjPFXAKRBo5j/0bgroVQ/c2OjqnGCnOoBAm78iWNBRzfdQXVjtSU1hwS2Z14bG58KMB
         NvugsO3c2gGFfnHKhGmUS6t5EbNI61MGc++gjWgCvAE42r4hF6i3Sfk+0HHl+dIkdyFl
         DKGFV5ahbxYTkerloJ+DTEfbzEKsEymodNyW97JMNAYGjwFzLO/W9zsZ2Ca/F/mhoKuL
         lMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662929; x=1790267729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF23L7IjgM1pfHyM3ghg4jPhGbV/DtVtyTw2lo+n/XU=;
        b=CfdteAd08aoWfFHPMzYM5ExO4LrR0tM93JwnDS1yRsOIyHb19jK3/yWjotMQ7Zdnhk
         p5y6BcU8819OdC4C/hzu/y96MLi794x2BIWBSSwsvtYfo4HfgamYh9+CbuhO7EApgklF
         0FZOztO0tu1nhjnZZZDSHg8KqyxMNKUpVsTh+Q8SSK8ET9QrqUthd8dBGTUiV46VZ08z
         Z/2/0a6c/r3XzLMKtFbaFFReSqTkswe+TMcrB1dY9Au3qhX294REgPbZu0ZeKjAyCP9m
         FQ0yHbl5tJp/16IyqTvNGy/fP6veoQ4fAcSJ9jXrEnwKtPzUWeo+XA/cpAyR4OeMzfhr
         PalA==
X-Forwarded-Encrypted: i=1; AKwUvBx6X5gwr7/EvR23/C0vz7IPV9SiuaGDizAiwgyhm9mEOVwYRZvShr1OymippO6b5bNbfuEXGscd86KoIb4dLsjl@lists.infradead.org
X-Gm-Message-State: AFuF++mXCAZF/MKkrPLzXGnjnQp5Pn1gypsmNmiasA2X4s0VyHl2Aef7
	9vP0zOgCO+L2s5BwuhP/yd/0RoIMH6X4y6E019vbW/Lbk5LOSUhsl3+2qxSWAbJ6p4Y=
X-Gm-Gg: AYBFou2ebLEae3HxM1NENp2xOCnNFdtDfySx5cF+kN6Vg9/x524so8BZzuKbtig9kJk
	yk8Akwa7um3NKK15Eh5VWmGPq+yUzEBmuS/ncMEJXzlA32VBkFAPpdDFfeKlgn2vG/7avzRroFI
	fOAqRTQJ2M0paJV+O8fA0OHPaHdGTP68JRqOLJRcqbHQSXMAONZESknYk5VaJ8O9Ad5+zYxZiKf
	XPl8UlTnV56nGwxWqQyiikESZDAa6VU57cYLGeoAcaSSZPAJDk9iW9OPN++3Efw4RH5S9633X0e
	rKQfYKBJEa40Rw/PdiqoZ20p6pAea+1ziy44Ol0msGFDge1yNmWVirdydRNC0h2rSPrpiHFnwHf
	GmvcOJa82B0GiUXRh4UAJsq85+c6M/1AJA0ArCw66IEzG0Ty8j/6hzvqnD5a+so1tPWDSWPNUYi
	ZI9nZhRSUs8peoQQtMb4d+wfozeEUyMJqUnJjne7bISgLcXFG3XmlUu0vjQM4mPu+zVVSuhyGil
	YWf0ypvOuXOujGzP3oWmSJJxFXd8CB90P4ADn5edYvJOPg0MYayRfJI
X-Received: by 2002:a05:622a:1ba0:b0:530:b2e1:2f3b with SMTP id d75a77b69052e-5329b61d526mr11929121cf.50.1789662928648;
        Thu, 17 Sep 2026 09:35:28 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326208ea78sm56756741cf.24.2026.09.17.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:35:27 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:35:19 +0000
Message-ID: <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>
Cc: Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com> <aqlgxKGk_AEKls_1@localhost.localdomain> <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop> <aqqONH8flTIpOUqT@localhost.localdomain> <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop> <aqqpRoTfywUuTgoC@localhost.localdomain> <aqqsAUVV8a1yrQzX@localhost.localdomain> <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop> <aqq0cwvRDsorGwgc@localhost.localdomain> <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop> <aqvZwfUVsiEI7q7y@localhost.localdomain> <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_093530_099843_FA09809D 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, 17 Sep 2026 08:40:10 -0700, Paul E. McKenney wrote:
> On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> > You're right. So we'll indeed need to reuse the deferred qs points here.
>
> Except this is getting a bit involved.
>
> Don't get me wrong, if Josef is happy to take this on, far be it from me
> to stand in his way.  But if not, we should be willing to treat this
> optimization as a follow-on effort, whether by Josef or someone else.

Follow-on works for me. For what it's worth 03/13 is already fairly
close to what Frederic describes, just outside the core flavor: no
task-list scan (the GP waits per CPU for a pass through __schedule() or
an EQS), the irq-exit preemption path checks the interrupted IP and
queues the task as a holdout before the switch, and the holdout is keyed
on where the task was interrupted so nothing is needed from the
trampoline tail. Moving that IP check into the tick / rcu_exp_handler() /
deferred-QS paths and reusing the blocked-tasks list is something I'm
happy to look at once this has settled.

v4 will pick up Alexei's ask (reader emitted by the BPF JIT around the
fentry and fexit regions rather than in the glue) and the idle-CPU hole
Sashiko found.

Thanks,

Josef

