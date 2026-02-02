Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CFD172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sv3rE1ysKqQy3NPOcV7JVfxCOKmaA0B89vDL2+rHKJA=; b=V6jSXPh7TVxd4zgcNsYFnnVbTZ
	aCs7bvxPdvylggVaYFwHnWbusj0boobPl2aCP5dQOsKVVm7tMaq3iZ+snEIG5d6hCwFgG+/N/ZnuC
	jg6LbAZqXZCiyvd/VCV7YYsvMnLuI0iUWGjrdzQhcVkDCKlBliniUPlGt2i15uBCq/q/uYipQZ/jQ
	x3jci0JnZu3DuJjgswWmnueZVfDz/i+zwwh4Tn7J+/ueN7wIYA/lPQM/w/V8LxKH1imoFggNX4HjX
	gGP/VSjfqcwPelfBFn+unidl4QaTShWXXfSXmx6dx5oOBSbJpqaafhRBqKSDisClkv013Q4vljWn+
	dkOSVLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnSx-00000004XiB-1L67;
	Mon, 02 Feb 2026 06:31:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnSu-00000004XhP-02Kv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 06:31:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-352e2156450so1902263a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 22:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013875; x=1770618675; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sv3rE1ysKqQy3NPOcV7JVfxCOKmaA0B89vDL2+rHKJA=;
        b=fqN0Zc45x0ZHOtbUoypSH3lzgIAI56uy4qtHTlOMDvit/WCFxyEwgWfYL8TWx8+/8I
         yU/D5LEY8+9W+dR1qpJOb4WnM5CXX/MEzfF2Kgkae1lRerTb2ivxYQR7kHI0xKpUruSN
         EsXcIHFsCdyzuoLKLNnOrXSvGMHWtYQfzZ3H6ocaTsnGyxVFTQ4RhfX4qTyCUQ6+nFUd
         nNuuMyWXzhbdB6VoFgjUOqk+Ggq8dZwgAx/sp1sR1jQEoxnhwYXuYN/i1IK5kHuELb9f
         Ao4epn10TfIOKcd4mWi0hn9lsT3R6G5wcj/gpWE/EHIvD9fMldVFyNbPV3CWxP9bCg50
         5EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013875; x=1770618675;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv3rE1ysKqQy3NPOcV7JVfxCOKmaA0B89vDL2+rHKJA=;
        b=iihAzqEdO5kT44Hqj4NPGMgRAOY8fAQ+tdClqGQkSs9CJQSQLzd/M8JcoWTQPdU+JA
         Yg5I3dmUoj9FFN3ewxRY2tjKpXIwDc2lEVyUKzv4Ai7Cf0B6AM9WCBVw/8eUsYyHScMQ
         5IhziG2lV5mUh2B6hT1TiSqbFZLSIwzksTnyFdYhf89tRW9aeujEKNlZxJumyBtfllv9
         qIFE5pkzAObjjywEalCpLfw9Q79wkos1dEVyIXN0NkS7FtfhgtjpY0cv2NbhmZev4gsu
         7lvh9mP3hfMtvdppr6F9EZGeaHqwNjWPiKfxt7xs1Rq7Bqq+mI9JlNss0IxVL/9/G24D
         0TIA==
X-Forwarded-Encrypted: i=1; AJvYcCUPhwxPcRMlsZ184WzqXbmnTn5cwx0XDA2xF6n4ugAQtneB1hqWvwuCfUqLqrz8nO/HjaNtYVD1VBz/rmiNnRYa@lists.infradead.org
X-Gm-Message-State: AOJu0YwfwIEFyDahhv49SbD8yf/kbnMhnr9/HVCr7Rs8anqj7dZSLsJ6
	9Too5OqFUm1F8GGQrygSbzQpvnAWXZFYIiG9FrxN66tdT7Cv/VUf2fsO
X-Gm-Gg: AZuq6aJ+QsTwi3PnipIv0s7G9rG+lO1l41oOVJ//7XB8Lme7Bc0HD39GUfiZK6bMbVN
	NU5AFAqchK9X1mK3Hl1W6Q5xfAk4DUBiia5gZ+Iw46hgHXv1QZQt9msMZi21K24BJY+v7vs2apX
	rBXHn/RfLJe8i9mkHZGD1M0hD5JTc7KFWj4CT1nM3wn/Cd1gpJQhHcX924F/xHoqvBrbbZ22t9y
	ZK5vTTEiNaZPfZElEG4O5fNjjXsisp5uv2GNGpkPP7Xg6WfVYdc/F6xJ+WxMNJPcRm88q3PbN8J
	QSb+Vid84f/imXTExq0xB2ogcP/mhQtP04Al2pWELadedH2J3kEdzygDKqXfAaUQhi7iQlVkXTy
	hF+buEsQVLjJjIHv4+f5uDYUMCpUK7cQcKV344aidRBXJ/+cBu8WYLFs/rPW1VYDzRYgsAuiU7X
	eAk1mO/Ek=
