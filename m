Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3090ECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IED2UtU5yj/bx4M03Yvr5kd7GAPOPvx3o+sJpbfCUaQ=; b=4UZuyUY6W5h7XJtibrI7M3Tf97
	TtlfNzqMr8oiPiOM06UWrjTw3cckqKiD8EcXyoiaOYEjsySUEnruvzgDH1zc9mSu682Q9J4Ia1X5r
	IpOQxKy0uGs7+cfETfvdELainbOiVSeqnpne1ADz+pg3jqRGyXuXm7wayslkqq+JCZXDvtxs0jHRG
	XNEls6KG4OPo5F6YYGD5vL6vDZVsI8wxfsRjuxbRTX5G25UhAW4CXLfZeIn7a4ifx0LSIksGGRiE1
	HhmVZWgIJeH4mvgMQiZ1SwQvpDrjDGCN2Y81nWc3+Aa5VK6osJzoWgMDF1lBi3yDcp8B5pvzCrJde
	qJAw6vTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdma-0000000Dnv1-0320;
	Wed, 05 Nov 2025 13:42:40 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdmW-0000000Dnty-3NoV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762350152; bh=IED2UtU5yj/bx4M03Yvr5kd7GAPOPvx3o+sJpbfCUaQ=;
	h=From:Message-ID:From;
	b=jcCyExN9uOjTWMgZphfSXjTUEjUVsl1HwEz9hzKCmYA1Zj523a+HZg6wgQGF6TX9H
	 tmdsRyG0A0ialuYA9OeJwGOeNBN166FcRRLhsy8U95lAtWHIc4Qy4QtedtY0fQerzQ
	 GBaL734CHIvtLR9subWtnnJPEOBQhTq/tuCN1irI=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id D1B1DC0952;
	Wed, 05 Nov 2025 14:42:31 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A5DgVAQ023269;
	Wed, 5 Nov 2025 14:42:31 +0100
Date: Wed, 5 Nov 2025 14:42:31 +0100
From: Willy Tarreau <w@1wt.eu>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yicong Yang <yangyccccc@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <20251105134231.GF22848@1wt.eu>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
 <aQtQRSoL8GGVNrUQ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtQRSoL8GGVNrUQ@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_054237_263524_B67684C8 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, Nov 05, 2025 at 01:25:25PM +0000, Catalin Marinas wrote:
> > But need to add the prefetch in per-cpu implementation as you've
> > noticed above (didn't add it since no prefetch for LL/SC
> > implementation there, maybe a missing?)
> 
> Maybe no-one stressed these to notice any difference between LL/SC and
> LSE.

Huh ? I can say for certain that LL/SC is a no-go beyond 16 cores, for
having faced catastrophic performance there on haproxy, while with LSE
it continues to scale almost linearly at least till 64. But that does
not mean that if some possibilities are within reach to recover 90% of
the atomic overhead in uncontended case we shouldn't try to grab it at
a reasonable cost!

I'm definitely adding in my todo list to experiment more on this on
various CPUs now ;-)

Willy

