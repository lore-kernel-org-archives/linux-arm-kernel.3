Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A43CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=; b=zNbgByLezD7p/g1fUeUEDSmNWN
	LT3X1SPZWQMm7r+AjMp9OzqZkG+AcY12OCcoNKfmHzc0S0OJ0/webZZCy/qrETvYkCe3zdDkZGdYu
	Vbu1PhzrdKlrUMphvwYlhALx054bPlF5uCA6m5Q1lcAW1yiw0YTPcTRiKKEpdlvF5EdDsoQ+CLwLu
	8N8LJDv7aH9YzwyfjVWKoG0hgvQkHoQTFVyNfPLu+DBYbatDqGnrJPbEmndmNHpwYgHX7q8QdReYj
	2S533Xa4LkstnmmQDgBjwZVNyuCwtdA7yPWDR1nFHhPDhXtRxzLN26qSzv9g79Iy5eThq9pjwD6lX
	iTpZpSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGx-00000005Y2u-3Wqe;
	Mon, 15 Sep 2025 19:53:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGr-00000005XzK-42gP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:53:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so8910415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966032; x=1758570832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=fk2frscIh5lif7UsSfFw1+uFguRmLzeGwDw5/W9lFTfkYP6i31nJCxrJbLl7UlrYQP
         DpAJ4vqXpVvfxwh4+G330JcxB5t2lo+OFHsyhFvAXAiOn7XJIGJGPF1lGS4ZsXYn8tJM
         3XV8si94c4mkQOLVwYeRdlRf6a879MuXCH4mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966032; x=1758570832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=XO9O59uJcM57aSiINwUIwoOQ+3pZtIunHvCyuioOFwt3k1noli6Wn3SYm5O55Fo4T1
         ZQbwX3d9IUmo88/ZVoYXs7HKrJit94U/9m8JSlIRdK48M2vNDtFY8tH8DbsVKYXpbnLn
         FdkdlgmHCVjCYWkIeW+oJOa/qUg3S8FN5ctpBTV7YgsYhBrGraaj76vwEVOhbghe/q/a
         HF11UNxcok3/+jBu5HiMjYDKMm6ribTcTf+wWpW1+CI3n8W8fvuMxgUG2vIrXZhGg3r1
         85ROyF0N5Rtdm+Ct+B9sutCKiS2DmA5dn/1ronMw4AZ3J71oU0/6RK6PYWbjResTe3Nu
         hI6g==
X-Forwarded-Encrypted: i=1; AJvYcCW0OvY7dYN1yGCON/JWf8UTXW9Vpj4PvS7/2GU3MhsXbUzUp5PtATAd/Bpz2gQjjW6IyqMTauqRg+8pr0w38fQ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzgZddbhvIre6A8Ov5qR361YBIgBDeOs2Uv128Fqypa00gAzlRW
	NSnWbi3zP2gz0N9cIMbawMKM1BJBzr9rlxX16ozYZaAh4+LhDQjDJEXfv2pzYWDU5A0=
X-Gm-Gg: ASbGncvBeanOqEKpK8C6CnalntGI4v++Wz70sLqUsidGfnVTxr5yysp1/DjC+hiiqBb
	HffagjnoS7T82z0J2SsRqW60aF8PHiUSBYv3aI5+U1IzQRB/oAtaQGaoXaqxn7oyKSUlNv+OZwG
	oT8uRQXpPSzaMLEvOPO1LXmAjV5LFuXM/NMmHw0tSXepKkgq+5nxE94WZCMQ24XbT5Ub7vdqcfY
	ahM+uPcY8I96NtBzdcMb1cmxRE2BsEzTOSVaMy7Zn2688c7ztOLxeSNkwZhVRhd1xAHn+qZPRcD
	D057XRfyHnkgu4X0wo7iPORKKbgN6STaqDAu6B15/p7aGzHvAer43KcxCjP8okgWcIK+/7fSMPx
	ECFw53IWktobaMLktt/BcqknN3sBB0eIoa9b4rDPm8ybT1yS5B53Xdbwc2j9+V3LlbX6P0N9ugn
	Qn5arTIBYA
X-Google-Smtp-Source: AGHT+IHfif4UVv4IrK9t7pQTUnYShPYNK5zEJaWSq2zpbicbbJiow2T3/MUB/cRMHEEknTaIP9xExw==
X-Received: by 2002:a05:600c:6a0d:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45f211f6b70mr128799385e9.24.1757966032348;
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Mon, 15 Sep 2025 21:53:03 +0200
Message-ID: <20250915195335.1710780-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125354_015943_30EF40F3 
X-CRM114-Status: GOOD (  13.18  )
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


