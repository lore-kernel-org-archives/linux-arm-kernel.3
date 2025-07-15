Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F2C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNlaWSamDFSq/Jqem+yHh7sXr1BP0uqXoeYgV7dAIAg=; b=K4vXncVW2Kg5O5CPR2pwnsA/WU
	YrmmzQ1/1B7lfM5SbXImEQEYletdxoC8fygDe6Ac7wYIYh0vhCppppCfhkweUeX5dmLem2Rcmx8fb
	sTu8tJnf20AYr+RlcrNkmWLJw1zO6lMeWA1ZcJZZz/W+RzIp0dJl+fRopii7ckIuHLx4+0SzHdbL1
	yudOtPEqX+hb3sfHDWwgxDXhTESgQX2xS+VRXO5+sLsSu9ofgNJpUifE82OhHoEo6Qx0GSGJpGVbm
	4/uxaRgDxGnSRX9RCCPrI69z3utn/eWnXZktK2s3PbEovp/EcXgwFOYgrUMj0CqjdNtJ5ZIrmnvMx
	ngKd/jBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgy9-00000005RV2-0xw9;
	Tue, 15 Jul 2025 14:49:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfeV-00000005CH7-3nsV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wNlaWSamDFSq/Jqem+yHh7sXr1BP0uqXoeYgV7dAIAg=; b=OmnU90SQmj6FYkOolhCcdTrR+o
	zyKw9OqcgK/AZU1z3tng3XVyXdC1fDwNb+2EEM8PxBntc/ZLiklywaoyGmU9kQaxlXj1jwqgpBwhV
	lbJjDSe9EZHrgwWZOeYbUOev4o86kKFn606iI4J8s5+mvllfv+fqaX+qMUL3ZVVv9osE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubfeM-001a9h-W6; Tue, 15 Jul 2025 15:24:50 +0200
Date: Tue, 15 Jul 2025 15:24:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: xgmac: Disable RX FIFO
 Overflow interrupts
Message-ID: <b38cad0b-c2b1-44fc-847c-140066a12652@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
 <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
 <21a0e265-6b2c-4bcb-b0ac-5fd47503f909@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21a0e265-6b2c-4bcb-b0ac-5fd47503f909@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062459_952607_BB681378 
X-CRM114-Status: UNSURE (   8.79  )
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

> > What is the reset default? Would it make sense to explicitly disable
> > it, rather than never enable it? What does 8a7cb245cf28 do?
> 
> The RX FIFO Overflow interrupt is disabled by default on reset. Commit
> 8a7cb245cf28 also avoids enabling the interrupt rather than disabling
> it. This commit mirrors the same thing for the XGMAC IP.

So same as 8a7cb245cf28 is good.

When you resubmit with the correct Subject: please add Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

