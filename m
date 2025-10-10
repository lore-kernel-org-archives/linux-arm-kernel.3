Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPg6tFmE44GO59Osmm6OJOsXJFjD9dOzK+Pou3aQd1c=; b=tgbCToXl2EEh6RIck2dfvUUXLy
	YFCfxHM7SHQl2eLBFzLFQciNNfkfmXKfYAzKyt64JlrK53OEwZMpo8r35+verEVq+RLOHm7ABrKpc
	Ucc61a9QQ5Blc8ZjMmRRaA7WGIDCTK+3MPve3FTUOwSc0AsKCS4XW70RFHtejrlw8LW2CR49yGdsG
	x3mCqU2r2abc46kKAOGaIHuwhlHd83lD2sp5X9urarWHFaAkyb92EMzSAN+LzcVbLnXwFv4FePX+n
	LUNW5dP2UsvxSWBq/yJU0S711jobHgqqNIGGXnV5LYkNfKBeSnAtL8zgpCP8s4i7V51mt11aSDMgO
	/BBe+faA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IqV-00000009FrR-3x5b;
	Fri, 10 Oct 2025 19:32:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IqT-00000009Fqt-2WqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 19:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sPg6tFmE44GO59Osmm6OJOsXJFjD9dOzK+Pou3aQd1c=; b=27QRfO0Egr4ssojusmNF/vvsXi
	6sPZztKOfe+I3ZeGlmigAgpjzzSxVViZTvdyVqzi/1WpBAAreUqrl3eg8oRMEhWk15NhHNVnoeOkf
	RavLSNw0COOTLc0bZ9h1DoJ/+no6V6J5tmj/zYPBaWJv40C9NRS57bCzvQ8XS7R6edmU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v7IqJ-00Acyl-Qt; Fri, 10 Oct 2025 21:31:55 +0200
Date: Fri, 10 Oct 2025 21:31:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_123205_640519_913BE09F 
X-CRM114-Status: GOOD (  17.08  )
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

> The only platform-specific part is the message format exchanged between Linux and the remote processors.
> As long as the remote processor follows the same message protocol, the driver should work as expected.
> 
> Here's the layout of the message packets:
> 
> +--------+--------+--------+--------+--------+----------------+--------+--------+---------------+---------------+
> |0x00    |0x01    |0x02    |0x03    |0x04    |0x05..0x09      |0x0A    |0x0B    |0x0C           |0x0D           |
> |cate    |major   |minor   |type    |cmd     |reserved[5]     |pin_idx |port_idx|out:{evt/rc/v} |in:{wkup/val}  |
> +--------+--------+--------+--------+--------+----------------+--------+--------+---------------+---------------+
> 
> Cate (Category field ): can be GPIO /I2C/PMIC/AUDIO ... etc
> Major : Major version number
> Minor: Minor version number
> Type (Message Type): Can be SETUP / REPLY /NOTIFY for GPIO category
> Cmd (Command): Can be Input INIT / Output INIT / Input GET for GPIO category
> Pin_idx: The GPIO line index
> Port_idx: The GPIO controller index
> 
> For Out packet:  
> 	if it is OUPUT INIT, the out field value is the gpio output level.
> 	If it is INPUT INIT, the out filed is 0.
> 
> For In packet:
> 	If it is a REPLY message, the out field is return code. 0 means success.  
> 	If it is a REPLY of INPUT GET, the in field is the value of GPIO line level.
> 	If it is an NOTIFY type of message, it simulates an interrupt event from the remote processor.
> 
> I can add above comments in the commit log or the beginning of the driver source file.

Maybe Documentation/admin-guide/gpio-rpmsg.rst would be better.  You
should also document how to handle features the device does not
support. e.g. i _think_ your hardware supports all 4 interrupt
types. But maybe other hardware needs to return something meaning
-EOPNOTSUP?

	Andrew

