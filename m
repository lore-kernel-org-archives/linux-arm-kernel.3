Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E6DC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItXzRTAe3YAJR53TnqVWBnr45kYQeMi5ih4t4wpy8QU=; b=ATySUUnPWnLA+xigSN0xClKTVA
	1VZ8TqoWOl9tSZFmA1uwM1ZCd5wB/YH6ZV0O6ii2RRHIK8xurwtICNvTGKfHqGrAyRc+isNguVxWa
	IJtlYG4NBYhX6xL1KRRAuh84EZfaIl8it5dCxkZtQRF8BrVVvQgD6gCkbSNNb12GIqAnjwB3i6dDR
	ZGU8V0DOBFXYxexIGogJ0vAjRJb244ec+t7GZ/fYNOkoanzrDVq+x4fEl6o2p6Z8QtKlj6VpfsTnE
	ceR4A0mCVOFF5cMjnUASChITxIo4/KU6MY19Kmr93e5bAIkHJs0Te4c+OtbtA/srC9IZCsySpDJPt
	OuaBnzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoYQ-00000001mM2-4BHi;
	Fri, 02 May 2025 11:27:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoC1-00000001inJ-34W4;
	Fri, 02 May 2025 11:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183861; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NP8FsQcwINkSxw6/CUFQapTYNkShGd0Ac6MGV0gjXA9IOF2Wb7A3hMq73jlOLG98AUUeBTXTmk0+ks6uGEfoYWQGQuVMdhv9RePHeKxA5VzbI5T8kyaEH2GtHwJey6BPto9hZTf0vmM1miPt5+FCrj4PYV11p+ytAzmMX3EUBso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183861; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ItXzRTAe3YAJR53TnqVWBnr45kYQeMi5ih4t4wpy8QU=; 
	b=WTyjjxAQuJpbK+Dcp52/Sn95QSTsIUORwU1wsFWLOX2dIc00HI9iRvGQtIOX6gYfd7Zs9Wipb18JLU+sRDHWHop2FDRmzQqH/rGoICiJMBFmNC7lnEO/nPD5oT6K//5ZahbWIDgtQAuEBdYUA+WXFy+C7lOCJbHWMbPKJSQo944=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183861;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ItXzRTAe3YAJR53TnqVWBnr45kYQeMi5ih4t4wpy8QU=;
	b=bq85T9isiSUlBqT9xniDJo1kW//3+PY1xkRAGNrTjFytqnXN8rmzpAatF/+aC8Rs
	30rIU4rHJgiCEjsiPTnwgbTmX+es8qf5eJV/y2/BUTLAXBhRgQPSKOvMXIvHzhaaJXN
	A0gNu6rI5Srdwnj3iT55MHuH4GvFLqpytNvQff+8=
Received: by mx.zohomail.com with SMTPS id 174618385945376.26367891615416;
	Fri, 2 May 2025 04:04:19 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:16 +0200
Subject: [PATCH v3 10/10] arm64: defconfig: enable ES8328 and ES8328_I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-10-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040433_834341_90D22CC3 
X-CRM114-Status: UNSURE (   9.46  )
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

The ArmSoM Sige5 board, which is supported in mainline, uses the ES8328
audio driver for audio output on its ES8388 codec controlled through I2C.

Enable them as a module.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 22cf6fb2774aef18c54c2435e4b3ff1b94c1a6b1..c5a3d35e6196029560da4f39a5298c532756a670 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1048,6 +1048,8 @@ CONFIG_SND_SOC_DA7213=m
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


