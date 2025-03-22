Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7FBC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMfqR7BxervAfhU36qPFX9900VIMKC1P3TtL+FMdSXA=; b=bmW5a0ZRHUFU/KHHjB7J+fKT4a
	VS+QmLvHiDIT15aLW0ABccAT9tBcnVeIClrHFPlkmVa+Uzd0jOVfgiDBfTsqdKsCp2f6PfFXB6zbO
	h5RNCDULPFQrloRj7m/qLKIHT9uub0f06wckIJBXDcDYXbBcfnWoctoZRcDEumQoDswwurKuXjGIA
	L2jUNJbcO2qz7aIeyyQhsEO8V3rxUphSs83RCPn2hcwex681Htijc159s2balPWcIFdwp1y09CjIF
	dbG6odKCWFUjX5ypc4xapNupUEQcFY4eaLPOX9NsLUvBbUF+AyBB94SYz89RU+FqF1VMJtsgwTbI8
	4+iGNNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvvyw-0000000HFHv-2SZI;
	Sat, 22 Mar 2025 10:21:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvvxE-0000000HEwj-1KHS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 10:19:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso18393035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Mar 2025 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742638786; x=1743243586; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMfqR7BxervAfhU36qPFX9900VIMKC1P3TtL+FMdSXA=;
        b=koYS6Cj88CgBnXvg0k5sfpH2XjH0GqNfDPMclzrRgx7NrThEl+VS6+9MCxGx9IKBL0
         sFgzFRUyMvqgYPZrvccih2WvADxIpr9MnHZNugp7DDV5lh3ShDS+8PIGj9lajCf4ARI7
         EFCIgBf9a2MzcCkv9mmLEjxctGRz4eMTMXPbBXLVMFsfHFGrRuuy3laWPLzMnpgvtXCz
         3qO44o4I8g2HqONz/9sM5FVhJthtLCZysMtqGQl8ThiOg41MR5wB4ANkajsdckOEHCe5
         zImtGDvoifxNQxXefdSO6hddP00QbW6VTB1GXCUp+Q7BqfqmkKmJy3yS2K+RsEWCUWNW
         rilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742638786; x=1743243586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMfqR7BxervAfhU36qPFX9900VIMKC1P3TtL+FMdSXA=;
        b=MR6LFcXKiAvHdDi/wFH4nADAdLzZKj8xBpIuDfshourhnQxstbe2ef0A3AQkQzurx+
         HDvSzI9x1UJHP3t27+RyGmGpMEyaTK1KzBNpEKyv2TFMwMwD0ZX701TemY3He0DRmeK/
         5CrYis4Ftj1NZokO2bzJHUf1jCLTJ/PWpYLtimgxtpKITO/hKoTCBvBWQkKPTyLBhxaC
         C6Lunrfw9wfjEbn0pci0pG9m6g4sqTXIjswveebPWGbyN2+nmMqQZsrzJUZUFR7ZPKiD
         HH9rI3Sc0i+L1jM0Z8KGQpzhDZ05Sw6uHm8e24+ZC2e4eCVNGWVCQhlYUlUNiMcsg36T
         UmjA==
X-Forwarded-Encrypted: i=1; AJvYcCXH/dIZ06ureeWj6T6mUIpATP2tJSRv/nU+I6A1PiXWguQTdO+sbVOpvNm4Cp/qIEVX7/sMQw3p79mIBPLgYjU9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5vWwmdj1hi1Qaq6Iq/QwhWEfj3rE7JmrpfDpjQPuDk33dPYc3
	kNEYeGp+6/zFYGdogD0s6csVDpKXWsvTW0nslmetdhOo9cyFX0HYnDJZv28n0TA=
X-Gm-Gg: ASbGncuh4vtwHSa+Ts+ZQtp5wr0kmM9RD+y1N+5aUEXxyo6dNNCi5e5bOsiQNyKlY6d
	7+N1yfaGWCt2nltlhyGU77TAXvTfvOXLzppom8WdfGYtPDEGriTyzRPuDH3I9ToVH1kLrGBOb67
	m5wgMnn22+j6glG0iEn8nFoYqvs4JN/Cds1k7K4HVkSUaPjrXuPnLYRgULAsaC9gweTbOU4pZoY
	Z4LB0LI7MEcDIerXRvJVvP14P4dTIT5dntgEkymMAGTSAZFEkB7DrDk90xVhbkRY94i3EQAB13N
	AhMUWnLUZBRAo169PO2LUQtn9/vOuvAnT6gNoQRJH36Gn+1iNg==
X-Google-Smtp-Source: AGHT+IEPG1arfHtpohOj/xn036w6qfXf/DIsE1g/1+STIZT2hgcYRfebfuDsK3XXOFOXWdgPtcRXdQ==
X-Received: by 2002:a05:600c:3ca5:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43d509ec5a9mr61035965e9.11.1742638786140;
        Sat, 22 Mar 2025 03:19:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9a325csm4721308f8f.22.2025.03.22.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 03:19:45 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <8b342640-f4e7-45a1-a6d4-471e687bbbc7@stanley.mountain>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <061ebbe3-557b-46d7-acb8-308ae87105dd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <061ebbe3-557b-46d7-acb8-308ae87105dd@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_031948_364649_81893DBE 
X-CRM114-Status: GOOD (  11.40  )
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

On Sat, Mar 22, 2025 at 11:01:18AM +0100, Markus Elfring wrote:
> …
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
> >  			continue;
> >
> >  		link_conf = link_conf_dereference_protected(vif, link_id);
> > -		if (!link_conf)
> > +		if (!link_conf) {
> > +			err = -EINVAL;
> >  			goto error_unlink;
> > +		}
> >
> >  		link = mt7996_vif_link(dev, vif, link_id);
> > -		if (!link)
> > +		if (!link) {
> > +			err = -EINVAL;
> >  			goto error_unlink;
> > +		}
> …
> 
> I suggest to avoid such repeated error code assignments.
> Can an additional label be applied instead for this purpose?

Maintainers get the final vote but generally when someone is doing
the work they get to decide.

I would say that generally the way that Qasim did it is normally
more readable and more future proof.

regards
dan carpenter

