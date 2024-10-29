Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4FAD74940
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3ss9pag0NcR14RtAGsaKv3moDarLBu8u2f0bXVnm84=; b=AaWgScWjnm4mV38gmMUMOKIZv0
	vjww0Yti3drvcEz+VcfPDEslogL9w67PRa5tfaHetkrArDrcfy4JnDotE1Jnl1c2KVTVjEss9ey/C
	eIhJBs52yyij/PZtxXyXSdz5eMZUSTzpGGuThgZiS1DLp80w2C9ApZ2E+giLTLpqhu+S409tcLxfT
	eF6Ksor0uU84YjuQ+fdlLgFjnQhCPGnksKXA/6enIwOib4WuH4Y79zjWbv59Itp3Y099Ahe2mWW0C
	XKr8ubjoOXStwQs2TrfVivKGdCsOpBg7uxHzLimxkeyY00tWTQQw+G/b00s8GmPjLs+5ByVNrw32A
	l6liZvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tTl-0000000Fuwg-0XZt;
	Tue, 29 Oct 2024 21:10:17 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5swf-0000000FoIU-3wN7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:36:12 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 957AF11401C4;
	Tue, 29 Oct 2024 16:36:01 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 29 Oct 2024 16:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730234161;
	 x=1730320561; bh=B3ss9pag0NcR14RtAGsaKv3moDarLBu8u2f0bXVnm84=; b=
	EkhttdXPjfFuPHBZgqjJmtmOB4B34IlLyudV6F3SejXggUVJKijTh2t0Y63hFteu
	bcXjJC4azzOrnrNJsLW55wIYaygfrE3BBJq/IPpTP8SCwMC4N87c6/KsodCLqNsJ
	rqNnGnw3iT9ya9OXvToYVc+PI5ejVKX4aLICrW6m0c3bmIDVn2Nq3IyUEZnRxBt7
	gNv6zmp4AzPFatuokFeeAGs6x9r20yGSQ9CuuVBpHTf9d6DbxWmRP0hTDCNejRYL
	pugd8UQRKUMXgWTcvXPo31ETesDRUlgN26Qm73X6dqVud2Hco5UxXcFqOHc91aY/
	ULo60cqYT6rxVv+7cMTExw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730234161; x=
	1730320561; bh=B3ss9pag0NcR14RtAGsaKv3moDarLBu8u2f0bXVnm84=; b=L
	rNIW0IB5yPkOhDJiafrvgYNsrUAMrXQQlWzzm8aJJaQ+XLwzSTe4GRwrsVN0Udd2
	w45zjIqS9rqTfzUMyQxDKR/kZ+lCgB1IXvbMV94PFA45oTwH6UEEJRZzhtXjolzG
	zyAzVg1aZvOYWKAifP02ZGILQdRXL+kHP1PhtY6jTodHPsScE0rAXK/hNMpNDJOj
	4t8Oy5uln/rg8ZwY5FfQD5/BFFktkpU7f734XD98G7mzWY6PGYDr4G0sz7ioQuEe
	CVRf3leLBPWuBIi4qlGm9Oo6t7jOtF3i5HG7nIbvTfdLwLgXyBH1L1g2IULz8lw1
	YQ9IdOjb4ItPp9tuNDBMQ==
X-ME-Sender: <xms:L0chZ5xY42DFgD80WQXu2abmO7M1s2qWuciu6vdz8CkrZeGDRt2neg>
    <xme:L0chZ5T-LsKjMPI9-uDJm05HdgApYIRdo7O2nCXrSJlyxiZMJp_eJkVVQi-asNvcO
    zf70HEevVMHuY7RzV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekuddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhuhgrnhhglhgvihekudegseduie
    efrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhurg
    hnghhlvghisehkhihlihhnohhsrdgtnhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:L0chZzW1i-YDtBE8u3OZgM4PAxiIaHiXN2Dyyn74p4Mb0t3hO7rvww>
    <xmx:L0chZ7gxCfZZ5CY7qzCuiFkHTUENrxeXF-vvegxdwhSys8GC4NKJQQ>
    <xmx:L0chZ7A_eaYeNJwcRFnNEBZe7GfBskC47Oyf28-BwMma5KxtxAEEnQ>
    <xmx:L0chZ0La_qezE9NZqDCddESF4Pb12d53ZPuAKwQx1mJMzuOxWAVVxQ>
    <xmx:MUchZ251_6kAYR8Y1iEIhk4m7oD84uorE2FmSRdzt3dz-H8bN4IIAShf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 770492220071; Tue, 29 Oct 2024 16:35:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 20:35:39 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, huanglei <huanglei814@163.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 huanglei <huanglei@kylinos.cn>
Message-Id: <5f93d7a3-082d-455c-b458-a9c2113eb512@app.fastmail.com>
In-Reply-To: <20241029132042.GA4416@willie-the-truck>
References: <20241025011641.4858-1-huanglei814@163.com>
 <20241028150544.GA2445@willie-the-truck>
 <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
 <20241029132042.GA4416@willie-the-truck>
Subject: Re: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_133606_826509_255E22B5 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Oct 29, 2024, at 13:20, Will Deacon wrote:
> On Tue, Oct 29, 2024 at 09:41:08AM +0800, huanglei wrote:
>>
>>     Even if MAX_SMA_CANNELS is not defined, as long as GENETIC-SIA_DM=
A is
>>     enabled=EF=BC=8C request_rma/free_rma  function will also be expo=
rted, and
>>     other modules using these two interfaces will not encounter link
>>     errors.
>
> Do the drivers do anything useful after they've linked? Can you please
> provide some in-tree examples of drivers that can be used on arm64 only
> once GENERIC_ISA_DMA is selected? If they just need some stubs for
> request_dma() and free_dma(), then it feels to me like that should be
> the default implementation, rather than having to select something to
> get them.

GENERIC_ISA_DMA does nothing by iself, there also needs to
be an iplementation of CONFIG_ISA_DMA_API in order to use
DMA mode on floppy/parport/soundblaster.

I think this should not be enabled by the architecture
itself, but by the LPC host driver that provides the ISA
style DMA. Most LPC implementations don't have this, and
most arm64 machines have no LPC or PC104 at all.

Note that PCI-ISA bridges can sometimes provide ISA devices,
but ISA DMA won't work behind a PCIe bridge.

The patch also needs a better changelog text to explain
specifically which arm64 platform has PC style DMA support,
and what devices are connected to it.=20

     Arnd

