Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C91109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rta02Onm0qeuXEZF0HcOxMb+qiRyBBcKxQaID0hT3E=; b=LbAxkhvvpt98L0vBAEV7Zdoh2e
	AOvDT7j4Q20dbTtlf4mBq2fgmMoAVlOB8WWvePnuIyD/YZtR476qt4q7W8kVz2uidM+ieiWAtyXYh
	W/f9I39s2Dp3P4PJqXVwGfB88Y0j00BMlnwQKJD0brkuvwQQFdisRUsEbBKY0bnU3yWRQv/jcacw+
	xrZMCNe63A1yzCfDQ1Psi3GnEPnT2KocFNrBFjP4EW0rxP8EjD2CNLBc/8XgODVvnrwbv7N/MgFaX
	wbq9A5tpyWmrql4qCkmL/ysiA5aTxvoFNC5FiW5CoaO2xaN1gcdtYZhJ3LKzLg7r+TTmqOoXy7tEJ
	PcEMxWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QEE-00000003ngI-1Nag;
	Wed, 25 Mar 2026 15:33:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QE6-00000003nf0-2zaK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B00A6600AC;
	Wed, 25 Mar 2026 15:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30ECC116C6;
	Wed, 25 Mar 2026 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774452777;
	bh=7Q7S5BUEPnjJPL+sZVIXSsmkmWcRrS8Apgpdbcvnh48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2FomEXrTMPyqxzxStLtMsZG/Zisr9kMk1EKI14uWOQ8knCEFgEa459V7sDg6IZ40
	 IOZ2/WTTIRPJtB2/99NDbrCSMb3MqP/OCZSLcrk+N8XPPRUSZgnZF+R+6H5r5Y+yqk
	 sjdNaocYIQ3CnHR/ddTab6GzQ0adaHbG34IBwj4hp23lSPLhnNXzdLcz4beBFWXkgz
	 IRpsJTyVuXs8mehyJHySSc7uNHx+xB+6UU2j0WWrsqVzwdZjD78PL2gRqmAaAqw577
	 eJawpY2Uf5ffcZOT6yP2F5oZtnoDY/L6UnLRtBIV+43RSs3DR/BcPIUAYNgSvhFGoX
	 veUcY23jail8g==
Date: Wed, 25 Mar 2026 15:32:50 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-ID: <af9d8a6a-074c-412c-ac5e-3f0dadde3e7d@lucifer.local>
References: <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
 <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
 <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
 <20260325083016.a32095bea3f04488a7c9005a@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325083016.a32095bea3f04488a7c9005a@linux-foundation.org>
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

On Wed, Mar 25, 2026 at 08:30:16AM -0700, Andrew Morton wrote:
> On Wed, 25 Mar 2026 15:06:26 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > > > Sorry unclear here - does the series need more work or does a follow up patch
> > > > need more work?
> > >
> > > Follow up!
> >
> > Ok good as in mm-stable now. Sadly means I don't get to review it but there we
> > go.
>
> Well, this was sent 6 weeks ago, at v6!

Yup I know, I've struggled to clear my backlog.

>
> But please go ahead.  If review is very bad, there's git-rebase
> (happens sometimes) or some followup fix and a minor bisection hole
> (happens a bit more often).
>
> And those followup fixes will trickle in all the way out to 7.1-rc7,
> via the hotfixes path.  This happens a great deal - about half(?) of
> hotfixes pertain to material we added in the current -rc cycle.
>

Well given the other tags it's unlikely that would happen, so it doesn't feel
really worthwhile at this point.

Really I guess I'd like to know the timing of when mm-stable is taken so I can
know the deadline for stuff like this.

Thanks, Lorenzo

