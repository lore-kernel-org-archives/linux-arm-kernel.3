Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB1C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID0yyjs86uvWzjzpkXQAyqsj+E11ye93NtAKSRfhkjc=; b=Nl0ZxyJg/lmiVy4OKMO9bbjpfA
	nUDrwJBvux63eVi0GBr+ukQo/7Yg1IS1vFSpR4GZiuoYNGRSX4QfQofyfUcJSot2TLQfUqwUQQMbe
	XBSZu1pUgWTimpNaQhFwnfU+QYDPBY74ox83muPwf5184oPpdaZk2NOPCasGxyI9kbv8hBUeLM2nM
	ycuRIP1albHDENeAkUOlDrLHs9YIIV4Yu3KPrx4BnnFKgF4ZSSocY5t0twO2cmISKShpWYR7EPdVr
	ljUAj2Hwr5OjQ+IlbnpMJrxSI1yZtrOeMAfq8CwIYEbzB7vAr9v9ScaF7PPtxrP1P+Ij+lr9LAc/P
	US993q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KRa-0000000CdKY-0K4n;
	Thu, 17 Sep 2026 22:19:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KRY-0000000CdKP-1cy2;
	Thu, 17 Sep 2026 22:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9FF600AA;
	Thu, 17 Sep 2026 22:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8891F000FF;
	Thu, 17 Sep 2026 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683539;
	bh=ID0yyjs86uvWzjzpkXQAyqsj+E11ye93NtAKSRfhkjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVVHO9Hw1kTiBcefgMiGB+m9wBlu3SPKUKP4+vaWxfsfXBnK9asXgEspqpWOBw/LV
	 7c7Kxzh58w5eQkaVg8/Rjt5AmakFIBZVq650Qio+IRVcuj4+bu6rpMv2lr5Jj+Bxw4
	 WL0eVk5oBtjLHUZ/8ShMyrmTrbjQu/Yc8fyut9f/g/AaviXxMJnCAUBgdOIU5bAVbO
	 VsRl97IVrQapzsxS2cq1WO/yz9Ls8TM714nB5gKShVs+WpUS21DQIVGVBRrLOpWZ3T
	 NSiX2hG2VEkpTKtQJLNAeVHvb2mjSgL5JDnE3+UVz4oZ1w1ydeeayHV9RXX3seJXFi
	 05tQcqStFmw+Q==
Date: Thu, 17 Sep 2026 17:18:57 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Message-ID: <20260917221857.GA4056431-robh@kernel.org>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
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

On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> On Wed, Sep 2, 2026 at 5:08 PM Alexey Charkov <alchark@flipper.net> wrote:
> >
> > Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> > memory, and Rockchip bootloaders use it to give boards which have no
> > dedicated storage for a MAC address a stable one anyway: they hash the CPU
> > ID and patch the resulting addresses into the device tree they hand over.
> >
> > Kernels started without that fixup, e.g. straight from the SPL in Falcon
> > mode or by any other loader which does not implement Rockchip's derivation,
> > fall back to random MAC addresses which change on every boot.
> >
> > Formalize the derivation in the DT binding and add a Linux kernel driver
> > implementing it, so that a Linux image can use the same stable addresses
> > regardless of the boot flow.
> >
> > Only RK3576 is wired up here, that being the SoC I can test on. Other
> > Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> > than 0xa on RK3588, for instance - which makes supporting them a two-line
> > addition to the driver's match table plus the layout node.
> >
> > Patch 1 is a prerequisite fix. The OTP hardware has its own internal state
> > machine which only works correctly with serial access, but the current
> > driver serializes nothing, which results in timeouts and/or corrupted
> > reads (e.g. returning splicing a TSADC trim value into the buffer of a
> > caller asking for the CPU ID, or mixing up trim values of different TSADC
> > callers). Hence the Fixes: tag and Cc: stable.
> >
> > Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
> > U-Boot match the ones derived by the new driver, and the driver correctly
> > assigns them to the network interfaces when the kernel is booted without
> > U-Boot proper at all (via Falcon mode).
> >
> > Sashiko also rightly pointed out a use-after-free in the nvmem core when
> > a layout driver is unloaded leaving its sysfs nodes and the postprocessor
> > function pointer dangling. This is fixed separately in [1].
> >
> > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebeb518@flipper.net/
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> > Changes in v2:
> > - Switched from a scope-based guard to explicit lock/unlock calls in the
> >   OTP driver to avoid mixing styles in a function using goto error
> >   handling (Sashiko)
> > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net
> >
> > ---
> > Alexey Charkov (4):
> >       nvmem: rockchip-otp: Serialize reads
> 
> Incidentally, patch 1 of this series also fixes CPU thermal throttling
> on my RK3576 device: apparently, the mis-read OTP-programmed thermal
> trim values broke the thermal governor logic, which now works
> correctly with properly serialized OTP reads. So it would be great to
> have these merged.

It would be great to have the sashiko comments analyzed and replied to 
as well if you would like this to be reviewed.

Rob

