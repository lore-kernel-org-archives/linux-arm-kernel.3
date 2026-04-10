Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA1F44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39NAX6pobMDiRW03bJAv0Hw/rcf7l7+Va+PozAyLXsE=; b=CFRAv5wKZ303PgXLGp1RieHe7f
	X4KihWBGBaAbN0mbMtzI54jttsjuOcT/mSvTEwkdGi4CYH+DZxurX5mP4gZ0EkgdwNkZkNobT960m
	iTlZhItrlHIkYqBjKBx6/4Z+ge5bXjJ0QvnN6XNPxcVfiwpDiee3rjkp3RTbXDD3J4TLj87PbojCy
	32Zwkh/cTDlVXlOodRRneoPdnUpj0v31SHwRz8w6/ikzaXngUafiNEt50LafimXtANu6an5WNIJx8
	mqcCbR4biDjksRd54ez3xvAzD9lw72w7b2qVMNyctFJKCsuedRSAtdu+1+yz1cGqhBPHJDSirshzX
	IScftMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCFf-0000000CLGt-3Rd6;
	Fri, 10 Apr 2026 13:50:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCFe-0000000CLGj-1SEb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53EA26024D;
	Fri, 10 Apr 2026 13:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53559C19425;
	Fri, 10 Apr 2026 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775829025;
	bh=39NAX6pobMDiRW03bJAv0Hw/rcf7l7+Va+PozAyLXsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPqER8zBALj1mdN+bTW+ENjK3Iz9tCxXSiON1IrcWMBqckqHOkL8gmJsZHFDpoSn3
	 fNnkNhnuM8YALPABGCBGy1pGA3Enr10HET+x/Id1HYgTr9mx/LOETSJmhxv0gYAGug
	 uUPS20jrknJe95xMg9xHnK4DfOg6cHnr4oAgLSJPSYAxGvd1jsK7ROVuYyMsTxCE/v
	 cVyf89R3C32BrRXnmutnmp/+5Z35DNV3USKJol8er2b/ZJcfGJ+QIngV6CVQWKmw+e
	 1glwA8bGhawBmt7WXCthBv4XrTFKn8hGxRGo7w4aCbqGZJsaZOcatLYCgiHmhrWemJ
	 HT08plIvK5jhA==
Date: Fri, 10 Apr 2026 14:50:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, willy@infradead.org, ryan.roberts@arm.com, 
	linux-mm@kvack.org, r@hev.cc, jack@suse.cz, ajd@linux.ibm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org, 
	catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mhocko@suse.com, npache@redhat.com, 
	pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, 
	Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, 
	shakeel.butt@linux.dev, leitao@debian.org, kernel-team@meta.com
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Message-ID: <adj_SXXEwyi3bxum@lucifer>
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev>
 <adjkCOiLgZ_-zovg@lucifer>
 <adjllNan2vgBNBHJ@lucifer>
 <5f99b289-629c-47c4-bef0-966d6678a2a8@linux.dev>
 <adjrKwgiZwXR9epk@lucifer>
 <40f31e5a-7161-4b17-af03-52b3a28a113e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f31e5a-7161-4b17-af03-52b3a28a113e@kernel.org>
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

On Fri, Apr 10, 2026 at 03:29:12PM +0200, Vlastimil Babka (SUSE) wrote:
> On 4/10/26 14:24, Lorenzo Stoakes wrote:
> > On Fri, Apr 10, 2026 at 01:19:08PM +0100, Usama Arif wrote:
> >> >> Thanks, Lorenzo
> >> >
> >> > (Note that we're in a 'quiet period' from here until -rc1 of next cycle and
> >> > won't be taking anything new until then. We plan to do this from around rc5 or
> >> > rc6 of each cycle in future).
> >>
> >> Thanks! Just wanted to check, as I am always confused about this. Is it ok
> >> to send patches for review for next release at this time? So that they
> >> are in a good state when rc1 comes. I wanted to send PMD swap entries
> >> for review after I am finished testing, but I want them for review for
> >> next release.
> >
> > I think different people have different views on that :)
> >
> > I mean it's debateable whether having a glut of new material on day one of -rc1
> > is preferable to having a bunch come in that might or might not get lost along
> > the way :)
> >
> > I personally feel it'd be better to send during the cycle window rather than
> > before but I suspect others disagree with that!
> >
> > So from your point of view, feel free to do what you like, but maybe David +
> > others would want to chime in with their opinions?
>
> For me the more important part of the quiet period is that patches can't be
> merged, so there's less urgency to review them immediately. So I think it's
> fine to still send patches, but not having expectations about quick
> response, as people might be taking time off.
>
> On the other hand it would be better if new series could mature in this
> quiet period, so there would be less work after rc1. But the key to making
> that possible I think is to feel less urgency/being overwhelmed also in the
> non-quiet period (rc1-rc5/6). Then it's should be less necessary to take
> time off during the quiet period. So hopefully we'll get there through
> involving more reviewers, and by having more submaintainers agency.

Yeah I sympathise with that.

But until we for-sure have <you know what :))> signoff, I worry about the risk
of series 'just being taken' at -rc1 because it maybe seems easier to do that,
and then we have a series from 5 weeks ago you forgot about suddenly crop up.

So I guess the more nuanced take I have is:

Once we have a robust set up end-to-end _that can handle_ having series that are
deferred to next cycle without risk of things getting mixed up - then that makes
sense, yes.

But while there's still a bit of uncertainty around that, then I'd rather not.

But I think if people DO just resend their stuff in -rc1 then we're OK and it
addresses my concerns.

One thing we could do here is to tag series appropriately like:

[PATCH v7.2] 00/42

To make it clear where it's intended to head to.

P.S. Having the 'quiet period' REALLY REALLY helps. So thanks for that Andrew!

>
> Vlastimil

Thanks, Lorenzo

