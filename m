Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C7CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=; b=FOthFO1LVZNsrFDWVidNsOReCx
	DgTKIl8mBocYgI7xu8ZNMq+yroDfFbgf666kcYhBuzOrDxpN7GnG48lG2omxhz/659+m4QzXivsNl
	5ugbFtdFgGYHUZO/yACDhBhY6OPaCleBlh14v3xfhL7zeNkk2CtyNqOiB3Qa/r/t2gwFDCwUU15JC
	2ZXBqWEPqKSTt6FUt2HnuRlujyMCViw1jHboXMQe76+R09SXMjtfq7UZ+PwP/lsbSeesQa5OeQ2z7
	JfYAU5d6wBFQV9makmnFOuy+0ByuXNSVg0/Y2ygFpAdHxF9nuuxA0knmhvJRhV+MHo6zTMXVLlK71
	J083LK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAf-0000000AZKA-3jYy;
	Wed, 17 Sep 2025 08:05:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAa-0000000AZHn-3xMj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:05:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b0415e03e25so806832966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096339; x=1758701139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=H2WBodoq5JnauPaqOTsx8peuoPTgsdTedcmoTyptSq6S5uQIvG88+/O14o4YDu1tYF
         r/KfPJ/JSZIsn/mlLO92e1Me1kUkm4V4wo38KxqAHiPXIr0FpnWNSRvSkSThwcqh6ORd
         iR8NHOOh22pUpDbe1fru7ul8MxSpVEYA0s9Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096339; x=1758701139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=mkO2O4d6N6kOmAI8qwMxDMrgQ44lwX/tV5Q4MOpUipapeV+aVnhGaRZoh190kTdABY
         zkji5c9t180MH4crnWUw+TW4Xc2kNvu0M9lZhP207KOF8VaNRP4wF64P7GB6TpABYHd/
         2zaBms+9BNXv5P7l9Xh+I12+Lc1AZhHV37x1HcuSoEkk7GweWrl1BjIDlhgXPlqHSfyN
         qQdPQXq3wTuRDV/pOQMtoMaYOuh1FUBXIr9Iu1pshxX0l8h3PVE5IXOy+J78xiXZLvBA
         eD9jeIiHCAnEqXdDA2MZKTR4SYxcUndY4gA05RsRyWAgpN5qtOFmtD89hSMd8uC3wGzY
         RsKw==
X-Forwarded-Encrypted: i=1; AJvYcCVBwdm5GeI5hUhmSAS6SJoOwfOLbFfuCsAT8BN5Fjl3obQsLNd+865Kx+CNkpyatyLA17ZglOtL157Y3UGuJqY7@lists.infradead.org
X-Gm-Message-State: AOJu0YwT/OE7rVHokfaw6X+CefEIFXoHd7YE36N0pX7HKDY7Xo6kK4I2
	wdrs8gG2OTnbsweUqgWaBoNQsyC73GqzdAJkC6qtF+3imEcy8r+w1EYlFp2QxDft5fw=
X-Gm-Gg: ASbGncvDEpjUda7vktIChB2QHEvSW5Z7xylmLQEYIegoAQspQDuYYDDA/7GeslZyNXz
	ii8RG01kSVWQpSMZAoGTUQv9CBEab8pZgJCrT/VUSycU1anz6e7evs6ebqEAC/UWkpL+iKZ7Q3Q
	5mKwrnhqJrOpKdJ2PH1fp2XZFyWpJqTVmQ7hB1Dg4pXUrZCxEONDLwOFdLI2YqdgmoQM1YdN+8a
	g56cszjDUFFcE3DHYpDBZoiuSzF3duCQvEy3f1YeGNT5zqT5vant3OE9BXG9IJvOH3gCAZm5Pal
	udqjf0nGhCD9uJ/u95qmCcKpI+UZrZBE4heAXbsu6kY3uUE2c3hAfiqUY56hhI7abKPDvoQu/eQ
	lsQOXuzwuHvFumrPcBHaHWc0iHCyxmwsDWvbyYy3Wj8ceST8hn0h489m2Db4=
X-Google-Smtp-Source: AGHT+IHQZ9rc3jl/nR/PWKeSWOjOjcRVyHb+GabJ2P0Cvoe8YSOsLplNCUEtCcN7qWi0RlLMh58DoQ==
X-Received: by 2002:a17:907:97ce:b0:b0a:aa7e:a193 with SMTP id a640c23a62f3a-b1bb559965emr139686566b.21.1758096339059;
        Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 17 Sep 2025 10:05:06 +0200
Message-ID: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010540_992749_B5E683AC 
X-CRM114-Status: GOOD (  12.99  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v2)

Changes in v2:
- Add Reviewed-by tag of Frank Li.

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0


