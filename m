Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B15C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5zFJ55cgnEY1OXRIavKUOEIG38H34pgZ3VgFg2bzwY=; b=gMiII8bmcb2hzDEc2f3tL1ZX72
	MT8WX2YvxlQRR8iX+fbZ96DwZrGQBSH9E0KOiWMS388m+UhR+Tb07x2Pw5OU7Vr0p02t+uLaL/iug
	Yc7ClLjkn6wg/xSXB/b/EZTJkoYAX+MynuahcYz4pvOX6VGsH/J0IAgyZc1SXxPacS6nHd6Lm0uLf
	mW0nmIzb6ym2YdWkq5eGgqS4U/4qeGyyI9LZ0kEfhsmu5OpgvfFLpl083zGbguK3J4CZhQ81dGD93
	UJHx6FJ8r8PaXviX2bgo3ydErAMAxSJU6WerrgD7lR3U2Bzr7yeNyelbjs0MloZGqkZ8XJzxqgRPf
	UkJAJ+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70kV-0000000AOws-2LQx;
	Thu, 17 Sep 2026 01:17:15 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70kT-0000000AOwV-027w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:17:14 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-52fb767cc97so2136911cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 18:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789607831; x=1790212631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5zFJ55cgnEY1OXRIavKUOEIG38H34pgZ3VgFg2bzwY=;
        b=gBZ9Yq4ZLDaaDa1OQcGMl/lbBzcNTvRM6vEm/US6oBxDIrpM3feQXqbW/h93L7Xk6V
         lrWhKYDU6bJNK0fCcw8O7INJXbcHX02Hkf1RfBl8fU1TzJC+5YeQgGr3s37x6Xv1zKC2
         wYOyuPVby0FicUdae5IcXwR5Se+p/O97CFw0Nlz6Cr0wAp6CEUCh8iGilDp97NdTAQ2K
         WaSZBNBTz5i6jipl1A9h9bG7mt29QuVFzWbHL+ReyfLay72endKhFM1gR7yDtzR2jU1O
         uZj0WID3xT1QCIlgMRyz3PEZbrCsifUvyiL4tz5oHIaOJ2Rq9pOgEQabPw+oC0ezvqcs
         p1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607831; x=1790212631;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5zFJ55cgnEY1OXRIavKUOEIG38H34pgZ3VgFg2bzwY=;
        b=ERhfT6ht1t8A2KYjE0rMzeM2+SvVwybWpMX6S6OtYnc4YWWhWHaJXRjLd4LqNWYALj
         m9c7J8HQIMr4rILbXKxsOOtKb7lBjvDDY+aHEA51Chki1GBJQTxFQlUepnipGeLd3v2d
         Ud0oe6Ta40jNjUMdNW+D2h11XrEFA5rKsS3JVX44SklVaNUTigZo0OFs132t39/vrgOc
         TcszAqnhAJhl446nYWNE3OXVI0Og9ZrGsqFYcIPlMcEdI2ildSa7+C0P6W6EubHFcERn
         Y1B3V0upLHzMJT85lBvTBl7x9Nhv5v/BRbPMby98TRVIWIALHbd2ClYp40R5lzLVdsTu
         Pf5g==
X-Forwarded-Encrypted: i=1; AKwUvBwqVcfYRobxhG28BgBD3tG7iWlqFVCQoSJH/ABzjokBnRVuN8M/rBrmUo6NakFiugErPVoRYnwxRzz/nN42PgHe@lists.infradead.org
X-Gm-Message-State: AFuF++mm0TfHDbWzwHsWCnw3cp9K6F69N5KwTj4uz3fscKXMata1w6N7
	isQNRODWJLzpyMSmfqCjsEcxrmFEyZFbh3nizgfzG1leIZsd3srZB7URt9PYX3HfGak=
X-Gm-Gg: AYBFou3/DUTKklQN6rSLWuoeAk9c0ItWcz476JzXr7LmUQmsHD3qwKvGX4Qz39pDhx0
	ka1roEVCFAHN4rNmOUaTrcbqXSJmcqbfAGAhVy7bW9yfQTnkFMc3fMnu6SjYhLr3C9Vf8ugdzsL
	+QKef7z7jv5J24KjunMQQ6hLwV/hv7NgGtYO22TWBPCEiiCpHRlPY7IvQev2HSCRyNCswiOAg7C
	iYruAOHPk7flSJxtumqHftuftAoqY0SIz1WE9CnmVHjAK/8sFj4qoXMb8KJCBlgZbbNv2CfWbC+
	MvqV51FhRSd2g1Haxn0jgt0JlCo8t2N8S7lpmETZimFlTUTiiTZvDWL5iA8M66srh7Ksrw6ab5b
	6fvGGmLAYLEMVDj0DKMTwPW6/OX3GT21Rx4U+iPWPcAL9M49en9Ck5HiTDDIpQBfq9g5ZJkylFk
	iwxwJ/24UO3/z0Jv5DOBX69AhKlDPnUfHmWSUzXRQF0gORoTAPF6bYkWOGC1DaXVULD30Zig6C+
	nFyOfL4nRaWijK3ljGSfKylFFP2aMw0uNtE+ISfDyjHh+Kw1h8rqA2V
X-Received: by 2002:a05:622a:1a93:b0:530:4249:e7a9 with SMTP id d75a77b69052e-5327ed78742mr91407171cf.13.1789607830859;
        Wed, 16 Sep 2026 18:17:10 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326200b8d1sm35571491cf.12.2026.09.16.18.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:17:09 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:16:58 +0000
Message-ID: <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
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
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the trampoline glue
In-Reply-To: <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com> <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_181713_063250_2B344DCB 
X-CRM114-Status: GOOD (  16.21  )
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

On Wed, 16 Sep 2026 03:45:16 +0000, Alexei Starovoitov wrote:
> On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> >  	__acquires(RCU)
> >  {
> > +	bpf_tramp_read_lock_trace();
> >  	rcu_read_lock_dont_migrate();
>
> This is double increment. rcu_read_lock_dont_migrate() includes
> rcu_read_lock_trace().

Unless I'm looking at the wrong tree it doesn't, on Linus' master and on
bpf-next it is

	static __always_inline void rcu_read_lock_dont_migrate(void)
	{
		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
			migrate_disable();
		rcu_read_lock();
	}

so plain RCU plus migrate_disable(), no Tasks Trace reader. That is why
the non-sleepable glue needs one added here: on these architectures the
trampoline image the glue returns into is only kept alive by Tasks RCU
while the task is a rcu_read_lock_trace() reader, and rcu_read_lock()
does not give us that.

It is two counters for a non-sleepable prog on x86-64/arm64 though,
rcu_read_lock()'s and trc_reader_nesting plus the SRCU-fast percpu one,
if that is what you meant. I don't see a way around it short of not
using Tasks Trace as the trampoline reader: the prog still needs plain
RCU for everything it dereferences, and the image needs something that
survives preemption. It is compiled out on every other configuration and
nothing changes in the JITed image. If you would rather the reader be
taken once around the whole image in the JIT instead of per prog in the
glue (which would also let the fentry-only teardown stay a single grace
period), I can do that for x86 and arm64, it is what v2 did with the
private counter.

Separately, Junseo's "bpf: keep trampoline progs alive until image
release" also adds bpf_tramp_image::nr_progs; if that lands first I will
just use it here.

Thanks,

Josef

