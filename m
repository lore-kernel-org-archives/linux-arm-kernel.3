Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8BC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWUrnFGYufl3syZYwtYjuU9uZOGyhIpP8L/7zqTakLE=; b=ZFogGQgdsTCnrrQA4X4GCMa4A0
	zjPDLz+8bTxajGAJYrfrSdSHl3yex5H+xY+owa09VmB1O6efVoPUIcuJ8SyUkAPFI3GKDc1gAmxNS
	u6oe1lVkTZ+Ath+fvoN3PdlfyMYo4IWw8bceWiYFD0tCJVgkc4D7G+kiwvXFoeCHwDtpM1INf3CEe
	XOmf0BKPc1cA36/r+KoIB0l+BAwiv9G6zQa71anyuXxiGStgsWJN4cCuZ1QbsVfC+SJYn4Pa4ZUjd
	nhnAXS+0T/4teEyezSzX0iPK956Qmry01BQ1KdrdpwbvcrSkAUKFuoWoYwVWNrVofR3mTSL9Jv5Ry
	dpL9ZWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m6C-000000084oA-31VU;
	Sun, 30 Aug 2026 20:25:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m6A-000000084o2-3yZi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:25:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BF3F600E2;
	Sun, 30 Aug 2026 20:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6106B1F000E9;
	Sun, 30 Aug 2026 20:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121549;
	bh=gWUrnFGYufl3syZYwtYjuU9uZOGyhIpP8L/7zqTakLE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hPBijgbn++DmdnYqGa42jWjjiWb2KXV9V3Ge1OpXI77KCVa8yY6hCjGY07HXKfM/e
	 I7p2qKfD2orBLXZFLkrYkZQaeguGGNvadmhiO0Vc57HbPsB78VAmgo8pNvdWG3yGjP
	 akW3HG7vXrWEFETDSk7z34d4Ckiu6XMFBHSl6oqC57fpCHstx+sux5H0MaWh7vReri
	 kjExMIWOe+iqZYm6Fj2RLJAqzRLG3qrpUsXF0pPpHBUZf2SW9pIb/0BaSa6SlFOKOZ
	 RIhsoJ6QVd8+40EtdE5r4AwV3cKWI/0nrxo7/ykbKxHaVc/TVhyuzkGhrWDvrOI2xr
	 w/Ldo0xLBUDsg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] iio: adc: aspeed: propagate reset deassert errors
From: Jonathan Cameron <jic23@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830134227.9085-1-pengpeng@iscas.ac.cn>
References: <20260830134227.9085-1-pengpeng@iscas.ac.cn>
Date: Sun, 30 Aug 2026 21:25:43 +0100
Message-Id: <178812154332.2788519.4278277683256006454.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=608;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=DpsBPTsiiRMc9Jfqxq9ivIXspOVDc/2T+OP02ftTjxg=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqlJHMmuJ2BEz3bQ3iQmyjjiHsjbBZLIJdc99yp
 C6/aP+1PXCJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapSRzBEcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiLykD/9YQs9EHXb9+mHMdLXUhmpJRh//t4UnHIHIsaopeW59sqq
 xi58RVSrrqeZ2bGLYmoU1k0YvLOdFNrMu6VaI0evHYSspOGpOX+3kzypS1u47wxTcCdbb+rc7QJ
 ngbbI8GY9Pud17iy8tF3nyaFM3keLXbjfnz40H+trKnx98DY5W5Ce4CxTIE0JkJG3sP4S5MaCiP
 muawDsufIm+U4WxtMeRThY1uBkHLKAxt009OR5Fz0Yc6/V83oBG2twLxXNouevIIF/4MaotrhCT
 jf8noauo6bm0cN+HPV3P0OYryEXQYlXJ8mOeGBpBldteZ60UGHZvAmYG7V1+0B+D6azirMZU1qy
 jBb9UBqkrXRo+9otOHPQN6XkpXzoTklg3EN0WolYWv06X2r8Ef7w6tae8nJy0jTCWw5qw6GnnU7
 dHNWJGYacZvhZDL0i2+gc3Fg9/RXdoDx1vr9R2KfjixmFysFdrm27XZVOoTniVbcuaSDeMagRhP
 roP3Y2OAxOXB9CQ8YX8Al1oks/Ikokr+OqleyI/xukHOY8TAo/3nA2d4y3yH5yzGO3DNV78PKzp
 qZ/jKoG5ZuzlPvNf58jHB/tKZt7TGEgHLVH8gqxwuyhQDeJ9q88CpUCumFxhn2ATryeWCkNFGh0
 L72SuSltOmlouErS1Zwpqt4iLHFLIbqqB5UuxVQ==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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

> aspeed_adc_probe() continues to register ADC resources after deasserting
> the shared reset, even if the reset controller reports a failure.
> 
> A failed deassertion leaves the hardware unavailable, so stop probing
> before
> installing the cleanup action and enabling the ADC.
Something odd happened here with the line wrap.

Otherwise, this one looks 'obvious' enough that I'll pick it up
now and apply it to the fixes-togreg branch of iio.git.

Note I'll be rebasing that on rc1 once it becomes available.

Thanks,

Jonathan

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

