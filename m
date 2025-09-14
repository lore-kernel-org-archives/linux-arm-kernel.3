Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D171CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6Y2Gkn706akrIKg6YESStK0AnOYg63HDq/ISSMQOuw=; b=KZ09GPluhrpDVS/SH5AGnZt5K2
	RjdPyQjskib0RuC/GQzcxrlboMi7avgstoPptUQiEshrHlOWl9RhvkESR4rl7HDttfD1sWOEBvkD9
	UmMHta+4URWF3RLgyRBIH2LXWHA49zpt6G2Xk078MbTocr0fb9cB4deeYlLLLmVZ2nuf5dZQfTRV6
	W+rTfuOZQWMKj1jrFINylWomdDJnayj+F8j6FCU7PAqnY/GbiYPdJAztNSSDI5lD5vrf4735dRepD
	Jld4kS09VT8XBhPJfsCMaAJc/Jbla28eFgSCUgb0j2csngB7gZVt458izjlIfJuAXJEcfHoh0ow/k
	8EM1bGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu91-00000002EfJ-0Z2M;
	Sun, 14 Sep 2025 21:20:23 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu8x-00000002Edd-26vh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884817; x=1758144017;
	bh=r6Y2Gkn706akrIKg6YESStK0AnOYg63HDq/ISSMQOuw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Zg3jQpfLTiNwnSTWvTuYzLoYFJY5wbKi6WuQ5nHrIXkpLfX13TSxMg8QQ639lGF3W
	 c4WOinvEQjYbgzWczW6rpsm2Bl67kLoG+kc8y8J0gxjXQW9LdJGBnYi/4kpqfPNsV3
	 PCjFTsKlTsv0yS990AWMAGWSFbTLtxctVm/OgcUPRbYP3oQYA5AIoe8uwoFGkeTL6t
	 9YDX0/diEPlXTIy0JrpUo96tSx4BW8YGWfz9d9IfdV6HsJzXQd2Nfw1p5XfX3xso4v
	 YpjqmKdK22Khoe8sLupBHnGcLIhCE5cWn/kWBCPxxgq53pt4WJyNsYKtZ89wT8aVAy
	 h75FKtCqA1V2A==
Date: Sun, 14 Sep 2025 21:20:09 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 5/8] dt-bindings: soc: exynos-sysreg: Add Exynos9610 SYSREG bindings
Message-ID: <20250915-exynos9610-clocks-v1-5-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 0485798802bb0d7269f0f916ac2aa86437c9d201
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_142019_696175_7C173105 
X-CRM114-Status: UNSURE (   6.15  )
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

Add bindings for SYSREG nodes, compatible with the standard syscon
driver.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-s=
ysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-s=
ysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..9f759e457a0acc2870adfd077d3=
3870593cf7b83 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.y=
aml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.y=
aml
@@ -30,6 +30,16 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-cpucl1-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +103,16 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-cpucl1-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
     then:
       required:
         - clocks

--=20
2.47.3



