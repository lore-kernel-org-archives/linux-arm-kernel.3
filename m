Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F06C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dfJ83Y79NwDQ+8qNzxM+p5WkOeUg86p4gkdxrYkNv4=; b=MFyUiBnku0JxHny37mM6vo9iFz
	exBb5IDJPrYuC0+ks/p9THTVqGPEQmbq5XtHh3JZd4xlRSTSqTcXosCTb2bJ5lyumFLyagjoGpgLm
	QrZMmKz+uvajo2/rSjBOujwqsiDbR4UyHk0cu0HCiF4aZW6x3fGMGuv18D4680qcDwpFXmSpR6dIo
	LShEfTyKl7dLeRYxsIyNJUH1uBtIpspDPoEyffY8fV9ldMJL5TXCdvRqUWCKtjB4W7Ks/yDHnAfmS
	r1nC2Gv/L08k4smyeEYzYtjTHjX0Xr8QxaovSpyg6JsutZF2b+R8Vd+W8MhrP6SZtvV7W3f5RWy3D
	2KFHdIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfPS-0000000FXiL-1qHe;
	Fri, 21 Mar 2025 16:39:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfMX-0000000FWyQ-09JE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:36:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1972424f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575007; x=1743179807; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dfJ83Y79NwDQ+8qNzxM+p5WkOeUg86p4gkdxrYkNv4=;
        b=Fjk9kXTJsuucVTKBpMN3P/J6ksaGPkbFp++4heBz1FemAlnwJXLxkf7nU4QG3TBCN6
         RltRWzERAIch+vhVaZahFaGztPp2l9E9UkQxQIbTghQLWPC6qJSe6+2UbpoBuZOgf5t5
         ghIVPz/bYBJI8OztxeK4b2vfFcGpjUzc3+3vNvQIl5E/RPMcrO2tD7gV2atVm/S/ua0C
         U+n2iGw2H4k63OBklANWElIPg52QUoakSMoSd84GJLEX+LRva+2869rRvPVZpQD2h40t
         X1v3T1FlgzV2D7QEflRz+bfBH1/aDseEcyWKGSO2n7aTDj4BR9noXdGjzOWQJefDDuE5
         J9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575007; x=1743179807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dfJ83Y79NwDQ+8qNzxM+p5WkOeUg86p4gkdxrYkNv4=;
        b=buSm2aC2koLTOpB78a2S1uwd1jAjUU6h7+KCm8m1/nET9uwtMCkuJytPTOZe5RWV3g
         piRsNae+9nVSpQMytSpb8v9KJizH+yJhwfj7WgrOjauvhZiSh1/ZOxDosyp7ZRAIMnuB
         WmQgzEIdurvkpDGKcBkDDX43e3ABlYTm1dHq2luM9WANCVE2vZ/nCj+6lPbOyQYsESKK
         qJrZX40kmeYmLmLAoBwWr4xC7UT7Co8f2O8bjdc8daZDz5qhv/XLt4/YQMmsFcNTqnn5
         dDvyGvIYogUHUo9AV6oFSqWEWw9mDbB56rEOgeH1DeyNZdmGWEf1WXDUVMdaQseZnjjB
         53jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxP23RaYUQD1CwCZXKc2Ag2fj2ExPfgl491iCYFmD/dbdpl4uC04KwpqvRgD4Xu/yQISH7cS/Gdznwef0ut1/q@lists.infradead.org
X-Gm-Message-State: AOJu0YwMdDG4m5FK7xfFp8IjjzDL3pGaxgwoV7+ttPU6kyexQdaGXvbO
	nEUTo+c4FjDJPI2/3nGi9f/F0+ye2yInxgVDUsLMJGuFTGe2RJpHw9HtoVerde4=
X-Gm-Gg: ASbGncuxr4am69oWOipOMaVK1nmRElrtkFZ6IzLWySIc0/h+hXZ6P8weqI/EDYUX2fK
	DpEM0I1Zpi9OXvaNvJXiWqcGZ+WcG5D1iUmljNU7KYaTTP/9d0gqAWUoXxucmP+LvVIIX60W8nS
	gUIQAvMIi4mVIEjKesfm0x+lAhbHa9Ic4G7q+whPhNgiw+YFWbANk+Z7q2lp31sC0Z4iJd9oXso
	3ZklgBy7Ebc9HHX15UuGKzBVNctvh8J2U1Jiutbaw0YGt0ALn9Eeyg6D8Xr8r1t7ul25szXPIqQ
	zahWAyCxpZZg7HBfz5+aj6LBJYPGmQaP7TVmQmvEUktXl6cy0A==
X-Google-Smtp-Source: AGHT+IH1Gh+yAviT4FQBLCA4J0rbTJcI0EGBOTqg0d19KW+FNDv9FqBQEn8luqW5P6A+FmDu+T7bTA==
X-Received: by 2002:a5d:6485:0:b0:391:4231:414 with SMTP id ffacd0b85a97d-3997f9397e6mr4352017f8f.40.1742575007313;
        Fri, 21 Mar 2025 09:36:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d440eda26sm82421375e9.36.2025.03.21.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:36:46 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:36:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <46a714fb-8a14-4d24-a0a6-a22cc9d45768@stanley.mountain>
References: <20250320201914.48159-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320201914.48159-1-qasdev00@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_093649_067628_B07D8D60 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu, Mar 20, 2025 at 08:19:14PM +0000, Qasim Ijaz wrote:
> If link_conf_dereference_protected() or mt7996_vif_link() 
> or link_sta_dereference_protected() fail the code jumps to
> the error_unlink label and returns ret which is uninitialised.
> 
> Fix this by setting err before jumping to error_unlink.
> 
> Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
> Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> index 91c64e3a0860..78f7f1fc867e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
>  			continue;

What about if the list is empty or we hit this continue on every link?

regards,
dan carpenter

>  
>  		link_conf = link_conf_dereference_protected(vif, link_id);
> -		if (!link_conf)
> +		if (!link_conf) {
> +			err = -EINVAL;
>  			goto error_unlink;
> +		}
>  
>  		link = mt7996_vif_link(dev, vif, link_id);
> -		if (!link)
> +		if (!link) {
> +			err = -EINVAL;
>  			goto error_unlink;
> +		}
>  
>  		link_sta = link_sta_dereference_protected(sta, link_id);
> -		if (!link_sta)
> +		if (!link_sta) {
> +			err = -EINVAL
>  			goto error_unlink;
> +		}
>  
>  		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
>  					       link_id);
> -- 
> 2.39.5
> 

