Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA5AE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZvRA+oMFDnzO5kJBkporl84uyLR6ayPPrDSuzdNaAg=; b=vge1S7Wz03ZMAaw1vyIq7WgxPm
	yJXPzeYA3DxVCSvJseKqh7yWLz/TyLHWhv0egtCzUaDYEPQPj9i8in72BHI87NS5Q6CbdcZTIs1Iy
	uvoe6/8+DlT2UbCINjXCZicY9YyxqgfyD0ue+6g4XGwz4IXU7lyu04wcLrxWYprp6WKwwsOfnGm5U
	WVYoliwg+y+nCo3TTN0JxHZoGyDc+/qcA5pYj3oTu8aQCkufTuB4WWJ9qx+k3QA4FGFYUly1jhUC7
	XmpwLI2sHzs+Cqb4P9JwD2m/HVw9FFOUUDKcaghTZbtym4OXQfa07ZsT/W7zFfAeIN/hJ35TGrvzZ
	iIo6Vz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsohL-0000000AQ5F-1W2s;
	Wed, 18 Feb 2026 21:03:03 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsohH-0000000AQ4h-3D6Q;
	Wed, 18 Feb 2026 21:03:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771448560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fLoug58uduz4BkdTeT08qTKsz+09n3ggNU7/yF1jCzugZqnDAmbZSRS605Ad9XWsvkSKaTMe4P73VaI812fDDUc0kfjkzVZdxnusgYtowZyive0jhivO1QsiIxbeKysISTT/xE5CF5nNf/LAfxe4B4P7dW0c4sjhRCwioaI/JEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771448560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CZvRA+oMFDnzO5kJBkporl84uyLR6ayPPrDSuzdNaAg=; 
	b=Hif/eRewK5dy0bS6Qgqbu635Nl49HbwU4pxTyKN7IzvVef/N280A+y2hxPZ0/EKLx6RbLn+XUES1zjo4OQMHmbQtaUvUXlnhoMQ86AGUhnY6y23/TFGdpFmmNBDCoEWxctqczEQxIt7ruoL6tk4eetr6SXYBSN0rkj5gHmKRHtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771448560;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CZvRA+oMFDnzO5kJBkporl84uyLR6ayPPrDSuzdNaAg=;
	b=Dhb/M57IaKINfTxPYAnPQ7yyHqmL9cQsoQWtbn2mu22+Uk0B1CzhVAOFLOq7i0vb
	EmExVJc/J6Ky4OuC5uGXv4ijrD5n5Pyo9kaeUiJpWWI5JmBJ/H0OHmGWrH2LertUAhL
	GHOJGN/acIzBCPVrLIYNoZB5U6H40xHpAjChwH0Q=
Received: by mx.zohomail.com with SMTPS id 1771448557465284.83992249039545;
	Wed, 18 Feb 2026 13:02:37 -0800 (PST)
Message-ID: <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
Date: Wed, 18 Feb 2026 16:02:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
To: linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_130259_861552_C9D6ABAF 
X-CRM114-Status: GOOD (  19.38  )
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

This could also use a

Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca, feel free to add your Tested-by as well :)

Detlev.

On 2/18/26 15:18, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
>
> Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 770b9bfbb384..fc52149ed6ae 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -22,6 +22,7 @@
>   
>   #define DRV_NAME "rockchip-i2s-tdm"
>   
> +#define DEFAULT_MCLK_FS				256
>   #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
>   #define MULTIPLEX_CH_MAX			10
>   
> @@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
>   			mclk_rate = i2s_tdm->mclk_rx_freq;
>   		}
>   
> +		/*
> +		 * When the dai/component driver doesn't need to set mclk-fs for a specific
> +		 * clock, it can skip the call to set_sysclk() for that clock.
> +		 * In that case, simply use the clock rate from the params and multiply it by
> +		 * the default mclk-fs value.
> +		 */
> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> +
>   		err = clk_set_rate(mclk, mclk_rate);
>   		if (err)
>   			return err;

