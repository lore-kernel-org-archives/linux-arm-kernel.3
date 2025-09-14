Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F92BCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 17:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=; b=jI68AXZQqZ+3Dm2LAtSrOgbar3
	A/EDx44D9Ao/L1Li82NA3FsZ4tcgFTx63yo6ocmXvNARQntwNzjUkXztkEkEyAy3htpr1IvOBGWBq
	2J4p+tYhs3Zn8pUj5t0ZE9IwOnRWHb7xYYkILzd0CK5NmxfrzhJs+28DHchnTPglldbu4bRPW1j0s
	roSaV9elPRXhEwLBvsXbnrNqEOeTSGPoV0RSQP+kbqPIUDlh+A1b5T0glc9qYOLMxxgEb1AWzcKnp
	n/CtkJ98Q0NaRUeqTtVfIItWCWpZKTqjR6cwvpNGP2HZG8DlSxcD5x4MGlCcj26H+qGpzC3da9V86
	zcVXe0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKs-00000001uZ7-2FNP;
	Sun, 14 Sep 2025 17:16:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKp-00000001uXk-00KD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 17:16:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b07e3a77b72so186560966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870177; x=1758474977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=LcECScit6CotuKt6wSv16XXSYyswhU1mGUC6jhPKy3f5TUzFVQmEnYqxGC3t5j3cFZ
         Nf4ui2M5Tsrg5/NVDIGWHuvZNxo/hWreMmIsOGouYCW3VPrkDOKPSje3BuQiot2bARkC
         lKOVoszvRdQfElQKJt5psdp4nCldNfQxW4CII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870177; x=1758474977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=pYRYC/wWHP0hMnQ37IeeyjHVPdRm+5Mew37upTSrQ4oRyU8Y5mkDODcfbtYBQRNK8G
         jdjRAeShu2UhnKZQAtZ2o1i6zbmX0d7iLXMKSkqzTX6/ZDpva1SB3iVqh06SNadWZLxL
         FR94bSQ1jz5F9yaiYCaOBkwP5hZi4pg+NLs4amIU0HAqdzRi5z6VxNndfBoF6Fu6nzle
         QftVuxDwI0hEuyT49lIcTAaSjM3UcKChH85cvpdtPUnw6Dhbq7PwwjMPaKm8YQKl33Q1
         O+3AzWzObgEEHtOCEIABhS1uYvfTuvwd+gPSk67JKMGtHHcN3tmxfuQCsk0jDgNrIJf9
         sqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoUitYT5we04R2+87SHoC6O+Z5AQyHTG0DBXHsMJvT8JJYCU9JJcS1FwHygeLi6ZxxpgE84FXknxjui2ZccMaW@lists.infradead.org
X-Gm-Message-State: AOJu0YxHk4ty0Pd/l/22lDZv6oxBGhYXmkUdOcQiyPBcSo2ntWopt7Qn
	6z6QE1FxF0KKkzXM//S/F68jN+71B4VX/carzylg1ErayP5WoG3SjgTtHbvhcTl8ZPU=
X-Gm-Gg: ASbGncur8/0dYzNLafGqzekLU1xe1nmjJCLN2C3FtjHvtYwB/XKt3my2jhCxU/+p9+n
	GIVm6Rdx5MougnRHYDr5GWKU8xqn+V5jrvsHW26bG/QLyWAhPSawejdniFw7eBRm94wWzjCOPUL
	bAA4kecXB4/VIQEEXUULM2lOhzQWwAvXQnwDMLy48FDnUexw8gHnlNxIoLm66pRYXISSzzYT6te
	xTSh9a6MvUC8qLRLTHau2v7U5kToItrsFG3wYfBh7VKzkYou4vL1L0RDtbNn4VnazAQlyv6Rzg2
	JbK0Ssu+NgPf8B8YLdCZ5eB+KfMifxl+2TYjcSGS11F+mbtcZXJkJIZf7MjIALxrEU4BFOvNXOG
	D97SgvkHmTxzbEsGkQ0HLIkxcBA56NUJCR/KyFFIlbiIqOk2aDtGoB7hhvoDaqZV46HP1lM8PV+
	+a/0f7xkhieC/kqbN9Uuua/pPYjB/xl1pjbZ8LbWoYeKZ3V0w7nmp1k4fQxe0OwMvD
X-Google-Smtp-Source: AGHT+IEvX+quO6ICKhJRdf8NKT/j6OYJ6Pe+ZtB6ww1NFEvD0skqRYkw1DUilScz0LuELvehDfDMmw==
X-Received: by 2002:a17:907:971d:b0:b0c:7269:8459 with SMTP id a640c23a62f3a-b0c726986afmr363002766b.7.1757870177023;
        Sun, 14 Sep 2025 10:16:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:16 -0700 (PDT)
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
Subject: [PATCH v2 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Sun, 14 Sep 2025 19:15:58 +0200
Message-ID: <20250914171608.1050401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_101619_057548_8A4841A0 
X-CRM114-Status: GOOD (  12.73  )
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


