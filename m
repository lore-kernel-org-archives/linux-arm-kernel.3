Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D88C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 00:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iCEz0AagR12EsDIb18ri3ctkS2X5IJ5+u6OHAC1byWI=; b=FQvUiLQ5Uh7wc5
	fQ+RjOLslOm0QNHjA21qSDFkvroPgLHuxb6dqgWQZnvcSeY1jHIoT6RoeA5mCSM/bnPWQkYZe5Rdx
	x43xqeon7P8cGpfWjo5VaIv7y5MzzFhK+EYD6InPfRIji1Lbs7ecyGC2xHav9raqTMJMoqbFm6CVJ
	kYrAx7LVbKk/oJq/unv+R4OSjpbwxEoUumUmNEb1j7i+wakHv5Z0Y97kVuCD7nMdrppwpNA7THbJK
	PD0lAU2K8BQFC1GKa69xaMAfiEa29yEhE9Rm2YJsrLz3qfmSPJjJE0ZzPW9E+8++QIznWwB2td7GK
	QSzkhfzgClZ9ELMw2jEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6Uo-0000000GfTY-05WB;
	Sat, 15 Feb 2025 00:57:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6TM-0000000Gf1a-0VL1;
	Sat, 15 Feb 2025 00:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739580953;
	bh=nIXcpxIUSKHDj4yKjrFu8Z6Y37bAcj6b8+fVzwIrLgY=;
	h=From:Subject:Date:To:Cc:From;
	b=QWYreGa/6yH2TXVLCawRPa35+LxXk1hZym5F2VlQ/OyTS+GV8svkU/rjrS39UK8Mk
	 4Sq7DqMdekxG1Cthb89kmnzRgRt3PJ6CHaVPKm3sQ1+gI/0/svXob35j6BFjADRuEx
	 1B5+KfOda3u2ens8t/F5O7sxoeq/ZPrmGk7cCLon8fhAOjx9jHqgse+d9EWZWs6kuw
	 GYymbHStNxvxdHakffxSE3+dSlIkI4iyEaks1mH6x7GBI7BcFopC/Qx4oRXZuCtDKa
	 Hbj8/d+5Q2XxFvx7kMX9sRLCN9B+9J46DlleRinvN1d7u5/DEUUXi+KcqGhkmnSUWk
	 PlqX7CTWZxZ/g==
Received: from localhost (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 613E817E0239;
	Sat, 15 Feb 2025 01:55:53 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Improve Rockchip VOP2 display modes handling on RK3588
 HDMI1
Date: Sat, 15 Feb 2025 02:55:36 +0200
Message-Id: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjmr2cC/x3MMQqAMAxA0atIZgM2KBSvIg7VRM2gLQ2IIL27x
 fEN/79gklUMxuaFLLeaxqvCtQ2sR7h2QeVqoI6GjtyAd0yEB5/qkNUSnpHFUILn0JNfVi9Q25R
 l0+f/TnMpH1L0CLVnAAAA
X-Change-ID: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_165556_327062_3AE235CD 
X-CRM114-Status: UNSURE (   5.95  )
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

As a followup to getting basic HDMI1 output support [1] merged upstream,
make use of the HDMI1 PHY PLL to provide better VOP2 display modes
handling for the second HDMI output port on RK3588 SoC, similarly to
what has been achieved recently for HDMI0 [2].

Additionally, enable HDMI1 output on Rockchip RK3588 EVB1.

[1] https://lore.kernel.org/lkml/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
[2] https://lore.kernel.org/lkml/20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (4):
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 42 ++++++++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi   | 22 +++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c     | 26 ++++++++++++++-
 3 files changed, 87 insertions(+), 3 deletions(-)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e


