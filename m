Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63479E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 23:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXCrln5Y8P76LFnw/leQdo5B6lVUcRETyacb/SFNe88=; b=BYyhG267OSfap0gruuDhiQTM3t
	qjOYew9bReyhFi3VwXCafL5FY4HVLbccrkRwc+j8C1AG6s1g5Hs2wZJIiWBFLH2ANfVNxHjoS48Ew
	CwKV8/F3roJxy7hvlWZ7OFfFA+EP9gTJYLs/tujfVKgKmDTRR4yIMUcWcL7E51wdHb+mCyRwXFTMu
	l/FdVrXUKn/NjuL9jimK+7L3Ie9a8gR3seJXEnIHqrPlc7TS4y/0gJcjs5hQd/QGp4aebJHqYqKH+
	WTNT2Q5jz2yC4ExBWDpplKSSoZiwkWhYkXQww7WmqCc8EpQp/g5tlaF82Ugrg1c6mCUa2nfSRCowF
	m/qS9Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPrdp-0000000At1M-3wxn;
	Mon, 23 Dec 2024 23:15:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPrcd-0000000Assq-1mY6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 23:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BAB2A41323;
	Mon, 23 Dec 2024 23:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6FBC4CED3;
	Mon, 23 Dec 2024 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734995637;
	bh=TyP4QDcgBbaAubuB18SKIbFnVadU5zHJDCj3I5P7s6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP8/Q4/8w4MlzOjBBL3S6JzQe3Ynx+KYDgPpO7IzVsTucrULhWBfBjHdJSso4MzqB
	 1R43DiKvwXLo4b9FPzG5ivowUMogbK/4ciF/jjcM0rZzG3Ppgjm9PYjp1r7sulinTD
	 AYnfPBUaJz2Dcmsw1M+ZosQxsFOmsqTxGU0dR+H5VirpeGi6xnxp17cLpkVr9YuVii
	 l+vvCw3T/fmtYFVp6sM7XkRuBTW0mxXIMBBa9wStnPeW5Sg82jtMutgKm+Ctf0iAII
	 UXhp85GF9DUIWG4ZKS9w1PKixscwsZTlfbeYbCLGsYKBwDR3ndIa8v/yFyVynYG3xW
	 1iGQNbRmfdskA==
Date: Tue, 24 Dec 2024 00:13:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
References: <20241223034416.544022-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223034416.544022-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_151359_527845_A31CED6D 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Carlos,

...

> @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
>  
> +	/* As we can always fall back to PIO, let's ignore the error setting up DMA. */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret == -ENODEV)
> +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +		else
> +			dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
> +				ERR_PTR(ret));

My question here is not just about the use of dev_err vs
dev_err_probe, but why don't we exit the probe if we get an
error.

We should use PIO only in case of ENODEV, in all the other cases
I think we should just leave. E.g. why don't we exit if we meet
ret == -ENOMEM?

Andi

