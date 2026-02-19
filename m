Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C22DE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTx5xYUSGsOyZu92DsCx1SvBwbu3nc6Z9peJKy6aG94=; b=GHDfemonIMngp5vq0/hJyQY0ph
	MuR08AJ56w5wNBIBLt+nq4BslHivl2E5/jNe19Nu5tWTQTmds/67jwADKx6qoHAUHVyU+i8g0ewv6
	OILT6Varvt7T60kGr3XwIZlzhaSKdI0x3fLHJfGouJ8P3BQPgkxjlzDYt4R0jl0IZxigoMqYi5Mzo
	MRZ7O+xrA6lCbnAY4VKDPnlkndWVuilEeDmllHb+JsxXpUAiUh7nLcjgsZiLpOIdTtcR43zzHuadT
	CRQQB2qvFkk42uDxhADFt/Z8JXE291wL5UB/mabtxcudjfkvfCmzVZbDV9fldE/WZoT+AHXfvkIfF
	uRSm62HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt43o-0000000BOTR-0z3F;
	Thu, 19 Feb 2026 13:27:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt43l-0000000BOT6-30aH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OTx5xYUSGsOyZu92DsCx1SvBwbu3nc6Z9peJKy6aG94=; b=klslBckAQ9ua5SE2P5JljVjvSQ
	ZD6yujfTr8QwvZqsbYgjbIsmmFx0ZZtWMBtuGoRKA1BpMNh5P+uzGinNCZG3EolLk1Hn+auQTOD/W
	kmgjnUO3B2S70xdA4KFlmZaPFjs27Ls79w0i19HUi0OK6VdUrP7LZFlx4vrsFPG8K2eI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt43S-007uuW-8t; Thu, 19 Feb 2026 14:26:54 +0100
Date: Thu, 19 Feb 2026 14:26:54 +0100
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
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_052714_136954_4DC7D1A6 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

> > +	if (sync) {
> > +		err = wait_for_completion_timeout(&info->cmd_complete,
> > +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> > +		if (err == 0) {
> > +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> > +			return -ETIMEDOUT;
> 
> strange condition you return an error if err == 0, for redability use 'ret'
> variable or simply:
> 
> 		if(!wait_for_completion_timeout(&info->cmd_complete,
> 				  msecs_to_jiffies(RPMSG_TIMEOUT)) {
> 			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> 			return -ETIMEDOUT;
> 		}

This will be from a comment i made. It appears that
do_wait_for_common() can return -ERESTARTSYS. I assume that should be
returned to user space?

	Andrew

