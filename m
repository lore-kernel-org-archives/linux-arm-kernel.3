Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F087C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=; b=FRQrLdHJ5+b+UYDH9tw2IU6k4G
	FL8BdIrh+vRQ7LTtUrqYgI6s9ph+sQcjuHXbQvb+s0shalGcHJl42Mcct4cV++u8O8YxD4rntK6Kf
	f15p3LT4Mt9r6zm44ElbpE5UtmXUJzAxrh5oRfippEfqhibD//GzOagIXPqwjG5u28ZpfBtw1P9sR
	FeS3EkKLwcdtXVKx0hbt3ZLY6EALZWcKa0034urAMY1KagRbpTC220Icd6bLANbGZTf2W7m8FH3JU
	JaGedlFG8xWoXrBxmwzodBLH+d05xXv5W5QyZVbRj/qbZOiwr7jf1SndBLi8dBzDXKr8dEcnDuWTZ
	leBbwH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1FN-0000000BTuT-2v5g;
	Thu, 20 Aug 2026 11:47:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1FK-0000000BTsq-48Hq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:47:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso338465566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226465; cv=none;
        d=google.com; s=arc-20260327;
        b=p09lYEmf0ctPF1dzKytxn4kxViB/BCTgAruS0020TPpcNxi27ZsLHz7Ifw6KVT1jWo
         hAIGUB5HyYms25ABZSezN3X1SvXfDYrrcTyimsUpdgdjdzHTnIRT/SxAcpcFETIgVYaC
         FuXTagrc/sKpXZRv1rQS6SdqWx0bzE9JPsKfhmLzT5YjBQIR19ewmDY0FKGMHYILR6ck
         Bx+tfCXrQLbruUfeCFfAyuPNiyxDDRaxAVeoMBh2cHYf78vC/LW0Vtj1h4oo8W+YKNQf
         n5YGG47AHQRHf98K/Py39H2cOFDB8Az/1xvdzjnxD8rRgJjphmgKmlGcpedJd77dtRAx
         oDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        fh=j8fyoQz13Xs+QXJq++YwbKN6jK6kOr7gxeQX42IHCa8=;
        b=kE2Upb3T4hJ9J3kxbYsUQHtOh8fsQQCS8hTKe8oySyJo1GtwX0+dFh9tqsUygDIqls
         bb7TkVy4HuK9vmyaP9pDfpEwhFSt4dd+IQk6Gj0TNmur8wk0SjnG4lwORGZiJXJRWY0a
         6ft/nSLFuqZtTbkhQHOlWHdtOym2WwRb0jzu21IdM1znWiwVNkUhhcWUkVNOGcue+Lqk
         psAEMm9R8rQZJACkPj7CKdFQ4dop7YgHNbqZaah+xGWU/YdYwl4FrJIn8flTC6zk2ywc
         jYpW28IcAzt6GySRyx540VJsTlrkSmQpSMrVqHTKpk5DXwUZyURNGqwpEoR0Wa1VViSj
         w54w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226465; x=1787831265; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=gtMBiPhtsGmEaS9zEU/p2r9s5SBGlUKGH+c01n6FSQYVPgPiXhH8HMbpi+vx1LvoKr
         Yq6YGA/5V0nthXCXaeStjZsOeGZOo6p3JL1IYxVjEK8UPrlFwkGfRJmIuUdkM2jp2kMp
         A801QeAEhJ9R7sEoY/fM1dqKmCtNayUmRirZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226465; x=1787831265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=obQwHZZSeNrPjhmR1bbdgoa680bTjvehccpf4jyKbBUdEmkha+YZ9f6OwVV2A8qIit
         ll6tsNpAl87KECNoeRViLoDB5C7DB1rA4AiT6aht3pXr+voBZUX+d6TM1xl1A7bXkZDO
         yjf0HkvUpDgi3+FYGCetO6V8RrYJWPphgSeVCLALMWQJXfbWKBfGqmWS0ArSJo/GoqWj
         685tJNEaq+/10lVwHKnlKEQPl9AtT5LAC4LjW2QlCcDiJlsItNrcmaxHl/5nwXFza5i6
         rku1C6XdnlH5qytxACScvyvVCjygjV89PUmOoiENAZ5WUu006pawYxI2z21jWa6FN2VE
         CvhA==
X-Forwarded-Encrypted: i=1; AHgh+RqiDvanX3qRd32Jo7bamX6GZVAAVVjJiGV/uRi8oWeG3c4/+Hw/Blr+8EvcX2/1DdIqKvI6Vn5mUJ/0rGqVb3jn@lists.infradead.org
X-Gm-Message-State: AOJu0YyiG5zD1HbQWb6fQv6cbmDAlXk9jL7TbzRpXWA0o4Q2KXDkKb9Q
	ohpB0Nbz9WgQ7m94/iNOQwX4EvdfGNRb6NJy/GTrckcNNcpelenQ60OFZrGB2dzsSZM8l3qj+xq
	Uu4PTZlQeBZsYcv7KXAoG3rOF6hugWxjNGXqp0b+A
