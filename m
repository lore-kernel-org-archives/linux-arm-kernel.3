Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA85E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIhh0UaVPTj41RhZt791NCNnsMo2GS8n8MN4k5BBvkE=; b=yfXquYxs62/5oc4Hwxdg45w0hI
	5iSrOkrfLmBRvSWr141fA/LtORAMrPNDEyhiLZlNb1TZwbb3KliQMyWIfGiud6htobQ9hAApKNeUU
	PhQcb1vkt9GvpyrV4LLHYB364vqGY0WI2FknWKfdJiVVXLH+VTtWvaMYiU3TJC0O/MNznQcMYgJHS
	Cs6UV5hpkIKUXp0XYlWZboef6eBfELe+0JslaoNK4iHppedW6lfABKryu0o1IX54fBNF/tfIx+bXY
	2eUOE4ClBvg6AZD2pVfoxl0nKsn6ZmGKUgSD74PQgR3393FI9ZgI0W5SLPBxXKCab/9zJZDvsYxYD
	EJozT0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Ik-0000000CjcZ-0o6e;
	Tue, 10 Dec 2024 20:57:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Fs-0000000CivD-3Dmh;
	Tue, 10 Dec 2024 20:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733864091;
	bh=bX5IBMFvCW3Tl5rVU/2EPDmVSZsaIwEI7lqJXqvl0Is=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D5DLps8mkdsk+IVa1L7HH//QDHh4n2jJpod55gEbQQitR13hw15rssO8pmgJdEM/Z
	 ZVIfGpPZAoFIgMChKLGxsRXlLzAQnBEujf9P0PxONqvXER8Uj5FuyaspI15fgeO4pU
	 M9BOZHq08DEzoDGvt7K41or/H7kD/wvSdcgNY1JcqE7F3rRGEjs4GdlGl760wAFWSk
	 B6esiTOKTKAG+LKk/GRjH1KoUBHH0jnOC3nsrQwsO40rlgXd/lQS4YX0NZpTGkLOkB
	 Peu3e75SFvMp5+rzEy8rLOI3SPQoqbWTNWI/SnUO1tQydkdzjAiBSYxOEWDDhHAEVw
	 OinXjE5GYWQ7g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02E9817E3804;
	Tue, 10 Dec 2024 21:54:47 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 10 Dec 2024 17:54:28 -0300
Subject: [PATCH v2 1/2] arm64: dts: mt6359: Add #sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241210-genio700-audio-output-v2-1-c50886ae0be2@collabora.com>
References: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
In-Reply-To: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125452_946798_35A4395D 
X-CRM114-Status: UNSURE (   8.45  )
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

MT6359 provides digital audio interfaces. Add a #sound-dai-cells
property for it to allow pointing to it from dai-link nodes.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 8e1b8c85c6ede94a7beaefcdfc74ce47b3ab50fe..150ad84d5d2b30ab6064c71e1375ce5df5ae4b36 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -8,6 +8,7 @@ pmic: pmic {
 		compatible = "mediatek,mt6359";
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		#sound-dai-cells = <1>;
 
 		pmic_adc: adc {
 			compatible = "mediatek,mt6359-auxadc";

-- 
2.47.1


