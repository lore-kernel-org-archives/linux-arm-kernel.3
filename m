Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3EDCCF9F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvkLCMnZldrjuNbyL3U40LIf/FEF2QJ6AWCSeIEbknE=; b=CkIJ+IXx43JXd4xvB7Gl4C5VnP
	XbdQ8bIJuTSAqyP4krnUjKllBaxofGQd102WJCZCBPtyujTIghdHcKaqQAG1/YUlyJjexTBbjlkXF
	TYRaFLkacFLdjwVomvPbQx+23fe8L4VdTWz3w43X0RJ9kjST9w3euROeh3XnpHot55JIRKtNz4GzL
	3ikTp8n3C5KzY8FM1XVMI458UaMF4D38clN0uJL42i1iYP5MdGWM0LdOPFV2Vsz1FG9NkUTdhr6RU
	nfqW9edptSQLlNwgt2AJ73bH/vKat414KJoQgYWVL+LgYwQMAXbQLhFvU1vWSV0NWLAAt3pXT1KQx
	k079ba0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmg-0000000Dx49-1Tls;
	Mon, 27 Oct 2025 12:57:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmY-0000000DwxZ-48EW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E033F459C6;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882A6C116C6;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569821;
	bh=cH78ltGLFEwaRc+5sKH7tOpj/oTnWSF/SJD99Q8jJBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HYW1H6mW7jSbquUJYM2sqUZm38jlpvEbmqNe+my2P3ZAWIGYTjTFCpgEHS9+DemLl
	 eiO701QwLGQZgcMjyENFmnzaX2DuPiLvU5f5S/jqK5yBncWj4TKpenGg8zLXyON90Y
	 j6WeTmxg2pTIY5KKnWtWeu1rAR4H55dta7wG/l5kE40i6Xb04Dh+GKUL4az1eKLoKh
	 iSEB1tkqrY/0I68cXpJeU3s2Gjcu7+Es7P8ZDN8ZffBEzYAw5bxNuFlyXZeevVrDfm
	 DTUW0B2pCZjZ+0njaESUw78t9iIW5e9nfbHIiMJdYb2oZqLnQNfBzU91eQYD1YFgfC
	 wVoUJoR+eJlIg==
Received: by wens.tw (Postfix, from userid 1000)
	id A9CF25FF8E; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 08/10] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
Date: Mon, 27 Oct 2025 20:56:49 +0800
Message-ID: <20251027125655.793277-9-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055707_079093_8FE038CE 
X-CRM114-Status: UNSURE (   9.53  )
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

The Radxa Cubie A5E exposes I2S2 through the PI pin group on the 40-pin
GPIO header.

Add a pinmux setting for it so potential users can directly reference
it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index eea9ce83783c..cebd8e16e845 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -145,6 +145,14 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2s2_pi_pins: i2s2-pi-pins {
+				pins = "PI2", "PI3", "PI4", "PI5";
+				allwinner,pinmux = <5>;
+				function = "i2s2";
+				bias-disable;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
-- 
2.47.3