X-Gm-Gg: AR+sD13VGmZAxVP4hqgYCmXGvq1ufdOnKiPKuyxuSgVK13dB2s3woeZ9rYWeuCXgvSq
	TfOZuGxgnEgAQ+aYvebIPaLSr6bhuRc8WW9R/6RIEhd90DXrQyXajiBrkcNXwxtjTigGYP2N9zl
	gSRJSHG6mj0SHFAnu0sDLCX4xuG7/BOMfwVXPKMckJaBjk1zARotLVBTlNpxIYt2W7wlrqX7HSc
	JkKPayK2C9HdTw41gCdk32VCSjPS4cwdKAdg7+P1O09yPjUKwEXhwIpkO/oar+j8wOhRZ93tOD1
	8xRF4kyhZBvcfjBRSa6VJFsezgJXeAdYXGaFbzE6a0U=
X-Received: by 2002:a17:907:84b:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c23f929e232mr710101966b.2.1787226465039; Thu, 20 Aug 2026
 04:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-7-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-7-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:33 -0600
X-Gm-Features: AcwNN1Wh5n38wXHkJkuB8H7_benVkiW5QlI5gxabpims6DcR7Y_DZnlEoYHYlzw
Message-ID: <CAFLszTiuH7KcvCKcpE09tTavFEWGNMj+C1Og0T=k5MvEZdB-OQ@mail.gmail.com>
Subject: Re: [PATCH 06/25] ARM: dts: rockchip: Add Ethernet GMAC node for RV1106
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_044747_051199_A6F4C723 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:15, Vladislav Leonov <vlad@zlab.su> wrote:
>
> Rockchip RV1106 has GMAC 10/100 ethernet controller.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index fa5d0d7f4dcb..71dd3dcc386c 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -19,6 +19,7 @@ / {
>         interrupt-parent = <&gic>;
>
>         aliases {
> +               ethernet0 = &gmac;
>                 gpio0 = &gpio0;
>                 gpio1 = &gpio1;
>                 gpio2 = &gpio2;
> @@ -282,6 +283,67 @@ system_sram: sram@ff6c0000 {
>                         ranges = <0 0xff6c0000 0x40000>;
>                 };
>
> +               gmac: ethernet@ffa80000 {
> +                       compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
> +                       reg = <0xffa80000 0x10000>;
> +                       interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_wake_irq";
> +                       rockchip,grf = <&grf>;
> +                       clocks = <&cru CLK_GMAC0_TX_50M_O>, <&cru CLK_GMAC0_REF_50M>,
> +                               <&cru ACLK_MAC>, <&cru PCLK_MAC>;

Should this have a minItems exception like RK3506 and 3528? As it is
it fails validation for me as it expects 5 clocks.

> +                       clock-names = "stmmaceth", "clk_mac_ref",
> +                                       "aclk_mac", "pclk_mac";
> +                       resets = <&cru SRST_A_MAC>;
> +                       reset-names = "stmmaceth";
> +
> +                       snps,mixed-burst;
> +                       snps,tso;
> +
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,mtl-rx-config = <&mtl_rx_setup>;
> +                       snps,mtl-tx-config = <&mtl_tx_setup>;
> +
> +                       phy-mode = "rmii";
> +                       clock_in_out = "input";
> +                       phy-handle = <&rmii_phy>;
> +
> +                       status = "disabled";
> +
> +                       mdio: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <0x1>;
> +                               #size-cells = <0x0>;
> +                               rmii_phy: ethernet-phy@2 {
> +                                       compatible = "ethernet-phy-ieee802.3-c22";
> +                                       reg = <2>;
> +                                       clocks = <&cru CLK_MACPHY>;
> +                                       resets = <&cru SRST_MACPHY>;
> +                                       phy-is-integrated;
> +                               };
> +                       };
> +
> +                       stmmac_axi_setup: stmmac-axi-config {
> +                               snps,wr_osr_lmt = <4>;
> +                               snps,rd_osr_lmt = <8>;
> +                               snps,blen = <0 0 0 0 16 8 4>;
> +                       };
> +
> +                       mtl_rx_setup: rx-queues-config {
> +                               snps,rx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       mtl_tx_setup: tx-queues-config {
> +                               snps,tx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +               };
> +
>                 emmc: mmc@ffa90000 {
>                         compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
>                         reg = <0xffa90000 0x4000>;
> --
> 2.47.3
>

Regards,
Simon

