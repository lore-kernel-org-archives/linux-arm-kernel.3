Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B49E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF5zqpNDH5cufnUHHX4EuKRyqYPmIUA4M2TE2zTuwpA=; b=YfJxpBAc6b/2vMM/nEvurakcqy
	jHP97p7/gK0MoOEtYK8FbxszJ9bQ2mW3OQSBkzXHospCc1fB+hOZT1TUsrPDKzF/oalid8VNaBq5d
	LvfGpMYXPDlfLd6N6edil6WPyWI57K8l98+8rAiDFjGbAZEX3ZAU3vKuj7AaeDWAs/9biL1GtZFP3
	3l9rEajmdy6RAUYyyw+Gs67PrKuakix2Ze300KYKBVLJMfxRq4HLslYCGRpKWSOftK3/odnGZsckj
	V5rO8rDoasBEv5/suP/ZUeFOi4bCwTcvzy4ingDiuvOxLQeHViLEaZ7obTPCgWQ/uLpJwchS0qRn9
	h75sTgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyMy-0000000HNn4-24LC;
	Wed, 18 Dec 2024 18:02:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyLs-0000000HNf1-3550
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C27C2A4274C;
	Wed, 18 Dec 2024 17:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D738C4CECD;
	Wed, 18 Dec 2024 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734544851;
	bh=jDqywiClxZaBJPC/86Ml/BE+k0/1EIzLQXuK0uDXbKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lmyd+Qm7SOUYdiWVxYmyxOo3vZMGC1iwSrpqmFB92xfIYg1NQIoRB5pjp7nSXb+Xy
	 O7OlgePpM9+IRSkpUUTmig8bvrWlmwqgt1Xqm8BFjvyD2gsRrS1bjvuJQKG91xRoEe
	 NGVbu9CSzIVTDVMxn6CxvZC6S7SFzckNS22wgkthSGabkq9f5IBx16lY57bzHdcZxb
	 fmzGY6rEbhiNg/0cCmeUP1BohVTSy4u4OLKnb8TZk+TGwgczbKtjfA9yVE3WKyOhRS
	 467AogImHBXBQXREx3V7/Q1QzfWa1zYP7XhEGPioU5HA/x3BhLyrL1XCvkJZZo+Yqo
	 ti5pE5/WzpX+Q==
Date: Wed, 18 Dec 2024 19:00:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Stefan Eichenberger <eichest@gmail.com>, o.rempel@pengutronix.de, 
	kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <i5b2b622jmp2daco62wljolnjz5p35e67ldpkiqd3jv2z4ruqo@go2b4znun6z7>
References: <20241216151829.74056-1-eichest@gmail.com>
 <Z2BWtjPT1sTUCZ82@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2BWtjPT1sTUCZ82@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_100052_864423_007E58D5 
X-CRM114-Status: GOOD (  11.13  )
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

Hi,

...

> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index f751d231ded8..cbf66a69e20b 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  {
> >  	unsigned long orig_jiffies = jiffies;
> >  	unsigned int temp;
> > -
> > -	if (!i2c_imx->multi_master)
> > -		return 0;
> > +	bool multi_master = i2c_imx->multi_master;
> 
> Move "bool multi_master = i2c_imx->multi_master;" before
> "unsigned long orig_jiffies = jiffies;" to keep reverse christmas tree
> order.

I will take care of it.

Thanks, Stefan.

Andi

