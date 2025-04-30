Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA35C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDHqxj+pNMIqtx7OnVBhW5kzUARxjRYDjneVyS0hKvI=; b=cFPep46VXss1H2EnAlLRIdwUUQ
	qaSuV5wH+ZDWOazVX4vNPY7YotdCc+vUcUeoJl/S49W6Iet9+dO3KK7sjYQHZ/HiN+H9V2WnpdvGM
	JU1s8ZgFD+niwwj5n7aNai041Snyt+w4sBRmdC/odW1Qg6oMtq3KYJ8i0kW2C0wsJ6ZRJ413mecb6
	1IdU1+z/Rpft60oAJHOkCY56Lm2haTRiwtVCKixOY3NiFbsMv12vMswqf68D3RII5Klv5FEvzPsfa
	SFUaVDWcxakM25tBq1QCkjrG824mXku7Hr0wm3yGP+sHChmQL02JoZunrHb7Gwa9y+wFGnfd0flAg
	81P7eqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAACU-0000000DQDU-270s;
	Wed, 30 Apr 2025 16:22:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAA7w-0000000DPKZ-2z4z;
	Wed, 30 Apr 2025 16:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746029816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FnH76/YWeEy/aEeClOrvdV1Lr1/LcqU0T2iXebxS64wmnt9bOwGw7Ii7uaV/nz8OtwkHj7Aer7BevzuiFHLkFVofjaRn2QBVdVotk4szJ2ebbs1NzDA54A+d8GZaWAyzEzDoKityNgabm/BFSp2HtuXqQU4zKnV1E/p0j4c6FHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746029816; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jDHqxj+pNMIqtx7OnVBhW5kzUARxjRYDjneVyS0hKvI=; 
	b=VIreHB6PMr/QzD2QVbjiMIdn7jFqUoRrV2Vw2WdlIFRsBqkJ1WclndHIMWhsesttMvUEaNlPd7dwnUoMhmj+eOeaGyNqEXADlDfB02Hx69WeQifEsktplsyEUkuWyJQUOtP9qgFF4OUQ2Qc87ai9YH07gWD/hAjzBVddlfSPsNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746029816;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jDHqxj+pNMIqtx7OnVBhW5kzUARxjRYDjneVyS0hKvI=;
	b=YGOKalQd8pPactsftc5nDvQUxSHPdgkHSiIV4i0mhK1F3vvqLOlvJk5AO1zKX+xH
	IvO4J1qrINjuLUtRPVqPDD6/kUih8ufB2OFtz5NyCqyEctYzB2XyU6lYejD80DWf1il
	C3KApsl5jqAdSwLlUIBTWqT6QwHf13bge/sZDmv4=
Received: by mx.zohomail.com with SMTPS id 1746029814097766.0947279438221;
	Wed, 30 Apr 2025 09:16:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 30 Apr 2025 18:16:34 +0200
Subject: [PATCH 1/3] dt-bindings: rng: rockchip,rk3588-rng: add rk3576-rng
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3576-hwrng-v1-1-480c15b5843e@collabora.com>
References: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
In-Reply-To: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_091740_811912_9057FF6E 
X-CRM114-Status: GOOD (  10.73  )
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

The RK3576 SoC contains another standalone TRNG implementation. While
the register map and hardware is different, it has the same
clocks/interrupts/resets as the RK3588's TRNG, so can go in the same
binding.

Add the compatible and generalise the title/description of the binding
some more.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
index ca71b400bcaee4ad9d9c96102fd5940233c2c70f..fcc5be80142dfae1952652907a5fafe8504e36c0 100644
--- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
@@ -4,9 +4,9 @@
 $id: http://devicetree.org/schemas/rng/rockchip,rk3588-rng.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Rockchip RK3588 TRNG
+title: Rockchip RK3576/RK3588 TRNG
 
-description: True Random Number Generator on Rockchip RK3588 SoC
+description: True Random Number Generator on Rockchip RK3576/RK3588 SoCs
 
 maintainers:
   - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
@@ -14,6 +14,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-rng
       - rockchip,rk3588-rng
 
   reg:

-- 
2.49.0


