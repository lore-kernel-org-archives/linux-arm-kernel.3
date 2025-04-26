Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920D1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 22:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzrNCfIbltJDUh80KeXlbQkeQ/0zkPnKqxcq0vFHnCk=; b=cVMdCUx18fxPqNAqLoep7i0z7V
	vfSY50OZhkUqLs4D6z19AQGBAWvMB82hXKISb5gewbWnvIzvMQd5dpEp0U8uAZHvrxLR1h858jRU+
	y4hFOh/0pMefOSA8V89rda4R+2ztuc0JGXsIhCrQjxPqb6CLpgUzQRIZcXzVMtHx4Me95XRlywet4
	XruC+wOdDJ5MNm3p7P323nTuelzQrUwk3csscVmuXSK4l/LH3f813Ab9I/CPJOIl101Ha7FBa+I3c
	GZwm6eGx5qqyhRI8KSsMAfPVYez1m5OPWGfcPF247fZgpFl0DJ1l0qdCDkQ07xUc9+J64extPi2X0
	EdrDJPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ncT-00000002Z1S-2vod;
	Sat, 26 Apr 2025 22:03:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nMD-00000002XOY-3wuf;
	Sat, 26 Apr 2025 21:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nzrNCfIbltJDUh80KeXlbQkeQ/0zkPnKqxcq0vFHnCk=; b=JQtUD51fZGQQxc8ThllDYRda/J
	UsYh90YKpgmHy6rd9JUOG9a7+SmcJR5UnWZ51MWF2l8hTlfGtV6phO5NyLN/qVSKNi4HU4BrRdbAA
	3dnXjheeTjG30PyUATW7xQXKD4PQZ18OvqlXdKb7BvV7B6/e9lFI7q3DehiofZL5tm72sBfbMYfl6
	/fDi/XafR845N/ZOXejcqVDt6npFcjfBk3vOm+6N9ti6CAkYvmdsbQjFG/EGnAmkRyLuRFoaqvvSs
	Ntp886f6adFTCfffJ+UaOSsyZ9H7o24mifmqjNIVSDHRqemOnHT8WyFmJHIk8H7j5drkcraRTqOZp
	Rua6IaAw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLr-0001OR-W1; Sat, 26 Apr 2025 23:46:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for RK3588 EVB2 board
Date: Sat, 26 Apr 2025 23:46:11 +0200
Message-ID: <174570370119.31943.10378973370072965130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250418014757.336-1-kernel@airkyi.com>
References: <20250418014757.336-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144645_974664_EAF27362 
X-CRM114-Status: GOOD (  10.41  )
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


On Fri, 18 Apr 2025 09:47:55 +0800, Chaoyi Chen wrote:
> General features for rk3588 evb2 board:
> - Rockchip RK3588
> - LPDDR4/4X
> - eMMC5.1
> - RK806-2x2pcs + DiscretePower
> - 1x HDMI2.1 TX / HDMI2.0 RX
> - 1x full size DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - WIFI/BT
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
      commit: ebabb3cdb89eee8853157a6daeed9d3f5a46dce4
[2/2] arm64: dts: rockchip: Add rk3588 evb2 board
      commit: 013dd238a822c940e056504fe644bd0a38c5d806

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

