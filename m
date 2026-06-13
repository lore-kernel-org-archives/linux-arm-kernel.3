Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B2CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1uJk1iRMlpLvy+nj2qKQd9//VxsTadPO7e314oJSE0=; b=RE/GPB39YNpM76FfN4BmfKxG/3
	kTBYcVcTEXj2+IScAI2AqFjAWQWArGrLP2ewHtjpekHAuaV8NHTdE/UVeRp1brC/G+Su4fU2/vpro
	dBPsnFSnpqIIWoHbQLe94cuSlAFi81c85cUJjphhP3Ar0+BoG1+PimuDG/JUPlhpqhyQbR65kqoXA
	2kDCf8Tvi8E39TLGQ8YiivQH6oaMJoXMz4SJSLqZzyvla0nqw+Aq+z91ZQEvKYlmkAzK6P/UP94HV
	Mgb/DPy2CBT7l8bpBTXjougyq6cJkfFJSyFRYxA+td8yx3JFxlUQOwrr0LR7R1+9xmZBD34E0viNg
	fwMjqY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbV-0000000CHVN-1G56;
	Sat, 13 Jun 2026 12:36:49 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbT-0000000CHUS-1651
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:36:48 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2137615eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354206; x=1781959006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1uJk1iRMlpLvy+nj2qKQd9//VxsTadPO7e314oJSE0=;
        b=GCVvoLBxTcp0bUvatSXeL3soZ9kk9B1+Birhi2ggl4+vz+BUVmshIgXp9giRH862sh
         J9y78p4fpoCkrZ9K84Mcc2jr8jm2aZlCQ/HRVbqVYUzA+qm7AYOkne7bm/pG6Wdygke1
         wcQ5uDxcWRJnqu1xtGx/L0GhdKVFHv+KEP6wM5JRakWcOXb+K1EBeSLVEK6R6xhmDeRk
         SdpPdJ/9w2fmKReXkwAt0KJtdXed9vflsoNaaM6+2uLwfe4Mr7vhLGlHKHNeyJOM7R0G
         Jy0NA7RpzZR4O2Py2RO1T04tPkHwxrDzCiBmx6MEREkuzKvb2Re6DXx0CrL4wQ62iWhw
         deHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354206; x=1781959006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1uJk1iRMlpLvy+nj2qKQd9//VxsTadPO7e314oJSE0=;
        b=T3KWuolC6ZftYjlmdzqoxw10zPMhtzymjCMuy9MbcOuQSJqwDOhCTTLQAfYZif5MpT
         IAXIG+NUn/q5g/aNYpEcett4VnEH7uKpt3yehRuqA8h7WOTeLyG3kYblGtd8CAT7fdyK
         DCYzlgbUtMTvINMZF1R0GXwk2A2M/asWCau52IT9Jj5CtsR3yrxTbZQ1az3MdCf2Md7Q
         glK8dt9uYUXqW9rON4m8ucIdqJVI9sFjnXuz6PiBpQpEQKW3maLp7O07N7rh7HZ23LDK
         F7RGgx5v2vLn3CPPHruLPKSsO7MH94kmrBdEqTbvb8OHhYiyyV4Ad2fGKZO29VjV/kma
         mmWw==
X-Forwarded-Encrypted: i=1; AFNElJ8LQg3oihimTlBLHNWvIhB4VovgY5KAxhqjmtuR7JWYG9Y44YOSd3VDOSTUkD9AJHYIl0eyrG6Oyoal+AzhTrpI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3in4nc872bjQW9brZvEMpbtDiMX90kwsBkVsCkCx183OraCkd
	AEsEDo048EYvBrk1ekvY5qsUHu2RyvHMbe4DyVYkzr0wYtLnnlVvmd8d
X-Gm-Gg: Acq92OGDUSWgql60XUlll7gxsVbVBE+dqG27lHt7nhJMUujdaYbA3gqbTDBNWX1aorI
	hVEyeEnz+RmbvoKVA6VPg4OpBN+NjcDGxNMBcuma/3oFKCO/KIu0YEC4PTQL6+QBVF3oyX0e0Wp
	dqaYN0SZkPHtKYrNlsY50jx6CqS2ET3h0oo9g4OuOx3yt41X1xoWTm40WEw385+0FFYx232O5vY
	4hZb9lNRp1a2enG+XjfX3c9PnXr6PyHcTeQGKISs3z1SdxMnyvCkf6sBmDIQSYE4n/rePHgLEMc
	LOnkwvLc78IXYyggcxm8Dxu1I2EWNTa8UgftN/Qbj9gnbWmudfu+NcVANdfjBpDQFFuZC0PiK4U
	MRAhs6CZ7wIh5PgT2KnH3tBNpINo3hv2O/3L08Cq0nRw3svT5q7WsvbIXk6tyy4LxlIdVxmjyNw
	smnKLgAF1vHTvuyJUdVi3zWBWTXpqG
X-Received: by 2002:a05:7300:2393:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-30935239ecdmr1925414eec.6.1781354206251;
        Sat, 13 Jun 2026 05:36:46 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:45 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:17 -0500
Subject: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK
 gate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=1529;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=gF8RhZhckQfgp5FUn7hjE8vKGpGYjIQAejgafafG/xA=;
 b=o2goOlTWbYYDbCUO60rEqg8J8rmMntEATawlz4rjphBqaqRbECb5WySBkhToLSZlfPV9X+FcU
 8+sOKLSNt3fB/j+xobBQnlKfaA39bvs/+jBurupW+OOY41YPH+N4o97
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_053647_310336_81587918 
X-CRM114-Status: GOOD (  11.00  )
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

Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
Management Unit sub-block and update CLKS_NR_PERIS accordingly.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 4385c3b76dd6..ee3566b8e57c 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
+	     "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
 	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,

-- 
2.54.0


