Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036F4D59D78
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:
	Subject:Mime-Version:Content-Transfer-Encoding:Content-Type:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+nONJqjep5LEd4f09CvcjseCMGXyI1xL6ZMFEmMKLaw=; b=r46/oKkVZ6YvqtkTn/h37+a/BU
	60KaEI8R8RVjgoUcNxuu7/ikpGmDbhrrUrGp9AY1C8Yh8vjDI5DOT6cD3cgWqa5Je01o1JLE/5L6k
	9WaDZSEezVrQ6EJdqsfBQFgUYRlXvg9p+FwVIzAo8VQ3Th80ZSNL1n8Xq86ZWsWX26Kzhjrp5nvtc
	7hWVrgkFYjbARuEMHNEADaKEF+AYcRhFm1TtW7ibiGIHdYYT/naLHHxyGCg+ofDgHgJY9RJQJ4zHr
	Ny17D29xFJAGyzAIGTHLsACPiuT1pJROy/CG3lVNWfeABolo/bW8vAfnhom71WqJoTAXKGpPX35t6
	oxqu+Exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5vv-00000000pnl-2toJ;
	Fri, 12 Dec 2025 16:23:55 +0000
Received: from m1-out-mua-15.websupport.sk ([45.13.137.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5vs-00000000pnJ-3pgb;
	Fri, 12 Dec 2025 16:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=probably.group;
	s=mail; t=1765556627;
	bh=+nONJqjep5LEd4f09CvcjseCMGXyI1xL6ZMFEmMKLaw=;
	h=From:Subject:Date:Cc:To:From;
	b=B+IKY976kgdpzNFohYgSqkuTAHhovcbQRC12kMyzNpArJuTWkROGd1dFBsplmqoo3
	 BWnZlQfF6SvoZQJwDcdkODjA30KTWi1/YMIMABYKovtOXfa7WW59uM5OwjfNDe9l62
	 TpJgEE14ceCNbqt8A+OjVbiPwIB+T4uAW45K0K/+OtP1iTFF6UDygBlzcHB4CrffDr
	 65rl3ukvcLvtvA8rGj7dJB3/8aM3wNI7XqRCG72GAWULzHd1q0HgGhDFLB5EjVH6kv
	 dOO7rTI8gzbhrPZdbbVUvJgpCkXZOFWpW93RMPBr/G5JUa+GlWgGgEdcXXq6wPYG16
	 1b1x5llcZE+Dw==
Received: from m1-u5-ing.websupport.sk (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m1-out-mua-15.websupport.sk (Postfix) with ESMTPS id 4dSZX30SCHz1N1L;
	Fri, 12 Dec 2025 17:23:47 +0100 (CET)
X-Authenticated-Sender: mh@probably.group
Authentication-Results: m1-u5-ing.websupport.sk;
	auth=pass smtp.auth=mh@probably.group smtp.mailfrom=mh@probably.group
Received: from smtpclient.apple (unknown [109.164.127.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: mh@probably.group)
	by m1-u5-ing.websupport.sk (Postfix) with ESMTPSA id 4dSZX21BWdzGMVD;
	Fri, 12 Dec 2025 17:23:45 +0100 (CET)
From: =?utf-8?B?Ik1hcnRpbiBIb2xvdnNrw70gKFByb2JhYmx5IE5vdGhpbmcgcy5yLm8u?=
 =?utf-8?B?KSI=?= <mh@probably.group>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: [PATCH] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
Message-Id: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
Date: Fri, 12 Dec 2025 17:23:35 +0100
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Out-Spamd-Result: default: False [0.40 / 1000.00];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:44489, ipnet:109.164.0.0/17, country:CZ];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_X_AS(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Out-Rspamd-Queue-Id: 4dSZX21BWdzGMVD
X-Rspamd-Action: no action
X-Out-Rspamd-Server: m1-rspamd-out-5
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 2219
X-purgate-ID: 155908::1765556627-C232F043-832C1352/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_082353_223968_991ED887 
X-CRM114-Status: GOOD (  11.45  )
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

The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet =
controllers
connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
Currently only one interface is functional because the PCIe controller
nodes lack the necessary reset GPIO configuration.

Without the reset-gpios property, the RTL8125B PHYs remain in reset =
state
and are not enumerated by the PCIe bus. This results in only one =
Ethernet
interface being detected, or none at all depending on U-Boot =
initialization.

This patch adds the missing configuration for both PCIe controllers:
- Enables both pcie2x1l0 and pcie2x1l2 nodes (status =3D "okay")
- Configures reset GPIOs (GPIO4_PA5 and GPIO3_PB0 respectively)
- Adds corresponding pinctrl definitions

With this change, both 2.5GbE interfaces are properly detected and
functional on the Rock 5T.

Tested on Radxa Rock 5T v1.2 running Linux 6.12.


---
 .../boot/dts/rockchip/rk3588-rock-5t.dts      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts =
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 0dd90c744380..aeb8e0d42f09 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -68,6 +68,20 @@ &pcie2x1l1 {
 	status =3D "okay";
 };
=20
+&pcie2x1l0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pcie2_0_rst>;
+	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	status =3D "okay";
+};
+
+&pcie2x1l2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pcie2_2_rst>;
+	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
+	status =3D "okay";
+};
+
 &pcie30phy {
 	data-lanes =3D <1 1 2 2>;
 };
@@ -101,6 +115,15 @@ pcie2 {
 		pcie2_1_rst: pcie2-1-rst {
 			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO =
&pcfg_pull_none>;
 		};
+
+		pcie2_0_rst: pcie2-0-rst {
+			rockchip,pins =3D <4 RK_PA5 RK_FUNC_GPIO =
&pcfg_pull_none>;
+		};
+
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO =
&pcfg_pull_none>;
+		};
+
 		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
 			rockchip,pins =3D <2 RK_PC0 RK_FUNC_GPIO =
&pcfg_pull_none>;
 		};
--=20
2.52.0


