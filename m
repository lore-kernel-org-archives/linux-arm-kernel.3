Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBCBC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=; b=XhljUJLlL6Af3y2deFhUM/9cv3
	a7phKocY6Oz6OJoxUiUrg6N2tv3zeWmZoOQ2Yx7J3aDjek8gwueRHxcOX3kMRk99mrzgMXJ2zGQHl
	pbCEJr0xzZq0M9wohmAh9JRkrOG2hwMUUFAgCSj/7vU4O/JPDPxaJEKFv0Y/eHQ5OmxWnXiDgnZ8K
	UBVXMgOehuyVwfxOCJyY+B56QBvb+Tf6bD6mGufYcS7/Oxl/I15roFlUUTyqRCGSJZnZ4FTE5EXIs
	adgt8cWQHjg/Ybvaf187APUU4B1Lef5928bvQaBrc5iULx4X6yZBcLF7HNj7jn/1zHdVsOPXu92OT
	vOjVv31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoSf-00000001lau-2nMr;
	Fri, 02 May 2025 11:21:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoBr-00000001ik7-3lMD;
	Fri, 02 May 2025 11:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Firwafq0j1ONHU2WQ6sz/w5ywGvhFJB9I1Nrlk5pdY67vzizfxLx0MVECcUQDnNG6eMGtoFTiEUpCX+WdZAiHBNwxGek0AS8YNLDPowTfPT6qnv73GVMCvYQtd2SB+WbT228shn7IKUJEW5bBZ/opIrSImFXrW3V5TRs6Y3lb2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=; 
	b=SvtoPE9wGb00Vf5guYqrBi4X0RvgD/qIQzrOTiLmdPy3lzgJkHMZNRJxjqUS3V5D8Xkc+uEIup/3WkO1pisVobz8Z2Ov+i+BtuYwr10/rVSxvSeThmvclX7vYjfsOGQ+tWxn40T8a1/Flt0DdBtk/xzR9magJNu+sIulaeabCPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183851;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=;
	b=gygcTHvEcRxZ//ZvJegjuvP+oP1sff7jkPu8Xf9cUr0mSWWwczUTMBFoXHBYvhuR
	9+lzyaPzr53+ERdGmA0yArATwcY59iI7AqJQHRoSLpEx+VeNmil9QLsRcjKVfq/k+EK
	DirX2ENGDHjhf+t+pVfUz2ddj5ygmMgwka/jMzC8=
Received: by mx.zohomail.com with SMTPS id 1746183848446280.1735690979417;
	Fri, 2 May 2025 04:04:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:14 +0200
Subject: [PATCH v3 08/10] arm64: dts: rockchip: Enable HDMI audio on Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-8-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040424_000188_B54B2FD1 
X-CRM114-Status: GOOD (  10.82  )
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

With the hdmi_sound node added to the base RK3576 SoC tree, we can now
enable it on the Sige5 SBC.

Do this, and also enable the corresponding SAI6 audio controller node.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 2c991ad974a95fe1995a8d15eaba3e7b07d4dfb6..b09e789c75c47fec7cf7e9810ab0dcca32d9404a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -275,6 +275,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -736,6 +740,10 @@ &sai1m0_sdi0
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;

-- 
2.49.0


