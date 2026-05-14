Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9820FCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ty7xQVBkxYvA7gd3Cpj74EQLYaFDpk2qfLe9hIyyFro=; b=rAHO0mbxnlVT5mjA5ygMlXGX6j
	ApAAds72gfxfRqFKHUQ0vx2F6BWRTi0B4nxyMpeO0V1LlQWJ4WpKhvK2GhvSXW8Os3bIL3aOL64zq
	SC/fccfSYhqGZnlD5wnRcvtcs6iGepJMmYHa4Zi+htWpNIK6vtiCgBqGpkni5MS5kfbWWnxmWs2lE
	Kc7mKc2WcetinS9y9TEwew8esQQj3BAvOTBxMX82ofHLL7sIiDsXiNDR3qFdw8YRgcyVnO9HdWm2U
	LFYJuQxfofiaA0tNUiW5/kUFOaXoHpkR3bM4/B5MFbWTW0jtxq1NCMo55x/NShrycyagur7P+IVQD
	idZs17qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSue-000000058U4-1ST1;
	Thu, 14 May 2026 10:03:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSuc-000000058Tl-35rq;
	Thu, 14 May 2026 10:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD4E760121;
	Thu, 14 May 2026 10:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E16C2BCB3;
	Thu, 14 May 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753005;
	bh=eU1EYUyxKUydlQNJ+xAxAssRfVy3MHIEswP/6qw7geQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjRggEcJoBqqvzhAfk8uDlGzbN+fWIEB6v9ayYO/nj6a0TGULZA//piez8JarOJjL
	 QGd2G0jTgrkp7UCh1FI/NYiYPknn4sfrluQi+c3KkHMOII6jtwkFtgkEgdIa7UlHwv
	 i9XrOj+t1VihC1qq2MaMankZACs8/fK97sDtFI4zWQ05VYwXIwDFkcLCXe2vqzi9Ua
	 dXawt8bbnTX9W1PD2nE/Nzo7OumP3goQJk8WbroACgRKDEOKywszgPwg4LKVJOkQ3W
	 HxcafGHjgtPVJWLEgJSqgirVk5PtxP26mGLuR4a5pLZ81urqyPvZ7PzDvz0JTOTWKI
	 KzBB/NcWSHdkg==
Date: Thu, 14 May 2026 12:03:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com, 
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
	dianders@chromium.org, m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260514-elegant-agate-pug-449ec2@quoll>
References: <20260513074414.2053435-1-damon.ding@rock-chips.com>
 <20260513074414.2053435-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513074414.2053435-2-damon.ding@rock-chips.com>
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

On Wed, May 13, 2026 at 03:44:05PM +0800, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 (video output bus clock)
> to access the VO1 GRF registers and enable the video datapath.

To access GRF? Then it is the same clock input.

AGAIN (reiterated soooo many times by me): you describe here clock
input, NOT OUTPUT.

> 
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
> 
> Enforce the correct third clock name on a per-compatible basis to
> standardize clock requirements per SoC. This makes the clock
> dependency clear and removes reliance on implicit clock enablement
> from GRF phandle.
> 
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index d99b23b88cc5..8001c1facf98 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -23,10 +23,7 @@ properties:
>  
>    clock-names:
>      minItems: 2
> -    items:
> -      - const: dp
> -      - const: pclk
> -      - const: grf

What is 'grf' clock in such case?

Best regards,
Krzysztof


