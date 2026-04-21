Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD17F8FA71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsNfc9BYPkqvMlOPgTpg8TgcxapJeRKf6NqTaHfD5dI=; b=oCsIoZduVjW0R4JUphfoVxR+9L
	4FxhbZVA4J8dmwA7TdwjI3tOCIxtKmDTE9Xq2EcvrCypiD4mPfMgd1Ja3G/DEZJAiSx/vqTFMpovf
	AYo6enwnDQA7Qi3WNBM3etWFZyJNqqxx2Zvc7kZfoCTdF11MoEr0CB5eYKhP2659AMnqazFE1m5gH
	Gj2E3i/AT3rxxnToFzMHXdXyEKiM+kAEJ8dWqhiM3y6d9OoLmwNiod/i+kjEpHx7fK+I/DrSeGJTB
	1DcPmA/6Xm9P8+WFJ3K7AQ2KDdHpRAzNjJXaK8Y6o+vJmbBVpZ5WxLFCx54vwj5K1E7lLViHzi8BO
	pv5XTNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cf-00000008XZV-1W4z;
	Tue, 21 Apr 2026 11:50:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cV-00000008XNj-2zmn;
	Tue, 21 Apr 2026 11:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A66DF4471B;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6828CC2BCC7;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776772222;
	bh=NFdn41ZvrKDWcDcQoALKM1WDPndu6bk+UeLGgAzHlGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ll/9ji7mle9oW9gKW+WtLW+MYZT9xkvc1lqhj/ravus8AYfSqcH2lkb1bvQiAulcq
	 Y8x6KLDbiJqllmuPyEDvvIXnSdd0l96TQPTWFfIqI/Zzxyg9OYLm3NaTcg/kpDp0Bi
	 vvsRMQY3o64HnWsmOvUkZjJMQa2d64UVgPJ4skOvR9eo4etJZ2+YtM7GtI/Npuie5t
	 8yCGUAOEA1xBbCwcJpAQT0R85ENokMGFiqqVWi7LGoPC8aBGLlJZXl2rCdFA/4Kxgv
	 uXcYnuu5cV66hWvUvStQw9M8AU+5xXYp1wIKX63MGSPRUV7CQdIUOGhGP80krp0/pT
	 ULV6Z/mkiwmMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D96FF8FA61;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 21 Apr 2026 13:49:23 +0200
Subject: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=835;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Y66wwsu4uCJ5vCnrkH5iYoYFi2DeQ8efaTE8Rt+0Rik=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+bzlArxv1e5Xx0o0Ptf4xeRq9XBfmHhWkPBZYfuxR7wl
 38x69C9jlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAi8VGMDM3bdx9dn3GqLuxl
 VF/4M4sHaZm/V0Z4/Zx/wrvNXd1Lw5zhf+28NS3VroaqLpbvTB/K3jWeF6esXRuQzszjyrgy/ux
 +dgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_045026_150905_017A3926 
X-CRM114-Status: UNSURE (   9.05  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..e96fe10b251a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,16 @@ mux {
 					};
 				};
 
+				i2c0_ao_d_pins: i2c0-ao-d {
+					mux {
+						groups = "i2c0_ao_sck_d",
+							 "i2c0_ao_sda_d";
+						function = "i2c0_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
 				pwm_a_pins: pwm-a {
 					mux {
 						groups = "pwm_a";

-- 
2.49.0



