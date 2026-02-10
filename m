Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AABEB26F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeAOkTtRwcO+e2SaV7ZKu57U0Jz6k1k1CcRryqfUgcg=; b=oQcWw27kJxx4A6EGqv0BoPnE7k
	u7oN4eioUq9duoxOA2wpFdDwdESZ/vnfxOe93LugEMbInZdbs+IevL27dJGm5l2XQVhgBS/cf4Cix
	ojL4VVViX/vJSj6/ajUsgkRJWQaVncfvqHKQmvb39V1iJwie+G8gveM0KzgRAO4Koy9DvYed/wLG9
	Enxx6P+GZKK7rxlmifyvKlprqu+050ll+BDDeEo66IDWU1ZAagfqvbHccKR81GgcU9mjdFUgfcucz
	bBMa1QCCZE1ImQIrov+TttK3aaw9rqkaGnTUd+eyHO9nmUZVCspjSWtyewKpgcNO4VN9qL1ARpQPo
	Du7sIiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprql-0000000HNKf-1ctY;
	Tue, 10 Feb 2026 17:48:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprqi-0000000HNKE-1YPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xeAOkTtRwcO+e2SaV7ZKu57U0Jz6k1k1CcRryqfUgcg=; b=qNlPD0otkehOoYaEKrGge/jrak
	QhJ1Myw82gCtw3rwilHqO7HwFPMgrDuVbaMpqGraieid4jHrDHaUeF2i/7O9IGC+6t5AL9dVshJwH
	4V7CqdUWghEvACsybzINdoBvcaJ54Nsfh+fDk9ahh2do62/DUDTdHqQDpf/e8xAeMRTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vprqS-006ruL-NJ; Tue, 10 Feb 2026 18:48:16 +0100
Date: Tue, 10 Feb 2026 18:48:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <5158fda4-6bf6-45b8-bbe0-8b469066d0ef@lunn.ch>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210170814.406883-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_094832_434435_45B56F60 
X-CRM114-Status: GOOD (  22.04  )
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

> +#define GPIOS_PER_PORT		32

Maybe this should be from DT, using "ngpios". The Documentation says:

  Optionally, a GPIO controller may have a "ngpios" property. This
  property indicates the number of in-use slots of available slots for
  GPIOs. The typical example is something like this: the hardware
  register is 32 bits wide, but only 18 of the bits have a physical
  counterpart. The driver is generally written so that all 32 bits can
  be used, but the IP block is reused in a lot of designs, some using
  all 32 bits, some using 18 and some using 12. In this case, setting
  "ngpios = <18>;" informs the driver that only the first 18 GPIOs, at
  local offset 0 .. 17, are in use.

Just because your hardware has 32 does not mean every vendor does.

> +struct gpio_rpmsg_head {
> +	u8 id;		/* Message ID Code */
> +	u8 vendor;	/* Vendor ID number */
> +	u8 version;	/* Vendor-specific version number */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;

I still think this should be a clean design from scratch, and you
modify your firmware.

This data structure is 10 bytes. Are these all needed for a generic
GPIO controller? version, type, command and one reserved byte seems
like enough, and it is then 4 bytes, so there is no need for __packed.

> +struct gpio_rpmsg_packet {
> +	struct gpio_rpmsg_head header;
> +	u8 pin_idx;
> +	u8 port_idx;
> +	union {
> +		u8 event;
> +		u8 retcode;
> +		u8 value;
> +	} out;
> +	union {
> +		u8 wakeup;
> +		u8 value;
> +	} in;
> +} __packed __aligned(8);

This then becomes 8 bytes, so there is no need for __packed or
__aligned(8).

I don't want to force this, it is something i think which should be
discussed. Do we adopt your design, which is not so nice, but at least
has one working implementation, or do we do a clean design?

> +static int gpio_send_message(struct rpmsg_gpio_port *port,
> +			     struct gpio_rpmsg_packet *msg,
> +			     bool sync)
> +{
> +	struct gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
> +	if (err) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
> +		return err;
> +	}
> +
> +	if (sync) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (!err) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;
> +		}

I _think_ you need to handle negative values of err. It looks like
do_wait_for_common() can return -ERESTARTSYS;

> +static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct rpmsg_gpio_port *port,
> +						       unsigned int offset,
> +						       u8 cmd)
> +{
> +	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
> +
> +	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
> +	msg->header.id = RPMSG_GPIO_ID;
> +	msg->header.vendor = RPMSG_VENDOR;
> +	msg->header.version = RPMSG_VERSION;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = cmd;
> +	msg->pin_idx = offset;
> +	msg->port_idx = port->idx;

Why is a function called gpio_setup_msg_header() setting things
outside of the header?

> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> +
> +	ret = gpio_send_message(port, msg, true);

If gpio_setup_msg_header() does what it sounds like it should do, what
is setting up the message body before you send the message?

	Andrew

