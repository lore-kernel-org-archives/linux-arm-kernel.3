Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4553C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhtbCU3GSz2mEXV2JGmRz2FQjficBt4XaAng4rRz9xo=; b=3EWTRHHcAUqeo0UFa3VLD2SC6w
	Ub+Fnha1fEnk8P2l9JVE1K3KuNH6Yw5g/AIT925KjHq7gNfDXwMZputWvbShW9raIlCIJgPRekuBj
	euYiXCGt0V66lv/qob2/B4ufTTLqhwJeSNqhBVwcSBw/gzYEyl5gpSLTgqHRD57uT65knQptq//wy
	KnoOzV+bh5b08pSu9Au9r+P2uMDrWWZPqF1p4FVhZ/TNm1jISBVSnhsvP/uRD0zAJWBh0C7TLauEM
	C7GQdo0w5lbbmcZb1xhSAuod/bXo8hx7KitUBsVCwjGrUhdZt7goG1BKV67U/F8QqTBZ5VbcyImfM
	wu66bCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEhi-0000000F1TR-40kf;
	Fri, 11 Jul 2025 14:26:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEdp-0000000F132-0vvW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 14:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dhtbCU3GSz2mEXV2JGmRz2FQjficBt4XaAng4rRz9xo=; b=iayynzXaOwJt735ZltZ8z/vEYA
	HL4WkcaKX7lbvp8MUijFqhQVLcrgt3ZaTE27kxNhZvt4Qvd/btc1Jir3HKajfRHPo+fYa4NHNE185
	mcm94Zi2T2BucldpkA+bht55qpGEghdYYO21coYZMKRrZRSceZC7twV4JQhXGvLqaZ995/dC5vfxm
	RoCtF5zYHxAKf/2gNWN0OuhK/IpG9myDUoZUje6Fo6YR3LCzu6FzjoV9vuH+Ay9ExX3ZAvOMlsvjZ
	beT3/MG/Fc70z/tFzb7gGVHD87cSr0H9ALzFcnYvdyRuh04H237Pmeb2dI4lIZhwal02M6+cRrzCG
	A9jC01DA==;
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEdk-00000009I5V-231Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:22:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752243715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dhtbCU3GSz2mEXV2JGmRz2FQjficBt4XaAng4rRz9xo=;
	b=Lg5ijLxO5CRdonuTMfVh2iFNTsNoo2FIm5duJWI8gUfMuR2Bqp0Ouoql8t8y8woakXJqf6
	J1nUXUX/uEN47Dn/ddcfqA1zfk/F8U6dPoCltAT9zwjL86Iv0q4nJAG0xdcOMw52fwzcWF
	gZOugybV2W0FrVZbF35XoUoWeG9Du6Fl8y3aPoMnVlPQK2t5B/y9EQqkK2IkToQoTUQqqZ
	wtbLxp/eiSnvAJ6i02TlLOjtVu3CRZrkwGL2TfBYcT8nRDWFbfddTefKRjDs26GK4wRUOF
	c8mnidSdNzSl9ti5K23O3vOZMZy0YFuY2YPTqNQbeKkctXD1RhKNuDMizKBINw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2] arm64: dts: rockchip: Add reset button to NanoPi R5S
Date: Fri, 11 Jul 2025 16:20:37 +0200
Message-ID: <20250711142138.197445-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_152217_057262_39330B0D 
X-CRM114-Status: GOOD (  10.52  )
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

The NanoPi R5S LTS version has a reset button, which is connected via
GPIO. Note that the non-LTS version does not have the reset button and
therefore on page 19 of the schematic version 2204 it is marked 'NC',
but it is connected on the LTS version.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
Changes in v2:
- add 'pin' suffix to pinctrl nodes names/labels

 .../boot/dts/rockchip/rk3568-nanopi-r5s.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 3b31f0dd8f3b..c12bd01e2805 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -17,6 +17,19 @@ aliases {
 		ethernet0 = &gmac0;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio4_a0_k1_pin>;
+		pinctrl-names = "default";
+
+		button-reset {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "RESET";
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -127,6 +140,12 @@ eth_phy0_reset_pin: eth-phy0-reset-pin {
 		};
 	};
 
+	gpio-keys {
+		gpio4_a0_k1_pin: gpio4-a0-k1-pin {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-leds {
 		lan1_led_pin: lan1-led-pin {
 			rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.50.0


