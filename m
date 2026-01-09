Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC970D1680D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwNEC5AE48ylOMzH/SaxYiiWRV8yyduKiL7IIFn5vPQ=; b=OqLqWcQHx0dlXetMLg+VHt94Wq
	oNQ46BXGWBBKidDZ45Gsob/EQwfMv/amjPN37gQcv87Y1a2UxVt8pxmJPEYmf5ufv194bPYdV38oP
	bgorUahJJi6nt1yTIQktWXNq/iGrNbNrRbrbFTqgE+xVFrZIC7LOVnOoCexCW8ZTjsibAgwxXYR8+
	psn6NekHqjGvX3NPGnZAnFsCHlp4LmNSdHAO9c979/30nV/NH5zH0adjtBoETtlBn1tLSgsdxRe7o
	AxoKeSmJ14RcuKFHB46jpM/yEI4Fi5DiYOheB3H8C6Y0ioIS7sSQOIX6LIEq7YJ+09FwnlIwt+3Tp
	rzD+FosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veA68-00000002A83-0Zyf;
	Fri, 09 Jan 2026 10:52:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veA65-00000002A7E-0kGP;
	Fri, 09 Jan 2026 10:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gwNEC5AE48ylOMzH/SaxYiiWRV8yyduKiL7IIFn5vPQ=; b=AAPEsk+x52EH28zA0vBkkdtnD0
	gtzr8zwh7ggSOviJHCy00uEidTwGJ9NiNSlHjy07hHzJWNr5A3LYNk9x0pIgilL0akDhudvP6mUQ6
	mpEoCN5uc3KLpLSyylxKzXBt3rOd9Zp8gdQpOcwsUKhcQ5F6nT23e3CRTPOoTmJpxhbcxzKgdV2Qb
	Jemff9KR/SxTqpZjE77A97+V+7cf+1nxp+NAG4H3ABl+OAKdcHxEqUTwtXsvtZcnh3O9SfMWhqJrp
	rXx7LpSnch/5kkjERnB1XfpH1WOzU1NfOH/rK6p2kyO8rcmGLpfc+c2JCH2v9A6ZiVJ/ub8r7o4hx
	vJjMZieQ==;
Received: from i53875b6d.versanet.de ([83.135.91.109] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veA5k-001cYs-6Z; Fri, 09 Jan 2026 11:51:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506 VOP
Date: Fri,  9 Jan 2026 11:51:37 +0100
Message-ID: <176795589082.3371389.9844187707084142114.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_025201_528767_C78D2C50 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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


On Thu, 06 Nov 2025 10:06:23 +0800, Chaoyi Chen wrote:
> The VOP on rk3506:
> - Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
> - Support RGB interface.
> - Max output resolution is 1280x1280@60fps.
> - WIN1 layer support RGB888/ARGB8888/RGB565.
> - Support Gamma LUT.
> 
> [...]

Applied, thanks!

[8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
      commit: 0244539f9a4f3b564604dfe4d639f61cecec381a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

