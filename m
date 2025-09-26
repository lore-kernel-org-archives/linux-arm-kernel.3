Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FF7CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/HpmQTuKd1i7N85FGj9fWCDA1xza9YQMkwoZYoSd/Y=; b=C0eXo3mqoLnw6zw5ED2cNvZ37s
	BEqSE0RgCaGELomzWxFoNrVzxCafKHVZEXn3RTefF8NQnZhGl5dioCoiMUWsB+hrt1w3oX/z0UImf
	DmAQF0+gi/EsrRlY4ZapOjz0iHTmwrkuVF6U/4TG4ucUIkggqaqM6jmjL9lLWRX1HS9u92/yjmyMr
	qriOyjnvNuhuitFrTDYsi8sNqGUeI7fXUlggdWCVYWUNbzyr/tKvDs8kgps9MgCSOugcIAnuE1MIV
	BNrXxl1V7rZfdoNyXZyEevbrqwhI9mF/m5WDdDc5kI2OCj7zX2BYP42dD2ua2A6ESGKG9MpOw3zyr
	g2DIN5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26PG-00000000hQu-0KXm;
	Fri, 26 Sep 2025 11:14:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26PD-00000000hPY-3S6l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FACB43435;
	Fri, 26 Sep 2025 11:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67574C4CEF4;
	Fri, 26 Sep 2025 11:14:24 +0000 (UTC)
Date: Fri, 26 Sep 2025 12:14:21 +0100
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
Message-ID: <aNZ1jVLhc_Zg99Jb@arm.com>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
 <aNVx9vlgi8t81V6Y@arm.com>
 <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
 <aNWLwkn1fJDvWUyu@arm.com>
 <41929a12-59f4-419e-9f15-eaa09f0df0f3@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41929a12-59f4-419e-9f15-eaa09f0df0f3@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_041427_881831_10645824 
X-CRM114-Status: GOOD (  19.11  )
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

On Thu, Sep 25, 2025 at 08:00:40PM +0100, Mark Brown wrote:
> On Thu, Sep 25, 2025 at 07:36:50PM +0100, Catalin Marinas wrote:
> > On Thu, Sep 25, 2025 at 06:01:07PM +0100, Mark Brown wrote:
> > > On Thu, Sep 25, 2025 at 05:46:46PM +0100, Catalin Marinas wrote:
> > > > On Sun, Sep 21, 2025 at 02:21:35PM +0100, Mark Brown wrote:
> 
> > > We can't have scheduled?  That's actually a pleasant surprise, that was
> > > the main hole I was thinking of in the cover letter.
> 
> > Well, double-check. AFAICT, gcs_free() is only called on the exit_mm()
> > path when a thread dies.
> 
> > I think gcs_free() may have been called in other contexts before the
> > cleanups you had in 6.16 (there were two more call sites for
> > gcs_free()). If that's the case, we could turn these checks into
> > WARN_ON_ONCE().
> 
> Yeah, just I need to convince myself that we're always running the
> exit_mm() path in the context of the exiting thread.  Like you say it
> needs checking but hopefully you're right and the current code is more
> correct than I had thought.

The only path to gcs_free() is via mm_release() -> deactivate_mm().
mm_release() is called from either exit_mm_release() or
exec_mm_release(). These two functions are only called with current and
current->mm.

I guess for historical reasons, they take task and mm parameters but in
recent mainline, they don't seem to get anything other than current.

-- 
Catalin

