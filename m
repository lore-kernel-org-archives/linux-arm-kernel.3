Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4200FCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRJ33nglbvtBwNNO/vd3aaiLejhNH8NgBEXyiE+AIfw=; b=siCzTmIZkFdKdsvIX/blj5K/B1
	8CMA2Cif32uaTF/xDoGeG96J5t1RaZVpSWPFAPekvdzAHshOQv+3NRxAnHG8hdxyH2HwrIWt9Q6ST
	QzYsiZZNDA7aSateggtlNkoSMYGKIAxJoRdR+oOiPvLybIhdSlB43nQ9JTzFQsTNTG8f5uav9YHZU
	QmX2628FXM69HJD7UeEoyiLqzRkWB0zv+jdPx+Ddao7d/JLN3sz0BYfmb9cVSy4Jtisv+6bVuJwf/
	nja8rpUMTwU2zSiynHRHlP3/7N3g/eHEM+eajSGNXdVXn1jP+27MGYQH7/XJaLzqyHjyTo6M3gnWe
	oi/lHlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPc-0000000BVAb-0gk7;
	Mon, 24 Nov 2025 11:07:16 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPZ-0000000BV9h-29C9;
	Mon, 24 Nov 2025 11:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i7rP5ZjLeSO6nkbgxYOUQhkXldO7qcIj8jfu4BaZygcBW2lyHvVzEGO1AAeXRVLnSzNBxjwYNDPSxi/r1Z3IadFR4HTLYMNsYMAqjXO98e5LRlrC7SCcLah/u22ret6lcPIPBLCi1+pm4PweQt8Lt2DdzHQ97GusNKpKp1LbDlg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XRJ33nglbvtBwNNO/vd3aaiLejhNH8NgBEXyiE+AIfw=; 
	b=P2JZpc9IwDkX2SfKrG5C25051/c7wzpTRHzAYGPSaSThNN1CWUM5fssxaD5pRvVVeC0sM9vsJRL91DuMDRDnfaY6x2Pcn8yE6fW/ZQag6Rif3mas9QrUBPrQ/XlNG0z91sM6Kp2BliySKv6DAD2K+pZGDQiSnbq+auOB5vnPFXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982422;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XRJ33nglbvtBwNNO/vd3aaiLejhNH8NgBEXyiE+AIfw=;
	b=GZfYb0dSk6gySdxdr2gGHFe+onQijhcbzKet3XpTZafQKzK3LN264xLd5NOWCcI/
	9YmcWw3RMOhhnllS3DKizVJ1FueRqwiuYAbD2yuiebLgScNflG3986pLzSkMSbnTZp6
	B0iCw3Nlpp4NhlTcaDa6cTKJBGk46qnT3pc3JLTU=
Received: by mx.zohomail.com with SMTPS id 1763982420631856.0946779508707;
	Mon, 24 Nov 2025 03:07:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:50 +0100
Subject: [PATCH v2 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support
 for MT8196
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-1-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
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
X-CRM114-CacheID: sfid-20251124_030713_646044_C1A5C9C6 
X-CRM114-Status: UNSURE (   8.69  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a compatible for the MediaTek MT8196 Chromebook SoC's
DVFSRC hardware, introducing capability to communicate with it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
index 4c96d4917967..5673d242afcb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6893-dvfsrc
           - mediatek,mt8183-dvfsrc
           - mediatek,mt8195-dvfsrc
+          - mediatek,mt8196-dvfsrc
       - items:
           - const: mediatek,mt8192-dvfsrc
           - const: mediatek,mt8195-dvfsrc

-- 
2.52.0


