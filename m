Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5DFC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOj1gvys++1vuc8gyd5QWJQk4lQix65qolwlNepUxuc=; b=iNl0cErYq5xrIa74mOvXTZmLOY
	xwp2WQGdg+RY+phiMVhvZJBt4HqfwdXWt/86mRc7OtFA8DPEzJgPRfqVBVNcC2ZcsVNI6qg+2m20I
	NdVRu/KeAdB6L+AvWd6aKiPi/zpY+Piym7H/qTDrzx3uhXJGd+LVohMQAtwMJbR6AHeUnMfyQMAUR
	eE+Yc4TzEV0g7mZcVFnXBmKTuaZpYYl3zaDzh7VpLrBG/N0dFp6cz55NqY06Aks79yTF8RNsGh64d
	Soj9XJov7R4BZI912g5Zgdq6qaaccF8lbR2gDudYXaD4559uA8vMS9vcx7w6z+p/KHAfaayzfnbQV
	fS3Skw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoUb-00000001lph-04vC;
	Fri, 02 May 2025 11:23:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoBv-00000001ilQ-34TI;
	Fri, 02 May 2025 11:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZSasRk2u56n/J30g0CJy6DU0Yclb8xzdh+hrOmJBqyCqJmjofQQVTtkaeybiF7UdjsXXNA4CKCcj/feWJj97pU54OSoM1gifW7bNPvP9yC8OtpTgsaTchEnX7782cMg9f0ohUc1vmBJEgNuMib/gcLdAKSPoydDfG5cmkJUg/jQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kOj1gvys++1vuc8gyd5QWJQk4lQix65qolwlNepUxuc=; 
	b=eyNSfwJjR9vM3f44g3edsucIFAg2T+XDD1P4mAU5nUHzC6Fs2ISxA0Nub4l/RmuAzjN6ltEl2a6CgDLO8Lzgn/6PSXvZjmr2iA2b1cgA+vpVTQjzDMYJ+BgwsVr8pHYicFrBcDwby2Qf200SyrWOZhsp7WgGe6Mlsp4leG6tML8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183855;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kOj1gvys++1vuc8gyd5QWJQk4lQix65qolwlNepUxuc=;
	b=ZKk8/6o9oZ3OT0mPZzDoSffit2bseak+Li3yHWNkk0uMKgX/rzZ6zHBnbVeDq5ye
	uBiF+vQHZJzKHC6jDqaiSeyYy9Rt5/74tmDAGOjh29v6z77rpiHKgxn8Uwlmwx/IP3j
	PnWUIKob+2tjsTyB9xJgv6xpoi1ivqzc5mUm8OH4=
Received: by mx.zohomail.com with SMTPS id 1746183854001990.156009245155;
	Fri, 2 May 2025 04:04:14 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:15 +0200
Subject: [PATCH v3 09/10] arm64: defconfig: Enable Rockchip SAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-9-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040427_831050_C1E3F334 
X-CRM114-Status: UNSURE (   8.78  )
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

The RK3576 uses Rockchip SAI for audio output.

Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1b8e4abf5fbd8556c6e0c329cdff86512991b2e5..22cf6fb2774aef18c54c2435e4b3ff1b94c1a6b1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1009,6 +1009,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m

-- 
2.49.0


