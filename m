Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F7AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4NzBCvFv04+Vi0snEc7kDWAhLxT5Ew8rA6Mb2Y1t1k=; b=Km229eDsRoy+Qjqh2Y6aQsarCZ
	KsNBxeuX9mV5cJrzvrE91189RT7d16dtl7OX+1yzuhMQRwy1gsp1y/aztzGl6jzuwfcJ6RSKVeUMk
	4uPLQ1st6A9TXCtA5in7bc+Ma/xlRHkQi/fElIMCbya79n98h0KvHRXUXic83goujBaeTTPab22m5
	x4vSsm2poTYVzONDKRUsNZHSOas/TcJxZZhfCLFBNDRb0XCztB0xIEcelW9Ra79iT1AD+BTvxl+HK
	5jB36rgiPRDXdknANcQQvYGutL66+VOzb5KtlBOnlYsOOagBat47MEm+1n6zctvotFTIQqYd/hTEz
	g2v/GcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQBF-0000000EWJu-2i2N;
	Fri, 20 Feb 2026 13:04:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQBC-0000000EWJS-3QeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/4NzBCvFv04+Vi0snEc7kDWAhLxT5Ew8rA6Mb2Y1t1k=; b=uTP8vgMlKF62Q3M9U6MLaKWIjy
	7I1AGzOJtQSn3cwrPjiy7gczMyhYr59DcXaLkC3pjaBqO607bYnTGZcZydMadqi4GLIFwIfFH5IDe
	LGtGHkHhktZ7czfk3K/wJ8nQnMRsvnQ6DXEmzpaBXS9LlMuznWd4DeYLj1cZLY3EvL1U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtQB0-0084K4-S1; Fri, 20 Feb 2026 14:04:10 +0100
Date: Fri, 20 Feb 2026 14:04:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Linus Walleij <linusw@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/2] net: ethernet: cortina: support deferral
Message-ID: <3d0d0727-1bfa-4e43-ae09-2d636b9f7d66@lunn.ch>
References: <20260220021949.40817-1-rosenp@gmail.com>
 <CAD++jLkZJLsayzMnV=vTZ4nNMB5yWw6oogtbOjnj+MNUMJ8PEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLkZJLsayzMnV=vTZ4nNMB5yWw6oogtbOjnj+MNUMJ8PEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_050422_852653_669D7CAC 
X-CRM114-Status: UNSURE (   9.86  )
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

> What I actually most of all want to achieve here is to support loading
> the PHY as module, but I suspect that then the ethernet driver has to
> be a module as well so modprobe can do its job.

I don't think that is true. You should be able to have a built in MAC
and a modular PHY. phylib will call out to modprobe, passing the ID of
the PHY in order to load the driver. There are some interesting race
conditions when interface open() is called while the PHY module is
still loading, so you end up with genphy. But the race exists
independent of built in vs modular MAC.

	    Andrew

