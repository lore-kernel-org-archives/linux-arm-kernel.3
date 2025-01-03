Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5AFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk5OfUp4nq9jPTHgRhodPOJ8An3iKciRIvsqeJafsWM=; b=3q3LVpONRsaIIamqXE2Rkd/zIm
	2H1sYhyvMwcRXTYw2roqGb2yY/MXtrjnhAs1hbj/Al6btfgakS0mzpho5IGSyJtawrWoOxsSDPxVU
	+Cy2ot1kekAdQhoI8gjK7Li5d9wuoIa8xlvMehy8ygIIMbXvkG7jM09793lgywxZc3wSbMbJeSZQ6
	9N1SdprD57nvRpCKYJ5Z/j/SQRz+yp0mr3euPe4BJqcbUmKKVG4E49lbSX0CIYBxlTilv28TvaTpZ
	WAbYxJ4ov431bZMLMS95uqy+nGT9WY1RTudBhU9x6waulM8GkmaRZVy0juPAV5S2XdY3GiivJtZ9W
	tJD+VeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjsb-0000000DKZx-1jIS;
	Fri, 03 Jan 2025 15:46:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjrN-0000000DKSK-1yLh;
	Fri, 03 Jan 2025 15:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CC045C6455;
	Fri,  3 Jan 2025 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A3BC4CECE;
	Fri,  3 Jan 2025 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735919112;
	bh=VQvwlx9UUTXPUEsMouncgQlEcDzlv0ade2867PWS5n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeRdBjNtjVXdu/4GrC0Zpw2WMUwcXkJT9AJZwByFO1sXFrGX3hRrw9/ob1BAQXQn9
	 jJ2t0FRcHvXTCmIP6WhGsqUbA3VcW1yMCphPiIqb9S9jEAgBGrROQQSKCvPmQs/Syh
	 GSSi1vrW0K1t6x+zYEcCzrwzF0/aI7JVcDB6nD05opYnmL9ao0DD9ABe0bpBgkSfct
	 5jZspINygLCpiD6mVnBur8vkBHpOwoOXp6dHR8zj6LYCRT31djA8gy1kRCAsmlxnro
	 l/+KYcabuZGtqEyingjwYPkRluDS+Ksz5zLO4KKaBoOvcngk3JPFXBm36zo22hgGlQ
	 NvNqLXDNLUTQA==
Date: Fri, 3 Jan 2025 16:45:06 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <Z3gGAgYAZeU2ZPok@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <Z3fzad51PIxccDGX@ryzen>
 <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
 <Z3f4JQZ6yYV1BJ-b@ryzen>
 <CANAwSgRTcHuDNLvPJAs7ZaV-NnepeOkHj_kVc5OAJtP03hd6pQ@mail.gmail.com>
 <Z3f95RXj7GhZZHEP@ryzen>
 <CANAwSgQEb7rWFaeEO3Mb8LAwK6A5mrCyQFEysmSpeVdhoRWrtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgQEb7rWFaeEO3Mb8LAwK6A5mrCyQFEysmSpeVdhoRWrtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_074513_599010_4BF2C4F8 
X-CRM114-Status: GOOD (  24.06  )
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

On Fri, Jan 03, 2025 at 08:59:51PM +0530, Anand Moon wrote:
> Hi Niklas
> 
> On Fri, 3 Jan 2025 at 20:40, Niklas Cassel <cassel@kernel.org> wrote:
> >
> > On Fri, Jan 03, 2025 at 08:36:18PM +0530, Anand Moon wrote:
> > > > >
> > > > > We need to enable the GMAC PHY and reset it using the proper GPIO pin
> > > > > (PCIE_PERST_L).
> > > > > Please refer to the schematic for more details.
> > > >
> > > > The PERST# GPIO is already asserted + deasserted from the PCIe Root Complex
> > > > (host) driver:
> > > > https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L191-L206
> > > >
> > > > which will cause the endpoint device (a RTL8125 NIC in this case)
> > > > to be reset during bootup.
> > > >
> > > Thanks for letting me know. It seems like a workaround.
> > > I'll try to disable this and test it again.
> > >
> > > My point is that we haven't enabled the GMAC PHY (device nodes)
> > > and must properly reset the GMAC.
> > >
> > > We're relying on the code above hack to do that job.
> >
> > I do not think it is a hack.
> >
> > If you look in most PCIe controller drivers, they toggle PERST before
> > enumerating the bus:
> > $ git grep gpiod_set_value drivers/pci/controller/
> >
> 
> Ok, understood. However, we have multiple reset lines per controller,
> so the PCIe driver will reset these lines using gpiod_set_value.
> 
> PCIE30X4_PERSTn_M1_L
> PCIE30x1_0_PERSTn_M1_L
> PCIE_PERST_L

If you look in Documentation/devicetree/bindings/pci/pci.txt

You will see:
"""
- reset-gpios:
   If present this property specifies PERST# GPIO. Host drivers can parse the
   GPIO and apply fundamental reset to endpoints.
"""

For rock5b, reset-gpios/PERST# pins are defined in:
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts

$ git grep -p reset-gpio arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts=&pcie2x1l0 {
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts:        reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts=&pcie2x1l2 {
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts:        reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts=&pcie3x4 {
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts:        reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;

So I think there is just one reset line per controller.


Kind regards,
Niklas

