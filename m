Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D708C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meVcx23r/r7Dytz72YqeRZuHInvAetvSfHOgo60wpy0=; b=oKfpyzK53LNMTzL0LY/qcP1Wnq
	VpdgR1TOmgQPnZcGZnqPlS3NdewV1X1CMaxkNwgZHAWs2u5MrXn2Ph/d+TLSirGD45fNYddiJw2l4
	xz/2V55KJthkuWHSZZ+UnnHCjUtVA+/O2mdfTBhZWB0X4+MDez1AfVzRcSEIkzGr550MO04APnmmg
	aDRj1BP4tH83vW5t+lm4dD5AKgJP9E+TsCf7gjzAF8JHBZBf26kc+yl94klyFVrtfzb6/ci4yRreP
	O1Tg7sEbh+iI8F1atFhmgDznNKfdG4IdV1q70mm4BhP1qqMnISp0yJWGGt6CoXPyOgXUdFMCfPUUR
	wKPQicXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneE9-00000007alA-0NcU;
	Thu, 27 Feb 2025 13:47:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne6E-00000007YtG-3wXS;
	Thu, 27 Feb 2025 13:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=meVcx23r/r7Dytz72YqeRZuHInvAetvSfHOgo60wpy0=; b=GFEjVF6ZyupV+W2QCWTF/Utl7O
	OgQTRNZSJUwppxQptsnxIyzoPnuntHdT7WgyzUD4CkcAl6USJGFTmLpdZ/tz74XVbyfjBeK5PVB8y
	0hNKQaRQzJYxypYzSM1xgSOFhfX6CZ+UuUetDCtXpKz8ueb+DuvP2mWQfsRLeJ4cLM0HJAwZ4PiJ4
	vUooOewyVgpD4ivZJyI6I3cOiMjwSKjWewiRIcb7U5FZAVqdfbNMsOtwjayDkOg4dkM0TcJ3g9tSv
	pEc7yNRYplHFBKsFXE5hpDqZLN08+/MRsbFu1tFadAfS91BTShdk8v1jVlLuE76cWtgaWbmdgPtBB
	2JN7VILA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tne5Y-00018T-RH; Thu, 27 Feb 2025 14:38:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Algea Cao <algea.cao@rock-chips.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
Date: Thu, 27 Feb 2025 14:37:52 +0100
Message-ID: <174066344874.4164500.18360075305644085277.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217215641.372723-1-detlev.casanova@collabora.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053851_002064_A69A2F94 
X-CRM114-Status: GOOD (  13.82  )
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


On Mon, 17 Feb 2025 16:47:39 -0500, Detlev Casanova wrote:
> To support HDMI audio on the rk3588 based devices, the generic HDMI
> Codec framework is used in the dw-hdmi-qp DRM bridge driver.
> 
> The implementation is mainly based on the downstream driver, ported to the
> generic HDMI Codec framework [1] recently merged in the master branch.
> The parameters computation has been kept as is and the data stored in the
> dw_hdmi_qp struct as been cleaned up.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add HDMI audio outputs for rk3588 SoC
      commit: b8c6c136971c0e9750eec89f367529b2854d3a3c
[3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
      commit: 97aa62ed1e970bf8aa9f57e87c946a95fa3d5bef

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

