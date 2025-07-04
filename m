Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF34C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZIDPgdEPQCeWAs8+GXUC0qlYXmlPlQaUJsDotTrWB8=; b=k0CQcu68BlTZo/aEwjtu6wz2ZG
	OfGIut+fSHeBiWxlXThVYqIx3F+/ZILbZx3RWFuLE9llos4djjPQ9qsVYFmCNgJgQrwFr2pJBtTRC
	ZwXU8tLF8ySVaf6PhC9QFu5SVGsDSN2TSLgKhBNrUpiDAdoW3Pg558S8A5aVYgqjnpaLHAuyRTpMf
	DV5tZ8Yr94EBzoHxOkL0US6Nq1wmoBDNAQy/VsFPXBII4owdBcUDZAfFfLKbDU5/AvjRQ3yLCUxHd
	Kko62XvTJd76i7ZVqwFfziUMoMpsRLEix+gBVC4KpzMI/AIVv+At0bJhUN/OgRCn1oWc4wRngrqYG
	iIISGUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgil-0000000EYag-0Wum;
	Fri, 04 Jul 2025 13:44:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgJU-0000000EUUz-30Ri;
	Fri, 04 Jul 2025 13:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751635119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJZXZimEXZ4Fn6WgICDySN4ceF+3yIfRcSi3YVx7ntllMgF2muSetMKQCkAt3Ijsd1tg7YXxMGNkkWljFqnvLDjrMoeGYHDbd4i/8RBV3Z3npHJ5j25ROpTQ1Tmh0Zqen58cOvxWkC22eleAmadTHG5msmtVU7rQm9qTiaiHLzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751635119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rZIDPgdEPQCeWAs8+GXUC0qlYXmlPlQaUJsDotTrWB8=; 
	b=HTlyXO2Bzr8eZ6gAQGzvoGr8yz0fwzMSHsNwlxZShz1n/NAAUEn4JmmNy6dXDtimRQMqEjNsFb201Vi09xS6/7fZb+vgyd65wxqUCq+YqSR2nrlL+gOdiNM9+fw/HG7t/uLjUaKYVkojOzu9yxLU4N593mWdMSmtayhhPR1+KbY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751635119;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=rZIDPgdEPQCeWAs8+GXUC0qlYXmlPlQaUJsDotTrWB8=;
	b=cg7/kl1rDLHribZIYTRsV2TRQycqUcvMHdXee3xrgBkKiM90PjnPJAxm/t7bUpNk
	uUM40cS1o/gCSTZrZVInEcSALRePaNUX6USx9TQABmdAlzcFUoYIVUCIl39D8/Z6Dba
	MoIYhi2tqXXAUytHUAV3y+9vTG3T6JPqkAnzLHc4=
Received: by mx.zohomail.com with SMTPS id 1751635117642477.38467772770343;
	Fri, 4 Jul 2025 06:18:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "open list:ROCKCHIP SAI DRIVER" <linux-rockchip@lists.infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] ASoC: codec: rockchip_sai: Remove including of_gpio.h
Date: Fri, 04 Jul 2025 15:18:32 +0200
Message-ID: <5011203.GXAFRqVoOG@workhorse>
In-Reply-To: <20250704130906.1207134-1-peng.fan@nxp.com>
References: <20250704130906.1207134-1-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_061848_821272_4603F71C 
X-CRM114-Status: GOOD (  13.49  )
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

On Friday, 4 July 2025 15:09:06 Central European Summer Time Peng Fan wrote:
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 0b9f54102d69..6695349ee561 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -9,7 +9,6 @@
>  #include <linux/module.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/delay.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_device.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
> 

Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thanks!

Kind regards,
Nicolas Frattaroli




