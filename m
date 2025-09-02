Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8C5CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh45IG+nhby5AJFDq8SqfOmS0hn8ShviZq52EepM2SE=; b=AY0uVCitEsw6SD+y80m0UmMNrs
	KOtyLrcmEhR10bMEZ4qORe+VAhjMNgrT5uEzSZlgy3Ud+J7L39p5zcTMBCF2icHZZ7fnvfSEcJ1kY
	pEagalXvoLATlZSdydp3YLoVpi6MzYUbS9OeIG7RgrII+mW8mH/CbaPd3B9t9fxJjxMJ4wSCeGYLx
	6iDR/rVTybEJCKt8OLZVaWQYSK6e0qlB9ZuC2dK5REvss6SHLrzAaz6AsK2vdc0Q6MVNrusD5ED8R
	JWYEshgF6ujvuv2D72mAnuKGZ6GPOo02nQRdCDWfqPnFEx5zWRr2Ib93Qu9NmPmNfHa3+x0z1aATq
	D6FMBARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAm-0000000HJ5N-1YV8;
	Tue, 02 Sep 2025 12:31:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utO4J-0000000Gcho-14cW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418FE169C;
	Tue,  2 Sep 2025 03:16:42 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 305483F6A8;
	Tue,  2 Sep 2025 03:16:49 -0700 (PDT)
Date: Tue, 2 Sep 2025 11:16:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, stable@vger.kernel.org,
	Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <20250902-axiomatic-salamander-of-reputation-d70aa8@sudeepholla>
References: <20250829132152.28218-1-johan@kernel.org>
 <aLG5XFHXKgcBida8@hovoldconsulting.com>
 <aLa__M_VJYqxb9mc@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLa__M_VJYqxb9mc@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_031651_359177_6E3A9643 
X-CRM114-Status: GOOD (  23.15  )
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

On Tue, Sep 02, 2025 at 11:59:24AM +0200, Johan Hovold wrote:
> Hi Sudeep,
> 
> On Fri, Aug 29, 2025 at 04:29:48PM +0200, Johan Hovold wrote:
> > On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:
> > > The quirk version range is typically a string constant and must not be
> > > modified (e.g. as it may be stored in read-only memory):
> > > 
> > > 	Unable to handle kernel write to read-only memory at virtual
> > > 	address ffffc036d998a947
> > > 
> > > Fix the range parsing so that it operates on a copy of the version range
> > > string, and mark all the quirk strings as const to reduce the risk of
> > > introducing similar future issues.
> > 
> > With Jan's permission, let's add:
> > 
> > Reported-by: Jan Palus <jpalus@fastmail.com>
> > 

I was hoping to hear back, but I assume silence is kind of acceptance.

> > > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220437
> > > Fixes: 487c407d57d6 ("firmware: arm_scmi: Add common framework to handle firmware quirks")
> > > Cc: stable@vger.kernel.org	# 6.16
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> I noticed that you picked up this fix yesterday but also that you
> rewrote the commit message and switched using cleanup helpers.
> 
> Please don't do such (non-trivial) changes without making that clear
> in the commit message before your Signed-off-by tag:
> 
> 	[ sudeep: rewrite commit message; switch to cleanup helpers ]
> 

Sorry I meant to do that when I replied and asked you if you are OK
with cleanup helpers. Also yes I planned to add a line like something
above before finalizing.

> In this case, you also changed the meaning so that the commit message
> now reads like the sole reason that writing to string constants is wrong
> is that they may reside in read-only memory.
> 

Ah, I didn't realise that it changes the meaning now.

> I used "e.g." on purpose instead of listing further reasons like the
> fact that string constants may be shared so that parsing of one quirk
> can subtly break a later one.
>

I see your point, will revert to your commit message.

-- 
Regards,
Sudeep

