Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C8CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPoY7h7///0dRXhKVsnnIIHstXoO+TiU2PsiKf4upnc=; b=hTJ8DBE4UUgblSu0/72l6veFmU
	nCKDRQvg3WePYNtLI21e+TrdB9DMqRFrA6CKoG1PIBSUnnL6NYhOL5aT4JnBUK15S+WwRT5NhcU9m
	tJDvR2nRJvsYWS+7j5ntOc0FL5qxWzX7fzjZEpBAM4jsFBzW1FrImULqSCiuUumLoU7UFxNqxI0Wn
	/inIC5rZSP2rPCBaHCiQhp5PimGQORw8Kvm+IjrBnOyXqJurNakB6sDZmu4cifT02w7OJaPR1pqCn
	XL1ubYDXlrF+8jg9Na9y98IHhveYEtu0eUD0BICVxsP/UEWny0XD3+vPxR59gjlE7XSkNE/vxPB7p
	jWUjZAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycAx-0000000HPI8-3yz4;
	Mon, 24 Aug 2026 21:25:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycAw-0000000HPHV-2Dqs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 21:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C799443E49;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E8BBC2BCF6;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=G5hRhMw/rTJeP+uVQ+/IDnLHBALxPj/b8JPGt9DC1A8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hv4JTlTMqyypWurdRVveg7buJvBnPVBxCqLMdFBUmNd5uIGkvG7EsMRfR0K34coBX
	 he0IgTdpQY0aF+dqn0qXd61U1i39A+Svsq7a0XRoIZVnqyphSrGJ1HiNuz9h3C+WqJ
	 Sby310uB1wFdItA647iGyr2XQ/mx/mem6h9bUO/Bqx8Rc3aCTcMq8Wz1+FahQwBkb3
	 vO1yFmb9asaXRrA3EaC8cxFx3TazL5umzboWrkZrK989WLyf61gMNA/GNEnEcyEE5G
	 cqrvA6mVb6OpGlWAy1gzngbT2b6SKa2LBecbLwRWzbRrVf3WMz1XsuHWnctvlckQKN
	 r1ol0I3RpCobw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C744C5DF9D;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 23:25:30 +0200
Subject: [PATCH v3 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=2317;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=RQSuv7sNb6qL2mxWfOmjTQhD0J0pZv301ma7dFDHaYg=;
 b=XH70Jv+EGNq2fIoIIIFRPNR518p0v4eNgaPII/lj8Wzxu7EH6ZmAKsUt3+o/d4lrI2zd6Jon0
 fuknEF48DZZBbMsiQgWozBQ3ZVJd75e12SBy2VIMDjW8CPqw8f64Z6v
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

IIC1_PMUX is a single bit field at RCWSR14 bit 10, so the mask for the
two iic1 pinmux nodes was narrowed from 0x7 to 0x1 to avoid writing the
two reserved bits next to it.

With pinctrl-single,bit-per-mux the driver does not take the supplied
mask as the bits to modify. It derives the field from the node's
pinctrl-single,function-mask, which is 0x7 here, and then requires the
supplied mask to match it exactly:

	bit_pos = __ffs(mask);			/* 10 */
	mask_pos = ((pcs->fmask) << bit_pos);	/* 0x7 << 10 = 0x1c00 */
	submask = mask & mask_pos;		/* 0x400 */
	...
	if (submask != mask_pos) {
		dev_warn(pcs->dev,
			 "Invalid submask 0x%x for %pOFn at 0x%x\n",
			 submask, np, offset);
		continue;
	}

A one bit mask gives submask 0x400 against mask_pos 0x1c00, so both
nodes are rejected and the pins are never muxed with this message:

  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-i2c-pins
  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-gpio-pins

The values are not changed:
  - 0x0 selects IIC1
  - 0x1 << 10 selects GPIO_1[3:2].

Fixes: 7a3cc49ad1fc ("arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index d4522a19405a9..d9d4500a40510 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1687,12 +1687,19 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 			};
 
 			/* RCWSR14 */
+			/*
+			 * IIC1_PMUX is a single bit at RCWSR14[10], but bit-per-mux
+			 * uses the mask for the field to clear before applying the
+			 * value.
+			 * So bits 11 and 12, which are reserved, are written as 0
+			 * on every mux switch, it is harmless.
+			 */
 			i2c0_pins: iic1-i2c-pins {
-				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 0x0 (0x7 << 10)>;
 			};
 
 			gpio0_3_2_pins: iic1-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
 			};
 		};
 

-- 
2.43.0



