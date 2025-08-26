Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D2CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PjionKT6OwbRK0J6AUKOW0mIzZnze/DXEyeszRo0i8U=; b=QSdncu+IdTrwHw4A/OBEMz+W8S
	lhzL6oKEydyqlTdW+ZOghmrW6Ecl7hSAWQo/Ab7Gp2i2FgLjUbITmOuNlmRkLQTx/KKMWFK/ozbsU
	XPMRo3EGh4ZwrphG0KO8xyCRJf6pMWWYnGKHdubvEwa6XIlxNpvf5jxEVy46Xpcg2LaLCPWo6u5bg
	9mJSJCpG2teCCKL9UIiFOijN9iazZfdRkjTnUslNGXZmwT1rXF+zsQBSsBQtyLI+UoUvDsmyggqrv
	e4W9066ndjM5mmFEwmpAEOoTf5dcyEOQfDFH8rMbsW4jvIfimJYN0er0n6ZIuUZgpGxg4UVnCRjlS
	bg4+KS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoma-0000000AyDc-3OLu;
	Tue, 26 Aug 2025 08:11:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqojp-0000000AxoN-2OVX;
	Tue, 26 Aug 2025 08:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756195730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HQT7tDXC/yWwR8w6bz2TMYXR6rQDcAJexCzbhZsVebCfj85wkK5c3mZ3rbJEX/FjfBwowuPO3wIxnTdPhamDRigWpije91EZViPco6iyGcgOxowyy4QGkvm1jQ4nB4xgm/zeqrPJnBd6UMWJaZA+szvgV9N8iNMuPdvfDaAz0DA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756195730; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PjionKT6OwbRK0J6AUKOW0mIzZnze/DXEyeszRo0i8U=; 
	b=HzmJv0eSVmM8YX/NhQ9J9hvL8MyPfepRjKpKhV991yQsSbMAkyYsOS2jabB9Vkj4CvUgFU7EG11brpvOrZMQY/XQF3NX0frTyK0RO51sQo6LKRV5rX+KqOeBO/6DKlAQaNvzcrizUUEmIHD0H+VCKzFYM5ijKI6Iw1oV245Jx0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756195730;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=PjionKT6OwbRK0J6AUKOW0mIzZnze/DXEyeszRo0i8U=;
	b=axxKgrpiEQTwmD048MbUk1jSWzdYLEB2NtX7ls5Q/aX8gtKFMR8+ffhqKkkKkhsy
	D2YiMEz0zgRDEWilKSx6Rr6/0paNgItNWJ8Rg2o4YZ8QEqyTUA6pUlCx8ILpAuVhEdd
	rsDVBcgr1BH5CIgHEp0MstCmtxzHj7dCshUAU+/g=
Received: by mx.zohomail.com with SMTPS id 1756195727126157.99311646141769;
	Tue, 26 Aug 2025 01:08:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 26 Aug 2025 10:08:36 +0200
Subject: [PATCH] arm64: dts: rockchip: fix second M.2 slot on ROCK 5T
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-rock5t-second-m2-fix-v1-1-8252124f9cc8@collabora.com>
X-B4-Tracking: v=1; b=H4sIAINrrWgC/yWMQQrDIBAAvyJ77ha12Eq+UnJIdG2XorZqQiHk7
 5XmOAMzG1QqTBUGsUGhlSvn1EGdBLjnlB6E7DuDltpIqw2W7F6mYSWXk8eoMfAXVSDjzGyD9RJ
 6+i7U9X97Hw8u9Fn6vR0S5qkSuhwjt0Gs17O6YXEXGPf9B1vV+J6TAAAA
X-Change-ID: 20250825-rock5t-second-m2-fix-1fe5c5b8f8d0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, FUKAUMI Naoki <naoki@radxa.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_010905_697853_04C518A4 
X-CRM114-Status: GOOD (  10.80  )
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

The Radxa ROCK 5T has two M.2 slots, much like the Radxa Rock 5B+. As it
stands, the board won't be able to use PCIe3 if the second M.2 slot is
in use.

Fix this by adding the necessary node enablement and data-lanes property
to the ROCK 5T device tree, mirroring what's in the ROCK 5B+ device
tree.

Reported-by: FUKAUMI Naoki <naoki@radxa.com>
Closes: https://libera.catirclogs.org/linux-rockchip/2025-08-25#38610630;
Fixes: 0ea651de9b79 ("arm64: dts: rockchip: add ROCK 5T device tree")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 258c7400301d7f77517197ab433946bbfa39cf63..d061fbc897552401df1a73da12fc0614d7edc2d3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -68,6 +68,22 @@ &pcie2x1l1 {
 	status = "okay";
 };
 
+&pcie30phy {
+	data-lanes = <1 1 2 2>;
+};
+
+&pcie3x2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3x2_rst>;
+	reset-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pcie3x4 {
+	num-lanes = <2>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -90,6 +106,12 @@ pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
 		};
 	};
 
+	pcie3 {
+		pcie3x2_rst: pcie3x2-rst {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sound {
 		hp_detect: hp-detect {
 			rockchip,pins = <4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;

---
base-commit: 89d926fa53d0a6c257c4e8ac1c00c3d9a194ef31
change-id: 20250825-rock5t-second-m2-fix-1fe5c5b8f8d0

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


