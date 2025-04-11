Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910FFC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOH8CIdz65AlaprFUzkJc8PL6lMT1kHFZ8SCjFlHZ9c=; b=ifbIcXKDOg+63cKTwIhgQbkjpT
	35vCGLyELzcheNmJ7YJXKrzBraEPRablDjWswvNLXarAeKlFdJhe4TxRxZzBdpIHTRni0Cc6P6wfh
	xmoIs8P/x3DNXGQzkrc4wwXjoxstTUCcVVnEM90Vq0klqxm0bx/obzXGLT3kr/n+ikWZOLg8RcFM1
	uOO00J29U7u2xLRd2hz9FG8i/lI/KIAEFDVqog434ubRawZdrTl3NALYxwyJkH9nHso9Yy48T3C2J
	lCjvTkddoYh16Cuk420sQ5lbmSD+lt3BiltGr/b3UGnz3DlKqq3lGF4gwFzaKdL2JpF6oI60keDU6
	1QGrlVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dxo-0000000DpX3-2itE;
	Fri, 11 Apr 2025 12:58:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DhQ-0000000DmEf-1ky1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:41:37 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2D7CA1FEC1;
	Fri, 11 Apr 2025 14:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744375294;
	bh=EOH8CIdz65AlaprFUzkJc8PL6lMT1kHFZ8SCjFlHZ9c=; h=From:To:Subject;
	b=E3btRzlir8gNK+aXDl3vPeVu4yeZ/AEtyTxwgKCsw8IULkGr+8Wid5/IKqHV6MMhs
	 coudJUidzaoGjnYB/rZMq/WPqLgms0I7TMW2KyPmoLu2RIvwbQssuA8exOmAGPGCq1
	 zTbZfp708FVTHIDztLVGSehqjJHi2fRFWoKhJ+tVPh/7wAhAfPIaMxlbUUg5URzSNv
	 4+1SZhkjzFgr0hLM8bIbZL3R1TMtnpC4XHpegMk/T9rVWg2IrZhGSCdneamI2OvcER
	 tNLxDjAF1Z8xMtxEKdaed9CxUIIL21V1OVYaWCODqs49g8HwRU8xQ4/AA6JkoUJn7n
	 qklDoVJJhmGnw==
Date: Fri, 11 Apr 2025 14:41:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Carlos Song <carlos.song@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250411124129.GA48732@francesco-nb>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054136_615933_CA929171 
X-CRM114-Status: GOOD (  16.34  )
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

Hello,

On Fri, Apr 11, 2025 at 11:55:31AM +0000, Carlos Song wrote:
> > On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> > > From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > >
> > > Rework the read and write code paths in the driver to support
> > > operation in atomic contexts. To achieve this, the driver must not
> > > rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
> > > routine. Even jiffies do not advance in atomic contexts, so timeouts
> > > based on them are substituted with delays.
> > >
> > > Implement atomic, sleep-free, and IRQ-less operation. This increases
> > > complexity but is necessary for atomic I2C transfers required by some
> > > hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> > >
> > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Any comment on this?
> Looks good. Thank you for your work!
> Do you test it at some board? How can we test simply?

It was tested on Toradex SMARC iMX95, there to power-off/reset the board
we have some I2C communication required [1].

[1] https://lore.kernel.org/all/20250407114947.41421-3-francesco@dolcini.it/

Francesco


