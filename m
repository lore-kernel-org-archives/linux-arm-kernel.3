Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CBCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=; b=ArHKB6tWGQIvsVxbx+FV5H6iAq
	uAoZ1cYoIdTQCJaFM4ka8AJ3xkidtr+KGjHQQTjXiqSm+esgPngcgJMPZ4oOY87J6IP0+MqBEKtia
	2HdaL+kWUwD8BIW9v3QjJ2CSp9qDxTWsfZ4dionU0wi+DuSdBKo9POfpbm6zNYUJ7N5T9VxrPbW/8
	nSIVbQouTEr1KnF1oxEdXGlk/tY7Onku0I3u0s/04UeraGXV9nSyCmu03duHOAW0YM1iMd2gmBTsF
	C7WHj0XJOlJV09pOeLyY8DreOSloEHs9n8HI4l7c+ZlWP476xhPzbxj+HmSZznoM4nLanI7WqElws
	I5CPLctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKa4-00000001oSS-1ATP;
	Thu, 18 Jun 2026 21:47:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKa2-00000001oRf-2572
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 21:47:23 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bef47b1ac01so223668866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781819240; x=1782424040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=;
        b=tNohuA46DkNPjEC95+SuovwFn70XUefceQwVvI9ijlMsXRLEJc2GaIrHv5IZnfULQI
         hM5AFKKv+UxOb0WnUqHWXrtfJK5TB9zmWmdkQlOxbHXNjy72ckWOZP4ii1cvVi/RPNc6
         cY+pzMRtbjKnQcDL/ZPfGlaS9bEEKzD+J6aasWL10QSl7AHvt9lk3ioNkgMAkDu+RC6E
         FSO3Gxn4Tgot5Iy4VWlPiPgYha4EytnsxhPIaRo9i0jn+P7rkLakA4kxqxi9Hi3mSdeh
         ihhcLiJ5tlz2klNLU2S+uqfj872FwmTinLMmPGYn16HT8+1zGNXCjDExBl9RbKxpIo2j
         mkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819240; x=1782424040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=;
        b=h7osm5exnI621Zk8wRqbZ6aolza4iuWzyCSNZAhm6Xbr4xybGuCG3eWXuM5yFS/3fN
         Yxd1Bvq29W1TKtzt/ZXekdvqZi0n13IB8jkA8UoaKhTCtDG7Me8nFErh4Y1X7M4QUWZ3
         4KlSDhTvgQKeUoFmfmJm1jX3zMVGQ0J5lo398bbr9hfPv/zu3pvTe4SzEBRESqRISW88
         Tj9ntBkOV1JDMIh/54U4wpStiihvODDw4gTmIKlP15bW8bbRavHqbeRh9j6k4KYd3rUT
         tPklgENpDXypTJyfK7rVynmwwM99y+WQbmIQp4ZWDa/79+7Q/ejPyOEHc/Q1Fa+6SLfX
         JDPQ==
X-Forwarded-Encrypted: i=1; AFNElJ98QB8Beo0+4RwvmFBUS4iGJFWOCbtavadGueWT3NkRqzu+HNWuKwjyOLYTEB4DWk2fSapNgLsVizeh2ARDyekm@lists.infradead.org
X-Gm-Message-State: AOJu0YxQVQXPjHw4cJ/63u7SzmR4/1sGPNX08cuxyFwydLB0LbIc+bbX
	WgS9TK/PWk1jm4TRxjRPRzLnq8OcHGybxLPe1Jrm4pQ8rIfFVorwXfrC
X-Gm-Gg: AfdE7cnJREKpct/Sqyr0IsTQ97a1NQjVo+dgMXbPzjZFxmJF9z4+YBK3xV/2MPNF3HC
	gMEeNMNVKUsw4jjK243cj9efg2l7mYyL7/o9TCwKq8o/ffEypq1svDuUxKQitfxJTse4RFsEnpH
	wjkiKoFkIUjdBl2aigrhdix8Ol+KXqPdckQF0p9ItD4OmVi5rAO0H6YIypkk7xPH972OLAL5oYk
	YxBzjn3z8cJ4KIl8AjwqmpgkZrxa2HepgJXv6Yzqc46D3saWBPuoTc+idnQh885aU8PLEnOnR4V
	1HLz/HFA1w2mxuUeeFdZB/eAp7UBglw3OKk0VuioCKUwzS+dTd9s+0LR0Kyc1j1D2pehmOPa1AZ
	XQBwul6QT5rKn3aA3VxN0nD2R6c+ZITtKa2fWuLQ3cN45Rs6fwPtkILuw4TzjU3RFEMSD17BO3l
	TONNXvJGVWSw1xxe3PDvVubXm/5RQ=
X-Received: by 2002:a17:906:9fca:b0:c08:49a4:c737 with SMTP id a640c23a62f3a-c097ae2ddd2mr58097066b.2.1781819239771;
        Thu, 18 Jun 2026 14:47:19 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm6914166b.51.2026.06.18.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:47:19 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:47:18 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error
 handling
Message-ID: <ajRmlyx_AEGybykL@soda.int.kasm.eu>
References: <20260427051746.954704-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427051746.954704-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_144722_541758_B13B16CD 
X-CRM114-Status: GOOD (  23.68  )
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

Hi,

On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> Check return value instead of is_valid_ether_addr. The latter is handled
> by the former.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index 93d91264687f..0f6ccf6ed53d 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (!is_valid_ether_addr(phy->macaddr)) {
> +	if (err) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.54.0
> 

Recently I have started to see randomized MAC-addresses on my x86 laptop
with a MT7922 and the above message printed in the kernel log. I have
CONFIG_OF turned on, but since this is an ACPI system the device is not
described by any device tree and the earlier of_get_mac_address() likely
fails with -ENODEV. Looking at the !CONFIG_OF stub for
of_get_mac_address it always returns -ENODEV, meaning this will always
randomize the mac in that case too.

Reverting this patch fixes the issue and the correct MAC address is
used. I'm not sure if there is any case where of_get_mac_addres() could
fail in a way that results in a valid MAC address but it seems unlikely
to me.

Regards,
Klara Modin

