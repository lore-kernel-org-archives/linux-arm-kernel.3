Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11449D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=; b=bWevqpnRE9EG8/oGF2i34eLQnW
	vzxTfvr01k5OhfTKwytMUpCavDqMkA1kYvUtlqhXFt30UinrL5ryXLlSHP2asVcOWQIiQ3OTSrivm
	QuQK3Bvu10voodVyFM7sy1v6vyjzE02w6gBm4hGTYQQ63uZjyZI6nISOiCugiZum0PZAh59fGtVp4
	YQ2320bUThzwcYZDJQ27MOJBfsBtlcwaLFq//FHGJD2Qf9gWgq/FSEfYeW/fIROwHtdqIuZrESFH9
	vTZyBb9G9FiXkj/KixpYEFwOD9bDuStzfiw9SQzKGn955wBVCvTbCvP4JOKnEXWrFdg9KZm77hQqb
	o4qJWPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOem5-0000000GvBk-1ipk;
	Thu, 27 Nov 2025 16:23:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOem2-0000000GvBC-3BWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:23:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29ba9249e9dso11621455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764260594; x=1764865394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=SQuzMG/aBzkxAFrYZF5fn8B+WAl6Jex0LY9zf10j8x68TYY1j/jZ0O3uJLuOaylYCx
         Aou2e6uNCFCirPZ7MzVt3LGE7zN0mbL4dyxzAExgAZPOewVMEO6rARDfhF36IkaLD3sh
         Vv7PgmqinxHqqiZqkmSYoPNpYDIfJVAvLbsLUjy740L0mE40VLRRsWMZnAD4G740/ne7
         3Wn+8t8UoqeBEo1d5mEZBZp6eS2baxhNyKTzooOoPKAI5Z9KGGz2d9wqMcN1OFwSHg3h
         ZqnTWqnicf7i0z2QBLIpMxlhK8fqOuYGDH+F38n8ZSRDoEA9MUFgS4S13NuFwDuAGLGq
         30MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260594; x=1764865394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=u0sFxHSujS5w6rNuLQ5wQIhuqCP9wDFwqLB4BYg5AKtI/OhiktcjvXQ90AZdJP6OJr
         TACiENXUKclveLV0fQFQG9Li+Ko/ujZrBqXZdojF3dNOqLQAg9t4Bcb9CseLmF9KSpPf
         5bYfE9d7bG+sIez+JdTnYLXjj7K6xLiXrI2DGMjhXgXFWIPdKOVerwReWPjxuPKXzhsV
         byAQlgf+uYDYMF8WVwHIfuIc17MTjZTwzHVwkyzW6Ole8K477pgO4LFckwVTZyMmQ6gZ
         8frrKPCp8UupBrXhyrrXlF0Pv20pRe4zH7j0EemHFbLNeZCoBo4gLyTwuLHUloY9IhdD
         sk+A==
X-Forwarded-Encrypted: i=1; AJvYcCXQP8CODH+fl0wl7mM1j2rSwCPCr5yeAcMyxYlZLg2/YPY1X1+g1tXrpQEbbjNFpcNNhDmPs5dtHsnBOEtHSUi+@lists.infradead.org
X-Gm-Message-State: AOJu0YyRuo1T2RqvyeWAu9NbE5w0tqBs0QKK0+mAglurwgvyqcrMTRbr
	8dPRtYFea9qmxi9TssYSSBZQrc7eeDSgGigMlQcFzA3sWSdc42HMy5nCf6MZWyXdQGw=
X-Gm-Gg: ASbGncthO1F32G+CigLgWMP9jK4ICgubew0NNqkrPoID8OypGoln1XBz38sivL6IFj/
	u7g23MUSVPpgJ3KAiKBAD98C9FPtj+ZS87E3kh55Q0w99nws1pGi/sahwDGxGorNS0ehNd0Wjic
	JHXenE3BxcNfpF5qyMXLbQZIjS5g4zjZ8P8PN+4m7z3nRhboPU5RoAgvfeRD4wbbJKqp22R9psF
	qyWFyNDgDNP8uGQ0/I/iZsDbS3viQAu1qg9LA30sICCWPWfoNTrOeWVfxhF2DXzZy8txu6+ReZv
	rl0CEnQPh69Q/W6UMaEDc+aOmRea/Q0JIUiQt/dTSkqpFertp4ON1YSg7ZqrSHwfbzEFbaXkMYk
	lScbz5RI5XKJLknrbgR8uycwe1EYr0wukHuHJVNhcs7fGeaBd+fJmW62JfNQtAAasEzrbczgUl2
	w6ga6wh0Buh4v8Tg==
X-Google-Smtp-Source: AGHT+IHqx1uI/5nrF6nAELgHS8dwwRi8UkkNhUGcSd+x/B6tc1auqIiR26mDQUo8dP8rVSg7iApWFA==
X-Received: by 2002:a17:902:ef08:b0:248:ff5a:b768 with SMTP id d9443c01a7336-29b6c3c7340mr247945805ad.10.1764260593683;
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce2e676esm22111985ad.0.2025.11.27.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Date: Thu, 27 Nov 2025 09:23:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSh67mvFB_00PywW@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
 <aSdMufLCeqvVyKsp@p14s>
 <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_082314_832693_6F812634 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Nov 26, 2025 at 09:46:38PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, November 26, 2025 12:54 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> > <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix
> > Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> > under "rpmsg" subnode
> > > +
> > > +     drvdata = dev_get_drvdata(&rpdev->dev);
> > > +     if (drvdata && drvdata->rx_callback)
> > > +             return drvdata->rx_callback(rpdev, data, len, priv,
> > > + src);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) {
> > > +     of_platform_depopulate(&rpdev->dev);
> > > +}
> > > +
> > > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
> > 
> > Where does the rpmsg_device come from?  Usually there is a call to
> > rpmsg_register_device() and I don't see it anywhere in this patchset.  I also don't
> > see a link to the remote processor.  I can't continue with this set for as long as I
> > don't have this information.
> > 
> 
> It is in the function below named imx_of_rpmsg_register_rpdriver.
> 

The function below calls register_rpmsg_driver(), not rpmsg_register_device().
I still don't know where @rpdev comes from.

> Thanks,
> Shenwei
> 
> > > +
> > > +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> > > +                                       struct device *dev, int idx) {
> > > +     struct imx_rpmsg_driver_data *driver_data;
> > > +     struct imx_rpmsg_driver *rp_driver;
> > > +     struct rpmsg_device_id *rpdev_id;
> > > +
> > > +     rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> > > +     if (!rpdev_id)
> > > +             return -ENOMEM;
> > > +
> > > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > > + RPMSG_NAME_SIZE);
> > > +
> > > +     rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> > > +     if (!rp_driver)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> > > +     if (!driver_data)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data->rproc_name = dev->of_node->name;
> > > +     driver_data->channel_node = channel;
> > > +     driver_data->map_idx = idx;
> > > +
> > > +     rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> > > +     rp_driver->rpdrv.id_table = rpdev_id;
> > > +     rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> > > +     rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> > > +     rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> > > +     rp_driver->driver_data = driver_data;
> > > +
> > > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > > +
> > > +     return 0;
> > > +}

