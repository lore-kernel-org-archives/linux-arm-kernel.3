Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4901D68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=coFTj0tEVtJeoxqSxilBvXyEBanQAvXPhaWMlmhTwGY=; b=YW285mmGKh8bgd
	HXMnbqzQ55fgS3ia/+OCZimg2fcRNWgrZLwISBg68agyKfYfGDCiFal8+nk4h0knfUich6KMgpL4J
	+RHTVrr60MGs+kzLlMfEFg9vATPWoXJUCEh1mDVwXSZ2iTbW0quLkKvN2Up54rKuYrcIbNuKEBc8i
	Iiur3d9CH4L/AkvogB3iQWf+teBZ57Tg6YkjrjNHr47PQ0QDxJGSdbPlq8Fekq9tt+M4t/jq6c6mX
	QBHmqrBhub5tCizmaLHT4pKMgNGOastnRVjpoUWA65hRAJGCVrv7CnDxz9+elTXe30Xhp0RzwhADe
	djDfy3/KoBQLedGNV0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNSU-000000062Dk-39pN;
	Sat, 16 Nov 2024 18:23:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNRU-000000061xa-3an8;
	Sat, 16 Nov 2024 18:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731781361;
	bh=zuX+BjEd47Ipzf1ZvUKylfVmmbKCdRyf5jawLe5SYXY=;
	h=From:Subject:Date:To:Cc:From;
	b=Zq3gKsIC5JS8Sp48f3xdnKFMZUaNaEtdnbFLPSywsymPzhFlEpF7HCIx+FcqPU+40
	 7lQIr9MFUA9ThajqAD4csskaVLkGO78B5/B3y+qNRHzsuis1hoovc4wfNwDe5pMZxr
	 6c4gC0NR9dedLJ4K9hRX27SkBu/glMnXz/koqI/YiZ28slciehC72n8zAshNbY3q+4
	 eOK88mLFP2h9ZT1oF3JYr0gTXzx8UNW9X6uYZS/3PmJYJ8GvSQyC64zQ23BYv+JsAf
	 NkFKloeM4gke3eTs+fui6IgaBV+eMTHaxqPtsBn9XgkrkOeuMgul4m217jLb3uFlsc
	 VYV1Rp2reZJ7Q==
Received: from localhost (unknown [86.120.21.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 644F417E3768;
	Sat, 16 Nov 2024 19:22:41 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/5] Improve Rockchip VOP2 display modes handling on RK3588
 HDMI0
Date: Sat, 16 Nov 2024 20:22:31 +0200
Message-Id: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfiOGcC/x3MPQqAMAxA4atIZgOmSv25ijiojZpBWxoQoXh3i
 +M3vJdAOQorDEWCyLeo+CuDygLWY752RnHZYCrTEJHF2weDhzulQica8PSOFZe659pS39pug9y
 GyJs8/3ec3vcD9X76MWcAAAA=
X-Change-ID: 20241116-vop2-hdmi0-disp-modes-b39e3619768f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_102245_066651_E68C3A11 
X-CRM114-Status: GOOD (  10.85  )
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

VOP2 support for RK3588 SoC is currently not capable to handle the full
range of display modes advertised by the connected screens, e.g. it
doesn't cope well with non-integer refresh rates like 59.94, 29.97,
23.98, etc.

There are two HDMI PHYs available on RK3588, each providing a PLL that
can be used by three out of the four VOP2 video ports as an alternative
and more accurate pixel clock source. This is able to correctly handle
all display modes up to 4K@60Hz.

As for the moment HDMI1 output is not supported upstream, the patch
series targets HDMI0 only.

Additionally, note that testing any HDMI 2.0 specific modes, e.g.
4K@60Hz, requires high TMDS clock ratio and scrambling support [1]. The
patch is usable but not yet ready to be submitted - I will handle this
soon.

Thanks,
Cristian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-next-20241115

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (5):
      dt-bindings: display: vop2: Add optional PLL clock properties
      drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588

 .../bindings/display/rockchip/rockchip-vop2.yaml   |  4 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  7 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 36 +++++++++++++++++++++-
 3 files changed, 44 insertions(+), 3 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241116-vop2-hdmi0-disp-modes-b39e3619768f