X-Received: by 2002:a17:90b:1d8e:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-3543b3b0485mr10527577a91.29.1770013874627;
        Sun, 01 Feb 2026 22:31:14 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add5199sm12618288a12.31.2026.02.01.22.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:31:14 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 02 Feb 2026 14:31:09 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add new sgpio line names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-anacapa-dts-sgpio-v1-1-a3a7b0b087f0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKxEgGkC/x2MMQqAMAwAvyKZDdRiHfyKOMQ21ixtaUQE8e8Wl
 4Mb7h5QrsIKc/dA5UtUcmoy9B34g1JklNAcrLGTaUBK5KkQhlNRY5GMPLLZyHnrg4PWlcq73P9
 zWd/3A/yELQpjAAAA
X-Change-ID: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770013872; l=2902;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=rcsDqb46gaG3yFjHYrMozn3xXMZ6ng4if68dtMxMODg=;
 b=h0rG6nZWmvlMA1n0nv/vBTwPtlPrvH/aJySv3L2Cbby17HWgvqZhBr+hvbyix1LQVLmKOioT+
 p3TXHipXdM+AM4KQqBcgXkHTkppTmXNIFOmRPtf1WG5Iu/BXOecASMs
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_223116_100774_6C474B45 
X-CRM114-Status: UNSURE (   9.87  )
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

Updated items:
- Add BMC_AINIC0_WP_R2_L and BMC_AINIC1_WP_R2_L
- Place LEAK_DETECT_RMC_N in the correct slot
- Add PRSNT_NFC_BOARD_R
- Add IRQ_NFC_BOARD_R and RSMRST_N
- Add DC_OFF, EAM_MOD_PWR_GD_TIMEOUT, CPLD_AMC_STBY_PWR_EN
- Add FM_MAIN_PWREN_RMC_EN_ISO

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
The following changes are included:
- Add BMC_AINIC0_WP_R2_L and BMC_AINIC1_WP_R2_L
- Correct placement of LEAK_DETECT_RMC_N
- Add PRSNT_NFC_BOARD_R
- Add IRQ_NFC_BOARD_R and RSMRST_N
- Add DC_OFF, EAM_MOD_PWR_GD_TIMEOUT, CPLD_AMC_STBY_PWR_EN
- Add FM_MAIN_PWREN_RMC_EN_ISO
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts   | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..37bccf64c77b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -852,15 +852,15 @@ &sgpiom0 {
 	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
 	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
 	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
-	"Channel4_leakage_Manifold2", "",
-	"Channel5_leakage_EAM1", "",
+	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
+	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
 	"Channel6_leakage_CPU_DIMM", "",
 	"Channel7_leakage_EAM2", "",
 
 	/* C0-C7 line 32-47 */
-	"RSVD_RMC_GPIO3", "", "", "",
+	"RSVD_RMC_GPIO3", "", "LEAK_DETECT_RMC_N", "",
+	"", "", "", "",
 	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
 	"", "", "", "",
 
 	/* D0-D7 line 48-63 */
@@ -893,7 +893,7 @@ &sgpiom0 {
 	"PWRGD_CHIL_CPU0_FPGA", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
-	"", "",
+	"PRSNT_NFC_BOARD_R", "",
 
 	/* H0-H7 line 112-127 */
 	"PWRGD_P3V3", "",
@@ -922,7 +922,8 @@ &sgpiom0 {
 	"BRIDGE_R_MAIN_PG_R", "",
 	"BRIDGE_L_STBY_PG_R", "",
 	"BRIDGE_R_STBY_PG_R", "",
-	"", "", "", "",
+	"IRQ_NFC_BOARD_R", "",
+	"RSMRST_N", "",
 
 	/* K0-K7 line 160-175 */
 	"ADC_I2C_ALERT_N", "",
@@ -956,7 +957,9 @@ &sgpiom0 {
 	"AMC_STBY_PGOOD_R", "",
 	"CPU_AMC_SLP_S5_R_L", "",
 	"AMC_CPU_EAMPG_R", "",
-	"", "", "", "",
+	"DC_OFF", "",
+	"EAM_MOD_PWR_GD_TIMEOUT", "",
+	"CPLD_AMC_STBY_PWR_EN", "",
 
 	/* O0-O7 line 224-239 */
 	"HPM_PWR_FAIL", "Port80_b0",
@@ -966,7 +969,7 @@ &sgpiom0 {
 	"FM_CPU0_THERMTRIP_N", "Port80_b4",
 	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
 	"CPLD_SGPIO_RDY", "Port80_b6",
-	"", "Port80_b7",
+	"FM_MAIN_PWREN_RMC_EN_ISO", "Port80_b7",
 
 	/* P0-P7 line 240-255 */
 	"CPU0_SLP_S5_N_R", "NFC_VEN",

---
base-commit: 26705fad17bd111f062f4208df2dd60e7a9c2ecd
change-id: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


