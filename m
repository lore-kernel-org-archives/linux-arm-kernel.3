Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD8FCF5369
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keet9JtQaOXuomTlpWdsXaG8WkjQZH50aRx3ATgH1fA=; b=XI2AcqOIBVKfOQIGg97Np8FCwx
	87Sysg07gddGiEtQMg2BvaXIHNQfgKZv35Da/3D8hnNga4HG4uIekUBPd6ZpAO7MuWILLRwjjCqD3
	uj5SlsK7os9mZPodlI2TrT/Lkt6m/atcYA38pBWIXEqmBy1QvV4Z53JFZiUhaUNq8P4uLwI3eW7H7
	LQmDcW26g35Olax1Nro4UpB4Xrntdz+gTBNll3FC0hfb0Fq4l78AMMTupGRCH94hd5l/r/bMVwKqS
	gnvfy7Yy2y80AStOhs9JCj415JYSQSPT9Ws685uT0oHeHinJYNZkRUTUZnO3cciguclbSe/t1RyJh
	42bnDuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLJ-0000000EIJY-2uFr;
	Wed, 23 Oct 2024 12:20:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZvG-0000000EEPF-3o9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:53:09 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A3F5BDB;
	Wed, 23 Oct 2024 13:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729684278;
	bh=0nXdny8O8iGUgqDAF00HrUd2uDNhZdKpP4uH+IQ26w0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R59/aJfPnbpZGtwZ1qQSJtD3fHzTy14A3ZzkBQcjjudvVsnTsTwnBwVsMGRi9Dt8M
	 dyZRJOgtXqbJScn0x5ETzrf//upNQZ9dQD6naMgX4DIjQ011j8KHJv8x3m+xTzSGv+
	 isbpH4g0GvtP/h4r4pwlUuhVcQKIZRv7QKa74Ad0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Oct 2024 14:52:41 +0300
Subject: [PATCH v4 1/3] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio
 DMAs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-xilinx-dp-audio-v4-1-5128881457be@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0nXdny8O8iGUgqDAF00HrUd2uDNhZdKpP4uH+IQ26w0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnGOOdpKBl+X813tbIgGTmzFFMPK3Gp7XP/9miR
 7DrnReJ/BuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxjjnQAKCRD6PaqMvJYe
 9eDPD/wLQU9l0Mgkos2zZlF6ZrXjFHLHao6agTr1lVZZUIzUjxr1af0QQDTny61xXmoye15/8DI
 QAAQEwPiE+lrKk3Km831bZx+X3Tjd18G3ag13jpZfng1dbTbzAbfw0ig1QBdKiIG/01H3mkfPvu
 Va8QPgpx0gomtOL1wgogGL51RBQDlBCAXgkQAKVPqftRxVVuA5XaHUkZvNhJzFsSq7q9hBo5HeF
 4fG/RXkSlCSkkbJszudyuuA3sYp343O7cCyRNQaYSy1ffRT3x8FGlJtWXAjsxm/nIe+gBe2+ZSo
 coylP4n0U79uloKVyUI1zDDdNtUO0ZbZDKsEP7w9Ovn+4jDYhGM0y+WVxJWpoQwPmdqEdHxy6n2
 3Z8jR2yQhta4IDtT7ksfgK7Yl9JxbF1brXoKftCmbt2JHwxrSdSKzPuplta0mSdZRqVlAuNhWrN
 GmNntwmcXE36tE5OKlhS3fbmIb3XbNjjvr2NU8E2ZY4ZzsTGHOvzjcCrOJA7gJS3b6rbt/UI7+l
 heCEXvjQjLNVy8Bs5rKNRQRB7qCgyUGQmuz20ULmYr/GdQLywiK6jAkI5r77c5L+iPojyk54UXn
 4Xa+5Nl74vHt/akUuq6l0Z53AQ+KNck6JkMjI+91pBKiXDunDiI/TUP1Af5Yofp45KjdacjXGAE
 SO5CEDH1/vtxjHg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_045307_130939_2E8E77F9 
X-CRM114-Status: GOOD (  15.21  )
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

The DP subsystem for ZynqMP supports audio via two channels, and the DP
DMA has dma-engines for those channels. For some reason the DT binding
has not specified those channels, even if the picture included in
xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.

This hasn't caused any issues as the drivers have not supported audio,
and has thus gone unnoticed.

To make it possible to add the audio support to the driver, add the two
audio DMAs to the binding. While strictly speaking this is an ABI break,
there should be no regressions caused by this as we're adding new
entries at the end of the dmas list, and, after the audio support has
been added in "arm64: dts: zynqmp: Add DMA for DP audio",  the driver
will treat the audio DMAs as optional to also support the old bindings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 554f9d5809d4..6b754d4f260e 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -100,12 +100,16 @@ properties:
       - description: Video layer, plane 1 (U/V or U)
       - description: Video layer, plane 2 (V)
       - description: Graphics layer
+      - description: Audio channel 0
+      - description: Audio channel 1
   dma-names:
     items:
       - const: vid0
       - const: vid1
       - const: vid2
       - const: gfx0
+      - const: aud0
+      - const: aud1
 
   phys:
     description: PHYs for the DP data lanes
@@ -194,11 +198,13 @@ examples:
         power-domains = <&pd_dp>;
         resets = <&reset ZYNQMP_RESET_DP>;
 
-        dma-names = "vid0", "vid1", "vid2", "gfx0";
+        dma-names = "vid0", "vid1", "vid2", "gfx0", "aud0", "aud1";
         dmas = <&xlnx_dpdma 0>,
                <&xlnx_dpdma 1>,
                <&xlnx_dpdma 2>,
-               <&xlnx_dpdma 3>;
+               <&xlnx_dpdma 3>,
+               <&xlnx_dpdma 4>,
+               <&xlnx_dpdma 5>;
 
         phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
                <&psgtr 0 PHY_TYPE_DP 1 3>;

-- 
2.43.0


