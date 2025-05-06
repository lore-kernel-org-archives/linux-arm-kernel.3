Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgAJkWKMCMZiD27pHL8mQDuaU7z5D7GDSVmanYuhkI0=; b=AojA6oGU3VXw2hjND4RxyodMfw
	BQH9g/ILkLtrz0QlI9mxxm6YQSLF3Bqp3jnGPLz6A/eW4DkD47hBoH4VPidkWyTitkHYPOZ/g1aoc
	o93pD5lRobPW/2R7vZLMiYJHGsv9Hd6Umks5TJYqa2mbepUYYYzs2Oz4rMh5sNyV242eWRBBlJXLI
	Qjtv1yNVtXVqdHwJ8bcjINzMRTyFeWoDpkZUGo4s1CcsgMzJLiUfPeo0YOhENK34eczT8BJttYIam
	nXPp5mAplS4GJYK0cNsvk5XmcatGd66wIPPJPfuysEzX3j4vt4SEQkSJQBSHwMx0gQ5Vc+NynqXG6
	RZ6+yesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI3W-0000000C2O9-3RQq;
	Tue, 06 May 2025 13:09:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFlx-0000000BbiF-2WdK;
	Tue, 06 May 2025 10:43:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746528204; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iKuUcYPrIt4A3j4GRckvn6OuopOvq0w0w7TvCCZhvHcECt8sLgrmsZQd3NSpVuDrgJNNHAE/5OTLrKHj2U5uu5tOAGoUbI98DQZnMBA4ci+aD1KSYhxPDWoJP+SxdcqvA05//HhVDmKSI+8ZowFbarnJGrgdpZ7T/Bz122TmJLE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528204; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UgAJkWKMCMZiD27pHL8mQDuaU7z5D7GDSVmanYuhkI0=; 
	b=FVZXOzR2kRcKcWeC7uSn3YYNXV2Gi26WyotRYhI8R8FMGz/Ht8sQVn4LSoDfEml47m4bGOPpWoJwNXTiQ9yvK4Ytlt12ctOM1F000s8p/mjZ/WjPsP4zrc0K3+VD9VxvcuZMG7HtaVrwn5LuzI3NUxM3Db9tsQsXwKp7POaMCz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528204;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UgAJkWKMCMZiD27pHL8mQDuaU7z5D7GDSVmanYuhkI0=;
	b=e0K9hppJwiSY7g/ApKXHRTv/TYLOJ3FRJpAqdGpnKcFSFaMhg0XyaXPQ4qApECan
	lMJWZck0shNnvE4hAhsO9BhKsfnpBNiftHgYGMEzPNqrtAQoMiHECztbGmObc+hpReK
	vEdjosWz2CyV2qjRDyQeeDBZa2ZK7zlIj9wbarno=
Received: by mx.zohomail.com with SMTPS id 1746528203603146.97246046476903;
	Tue, 6 May 2025 03:43:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:44 +0200
Subject: [PATCH v4 5/5] arm64: defconfig: Enable Rockchip SAI and ES8328
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-5-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034337_704271_9DF97738 
X-CRM114-Status: UNSURE (   9.80  )
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

The RK3576 uses Rockchip SAI for audio output. Meanwhile, the Sige5
board, which uses the RK3576 and is supported by mainline, uses an
ES8388 codec over I2C with the ES8328 driver implementing support for
this codec.

Enable both in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 98ad22833282596abbe47acb467464680c2dbb80..c960271e47c1370e5a5c947a40835e5be4184c25 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1010,6 +1010,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
@@ -1049,6 +1050,8 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
+CONFIG_SND_SOC_ES8328=m
+CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m

-- 
2.49.0


