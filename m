Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7E8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGmPNxgIyEoEQtADc8X3nicC6jEVHqGcMDg8y3I/t3o=; b=2w8nZ7q1YmRBqvi6V4TpcM+jDQ
	2P0GmszMWy79asczebB3S0RYXWFMRyjzJDfSk6Q4FogtiWdTHGiEm0Z4Z9dDOYR0EuCXIAcnqgoar
	q2rJIWyOxB0PUghLbtJ6zhgeQmfyIyGcW6xgleuPwDMl7b9SzkCxzWY5DTi7eqCZmAeJHtX5wQIU6
	vQBsATCq33ENQ33am79Ze0kRo6CfRYGs4Ayh+1Z3h/UUGN91oumt9jeveyBIE3hI84krE3P2XuNRH
	zlJEyJi5Y/e3+TUvYSbDJi9ffT3aSmuQ+zcLVS9Ep+Wwtr78ZmPzqykw/wY723Yn7dTet5lbz1Lxr
	BZwkc5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY8r-0000000C1yc-2Bx4;
	Thu, 12 Jun 2025 02:58:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVNm-0000000Bju5-1EZl;
	Thu, 12 Jun 2025 00:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749686457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RfUJLgL3uiMWBMZumyBvXpsPE2UMpPd3FQWhCEKj5YlW8CpCzh8drQyfbMrEH8EI96d+2L11XOX5VD8utD7ZQvI72LE3wD2WqVRCfseYEcpBtT89TeHnQkNROZlE4l4T30nS1s5igLVgQ6v8kOUqwsQ1WQi9yn43D3hkqHIXd4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749686457; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vGmPNxgIyEoEQtADc8X3nicC6jEVHqGcMDg8y3I/t3o=; 
	b=B+8YjO+uqewQPSBMsMZO6HJPPCQm9iq5yZbYGgyvPx9snSvvqPnZ8jtAq+qoggS+EzUENfcIHw3z5Y1WcmVQeji7a1RpZvILe0SwcMk83npw/qm0ZAUqQ0XP0wIKnQV1QNN6DPKM+YkqsHtxkwVDzB9EXxBmX0V3TC9R0hZvKIw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749686457;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vGmPNxgIyEoEQtADc8X3nicC6jEVHqGcMDg8y3I/t3o=;
	b=B89YEpc18TsrakKZypLJ7xGiQ6kWyg6E59pyj89kKZmDWb8r5NGmKQEPYBR0D3Fx
	NOmEBD89GluYxB12j6rZV/ZLix7X6ZnTqRW+Xn5Cg0Q5qqzsIW6u1ft1kCPfBt/+hqq
	pup6vSnHDcfX3ZuwlZ+C2RdyjA7nJpHzR9/gtB8U=
Received: by mx.zohomail.com with SMTPS id 1749686454865928.7893063021048;
	Wed, 11 Jun 2025 17:00:54 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2
 on rk3576
Date: Wed, 11 Jun 2025 20:00:52 -0400
Message-ID: <6011857.DvuYhMxLoT@trenzalore>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_170126_415953_9336FBED 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Cristian,

On Wednesday, 11 June 2025 17:47:49 EDT Cristian Ciocaltea wrote:
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, as it cannot reliably handle mode switches anymore.
> 
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
> 
> Instead, proceed with the solution already implemented for RK3588: make
> use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
> will not only address the aforementioned problem, but it should also
> facilitate the proper operation of display modes up to 4K@60Hz.
> 
> It's worth noting that anything above 4K@30Hz still requires high TMDS
> clock ratio and scrambling support, which hasn't been mainlined yet.
> 
> Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi index
> 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef16
> 7d94904 100644 --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
>  				 <&cru HCLK_VOP>,
>  				 <&cru DCLK_VP0>,
>  				 <&cru DCLK_VP1>,
> -				 <&cru DCLK_VP2>;
> +				 <&cru DCLK_VP2>,
> +				 <&hdptxphy>;
>  			clock-names = "aclk",
>  				      "hclk",
>  				      "dclk_vp0",
>  				      "dclk_vp1",
> -				      "dclk_vp2";
> +				      "dclk_vp2",
> +				      "pll_hdmiphy0";
>  			iommus = <&vop_mmu>;
>  			power-domains = <&power RK3576_PD_VOP>;
>  			rockchip,grf = <&sys_grf>;

I tested this on the ROCK 4D and can confirm that:
 - New modes like 2K are now working
 - Mode changes is now correctly supported

So,
Tested-By: Detlev Casanova <detlev.casanova@collabora.com>

Regards,

Detlev.



