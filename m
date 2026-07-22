Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFCBC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=; b=ZoGiQjEsslQlLNErtHP5YkZeaD
	2bjXCpwn6o3chkysJlxHHc5W22SWxrRHCz3nK56sqq56+ajfzlLQDmk68cllqU4X0YhyFdd5bvPj5
	cg0BYpe+OVLbGtpLGU0bXytuDQxQpdYisYsn5vKFa2nWPkcFjlDGfaNz56OM3t/r2bKw0d5z2XdXM
	bHsvC7wCe+D3hlT2Huj7Q0UnmxN5+ljPcW/N+Dtsu5ZGE9xLpvFFhwnnRo28kzwhkjjLReVJ99yLD
	et5S4CmeJiYkDL8XlWH/WRwmDAi5FmhqSs/M7Uydjtgcn05jq+wFv+y6qKxMIozAKJ9q3zfYQNC+6
	tK+pYlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT8a-0000000BO8T-47A0;
	Wed, 22 Jul 2026 09:21:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT8X-0000000BO7V-44cl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:21:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so9328296e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784712068; x=1785316868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=;
        b=sLRL+f+KSUmTAWcO3isLU54cnhE947COIwzVZdKATCFhKgA4PIwEIMUZ0gEZVLkbyk
         vo1m+2A4vHT0LsNaAuIywzwyvhYiAHHbYe+YQ7KSbylun5k+GGx7tHpABAAMvCg3k6eq
         Zc3IftuyC0G7dYU5ogCTvXlNM5x+8lnXcO01HYXKz5ozPf5AYLXrkrnqAI4SE4c29tYh
         urM+PXDVc3z4WbG8Q4MLdxyoYhDtroHt5zw8UXkThk+/W4T1VPvWX8MsSgTK95wPqKMB
         X5pm+Gorcc4iJ0u5Ely2U+R+Ksk+Ja/oE6vQq3EHjMrNrsqVPD85Z3FPcau+eiG0ZmVq
         a16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712068; x=1785316868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=;
        b=Crd5w+HpTK3QHCkZJiSRhGJCnqYKJxQV8Mfir+sXJ2rlunJOutwCN9mjckNNVdhhDu
         yhNDoa/R4QImeXsTrJ6fmKYf+FNtbh0BYVk0CH1TGxdPUeJpwAq3gpb5iBZHRXahNg/h
         uLy8bFcQPGgQBicajJPF4vdUKxf216J1cYz6mPH/d0VlsSKoFITO2yIGeSGNuNkZXCQ7
         R4r/LtPWraGLaE1V+yeEW803IeawqGL/uXxI9sGmxgTz8OFzhGjK5+el7jryJA7ZAScJ
         otbavlXf5Zf3QUjmsOo4m4A9XmUyCFCqZJV5d0AfL79NfVG0x/x6qIhH6QaGTzuqHbEN
         ByLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+VnaABwJ3sfnw1+Nh5ZSxB/GFZKctxBdKxgh+xKE/MuYmaHKUENP/3iCc0LYyycHxVKoe5EBMqfsSEVvjJJQ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9pidzfGd8pT4TbL5DTK1uZTiXJwkhm5lx0Wy/wqzWDB6xhhk5
	YtMX5LDBZzkk/nwFJGjUoz3aNfhi1aQkO+/xEt3tCF+nLnW+1tlrzkjP
X-Gm-Gg: AR+sD10x4fwMJTWQMEny+hIILn4ljpfOjZOiH3+BQqYiJv9tfHHCNUfbej9DhNMFXgp
	EjRSkReEKDnn/B+iNiDi30AaucSHWJLx94zBnt2h10rIPEyLz8qJjuvojJKjKGv29cXGZ4ylGjz
	xxFcetWwp3gfs9VSNfYknJjQDJBtIO2IMJHNccm0Zad/0krdct8Bcmt2SL2LzWcStLc3ve4VjIG
	Se+HFG2NPWUH5P0O3KfJUJT1Mq2gH3DuaIO7QjkSbjYIesFurY9Mms0KbNWguPHtuzydsROBwr0
	wTuwP5xPHqhFV3hhd9l3MIgFf8bx92grt4BMc+lmzHsgx3/eWj0uyc5L/54NA9Tdz67RYBH88Wd
	yQMMoaRHW8dZ01EOo5wV22lg6t+MSpF73YOPWoVELyAsOXuW0RjBVxll/Ig3D1cbYNqrIThc1FU
	f2f5SZ3DY1Rxukzp6m
X-Received: by 2002:a05:6512:708:b0:5b0:1b0f:7a60 with SMTP id 2adb3069b0e04-5b28f9ba3e3mr2907126e87.32.1784712067687;
        Wed, 22 Jul 2026 02:21:07 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d303dfsm380919e87.47.2026.07.22.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:21:07 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:21:06 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv2 wireless] wifi: mt76: fix MAC address for non OF pcie
 cards
Message-ID: <amCLcgSap5ShOiUT@soda.int.kasm.eu>
References: <20260706232857.807044-1-rosenp@gmail.com>
 <al_SAwiLmgT6D_tS@soda.int.kasm.eu>
 <a0c1178f-86e5-4193-9d9c-767abbdee076@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0c1178f-86e5-4193-9d9c-767abbdee076@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_022110_028917_769267EE 
X-CRM114-Status: GOOD (  23.59  )
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

On 2026-07-22 08:40:56 +0200, Felix Fietkau wrote:
> Hi,
> 
> On 21.07.26 22:22, Klara Modin wrote:
> > On 2026-07-06 16:28:57 -0700, Rosen Penev wrote:
> > > If seems the check for err is wrong as the proper macaddr gets written
> > > to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> > > wrong as the proper macaddr has been written by this point.
> > > 
> > > Reported-by: Klara Modin <klarasmodin@gmail.com>
> > > Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
> > > Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
> > > Closes:
> > > https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
> > > Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
> > > Tested-by: Klara Modin <klarasmodin@gmail.com>
> > > ---
> > >  v2: add extra tags and target wireless
> > >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > index b99d7452800f..afdb73661866 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
> > >  	if (err == -EPROBE_DEFER)
> > >  		return err;
> > > -	if (err) {
> > > +	if (!is_valid_ether_addr(phy->macaddr)) {
> > >  		eth_random_addr(phy->macaddr);
> > >  		dev_info(dev->dev,
> > >  			 "Invalid MAC address, using random address %pM\n",
> > > -- 
> > > 2.55.0
> > > 
> > 
> > Ping. No one seems to have picked this up yet, but I suppose it is
> > holiday season.
> It's in the mt76-fixes pull request that I just sent.
> 
> - Felix

Thanks!

