Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAE2C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SOTXCJZc1IC8VPVoYvX7V1/MLXap7rcbZBvDGjde/o=; b=Y2qkq7xrs8rLF0tskw/qdmDfFl
	clvqDAUbd0mctH0ByK2buvs/mfvVFEMawl+VJc23TDLrJShiGwtd9dGwJZNdS9AjW60rGzJdsi6m7
	LK4Q877JllpJ7HDUIac6W0W0vKa7WGp3cVJSRdAXyGaPQWITQHFWEu7xLZ0yxdlsv6DX1ZsVSfiKV
	5L1LkKBj1C8CLbn5ygeuRIU2ElGP3l2udKFEiZM8jFbkl5hdGkCvu91jKQLNUBveIHxYwo90SbGmM
	fQCgwRA14Jt3mokzXAS+qfhFHPDB7qTmIHXbNkRLH8v0JjYSzYylv1ZLdZs/Q8Id79fuu8szbOlno
	EtEYI24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScMB-0000000FoFY-2IrF;
	Fri, 20 Jun 2025 14:04:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScD7-0000000Fmyf-0uXj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 13:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/SOTXCJZc1IC8VPVoYvX7V1/MLXap7rcbZBvDGjde/o=; b=STEio21Hv0v/SDqqhiyZ3lCRGd
	RZs+u82GEYZmmobtHmoRA2sko8xuwmwutg9xVOmv/hR3BK1DvNjlZ0F/2sKeB1nRfmKe/rQZGOsYi
	IWgKtJCPFpqdhwck4mqhxLVYgr4p5bqRFWfcfgHfoYVCaCNexwBJ4NM2d09lVFG2MjnC1bK9da+Iq
	MXA4G3j2qGDZpfSKLjEfNIkEQqsegIqgczczaE0rGTgEUIhnWsLOHuLilCFCEV/I9EED2+GuiAubD
	deUwOi71OiwgwKL7OZT32QT0bOxq0ZJplzwQFDr7VyshiFTlz0oWTcoyTmS35CXTsDV3tF1Qz2ylZ
	qSscwv6g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScD4-00000004l8Y-2lou
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:55:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0A516F2;
	Fri, 20 Jun 2025 06:54:53 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FCF33F58B;
	Fri, 20 Jun 2025 06:55:11 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:55:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Message-ID: <20250620145508.4d483885@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-5-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-5-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_145515_048961_4663AE63 
X-CRM114-Status: GOOD (  16.12  )
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

On Fri, 20 Jun 2025 01:30:06 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> UART1 is normally used to connect to the Bluetooth side of a Broadcom
> WiFi+BT combo chip. The connection uses 4 pins.
> 
> Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
> RTS/CTS pins.

Interestingly there is only one possible set of pins for UART1, so the
naming is correct. Which would also mean we can insert the pinctrl-0
property in the UART DT node in the .dtsi file already.
Regardless, checked against the manual:

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 30613a0b1124..6f62201fd739 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
>  				allwinner,pinmux = <2>;
>  				function = "uart0";
>  			};
> +
> +			/omit-if-no-ref/
> +			uart1_pins: uart1-pins {
> +				pins = "PG6", "PG7";
> +				function = "uart1";
> +				allwinner,pinmux = <2>;
> +			};
> +
> +			/omit-if-no-ref/
> +			uart1_rts_cts_pins: uart1-rts-cts-pins {
> +				pins = "PG8", "PG9";
> +				function = "uart1";
> +				allwinner,pinmux = <2>;
> +			};
>  		};
>  
>  		ccu: clock-controller@2001000 {


