Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3482FD1D486
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBscWiAcWdp/hFnULczKZ/bdY9UUlluznf57AoT+VeU=; b=gIih+hKYepi9FuJ7Vj5JuYhYrp
	F9yF0vbh4+Sv7hAJzX872F1SuHB748e28lysxQp7SaGcdWswTGg5ejuQmXo64P2e/BYcr5TrQDpj+
	FmZPzPoSNsI7WeYqrKnkAhRBQnXwqbFwneIaE3KexPk5CFmjiUabiDDLjW0eeUWUCaB709oR3hyxC
	JC2dcjp9TE6sEBVp6QiGuiJ/ZqnNKdZ5MeBThLr+LkTuW73MOMkoEFsFQK2ZxYphORubI7J+Dfb2M
	IusQ9IKd6Qs/fB/27DgV9YMOlmWt5luYGaRGGMphi14Ov85PC2dpFUF9mTCkFbCHz8wvEIO7cYW0/
	g6TSLnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJW-00000000hgV-1QXd;
	Thu, 08 Jan 2026 19:04:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJT-00000000hee-2LQw;
	Thu, 08 Jan 2026 19:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WBscWiAcWdp/hFnULczKZ/bdY9UUlluznf57AoT+VeU=; b=BD6a4vJXOQQcwp946mh2IuOht6
	QCqrXoCfVvwFYyjRpEyGtotTZjI5gEECIGbVWgYpFVizelst7RqVFw7V6ipRBUFYfFi//vrk4t02L
	lNoyQTwoyh6tdVBIwGrPBP8PfuUrgw6itGx7kyw66jq2iLAcjOai7M3FeJv+sFgRtctCEMgYmLvnb
	x8JqNBdRGMFgDMN3XldtxauDM2KgODhvWrNSBTAwsiCqPKlneKIL76yBa2XnEYfyIwPoF52M62eRo
	KIjeQBcXHdkmxNDvAJrgK/7opHfNwQ3j3hYAUyPcsT2u/A/RapUegEkebxEOeHdfMgMm3QKZkEIdT
	UNqPZt/g==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdvJI-001XT5-Fo; Thu, 08 Jan 2026 20:04:41 +0100
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
Date: Thu,  8 Jan 2026 20:04:36 +0100
Message-ID: <176789904486.3303270.3558903343785181315.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_110451_596031_F7870ADD 
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

[3/9] dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
      commit: 3af0f4d5d433921fa399bbe6396221c8a9985869
[4/9] dt-bindings: display: rockchip,vop: Add compatible for rk3506
      commit: 7919273e495b9154cc7e5f7713f002290f4d9597
[7/9] drm/rockchip: dsi: Add support for rk3506
      commit: cabeacc7eadc2d0033a2fc7304dfb900f9a32095
[9/9] drm/rockchip: vop: Add support for rk3506
      commit: ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

