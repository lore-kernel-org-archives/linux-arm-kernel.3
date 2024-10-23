Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E38CF5365
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2uyrq7GGOyTSRNVgKrrN/LGPTZadNMTKaRk8VB4VTQ=; b=IJ3QJEWKF5myMVDrNo7Z/Dt8zH
	GWJljxyJ3dFGdWvPR1+pDbLOUA1xhGVoGhwBchaLQsS5goDy/M7qYlGO+Wpeh9IQNPtiOSC2g+1qC
	nx+pdEYWCpnj4lKWLC22rz3hs1eLManH6C/ympsUrvfcipBFO3fZyafbMTHiKhWhHS3kQjiicZ7Mt
	J2NWFqTIGE/OzWOCd2GC1im6wQ49QkebvW9TFHL+1tdfmJXRv6I/ldHP4NdE/+Nl0gCxF8PLz76he
	7xI16fzfuDKomceG46tp3EUAUvTbinm9beaYFKNYiauD+14Ywwt8X6UpqkretC7noFAJenmRVqBII
	KRVQeTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLK-0000000EIJk-1d6n;
	Wed, 23 Oct 2024 12:20:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZvI-0000000EEPj-0quq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:53:09 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90DF6E8A;
	Wed, 23 Oct 2024 13:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729684279;
	bh=YIFtUzEb+zNMNMf/+HsO4cidzcc/g56Tm4oHW05vqio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZNEPKqvudDpiEYufefsHsKGr9FMGFJmYgisd3cw6xUZstfTQW+R9gxzDsvLOHu+jd
	 DfqbqS3iXub//0qDBLAtkLFjchWZTDIUMKR0xbIuxIImUJNXJolpMn8UQzW9h5tVZK
	 M1h+/hc2KxZ6JW3Ld0xBQ3GyoaFSGPeEB/KZnvME=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Oct 2024 14:52:42 +0300
Subject: [PATCH v4 2/3] arm64: dts: zynqmp: Add DMA for DP audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-xilinx-dp-audio-v4-2-5128881457be@ideasonboard.com>
References: <20241023-xilinx-dp-audio-v4-0-5128881457be@ideasonboard.com>
In-Reply-To: <20241023-xilinx-dp-audio-v4-0-5128881457be@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YIFtUzEb+zNMNMf/+HsO4cidzcc/g56Tm4oHW05vqio=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnGOOdp5qjGToWY37pydXUvCk+Rk5jrhcolO7kw
 ZoP9VD7HyKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxjjnQAKCRD6PaqMvJYe
 9boPEACfd7c5aR41z8i2JKMiqweJA1/BsSsE4uhrIlFIOeyRvgSZIBivvGWplW+XAytbKMYsbxf
 KgU53RC7bKXPP6xNoEqBoOy698+QZOJ/V328PD2itzEe+XbrpOmnLdfjZXoEMYrhavZC3KGzWkS
 0ayBKbsTAFAtYcGK1belyis+P9Z3/Q7oRXoc8HoCSwgKFVw9FE5erNCWvBbcZlpdfImMnYjOmQW
 tIvh246appkQdiEgWMOZ6wXs2zuD0CBqYSYc/QSfuO1f8TqSssC6DXElunfK6MCgqOHIXDhy9LQ
 L4xk3DBuR7U/X9fpOp75bpZb+DrHKZBqKkieQi5iITPXabcu7bEBC+1b4/Sel9PsPOP2K0BLc5I
 PzpkRbh9DkrmWI2+TiVCTSCXMk8wil7bbKnGfGAvBi4W1d3Gh4WFH3NRNJNemNHbQkVs/+g7toA
 AkKYcknf3PanJog0MqVcTCE02s8qvd0I0s6jCKKhKWGfYWq06aq2PrSNXtAOt7OnTVG12+zWreQ
 hqMFWV67LT4TuU95vFapR5LnOHM9Ud0KGnBkj1MxMxFcg2gOmMhdFQs+XObrr1fwzT4XofvbU+t
 R9/idQ+AAgHLzk0xTUynB8islnExHrVLh9ISs/RYm7mhNCaypRjE327lBkrQkcJpe/KnXbCwwOh
 s5gnNDBLP/Un3zA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_045308_413419_2C7ECC8B 
X-CRM114-Status: UNSURE (   9.19  )
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

Add the two DMA channels used for the DisplayPort audio to the
zynqmp_dpsub node.

Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index b1b31dcf6291..673ca8422e6b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1207,11 +1207,14 @@ zynqmp_dpsub: display@fd4a0000 {
 				      "dp_vtc_pixel_clk_in";
 			power-domains = <&zynqmp_firmware PD_DP>;
 			resets = <&zynqmp_reset ZYNQMP_RESET_DP>;
-			dma-names = "vid0", "vid1", "vid2", "gfx0";
+			dma-names = "vid0", "vid1", "vid2", "gfx0",
+				    "aud0", "aud1";
 			dmas = <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO0>,
 			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO1>,
 			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO2>,
-			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>;
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>,
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO0>,
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO1>;
 
 			ports {
 				#address-cells = <1>;

-- 
2.43.0


