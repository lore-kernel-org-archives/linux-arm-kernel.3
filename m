Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCF4CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 08:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew5mxc5caN5gcDtxTwu7IwmhCpTzTpkvaeyIZ+j1bkQ=; b=xu1UVW3O0j3pXsT/2OtnGkeWgu
	3cxo2FKumpcvspjn4oSFcqYUc/5fKwyQWn7V5u8qxwgKqRlSTAzVlEs6ApwD3aL29D0RKz7477g1Q
	7SaqQCvIDsFeORuyxVBDE/f8+vrjnBc97u173N4Zc1cuzZOwaHZ7znc6RXdjQ9He5qt5b2lyLVvdr
	c0n5cqlgkDHFUP9pq8mI6EdBHI77m4UcFtADChm0l1Bgm2AmES+yWxrEs5lj7Dp4nFu/wj1s8WPGR
	yO4xmTKwKASHLYUSvPJnJgyESixj8u/PIMk4z2MS+J6eD+JAvzQqEX8gfOP2vcR4GO+OUtHUzDjvT
	CmZQ22eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuoZe-00000007Doc-2u7u;
	Sat, 06 Sep 2025 08:47:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuoWr-00000007Di9-0VSW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 08:44:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so3480908a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757148252; x=1757753052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew5mxc5caN5gcDtxTwu7IwmhCpTzTpkvaeyIZ+j1bkQ=;
        b=CoPpX4eY00uTxVC8tHHdJ4E3B/O+5Pq2HiDpQPT1Vy6yynFTHO9yMZkhaXRlSbExpK
         j9dEnyvqS2YuatR741h2KzxnJmg32tcI9RG+D7zqF7yxxo689pbb0qd+FdwVQo27HVUo
         ySbyFo9d4KcO62tFuXBr2BqMgkK/d3VvfSokhzTVLB2HJaHycnIG4JB1oNPwj3OsovXR
         WlXo29sE4wqeToDklyTKr5T+0vazUxGj2TqtORkkitDFHf/Z7FSYvgt+YViY9pXkAJ2y
         BHMyBKa7x1kwA5jgS2wS8cHvAEQqM/ab8qmnAkKccjZ/Ft3wnXJF42Zmv2JDAhUj7VW+
         Wwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757148252; x=1757753052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew5mxc5caN5gcDtxTwu7IwmhCpTzTpkvaeyIZ+j1bkQ=;
        b=b8mSfzyhyWrqmpLWC80tqurLwH0JamoFl5tfY5LLwM1rwcXKM74oWHGC9juXJAcKAJ
         rq2g5SEvtg3Eb7wnau7WN+7CWnkEXpyOl7bHPqk0AblcebDhzStURoX+idpYphE5EoB4
         v9rlb02pU8hgnttzLs29T4ib8NqZ23V5ExqUrhaWP729e4Y0hkdXOf/FBhEhoXCb5HBe
         g5VpBREFJWmHuugNL+lwWIThXdJcu/KRcs3Fxv1/FfL32AvKYlRQXiq6CoKrRLN7kwVR
         g87zJxcMTDP7DJFD+/3u//RM39oJjISTqZ55WYn5lkeyuG8SEzxNbb8LW0qdR+Pstm5P
         2lfA==
X-Forwarded-Encrypted: i=1; AJvYcCWX2XOHyzK824wOMpWJTgqlxBCihyHC8kKJupJAUYZHD1ufoTdetzwHrasq6up2uMvEbM93HE3Wj4XK52de5ULO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6nZwUtkos5iMeVZa0UvAJc0jBGUq5qj7RpIYGLG9oWNlFYJG3
	cEvdtzLxE3Dx0QAfCmHy8jj/fr5NiklsV56rq46+3/Bd/DSXWQsC0DrdslDzkLfBBTHvWy/buFB
	65fcWgQuNIaUGzbwzecxkzMrTQhQ9vLM6P2H55WJ7La8glBGcSWs6znc=
X-Gm-Gg: ASbGncsTWEqdQ/5PyWIAWLPgjR9A8CqNWSMTLVc5gvxBQm9bsBIHDKc6DJDEcNflUjm
	x6EpUDJ8QZ9p8j0z04fdkz6QP8Uo8qJSIcmLMFhUuhOTThJwG9VfuEIgRWc55gFfjnO/IZSUIka
	f7iKA6y3RrhxVM/kk76/c7bs2U/f+XnkUx8F45Vv5Sp2g/6FuerajmF0oGw+VAoCQ9sUiiU6Q81
	cYLrN/Rx2frbdQhKfR/wtyeo57TlGXJ1bGASdSeYVACsrdL1w==
X-Google-Smtp-Source: AGHT+IFWY6ZjZ54pmmCwZjzjcEHYHuEaPv0XvwL3Eflpm/wFl4W2+BYv03gcg0aI3CC8OEM/T3fJ+UI2CYpLLpEbOeM=
X-Received: by 2002:a17:90b:3852:b0:329:e729:b2a1 with SMTP id
 98e67ed59e1d1-32d440d9ff0mr2516690a91.35.1757148252335; Sat, 06 Sep 2025
 01:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
 <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com> <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
In-Reply-To: <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 6 Sep 2025 14:14:00 +0530
X-Gm-Features: Ac12FXyDB-xmFe72rMp4oqEaC6ssFIEBHl2K-2wenWmXDkTJZrm_JyQxx_K7VTs
Message-ID: <CA+G9fYuhDU=5b0my6yMy+ni=K_SFCRxncWJFvj0DVuLftTWYUA@mail.gmail.com>
Subject: Re: arm64/juno-r2: Kernel panic in cgroup_fj_stress.sh on next-20250904
To: John Stultz <jstultz@google.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Cgroups <cgroups@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_014413_177613_84023C9F 
X-CRM114-Status: GOOD (  20.83  )
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

On Sat, 6 Sept 2025 at 02:50, John Stultz <jstultz@google.com> wrote:
>
> On Fri, Sep 5, 2025 at 10:50=E2=80=AFAM John Stultz <jstultz@google.com> =
wrote:
> >
> > On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@l=
inaro.org> wrote:
> > >
> > > Kernel warnings and a panic were observed on Juno-r2 while running
> > > LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> > > SCHED_PROXY_EXEC=3Dy enabled build.
> > >
> > > Regression Analysis:
> > > - New regression? yes
> > > - Reproducibility? yes
> > >
> > > First seen on next-20250904
> > > Bad: next-20250904
> > > Good: next-20250822
> > >
> > > Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel pan=
ic
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Thank you for the testing and the report here!
> >
> > > Juno-r2:
> > >  * LTP controllers
> > >    * cgroup_fj_stress.sh
> > >
> > > Test crash:
> > > cgroup_fj_stress_net_cls_1_200_one:
> > > [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_2=
00_one:
> > > start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> > > [  374.230110] ------------[ cut here ]------------
> > > [  374.230132] WARNING: lib/timerqueue.c:55 at
> > > timerqueue_del+0x68/0x70, CPU#5: swapper/5/0
> >
> > This looks like we are removing a timer that was already removed from t=
he queue.
> >
> > I don't see anything obvious right away in the delta that would clue
> > me into what's going on, but I'll try to reproduce this.
>
> So far I've not been able to reproduce this in my environment.  If you
> are able to reproduce this easily, could you try enabling
> CONFIG_DEBUG_OBJECTS_TIMERS to see if it shows anything?

I have been running in CI loop for these tests to reproduce and did not
find this again.

I will add this extra Kconfig CONFIG_DEBUG_OBJECTS_TIMERS
and re-run to reproduce this reported regression.

- Naresh

>
> thanks
> -john

