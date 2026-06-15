Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83C0CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2otcKXkniiTUp+5VDPJ4fsoaaEOLI8QZLmJsjDf69Y=; b=OqN5QqfJtYNkKofaOBntUNVA0i
	LM2q46inR8legCaxeP3xrVhik3CTlj2W8u0F7iyCSVqLmw9aTnnKfg3otGtgFjJ94dQKy8R2Iymdh
	lZu0GTSwnlgvYE3z4Lq7S7TiQAJv2oJDwbJFlThSZ6R3siz2jnjPVsO8+RNQ5+QPgAZ2WL7aTUpVZ
	osrhh0X6sDWrBneMx+2GJmzexKA9itK/nmM9DHCGTh/ZnW0Z53bNYfw+2HmtYvA6YfnSpCPNaydBw
	sABKyAFnW7BgVUqFUf1qcscCf2fPw+d6clTB8h4Pv0o8XHOKajl9NIg3MT2rdevrNv+k96XiRX8UW
	/oYFiPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCNK-0000000Ek4i-1ZN5;
	Mon, 15 Jun 2026 18:49:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCNJ-0000000Ek4c-1s7v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:49:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C60E24407A;
	Mon, 15 Jun 2026 18:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8918C1F000E9;
	Mon, 15 Jun 2026 18:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781549372;
	bh=f2otcKXkniiTUp+5VDPJ4fsoaaEOLI8QZLmJsjDf69Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l513tM/bCEM2Tf1QvNXpkj3A38IB27Wahc8y6yfI20PkKouMUKFPAKku0Oe5l8PBJ
	 3Zw4u8r4LYVoEiGoecclxDStWyNSo+B+MREw1zJyd+2iWBsUmKkLweN9srUDqIxaBP
	 pvpQeoNgdggDFzee/qClUCPY9ZvT4ZlZD9o6IRsofqhWE3WpV24KQ1jIKdkI5ZdEWh
	 sjRcrQKgcUHKJSeIUfb/vUZN7sBS3HRXaQBuNpcmfdIZFGHRT/OgYU04pD+3UZMgyL
	 DMjmR3IQqlBRuZM3FLqOIk8SdrSNV2N46wXH3F7BBybdQ81WlMPhBE46mLEM+Ffk7T
	 TFmps+X/rBlwQ==
Date: Mon, 15 Jun 2026 13:49:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Eric Chanudet <echanude@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Alberto Ruiz <aruizrui@redhat.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Chester Lin <chester62515@gmail.com>, imx@lists.linux.dev,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
Message-ID: <178154936898.1633409.13595893947195422422.robh@kernel.org>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260610132116.1998140-5-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610132116.1998140-5-khristineandreea.barbulescu@oss.nxp.com>
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


On Wed, 10 Jun 2026 15:21:14 +0200, Khristine Andreea Barbulescu wrote:
> Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
> external interrupt resources present in the same SIUL2 hardware block.
> 
> Besides the MSCR and IMCR registers used for pin multiplexing and pad
> configuration, SIUL2 also contains PGPDO and PGPDI registers
> for GPIO data and EIRQ registers for external interrupt control.
> 
> Add GPIO controller properties because the SIUL2 block also provides
> GPIO functionality, and gpio-ranges are needed to describe the
> mapping between GPIO lines and pin controller pins.
> 
> Document the interrupt controller properties. The SIUL2 block
> contains EIRQ hardware as part of the same register space. IRQ support
> itself will be added in a follow-up patch series.
> 
> Update the example accordingly to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 90 +++++++++++++++++--
>  1 file changed, 84 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


