Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE7CE8D57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALLlgNtEbrcNNupb9C7qQMRXoEtImQc3n5pZXYbdkxU=; b=U6v/U1Ash2xqcfX7+ehXIRB9dR
	bGmDqTpY7p6/MSjzjRbQxPAMnsF33JLXVeSW+uMfBqRRM05Tz1dWA/9TaXwz964AWW05LO7Ohy0rp
	MYCsRsSU3JvwnV0/x3N3g9UfIfI9g6DMw6eJvnSVECvwNG/D5x8x8QMhWiRL912hO13SmJMLhINFP
	Cacq75lIsl+HPGSSsknnqJ5Nqtep3VziQwibIJ5/XDiv3iICfirpHF1knDOJCbvOYf2wGXlMb8spk
	dgeKDnKvCYWdVb3w+FSNdRx71f05oX94qFEX4iUMxgfGgjC1TA7tFVtQAwfzst1lWS6xfcFD9WNNn
	pFGOQnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx48-0000000ClsP-2rMP;
	Fri, 14 Nov 2025 16:54:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx42-0000000Clpi-0bi8;
	Fri, 14 Nov 2025 16:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139252; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EcubB+FlthGOcdddqr2fiMH/egGcEyM21Bq0AQC4Hib8caM1/akVFQp3T/rh4TMfwc1QxzZRI2I257tYhFup2N0ZbPCAMKNomfIkeJc9C58kvtn6swbRNGbKaUVql5WkvCQ3jSoE6r7ryaoTjXWkwWOmgTDfD9Yn2ByZNuCFA4w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139252; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ALLlgNtEbrcNNupb9C7qQMRXoEtImQc3n5pZXYbdkxU=; 
	b=V2k3a38SICQdN93IP/m125EN8/HvDUJoFX+bY6xo/g9ok6msM41+Q7P0VxrtylaPRBST+2L4tgFqLpLvy/ruwdAkb33YgmNPo0mwA7swKGJJ1oH1v3wtiTGsB2aQBbej3UV4dVTP7ndhdNLCEWZgzwudGvekvytT+VTrecxv388=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139252;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ALLlgNtEbrcNNupb9C7qQMRXoEtImQc3n5pZXYbdkxU=;
	b=Iq4swSnyL05xUSjkZFTmczvsfzkvtbLoB4Qt09H3UJeAYmgW/ntahbZBZT4T605D
	885QAgXK2mAOS6AJ2dZ12sr31MSiKocog7QeaSFlm1Qw2RapA/B29w2jlCcRsg5QRyZ
	BReL+die6jrkMU1M3FM2AAIR5EzZsPxxrU5C/kBg=
Received: by mx.zohomail.com with SMTPS id 1763139251662608.2963493539693;
	Fri, 14 Nov 2025 08:54:11 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:53:56 +0100
Subject: [PATCH 02/13] dt-bindings: soc: mediatek: dvfsrc: Document clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-2-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_085422_244335_82964F45 
X-CRM114-Status: UNSURE (   9.99  )
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

The DVFSRC hardware has a clock on all platforms.

Instead or proliferating the culture of omitting clock descriptions in
the clock controller drivers or marking them critical instead of
declaring these types of relationships, add this one to the binding.

Any device that wishes to use this binding should figure out their
incomplete or incorrect clock situation first before piling more
features on top.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
index 5673d242afcb..d5c42f992a21 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
@@ -35,6 +35,10 @@ properties:
     maxItems: 1
     description: DVFSRC common register address and length.
 
+  clocks:
+    items:
+      - description: Clock that drives the DVFSRC MCU
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
@@ -51,6 +55,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8195-clk.h>
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -58,6 +63,7 @@ examples:
         system-controller@10012000 {
             compatible = "mediatek,mt8195-dvfsrc";
             reg = <0 0x10012000 0 0x1000>;
+            clocks = <&topckgen CLK_TOP_DVFSRC>;
 
             regulators {
                 compatible = "mediatek,mt8195-dvfsrc-regulator";

-- 
2.51.2


