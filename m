Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2DBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2O7OWujKPcvRO4SoeKUIIBPYvboUIxZ8mX1ZEFSWxw=; b=C4fEF4IwwX89eT0CVW+p/HHtuz
	BnrWZMNzGTqfjFdrw3PCeFvV4GtHlzLP0mrKuq3X95juDdxKQdn6NIlirOm5Tve6G3EyZKw4Mh82X
	LHF0yFfYUNhukDY2+oHp/uq3BMt4bnEXw/lcDpfd2Os8CzcxhcvLiDEV7qRMriNr0b6orn1OA5YlG
	Y/sTk6nCdAROAyCIDwS1FGDcYu+1az99FprrkPS5d6NYuWFnWDk5cKt6kcOspkDo7KKFlfELRu8a1
	a3BhhNevCgDO7z5MN44eIiN788ScEPS4gPBft7LnrdNj2Boy+0e2CyclVE5+t6iDzabthkL2u25ga
	UaLep40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSAs-0000000HA0m-4254;
	Thu, 15 May 2025 06:34:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRyy-0000000H8Q0-1qv1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:22:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 552A3A4C815;
	Thu, 15 May 2025 06:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD960C116C6;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747290134;
	bh=d/cnqlfcL3BEIbItF0LJzNxHyBvyuWmBbCAKSbuizjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tVYCy5BiWTIcFBQlyEw5e1tczA4Vd8O/Rjm+Ppmyppa52CiE4/4v2+hnoVZ3qOEfa
	 k6wH7ULrd/Db84pMvv+107oAX4fEgS/dEs4F2XswyyWkvHyRG+zVAxLCN2lcKYf0QC
	 V47Y7I9tvOhRGECfdES4PzA2leJpgzv941TKzgKCHo4O5AujCqwDdrrPDbeACMXbdK
	 RLrq+DWUyjM0MvXJrrC3WRA+gLXv6Nb5n6Ln4eGiRnkXRa+obwOQBHmgaSAhiPBuuf
	 rfv6b1Id093Xx8r8FygPWFZelL/7VSybEsblkwcFCDCFCF+9T6Ik52cenyKOj9aJG5
	 +65m6TeFhxFoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CECC3DA6D;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Thu, 15 May 2025 06:21:21 +0000
Subject: [PATCH v6 09/10] arm64: dts: apple: t8112: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-smc-6-15-v6-9-c47b1ef4b0ae@svenpeter.dev>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
In-Reply-To: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Wy1ROwTq/7w+Seef0bwqXl8fWrlwODCAclwUN7m+sTo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Zqh+DiqvoKrk9Bvgv6zB+YMZefOvSp4mZpm5PbmePX2
 SZGiJ7rKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExEZi7Df2f7x4q1d2y8Pymo
 9B09UH3A4mOKt7prvv7Lt4q3bZOq6xj+Z1XVaC7+yCCy5HaxVkXLddeCnfJeOzuefPkpnDM37xA
 7JwA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_232216_638135_BA4D0969 
X-CRM114-Status: UNSURE (   8.14  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..ff059fd5cd799e0ca7271ddb3d94871e36035109 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -839,6 +839,41 @@ rtc_offset: rtc-offset@f900 {
 			};
 		};
 
+		smc: smc@23e400000 {
+			compatible = "apple,t8112-smc", "apple,smc";
+			reg = <0x2 0x3e400000 0x0 0x4000>,
+				<0x2 0x3fe00000 0x0 0x100000>;
+			reg-names = "smc", "sram";
+			mboxes = <&smc_mbox>;
+
+			smc_gpio: gpio {
+				compatible = "apple,smc-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			smc_reboot: reboot {
+				compatible = "apple,smc-reboot";
+				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+					<&boot_error_count>, <&panic_count>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+					"boot_error_count", "panic_count";
+			};
+		};
+
+		smc_mbox: mbox@23e408000 {
+			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x3e408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.34.1



