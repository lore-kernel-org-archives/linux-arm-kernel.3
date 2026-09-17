Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AFDC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=; b=fUn37zpLUxNKhgIYpyUnqg5kt3
	lbLOf+YINO4d6Cg+f+kM7mt/Wn0ueheupqz1Jp4lI+xN2ngQNmgeKLiq+YdqorTfUhEpPr899dRje
	IC7aLAyIZ6ZXwdv2r2DAogCaZZBDPEi1q5hSGo6JOy0N06xHJGiiPwrRy+nCVNRoLE4NpWCmEqj79
	2OunbREnckSIZ2ISVwBb9BiEMImg6u/WVGBOr5nBs8yJ2EwPQN9U2EN11KTg+3ovry3srA7ojbpor
	MN7TY50SeioNfogkZaf5wLQca3Gbw6e9CNGbDjn8d7LCdnBBApT5k9lojQPEbgIJe4yug85fpgVqu
	q+gov5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71nZ-0000000ASUN-07mr;
	Thu, 17 Sep 2026 02:24:29 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71nW-0000000ASU0-2UCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:24:28 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fbef5018so3501335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 19:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611865; x=1790216665; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=qI35/Fnei+2ANWBYvBmL+wJH3lFDRTwKDkk+bWEqVOuvjh1H9PmV4IGW4KjDuI6qDK
         4tiyLc3KI2yCeDlC8FaBzjlHYwsR1DO1UlvrsTtraqiNzfmmUkCViSutFJWXIDCVTU0J
         X9NI18cC1QBujfiB99Xfu+bVv5Wvd2x9zkiLSu6rOi2qbq1k1e7Vne/4vUk3YrFxQEmj
         TNYN9+NI1scEllx1dqrtP0cCiayEomgArBb/sdaXE2bybh7yRIGTfJi894pxP/1Wp25X
         NNkR/zWMoeOxiYKjDYTgX77kGLTMtC2CL43hKsRMh2GJK51BI44Uq+Gh1DW8JkD0zWEm
         h41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611865; x=1790216665;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=xvhdKVuGcrpJy6HYR1o6tU06ttD3Q2o3/lCKVnKw3V18KYrBiDXlC1Dbu6EAP6EpGX
         EuRl9/XgK2KRNw5OvUvcBEJ/5+ny/JAGjn2pip/vWf+9omp4fU6LeZv1KKOpqw6kVXs5
         Aw0TDU2LChq6wgktnyLAhzXfsJTHvgI1er81BMrZTePWrSl/HQkzFcbmbmI+bXuqZWT4
         jTMwzD6ziKJI//ij7bYVDGNhVNrJvjxJmhE59GqmctC7T+sE6pWtw67yMnTuYziiKoBO
         Tm+UpVGt5z8qyQearZrZM8Pp8ywm+jJd+NWX1VpSYGydnyAwM71+02yA8by9PbWY9WPU
         n5eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/BmbOttVO1mg2wa6klLItSzVRzJrq5eXm+JwdmZCMQ4w5NwoL4CW0G2+hnXOy6F+kgs6hN/y1oBFB5aBAfcMC@lists.infradead.org
X-Gm-Message-State: AFuF++kMmk5OCfJIFJ9+1s4Lwxx538mzG/qv+n9o4hsRcABXniWtwjBJ
	E2Fx/v7GPZf0+jP+fXYyiomYjio41x/S2L0+OtRIZiovwpefeKWFDay2
X-Gm-Gg: AYBFou15uDU9sbBf8gv9kzpMGvMevFaYVy6wN54Dy626Lps5ihKs7+37303iUJmxxD6
	CSCEO+i3+e9DaBRIC+FkUJBzPyKfeEJ/LLV4J4X27VPu3gPpaabhHiNwfpXvpaHttvfe/3Cclgz
	H2tKNzsi+VOdftL344VZZS5JruvUzD/lwfu4Var0q4rBy0TuHkYMasBF63W/Ss3bFts1NT9apAi
	1hwyMDdG1he90CyijFxLb4OyDzI4Tdb9zdgXF/NwV0rNyrNkpQGtmp6BV9vSq3nUUbf+qF+BjEb
	M1WDzzAp+Ka2DgXB3G6sc0bgehnQP9jjNhRTk2EXI5yklqLAoLdOOZIreCrVBDcLCL4kO3bKpsD
	LeSFO6YZwK3hj/IHTnORVj6PrTNHukpvBzvgp6Xc3JG6iGVZ7/3/d2fPx6wHjxspEerBzsmYfsK
	ox0wY1aBs+P/6gKpLM62c7EV11CNdP++1J4c6UVt6R6gBfGvZbCvh1zJusTI0ECyJUeyFiB9mhd
	Tp3ejWwIJsxOA2dsPSTK5wHez+86DjkWzF6P4IIFjxEhGH9B7MlrhPRQyi5jC/Rzx9J9tX2pJzS
	7AE8
X-Received: by 2002:a17:903:1ac7:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd8e3f57f8mr114351815ad.13.1789611865419;
        Wed, 16 Sep 2026 19:24:25 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee3557sm18694235ad.52.2026.09.16.19.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 19:24:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 02:24:24 +0000
Message-Id: <DLH8GKM4B06Y.3HTSEM5YGFR5D@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the
 trampoline glue
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com> <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com> <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
In-Reply-To: <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_192426_633342_3BAE5470 
X-CRM114-Status: GOOD (  14.24  )
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

On Thu Sep 17, 2026 at 1:16 AM UTC, Josef Bacik wrote:
> On Wed, 16 Sep 2026 03:45:16 +0000, Alexei Starovoitov wrote:
> > On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> > >  	__acquires(RCU)
> > >  {
> > > +	bpf_tramp_read_lock_trace();
> > >  	rcu_read_lock_dont_migrate();
> >
> > This is double increment. rcu_read_lock_dont_migrate() includes
> > rcu_read_lock_trace().
>
> Unless I'm looking at the wrong tree it doesn't, on Linus' master and on
> bpf-next it is
>
> 	static __always_inline void rcu_read_lock_dont_migrate(void)
> 	{
> 		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> 			migrate_disable();
> 		rcu_read_lock();
> 	}
>
> so plain RCU plus migrate_disable(), no Tasks Trace reader. That is why
> the non-sleepable glue needs one added here: on these architectures the
> trampoline image the glue returns into is only kept alive by Tasks RCU
> while the task is a rcu_read_lock_trace() reader, and rcu_read_lock()
> does not give us that.

Right. I got confused. Since rcu_read_lock_trace() CS will cover
both sleepable and non-sleepable prog types let's do it once
per fentry+fmod_ret region and 2nd time for fexit region.

We probably don't want to hold it for the whole trampoline,
since orig_call will delay freeing of progs.

