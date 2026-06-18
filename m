Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E33CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGSV2iRS3SvuzFlJjBreHqxCFWsPkB1xRT1oWGCiG6M=; b=OQGXHvGgoTB9rrawpqAim80sZS
	fCxI/wvDB2fEMuXGh3LsN7Ngr2xImvPxSplePI5bLadjGLNPic3XOT5JZdOIHcmYNmPnd1ulZauiN
	5/8QzWxlymXZvowx9OuTC/ctsc/Pbix3Gsf7FbqR6VU1OwJDemG6OU82PN4/sil8vpMiGTHISRZmY
	ea6mdky4SC/Pni1dYLORZUwErx6x8C6qrbSY1RjD9A8EKK5Tg4pdMZwtLCpYpqHaWvVBG9Sg4MAm0
	89/jeDZYwG6tYbthxn7UYeMRMy1kqHsQpfUb5Ur0G5jTvbyu4jZDG+oZ5SFBY+LdAZjLhd2t9sRwh
	iDQFM1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEU4-00000001TiS-13RK;
	Thu, 18 Jun 2026 15:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEU1-00000001Ti8-2baN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:16:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E439F4746;
	Thu, 18 Jun 2026 08:16:38 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B64E23F62B;
	Thu, 18 Jun 2026 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781795803; bh=s1nZAiGSk2QtqMWGVJU5lhUftJz8hz0igxK2gzKBl6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjrNV3Yd+Ipgh2ZAyVD7lrJFRwOxXZKfjc7rD24tiGPlAlORc99hcFGIHsGs5yDct
	 qBEsCfhch6nfKodI0DyRzMDcWS60lG/a9qqTYfEVXq7KA6NHm+OPXy3lPknmn8e9ti
	 aQJMC1N6oYB8EbP7Y5ZLyjiHEaHq3A7RZ7uIRM/k=
Date: Thu, 18 Jun 2026 16:16:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Will Deacon <will@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, ckennelly@google.com,
	dvyukov@google.com, linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
Message-ID: <ajQL1KII_t4aSmS5@J2N7QTR9R3.cambridge.arm.com>
References: <20260508142023.3268622-1-mark.rutland@arm.com>
 <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com>
 <CAHnCjA1dGNH07YkWupg1THAmBhW=o4C+uhHbbcRX4edMj2rmEg@mail.gmail.com>
 <ailagpgcDGVoXgm0@willie-the-truck>
 <CAHnCjA2+LeDt+_i44dq--73N85qpiCupa_82r0Knm0_RFDKTQw@mail.gmail.com>
 <ajPv1tew-QAFE1ib@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajPv1tew-QAFE1ib@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_081645_702636_0CE70C74 
X-CRM114-Status: GOOD (  16.41  )
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

On Thu, Jun 18, 2026 at 02:17:10PM +0100, Mark Rutland wrote:
> On Thu, Jun 18, 2026 at 09:55:20AM +0200, Mathias Stearn wrote:
> > On Wed, Jun 10, 2026 at 2:37 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Jun 09, 2026 at 02:04:23PM +0200, Mathias Stearn wrote:
> > > > Is it possible to get 411c1cf43039 backported to 7.0 or was it omitted
> > > > intentionally?
> > >
> > > You can send a backport to the stable maintainers:
> > >
> > > https://docs.kernel.org/process/stable-kernel-rules.html#procedure-for-submitting-patches-to-the-stable-tree
> > 
> > Who was that "you" directed at? I'm not used to the kernel development
> > process. Is that my responsibility as the bug reporter / interested
> > party, or something that Mark Rutland, author of the patch, should do?
> 
> I'll sort it out.

I've send a backport for v7.0; when lore updates it should be visible at:

  https://lore.kernel.org/stable/20260618151426.308099-1-mark.rutland@arm.com/

Mark.

