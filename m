Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A66FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUDHSpaYhTM0MBeAOADgsVN/8YIxpgXSREgpli9VDxQ=; b=gzSunhTkGykeDjB66yvhBXm6KH
	i2lQFnYQOPaP5vFt0qiIWmUbbBeqT5XeMf6iI0TNrf9H+g+SERZpzBd0zVAIqDQ5CaShX7u9ZkrYK
	geaJ6Qrw0EE8rH/pSG+i95r0G/ei+AfSigUCMhpO+AAMgGeA/5tWP71fGixpJPaq4QrnZHg5nAG6t
	elpaNllvllvxyQEbLnKzFRhQUftqEuR1pUaLZCiw/dxUaCvL7JQlof1RAIhNvCua/DYVe1037HZMI
	cntNZXLWwuQ8xGBFqcH/NAyFLHBByDHsb9saQo/YhS5qruV3jWO0xWtEHB48kENSrFqkOoNP+YHVU
	awEf3gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6C2-0000000Ax93-1xwg;
	Tue, 04 Nov 2025 01:50:42 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6C0-0000000Ax8M-0KEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 01:50:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0ry56v23z9srX;
	Tue,  4 Nov 2025 02:50:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762221038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUDHSpaYhTM0MBeAOADgsVN/8YIxpgXSREgpli9VDxQ=;
	b=ukJVPvGh+jPAzd2bTJM3eVvURU44gCZP64EThJ2NRe4oMxdWMz2Rbsn/MjNztsTKjVWYEx
	oDzzNfVo4WxMvt+WUAy35xZT8ABUEAZcdysCVTnZbnHWTgemkbqKtBVgAs33cLBlvyh8B7
	BLRqHb90xE3HuF0abJZNO8L+ec3n/6P2M1nxzXe/zRW6VgaJLGAHqxQ9e8jb3t8ihvUvym
	opB5SI4auDxm3szd9iUCYAMZYn9oWYQT41kTYaMxyuzeYM05nplqqsVX85gOA939JUN5IB
	ZcLHUlv/NM0kQiznvblVcfj6JvUBaHWpKcEXRptPcL/q8YsPzKcDGpufiai8PQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Nz0/zpV2";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762221036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUDHSpaYhTM0MBeAOADgsVN/8YIxpgXSREgpli9VDxQ=;
	b=Nz0/zpV2VQ8MgfMYtlSwdN3MtmMNXbZWWCs7Na3VxwDqQWNNUzmsvSWzkY0PXgOZElGZKK
	1eoqvJspPTAUyEzoFv8U3HIzTzo/bKbiBiLIen/eUZ5xNdZ4viALN1Ow9f/jlkkGFkMtKL
	tYpWtT8E1emmoWDmSSQXYcFMfB/EETCat25k0HKnJYit80h3wwogHn7AbgNOxQDoS5W/AE
	Ylw0F/K7EoVfg+RlVhBd8wetjya0e4gv25dHH+CWqR8alt2X0gXQadlKTNRR/TTExT85zn
	DHI8SWyozPIY2azVYU5ZRtgnQ4lE0gVFSCmdRw1anCBde25I5TUZSqWjgMY4vA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp: Add missing LED enumerators for DH electronics i.MX8M Plus DHCOM on PDK2
Date: Tue,  4 Nov 2025 02:50:13 +0100
Message-ID: <20251104015031.219863-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: d7f6xkzgu6my1hhenurh89d46ohba76d
X-MBO-RS-ID: b536646df4ffa1c32ed
X-Rspamd-Queue-Id: 4d0ry56v23z9srX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_175040_263450_C400DA75 
X-CRM114-Status: GOOD (  10.76  )
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

The LED enumerators are missing, which prevents the LEDs from being
accurately told apart by label. Fill in the enumerators the same way
they are already present on PDK3.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
index ebdf13e97b4e2..3d18c964a22cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
@@ -88,6 +88,7 @@ led-0 {
 			color = <LED_COLOR_ID_GREEN>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <0>;
 			gpios = <&gpio5 22 GPIO_ACTIVE_HIGH>; /* GPIO E */
 			pinctrl-0 = <&pinctrl_dhcom_e>;
 			pinctrl-names = "default";
@@ -97,6 +98,7 @@ led-1 {
 			color = <LED_COLOR_ID_GREEN>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
 			gpios = <&gpio5 23 GPIO_ACTIVE_HIGH>; /* GPIO F */
 			pinctrl-0 = <&pinctrl_dhcom_f>;
 			pinctrl-names = "default";
@@ -106,6 +108,7 @@ led-2 {
 			color = <LED_COLOR_ID_GREEN>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
 			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>; /* GPIO H */
 			pinctrl-0 = <&pinctrl_dhcom_h>;
 			pinctrl-names = "default";
@@ -115,6 +118,7 @@ led-3 {
 			color = <LED_COLOR_ID_GREEN>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
 			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>; /* GPIO I */
 			pinctrl-0 = <&pinctrl_dhcom_i>;
 			pinctrl-names = "default";
-- 
2.51.0


