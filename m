Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606CACE8D5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCCaO//8Fi8M/CmV2wALRGjZAU2gsguJwp6rcmq26zU=; b=wh9sHIGFVwqJ449dzp1yLEzIXK
	xrLOLS2wlsLC4ePGZ95Ev11rpUmp3naJ2ygE78wZDWlHXcxFXbvkgw44g2LN8BK/sHHmg7B5ETmAm
	0Sk0DXnPlbcUkStrU+psCPRN6lLs7eYIX7UFzfWlcYRgWUaIjyYJ4/qPZSF3g+bRA63YFyI7PL9Gz
	tuvPt4wJJb+h2xNRLnrhuzENQLUMxIDxBLkqHXdweioSokn7MITJqNkV5n7gqQGgMBpUXaQKpG87X
	5BQlcnsEi6GQdvAorhs5Vu/L+D+dqYWmmlzmDE4kuH5/k5PEJRBD5qVInXbl+IhMBzVldssKeznzT
	kBGhG9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx44-0000000ClqN-1Agg;
	Fri, 14 Nov 2025 16:54:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx3z-0000000Cloh-0SHO;
	Fri, 14 Nov 2025 16:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139250; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NmvcRZSPfaGMRc8DNap//plM9dKMLWASis9qhJHwtUvm2LjEpeQ5LtkrppPML+5j8kG0cBfOoEYI10N47TZ9ZAXIEGy8tvX21QjiqTXL/L/P+T/YiER9sZWhoEXzSFtN7R8PqIk+GcHD0T+Tj3+Ita4KsETXbz/NzSWMrChJ7zs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139250; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bCCaO//8Fi8M/CmV2wALRGjZAU2gsguJwp6rcmq26zU=; 
	b=nUCcSWxA+eO05iF0RerE7f407BFcpg4L5bVAzCnlSsjtqHcocXjvYYhsIfwqNA/ZLIcrd9IizU1x21FOLmCGdRw3n5B9ZRQa6iSeL7WmlS9Nl4QoQYV38TmrI1yoyd6pvqlNRWsKG+fhg3gfVBwW6I4ERkuL+0P6KSVTMwuqmZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139250;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bCCaO//8Fi8M/CmV2wALRGjZAU2gsguJwp6rcmq26zU=;
	b=HSls78npMhKse8lMvEAolewI7LbrjtJPfW3skx7sWMPrtCNYtINXSwpWVLM6MPcR
	TIffzwsFnCwPrCRerVWREJ/6E4eU+MsVZYDiYGCIra8i2+qzniLjgTr25A2jUSvr+VN
	wb3cRK0kv201Dw0cCKj4QSFjOA4vMTXuwy7FnJKM=
Received: by mx.zohomail.com with SMTPS id 1763139247761662.8223746100324;
	Fri, 14 Nov 2025 08:54:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:53:55 +0100
Subject: [PATCH 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support for
 MT8196
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-1-b956d4631468@collabora.com>
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
X-CRM114-CacheID: sfid-20251114_085419_426569_702D3DC8 
X-CRM114-Status: UNSURE (   8.22  )
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
2.51.2


