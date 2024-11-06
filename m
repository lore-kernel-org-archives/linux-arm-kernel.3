Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893BD59F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuM9FPVYlyiO8dA3+OPrpH3HUSy+nPdZ2IbMvNIALEU=; b=L4aomkuzkINgq3JkQPSag1UK1I
	Sp0Dcpf4+amM5LMgDNPx1xAjBG77BHrYbF5zdKdDzD+IGTXb2EU/xlSzJr+xCXaYlrGiFU7sK5e43
	M5OgrFM9Z3BcOdAuVUNgg2l//6j9PCvMv0OFGWsbvq/lKxDXcnaHCubbp1FdDGJIQPmvjePrElTcx
	OxFhg1aP3BnT4mj8Cxa1rJzzDr3jhCEEog5XOUgGelKVU2Y7BiaRbK/p6wQF342DLuUUJtm9yZ8ao
	CYZwSwtLXLQzDGvAs5VhlvPL2vpiIjrNjYsSK2pBcRzyn5/khXugQO6sakhIGTj7es1n0SGoylfvD
	UvRL9l9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iiM-0000000404i-11Rs;
	Wed, 06 Nov 2024 16:17:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8igb-00000003zgj-43n4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:15:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cbcd71012so79531575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909713; x=1731514513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuM9FPVYlyiO8dA3+OPrpH3HUSy+nPdZ2IbMvNIALEU=;
        b=cJW3conkF5Eywvdf3QeAImmT61xx04fM0UKfmmnD89lIi/zHP4R5i4j8hYp94A2Jju
         mU7Or23j4IGLVoXQeh/kzt2dn0TD09mU2S0Gq4lE795NWlX/ni0UuTIlSTi11rqyFY4v
         f+dbWHqUwloZUMxdjILiKMBT0vMd+g2dKo51GDDmMlRlnW2lzODRPBsXqQn5GHJlBvPG
         zFePBUGtn4bi9+zzwZEE6kArkqfMKOBVhtVFktVfMOU0RKS9zJKUm4fq3ug1Dz9jeMSC
         uM7WnpIeiu2ATGJAPbvKAtxqqmlBTfzceTs1BuCi0tEOCB1lmyjcQTlfbuUUEOLARAcd
         SfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909713; x=1731514513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuM9FPVYlyiO8dA3+OPrpH3HUSy+nPdZ2IbMvNIALEU=;
        b=HRQFMx4BaQMkoFi1QHlKT90xC2FrO+M0mnSOhVMGkFFHNcxPtcmrDydNvLcrHnZjJx
         1f5x4VpuWyEuFueHLR/8mtzwwqgcUqhnXnuTtMbD16yHNX3Tb2BChxp+H2a/GI1blWIL
         PjztjWNBX6y5J0taKXCSJLLpp0T2MB+6xq1UsLpl85fP3vlTnoWFv3Zem4H1WYXGoW/C
         6sxgCwCAhMhw691y5d8aZShDR70SyHa7MeoHvoAbli/72978O5k1PK59+Qt/4VIeqkzC
         8/SP/a2Os+ga54H4+r0Jp8tRpGCuRGNOXRn1drdLlNN+E/pU07cf0KbbgZLl4wFqlboB
         KHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUsD1X2+g2hSfQ/clwJMQYtWlKbyoMnKa5lPbXw8B9KAUP+i1usIiJXDs+glxudQc74D8k40NLlfPWwzK3gCRaN@lists.infradead.org
X-Gm-Message-State: AOJu0YzvYVlY+xvS4Gbmj6516BT1KnJhYq1ZqHcV8DwxlzC0AcwaT2kj
	4EMe01mHG7W1kJnE4PZqGhbIgg5KOElIHT8CptJIvMHpTDClnp4LGENmLmYbdjH0vRyFPNe2udX
	9jRHBeeHc0npf0NM9Vo1dmkOTTgo=
X-Google-Smtp-Source: AGHT+IGE7as/zhJ/0hEXJE5Nd8KS+oVlK6xJ3ACRVLTTH5+NKKQj62K4Tvc4N/owmW8kKUkfFogKU95TIgG/KpD68IE=
X-Received: by 2002:a17:903:2cd:b0:207:6fd:57d5 with SMTP id
 d9443c01a7336-2111af38936mr255571785ad.36.1730909712511; Wed, 06 Nov 2024
 08:15:12 -0800 (PST)
MIME-Version: 1.0
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
 <ZyH_fWNeL3XYNEH1@krava> <CAEf4BzZTTuBdCT2Qe=n7gqhf3yENZwHYUdsrQP9WfaEC4C35rw@mail.gmail.com>
 <20241106104639.GL10375@noisy.programming.kicks-ass.net> <20241106110557.GY33184@noisy.programming.kicks-ass.net>
In-Reply-To: <20241106110557.GY33184@noisy.programming.kicks-ass.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 6 Nov 2024 08:15:00 -0800
Message-ID: <CAEf4Bzbv_kv11STXafjdO3FsfyMuMNEG-=xWpeTw1cJdMHj+gw@mail.gmail.com>
Subject: Re: The state of uprobes work and logistics
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liao Chang <liaochang1@huawei.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_081514_066369_5DC6CE2B 
X-CRM114-Status: GOOD (  29.20  )
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

On Wed, Nov 6, 2024 at 3:06=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Nov 06, 2024 at 11:46:39AM +0100, Peter Zijlstra wrote:
> > On Tue, Nov 05, 2024 at 06:11:07PM -0800, Andrii Nakryiko wrote:
> > > On Wed, Oct 30, 2024 at 2:42=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com=
> wrote:
> > > >
> > > > On Wed, Oct 16, 2024 at 12:35:21PM -0700, Andrii Nakryiko wrote:
> > > >
> > > > SNIP
> > > >
> > > > >   - Jiri Olsa's uprobe "session" support ([5]). This is less
> > > > > performance focused, but important functionality by itself. But I=
'm
> > > > > calling this out here because the first two patches are pure upro=
be
> > > > > internal changes, and I believe they should go into tip/perf/core=
 to
> > > > > avoid conflicts with the rest of pending uprobe changes.
> > > > >
> > > > > Peter, do you mind applying those two and creating a stable tag f=
or
> > > > > bpf-next to pull? We'll apply the rest of Jiri's series to
> > > > > bpf-next/master.
> > > >
> > > >
> > > > Hi Ingo,
> > > > there's uprobe session support change that already landed in tip tr=
ee,
> > > > but we have bpf related changes that need to go in through bpf-next=
 tree
> > > >
> > > > could you please create the stable tag that we could pull to bpf-ne=
xt/master
> > > > and apply the rest of the uprobe session changes in there?
> > >
> > > Ping. We (BPF) are blocked on this, we can't apply Jiri's uprobe
> > > session series ([0]), until we merge two of his patches that landed
> > > into perf/core. Can we please get a stable tag which we can use to
> > > pull perf/core's patches into bpf-next/master?
> >
> > The whole tip/perf/core should be stable, but let me try and figure out
> > how git tags work.. might as well read a man-page today.
>
> I might have managed to create a perf-core-for-bpf-next tag, but I'm not
> sure I know enough about git to even test it.
>
> Let me know..

Looks good, thank you. I'm merging it into bpf-next, testing, and if
everything looks good I'll apply Jiri's patches on top.

Tag is more so of a promise that everything up to that tag won't be
rebased, otherwise we'll run into tons of problems during the merge
window. That seems to be the case, so I'm proceeding, thank you!

