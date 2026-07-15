Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=; b=SPHGyPitmsJisL5tActxHOXXPY
	svezy8qX7rSK3yJPL3bWuLw1vUZ0bS7tKRBXa67VHJx5yff5BeaAOsqEzjWgS8jysxgydqDG2PtUv
	sjWD8OXVbaVGwi88AkQ2ccwpV7VPliItZXm/7fN24yT5UUw/tDVskZXUPmd9/lL7xOk6u0JHyS5jh
	Rg5YpqHfQFi+ekYCh1MRACr9Fbv/e/eoGRsvS6qb1kd7t6bjj805/X+ZS289J7/tGy7tJSUKsVnI4
	VqczqvCJ574Z347PVBNgfxHUyUR9nvdTkA6ZfIhKmVS7rUS8VilFaftYHA5lt7fINItQp1i/zO9J8
	Iiz9MTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzsk-0000000EyWs-3Jgt;
	Wed, 15 Jul 2026 13:42:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzsi-0000000EyVf-1gdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:42:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso5168531f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122955; x=1784727755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=Qal01h+fgCXpMHWkUzFr6LzWA3d9TBUByDyBdFtjlC8mVVTBF2NduOAZ79+7QyT2yo
         Kalmr/2OCLlCc0ssWmHEx9fyiV6Gz08LzaVTXVK5xCw3CSWOn0LRgLRVzGqDiFSbM2Ox
         qYiRuMA7SUA3VBvu5RQAl4gZ6kD8dWcHwe/tG7/nl8qp/6f/GRh+Pkrz9/iqJPvqueUq
         FU9SuakRXvcvFDHhdcWQoXM8T0EJsqzAqkJbLHZnGceEj25+R+DbBfEcWaWKF0K43t57
         ogB4uZ/K5kb0O035hjxGyka9PunLBaPCfd2awufIsw/wqbCdOE70+v6CvstYE7F++gFL
         N/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122955; x=1784727755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=qS+fgZsfTCR+3bRk3kkCH+xiHQdp9VFl4L5UpkBdP4k8zjVO37W/IPtX+xuhLwnRov
         8m8zsgeIlmabEq3C4ci98dMVJaUkfcvVc3t/XW8+7WRuRvxHpdwiIEk4po44fnxL1Mmx
         e0HvOKGcoSSd4OqrgPHeakj1/KS2e1UajiQldEHcDpGwIqrSDPL/4vIV+8n6RkMSp7aC
         GkMd0Iz9YKAUqW+G5PXLVrAQQEGl7k33ILg/fWfmnNxATz3kk4LTQczqLJyMCHeKsZbD
         uIrHIqnwzvYCZZWB728ObPofMTo9cWg7o6lYLjaP6c/FNK6WOX8P5SEUgqW5DkYd5299
         Vscw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/6j8GGvBMx/ti1VM0UnjhxI17euVW9Cky7jpX9xeMEJbC6JgphAYbRP5rqkJ2RTTtEwBu3AHFn+BFF8nrxToz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5trCuOIwQ9AoD8/KJkFDlFTbPDv9r5cyy2bOlMsu96KxojhF2
	ASoXeilshSTsA4J/eK3sZLUIs6oBAFmV5UC3H5BFVJvFPdu8ivlAZHv9
X-Gm-Gg: AfdE7cmLJzDR522Mdc3Uahaj02IaY1STgZ1xO0cI7Hi3Ft7s71lfgWYIZHlcYsacB9a
	JTVyU76rE3c4V2fYDF/+FiTeil6bsFt1FZcugOUKb7TZEEFGQhsEou6zk5eTR4uSD7cf5WzoHLZ
	LpwGgts539Pbf7SpMaJ65NgHNVNfshXQcFWamZkU0oWC6SjzoYd3MWJnwHWN/mKbe/xbBcnPU20
	aVk7al4t3UVb+GmMONkN9LpmDvqjS9zkV2C5QJTvybSwd/lYFUdZ0OfZrk05a/BCD+qKU0kfpKL
	2yjNL+gJ6vU1Eq/NoKK+0RIsNz4lXq2jgkinxTMqBetfas33ezaPI2cjCgIQb5YxdBVstizTw/J
	GlnS3IfC4LrVL4r+k+ntPlrVU1YSfjqFQnhINvNJhYLOB95CrxgoX12qvGltrxk2wYVp3t9SLzP
	uCN2hTXHZe
X-Received: by 2002:a5d:588d:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f4fcd5726mr3441593f8f.14.1784122954301;
        Wed, 15 Jul 2026 06:42:34 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm14509548f8f.21.2026.07.15.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:42:33 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:42:32 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: tungsten-smarc: Remove unnecessary
 cells
Message-ID: <aleOSIBFeJ1bcx9Y@owl5>
References: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064236_462076_F0048F1B 
X-CRM114-Status: GOOD (  18.90  )
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

On Thu, Jul 09, 2026 at 11:20:21AM +0200, AngeloGioacchino Del Regno wrote:
> Remove unnecessary address and size cells from both the disp_dsi0
> and the xhci2's ethernet usb device subnode to fix a dtbs_check
> warning for avoid_unnecessary_addr_size.
> 
> Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Gary Bisson <bisson.gary@gmail.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> index 9f5a0ec563e8..8256279c5629 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> @@ -265,8 +265,6 @@ &disp_pwm0 {
>  };
>  
>  &disp_dsi0 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	status = "okay";
>  
>  	ports {
> @@ -1049,8 +1047,6 @@ &xhci2 {
>  	ethernet@1 {
>  		compatible = "usb424,7850";
>  		reg = <1>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>  
>  		mdio {
>  			#address-cells = <1>;
> -- 
> 2.54.0

Out of curiosity, how did you get those warnings? I ran my check dtbs
command on v7.2-rc3 and couldn't see anything related:
$ make CHECK_DTBS=y mediatek/mt8370-tungsten-smarc.dtb
  DTC [C] arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#

Thanks,
Gary

