Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB56FD877B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I4GJ6VYY4sAkpPtIoMg3PlbM8gWrHzgVlQtnkD+cJ8=; b=wk0L8rV0LOm37jTPCRAOlUK7vN
	lFeN1YaD/woLP5tP+PhYkT3/t2nWxZ+XA8hqH8tpi8DbHJGFaOZvdscHwu6FfbEg8sXSNjPgw+Yox
	mePhBjDOgK4SKuYJ5JShPPF2gh2MOTjUkSXvzX2quNaiLt5rDHt3vtTOz2c9xp1rQ327PVepwjOQW
	Q9zVqYcn/Sb+e8N8XKideV5sRIKlmxGi3qNuaq4L075x8YZV9FchPnR9ES1PEv5QOLxr03BAz3bDa
	6NJKV3IhN7WBIxvjV6Jdw2PODA63Uer7A7O/DRKLbvdYGMt27gKuT1NubDJ6WYOpEPIBMwdAZGeNc
	dZzhWK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V9U-00000006X3s-3fQx;
	Tue, 17 Mar 2026 14:12:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V9S-00000006X2X-1DsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8I4GJ6VYY4sAkpPtIoMg3PlbM8gWrHzgVlQtnkD+cJ8=; b=N+dDSJ2HU0OM2CcLn4jv+usPjd
	A9wdkncTUcJn9notW4QhMgME5kzWZfjThVZ2iXhKee3kFdfO9g3pq4hnExXaG/dDDz3gIj3W3JgL4
	wXUtVec4QUwzHQP2wbKIu2ac3PcBp/nHnJnwaIruyb5KuldwzIx57kVDbrjp+jnghfHQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2V98-00C2BR-78; Tue, 17 Mar 2026 15:11:46 +0100
Date: Tue, 17 Mar 2026 15:11:46 +0100
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
Message-ID: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071206_333697_6CCCAD27 
X-CRM114-Status: GOOD (  22.18  )
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

> > +struct rpmsg_gpio_info {
> > +	struct rpmsg_device *rpdev;
> > +	struct rpmsg_gpio_packet *reply_msg;
> > +	struct completion cmd_complete;
> > +	struct mutex lock;
> > +	void **port_store;
> > +};
> 
> Except if I missunderstood Mathieu and Bjorn's request:
> "reuse all the design-work done in the gpio-virtio"
> We should find similar structures here to those defined
> in virtio_gpio.h.
> struct rpmsg_gpio_config {
> 	__le16 ngpio;
> 	__u8 padding[2];
> 	__le32 gpio_names_size;
> };
> 
> /* Virtio GPIO Request / Response */
> struct virtio_gpio_request {
> 	__le16 type;
> 	__le16 gpio;
> 	__le32 value;
> };

The core of the issue is that Shenwei is stone walling any change
which makes it hard to keep the legacy firmware. It is possible to use
these structures, but it makes the extra code Shenwei needs to
translate this protocol to the legacy protocol more difficult. It
might need to keep state, etc. 

Two points...

The firmware implements more than GPIO. There is definitely I2C as
well, the first version of the patch has bits of I2C code. Looking at:

https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/

There is also RTC, and a few other things which don't directly map to
Linux subsystems, but maybe do have Linux drivers?

Give how much pushback there has been on the existing protocol for
GPIO, it would be wise to assume that I2C, and RTC is going to get the
same amount of pushback. If any of these three, GPIO, I2C, or RTC
decide that only a new, clean protocol will be accepted, no legacy
shims, the firmware has to change, breaking compatibility to legacy
protocols, and the accepted shims become pointless Maintenance burden.

Point two is that the customers who are pushing for these drivers to
be added to Mainline probably know that nearly nothing gets into
Mainline without some changes. There is some short term pain to
swapping to Mainline because of these changes, in this case, firmware
upgrades. But in the long run, it is worth the pain to be able to use
Mainline. And those customers who don't want to upgrade the firmware
can keep with the out of tree drives.

So, what are our choices?

1) We accept the code as it is now, with the shim?

2) We keep pushing for the virtio protocol, with the shim?

3) We keep pushing for the virtio protocol, no shim, firmware changes

4) We pause GPIO where it is today, and restart all the arguments with
   the I2C driver. We can come back to the GPIO driver in a few months
   time once we have a better idea how I2C is going. And maybe we also
   need to see the watchdog driver, and argue about its protocol.

I also understand ST has a generic I2C driver nearly ready, if that
gets merged first, that probably kills the NXP I2C protocol, and maybe
the NXP GPIO and RTC protocols.

My vote is for 3. If not 3, then 4.

     Andrew


