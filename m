Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D3EB1042
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO8o5psNJZ2qR9UHpfV+KG0CtdqeJkCrtjFX1YzkKoM=; b=Vv/0uVh/jUCbL97xYbXPMcRiAz
	u2kSucYcX9YH/EFQ8tVSb52EzBirSDYGsxtidTZzV+oRBh4hPb73VfVjl/stZiwdq3jXtg5yw1jFx
	2H7aU5z4i+i08z7f87Lpf+ie7CYTgArDp//1U+glO21t8XvMHwiR6zGYO5HPkB8HUdOymGj2C7ww+
	m2IrS8+VEOVseIxKR8XdWDYO+2x+f+MjBm0yWH/qM1bBL/a2yBzTQDEo51RBur2JPyS1ocRJAdMwi
	XG9IDCHk/8eGPHvPbp+haZofDk+2DJoGyESFxDv/m/BQ0mH4Qas2ZgleGHhPd6tOb2BIyUaLF91M8
	imHTigCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuER-00000009BQN-2vBg;
	Tue, 10 Mar 2026 10:22:31 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuEP-00000009BPy-02Dx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:22:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 303E0240101
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1773138144; bh=tO8o5psNJZ2qR9UHpfV+KG0CtdqeJkCrtjFX1YzkKoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=gsFsIoCr9uZZKPz4ar5qI8Ox0LsZElQLsYQMiD0ABLHKVt5jdzCI1/6aBnQp3Hlwc
	 dEVxhcnE+zu60m2er6vSYoBzRKA5dLOMGWcGEDlRL4xBA9dyoK4IEwsWc4chN4GMLl
	 7lGBYCjoVrbN0m788jZRPqyp+ASBZoZutFJ8/aJ88amUMHP6+xtED3cs2yHUgiDlqR
	 kbFxXBF873fU+bB58RDWwEuzhzv34Nd0ER7P1xMsYvaRqpB6ONygS3RGRgHafj2vlU
	 VcS81f3ClfS1LxozRZxCQHRec7gNayyELN0/YtJuHo4O7qJ2zIEDQBGnK34uu5WbOu
	 TujPQ2QHDqfhQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fVVLP2Xrvz6tx7;
	Tue, 10 Mar 2026 11:22:21 +0100 (CET)
Date: Tue, 10 Mar 2026 10:22:23 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
Message-ID: <20260310112220.771011e0@posteo.net>
In-Reply-To: <aa_sckE7C3kwqYxb@shikoro>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
	<20260310075539.11701-10-wsa+renesas@sang-engineering.com>
	<CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
	<aa_sckE7C3kwqYxb@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_032229_197302_9D681F24 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, 10 Mar 2026 11:03:30 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi ChenYu,
> 
> > >  bank_fail:
> > >         clk_disable_unprepare(priv->ahb_clk);
> > 
> > Just a note, I see further code savings in using the clk and reset devm_
> > helpers. I'll do this after this series is merged, as the context overlaps.
> 
> Yes, I saw this, too, but thought that this needs HW for proper testing.
> Great that you are up for it!

Not only that. You may also need to run the CRUST firmware on the OpenRISC
companion core. Getting that hwspinlock driver done and tested was some real
pain in the past. I still have everything on github for this
(https://github.com/wgottwalt/sunxi_hwspinlock). But I may not be able to test
that in time. I moved a while ago and, uhm, quite some hardware disappeared.

greetings

