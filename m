Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39742C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seJOt702BxciOrZQGfbCE9NbiygJD+aaFMVx5CIWE5E=; b=Nv1mEfNYLUuiNI1P5OuhZco/W1
	oNg+lTNt/NB16Hl0G7yjlKjNzddRye781aqmUJUh0Az5k5Qvru1GBZgLv308fqfne+nF8W1QNPWS1
	BvcLOSE3lb7T1kEOti9INhMgk+iAg/AMPCsWQQC/DIlxXNnM1x7iHc07tzFQvpG0x/Z+Wxvw/KuzB
	0t4yqDbsdeP0pbqZQDlaciTcqPeVRD+GGZ3hoso2tjzInWQRLrILm+3eMZfxjYVBhttB4b6GZnvU8
	iw/XB98HxCx8+8k6LQ9d56YJc9wgktBmM/o/uO/SKvIraep7RODj4vMOgUbm4RgGL9wDjzTf9ds+U
	XfU3LvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNWL-00000008II9-3H4H;
	Tue, 18 Feb 2025 13:20:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNRv-00000008HJN-0ewa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 13:15:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso453059166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 05:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884541; x=1740489341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=seJOt702BxciOrZQGfbCE9NbiygJD+aaFMVx5CIWE5E=;
        b=lyiaWJ34uNJnEyEC/vqZ8KgbnfoFjbdLD3uEoT5Adt/UZJvy9Rh2nrSVLPe6R2JEXh
         SMOR6X3/jPFbXWdol5dJBgLT3JZ2zhvR3N5eABAqk+ntiVbtdr6MbxAZYT3hAHSOEfgB
         70foo3tJDMyR85DKG+VxMO3BxOjzRzvev8RSZOQyZEL+s2y7uJAnaEMd79+kFWsR39Rt
         zbUBljFD0ep3gxxJ/vzACVmgNQ+QwI0K/kjaIb4IMBer7fKWaRvZ4P5sJ5nts8YPIN8h
         eqEQgLWyXCM5BylocUxxzSW1wzFXynY2CXFpPEHN9vMMRvWmFOU+xBO4E4X8v5Leaqjd
         PKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884541; x=1740489341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seJOt702BxciOrZQGfbCE9NbiygJD+aaFMVx5CIWE5E=;
        b=vyiy7LOVPmGesjd4/mDru1Ch6IUtlzfVgwMZN/F9yIjU0cYTPPAQic2NIddLhYn11L
         wVqxoM7feISxae5U94YKli3LeMG+8PuxeSZLlHjXGvWZ/W3twoQICQVbMSjba+kf1bLI
         K02xo0a1xNJ4EHp5eNWm0Ot7tXi/yRYT4/1xWXZ3hx5px4Csw+tIq33ODF7skYWr9oaG
         Ra6r/74kSO/S+jF0xVNFyGei/UHi/1X6j1UFG0njNgSeplKfASP6IXAul/ztu2QOrhT8
         Wzep7ra0cwnmGpTSdMLekIhe6pyjpExApqQ4rvCs6bzlmoUAbzsfB8Q0L3yQ8lHw9S58
         7zDw==
X-Forwarded-Encrypted: i=1; AJvYcCVCBaiD30Mt2eVPq89APRA47lj4zmGclxRPEMGcJ746IED9W4xaTztQTw/FLYjs1T4Oo/jsjn/AWwyYPRhKCnK5@lists.infradead.org
X-Gm-Message-State: AOJu0Yynnud7H5kGkuCi9pKM/q2judtjM0uCAqrK/0HOr+K204ClTHwF
	QpjHONA/ygx/ufE+WRf6fbHz43eYYgrcgIHqiS2kohnVVDs2qLpVq0unfz3fYFc=
X-Gm-Gg: ASbGnctUMwg9SR2T5kukyR3NFmSz9wVZxxAOA0d9a7vrfq2kt0jNTrbQgFOv7wabr6O
	vB8WrxPGDvphYB5TbdVtL63zGScScMBJ7PMuGLcB2D+mLTtdvStwLQBg66vnWefUxYLxY2kFQrq
	Uwurkbu4byYglAgdak/wv+eo06ACZ40xKo4P/LC21e+WxW5Hw+izd1lvxuouljsCs64UL3NMHbO
	pMtrcho1LAufP0iPr5nnRK9zX226tF8Ck33WVm5clPteY6Zl+CmhfkH0iKPQcXpQnDiQ3lzKQCa
	HJC8Z/j2AfeMpPGjanWx
X-Google-Smtp-Source: AGHT+IHnl+jBmdJsRUXRwBR/mH52YC23EuGVS0vmhx7dq14tgwuSG89//4yrt5azsXLFxS0+HMeVxw==
X-Received: by 2002:a17:906:e0c5:b0:abb:ac56:fcf8 with SMTP id a640c23a62f3a-abbac570080mr510173266b.57.1739884540816;
        Tue, 18 Feb 2025 05:15:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece288e38sm8604786a12.79.2025.02.18.05.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:15:40 -0800 (PST)
Date: Tue, 18 Feb 2025 16:15:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: mt76: mt7925: fix error checking in
 mt7925_mcu_uni_rx/tx_ba()
Message-ID: <5e7bc52b-332d-475e-94ca-571864cb1a6a@stanley.mountain>
References: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_051543_201463_F3597C2E 
X-CRM114-Status: GOOD (  22.98  )
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

Ping.

regards,
dan carpenter

On Mon, Jan 20, 2025 at 12:46:58PM +0300, Dan Carpenter wrote:
> The "ret" variable in mt7925_mcu_uni_[rx/tx]_ba() needs to be signed for
> the if (ret < 0) condition to be true.
> 
> Also the mt7925_mcu_sta_ba() function returns positive values on success.
> The code currently returns whatever non-negative value was returned on
> the last iteration.  It would be better to return zero on success.  This
> function is called from mt7925_ampdu_action() which does not check the
> return value so the return value doesn't affect runtime.  However, it
> still makes sense to return zero even though nothing is affected in the
> current code.
> 
> Fixes: eb2a9a12c609 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index 15815ad84713..b3a00964e802 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -617,7 +617,8 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
>  	struct mt792x_bss_conf *mconf;
>  	unsigned long usable_links = ieee80211_vif_usable_links(vif);
>  	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> +	u8 link_id;
> +	int ret;
>  
>  	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
>  		mconf = mt792x_vif_to_link(mvif, link_id);
> @@ -630,10 +631,10 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
>  		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
>  					enable, true);
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
> @@ -647,7 +648,8 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
>  	struct mt792x_bss_conf *mconf;
>  	unsigned long usable_links = ieee80211_vif_usable_links(vif);
>  	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> +	u8 link_id;
> +	int ret;
>  
>  	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
>  		mconf = mt792x_vif_to_link(mvif, link_id);
> @@ -657,10 +659,10 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
>  		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
>  					enable, false);
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
> -- 
> 2.45.2
> 

