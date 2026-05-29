Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB282CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 01:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9rCaR21M/nc3/i6qSSe04SnKU+FWJmA2yPT3FUP/WY=; b=PRHs5478MOj0uj7nMaTbDeC4P+
	wffxxmAlo0fHamTj/xFqdTtuY42R5nmw47nqsO01skBdqdHeyLy99zfx02UpMIifnvZy5Cymp9dMj
	oijYHnNDTfpLQgnt8HSrkg6HpHW+s+j6XssQHutvo/TSwqQiULIHJngDqYNAk4OfruW0Y7MQEZWOV
	o3MHoiPgR2Vsab94bUxQSmBy3FH4f0y/tfxgcat0d/uv1WP0+H0qV2FqZNiIbkKbZVBoYCcrxovKu
	CsaFfR+aUoRBPBdAWVH4f9PYRFvJEUKPSHJU+wycrMQfYlJRqtp/ol/9boPtYsIZkve+wu2RUcbjk
	3VGXKm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlkQ-00000006b79-3Oc5;
	Fri, 29 May 2026 01:10:50 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlkO-00000006b6o-1W2b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 01:10:49 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-9639130b20fso1021954241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017047; x=1780621847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9rCaR21M/nc3/i6qSSe04SnKU+FWJmA2yPT3FUP/WY=;
        b=WrREz0Al/y33JBJD+obTOLnjyrotUbHr8ttA3igbkDeawVnWl4xd7bCrbdoMweZVLM
         pCM3gfOR/HzR+pxRF5AwqZBj8ZMlHqr4igV4+uzWyYOz5/WK6Oke/KO6nKt2lgwAtrnQ
         obUcSQH4NpdC2+NuZCmQaCQiU1hk7o4f+pg0uelcsyoiKPkSc1xtz+G8n2MdwF90POmX
         H8AgZjp5jf5PkN7aydkb/3WKSQmua9nvLihhkDIVmY2Iq8VppLENYJcyCidMHe9gZnyQ
         jNn5Q2RSAQezKCpbBv95E50AcrSGfFFXetSbgs3TXu3jV2SUim0lGLJI2TQRxi3/LgDg
         NpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017047; x=1780621847;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9rCaR21M/nc3/i6qSSe04SnKU+FWJmA2yPT3FUP/WY=;
        b=RWI6z065lbA2SFBZC8pqkLnaH2KEGkASr/nx8uDuQvLXCkhRKgued0iuLuvPmmgXUN
         VqgVqkoVehXUhuX6G2Y+xk8ejekbDJ6DUN6u/nCctIum81GXaKx3d4T2CrT8xcaf1FXt
         XsKQxlkEN/Wvm/JPJfqFdVZSiHX05MtDetT35pX9dWSYHDUmsvGSC0QA84u8Q0i+nSIN
         uKSC/Dbn7OylPhNV62vruyh40oiLpVFac8l/dKuRjWU3XRbWWzhqZ29QbmnwglVytWWO
         yezdm0FeR1u0q85aA8jJG2K9Tcpmwokg+xgmjsanfyzkxMvMqgR8ldlksS4FXw1VKfcA
         FTIg==
X-Forwarded-Encrypted: i=1; AFNElJ/aKDHgwJGmVzW4s/RYcjtCm8Eg8Hv8Q8GDu9y4FaSmu+2UyWZyT+MGvGgEEnLgsP6s8ZmYrAoJ/EHd22jIjzML@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01k/zHhUjAaM+h1bOgt3rK2ANJR28QqdlPZ6zufYsFKaT+0d0
	8DtJqzWelDG7Pk5wjo+xb+D90pwJMeAMmzbwefJDpFObbAeNjbX80znO
X-Gm-Gg: Acq92OEO+fY5b/mEmnzZEC2oGDgVdg8+D0n49nIaizUaGN3yQbiN3TJjMxu5kJ9gTzI
	PvkLWclfTWSCeSXOavDfDAghLK+tg5wwP/rvYb3X1e+CrAUFxEEHbq7e16mmxMCV1N6t34o55MP
	27Ji1mLeCxcy6AmxvdryAybxSwSO8sODg8o9MPV3CmYNx+yr6EP82E/MFJB8RwRu4IRBOA4O4un
	6jNR4e8WGHmbZ96nJLV5tBvEZhXQIyQ8WWuC2ZLelhFzwtmetyGtjdfJ8ZWZ984k/eL3xzOvm4k
	tze11NyuhZ5KvTXanhulvLc0aSDvBTq77FNMkUSJsG9vbDQ/XjkBA6uusiSU4ZZo7Py91CxuHtK
	3lzwDpdjy79mXYEPUdgZK5QOALvdQu1QpxcrfloGitm9IIniryzLGxZthoX9jVTmepNxv9uD3z2
	D0YGHxbhmPsIXmPzrBQdb8wlY=
X-Received: by 2002:a05:6122:3401:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-599f67cea76mr184555e0c.6.1780017046650;
        Thu, 28 May 2026 18:10:46 -0700 (PDT)
Received: from [127.0.0.1] ([2a02:6ea0:5505:7199::29])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9662esm311912e0c.3.2026.05.28.18.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 28 May 2026 20:10:39 -0500
Subject: [PATCH] clk: samsung: exynos990: Fix PERIS gate clock parents and
 add TMU_SUB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI7nGGoC/yWMwQrCQAwFf6XkbGAN3dL1V8SDXV81HrZlo1Ip/
 XejHmdgZiVDVRgdmpUqXmo6FYf9rqF8O5crWC/OJEG6EKVnLO8yWUqBZy+NR11YokSkrm9HZPJ
 yrnD9ux5Pf7bncEd+fFe0bR8Py/AydwAAAA==
X-Change-ID: 20260528-exynos990-peris-fix-2525e9684fec
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_181048_445337_862A93B9 
X-CRM114-Status: GOOD (  12.57  )
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

Correct eight PERIS gate clock parents to match the hardware clock
tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
gate.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 6277dd557..f1f5297f5 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -2572,7 +2572,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIS muxes */
 PNAME(mout_peris_bus_user_p)		= { "oscclk", "mout_cmu_peris_bus" };
-PNAME(mout_peris_clk_peris_gic_p)	= { "oscclk", "mout_peris_bus_user" };
+PNAME(mout_peris_clk_peris_gic_p)	= { "mout_peris_bus_user", "oscclk" };
 
 static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
@@ -2605,15 +2605,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
-	     "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
-	     "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
-	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
+	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
@@ -2621,27 +2621,31 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_GIC_CLK,
-	     "gout_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
 	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
-	     "gout_peris_lhm_axi_p_peris_clk", "oscclk",
+	     "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_MCT_PCLK,
-	     "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_mct_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
-	     "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
 	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
+	     "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
-	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307c..c06f591d9 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-exynos990-peris-fix-2525e9684fec

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


