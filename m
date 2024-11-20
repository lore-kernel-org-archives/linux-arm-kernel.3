Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459EDD711C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFHW1yuZZLm+TyLZbm5x3CLYzm52WpF6KpYXZUZOuxg=; b=my6Xa95ZuwpOodG8G90Fn0ONUj
	ja//a94AryOQOZVmi3ayzqp23H8EIsABXPiVrfdQRJYZqwoyW9cNDYf9U3DSATNLPUo1E9igljaLg
	ZgkltI4G1/+hRLK/CuRckycp22TFUXg9zDoIpjfvzqWBoWQaoelThjq7mW+NyoWK46usutCVIafC/
	O/8CBI4H4He6kVD8ipCzWc2OZH2xZB0pRtH1Ck5F/ZD26rF0eUucBHlurg9xkX/104QTB83OXvZJl
	2G8Yxo90U6dbxzP7vz1no9Rsh3PFWx47wxQ4fczjtOc9N6I1Jvyuu93Z+Xe9hWBsch5pVyENbsGwX
	LVlB3uyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoRH-0000000Fv1d-1QXq;
	Wed, 20 Nov 2024 17:24:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoQJ-0000000Fuqi-2kij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 17:23:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ea379ef02fso27515a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123406; x=1732728206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHW1yuZZLm+TyLZbm5x3CLYzm52WpF6KpYXZUZOuxg=;
        b=G47zUfMbU0Dt5k486Q0v/c91ZtuFBEXjykqW1e5je5imLcsz/qOllebs3sbmJ9rDef
         HdRU/Ic8wq+d2taIMz8xf3KqqJ2Gc4eF3vc7qOsfIreckIYmGXIf9Vd8nNPfjsK6xve/
         Y6EYHO90vs32liGXtqWVRph8MOnrEj1WYmZOnxSV8p2A3h4iopwG67/3aGUAAzYiQSDh
         E41lMsgyqttisH+ZfYK5G1JaKuDhXNOcGAoT22/3KvzZcimBzFptm8kQvB5L+GOzGygU
         Fc9ZGin3dluDDwjoLvMDnYmfMUDyqv89n8mgjg+tYnDqDfhzXdt/v9Zk5lFca6eHtyz1
         jO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123406; x=1732728206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFHW1yuZZLm+TyLZbm5x3CLYzm52WpF6KpYXZUZOuxg=;
        b=DWs/l56VjiivOF3y3v5WYstDYHSs4xCV1qiQLOv1EuDjSNbsnzMAXuBaMeP4tCVVHF
         lz7P4YY921LwhEBghkdwg8zZ32tjX36xy16ON5zjCSGYCt6+XsuvT/6sbvoI9c/6Yfxq
         clOotcJcdch2htBxG3J1wX5eQkeElnRNB9THJrpCzzTDuUGtT1CeoYn2XbkHahuRfnOg
         EdJuxoCmLgyI+kupSC889qgjaIJlEXbkYdK0PWnfsizEIqXlpdcigYdYmdSvlrOuFoct
         XtjBnbS4SskROARTbvvxDmmYFWyEgVUkNpEmAg73cyW39CDFyBCeGEDl5XUztF8Lsm7m
         UWig==
X-Forwarded-Encrypted: i=1; AJvYcCXT4LPy01OrHe8UWvqMUHijOp/P7GX2zvgSLvwuhkaD+R4z2RAdeecGv66dWuJzhg+0/Jp4tM9OlzQd9xcrX1a5@lists.infradead.org
X-Gm-Message-State: AOJu0YyDLwdiuHIkBjNBflRaNeXuvXp2cNe71OnysAf3t/X0SGGPCQ3s
	ByS3EMSNP5dN8uuNKunGl9JM4BmKN9lM4FLzVYW748A4TDoqz22zPn7xZnicrrMk2wA+WNdhijI
	wk0Lfqh2WCe2RDchoAtt9+jqqDPc=
X-Google-Smtp-Source: AGHT+IHmU99QzKqQHpCseY8baqlMhIw/oJlWpRrEPSQmFS/0a2TRodl3EStY/QfZqpeLzWRchDtrlaIkbPnx9yZ9EXY=
X-Received: by 2002:a17:90b:4a4a:b0:2ea:853b:2761 with SMTP id
 98e67ed59e1d1-2eaca7e6a5fmr4440543a91.37.1732123406448; Wed, 20 Nov 2024
 09:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20241028010818.2487581-1-andrii@kernel.org> <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com> <20241120154323.GA24774@noisy.programming.kicks-ass.net>
In-Reply-To: <20241120154323.GA24774@noisy.programming.kicks-ass.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Nov 2024 09:23:14 -0800
Message-ID: <CAEf4BzaVCg6LcqT8i60ZpZ6Qz3+xMMp_HY1ao4-UtARTPMb=Lg@mail.gmail.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, oleg@redhat.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jolsa@kernel.org, paulmck@kernel.org, willy@infradead.org, surenb@google.com, 
	mjguzik@gmail.com, brauner@kernel.org, jannh@google.com, mhocko@kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz, shakeel.butt@linux.dev, 
	hannes@cmpxchg.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david@redhat.com, arnd@arndb.de, richard.weiyang@gmail.com, 
	zhangpeng.00@bytedance.com, linmiaohe@huawei.com, viro@zeniv.linux.org.uk, 
	hca@linux.ibm.com, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_092328_597696_B2DE61D7 
X-CRM114-Status: GOOD (  18.20  )
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

On Wed, Nov 20, 2024 at 7:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Nov 20, 2024 at 07:40:15AM -0800, Andrii Nakryiko wrote:
> > Linus,
> >
> > I'm not sure what's going on here, this patch set seems to be in some
> > sort of "ignore list" on Peter's side with no indication on its
> > destiny.
>
> *sigh* it is not, but my inbox is like drinking from a firehose :/

Yet, you had time to look at and reply to much more recent patch sets
(e.g., [0] and [1], which landed 5 and 3 days ago).

And to be clear, your reviews and input there is appreciated, but
there has to be some wider timeliness and fairness here. This
particular patch set has been ready for a month, it's not that much
time to apply patches. Liao's patch set is even more stale. And for
the latter one I did give you a ping as well ([2]), just in case it
slipped through the cracks. That wasn't enough, unfortunately.

I'm not going to advise you on handling emails out of respect, sorry.
I'm sure you can figure it out. But if you feel overloaded and
overwhelmed, consider not *gaining* more responsibilities, like what
happened with the uprobe subsystem ([2]). Work can be shared,
delegated, and, sometimes, maybe just be "let go" and trust others to
do the right thing.

  [0] https://lore.kernel.org/bpf/20241116194202.GR22801@noisy.programming.=
kicks-ass.net/
  [1] https://lore.kernel.org/bpf/20241119111809.GB2328@noisy.programming.k=
icks-ass.net/
  [2] https://lore.kernel.org/linux-trace-kernel/CAEf4BzY-0Eu27jyT_s2kRO1Uu=
UPOkE9_SRrBOqu2gJfmxsv+3A@mail.gmail.com/
  [3] https://lore.kernel.org/all/172074397710.247544.17045299807723238107.=
stgit@devnote2/

