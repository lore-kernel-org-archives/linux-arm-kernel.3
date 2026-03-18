Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B4F107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7i7Sts2L5UVBiYhCcyvetXpuxZHpVPukk3YrxttDSSY=; b=J1Vfi8W2pb/j+OEf2Z1FfXM/Wq
	GnRbfVsktYSacVOD+ROycbL26PUgdE5D0ERKjOVIgf4tUNEfF9gXD9skc1155WQcYVMwR22UdIBsx
	5Iw3caf295EnIUKfOHzaLwiXqJhSsn0h9XwAXPUBer5PToMdNB6azvq1EUr6rLmhwbeGP4vnqAsNT
	sd6rqXdZlYpa9PgcH2GaIuTJKmATMiXp2DDODKlFHGWptbLXy+cvsT2RY674mWEzoxoNpOY7PboTB
	28sb2eTJ9kVauaS9w42JRMcQMeKNNZQOyZglDdmD37/8HdsPF65UdlKg7s9ATFGeQZCF3QufA0FOf
	b81lbOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x0E-00000009G62-3iz1;
	Wed, 18 Mar 2026 19:56:26 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x0B-00000009G5V-2nZR;
	Wed, 18 Mar 2026 19:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773863773; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EGzOvcVKwT5yKkqoBnwcXBINCb6R55d1qXgQH6Wov3tqMDz4x67Jf4Yx9KFj+GVYgu1oPqVp/Ern2JFVyz2tntOFiZZVymYOYhsGH5cEztroDDcWD/TTkvSeLBQn+DaDUhZtwUFsLANp5bXsyFS8ZgSQVDZgBBP3rt4rSvFt4v8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773863773; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7i7Sts2L5UVBiYhCcyvetXpuxZHpVPukk3YrxttDSSY=; 
	b=gvgF5IFU8AhXld3iBJj31FH6WR6shbbLgrjSqGlk+b+pohKAD9bqZYNLhQogHpooETETA7THOUF7343nwWuzKxCmUqQIZs01XppIb/9ER5gM5Xo5fjf4UYeLe4gjUzmpYWO++SnUgwdKVZysuNb2GtYyjtPzePcKWMufSJ2prK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773863773;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=7i7Sts2L5UVBiYhCcyvetXpuxZHpVPukk3YrxttDSSY=;
	b=k/X77GIBP4H0Y7nZk0GKcjVRZoVFAPWXzmpNgG9u8alGd67WBrbo51a1BtHCxtq7
	dtEGdozh8h4+jvA4bJFg8I8s++GndCGhfgVdBJpWVrH18+YKOGjE2Urr/EJr3t/zcBS
	egNSG5lT1UwWUr2uYb1pfPbDBq24QXn5SOMZLnio=
Received: by mx.zohomail.com with SMTPS id 1773863771726221.9025611389253;
	Wed, 18 Mar 2026 12:56:11 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Alexey Charkov <alchark@flipper.net>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@flipper.net>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
Date: Wed, 18 Mar 2026 20:56:06 +0100
Message-ID: <14828456.uLZWGnKmhe@workhorse>
In-Reply-To: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_125623_781793_5496F9D4 
X-CRM114-Status: GOOD (  24.62  )
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

On Wednesday, 18 March 2026 15:50:25 Central European Standard Time Alexey Charkov wrote:
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

Thanks for the patch! Looking at where else this reg mask is used, I
got curious about `rockchip_sai_set_tdm_slot`. It seems to reset
SAI_XCR_SBW back to 32 when something calls it with 0 slots. Do we
have to adjust this as well there?

I think what we're running into here is the difference between I2S
normal mode, and I2S justified mode. In justified modes, it'd be
normal to have a slot bit width of 32 but a valid data width of, say,
16. In that case, VDJ would specify whether something is left or right
justified as far as I can tell.

So basically I'm wondering if we've accidentally been sending
I2S left-justified data all along when using SND_SOC_DAIFMT_I2S,
and whether we should only be setting this in SND_SOC_DAIFMT_I2S.

Either way, I can give this a

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

for ES8388 on my ROCK 4D (with my enablement patches for it there
on top that I need to get back around to).

Kind regards,
Nicolas Frattaroli



