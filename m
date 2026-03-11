Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425D91125847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP8PcAKjtgL6kY/iJ+s9NgDULWjFTdaiB417DZFinrk=; b=LcPn74pDgrXwUf3hNsnFvVLd7W
	p5WEDD51gZYixrs5YJrInsiDtT6wJjnDow2Tslo7XuIaLlojGuwji52PrxRGS/JA6Ty6Y7laICtoL
	Z+Glob3VxOzkBGELbJ992CywkRT8AEyK+jdIPjR7Oy7qBNcx9v2M+iUaIDMQ/mdZm72WSaIA8Qpwy
	TAjFDKoN6ZBZ9HfTjNuCAlFdag4WXJ4Dapzx4TaUTdJat0yJeGN0OtDe7kSru4hCZvf+1elZYfVOR
	scrW4q2uJvNoK224WFEsNawN80kr5FE1TFodu4zR8DNgWv24Iz/Z+WIftv/33CX2aanJajWnVqTQk
	uaTPpX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MJ5-0000000Bufl-2KiV;
	Wed, 11 Mar 2026 16:21:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MJ1-0000000BuZF-0LIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:21:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48539d21b76so207675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246065; x=1773850865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP8PcAKjtgL6kY/iJ+s9NgDULWjFTdaiB417DZFinrk=;
        b=m5uba46/SBpfcHyGNvMSYT6T7LNSRVFCVH51c38xzCQzzMOn10T6TKx8dN6oOIa6nC
         Vt1klNM2ZPgIVre7hDCqzKsOxOvZujTVzmgWlfPaTY8LKVoZ5qTviGfqU7IkpOXMPzPm
         MerTalpvoWCpZEjeKFiQh/9Q20VEVbhcwBy4JL7cXyeoJkv06Ab95vu70Xac5EOZI7nh
         2Y/N9VTWhkUo5dNguw+v/3PM4WP89KoZJNAf659KEbHgfNma68SV44UO1mSXymYO/mog
         Fpko6zcSiyFnvLzES2iUxwVmcWPpcdsvWdvMmW7UFrg63jY8YAFAS6bq+c378Nz/XRKo
         wyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246065; x=1773850865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TP8PcAKjtgL6kY/iJ+s9NgDULWjFTdaiB417DZFinrk=;
        b=L/5vlGSXRYp47UxYuiAzYxq50R2svGXgeavClA1GSdCdsLbiC8kc2JJo5YBh/vLjgh
         /5d8TMPCnZT6y7+SDae2Vi4pCCNS78jFx6OVHYeOfXZMhueYbSEmAyGdXaD+9/hhrE9S
         5Nuc+DpiFtbfR7MFfTOcFZyjp0I3qEunaod76ZvE5Xo1N3gU0oYgOckMAmn0IaMJPGFa
         ZrKtrcEhb+o4+O9kL79IXlqSM6pKIO2kEs09JsqGIwXF0uGN2AazIABX09E0xcTs9E03
         M14od/SexLL7bMbAeXPOCrZfofrw6z79/JBY8boeEMh5iFYmNe5l11kcJGzHl4PhcIin
         B/ng==
X-Forwarded-Encrypted: i=1; AJvYcCVx9i//IJ8heTn0DST8xB5bmx+t/HFdnnhPifcnF+ggqbkeSbLrZ2QCZ0xpSz3aUruqC8KF7xmUEMsSP3foYOEv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9PmbdKd/gMYVmGu1JUrzsZXriV4n8zro+YAPp/S04fxDrUVZp
	eAFItaUfzvFsTxhHLszNNV9Tfyw/VP6UJ6CvH88QfI17onw0BKzLHi/UJYgjcmdeFaQ=
X-Gm-Gg: ATEYQzzKSQGAxOw+dMgSSDsB1pH06MJfnBSfdW77XQT87gyOgUUgESCvK3oRglAgw3J
	Fk870uKhmskXd12Qo8vAMb0enCXqC70dGWKZBFXlD4bySz8eS+4fojSf/cZ4ifOdcobUPyzzcns
	3U++8dFgjzPvwcvloaZdmYCZBmtxpPGs1iHtQqTFwdaxv3X8koivxTIHiWk6WcEOBdFf7iQ01UM
	lzr77FBbmGlV6zYzy21fq9H+igNsEgbWvTMXEgb7i1Qr/xhns1gusxBQLITLB+wGX3RE6+ZnnLy
	m0JReIjc2GQ3xjHjz9cDb7LVRMsSMi5Ly/MA2GVbwngMJUYTfk88xhr51hCsSB9DcadyQ7iSXaq
	5zVNncBDhmD6p5cyg2wfiyRO26jVlqIUHZBB1ZAnQ3grXIDxBQ9OwjwTGJ/qzpqWaxJEh7+sQcj
	jPLEu69DX8KsnEzpSPsXbnYtlWagQbG+aHmhHglBQOwuqUcPksFWIN0X2078VxGsPGq/tPu+bsF
	l6wSg==
X-Received: by 2002:a05:600c:4452:b0:485:3c7f:527e with SMTP id 5b1f17b1804b1-4854b0d6a55mr54482765e9.15.1773246064959;
        Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:47 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: Add HUSB311 Type-C controller on
 RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-4-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=alchark@flipper.net;
 h=from:subject:message-id; bh=aTYkOItHw6/UdJWcy/m8IRD3FteMfp8S2ed7FbrUbHI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJay6ZFYZcH8+HXP9hmdf3RaZfF1d31xh8Ulzkp5o
 rnpH9rud0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVbxYzMsx/MFf/gu+v3T8VhQo9TyvVMOW8ePEyME8sPVwn6VCxpgAjw2S/NUu
 uLLpc1845+/T8YBMnHt7HzLti9kzVZZkiLF3HxQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092107_144394_7A3B132C 
X-CRM114-Status: GOOD (  12.15  )
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

Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
its Type-C OTG port, which also supports DisplayPort Alternate Mode.

Add the required DT nodes to enable basic HUSB311 operation.

Note that for full support of mode and orientation switching, the USBDP
PHY schema may need to be expanded, such as in [1]. This is left out for
now until the respective schema is finalized and merged.

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/fe29a74fd38aa1beb4a8101fdcecebaf3444e5f9

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f5746bc2970b..59bc1ac6d3d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -768,6 +769,25 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;

-- 
2.52.0


