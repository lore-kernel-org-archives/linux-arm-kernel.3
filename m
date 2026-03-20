Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED3F1099B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=; b=TbbHwUwAexBOLhAJhFm2G/kd9i
	rbS6HkedvsK00amTG3cusHeFePyRQWTW2hfbiXrRlZcMjNetF/wUBr8v52uYj027k8qXl2/NhRlcG
	r9WkB/tCpYnTIm01ruPrBTBGLWl+1GMJUzMWv1Ve0YngH3HcW5faWn/IqDXbwMrFFV2fFrgkeJDGy
	VGJCeFTuSOmpG+O3d0du6X2JyxtXYjZwZNexwFz+w02sbRUJ2vnubMR84tFzSIa4UPoI7WpdkhgsP
	6whTseBXuOzu0vx4L2PcFsJ04hp+S10k26M2nDEWCx7p3ReZN4u20JPnGWMg67mhgyYy8OjvIYvQC
	d9XJpH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBy-0000000Db5S-4C8p;
	Fri, 20 Mar 2026 21:15:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBu-0000000Db35-0GSc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=; b=PNL8DdQf0YyXXOd2uIzplQZXOw
	cHwduhTZ0lQxJjK7zHhsl6RUfJEQq34Zw/04hsPeiFPNRJ1s10Fek5YOUi9EF2P8aW4djIA7C8yGC
	ztZVm9t1aJuOJKT3x9/qmdlJhYFeKIeKi5BXzCa9d3fprw4tjnBCF0zdzW94mdxxYk+g+qh41qok0
	HbQIekuTZrfW6adPia2BfQqpg7OU7RVeYXrtY2ipaLWCn2DsZJ6U6LZJT00sJgL+Xz1kpYpL5G+1I
	2KmsSxVxtuSWLp2Jlfh2wpKzCBjuM+KOXeP/Qvub9oU0aBACt597jQgsf9Z1b9sIKA5rr+11kozYd
	j+l6ZyDA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBh-0000000GUTc-2RDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso2227546f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041319; x=1774646119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=nR6R4NV7OeluViQ7D0MwqZkqiKqJhi/hx4bg56nHlFw9PsLC+M3qIAUmgaMaCrTSB3
         13VXZqfA+v+YGyB9sVOXOzaNYiwa1B/k8KIKBAvuNTpaaoaHm6U1EcgN0ipnkIpQUV/2
         FvkTdE2z9kD/TQrj9osA4H/GHqv1zlByGkjwo9DvdgK7vJliVn3keWxLOLNCHv07LBVV
         MwiuilULup71v3WtYfi8tsNOkLrpVsgE3NxDEClHKkEtK3+GZc33B2xuBjDs2l1WBhIm
         TD1zioyAPeK+P/a02ciSPm/wU0W+6/C/W7tAUcCLTjgz8uSjSdEjii7kJ99B9HZMdAg5
         9kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041319; x=1774646119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=saoR6ZC8eSRXfs57aOWOaCfXPzu9v5aGQpKSqRE82vhosIuOwpbAjujBjjdgDr2Urf
         JnvaIA5dbjHiyu9XpNueBg/o/N8iSM6X1L4PBJidrhUqxcNtzHfsILSta9zackrGXneG
         4Q67WlnynoPMMpHTe6KD+3tNBqwE9OYMFyXSBrCAR45G/g3td5dMDst0f9bsgIxtaKle
         L8Op/BEjZ8ajnhI2PHD4kPImCl1KJykxBz6dGuNbXFFl7nLC+HV2fznWo7REODrkzb9u
         Pp8LorS3/BgC9+RX932xnISjIeBIRTOT8o+mdXuyYhypyYcPyVfajaHJbaBbK5dHeKNt
         w8iA==
X-Forwarded-Encrypted: i=1; AJvYcCWdsF1LdyXxTcJYLnGc27tu98UXsjVCKcVh3UrxZiJL3+OPeFhwL8jb1/o5pHyOjCAA9nqj0DGnpa7pCoaki9lN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywst3lWWxS9HBb8hPmt4tGhjnI2yelXshUcO4pYoQys+1PdNImE
	OYW7HaCbYDz9D4H4r2Itt0+EA9tRkCG6yoxAH/uVAdnr481mxXZJH5hWXP1/4TZRjmw=
X-Gm-Gg: ATEYQzz4s7QFYPGOodwA2U4XV68LZqyOFbw3j52cvwkTZOycCvu8CKdgMhuNVJK2x/V
	ThHgpV2oBIoGX1x/ex43/xihyoMQMLqd3JdbgpTuAPXehBAYujF4ARP2So8Jo6wX+/KsdwIoUkK
	DAjkyA7BVco4+SU7ISDnQ0NIe1FAGQsX1+cT546CRP3GDSvewcloT5QNz72Q2CfdnFCRvjUj6hz
	aDSCcqD8SN+TncVqiDhyHUn3XUlpPrM1gzGEo3hB3AH7QRvYMeb5n8vd4hQnJ15UoOxXx+RZYxF
	09iKEkT7tn5YA0bPYDSsE4uGIPmXZh7wyTdA5GPyeJU+UiveNDATLEaISHxxFiHFGUXc3RuJYVM
	7yXUwi/s7HvY7P2oB+90EIvnqKM194SgDWk93CLXx20EskXxROyJkAcEedavsc21P34Pbu17mjI
	ZUODgmMThxb32c0BvzWAqhG/8hENn2mFK4IBcMGpVs2kYIMJkI4381NSAs67aM5zALbiUuVWApz
	Fl9bXihs5Ggppk=
X-Received: by 2002:a05:6000:2011:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b6427d8c5mr8221726f8f.21.1774041319466;
        Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:14 +0000
Subject: [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211527_145823_BDBCEA13 
X-CRM114-Status: GOOD (  11.69  )
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

Add APM mailbox clock for communicating between APM and main application
CPUs in CMU_APM unit. This clock is needed to access this mailbox
registers. This mailbox is used for ACPM communication between kernel
and APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 56f27697c76b..eb9c80b60225 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -19,7 +19,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(CLK_DOUT_CPUCL1_SWITCH + 1)
-#define CLKS_NR_APM			(CLK_GOUT_SYSREG_APM_PCLK + 1)
+#define CLKS_NR_APM			(CLK_GOUT_MAILBOX_APM_AP_PCLK + 1)
 #define CLKS_NR_AUD			(CLK_GOUT_AUD_CMU_AUD_PCLK + 1)
 #define CLKS_NR_CMGP			(CLK_GOUT_SYSREG_CMGP_PCLK + 1)
 #define CLKS_NR_CPUCL0			(CLK_CLUSTER0_SCLK + 1)
@@ -604,6 +604,7 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK	0x2060
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
 #define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
@@ -628,6 +629,7 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
 	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -698,6 +700,9 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_MAILBOX_APM_AP_PCLK, "gout_mailbox_apm_ap_pclk",
+	     "dout_apm_func",
+	     CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {

-- 
2.51.0


