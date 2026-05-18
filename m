Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DA6CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs2uqTkIc7aAMCm9u6DZxVd5AsfHqGkk6OElJunpKgE=; b=OkkxVaKLoGwVV8JSFuBvKCMHee
	2trmYsgxrGY8HBuJG1lfDlLwf/V9JQk9/n1WI32edJkDFkoZlgkIj1hHiWt0kXHQV/Z/VH5CGMjXK
	v/vZL595LA4VS51kcgWN2KbhT64YTrLysWV677WqGd3+QK/bh2cA8iIq56Ued63RQerRd+aGvzLd2
	qhbFWhyZXsMT2Pe7IvLI1cCSAKzi79elvMhY0ZP6fb+IXlI3gQ0mMWbl56dEISeLIeeVgyNBBhM0r
	aJWEGUkKHYM0R0aneo5zIfzWPdakAUqqJUHmeHKnjbMAV0DF7KEocCD9pYeCYW+iFWFAZcW4hef7i
	wiyQLL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Ik-0000000Gy83-05TT;
	Mon, 18 May 2026 21:15:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Ih-0000000Gy6Y-0Yks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CF2C445BB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 21:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5142CC2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779138898;
	bh=rs2uqTkIc7aAMCm9u6DZxVd5AsfHqGkk6OElJunpKgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LKnQHg2EuuoiFeAFnxbyqE2fDmZVEFfJR4ym+5yVJgFpQm71jto6sLdg5WZBmxtnG
	 feASvKZV1Hz5s2U3CIOgVNjCbMO2KjX0U8n0MqD5oIETyTM4cq2dp1kF8q1re74vLb
	 j2vE2OH/h90vuhLO9gHN2qcX8iyk6Gj1VD31+RAQ6EyTWZ4iOjRfdPPOVrvYcxkaZB
	 XBfLDuqUgKG5MGYNKIrR4nHOZTbtTfEwI8Yhu+ZJ5BbOAt8fRt2kA+h5FZmAtjQcpZ
	 rnFDFHuQ6kgr2W3lu3RNNXviIak6dJ8MP1UOPZWyzYJ4m9mWzT3WG+SsY25Gg+DtTb
	 3+Mm4p2TcK06g==
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95fa8111713so406381241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/H2ltDdSEqshWDUnPZ5UwMDu61EhkdkzHcJi4DUnglTgM5i/m4vhNFXaF7qiYmHZbZKCD1f1qe+2QNVuEw/G0h@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7ySxlD4oTLoFzVSLcJxIt2yCqDytDJ4ZJHOHP6ImKwtASxnJ
	yRixriQWeDvlefMMkQhJeUPI1rXW7qYlhPOvFsMB3MQLvPCG3h6S76vJhWjGhNNt3dhgPWd9U9i
	JcsfVUWSJ5svLu9JJBOnU6V9zRquJmog=
X-Received: by 2002:a67:e70a:0:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-63a3ee862bemr7850443137.19.1779138897435; Mon, 18 May 2026
 14:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
In-Reply-To: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 19 May 2026 05:14:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
X-Gm-Features: AVHnY4KjG65G1ecWJLmAXfyGgeXMxqs_Hs937nQXWNlaevhV7YwGMAI3sK3pWtE
Message-ID: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
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
X-CRM114-CacheID: sfid-20260518_141500_020078_D4C35B05 
X-CRM114-Status: GOOD (  19.25  )
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

On Tue, May 19, 2026 at 3:57=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, May 18, 2026 at 4:26=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > On Mon, May 18, 2026 at 5:47=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org=
> wrote:
> > >
> > > On Sun, May 17, 2026 at 04:45:15PM +0800, Barry Song wrote:
[...]
> >
> > I think we either need to fix `fork()`, or keep the current
> > behavior of dropping the VMA lock before performing I/O.
>
> I see. So, this problem arises from the fact that we are changing the
> pagefaults requiring I/O operation to hold VMA lock...
> And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> anonymous and COW VMAs only while holding mmap_write_lock, preventing
> any VMA modification. On the surface, that looks ok to me but I might
> be missing some corner cases. If nobody sees any obvious issues, I
> think it's worth a try.
>

Thanks. Besides the creation of processes via fork(), I
am also beginning to worry about the death of processes.

One thing that came to my mind this morning
is that when lowmemorykiller decides to kill an app, we
want the memory to be released as quickly as possible so
the new app or user scenario can get memory sooner.

In that case, if the app being killed is performing I/O
while holding the VMA lock, the unmapping procedure
could end up being blocked as well.

If we release the VMA lock as we currently do, we allow
process exit to proceed.

I haven't thought it through very clearly yet, and I
may be wrong. I'd like to do more investigation. I hope
the apps being killed stay very still, but who knows=E2=80=94we
have so many applications in the market.

Meanwhile, if you have any comments regarding the death
of processes, they would be very welcome.

Best Regards
Barry

