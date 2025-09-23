Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40B0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=; b=AEcF4o2qTTJjk4vHLfoNXm7yuV
	95TuVVdJjM3/sJptsvkyrLg9hOlQplzlar/YixR//pus7nSwkWqC8FZeiefV9rbyfRbR1p5JZa8qv
	ldP/ivOpTr0hYZi5fCKWVvDiMSAFxI3xXvfMyUVyYmEwQ+NkhDyAnEy34assB2+ODxIJoOlkJJIRx
	6PQMII0UZI/tguqMVJRvSzld7llmCnDyEFTO/YyHQx6m/BYTEoQzX8lAwCBD86DHHiwNF8QuLBNqZ
	yY6pjFePNmR2rw5g9OTAgviHnWdXR5J27xPHwS3GkJa7+DJxgve/TPG8kM3K4d/+06N7pW328G+4Q
	XMOVJm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149n-0000000Dpbr-3Bco;
	Tue, 23 Sep 2025 14:38:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149Y-0000000DpKq-1G3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:38:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb78ead12so860316566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638278; x=1759243078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=ANOV9H2VNVyMPut+iX78k+jKMg3YPp2weP8WrMtzLND5EClYX0vNwgm3ZpU0iswv6D
         LhLSrcbsHtLYMGixbilAB27S+mWmAxZYB2V4Ek5ZBfEaKDZEfFJD7c9B3IDtynaJzBBS
         JElx7RJgdOZhEolaifleDEsSZroaD48hLoHsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638278; x=1759243078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=Nj9tsh2majXFaNsvpi9lfcn8YGUhWPJY1P4UDp3RNfSH+kvkPkjA8uJmvF3FudZYj7
         yYbFu/5THeuO1VlYuB7pIa1Y1ktYXoXfbp33TrfrL01OPwvxtF7h2WvgjiKHFLBK9tRH
         w+hP2hF9A/Xxdya7nLE/ay9klMy1raU7Ii1a+OgtnRT+9V5cLRkt+c0g/qPVW2gdU6b/
         yPkQaW5GkOecIxIcZM4zaYAFHUiFeUQdxqTOR26y3yYNcRqgJGUxK4g9aT+rF+GUrkch
         dtAHlKeB7Ql8dVsGjoaYUhCik94VIU0tXgnh1JdHe1H/uCENDHOvMUHVQwPU1SfzB/XV
         Nt3g==
X-Forwarded-Encrypted: i=1; AJvYcCUPVHeY7clI5y5i0+eD9G+OqYor+k7gx+v1c9jyzRu4+e33kz9hRoBgbumPYtIABZn3Vh1bfZmoHHFqZqAgMslW@lists.infradead.org
X-Gm-Message-State: AOJu0YycAt4RtmHotvNzmA5xcHThZc5AORuBb4jbe+ekltUwk+RWGboE
	w+CuFbgfuWMk1IPK3J3XO+hOb868Uto1iU0zF98jb/HIsqD5ks03moTuGaW7wrCnNdg=
X-Gm-Gg: ASbGncsSBaY6DYQ3CWvQzG/Mnwy8zsiu46HFJ51BTp49d8QfxiJ20IuJz93HLRct0zp
	yGyi4n+a4aLftr08XrK1oJ+bmBFPI82JCmH8UVKUNay9QeQtWe3dRUK//eB9DF3VHAel4Ju0c69
	mw6d7GlNq6FERVDbVLE7mMSS+ToTOU3hdAJliVr1e6divM4MtFJySc0GFik2N7kDJyqz5rewCRp
	CXbBdnU83sfv7vAs39jQATy5mFhBw+8T3WfWaX50YzJa5RlUe6BuJCvnHxARffIr44Rp89p0VhB
	jd8t1CN2NHN0WwDCPleePlAQEWYHWEp9+R/igRiCOkZeQ1iWmD1WeR18iABMU2Nk78Xh7Nse7VC
	R56J8yKow21fTEyk1F5846bT/H1pdZSeo8bR/pjm7b6QGz8ZMYxXRv2icq15iRP3TZFKMF2UDzx
	eUs7yXjyZOzhyNaCV/akVZMW47mXsnvX4v84Z0b+btlxQNIPcRa6VOfVVtU7AKUGXh
X-Google-Smtp-Source: AGHT+IEUmE6xkdZeJdkLL9TsBhYJubk/EzndUqe5eNZwoBqgNfIIOlpziTlRhmGHtKqRgY6aB2HfsQ==
X-Received: by 2002:a17:907:7b91:b0:b2c:3967:eb71 with SMTP id a640c23a62f3a-b30268949e6mr298598066b.3.1758638278355;
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 23 Sep 2025 16:37:37 +0200
Message-ID: <20250923143746.2857292-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073800_369371_3C4CC964 
X-CRM114-Status: GOOD (  20.60  )
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

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'debounce-delay-us' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.
- Read the DTS debounce-delay-us instead of touchscreen-glitch-threshold-ns.
- Udpate the cycles calculation.

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.
- Re-work the commit message
- Add Reviewed-by tag of Frank Li

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..85f697de2b7e 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,25 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "debounce-delay-us", &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, USEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


