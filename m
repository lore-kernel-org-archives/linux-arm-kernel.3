Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5164C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Am1iKsGd3Eqxyqxrhz2XfQ33Q2cL4XiqZ6aCyUVLBw=; b=q6V5TRhed2Gou0m71tcmuxB0la
	8mtl+bYcofOFjwZJAfY/x7UlBmbq8XIeTouj4/Bpula+nfuU4B7HOZE+csmRJHPuxlkoHxfMRQ6lx
	7zeo+8kKhQ905YGZ2heQ7FzrVKjt1N0pzxOucV3Wu4W24u2RFNyCQaeffJXccsWlIels8am3XF1H+
	kdrRiF4pjQjhZExn5iwACyEeZKwyoeI350k5tUn/O6mW/xHlJzUnG0fU2vjVBbJ3pAbPSMfHZIJky
	OgJ7wyc081IsRwDTs2CrgWv/rR6RmzL0ktDQEoCLRvuJ9hV+CGNt4d+azr3CZTJ3zelt6xshCUmtX
	za/7fNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmStR-0000000CZ6Y-2lDJ;
	Mon, 24 Feb 2025 07:28:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSru-0000000CYyi-07CQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 07:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740382031; x=1771918031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fj9ATARjbXR29ISCacUsG5uVWZEBOqKd2CTMA8IFPLM=;
  b=S1bbtcZXnCr4zKNFpcT9Hn1A9qHg66MiwjTvE/7W5iiiHEzPWCe0P/ZT
   6+SWFJ9opzTlLxF2hOLKEOFlaMkcp6itGtBcfCQdOnP6y4FuaHTqms8pK
   N4nRvpoXpaKexhN9izdPUhsRrA7dBoe8b+9K/kP8gJHOq8t5D1aIUdoDe
   mk3X5KajYUokFgKcu32e8FoxU084/QP4pwYTiowCgzG02IgnSM2sjVMyN
   FELpmFq6Ic9ud/nvMG+HE5nZ+p6DHWQWDsCl1dPZhp/uEyUKx2mgWrCZ2
   s04wfstjrqcQECXxhb0hO6+wQZTmDbxRBTSkyDy8Q0IeydGoj9L9tEXFE
   w==;
X-CSE-ConnectionGUID: m2OKtz9RQ8GGzkYxdWztiQ==
X-CSE-MsgGUID: 4T49poF1RKCLNxbUY6QxcQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732604400"; 
   d="scan'208";a="38035487"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Feb 2025 00:27:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Feb 2025 00:26:52 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Feb 2025 00:26:50 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: atmel: atmel-classd: Use str_enabled_disabled() helper
Date: Mon, 24 Feb 2025 09:26:15 +0200
Message-ID: <20250224072614.6811-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250222225925.539840-2-thorsten.blum@linux.dev>
References: <20250222225925.539840-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_232710_263116_BFEADE9C 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, andrei.simion@microchip.com, tiwai@suse.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 23.02.2025 00:59, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Andrei Simion <andrei.simion@microchip.com>

> ---
>  sound/soc/atmel/atmel-classd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
> index ba314b279919..1f8c60d2de82 100644
> --- a/sound/soc/atmel/atmel-classd.c
> +++ b/sound/soc/atmel/atmel-classd.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/string_choices.h>
>  #include <sound/core.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm_params.h>
> @@ -275,7 +276,7 @@ static int atmel_classd_component_probe(struct snd_soc_component *component)
>  	dev_info(component->dev,
>  		"PWM modulation type is %s, non-overlapping is %s\n",
>  		pwm_type[pdata->pwm_type],
> -		pdata->non_overlap_enable?"enabled":"disabled");
> +		str_enabled_disabled(pdata->non_overlap_enable));
>
>  	return 0;
>  }

Best Regards,
Andrei Simion

