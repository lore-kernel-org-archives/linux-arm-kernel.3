Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FE3CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZNSRiDXdNQz/tad0D1XmKJG1e0NsSfjQsVpDvD0C2s=; b=fj3VcfssA+fB8+IepJAxiPRQ5d
	CSbB1gHyadAXcyn71M/8FEWXlZlh3U5GqJpmpbIwa9pGpB/9DiweYcfGnNlvXPSdwIE+tbUGsY4xQ
	+pf1pRaQ5gAg07Dkp5U6clXzB4Bao/nTNoKqxbu9W/RcxZLL8t+Fdp/2lWnxLKOj+YHKx7u8fpxDs
	BQWg0A+ONFc8s58d6Od22CjSuV6lVcml5BcqYxJtTDjOZK1oDlrKOcInajh7QdsIhyznM/Y4UshiD
	aQ5Zxvj7/fxtDaZNeerXYXxmSKJV1axM+I9xdkSCSSuKvD+UULwxza0ux1X9v1rH9u1I41XiHT26C
	jEd9FLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4vC-0000000Gvmz-1LxX;
	Mon, 18 May 2026 20:50:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4v9-0000000Gvm2-2bC2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 20:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74DAE445A0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 20:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB4BC2BD00
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 20:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137438;
	bh=ypIdx4acKlGusOGofl1Rgy+13Usr/bMeabAYI7vNmVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gk0707fUsk9yWgyWpyCE0usmgctr/2kAHAruO5+nioCbF3DwOXvh3XXJOYYbLkzh5
	 hJ2qI4xZH0TRSFfRaiQZm8jvvSk+DkKMuBR24TjklCVhNb8E02lgN0am+P2km4x9hl
	 l3nDU0T5UpVuJP450DPP64O/nI/FWXc9L0PtdXkLhmZvxkOogzxRVtHB3So0FEMwk9
	 HbI5Rpppz0/1ai5xW+yywawcmbLarPa3mDD/r8dZtjhp9DVlB9KD/EmgzDTH8BwZDU
	 +K9SIW2+RAVZM0fzFYPAz7ugIMm6YeBB/wVGB7FhjefXLk4pr0Zz3bb6JKqwuQ7FFH
	 u1yF44PQXOp+A==
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so1711023241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 13:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7kC6p1kRDVDJestbN0RMpBRRd0swEseM/WcsSz6yrMEbqN82ezzhb21jCgOXlCwEEiTCCFgd0i0YkgrAur87m@lists.infradead.org
X-Gm-Message-State: AOJu0YxLmtkwxzPfCSjcb8GXJWj+Z638t3lBMn4tRr8kYJ5zMDFOXJBN
	7E06LP1p8i4ZVsATEgyCfQv/sHqTVI7UovlvWb7sGmH+1slgCiGCa5WE1bsvFmhgfVuqXRUEuKj
	M/otat7rUYAUQCkJOHC2gO5iOKVpgpQg=
X-Received: by 2002:a05:6102:1497:b0:632:eef7:4b7f with SMTP id
 ada2fe7eead31-63a3f38ed3dmr8946550137.22.1779137437454; Mon, 18 May 2026
 13:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <ags7mPK7Ong0ZsBf@casper.infradead.org>
In-Reply-To: <ags7mPK7Ong0ZsBf@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 19 May 2026 04:50:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zBcx2OF20pE4r2FNUXuF_E_SkS2scFS4b=G6v-GCvXYw@mail.gmail.com>
X-Gm-Features: AVHnY4LxjbpsTxssULoY1o3L0OWdx82GerNYGpv8290_rAwvBTy9PmnU1AhgaaM
Message-ID: <CAGsJ_4zBcx2OF20pE4r2FNUXuF_E_SkS2scFS4b=G6v-GCvXYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_135039_700560_71E49479 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, May 19, 2026 at 12:17=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, May 18, 2026 at 07:25:54PM +0800, Barry Song wrote:
> > We have clearly observed that the `fork()` operations of many
> > popular Android apps, such as iQiyi, Baidu Tieba, and 10086,
> > end up waiting on page-fault (PF) I/O when the VMA lock is
> > held during I/O operations. This has already become a
> > practical issue. I also believe this can lead to chained
> > waiting, since the global `mmap_lock` blocks all threads that
> > need to acquire it.
>
> It's always been a terrible idea to call fork() from a multithreaded
> application.  For example, this question:
>
> https://stackoverflow.com/questions/53601200/calling-fork-on-a-multithrea=
ded-process
>
> or this lwn thread: https://lwn.net/Articles/674660/
>
> Do we have any insight into why these applications are doing this
> horrible thing?

I swear I read the two links you shared. But the reality
is that as long as people use the Android framework,
even the simplest "Hello World" app already runs with
10+ threads :-)


main
RenderThread
ReferenceQueueDaemon
FinalizerDaemon
FinalizerWatchdogDaemon
HeapTaskDaemon
Binder:1234_1
Binder:1234_2
Signal Catcher
JDWP
...

Best Regards
Barry

