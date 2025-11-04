Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F5CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYSzREhv9QD84HLe2GkZI7gSPV+D95DkkHF9PAZ78jI=; b=lhmuahRvE+ImWFy1llc7oSzRMw
	B9JN8CqFkjHw0ymsjV+6RFRFiuEldW/FPyB3r1ZtJ0ObjH3DR0ywsZ+v97qVMEISm95KAQoirWsVq
	vnfRMaSKXd+fV1ZQJDxqzGYae/IGofTRw1geNg6RBSGFE9gpHrFw8UPRQYpYhMt1veOqA/h1lEWkp
	SSRk6A3STCmdFg77aq9Urg51A0cUgDqlQ64c8h+WF9L6PnB6Gnc0CodviaMxGILEk0i6ZUIjbziTY
	JH7TP5fJDsPa0roSZxIngGnDARPMN87JNIC7h4I4+up5wIucmA5blAFkz+mBjcgt48YudNoLwGDDB
	6UFMduHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNkw-0000000CYe6-37O2;
	Tue, 04 Nov 2025 20:35:54 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNkt-0000000CYcn-0uW8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762288548; bh=fYSzREhv9QD84HLe2GkZI7gSPV+D95DkkHF9PAZ78jI=;
	h=From:Message-ID:From;
	b=rv2xP406h25oqlBIzRq/B+LG47wqaJHJpTIK2SV53he8fLuj9fIdg78WvnLfF9Dwu
	 U08VzKfuiiW8cwXfxrX3L/w+LW48a4Z4i2DuQmzA/TxbdR4nHHBV+9IpcDuyrAtQbr
	 Pd3x9vvNXzphhoHOhm/glv2LvgPL8atibaZmzRKk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id D78C0C0954;
	Tue, 04 Nov 2025 21:35:48 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A4KZmXl020856;
	Tue, 4 Nov 2025 21:35:48 +0100
Date: Tue, 4 Nov 2025 21:35:48 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, kernel-team@meta.com,
        rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <20251104203548.GA20840@1wt.eu>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
 <20251104180819.GB20579@1wt.eu>
 <9a58c50e-729e-4565-932d-641aee259758@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a58c50e-729e-4565-932d-641aee259758@paulmck-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_123551_683536_E29951D5 
X-CRM114-Status: GOOD (  17.76  )
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

On Tue, Nov 04, 2025 at 12:13:53PM -0800, Paul E. McKenney wrote:
> > So it seems at first glance that LL/SC is generally slower but can be
> > more consistent on modern machines, that LSE is stable on older machines
> > and can be stable sometimes even on some modern machines.
> 
> I guess that I am glad that I am not alone?  ;-)
> 
> I am guessing that there is no reasonable way to check for whether a
> given system has slow LSE, as would be needed to use ALTERNATIVE(),
> but please let me know if I am mistaken.

I don't know either, and we've only tested additions (for which ldadd
seems to do a better job than stadd for local values). I have no idea
what happens with a CAS for example, that could be useful to set a max
value for a metric and which can be quite inefficient using LL/SC,
especially if the absolute value is stored in the same cache line as
the max since every thread touching it would probably invalidate the
update attempt. With a SWP instruction I don't see how it would be
handled directly in SLC, since we need to know the previous value,
hence load it into L1 (and hope nobody changes it between the load
and the write attempt). But overall there seems to be a lot of
unexplored possibilities here which I find quite interesting!

Willy

