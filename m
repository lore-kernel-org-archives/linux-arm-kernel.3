Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ABCE64AB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR4QlW226cNWUzaFJtJ5z4V8Lbi+/lhZrV5/z+p6Izc=; b=ZEXdUXX+nmsGAhOBXWvCf962WK
	JuqsYIx/wJGxr5DgDHYOTxkbCivdkb4Uo4XLmlZ1rOXoKN4wkJmVT/ktJk5J8fhmb1fDBKjUCIr0b
	feO5O9SaqX/6OtFJElBWINTTbsnBFmkzvxhLA9PW4mCmn7W9/Rt/QDXFfxbpug0CdQQrx4JOO+Zij
	9sbSc9+jQ5lsTW1OGTNkYmNWo8EGqRfQZs2Mh+L+NbwpP6alYkaQJq2XiFSa8JapblLGs7DDps/88
	D8CrLauq6/R3Aif2itoYIiy3FN2yDtPMUFquF6FIKcRrqZCJEqeB/huCNzbtXQ7n7+nbK61f2fKrs
	IB74Jt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUil-00000009uZ9-29hj;
	Tue, 03 Dec 2024 15:21:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUhl-00000009uP2-33bk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C382BA415E1;
	Tue,  3 Dec 2024 15:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0E1C4CECF;
	Tue,  3 Dec 2024 15:20:47 +0000 (UTC)
Date: Tue, 3 Dec 2024 10:20:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
 <mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
 <clrkwllms@kernel.org>, "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
 <linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>
Subject: Re: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Message-ID: <20241203102047.5844de81@gandalf.local.home>
In-Reply-To: <GV1PR08MB105212FEF9251CA2B3AAF7FFFFB362@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
	<20241127120954.0facd34f@gandalf.local.home>
	<GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
	<20241202103853.26db0c13@gandalf.local.home>
	<GV1PR08MB105212FEF9251CA2B3AAF7FFFFB362@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_072049_831739_A5E5EC02 
X-CRM114-Status: GOOD (  14.22  )
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

On Tue, 3 Dec 2024 08:31:54 +0000
Yeo Reum Yun <YeoReum.Yun@arm.com> wrote:

> Hi Steve,
> 
> > Still should be documented somewhere. It should describe the maximum number
> > of feats that will ever be loaded. If there's a max, it makes it back to
> > O(1). With a 'k' of how long it takes to process the max number of feats.  
> 
> But with other patchset seems better
> since not only this function, but also for other functions too.

Which other patchset?

> 
> BTW, is there any example describing this I can refer? 

No, it's on our todo list for RT. To document the RT behavior of the
kernel. This is just one location.

-- Steve

