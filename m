Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122B3CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD+ajNxptu2k73Oepl6KZlA3PKs0QXwWaX/tcX3eJ2g=; b=pW6KfeoNDsdchbvRB2Z9/vVOAF
	26Dvw/c7cnoXh3pD0FO2ehiVTu1So9gUhHjWcN59pqxrzCr3uOAfnlZTPDPOPubi+aBbQEPK7N9Gw
	g/4EiEzEgK273ILl18tv9pfaEfb7t/5llEXtwADBh2iFKQoa5iRlE7z84O2kjoGjri3FSoOVB0bAB
	lYxogIxE6zP9toVChXPBdh7297zf+dwlpr0rTTZW7XXu1GeYm7hgJy3tRvvfsQAFoMXtEWzrhpSmb
	u+cXWDcxWFJeZ7cVI1+4x3hPFTM85zlpaIKlOtBhzzZrT8M7OGX3G0C1VkSzmHdw7nffTbdXHYA8p
	GdMrgjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET5w-00000004FBI-3WHk;
	Thu, 30 Oct 2025 13:53:40 +0000
Received: from mx-relay144-hz1.antispameurope.com ([94.100.132.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET5s-00000004F9w-1fF0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:39 +0000
ARC-Authentication-Results: i=1; mx-gate144-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=tD+ajNxptu2k73Oepl6KZlA3PKs0QXwWaX/tcX3eJ2g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832406;
 b=eKlNENyiAJ2mFBS/xmvLNz/qXkOK1tWj8OyzIwU3lKbN2SZHR/3EC+zv/1yHOMvS7FT32FIC
 D3fAyR45wyYHKiq5HJsiuQMj/CoTiu7+hGCZftDABAVrMHSZ3hgzxVHJjSVsjyvgvwP6k/E/nII
 eSHM2wqI+GXGYVSKPj94XSnrgQdYrY5peUaA7lfpGkgoNgp2dorHK5qbTXtaq7HHTs9+f21qpch
 2J+JYt0wCBD0wfR7eH8/VN9d8Wk0QaHKdQuTY8mmDx/kIO9IPOtBA5jRum25D6NAQkD69NLe6rH
 jjNB/4BKqjsbXpSYis5p/pOIldM0wkZBSibNOBXTN1S2Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832406;
 b=hIwbjeCgr7UQ0kibWY2PxERCenLDPinKppiNQvaH/ZyE/mSKfqttFdgkeC/WkpLvWChokiyb
 uEGustsZEOdhcWiew3S8kSkfUmKmZdbpDFeh6JvmickLVsUE7aFtQ+DMbYZSH9nYDWau2gx0Zll
 KaQv78IwOMLU29gVy9YhCeqjlZa4BLJeZXMk4eJdwDjCsdP3y6hRaayhE/ZoAsRER1y75LFORDS
 eRYK1W6FD5rN8btoOyqNSROOCCGb8YYMYHkQBrlkUTfL3JftHDXe/lWtLxNmxnyEGbXEZOGA0Ry
 bkTczRUJAbiBySsZJ5fDHUsfbUVCojSyg1G74IRhUTocA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay144-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3E3895A048B;
	Thu, 30 Oct 2025 14:53:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
Date: Thu, 30 Oct 2025 14:52:53 +0100
Message-ID: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay144-hz1.antispameurope.com with 4cy5D70PDbz40bjJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1f356f726ad2319c426137b927962cc3
X-cloud-security: scantime:2.049
DKIM-Signature: a=rsa-sha256;
 bh=tD+ajNxptu2k73Oepl6KZlA3PKs0QXwWaX/tcX3eJ2g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832405; v=1;
 b=f0CB97x/lAHokBHiJ63uTAJcj3mp7d1Es86DvbAB4OZE8ipytIUCQH2WaOD70BrJd2K6HVGa
 QZf6aIJr0COQsNid5Arb+ety8Ew50Wj+TGRn9UicNHP1HiHhwonnGOm2yrynQX/9lBBmKgVd7Sf
 rv4aDNul+SRdvxuUNrmSybENBrNKyLXQg/6+YSjowimD3NYUG4AkNqUtFkI81O8jSclrQryxgCv
 UKoW+Z+CPddnnKpT8fcXtj72VY8EyCezmwrc/Jp1L2ZvwmKGCjedsmvSMCEunxoDamjbV3910no
 nzW747DYEt8Gz0WGqlEvecTPMGYccmPD5VE9BX9cA01JQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065336_929782_F5A4B4A6 
X-CRM114-Status: GOOD (  13.34  )
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

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index b7136982700a9..a6ab94208028a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -165,9 +165,8 @@ &gpio2 {
 
 &lpi2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c1>;
-	pinctrl-1 = <&pinctrl_lpi2c1>;
 	status = "okay";
 
 	tmp1075: temperature-sensor@4a {
@@ -264,9 +263,8 @@ expander1: gpio@75 {
 /* I2C_CAM0 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c3>;
-	pinctrl-1 = <&pinctrl_lpi2c3>;
 	status = "okay";
 
 	dp_bridge: dp-bridge@f {
@@ -301,18 +299,16 @@ dp_dsi_in: endpoint {
 /* I2C_CAM1 */
 &lpi2c4 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c4>;
-	pinctrl-1 = <&pinctrl_lpi2c4>;
 	status = "okay";
 };
 
 /* I2C_LCD */
 &lpi2c6 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
-	pinctrl-1 = <&pinctrl_lpi2c6>;
 	status = "okay";
 };
 
-- 
2.43.0


