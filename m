Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2FBCAC5BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj+18/uvRPRv6mUlhijc5NRo253MOy5BY4ZeqX4/ajw=; b=ABfRtRmvOyoUhCfj1NCjsjOe3R
	gXeBvk6dHpzg/WjZZoQago1v0zqC2qTZid4ooU/v2GUZAU6MfH2WqUFvSbuMBqLhy88SOxCSx98Vl
	97+epoYsE1RzJxXrvOtVTQ40u75iF+J51oRCqVSact50hPQm3l+tSglGusGz2tmfRoM5KzyaIJ7dI
	T3XbMTh1pNyCdzSS6Ym2ToFf5Kuog2HXAAq4qucdFl/9Xs1X2e9WkhIH7KGhk/ywCgmD8qA473gLa
	B4QFSuCzm/UK+s8AROZJawxJVXmMg/anAq413aYGD2bJBGmN6PTzgvA5W7wv/E1J9fU33YTGMQezG
	qNT0LVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1qpu-0000000ByyP-3Gei;
	Thu, 25 Sep 2025 18:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1qpt-0000000Bywi-0ahX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 18:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34CD843E18;
	Thu, 25 Sep 2025 18:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDFBC4CEF0;
	Thu, 25 Sep 2025 18:36:53 +0000 (UTC)
Date: Thu, 25 Sep 2025 19:36:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Carlos O'Donell <codonell@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Szabolcs Nagy <nsz@port70.net>,
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64/gcs: Support reuse of GCS for exited
 threads
Message-ID: <aNWLwkn1fJDvWUyu@arm.com>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
 <aNVx9vlgi8t81V6Y@arm.com>
 <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_113657_199222_C690FC85 
X-CRM114-Status: GOOD (  31.49  )
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

On Thu, Sep 25, 2025 at 06:01:07PM +0100, Mark Brown wrote:
> On Thu, Sep 25, 2025 at 05:46:46PM +0100, Catalin Marinas wrote:
> > On Sun, Sep 21, 2025 at 02:21:35PM +0100, Mark Brown wrote:
> 
> > > +	} else if (task == current &&
> > > +		   task->thread.gcs_el0_mode & PR_SHADOW_STACK_EXIT_TOKEN) {
> 
> > I checked the code paths leading here and task is always current. But
> > better to keep the test in case the core code ever changes.
> 
> We can't have scheduled?  That's actually a pleasant surprise, that was
> the main hole I was thinking of in the cover letter.

Well, double-check. AFAICT, gcs_free() is only called on the exit_mm()
path when a thread dies.

I think gcs_free() may have been called in other contexts before the
cleanups you had in 6.16 (there were two more call sites for
gcs_free()). If that's the case, we could turn these checks into
WARN_ON_ONCE().

> > > +		/*
> > > +		 * We can't do anything constructive if this fails,
> > > +		 * and the thread might be exiting due to being in a
> > > +		 * bad state anyway.
> > > +		 */
> > > +		put_user_gcs(cap_val, cap_ptr, &ret);
> > > +
> > > +		/*
> > > +		 * Ensure the new cap is ordered before standard
> > > +		 * memory accesses to the same location.
> > > +		 */
> > > +		gcsb_dsync();
> > > +	}
> 
> > The only downside is that, if the thread did not unwind properly, we
> > don't write the token where it was initially. We could save the token
> > address from clone3() and restore it there instead.
> 
> If we do that and the thread pivots away to another GCS and exits from
> there then we'll write the token onto a different stack.  Writing onto
> the location that userspace provided when creating the thread should be
> fine for glibc's needs but it feels like the wrong assumption to bake
> in, to me it feels less bad to have to map a new GCS in the case where
> we didn't unwind properly.  There will be overhead in doing that but the
> thread is already exiting uncleanly so imposing a cost doesn't seem
> disproportionate.

You are right, that's the safest. glibc can always unmap the shadow
stack if the thread did not exit properly.

That said, does glibc ensure the thread unwinds its stack (and shadow
stack) on pthread_exit()? IIUC, it does, at least for the normal stack,
but I'm not familiar with the codebase.

-- 
Catalin

