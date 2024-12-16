Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91472E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lPU+k2B+n0yE3XNn+Y9y0r9UdQY6i1mb29ATV0ddzA=; b=pn1QojTfG+sGxQpj31qXP0VQ/C
	vBD7NJKTzB345J+lZo1gY0pfK785RtCmUjRQiObzElxtBUSTyT7D8HHuvmrRv9uJSDe9jG72BHz06
	2fagKZJZwnJQ2dYNQ+Wq8AWimiNCabMByKovQK2GusFMwJutJh3fQYcSC3h6tEgZMdrDVsMi8gRyE
	hbDu0QeK5jQCCpeF5ZJkOlOJ/y4mDhT/qsGEHwngUoViyKiN3y+vBdvC1luB+TZPeKccQzhxzedpi
	WzY+S5if4T0DF6s2YIydKJJ/Sf2+NR0Ht67f+9e94Qn9cjzgstbHs1IIfncEbALs93lrtIvDran88
	G7vw2SUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG4Q-0000000AziO-1td6;
	Mon, 16 Dec 2024 18:43:54 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG3I-0000000Azci-0ogg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:42:46 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 86207224F5;
	Mon, 16 Dec 2024 19:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734374556;
	bh=6lPU+k2B+n0yE3XNn+Y9y0r9UdQY6i1mb29ATV0ddzA=; h=From:To:Subject;
	b=Kk/txJJHpqKFWtgQxPHwZ68QWOZBG8zWo27NH27u9bIECjOxoUsvctOCHshndB+YG
	 BYzF3EO/K1t9hVXBCStk0l446rgAaGOFFHdAGsWI2dO5e/vqnwWsWjm/ZtNqVoHGzj
	 o7U6G9cLI9/1wLlsFGnzHTkaOuCJa/syRHTORLDyFMHqdd7Lx/AKMYnOFZdEgtcO12
	 AWPweOhXo99/a5S8R1lwOuKrkDilX8EY17YnDJjO+5DM+o1D5NPm41BDJahrFRGFOr
	 xoQLtlnIyDOyoIjyMA96Kqmd4zn7QE7Pc3sinLGdJ4nFTnMZh/uwqBv4JQUOzLMCOR
	 WD8FbWPVYpSxQ==
Date: Mon, 16 Dec 2024 19:42:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <20241216184231.GA53492@francesco-nb>
References: <20241216151829.74056-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216151829.74056-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_104245_273497_BB7D6BF4 
X-CRM114-Status: GOOD (  14.46  )
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

On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> A regression was introduced with the implementation of single-master
> mode, preventing proper stop conditions from being generated. Devices
> that require a valid stop condition, such as EEPROMs, fail to function
> correctly as a result.
> 
> The issue only affects devices with the single-master property enabled.
> 
> This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> polling for single-master mode when generating a stop condition. The fix
> further ensures that the i2c_imx->stopped flag is cleared at the start
> of each transfer, allowing the stop condition to be correctly generated
> in i2c_imx_stop().
> 
> According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> 5270), polling the IBB bit to determine if the bus is free is only
> necessary in multi-master mode. Consequently, the IBB bit is not polled
> for the start condition in single-master mode.
> 
> Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


