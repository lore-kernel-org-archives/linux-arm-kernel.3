Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B885C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1QbDujzvxS5tDCV0mmLWfIc6eF04JBDNfNalv5yRBg=; b=VtDcmm7qCvrPK9ULpK3ZPe4U+G
	T1qYqXMwc4XXQMSXYJA0xHO0LLXbxaEqpgZXILPflDyml1Qy/n/dMtrNV6HHzfbNhCRIZgoIziTj9
	fnMQwO6ddItyl2plnPGNkowjR9ViritKh4BImp6WSKixg1qEqET31a3nHjhpUUQeSpcZQ5qf8U74D
	SOMmNj22qU0O23M7hb0nAMHyUxQV8sx8gTGgcrkUg3lRpo+MwO66ymBAGmFhFmjTSEd7a6BUfuS45
	B/7iEqg0/HHq1leBIGyNHLoxJ2ygmIRYldCrNn6BT280Yrxb8p7o9d/WrM9auUVdQD3hZ6WgkLhnU
	zBg+P+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpF0-0000000ETgk-1mg3;
	Wed, 19 Feb 2025 18:56:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoBt-0000000EBHj-2Uup;
	Wed, 19 Feb 2025 17:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F9865C5B4F;
	Wed, 19 Feb 2025 17:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3AFC4CED1;
	Wed, 19 Feb 2025 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739987336;
	bh=eABSkrzx4Qs0AYJ01eC/IAUU8ScLgyuVvlLJERhWrVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjDNY0TIYWHEiZIkbTaVwR2M8ShomTU1tjkcIn1hYaGEdtYRTpRKDxMomni2QWkzz
	 8OJwJRAYCzeo4UUM36sn0sl+IGWojCEgpML9/1/HB2MmUGYkq/EbtgL97U+zKbb1Aa
	 4wIsa4JPKOIXIvstsKJlL4pjNqL72XWB21dK834dnXOnJ6FVyvPr6EPmXf7Eh5U2v5
	 hDIFHeAh25GRX2nUIf3N2u1SDBqoAwHd9oGYxOXp0B7o0O0KFt1cjRn1E8QIFE35Cq
	 tvPIc7f0PFXIJ2P2iglN25iBxn7l/KdgaY+qT+rAnKbocfeghW5pgJiHoCFqGByO98
	 YpySU+UUiqgYQ==
Date: Wed, 19 Feb 2025 23:18:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vitalii Mordan <mordan@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Amit Singh Tomar <amittomer25@gmail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] tty: owl-uart: fix call balance of owl_port->clk
 handling routines
Message-ID: <20250219174846.t4eso3o2aug6rb47@thinkpad>
References: <20250213112416.1610678-1-mordan@ispras.ru>
 <20250214171405.kvyyespxtfqxhapc@thinkpad>
 <ci23nalbgrgi5o7zbze4adc54mupn6nymu25konthvtbhyjb7u@z4bteiubsiy6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ci23nalbgrgi5o7zbze4adc54mupn6nymu25konthvtbhyjb7u@z4bteiubsiy6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_094857_678635_98FF3603 
X-CRM114-Status: GOOD (  16.46  )
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

On Fri, Feb 14, 2025 at 09:39:09PM +0300, Fedor Pchelkin wrote:
> On Fri, 14. Feb 22:44, Manivannan Sadhasivam wrote:
> > On Thu, Feb 13, 2025 at 02:24:16PM +0300, Vitalii Mordan wrote:
> > > If owl_port->clk was enabled in owl_uart_probe(), it must be disabled in
> > > all error paths to ensure proper cleanup. However, if uart_add_one_port()
> > > returns an error in owl_uart_probe(), the owl_port->clk clock will not be
> > > disabled.
> > > 
> > > Use the devm_clk_get_enabled() helper function to ensure proper call
> > > balance for owl_port->clk.
> > > 
> > 
> > Do not use newly introduced APIs to fix old bugs. The bug should be fixed
> > separately to allow backporting and the conversion should be done on top.
> 
> These relatively new helpers are already available in all currently
> supported stable kernels including 5.4.y.
> 
> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared and
> enabled clocks") was conveniently backported there as a dependency for
> the similar bug fixes.

Ah, then fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

