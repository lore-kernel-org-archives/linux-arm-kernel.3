Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzGgZImo0EBsLEHlMR5wSNL1BxVaGZmB0ngBJ00VQ1k=; b=zYn3OGDXc2PmhTh0lfIVrNBNqN
	YbZ+9BWal3vXFR0iJiqyiNF2CVZxC9mZLX7gYK85n2/MdyxRKgoEG/6kdVEHMvVgHJ5jhyxbHZ67f
	9X2BaoqqgtfFVVKeLMlnW8AN3Tx15SaGrvGYfKrOBXNwwgT1SNnpWhUGLtu7i0bLq4Wsp8VUgyFgf
	5goZOe1XH4+tfHbh8qzj4L/ewpvJV9I9oF1BnlTxTofdmCSgx7xz0f9TAG20Crt8B9K98isJrrL27
	j47mVidFuRlgU/7wbkUHcfsViWGzLKzOI9d4JFwmF+aqzLz0q4CDa0IGsB/Cwzs55wNO7FScWyFXU
	2CURgi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WG4-000000062si-1O8Z;
	Thu, 16 Oct 2025 22:15:40 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WG1-000000062sI-1pPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 22:15:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 8715A13806A9;
	Thu, 16 Oct 2025 18:15:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 16 Oct 2025 18:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760652936; x=1760660136; bh=vzGgZImo0E
	BsLEHlMR5wSNL1BxVaGZmB0ngBJ00VQ1k=; b=NjE4FnF6Z+Hv6BZwdj5D3rMGXY
	kWOPybw+UtFAjB9c+eY7rb2ymabUocvJVuGzPJrtzsODKO4/HSLcTuiGXvyUuQjS
	ktcTx5bCIwNyzBcXJsGwkxJsoGyET/iATGKYpLfRT1wCs/3CR++i8KafKSzJz3ua
	Wp2s5Rww3P5DN0G2cbv7QM2lGcno5Jm4tDmiTPWwqE1LdWsUcF40UH3DnHCjwMMV
	K5N4+kgBBgDTYI+7wM3ykOUKvGq8cNIqiLWH11ieN72wz8p6tIzgyLAvQweH2fTs
	u9AuS7cx+Pmw+t5ds3l9vK7n0xBvwpBf5F6mCu4WRneYHvzutFzPT1kVcDZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760652936; x=1760660136; bh=vzGgZImo0EBsLEHlMR5wSNL1BxVaGZmB0ng
	BJ00VQ1k=; b=iVkCqK+haRPM1XGAf9do5aP3G/azCfSHzaj9S/42bCPv7p8sjjf
	WS7FueNNN9173kz4jxwbeQxtxZwl7De+/wQxC6m8ah9Aat6sw6WHkL0YWcQ/Uydk
	lK02Cjpk/vc+jBI7upCVTsNmgHiADk7Xnu64LbRQ0ARY627QsiHpw6IobiQ/4Uk/
	PU0Z3g7y8AP8zZDLgY4HzZC8JJuNgWnxK72YcpnoW8OIPWQyud+yEhaHyjeYbl6d
	Xm2VxMUUhcaNwsgjh2dA2eMEInMDhl2mfhTY62vyepdV+5ylSPN70J1JPCaI84IO
	lzPADqq0+HHWwYpvUI0eQaQGefi2BRocMaQ==
X-ME-Sender: <xms:h27xaO9hR8CnI5TlTSslFVdAFlYJUxDxyYpGe4Q_e_CpTvd-Xjk6fA>
    <xme:h27xaJt9kfzu3S0nw2iqxy2qI3R0WZHVMEnRxTIv_sBaW9HjVS3-8dY2NgzDoQRvR
    QtcGPI08-oHEO_e5EXA9K4cZKhGUMMhn23Vp9XnzQx2iFzM5njLu-Lz>
X-ME-Received: <xmr:h27xaKoPeERNhYMtLsQmy-_PRH1pR97SDMmmw8-CcRKpjcS7d9hjzJ712dQIvaHrXdHUPAhlKFk0FVfq-G0eU_akpwn4PsWMsko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdejgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjtggrlhhlihhgvghrohhsleelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    hvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhii
    figvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtth
    hopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigr
    nhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
X-ME-Proxy: <xmx:h27xaEF5MuFHmTOswE20zS1DghicGhpJzvr-WZF2xSVo48mqFrHCyQ>
    <xmx:h27xaN4sS7Hf5pDh77-7GpLz4KLRjnIVNMp2-Hh1INGmHhc6riFpIQ>
    <xmx:h27xaHC9m0AYL11J9g3pdSkEZnHkr2B0qD-AIU8m6TJN91gOCCmUug>
    <xmx:h27xaASVDFrl1YkzVv8b0ObLblA729vPJGVg-tiGI7bTdwRFidUQgg>
    <xmx:iG7xaIUxPFkI7OSu-dTCWzyMp2QC4_G9BQnVqwQx5uWgx_MQtG4hHeRE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 18:15:34 -0400 (EDT)
Date: Fri, 17 Oct 2025 00:15:33 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 00/13] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20251016221533.GD897177@robin.jannau.net>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_151537_564170_562907EA 
X-CRM114-Status: GOOD (  23.23  )
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

On Tue, Oct 07, 2025 at 09:16:41PM +1000, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.

The split of the hwmon dts changes looks weird to me. It's not a lot of
changes so squashing everything together into a single commit might be
ok. If you want to split the commits splitting them by SoC (t8103,
t8112, t600x, ...) and adding common sensor defines as needed might work
better.

> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add an input subdevice to handle them.

The cover letter doesn't mention a merge strategy for this series. I
don't think there are any dependencies between different parts. That
means the dt-bindings and driver additions can be merged through their
subsystem trees. The single line patches wiring the devices up to the
macsmc mfd driver should be merged together through mfd tree as they
(trivially) conflict. The dts changes will be merged through the apple
soc tree.

Janne


