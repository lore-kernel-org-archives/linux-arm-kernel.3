Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634F4C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgKR/aK6M3ZJDk7DeAJjGJw01SYV+7z18ycrliw9Mj0=; b=HYygxWBw245w51IJ8l7hiDrlU6
	6E6GPuY2NS0ZtKa8uBFU7ggNfUoCZB0cfMNycz17Ttf0WkDVpR5qhvCweAhxViLX7zeOkzw5vRzcq
	q9KEX2JRVKjgerkJ3A+h1KFCzxkn/266WENgv18lySbAOmETujd/cgoPMifQbd1ZBwh/RXyi+gN0e
	VziBQzYDmJkGNku4r0DUYERB6VZ9Yjc0x+D8BgtmXEmQTcU1nJgd1d4gI+XUco8wUkTv02jkRtbCp
	jNzS9mqxG2jq4B0v1Uf6c8o9HZZr08Cf1xpUkT0xSGSj4rnyQsiCZnXtEHFk9mLtMu0jNy9R1NhtY
	NwxEMrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sxr-0000000AvDW-1X5s;
	Tue, 29 Apr 2025 21:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9svx-0000000Auxt-1rhU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 21:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZgKR/aK6M3ZJDk7DeAJjGJw01SYV+7z18ycrliw9Mj0=; b=KmSJYFvs5c2pEmZpIertWrJMEP
	bZOCZQb9dESY2bWXR24y5clY35dUYN7zEdj97CB4ROV6KGStYUpI3n/4pUXobQmOqazCMyR0VQC24
	mzZk4l4SLQFOwMPSd8a8d/h94ktT3JYC6afRP+HDQh+knharCd2goPbdTBFNNNKp3a2yPSwk4fPAN
	FAeU6v1E8qWCtFOkAesk3V9R5mPLyPHLvLzKM5QHlMydNcVWZSFFBX4z5RwnD8OBrWO02qUXtMKYf
	tW76vJHP+RYg6FEiuj4rzABtUZylm+rf7Kz8gmnxp7dDfOTPpr6oVJ+i1lpnzrl+DLBScUqgdk2SO
	HpB92TvA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9svt-0000000DXCy-13qA;
	Tue, 29 Apr 2025 21:56:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B06C630057C; Tue, 29 Apr 2025 23:56:04 +0200 (CEST)
Date: Tue, 29 Apr 2025 23:56:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Geoff Blake <blakgeof@amazon.com>, Csaba Csoma <csabac@amazon.com>,
	Bjoern Doebel <doebel@amazon.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: EEVDF regression still exists
Message-ID: <20250429215604.GE4439@noisy.programming.kicks-ass.net>
References: <20250429213817.65651-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429213817.65651-1-cpru@amazon.com>
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

On Tue, Apr 29, 2025 at 04:38:17PM -0500, Cristian Prundeanu wrote:
> Peter,
> 
> Here are the latest results for the EEVDF impact on database workloads. 
> The regression introduced in kernel 6.6 still persists and doesn't look 
> like it is improving.

Well, I was under the impression it had actually been solved :-(

My understanding from the last round was that Prateek and co had it
sorted -- with the caveat being that you had to stick SCHED_BATCH in at
the right place in MySQL start scripts or somesuch.

Prateek, Gautham?


