Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A948E6FE26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbQvblk9HEIZ54zvqXDzZAc5AAqbimqRVP92K6jJRYU=; b=zxDe1GXlXoGWsLFrjn8PLNmU+V
	suMEtegYLB0je+Om+1YWOP3bvglmorLks73Yjf6JlN/PKsqWWGkJ0jIAV/G5ujwWcxEKsk0tCwrR5
	lGYgAL8jyvP45BGJZ8+F6RNIXkPfAOYXt4Rasg4jGMYO8etBETG2M1pZdaqMFvwoDW1Jbq5IqaqMe
	cKAXo99lQDJOevYUlYhcu+kVHO5wmMP5Zc7FLJcNbZc2Qf5n1RnGjR59Z3dTiTkBA367RIl72kLu0
	BGcDA3TjjIQwrY3ry8y2jlLEcETYQmQaKfNAdfxH3KEqPOk+54TZvKjbzGk3gx5KegctRlu+MUt5f
	epfLjjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCRs-0000000GCdr-3s5D;
	Wed, 24 Dec 2025 00:09:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCRr-0000000GCdH-1dUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 00:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60FEF60143;
	Wed, 24 Dec 2025 00:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AC5C113D0;
	Wed, 24 Dec 2025 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766534989;
	bh=9762YMZ3e4dNH0leV0xqlBgFdKvF9MnhJqn+Wiy6al4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmHlMsNddxVT09HRcBH/WYCdWtTAjhgNqDroROJ/EAyO7vCd9ktC5lPaCHV3OnOK4
	 Mexi8z/9J4MMsfuFpJyc5tPeegMajXKgbapMBe1RlPoi0dRaiiqiqXx4a60KOG1tKi
	 A5G5ble91/4izwKAn+3DXjs/Z0hXZs4OamgjP7649gyjg5R+Ovk2eQ8YusgjqzEZ0J
	 d27wfLTnWRrp5ZrU7wrkq7JAZLPe1MSOH6FJty/yJP9T2Ng+h0sGdXP2+Ca7/VhUoY
	 VrXLZklKFm1mPQwvat6ngYvvfRU8AWlKLp3tuOLhJpp5aDPEcMLl37jKw4J5fL2yrx
	 bK5yt1IiETvaw==
Date: Tue, 23 Dec 2025 18:09:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	dl-linux-imx <linux-imx@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <xiqftcgga24bypbux276u56t2lxjy4oxzggixrhy5h7woc4aon@2zbcfxxrzqig>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-5-shenwei.wang@nxp.com>
 <mnpg4xanzl45lal72c6kgog7qmqgk2zcp734eqdpk3gsonq63f@vlewh6jgdjy4>
 <PAXPR04MB9185B16A2B08E739B2FB64C889B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B16A2B08E739B2FB64C889B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
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

On Tue, Dec 23, 2025 at 08:20:49PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Thursday, December 18, 2025 9:58 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > On Fri, Dec 12, 2025 at 01:43:40PM -0600, Shenwei Wang wrote:
> > > On an AMP platform, the system may include two processors:
[..]
> > > +static int rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> > > +                            void *data, int len, void *priv, u32 src)
> > > +{
[..]
> > > +     init_completion(&port->info.cmd_complete);
> > > +     port->info.rpdev = pltdata->rpdev;
> > > +     port->info.port_store = pltdata->channel_devices;
> > > +     port->info.port_store[port->idx] = port;
> > > +     if (!pltdata->rx_callback)
> > > +             pltdata->rx_callback = rpmsg_gpio_callback;
> > 
> > What happens if you rmmod your rpmsg gpio driver and then trigger an interrupt?
> > 
> 
> The driver has a rpmsg_gpio_remove_action which will clear the devices in the pltdata->channel_devices[].
> In the rpmsg callback function, it will just return -NODEV error.

When you rmmod the rpmsg_gpio driver, the code will go away, so at the
address of rpmsg_gpio_callback there's going to be some undefined data.

> 
>      if (msg)
>              port = drvdata->channel_devices[msg->port_idx];

So this code is no longer going to be there, or maybe there's some
remnants of it? But jumping to the address of rpmsg_gpio_callback (not
the actual rpmsg_gpio_callback) is best case going to result in a crash.

> 
>      if (!port)
>              return -ENODEV;
> 
> > > +
[..]
> > > +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> > > +     { .compatible = "rpmsg-gpio" },
> > > +     { /* sentinel */ }
> > > +};
> > > +
> > > +static struct platform_driver rpmsg_gpio_driver = {
> > 
> > It's an "rpmsg gpio driver", but it's a platform_driver...
> > 
> > I don't think this is the correct design, but if it is then this needs to be well
> > documented.
> > 
> > Same thing as platform_data forms a strong ABI between some other driver and
> > this platform_driver, this needs to be well documented (but should be avoided).
> > 
> 
> Are you suggesting to use "rpmsg_driver" framework here?
> 

Yes, making the functional driver bind to the particular rpmsg channel
is exactly what I would expect from a "rpmsg gpio driver".

Regards,
Bjorn

> Thank you very much for the review.
> Shenwei
> 
> > Regards,
> > Bjorn
> > 
> > > +     .driver = {
> > > +             .name = "gpio-rpmsg",
> > > +             .of_match_table = rpmsg_gpio_dt_ids,
> > > +     },
> > > +     .probe = rpmsg_gpio_probe,
> > > +};
> > > +
> > > +module_platform_driver(rpmsg_gpio_driver);
> > > +
> > > +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> > > +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.43.0
> > >

