Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE70C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuvJ1f6IlNzpiJHbMztSBYQKkHQn4r7Jn0U2zxp25Ds=; b=vKFxbUV7Xjnc/U+jqJjM7ufL2p
	qGkdtsSPLXZCX3S18nP/QJW4s3txVOiz0CncRmdY5ExTwmVkfgJFVgU9IUoPJhhQG46hROvAIJ7Yi
	DFlyaMQ8n+VsegPWYHMQy93yXb+q8lc/cm3oZqwaELxbhzuKS0l2OUEt8vLjFqZmu0FehSfDoHYXw
	0SDHbnmVoBn/0DYjaMpQBQM/yhX8sg2VcVBfgNK/ejfY7DHErPlMXDdUzBFPFSUke2pq/tNt7+uOa
	LvX8IWdIKDwvGU3sdRtOYQnM01oR+5IQvC8QJccoSwtJHI5KZLUvn2WosphTlh5n7E7ditYxXwt9d
	yXDgOm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj10z-0000000Fyqp-2KWO;
	Fri, 14 Feb 2025 19:06:17 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0aq-0000000FuCW-462q;
	Fri, 14 Feb 2025 18:39:18 +0000
Received: from localhost (unknown [5.228.116.177])
	by mail.ispras.ru (Postfix) with ESMTPSA id C6F2A4226E24;
	Fri, 14 Feb 2025 18:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C6F2A4226E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1739558349;
	bh=NuvJ1f6IlNzpiJHbMztSBYQKkHQn4r7Jn0U2zxp25Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqrDSigEAywui/2olT7dcNP2jyrwVxun7XSY/SRSkD2P1mn9jMimO3ansKmgZzbau
	 jOL9NCbVRfygTSyaHovEb/uivXFxFITYmt3XD/soGtPpG5w16ermZTGbjB5rw9CtQX
	 oGAvplI5DpT7jGvtuDIiMyX0Qqx2+S+AVC6En18k=
Date: Fri, 14 Feb 2025 21:39:09 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Vitalii Mordan <mordan@ispras.ru>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Amit Singh Tomar <amittomer25@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] tty: owl-uart: fix call balance of owl_port->clk
 handling routines
Message-ID: <ci23nalbgrgi5o7zbze4adc54mupn6nymu25konthvtbhyjb7u@z4bteiubsiy6>
References: <20250213112416.1610678-1-mordan@ispras.ru>
 <20250214171405.kvyyespxtfqxhapc@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214171405.kvyyespxtfqxhapc@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_103917_203057_AFA34E63 
X-CRM114-Status: GOOD (  12.91  )
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

On Fri, 14. Feb 22:44, Manivannan Sadhasivam wrote:
> On Thu, Feb 13, 2025 at 02:24:16PM +0300, Vitalii Mordan wrote:
> > If owl_port->clk was enabled in owl_uart_probe(), it must be disabled in
> > all error paths to ensure proper cleanup. However, if uart_add_one_port()
> > returns an error in owl_uart_probe(), the owl_port->clk clock will not be
> > disabled.
> > 
> > Use the devm_clk_get_enabled() helper function to ensure proper call
> > balance for owl_port->clk.
> > 
> 
> Do not use newly introduced APIs to fix old bugs. The bug should be fixed
> separately to allow backporting and the conversion should be done on top.

These relatively new helpers are already available in all currently
supported stable kernels including 5.4.y.

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared and
enabled clocks") was conveniently backported there as a dependency for
the similar bug fixes.

