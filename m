Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9876F513EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP/+KyLFxcqxA5l9rU9MI9S/9G1X3GO+0l1FGXNsyfQ=; b=pQhr5IKdwMRBg3eNN5R5Ce+78O
	tcjHHU873Q2w7QEwXttZrT10gbEVzP5FUJtXItbrlPjyyCLMOyGkhKXnT3DHDjUhzb94v5cAl25DU
	u5hhz+gAOtL4X9nV2WsrlK60aXLk7anWgAj40MejbkKV/U++On5H9qRFWm+nLxCP9kkdc6uvh51os
	M1d8Jiis8IkPC4ffLAZak3XnV2HZg17B1qnwMT3MdJCrIyam2ed7JXu/ApSveXzb6NET4FKWw6IXx
	svATTLh+Meufqc/f//tg0nnd3SYugfxx/Pc7l41BW8SbAmhv0fT+8Qcg/g6ogOhom4Wun4RVFY4c4
	RevPEW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW6b-00000003uGY-11pE;
	Fri, 06 Mar 2026 14:24:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW6Z-00000003uGB-0SuA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iP/+KyLFxcqxA5l9rU9MI9S/9G1X3GO+0l1FGXNsyfQ=; b=V98CLCO4f2BlxzFF7j27+NDGzP
	MUHc4RU4Jp2NxDPKV4Jt9hhoyRvN/Rbb2yOJ4xgG/pJes5IaA1WhQA2j4YiL6pIxjBvB0S/JHeS6N
	UX+2NYTNArBvFyhwuaiFUfSZrboOr+yJolcZD6CfsVnqJsNO0kqGRSXAvhaY+h/GRuRY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyW6O-00AUTM-NT; Fri, 06 Mar 2026 15:24:28 +0100
Date: Fri, 6 Mar 2026 15:24:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_062439_171031_EC0ACA7A 
X-CRM114-Status: GOOD (  10.84  )
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

> +static struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
> +	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
> +	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
> +};
> +
>  static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
>  				   struct rpmsg_gpio_packet *msg,
>  				   bool sync)
> @@ -572,6 +711,10 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
>  
>  static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>  	{ .name = "rpmsg-io" },
> +	{
> +		.name   = "rpmsg-io-channel",
> +		.driver_data = (kernel_ulong_t)(uintptr_t)&imx_fixed_up_data
> +	},

Its not clear to me how this gets applied. Don't you need a different
compatible? fsl,rpmsg-gpio-legacy or something?

I would also put it behind a CONFIG_ option, and in a different
module. Nobody needs this code other than your legacy products. You
don't need the bloat for your new devices and other vendors don't need
it.

    Andrew

