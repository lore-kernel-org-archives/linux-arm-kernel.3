Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E332C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5hMn+M4LbOj34XzAIJ/qrjyTGHgxEVGsg/z76Qngjw=; b=pbYOFqWme/U4PqRAurFYD3W1ib
	hCMoFXMkhFQVrWirx/3YgmCuwP/PckQSLryUTrRghfy81ase0zFWQxQUPZ3BHjSwGrSkaav+jq0b0
	3AAzitN32Uj+bFZ6WXZP6HH1GwWkv04Mq2OlcuIqHUnCPhWwz+ULk9+R41rj5AkKG0oGTR5oU0Pk1
	L8rTQVbo4+3eQCP7BUjt7GIfPOl6xUzyyBzxlfL6URKkM0inq80k9h4QDhu5kmqBMurqpgJCWzk2+
	zOkyIKOPB5nth6GXR506CU390z5tiuhnn5QASGAZe0lAqb/MGR2cUHySCYLbCg9zhZmEGd23mCpuH
	+sryW1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1z-00000002ayT-0I5W;
	Thu, 09 Jul 2026 13:43:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1u-00000002anH-00fg;
	Thu, 09 Jul 2026 13:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783604579;
	bh=2D9r64PmMn/aUcy8ufcjTpqOB+Pkyk4OdcYuFZ5sKms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CJ2SRWT/USyWyh+UbnSGT7T6C2nsOMONmtA/MaNqjZA8A35TtAl2yWEAcZ3t5fjkb
	 MMjcW1nLOOn88iw0WHzMqLBsQa9e8GISZACX/aqBzAM1FCM9v4XX2e3w7ki3xWI4Tu
	 OjPjBJUs8uzJ73RPP+fPNt+CpkYf0BSP5i0IVvlDWUWjr4ux3QK6DctQWoHl546eEK
	 e5EtFVOC2IJ5BR0k8v1bb4/sp5HWEnQJNy6WDBqi0LejlBzHhUcgXqW0hzIW8ajhiW
	 pvscMl5TNUp5iStTy2Rn9UBOdOQhixQwnurjCKX4ZKyR9W5X4nT606x82ZhfF3fz+W
	 B+AXPGbXJJUIw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B03A617E0DFB;
	Thu, 09 Jul 2026 15:42:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 09 Jul 2026 15:42:43 +0200
Subject: [PATCH v2 03/18] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783604575; l=1522;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=2D9r64PmMn/aUcy8ufcjTpqOB+Pkyk4OdcYuFZ5sKms=;
 b=sHVam2U9wFo8NSOS/GFeW6poHyIWSEJaRsEvD5tmjNjVhDBZVxFa/E2KbKLfEUC91onO3SN06
 C+NMShbuGS6CSm2DevNok6tlfg/d6hXOupoxQkVeZGkXxG6dGh9Z63K
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064307_006196_CF1CD2C3 
X-CRM114-Status: UNSURE (   9.78  )
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

Both MT8195 clock controllers dt-bindings (clock and sys-clock)
document the '#clock-cells' property but do not enforce it as required
property.
As clock provider nodes should define this property in devicetrees, add
it to the required property list in both its dt-bindings files.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml     | 1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
index fcc963aff087..94dd29c2396c 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
@@ -58,6 +58,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
index 69f096eb168d..ba1b36fa0169 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
@@ -43,6 +43,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 

-- 
2.55.0


