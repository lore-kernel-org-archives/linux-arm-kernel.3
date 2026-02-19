Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA4E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m71zW88H7K19uDqB/mJVa6SLvXopmaXhdyjRMA5F7Ug=; b=TQXBxxc0fb9jEFbRR9ph7HvEdR
	pT5iEhMfqB1XGbGQ+lwhPXSfI08rVtmkpGXIulAgS0xY466CgYtJKuHCctGBL+VfkvpI0fFhlT0Y6
	Z3xd9avUIWiEsmEy6hK1+8ndD9YISPcgkZkTDA9dxp6r6v90mLzk+XsXUx+ZT3LMnPSVYBhW7jSmj
	kPH6YQFzeCJA12BidgsiYYmOYJKkUl1T6qRRA27yxNKcTQMcu9zwatEyKdC+fbgCYyySrueHOs+KU
	MzgjD2TFcMp8YbOXiHAZusC3sAztHF+Ey0RpZfIIkAYMok1Vi4Xy3wOUz7wB1HodYbyha6CtCwmch
	9fbPpQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4Ic-0000000BPfa-27Uw;
	Thu, 19 Feb 2026 13:42:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4Ia-0000000BPeh-3Ga8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m71zW88H7K19uDqB/mJVa6SLvXopmaXhdyjRMA5F7Ug=; b=ZQ+CO1CuHmS7qG0gJgND/e2zBA
	/ubCjr4WIUdnz0YjIla8GiDmOEPHMbPXJFH2bv/HTmr4xfkGKBqUFqcA4c3jySyxFZM4s03A0s2GQ
	9g8b2lZ2UOhZudKslVqwCiLVlV81XNuoZ5oZ6RPNggjSHFkeqIASVLsOy26sY9Zax3Ec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt4IR-007v3K-BB; Thu, 19 Feb 2026 14:42:23 +0100
Date: Thu, 19 Feb 2026 14:42:23 +0100
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
Message-ID: <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_054232_819165_0B8563EE 
X-CRM114-Status: GOOD (  13.66  )
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

> > +	u8 id;		/* Message ID Code */
> > +	u8 vendor;	/* Vendor ID number */
> 
> Does this fields above are mandatory, seems that it is just some constant
> values that are useless.
> 
> > +	u8 version;	/* Vendor-specific version number */
> 
> Why it is vendor specific? the version should represent the rpmsg-tty
> protocol version.
> 
> > +	u8 type;	/* Message type */
> > +	u8 cmd;		/* Command code */
> > +	u8 reserved[5];
> 
> What is the purpose of this reserved field?

They have an implementation of the other end running on there systems,
and it sounds like it is widely deployed, and they are trying to keep
backwards compatibility. The protocol also implements more than
GPIO. There is also I2C, maybe watchdog, i don't remember, but early
versions of this patchset had a list. Some of these fields are used
for some of these other devices.

I've been arguing it should be a clean design, with the protocol
focusing on GPIO. And that the rpmsg channel makes it clear this is a
GPIO device, the protocol itself does not need to include fields to
differentiate between GPIO, I2C etc.

When they start submitting I2C over rpmsg, i expect the same sort of
discussion will start again, so the likelihood of keeping backwards
compatible with there firmware seems low to me.

	   Andrew

