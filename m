Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BEBC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZYjlvHWhsCFbTVMTyb8cTSAVbkVmmAdMlXC9nbF+98=; b=xO4xvstjOQ9mu0jJcjxp5gcM5c
	X3lmbhvx4t7wn7xEizcXNd6zI6QJ/0QMpXLWlPBTalO1pcEAAoWcHTGnjRs/lFuaD4JKPIkc4sRtO
	1whmVsoe38Se+DPK/ZqgMUOXw7irzXnj272tmh0VrRjzwu1IX3wi4qs8B9aLI9idq6zrL5FMfF2h5
	7LT4CkgHO2i3cAInPCyczz63UFe962JoedsQ/IZEJm89iliB1eQh7cf+ucDxgXQtBa7BYfHytETkp
	ci09yv3nUtrIrjIvBtm+W1uwrdvp75aNRukXiMMONAyziezYqV/4PyfrmLAS5JDgTsV1r0LO67pmO
	nEiZJdHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8Ko-00000005yn0-0sdi;
	Mon, 17 Feb 2025 21:07:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8JK-00000005ycq-2NRM;
	Mon, 17 Feb 2025 21:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739826348;
	bh=xkZ5C4RRw8ad7q0dz3o/qbGl9MzaFXUgGSXYjVbtOWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aW7ol2iPEM7YU4BSPBprp8cFl+Z+UAF9wru33YLobNMb8LuCedfbT7PMVqEmzXoyU
	 Eclj16zUhqKuxwm3uLMCCys4gwKc/0i2pW+c4P90BPtmO+xoTL5XEvIge3ao9kQiNS
	 MgBIMevZaTq1raoHsKuPfBCfwlfg2xoCH1FgnLV+aUcggUynldsC7Eyqz5Yi3aUCxa
	 lo1Ofo/arQLiv05QrnCkiOuosBnspOrefc/NRapd23xkwCy6nhRsc+Qejg9NMBAcI+
	 neyhVGRHgcCMr/bd6B3C5xPxLUcRpA3Sw6TV+EBS6iiEz/6WYUkXc9vO09t5SvcRlT
	 2S0h2HA3zVlyQ==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85CC517E0391;
	Mon, 17 Feb 2025 22:05:47 +0100 (CET)
Message-ID: <83e0afab381fe2580e4c75fccc62cb7bcb546369.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Fix AV1 decoder clock frequency
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: stable@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, kernel@collabora.com
Date: Mon, 17 Feb 2025 16:05:45 -0500
In-Reply-To: <20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
References: <20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_130550_758597_0D9C1F5F 
X-CRM114-Status: GOOD (  22.99  )
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

I'm sorry for this bad send, please dismiss.

Le lundi 17 février 2025 à 16:00 -0500, Nicolas Dufresne a écrit :
> The desired clock frequency was correctly set to 400MHz in the device tree
> but was lowered by the driver to 300MHz breaking 4K 60Hz content playback.
> Fix the issue by removing the driver call to clk_set_rate(), which reduce
> the amount of board specific code.
> 
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> This patch fixes user report of AV1 4K60 decoder not being fast enough
> on RK3588 based SoC. This is a break from Hantro original authors
> habbit of coding the frequencies in the driver instead of specifying this
> frequency in the device tree. The other calls to clk_set_rate() are left
> since this would require modifying many dtsi files, which would then be
> unsuitable for backport.
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..9d8eab33556d62733ec7ec6b5e685c86ba7086e4 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -17,7 +17,6 @@
>  
>  #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>  #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> -#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
>  
>  #define ROCKCHIP_VPU981_MIN_SIZE 64
>  
> @@ -440,10 +439,9 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>  	return 0;
>  }
>  
> +/* TODO just remove, the CLK are defined correctly in the DTS */
>  static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)

Obviously that function is meant to completely go away, got distracted
and sent the old version.

Nicolas

>  {
> -	/* Bump ACLKs to max. possible freq. to improve performance. */
> -	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
>  	return 0;
>  }
>  
> @@ -807,7 +805,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
>  	.codec_ops = rk3588_vpu981_codec_ops,
>  	.irqs = rk3588_vpu981_irqs,
>  	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
> -	.init = rk3588_vpu981_hw_init,
>  	.clk_names = rk3588_vpu981_vpu_clk_names,
>  	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
>  };
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
> 
> Best regards,

