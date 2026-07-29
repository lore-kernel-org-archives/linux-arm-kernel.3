Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B1C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6P+Ix1HMsH3IeVzY4gyAl8zWgQXvrhsMQGZ3RmXD5Y=; b=uHe0GY+juu7TwyipkWA+WPMylO
	4QTPeVaNmNaViUcTy2rfF9FKnGDlJNaR6Odt4KXGH8J9B/C0j5FNUIeYnCPbB+3OygE4rO2moG9X1
	zNFAq+TxXVuRP0OGdd1B3ossCM4qKFyZAFRbiOSyJEGT7foVyLYDppR3dBGKNbzuZXxU6evbJy0AQ
	QBAbsCnNjKpXJzH5RorF7GF9Tj55HhBTTvErhWPKMcyJmotblzElQbZSSV1NSdLvauRZveJfigMQL
	6scmrh9W5Vn3l94Ex5gFBV3wnHSo7CUqxFa06V4ZSPrPZVpWCuhswNzNk4Xijj3TlUXHI1Nxfvl9w
	kZW+8Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18T-00000007SG1-3gKt;
	Wed, 29 Jul 2026 10:03:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp187-00000007S0T-1BK3;
	Wed, 29 Jul 2026 10:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319391;
	bh=fUUtXLDjBk6CCgOqNBHxohDsqafdXykxd3de6nmxpT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CYH6POJVQv4Zcvs6qqE0NmpU0cfCcDMovPcM99ZJPU/mQZe2C2gO0huooFY9pvJok
	 G1r7lbzF5RKK4bjPZilmaGsNiPcjKM+sXYVJZOwHzqJ9gekCEn2IVFLp6ya+ir69JO
	 f8xrLG0bGGpkThcwZnQVXv9O5wxZ7kfZK50mkrOKCOIRX4SGL8Qm+eyMiWsrKcC7sF
	 ryGLu7fR7k3I+/57U25wnhAay7NGXj4aHEHFs/Z9F5mpmW3Bs5JKImYIiKP84nbFSG
	 9iIKGwJ4BT3aOUsgSG4GpTPEA7pIy+MsQTEBqaLdo0JbLSab+SxCS21kmbW5b6ngMg
	 DwbVE3i1nabpg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A46D317E0682;
	Wed, 29 Jul 2026 12:03:10 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:46 +0200
Subject: [PATCH v4 02/24] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8192
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-2-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=1753;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=fUUtXLDjBk6CCgOqNBHxohDsqafdXykxd3de6nmxpT8=;
 b=hfyjwQetcH08BEBC+QpvnD9FhUYYXaZv0hFgp3h9QA2giV91fSJHbK5U4t4iHHs0QX+C7NmvT
 DoedCtAx/xFD6sc1e1TaSTWYgbqS/94iwfJM2PP+BuTRqh0HWoVV2vc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030315_522170_78904312 
X-CRM114-Status: GOOD (  10.22  )
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

Both MT8192 clock controllers dt-bindings (clock and sys-clock)
document the '#clock-cells' property but do not enforce it as required
property.
As clock provider nodes should define this property in devicetrees, add
it to the required property list in both its dt-bindings files.

Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml     | 1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
index b8d690e28bdc..65e4c2fddf5b 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
@@ -46,6 +46,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index bf8c9aacdf1e..0ebd0d60e2f6 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -35,6 +35,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 

-- 
2.55.0


