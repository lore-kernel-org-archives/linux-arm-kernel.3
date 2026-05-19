Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5282ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWTTnSfqXdKnwvkxIgz1Vius00wgWwYaIbfJKFoluEw=; b=B9NROstlnu1WMb6nFu3qoKHfm/
	uqCZ93tgX7vCgLgX2p3QvLlm/ZGpyIB1FVa7U0T36VYaX9uHCv+BBrILOlmQicjom5K2prY0EXw1o
	kX4fFPBk5a8m5CUKFZ3DfoUfgEG76teG+MZPeLW8BVdtPQcYIPllqVuW6PDLuIdiJ2QjrDLRkiBR6
	exfhR3spqnW34yyrwXLryX8i1o1wb3tqWMXMEcfMR859xxoueEXNDXPnC1KE4VsWrRDm9gE9ybrV6
	2YN35Ihd9ZaNF3FpXfMLM8mNXzxnVGPJNvXR68L0VhnZQKeHw9O5rvjH2vTQc5YEQLGPx+mKpuVF8
	UgG2amGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHYm-00000001458-1Inz;
	Tue, 19 May 2026 10:20:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHYi-00000001445-49e8;
	Tue, 19 May 2026 10:20:22 +0000
Date: Tue, 19 May 2026 12:20:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779186016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWTTnSfqXdKnwvkxIgz1Vius00wgWwYaIbfJKFoluEw=;
	b=mMWJ/VskBn+dCVgGOj/O6xp4COr3uQ7KqJezywuRcQF9yire3SpT6hbuOzqzqr0kyypXix
	6QRCsJZFrS3a3wzd9fTfk5abRZkItzx38U3XToeu4RnZrmhnntBocXhO5CyE1tyPlFv8pm
	p9V3/Zg7xO9tTrwS6ScSVojGu3Mf3CZ6lTL6tzK6XVQWC0BQDUPG3BAt0OcKrGQu7ukSxO
	bF5Iw3SG8qqBAXHy9G7pBJN2GKIcVN9EZFTlQHs/YiODKXFIGSoskV6mVzJS2tTzjEjb4v
	FqEU0m2tk/uxEr1WZzVxORaHxsIoZ+YK7fZ1kXUTUOnTFqquQIoIm5vrbfLJKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779186016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWTTnSfqXdKnwvkxIgz1Vius00wgWwYaIbfJKFoluEw=;
	b=a382yd6UYNBfmPCutP5L0kQcuDHEh9vJkj3DPvLL+Z7Sq+Mw4WTOtX5URKm3ibNcquTcZx
	tHTKS6cqaPU0LHBQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <bv4vwmkkjh23lahkrupwclqs7il4vxqeknalgqn52k3wc6ztsg@z5ukn774brtg>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
 <20260519110041-2d8d92c2-d265-43d1-848f-bf9231a106c8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519110041-2d8d92c2-d265-43d1-848f-bf9231a106c8@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_032021_173842_983D6216 
X-CRM114-Status: GOOD (  26.59  )
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

On Tue, May 19, 2026 at 11:14:28AM +0200, Thomas Weißschuh wrote:
> On Fri, May 08, 2026 at 04:42:45PM +0200, Gregor Herburger wrote:
> > +config NVMEM_RASPBERRYPI_OTP
> > +	tristate "Raspberry Pi OTP support"
> > +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> 
> The '&& !RASPBERRYPI_FIRMWARE' clause looks weird, is it really necessary?

Yes it does looks weird but I think it is necessary. Without this it would be
possible to build RASPBERRYPI_FIRMWARE=m and NVMEM_RASPBERRYPI_OTP=y which
results in linker errors.
> 
> > +	help
> > +	  This driver provides access to the Raspberry Pi OTP memory via the
> > +	  nvmem subsystem. The driver supports the customer OTP as well as the
> > +	  device specific private key OTP (BCM2712 only).
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called raspberrypi-otp.
> 
> While we are here: The empty line here is now missing.

Oh. Thanks will add it again.
> 
> > +++ b/drivers/nvmem/raspberrypi-otp.c
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/overflow.h>
> 
> This looks unused.
> 
> Instead maybe add linux/types.h, linux/align.h
> 
Thanks will drop it and add the suggested headers.

> > +struct rpi_otp_priv {
> > +	struct rpi_firmware *fw;
> > +	struct device *dev;
> 
> This looks unused.
> 
Thansk will remove.

> > +static int rpi_otp_read(void *context, unsigned int offset, void *buf, size_t bytes)
> > +{
> > +	struct rpi_otp_priv *priv = context;
> > +	struct rpi_otp_header *fwbuf;
> > +	u32 count;
> > +	int ret;
> > +
> > +	if (!IS_ALIGNED(offset, 4) || !IS_ALIGNED(bytes, 4))
> > +		return -EINVAL;
> 
> Isn't this already enforced by the nvmem core?

Only for sysfs access through bin_attr_nvmem_read/bin_attr_nvmem_write. But
there is an in-kernel API nvmem_device_read/nvmem_device_write which does not
have alignment checks. So I added the check to be more defensive here.

> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	data = dev_get_platdata(dev);
> > +	if (!data)
> > +		return -ENODEV;
> 
> I would do this before the devm_kzalloc().

Yes will change.

> > +module_platform_driver(raspberry_otp_driver);
> > +
> > +MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
> > +MODULE_DESCRIPTION("Raspberry Pi OTP driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:raspberrypi-otp");
> 
> Instead of the manual module alias here and the implicit matching of the
> platform driver this should use an explicit matching table:
> 
> static const struct platform_device_id foo_id[] = {
> 	{ "raspberrypi-otp" },
> 	{}
> };
> MODULE_DEVICE_TABLE(platform, foo_id);
> 
> static struct platform_driver raspberry_otp_driver = {
> 	...
> 	.id_table = foo_id,
> };
> module_platform_driver(raspberry_otp_driver);
> 

Sounds right will change it.

Regards
Gregor

