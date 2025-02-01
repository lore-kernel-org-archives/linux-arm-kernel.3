Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48FCC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bYnYzdN0LrCXG6ExV5L0/rVoVwbxiqa7GQkmlFTH544=; b=U+duRgujU/cILuE3t7u1qfbYYp
	fe1CVWoUFNc/m4TuWAguzXshQ037LwUvfzJS5lmZuQNgsujM6uT+MUhY/WadyFlfgSkLjTkt+7pT8
	1Z4MkT8x7jFCEG/LxIhtXd9zmF4qR9iDgXg0LZeE0AegoPz8PTJGtqQOfYB6pDMltcfkTlLAFERfn
	ptWfpqKu/a9ehpk6v3oerGNYv5H66luqnZtrBo66N/LoLwQr5VjsvaEZSGulH2VzEKqY0IxakyJ//
	RHfioyXYlNFd4h/4X/VeCE1oCZ3+Fs/gUYbILmoflrjj2xe1tydPTfB+698HCPmSOQY7zbcc7ZSjS
	Iajl5xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teBgT-0000000CE35-2jbI;
	Sat, 01 Feb 2025 11:29:09 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teBf9-0000000CDvp-0mEv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 11:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738409253; x=1739014053; i=wahrenst@gmx.net;
	bh=bYnYzdN0LrCXG6ExV5L0/rVoVwbxiqa7GQkmlFTH544=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G3TSBP8WTtQhoJGG5ROQtbFoE3LoegLhXNR1tZMAauHQgpHmBbyfRtfDF0VLUT8Y
	 tCy9h3hvl4NfmCX+L32gexhfD982wkRCmLDC3NXWj0D3UR5OvLTMEn9XmGjww7CLN
	 8Joapv4eqtdJarIa2aKAv5Dp7FJxa0pRzK1of+xLCcy9XrDYVXp1MU47K1tIC3cak
	 tE/4IvHRFET9tNUyNZWEHjdlW/uof1LEmjwVFOCmMdY5sKOIR80gPjKAWZdYjvDAv
	 KWHLxlH2sC13p+XmnO2vZU0IyP/KJA8ZW3ItJVKMyciV8YYHmBcVqP94jSl1iPcVt
	 wZcemISWtmaGFMQNrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1t2w6H2uNc-00p9it; Sat, 01
 Feb 2025 12:27:33 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] ARM: dts: bcm2711: Fix xHCI power-domain
Date: Sat,  1 Feb 2025 12:27:29 +0100
Message-Id: <20250201112729.31509-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Luia7K8HRu8CPOl1DZ08abjM5+xgYl6+BOu88agzhpkP0jXD1X
 9pOsI/PcMy39byVfxit6gBAfewIyG8DZzXFCPECtN/c8fIGpO60NKXLpZbkryFGFCIcwQd1
 BldWA9krEwsRZCrdnSVCtPs0I9S5cFKQ1Clpukh+rWwGIJhvarB72GXtY1OWUjLV3XkSpYM
 ayYgMgCWc8EeYwhSbo6VA==
