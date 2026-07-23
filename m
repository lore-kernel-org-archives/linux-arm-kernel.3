Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF6C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLdXhgYMtQZkOZKJBRViZWi5CKisW6NN1fRZfJwSl64=; b=PXBQKOkFNfr7XarBBMY0/mD5DF
	s7OcG0QN50M8n8weFRCYTOvAFoK+1alAUPHPkFgtRuu9Y4LhmVneAi+82aimoJWqE3TwcYdl6GFWi
	hzCBlqEp71FgWgp6BfFZSgcHGdqkCh3upI5/gh327qHVBmt+hJ0/zz6rd/07AOm0Q6/1pH5xN403i
	tgkS8kP42ohaZ0NSEYXizPmcTJuznc+qoeSn1+7fqVp7gqAvWj6wdOAHo17fJ1Bxi7yygIFnVqWN9
	DFc489/qeyhp7A971k1by9E4F32YzbAdgclonzM5DYUAp5NtMRzkCUeC5uPY7jSXLbSAa1FwBjBbt
	TEjMjmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0fB-0000000F66k-0GmX;
	Thu, 23 Jul 2026 21:09:05 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0f8-0000000F66C-3ZNL;
	Thu, 23 Jul 2026 21:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784840931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nWZ907QV3to2K81Jlq1kCqW0gDPRSsxVhJObunskYpoa3kdZynXbXnleneHqnZ5LOEoAV8VlYSwr0wT8Lhl0A6SNAqfzYQzZGNPiuccr/M1aDRZCFJYIIqvRj4hzCCDhBbwOHBFnifN7nOQPDHkwcrzThh0stqsRXwnZpiavzgQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840931; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SLdXhgYMtQZkOZKJBRViZWi5CKisW6NN1fRZfJwSl64=; 
	b=TyiaX/zhBYtcwALXeLfhnhuhGms3+npx/pBzVA48DeRp1oPDazJwGGkPLSQGCcg7nItQGr9xNlQWcxBYvIXS/doI0u5MHhYcpfJ0tt1JeM+y9rVWAdBelK06Q7KK/50ne7fztjHyLDjJUvgegGhbqrMPsr8CJSKAYm5aDPXr0yw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840931;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SLdXhgYMtQZkOZKJBRViZWi5CKisW6NN1fRZfJwSl64=;
	b=cOUdxoT/oo0DFrQSVGZIqcmHWUyyFaoTZQfve53gbLm8uXsiwQeD9tmfuUHVWDuu
	9mhJw3ce2gCzbITHs3JKOkL0Aq1Spp8RdVP6OATBL8/IN6fxxcD3TbQ6VciRhDCuPxo
	WGOJcIg1z5fCIy0XNYkDQ/m1PsVFJ0O0WyPSKfLk=
Received: by mx.zohomail.com with SMTPS id 1784840928227899.1785246524836;
	Thu, 23 Jul 2026 14:08:48 -0700 (PDT)
Message-ID: <9a05f046-e408-4b2e-abc1-4aef85838d28@collabora.com>
Date: Fri, 24 Jul 2026 00:08:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-5-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-5-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_140902_948348_5BA73493 
X-CRM114-Status: GOOD (  16.29  )
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

On 7/21/26 09:41, Igor Paunovic wrote:
> Enable the shared HDMI RX sound card and the i2s7_8ch interface it
> uses. Together with the audio capture support in the snps_hdmirx
> driver this exposes a capture-only ALSA card fed by the HDMI input.
> 
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4:
> - only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
>   that the card definition lives in rk3588-extra.dtsi (Sebastian
>   Reichel)
> 
> New in v3.
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..9f9a303 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -171,6 +171,10 @@
>  	status = "okay";
>  };
>  
> +&hdmi_receiver_sound {
> +	status = "okay";
> +};
> +
>  &hdptxphy0 {
>  	status = "okay";
>  };
> @@ -247,6 +251,10 @@
>  	status = "okay";
>  };
>  
> +&i2s7_8ch {
> +	status = "okay";
> +};
> +
>  &led_blue_gpio {
>  	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
>  	status = "okay";

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

