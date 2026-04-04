Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E0CE63FE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsmbdBHaX2w5XcBqN3gdCMgwy3ayHTGIzo7A1ewMMMw=; b=X5hclVksdGCqgbQ65fqXZniBOL
	xxIP9QsJ7RORbn/CWsqIL2Al+K4IMpl65iVWRpnEYR/TpSaFA0Im1BZMXXauXVrycuRU8HbwmIc0j
	JcIWWDqKd3rwmaLE1xQTSD+KlYr9PHMGqZaD971P2M/aCvjjmnS9CALtWPFaQQxnUR990BTnUJemP
	rfXj5uaLspSXdJCAzGL3i6QRqL4AOTmRpkQgF8fRJNLLY9KJdysJ26nA2Wi1JHfRjzJr3F7+aF/pY
	2EvbcK6imSwNugrffBoRFA8otXNu2iZChgEetxPZr85cf/9GXfdm+1IFvSglhoAZlRA4TMlBKjMjI
	sN1ysovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94bh-00000003dIf-1zEk;
	Sat, 04 Apr 2026 17:16:25 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94ba-00000003dHP-3zYZ;
	Sat, 04 Apr 2026 17:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775322969; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B14SHV11mIeaSdfanRw/FPb/uoYWFTRzLcKOkqBx2gxpmS3EOItjhsgTa54RA5lRgmmkRPyfCaOA9jEuJwzAMloc+GWoId/gZlu/jmSwPXI9Oi0sldlOtQCoyYKO27yPcceKTHsCcTdFbVNjlAA7ZPF/vbWqaiW7p39YdidgRYQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775322969; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vsmbdBHaX2w5XcBqN3gdCMgwy3ayHTGIzo7A1ewMMMw=; 
	b=Xbwm51IbpxbhGx97RqrO2v7dIB8E1prD7Ggl20lmN2NGu2WZGhMgjhAbmRG8u+2HaE6OOER+K+Jo/6I8Od6ITFKUP86jGdBKfHWXSwM17ilvmU3wWdTmoKpMsAc79Pf1bZL/CBC+xBJYqVFxtROxSzkDs9vPcro3W4TLMMMC4js=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775322969;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vsmbdBHaX2w5XcBqN3gdCMgwy3ayHTGIzo7A1ewMMMw=;
	b=I0ii5rAl21pUwmVpjFb7MbBrqCzddD6KhHO2tiwRELQfcAovLb7Xf6ndKxdVMOru
	IUl8il3UOzBzqffwS1jXlhZMuASqAiKdbGe3DHXYundjqlN1T+AOA7GdU7FcuMRf7j0
	UQH/x1olt9ZoWAhw9Q+Bu49SBpiz+IJ2C41tEG9U=
Received: by mx.zohomail.com with SMTPS id 1775322965794133.1766397921774;
	Sat, 4 Apr 2026 10:16:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Alexey Charkov <alchark@flipper.net>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@flipper.net>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
Date: Sat, 04 Apr 2026 19:16:00 +0200
Message-ID: <5445638.31r3eYUQgx@workhorse>
In-Reply-To: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_101619_068222_F51C4493 
X-CRM114-Status: GOOD (  19.84  )
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

On Wednesday, 18 March 2026 15:50:25 Central European Summer Time Alexey Charkov wrote:
> Currently the slot width in non-TDM mode is always kept at the POR value
> of 32 bits, regardless of the sample width, which doesn't work well for
> some codecs such as NAU8822.
> 
> Set the slot width according to the sample width in non-TDM mode, which
> is what other CPU DAI drivers do.
> 
> Tested on the following RK3576 configurations:
> - SAI2 + NAU8822 (codec as the clock master), custom board
> - SAI1 + ES8388 (codec as the clock master), RK3576 EVB1
> - SAI2 + RT5616 (SAI as the clock master), FriendlyElec NanoPi M5
> 
> NAU8822 didn't work prior to this patch but works after the patch. Other
> two configurations work both before and after the patch.
> 
> Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 1bf614dbdf4d..ed393e5034a4 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -628,6 +628,10 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
>  
>  	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
>  
> +	if (!sai->is_tdm)
> +		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> +				   SAI_XCR_SBW(params_physical_width(params)));
> +
>  	regmap_read(sai->regmap, reg, &val);
>  
>  	slot_width = SAI_XCR_SBW_V(val);
> 
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260318-sai-slot-width-378eed5c22cd
> 
> Best regards,
> 

Okay, so I took a logic analyzer to the SAI today and found the following:

It seems we've always been sending 16-bit samples in 32-bit width slots per
channel before. With this change, we're now correctly sending 16-bit samples
in 16-bit slots.

In a follow-up patch (doesn't have to be in this one, this is fine to merge
as-is) we could also refactor the switch statement just above to no longer
exist but set val = SAI_XCR_VDW(params_width(params)).

So:

Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli



