Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E9FD877D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6Y4ZFhW4cSATcogRMbcAzq1BU+egoD9LUl6g+F51PA=; b=oZv3afJJtCN9PSSs2jEOIAbfFj
	3lZ0qM2MFtU8kQMdsLFmNm43gqSHo0mTqtNZPYRHfDmGzvFgk9ETQDYlfqnuEFYfaC2CFu0i2iEpd
	ML9sN2l1ZrsgbxENHq2c+r6bEh/0OHx2vMl0hCbtP/Sp4g3roz9THZrnSdgIZ/sm53lf6RlSwVM7n
	LcY/gzePN1xlRtPuI7uc42Nhs0ietOCpefCduOTVuwqDtd4UqT4kv0R3yeWSOk6Joeozvlt1FK4Nu
	/CGYfzrgI9cPChfxft2jKLLExVV9s0MPv0Mk8/E3xWo+HsXzfqouB2GzidQWEsyiq/+p8/yr+3fEd
	/1mTECXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VJa-00000006ZSl-3S3c;
	Tue, 17 Mar 2026 14:22:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VJY-00000006ZRp-2tm8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I6Y4ZFhW4cSATcogRMbcAzq1BU+egoD9LUl6g+F51PA=; b=0KUmaox7WptcPUgpyYu6zf8gmx
	OuQhHCtBY1RmDCddkr8WPd7/OqPtgIAqv3DZazZKjnYAtGsf7kv0jzozr0f6Nli51WdnXtTl1fNQE
	5SN/WJghoZzlYvj4Htq9wxoxVWZoQw6jwhr4VF7p2KDhKgD67YTd14XUtDWt6KrkaJzQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2VJQ-00C2Ig-J1; Tue, 17 Mar 2026 15:22:24 +0100
Date: Tue, 17 Mar 2026 15:22:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <0f880475-a850-4138-b79d-d3c88765b0e0@lunn.ch>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072232_744326_33689B62 
X-CRM114-Status: GOOD (  13.41  )
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

> > +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> > +				   struct rpmsg_gpio_packet *msg,
> > +				   bool sync)
> > +{
> > +	struct rpmsg_gpio_info *info = &port->info;
> > +	struct rpdev_drvdata *drvdata;
> > +	int ret;
> > +
> > +	drvdata = dev_get_drvdata(&info->rpdev->dev);
> > +	reinit_completion(&info->cmd_complete);
> > +
> > +	if (drvdata->protocol_fixed_up)
> > +		ret = drvdata->protocol_fixed_up->send_fixed_up(info, msg);
> 
> Seems not part of a generic implementation

Agreed. Lets have a clean generic implementation first, and then
patches on top for legacy stuff.

> > +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> 
> The number of GPIOs should be obtained from the remote side, as done in
> virtio_gpio. In virtio_gpio, this is retrieved via a get_config operation.
> Here, you could implement a specific RPMsg to retrieve the remote topology.

The DT property ngpios is pretty standard, so i think it makes a lot
of sense to have. But i also agree that asking the other side makes
sense. What is being implemented here with rpmsg is not that different
to greybus, and the greybus GPIO driver also ask the other side how
many GPIO lines it has. So yes, it should be part of the protocol, but
maybe optional?

	  Andrew

