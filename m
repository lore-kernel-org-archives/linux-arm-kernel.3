Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F06C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 02:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZXmNamni8YTdkgj3WsVi9gU+V406f6mQymnA8E88y0=; b=dLUWQvmjiuwFKht8hMySCTAYWW
	d6Vp9JZ1iHPu2bV5Lj//PgUOorMZ5+yZ7uh1oDY9qyeMnxOVRexQu5hjfdjw3wIKB4xzPoBuL5PnO
	00ZR6R7Vw74sw+6OS1BuVYA74nfICcwZ69K9WYB249jvq51fTaSZKLk2TVCUugzHiMdV7l4iMldwk
	Tp3gNpz2LA9HXsKwSgCs5wdmjS5MuVDE1D8TxpUZqcAmY0JHcIw57tgayqmw5RriWBA3JhkZO6qxp
	ayLZPesPqc56zLqLpEHnQoo678HunepwZvvdt/5oZH5LnkkbHA7eQuqlVqsXnGVDZda08XZlD73sa
	sdNxSjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1QF-0000000HC8V-45K7;
	Mon, 28 Sep 2026 02:48:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1QF-0000000HC8H-11Qz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 02:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16574447CE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE08C1F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790563734;
	bh=YZXmNamni8YTdkgj3WsVi9gU+V406f6mQymnA8E88y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N+nltn9jC6q2eO3opdHyIoiKjUyZxU1DcrkzS/0pom2OqlURdjYF0DREhqfvIwd2R
	 bzwC1oFZgEv2bqlkVJkKZBanBhR97+UeC9aReU1c0ukgMhm7inbVGCViq9ZfVz4c76
	 0XB70RMUy2Qn0qCV9+UrLtUc9jiGgm9hCzyi+fxCicYw8yoZIvDLyc07tBSYHFvNAS
	 rhE0YOXFTmR2ETaltl/yU1dDnss1WEMOg8LHisDVZzY4uaq4SCDfG9eMwNtcRR5llv
	 phzSyo+vLJ1We1kfN5be5QneZnAgoke7mrTzpOt1MnDVsCoOVBxfNJ1nAC10mrz9sk
	 OEwBK4tw8DE8g==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2a8c29c4so242872585a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 19:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxquWsO7zR8Iv/mDf8jqZHGPL3myfGm91mT5de6QlEWRyzAsb4HAWXvDmS4R6rjXKD4q/EQgRTm/2TFw7KtffxO@lists.infradead.org
X-Gm-Message-State: AFuF++lpBDsXod8wDjdvRVn7RblfRSgxUszI1DfiOeR29CO4D24bcAWv
	BtHQq54vl6oVxdzzILizcWVTlp1CQHe7dnBq+whNpaSMMJYIi9jpksO29pIUFwdQy0hGew9ytBT
	3ALdj0UqXmQ9scDJPrAwQHIuFolfCx38=
X-Received: by 2002:a05:620a:2614:b0:93a:2bdc:cd57 with SMTP id
 af79cd13be357-93c43b7f72amr1824335585a.2.1790563732750; Sun, 27 Sep 2026
 19:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
In-Reply-To: <armexcXDiG8ryZd6@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 28 Sep 2026 10:48:41 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
X-Gm-Features: AclHuK-KBiQtm0KE630BoXAk92dmhRT-WqzJYFoYV9V1f9Qw5fyAD0u8MfblD04
Message-ID: <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, surenb@google.com, 
	david@kernel.org, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	shakeel.butt@linux.dev, vbabka@kernel.org, zhaonanzhe@xiaomi.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, Hongru Zhang <zhanghongru@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 28, 2026 at 6:55=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Sep 22, 2026 at 09:55:23AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 21, 2026 at 07:57:23PM +0100, Matthew Wilcox wrote:
> > > more to say on this in two weeks at Plumbers.
> >
> > I look forward to it :)
>
> So while doing my slides, I realised that what we need to avoid doing
> is (a) sleeping while holding the mmap_lock (b) returning RETRY while
> holding the VMA lock
>
> And that turns out to be as simple as this patch:
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dd09c438fa23..94ed2333f8d8 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -723,6 +723,8 @@ enum {
>   */
>  static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
>  {
> +       if (flags & FAULT_FLAG_VMA_LOCK)
> +               return false;
>         return (flags & FAULT_FLAG_ALLOW_RETRY) &&
>             (!(flags & FAULT_FLAG_TRIED));
>  }
>
> OK, this is a hack.  The function is spectacularly badly named, and
> needs to be renamed before a patch can go upstream.  But this should
> fix the contention on mmap_lock.

Thanks for your suggestion.
This is exactly what we did in Android Common Kernel before we had
Lorenzo's proposal (bypassing `fault_flag_allow_retry_first()`):

https://android.googlesource.com/kernel/common/+/1b9b045a586245cc1c29b2747c=
6586234c7f5bad%5E%21/#F2

At that time, we couldn't modify ACK with a GKI hook that introduced
a new flag. All previous versions of this patchset introduced new
flags, which would have broken the KMI.
So we had to choose between two evils:
1. mmap_lock contention
2. VMA lock contention
We chose the lesser evil =E2=80=94 no. 2 =E2=80=94 and sent the Android hoo=
k for
merging into ACK.

Now that we have Lorenzo's proposal, which doesn't require any new
flag, we are adding a new Android hook just to mimic what Lorenzo's
proposal already does:
https://android-review.googlesource.com/c/kernel/common/+/4307957/3/arch/ar=
m64/mm/fault.c

Note that Lorenzo's proposal avoids mmap_lock contention without
introducing any new VMA lock contention. It also doesn't require a new
flag that would break KMI. So this is clearly the preferred approach.

>
> Could somebody try it?  I've verified it boots and runs some userspace
> fine, but I don't have the workload to test the contention.

Both Nanzhe and Hongru tested it before and reported the fork issue.

Best Regards
Barry

