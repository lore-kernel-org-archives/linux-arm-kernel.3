Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3298C106F319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo7kAUYzUkvmTUz+yb9WzUJT3jdN/N+TpszLcNplZVs=; b=Aqw3sFxa0JkdPMqx6xp7J1HuNW
	W73XXgB1VLHfmUayvxmzZL7YCslNFHoNGkPdn9UgI+qvz3rLosN6z2ZvFH4uVemYB2kTLRVzZq+87
	c3kjHHJS7lf94Atje5tirI9gHEg2pVPORJ5F2mdmM2LZgWPJH8DNmsxYSVwS+rkJlWWzM76ynGwXk
	VPMLCCC9jdq6nFg0D/sLLkTjtxrhDvUlhdQe6XCTzrU/zAktMBCmijdZTV1xJydihR377/2MeYCi0
	LG2bySVOH4NVFONQm4N5VrtEux5lziCZTCrswA5nXDDzoc29pwm+BQ6vOLrLKYXpzCVdsXQLB5rrl
	0x2rpSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXf-00000005D3V-0X1L;
	Thu, 26 Mar 2026 10:02:19 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXS-00000005CsR-473j;
	Thu, 26 Mar 2026 10:02:12 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519319;
	bh=ni2vmmGzstUniZCBMjYnzV+M4JL79GFjzwahbMGhrNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=s4GZQSwx1scCJOq3L1tMWMUjiewiIBhYu6e/2yKzx7C0jh6q5fg11taTjxPq3rxcc
	 YzOeZs9dsu/nPx3ZISfo0y15CKTQ+gqv2AhgkUuP7nhC+l9bsZyTopCsDy30iQEzE2
	 FJoeerh7G2ZDmrpnBGhQ3fCxGkhUwVhZQwnFPVio=
Date: Thu, 26 Mar 2026 10:59:16 +0100
Subject: [PATCH v5 5/9] arm64: dts: amlogic: t7: Add PWM controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-5-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, Nick Xie <nick@khadas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519312; l=2925;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=ni2vmmGzstUniZCBMjYnzV+M4JL79GFjzwahbMGhrNU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMwe+nhC/VqJvJcXTCp4eVxrCml9mJ/6Y1zPxa3ZmVjcmMtoBs6yC+JyzVJALZo/iunlpRQ/Gtb
 hY7YkxjEYsgg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030207_269037_2ECC1F23 
X-CRM114-Status: UNSURE (   7.52  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add device tree nodes for the seven PWM controllers available
on the Amlogic T7 SoC, using amlogic,meson-s4-pwm as fallback compatible.
All nodes are disabled by default and should be
enabled in the board-specific DTS file.

Co-developed-by: Nick Xie <nick@khadas.com>
Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index b66b3d10288f6..02a303d4ec39d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -511,6 +511,69 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			pwm_ao_ef: pwm@30000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x30000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
+					 <&clkc_periphs CLKID_PWM_AO_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_gh: pwm@32000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x32000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
+					 <&clkc_periphs CLKID_PWM_AO_H>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ab: pwm@58000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x58000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_A>,
+					 <&clkc_periphs CLKID_PWM_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@5a000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5a000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_C>,
+					 <&clkc_periphs CLKID_PWM_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ef: pwm@5c000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5c000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_E>,
+					 <&clkc_periphs CLKID_PWM_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_ab: pwm@5e000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5e000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
+					 <&clkc_periphs CLKID_PWM_AO_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_cd: pwm@60000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x60000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
+					 <&clkc_periphs CLKID_PWM_AO_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.49.0


