Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9DDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 02:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEwnZQi+JftVY499EdCCO+k2A2ta9/8yUC6T9F/OU40=; b=at9x4/Op54nMIF5JTKLpB7DgRr
	zNWApKu/Jf5givPvShhXvMfdwXtNQZzsZyPRNGuQ1iNwMBA2V0+z8xYjhjYjH+Ci1C79iRvQ7aPV9
	9CUzvPVoiefiy4pQohv20rMg9Ffwf9asLEqdqKN1P6SQmuq78Vwn/EWBIeB9DukLmvlBa95yUaNj8
	l2APb/JrVW0oQeO4Mgu8JOzWcs4abOEZKQE9as6HC5j/PAHLUw2RyPeEoPsl4b9w8PJVBFzusbGJ2
	dStFrqd4GfrasacRbVDK2R3IpFYIZ9nGg+objz5cMdCJRxvNyBaSUsD8xZf8khGcK5CsMW3z5moia
	mVd8vaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiPM6-00000009XyU-3iCO;
	Thu, 13 Feb 2025 02:53:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiPKf-00000009Xq3-11w8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 02:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8264C5C639A;
	Thu, 13 Feb 2025 02:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35861C4CEDF;
	Thu, 13 Feb 2025 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739415123;
	bh=NVMAadp03PD66sbMdEmmFgCNxo+6578DA85rU6KYTFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIpuCeCmfDQNXF2h/LSrWpY3SgAnMNet4mDkuOZypViJd1h8MtN86CKN5X62zTvvv
	 gN0VKC24fSoNgOGHgc8Dual8YCPopwfdKw0nSyq+eMglDZ5ny9V1eehxYworSgAH/m
	 Q7gKblgjGszFiQBZiRMpjxdtmPUg6aQrDF6qIm8oWZ8h4i4K4D5XTyXVJFFSACwnVm
	 Yxbwdh30hnb/2rr285EV91PUSlTRdt69OsPhf+Xy/JN/WmYhxeEzKKzj3GBiqQlqGI
	 rAtXeCq/NfYb0J8kGaS9YpU1dj9gDSz0kn7JrZXRPnPJJn1pmppfIXXhmXwqQEBItB
	 z53rdeuSTBzrQ==
Date: Wed, 12 Feb 2025 18:52:01 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250213025201.tyo3jcp4gcivydyd@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_185205_354373_04EA86DB 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, Feb 12, 2025 at 06:40:33PM -0800, Song Liu wrote:
> On Wed, Feb 12, 2025 at 4:10 PM Indu Bhagat <indu.bhagat@oracle.com> wrote:
> >
> > On 2/12/25 3:32 PM, Song Liu wrote:
> > > I run some tests with this set and my RFC set [1]. Most of
> > > the test is done with kpatch-build. I tested both Puranjay's
> > > version [3] and my version [4].
> > >
> > > For gcc 14.2.1, I have seen the following issue with this
> > > test [2]. This happens with both upstream and 6.13.2.
> > > The livepatch loaded fine, but the system spilled out the
> > > following warning quickly.
> > >
> >
> > In presence of the issue
> > https://sourceware.org/bugzilla/show_bug.cgi?id=32666, I'd expect bad
> > data in SFrame section.  Which may be causing this symptom?
> >
> > To be clear, the issue affects loaded kernel modules.  I cannot tell for
> > certain - is there module loading involved in your test ?
> 
> The KLP is a module, I guess that is also affected?
> 
> During kpatch-build, we added some logic to drop the .sframe section.
> I guess this is wrong, as we need the .sframe section when we apply
> the next KLP. However, I don't think the issue is caused by missing
> .sframe section.

Right, it looks like it unwound through the patch module just fine.

-- 
Josh