UI-OutboundReport: notjunk:1;M01:P0:qjyS1YNOivs=;+t/VVUx408bqwOLwq2hirzJWUbM
 v81cja39T5S77mtVXJfp8frg337c1TPNdE3lHZIPqcT/ja3qIzke5KjLmxk42ww7xsy1LELdh
 rnV5PT+Uo5WFZPC7EaOuCD16yD2/IZclfEIKgdVI/3YSpbGxbwCSnD+pX/uXY68RmKuh66QK9
 J7TvcfizuS0Wm5ajaKRH00P/5k7QOHfDd92Fu6OLqQZ57zh/d5WzDY695caAnR7dUYJk6YFGN
 dmucf9gATPxliCxppPFbbuVYaFzjmNNDAyRRGVCApVx6+C8KbHGqMVzgAcBOiA9V3re1468HE
 7NRzIvn9zZbYH0PsE5NOEfZfMYhEnve62b5DMdtAWrQDb71o2XfxUm0PlNWnsehcIsjCJu1E7
 vblydDW3gYuGqn7H2PVipLaPuTFGS2rYtT/WA7gT5KT7eR/V73nI4JI+o0LEB6RG1kBcAZUin
 NyDRfcRMVextnFuJ6/0qERlL5b/1XoCalET1nykT5cEapqVSF3RIYTJgBzC1CEDWdS6MttW/v
 0I6z+gE2+i6BOaFg9UE94RRa4PJoR9d/h4ysgpn3bYN/0nvc6KgVLycsGn2/eOKpsWZrts/YT
 3Rz7XIzAP/ysv0RpSdgqaxrssqQEkaaOpId+j1MaARIqmi+ceuHJ8QrP4W8X4sWVYTrf01Njd
 XnpSU4DOh2JzvpXirrqFG+evmsUZO3bDfUELHvQOBz9a5/Nl9pHj64WGhMmu1SsntEEe7YFzD
 yne7qQRdlwWd4pLNgmhxHbTKFvBKsGOkAOP7MMvkIPXOTCky6l6pPZnaKByoNGhYxxAMI0xXk
 d7Y+hhFxKfFrFFwMjLXWco1XDLHYA08b9EzlsizrSAPAmSxSOHxFEwF4JhB0U3wg0BjmKWhee
 zET/J108O9DSCVYapUnn0qzdRdXqtjZWNhRF16TtQj24zM2VijGJr3IlbVzqnuqgRPtaVhCaW
 yjTFyAF9U1uj98skdqMOohXhkyYCwHS3t5NjE8aeLPm5n/ekEluJRuK/Vo5tHOnBLDS77k3V1
 gfVdlAYMzNufItTxOs7rWk25e5cVQApCq8qZ5dK+PE/8NciDH973FxKFp/5HGxYnw9prFGuvr
 mTy33DriGLG7VHdAOILvHONEPp3B0tkPrymRsFCFZhwdf97XaxDQsNnmFwaDvfCXF6mXb6922
 us6AAYcahWROp/PpChW+450OrIJUDSwGVHkRuvo6QXS/h0Y6rgJKTSDQTezJebAC+cdvsmBhz
 alBU5Zf8ytZaOmaX8+c+8B9ZIiZ1XGHPmOG3yMJ3aRDXfNoNV2NmVFo2KxXnLKq8lVAHOtTnj
 tPL958u6yuCj+cSwjvIX+Py6KQDZGEAy8ymmPx8T4hgTgRNSQbuRGBDxxnGDXHADQnLUyam53
 zEWVzjsLR6eoc8oA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_032747_523777_1E2F4161 
X-CRM114-Status: GOOD (  11.13  )
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

During s2idle tests on the Raspberry CM4 the VPU firmware always crashes
on xHCI power-domain resume:

root@raspberrypi:/sys/power# echo freeze > state
[   70.724347] xhci_suspend finished
[   70.727730] xhci_plat_suspend finished
[   70.755624] bcm2835-power bcm2835-power: Power grafx off
[   70.761127]  USB: Set power to 0

[   74.653040]  USB: Failed to set power to 1 (-110)

This seems to be caused because of the mixed usage of
raspberrypi-power and bcm2835-power at the same time. So avoid
the usage of the VPU firmware power-domain driver, which
prevents the VPU crash.

Fixes: 522c35e08b53 ("ARM: dts: bcm2711: Add BCM2711 xHCI support")
Link: https://github.com/raspberrypi/linux/issues/6537
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 5 -----
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/d=
ts/broadcom/bcm2711-rpi.dtsi
index 6bf4241fe3b7..c78ed064d166 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm2835-rpi.dtsi"

-#include <dt-bindings/power/raspberrypi-power.h>
 #include <dt-bindings/reset/raspberrypi,firmware-reset.h>

 / {
@@ -101,7 +100,3 @@ &v3d {
 &vchiq {
 	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 };
-
-&xhci {
-	power-domains =3D <&power RPI_POWER_DOMAIN_USB>;
-};
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm2711.dtsi
index e4e42af21ef3..5eaec6c6a1df 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -610,6 +610,7 @@ xhci: usb@7e9c0000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains =3D <&pm BCM2835_POWER_DOMAIN_USB>;
 			/* DWC2 and this IP block share the same USB PHY,
 			 * enabling both at the same time results in lockups.
 			 * So keep this node disabled and let the bootloader
=2D-
2.34.1


