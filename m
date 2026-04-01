Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385021076382
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCHnenR6Ib7syOkj1tXbhYhuLdr55jYGJnqFLe3B7GQ=; b=WEOASJHahPsx2l1SfA+uHZyGx7
	qrHn4SLQjChNeM4EBzV430v9NCC7lPTwKJQMKpjeqXxSJ38H9wLaRtkaOc3n1w1CZT5hoIhSX82dl
	0A/vZLuiefsqFIaRfq2nloCVlJSWarVhjjpkSgNYdWwcV5WF9q+0Eu7gcoqOdWFLk0rmxuh2RV6ip
	rHy2JzP6CBcuYXwas0kobiRSNqFgbQ/V7AIMJNSkfFhIRcnB1aq1h69zdp/KpMqKhERPIghNidIOU
	CswC95oGTjzP0p6Q9uDL2RsOuje8TQp0psqzUwJ/eDbSu7klDBgg1S5g8MVUxZN0sQe1wLKpc0vXU
	a7xWI8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7weU-0000000FVIa-3XdU;
	Wed, 01 Apr 2026 14:34:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7weS-0000000FVHm-2IMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:34:37 +0000
Date: Wed, 1 Apr 2026 16:34:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775054074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCHnenR6Ib7syOkj1tXbhYhuLdr55jYGJnqFLe3B7GQ=;
	b=Jf/WHRxtccht21BMrKLYosvhoTBD2eaH5n+lztcgEnfhR45jQrjBO9OQHGbufXPBi5j7DR
	W+rbb/1SHdtZZe9fgDrpQWehx2TjM19orlJT3zWO0imq0xz+DbhB2dBHhT/YCzRzr8tPNq
	ISVXXY9LHjDIRqthAnKscXARjSzlCJgdChJW+Q1XtmYO0fmF3EvwiVZ3sSmmIn9R5Swnrs
	YgZbk3DC0+4F2x4YlPFAT7qi8IxlX5ikkR9UlUhHLVa4Z4A/qykU05WQjbzs2lnrdeKY2w
	Cqp4V6W3yQbdoBmFHHt9EbTkaASlrY50yESPnRqX8A7WF1idOJ4WK3gdaGaxYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775054074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCHnenR6Ib7syOkj1tXbhYhuLdr55jYGJnqFLe3B7GQ=;
	b=b/ycmL2nVM5345ysspzJmig9GcBxx3K/OgdCg2OMwBpaIJOTfl2x8HYfbTNBfd21gQ0sVF
	fi1oPH1rEk0JVNCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: RE: Question: interrupt randomness and handle_percpu_devid_irq()
Message-ID: <20260401143432.AfQo--uu@linutronix.de>
References: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87bjgik042.ffs@tglx>
 <20260401141417.6uJk69i9@linutronix.de>
 <SN6PR02MB4157BC5ADA592D8D6084C6DED450A@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157BC5ADA592D8D6084C6DED450A@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_073436_720762_33F801B0 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
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

On 2026-04-01 14:33:34 [+0000], Michael Kelley wrote:
> I'm planning to submit patches to do that, and remove the
> add_interrupt_randomness() calls from the VMBus ISRs.  Hopefully will
> get the patches out today or tomorrow.

Thank you.

> Michael

Sebastian

