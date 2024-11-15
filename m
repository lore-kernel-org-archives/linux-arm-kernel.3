Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB7D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8OgLECi2MzZsuLHWKXzJxOoaKR0j3CLKXbFjs87K0A=; b=momd5IUH8lGQmxyiRClqq8bs5f
	0Y91wlt8iePUeO0CdUmnuvPj21nq81aIOxJ4E3V3PKnCS5u3CKQY7o4aDaKAMr06v2Y8H0xGITKde
	y75zF6nHAxDMeQ4ZyU+5rPmXXIutTI5P8fNgQItiLb7Y+ntchhWlgQWtlMJUfT3rhfSs1RJsl83Xf
	huWVv4+1GYG4qPDJ9XsA9Hvj1otyQmTRfW1WFAYTMrqiqM6XNSsd+DMAOeOQAo5ZhwSG/7+6Ge/VB
	25iMYPI75Mw06Z/jaR9/0EI9svbd6BKX9tHHGnQFGZpdi7NtJhEIKuwmboJgl622eKCNH2O9u1wjG
	eZwYhh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBroO-000000023UG-3oKQ;
	Fri, 15 Nov 2024 08:36:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBrnT-000000023Kp-3ktu;
	Fri, 15 Nov 2024 08:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w8OgLECi2MzZsuLHWKXzJxOoaKR0j3CLKXbFjs87K0A=; b=H4wn9NmrHi9wGBUh0ZpeZIP4yG
	O/OfEgazN1CVhu0ANGgMMdfF3dkkI+s6IaOdz/U7FBu/KnBOymcEFwb+QXo8Frnah+iE5wHycU+dZ
	5Ydl+h0u9cwrjHF/q/nGdisjH1ST7orjL8eS/CBAzMQJdFd6g2TWfcVN4wiVLJ6rruvn6xfcH5sSf
	pggH4+Zr5QPpOr/MbiCqoAQzgQxrZMKunZ5OqfeGzq9BYLMISF5WRCn0hLkl7D/8DqgkjyAXhLBFL
	QatooX0HDjyNdnn+ONAj6zIt4tTLJVZk38Bk3AOjqZ4CqfsvCZNcrk8S9eHaAAh1qfMA75qUzNLMw
	iJ3r6fYA==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tBrn1-0000Ns-Vn; Fri, 15 Nov 2024 09:34:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 1/3] vop2: Add clock resets support
Date: Fri, 15 Nov 2024 09:34:50 +0100
Message-ID: <3346283.VqM8IeB0Os@diego>
In-Reply-To: <20241108185212.198603-2-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
 <20241108185212.198603-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_003519_950923_742E1E5E 
X-CRM114-Status: GOOD (  19.74  )
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

Hi Detlev,

Am Freitag, 8. November 2024, 19:50:39 CET schrieb Detlev Casanova:
> At the end of initialization, each VP clock needs to be reset before
> they can be used.
> 
> Failing to do so can put the VOP in an undefined state where the
> generated HDMI signal is either lost or not matching the selected mode.
> 
> This issue can be reproduced by switching modes multiple times.
> Depending on the setup, after about 10 mode switches, the signal will be
> lost and the value in register 0x890 (VSYNCWIDTH + VFRONT) will take the value
> `0x0000018c`.
> That makes VSYNCWIDTH=0, which is wrong.
> 
> Adding the clock resets after the VOP configuration fixes the issue.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

patch subject should be "drm/rockchip: vop2: ...." please


>  static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  				    struct drm_atomic_state *state)
>  {
> @@ -2057,6 +2079,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>  
> +	vop2_clk_reset(vp);
> +
>  	drm_crtc_vblank_on(crtc);
>  
>  	vop2_unlock(vop2);

this conflicts with the merge gamma lut support, can you please rebase on
top of drm-misc-next? Or alternatively just tell me if it should be

	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);

+	vop2_clk_reset(vp);
+
	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);

	drm_crtc_vblank_on(crtc);

----- or ----
	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);

	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);

+	vop2_clk_reset(vp);
+
	drm_crtc_vblank_on(crtc);


Thanks a lot
Heiko



