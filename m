Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B77CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIwhHY1dFc82gb86vjswtUt8oQA6A+yG9Jm0Q42Km9g=; b=s3+74ecH9J8Cwctt5TjFA4b9Db
	SUbLaxgi5aMq2DanQknDWIAea//NgMchQMUgVBHBGqqKEw9Ojz6qftQFKZv25pyuGst0JYR3EbR+v
	fBX07B1Xg7YWliEh18nt1a3Ld0BN2TYY7duF0sS2OoQoCeq5jwZcBMQWQ1cl8Q28+vaUg4b2dnDH1
	5ZingXXo6L1E3tf9r2Ful1v41j5Jj6sOircevlswecFrvaswjzIbej3XhvwBUdR/ByWJ0DDnYKbfY
	hBG52mzEaNDhzIP0Kuy9JXCKNHRTzlgh5RC0IZ69wG+f52ItxVPaI9AIPm2TwPXUC41NPkF15Wnj2
	iP4gASxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGOXL-0000000Cb6E-0j0w;
	Tue, 04 Nov 2025 21:25:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGOXK-0000000Cb5y-1334
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 21:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14487601EC;
	Tue,  4 Nov 2025 21:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83A2C4CEF8;
	Tue,  4 Nov 2025 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762291552;
	bh=75L85vTETiCZUr6jzy8yOF0XFZNuoLyZ27NTRCPEs/A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=QUyU1hyYJlXwjA6LPCmLA8bhtzwJXgDrWjhz4N1c03RuicAGP/1ILOMs3GDxFtQjy
	 PFft0c2XAbaytKcwwh7DbSbBNldN/3raeJazzqyswl2AaaYZTxAXpFh5h5upkjRB5w
	 hux0pVXa3XW2z4syMEhckzENiIA5wgpxS5/5rNrJ4JImojtqRxjKI+nKSCYR+mKC7q
	 2GxsOlgoL18KaIjgwyUdFlUdbpsB+SjHMCu0KlMw0A4usJts7RnIhaPdqzpuwyPDdA
	 ZQt1ihqS7XgqZOpd2icSjQN6pK8wTzJpS7LFakkENseFbQUxldShQjFiaexovtZ/ug
	 OR32I9Fhb/Png==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B9C2FCE10DA; Tue,  4 Nov 2025 13:25:51 -0800 (PST)
Date: Tue, 4 Nov 2025 13:25:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Breno Leitao <leitao@debian.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com,
	rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <c7d8ef71-4dd6-4bc3-a6e0-831c69769b24@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
 <20251104180819.GB20579@1wt.eu>
 <9a58c50e-729e-4565-932d-641aee259758@paulmck-laptop>
 <20251104203548.GA20840@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203548.GA20840@1wt.eu>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 04, 2025 at 09:35:48PM +0100, Willy Tarreau wrote:
> On Tue, Nov 04, 2025 at 12:13:53PM -0800, Paul E. McKenney wrote:
> > > So it seems at first glance that LL/SC is generally slower but can be
> > > more consistent on modern machines, that LSE is stable on older machines
> > > and can be stable sometimes even on some modern machines.
> > 
> > I guess that I am glad that I am not alone?  ;-)
> > 
> > I am guessing that there is no reasonable way to check for whether a
> > given system has slow LSE, as would be needed to use ALTERNATIVE(),
> > but please let me know if I am mistaken.
> 
> I don't know either, and we've only tested additions (for which ldadd
> seems to do a better job than stadd for local values). I have no idea
> what happens with a CAS for example, that could be useful to set a max
> value for a metric and which can be quite inefficient using LL/SC,
> especially if the absolute value is stored in the same cache line as
> the max since every thread touching it would probably invalidate the
> update attempt. With a SWP instruction I don't see how it would be
> handled directly in SLC, since we need to know the previous value,
> hence load it into L1 (and hope nobody changes it between the load
> and the write attempt). But overall there seems to be a lot of
> unexplored possibilities here which I find quite interesting!

I must admit that this is a fun one.  ;-)

							Thanx, Paul

