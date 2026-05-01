Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp8f/WeQia8QAD+YJmPABxXPXrvHyOM5hZfBchCKMDA=; b=nu6RP68wLl4c7gHDuXp4wQ7QAB
	pbZNRjIjFVX4pBFuUEgpvYwL/EcH0bYb0K9Sd8PK8T7Ze0jFqRJJ9Gy62Xw7aJXh7n+4pwDU3/vd8
	axyBCTn+byJzjyOfaCN/9Q7sk3a+z9jcjEp4YaO52gS9cXsPXqLyZAlRgM37TLlc6H28I1xL1QW46
	cZfL9YweC9rdjAziVvdS6DTQiH8k92EVAWsQE8N+oqRg9TN6BWAvNzt7eFkCkcbsyGsCfOhoxz4/o
	1Qh00Wve0HNgu6RQe3/UKITzK250oA0cvpsRSciRXXmI10EsjvZwoNE8byyZ2eeg8UONGT+Ic9iIQ
	V97r3lRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthr-00000007csL-1ued;
	Fri, 01 May 2026 19:39:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthp-00000007csA-3GZJ;
	Fri, 01 May 2026 19:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rp8f/WeQia8QAD+YJmPABxXPXrvHyOM5hZfBchCKMDA=; b=uHjHrPPD2LeDk5mLziBh3YyqEj
	pfhR1tJpiKuUsooCkGqL2JZsb+D6vXBCRLBIbK0Q44xOCZOqwgtOj5wLR1q5KX9Q3NvcP0rciSd+G
	ckgC0Zlz14TMgm+JsN7ZyOCt1Uvx4cReuGP0X3rwHMIqy2VNYPteQIn4/oeQedWAMeFvYDZOK+5J9
	gMu8Q18KidiWTxvlLNVjdpduJUbW8ext7a3iuodZcXYJM4buozO5xWvugDSnEUtY1AeZRzE+j32qI
	9Rxm90eK24xcN0FvxD+xBCl3zDGmbqcxwWSaplpXlbRREhdZ7Fj4povFbiHlxELsrOySKt4514WFP
	5emRWH6A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthf-00000009F6Q-0jSu;
	Fri, 01 May 2026 19:39:11 +0000
Date: Fri, 1 May 2026 20:39:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz,
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afUBXnPVnt7Jt5hh@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
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

On Sat, May 02, 2026 at 02:25:37AM +0800, Barry Song wrote:
> On Sat, May 2, 2026 at 1:58 AM Matthew Wilcox <willy@infradead.org> wrote:
> > Yes, but that still fails to answer "does this actually happen".  How much
> > performance is all this complexity in the page fault handler buying us?
> > If you don't answer this question, I'm just going to go in and rip it
> > all out.
> 
> I’m getting quite confused. In patch 4/5, you suggest a more
> restrictive condition using
> if (folio_test_uptodate(folio) && !folio_test_writeback(folio))
> rather than if (folio_test_uptodate(folio)), before we decide to skip
> retrying the page fault [1].
> That seems to suggest we should be more cautious about when we can skip
> retrying the page fault.
> 
> However, in the cover letter, you suggest removing all retry code entirely.
> Does this suggestion apply only to file-backed page faults?

I'm making sure that if Andrew decides to override me he at least sees
that there are other problems with this patchset beyond "I don't like
the additional complexity".

And maybe we decide to do the fallback for anon-mm but not file memory.
Or maybe it's just something somebody happens upon when reading the
mailing list (or more likely it's just grist for an AI).

