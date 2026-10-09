Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4236CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5hYJjC9f5xrA2SeP8FzQjM1WwMyehhp0Rue0U/eEM4=; b=3rVDtIs2pXbmfrqp7nBSQV1X4s
	9GJjZb/9d6I28zkRHYTvHdrTiU4Gyl6AKcrgOrDczS8JOmTxyBkLmc8UCrYqjYCZeAhAnhabYD4ki
	/wvUimszQs6+gZp6pBbKGlE3/SoRQnNceb9aK7Ie9L9Vr6de4C2+cCZq0TAO79bNKJZGYOgnU4qUC
	FHjqBWnLt4KrDwyNIlb/tkyp1KXTkcDWddyW9GQxiIq0bhkzLnrvh4UjQi0+RTVC6WAxmWqpC0JzN
	WsbmOTTUU82L/azEwXzuU4S7C2HTYUqVDNCWikj120cIuS45UZN/2QscBvTJEE8MQtNArGHK/a+GP
	BIApJFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzhh-00000005Fbe-19Ou;
	Fri, 09 Oct 2026 01:47:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzhc-00000005Faq-3BLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 01:47:18 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso2056951b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510436; x=1792115236; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5hYJjC9f5xrA2SeP8FzQjM1WwMyehhp0Rue0U/eEM4=;
        b=b0RtB4vdjRsHMAZoQYIi3qRf2ZW3op+EhqvGm8cOjX3Gm+BDHRqGKu9cywCBiA3cHv
         JKDrDb3lR0heqgNqh8KDNnFgH/f0j0PkjIPMe1UYHGRykhHeZRTEBCJ1vi8wCxeIrjyj
         QlH1jOzV5EQbSyuu+SW3hD8hVstavdfN74f2/2+/uk5axzQ0HDJujBRdHG7xZmUiz+gi
         uB0SjsfCIay+ywkvgVvBgRzPIR96FuQsBdmQ6ig4kljT74n8wdZgItLW+fjyUAPX2D9z
         XBHEJMx4MW+jtVPfKcQqcBt69exVe7il1PrTiNVoDYnw+xV63czKI/XJbAAVRhTXK9+V
         s63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510436; x=1792115236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5hYJjC9f5xrA2SeP8FzQjM1WwMyehhp0Rue0U/eEM4=;
        b=dV9vT3hG6IPMU2YGFMItk4hh2+W2f+8pGh743p9AyM2kG5YxFbRqudldgja6NSCdjC
         EF99GtmQOplDabsXsQvXuGO1gfw1dP7whiN6JGOYzknMifLXcgQK21c+byngM9ltFInT
         Muwbnv7/Kzbhnov05CEzClWxD4LJUpEUNeuZ6GqlWDjAqFhad/kuIBXEZOBUSULXSjGV
         xFBBvNjSjbWB6LYYNUjSbaMY/9ySgdSTqkDFfaFZ3hlwwQ/4A+UMA1rIMsV9ZZZMaCps
         5WcURVDYh5IJFcw+KmXKR6ugPrWWQxZ4IG/aXFCeW2lmbKgj4jFxE5RUKJSY9SUgDbHs
         51nw==
X-Forwarded-Encrypted: i=1; AKwUvBzjb34/bFPLSJa4DjIfMisPu3xb8PFqI4UR56TtZQDH3RORy+yK5RHat+5vPWY8VT2MELl1Y7ZWyyf5dZMfLpra@lists.infradead.org
X-Gm-Message-State: AFq9FYIqM0fqEMFn1Q+DXmmSe6XBztvFiA4S3Fs+so8EiGVrYRkN5/z7
	rVvUxotCUNeKdlOWitqLOs3Z5ugDhRnDebcLRYF6d9qlYSAFSQbS35fb
X-Gm-Gg: AYBFou2OblY2phNar9FKITW1w/UP2HbglLfmXAZ+eCN0XPvSgJNJaWQ+7nzhHanXGJt
	15nq1D1EVq8MBQmqXj/hFEIPR7yeb+lqpEpUvGKwZzSXndWOHn0MYAie2SQeraXjz1iDmszmDsG
	EockfmvmLXRF4/xV3OZcTzeT1CrtUVs5upcDxM9gFB+Rz6XP4tcE4cM39tbI5wvHuZhYEkH2iVj
	ZkBQV7D15rDgAsRPzsoyPj8OWs5EJxEV2anVJy8crfhjal1vYUo0wvB0mW7p7yMdXZSrvDKI9AE
	DzafiTm2Do0of8DiS23pkEAyIVuhNBs9gJ+fR8kaYEwekTpr6FsK8S0VUcsHcmk1wXMWMSAWKM6
	AtnVuZf4eAL7OP4WuZb+ta7LD3uIWQIo0qOg/1zEB2MfqNhecENMFI4s5sx0Sw9RQHXbcel8BJL
	hL+Q2cFmnvABijhAJ8U6gW93jYXdIP3REOE4s0pFhc96aebkMp5vuxYfiihWc1FbaImF+1r8qCk
	o0wKvc=
X-Received: by 2002:a05:6a00:1f06:b0:881:d48e:7138 with SMTP id d2e1a72fcca58-897c43df755mr329124b3a.4.1791510435663;
        Thu, 08 Oct 2026 18:47:15 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6bf8sm260611b3a.34.2026.10.08.18.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:47:15 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri,  9 Oct 2026 09:47:08 +0800
Message-ID: <20261009014709.362001-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008153620.238580-1-jerrysteve1101@gmail.com>
References: <20261008153620.238580-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_184716_831898_BA8B7B6E 
X-CRM114-Status: GOOD (  17.95  )
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

> The RK356x UART nodes define a dmas property but omit the matching
> dma-names property, so the 8250 driver fails to request a DMA channel
> and falls back to PIO, logging:
> 
>   of_dma_request_slave_channel: dma-names property of node
>   '/serial@fe650000' missing or empty
> 
> Add the missing dma-names = "tx", "rx" to uart0 through uart9,
> matching other Rockchip SoCs such as the RK3308.
> 

I realize that Fixes: tags should have been added for the dtsi-related fixes. 
Apologies for the omission — I will include them in a v2.

> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd39..098493c04ecc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -443,6 +443,7 @@ uart0: serial@fdd50000 {
>  		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 0>, <&dmac0 1>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1449,6 +1450,7 @@ uart1: serial@fe650000 {
>  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 2>, <&dmac0 3>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart1m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1463,6 +1465,7 @@ uart2: serial@fe660000 {
>  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 4>, <&dmac0 5>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart2m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1477,6 +1480,7 @@ uart3: serial@fe670000 {
>  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 6>, <&dmac0 7>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart3m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1491,6 +1495,7 @@ uart4: serial@fe680000 {
>  		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 8>, <&dmac0 9>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart4m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1505,6 +1510,7 @@ uart5: serial@fe690000 {
>  		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 10>, <&dmac0 11>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart5m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1519,6 +1525,7 @@ uart6: serial@fe6a0000 {
>  		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 12>, <&dmac0 13>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart6m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1533,6 +1540,7 @@ uart7: serial@fe6b0000 {
>  		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 14>, <&dmac0 15>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart7m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1547,6 +1555,7 @@ uart8: serial@fe6c0000 {
>  		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 16>, <&dmac0 17>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart8m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1561,6 +1570,7 @@ uart9: serial@fe6d0000 {
>  		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 18>, <&dmac0 19>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart9m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> -- 
> 2.56.0


