Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A584C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTAIp4t0Uj1HH2yinQWEgMenkrCcOkm3JzrKhPRQMc0=; b=nFMlRhy6SyFun9A5DVHmFDP0XX
	OnARi1ipW8LQvMEMQJQDlP1+W4nv0e38/9qVyQ6L2TDQubFInQIgaoQ0hKs2uq2gBxtmM4KaG91xP
	L/t/o4tTIsGY9Nv7lJt7ZYP33xW5F+fbHCNb2htbWN1TjNdZJNic9i9LXrOs9nCraTupUI8ttrvYJ
	CEXyV3L61qSyw4N74rH/0zAL6iBFUq2hd1YWRdoJhG+25KG9+NqWhXs4zn2EqDP+VP+2WV6ojCM9F
	J8L/oOfvOhWlQPKhj/1NY1MRY0EWCqa/4iWhH4Qpdseq6ETj3+U7EOrd0PT3M7echIM2g0Pu/sN06
	9s9td9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew9L-0000000FT5y-3LuT;
	Mon, 03 Feb 2025 13:06:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tew5U-0000000FSaW-1292
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738587724; x=1770123724;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+9nCidMasawJSxee/bobFP/vrqZwe7yW0J4pRtLVVbs=;
  b=QMEz8S/BVK8pUhZBq6KzvFz852sPL/THFGWqTP2ZgiAWIphxoE1VHpZW
   izUaLntYRCmS/hGGoyeEkZw7n8I3CU+pek0YlavBnlWhv/AsrkcsiJS1U
   Phhl8b/c4UYobJDznlC0CIKuDw7J+mjNIXnv2VMsgi+80naJai4JWXDAf
   Z/BgencUz9c7Hfk/0iAVm+kwo5dPDjsAN3gh2BkA+r+Za34HX7m6ukuht
   WXNn2wf+xANglaq5eHEk8/3Affm40lQi9yIyOrUvxSSp1JxDnu5ovfQdS
   r+uaVNq2HBBCqX9QauoJoj8mGr8VZc9qnOyBYF5ZVThS1VnG9HtqfhTr9
   A==;
X-CSE-ConnectionGUID: VeIlbagITs+s9NULpo7Mbg==
X-CSE-MsgGUID: 0HZrdDSrTnWOcbekv9w8Wg==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="37622858"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Feb 2025 06:02:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Feb 2025 06:01:23 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Feb 2025 06:01:21 -0700
Message-ID: <5613e05c-ba7c-4df2-9cbe-6caef8d1b8ae@microchip.com>
Date: Mon, 3 Feb 2025 14:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: at91: calao_usb: fix wrong polarity for LED
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
 <20250131162611.33338-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250131162611.33338-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_050204_347466_D9F58968 
X-CRM114-Status: GOOD (  13.94  )
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

On 31/01/2025 at 17:26, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It is active high per testing via sysfs. Also matches the very similar
> usb_a9263 variant.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> index 8744b5f6f792..5eb844f2df9d 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> +++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> @@ -122,7 +122,7 @@ leds {
> 
>                  user_led {
>                          label = "user_led";
> -                       gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
> +                       gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
>                          linux,default-trigger = "heartbeat";
>                  };
>          };
> --
> 2.45.2
> 


