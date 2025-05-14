Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84FFC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gHVbEGXZVtjPiVkVCkcCuVN57D4fP/atcqdnyaqM2Q=; b=G2n3+ojdI819xo8PLm8Y17B8Iy
	MSXZYTOM4KGPXpq8bEv0ZegwPebdbUHjBP0KyEejK4hASVjR5avhpELF0CdcWQY3PUwSGRSJX7a84
	5H3pk+V/pJ4l4WH/KExNuUkKwsxoBx33fyr26nnV6HkcbnhEWH+6TSkbASXZYy5zQ5Q2Lh4m1tIuS
	xgkTD6un+NdPhaqErD9sVExS7H8TeY6QgWGbwCdpa5x025E7Isf8bfytPORYRtdyMUg8DbcSNJn6/
	PPpEkIc+07IFl0Z6XwmxnxQcZpYb0B6+tCIU3B50RG6q8XakHXeRW2FTJQS0GVnFwbY4dkZWpPTWN
	qojM9etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDef-0000000FVPw-0AwP;
	Wed, 14 May 2025 15:04:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBsS-0000000FARw-4BT1;
	Wed, 14 May 2025 13:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4gHVbEGXZVtjPiVkVCkcCuVN57D4fP/atcqdnyaqM2Q=; b=J0LVn7GX0m1bWUIrPTdFYscy6y
	fHz0Xf70YyyzkaH1LRFqVIyqA3AOBzyeLJc7/oJAIoNByMRmDgIaITVsakVP4ZQm94SjrD1LT701f
	+LS6ueMM+06Zdkw4w5Doi9bSyv5SzmcsH38lMhtTxuOQ47jxAk8Oim0htIq3w2p6i51Co8RSytef7
	xi+mgnH6+JsAl/C+9b0uPT/3y58VVarD9p511dpgSX4j3BZT/bcYPG52O0VLP2yMP8frKTgZxIDjg
	gx3+ulWzTfhKNgrliIe6CA45ZKus9dCC1tvk/raOJtcdGFhXEF02Gi2EM5MbgsgL31UGX1NIpGBfG
	qOUpEY9A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFBsP-0000000HAZb-49WZ;
	Wed, 14 May 2025 13:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3D56439CA;
	Wed, 14 May 2025 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4698CC4CEED;
	Wed, 14 May 2025 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228224;
	bh=YSHixMfBQIo2tsjE+RpfvwcFjHExWTXe3JSwBkN0y4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQY79gmHrxHRzHRhbVSBxQuv2MeZQvOdiwhA8wR0F3LXhBMnynNTPK2FM+JI4V3hr
	 hHpdlDw8v/KzzwpiRPwKoLyRSPLNi1pBkS1S3ZSxgkbuJOHym2N4xp/LWsCwRKgbO1
	 kRVlDYQXUj3wXNUsIvEceZfuTb78sbFxuypS8LB3h1o6DgB9VvxOBcREbSQZtO/5E3
	 zKfQSybkNvfLgjedVEOI3qdP8XEZfNgFEvZYiMaWufJgQ6ORK4WuXbyoV0yf0ehQlR
	 7EjHltYo4aem46Q+6rz3FUXpE4fEWbZrNu6S1TGtJZfHWdMrNSHDNbS7TI4MeXL++L
	 rlBxpyhdR7aig==
Date: Wed, 14 May 2025 08:10:22 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dts: arm64: amlogic: add S7 pinctrl node
Message-ID: <20250514131022.GA1833633-robh@kernel.org>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
 <20250514-s6-s7-pinctrl-v1-6-39d368cad250@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-s6-s7-pinctrl-v1-6-39d368cad250@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_141026_330248_2E472703 
X-CRM114-Status: GOOD (  14.61  )
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

On Wed, May 14, 2025 at 03:01:33PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic S7.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 81 +++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> index f0c172681bd1..924f10aff269 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>  
>  / {
>  	cpus {
> @@ -94,6 +95,86 @@ uart_b: serial@7a000 {
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> +
> +			periphs_pinctrl: pinctrl {

If you have non-boolean ranges, then this should have a unit address 
(@4000).

> +				compatible = "amlogic,pinctrl-s7";
> +				#address-cells = <2>;
> +				#size-cells = <2>;

Doesn't look like you need 64-bits of address and size. 1 cell is 
enough.

> +				ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;


