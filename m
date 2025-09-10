Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=; b=frGMgg1lE9nbiuvuHXMJO5T09m
	SYiASe72H5DrtGJklwvUS1ybhCenc+53XSgNt+aiRVbnJ0iIVnMha5QLupEuFP5oZh5c03pq6xwAI
	XmYzd6HgDgwu7RNHSpqBZI2K6PUQEtwfu2oLmsyRoH1E1PJwnAyBddHsRoMEJy1ngKtD+kTmes+un
	zMlXFUzSnFOsz+C/vNj/9Y39yD3jupVjgKHOnwFsQhHG3MGxkrm/z2YZ398rS1voF7ry719gY3OOi
	yZWlx8ZBEr7wkS4KdReGIqV7CbtjOBLJxeYjw3TH+KyAzl7vqNB8sk4ae+nIdqdevEaIiTQ+1PmoW
	UHiQgD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM4-0000000EWsb-3iSd;
	Wed, 10 Sep 2025 13:59:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM2-0000000EWoc-1OfI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:59:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so977469966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512760; x=1758117560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=AUejUZoGfDi4t+vYoUgRCjSZOIBzqOGtTCrh4AHvXfEIGGvONUtRsoKqYrLNWzFn1r
         IvJ4RTXoq9ka/MvDY+eDq4kvOr71Q0HU0IVd5xN87mMffoZ5FSTpiG6Og30PBlHLguz6
         SddCHC2ypU16R45e3CmLTc1QGlaD4r5FAOqrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512760; x=1758117560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=gtW2lMZfmQefDG2ZIL33dN7LQuASa+OdtAskkKgtMzv8EK6LPFCSBET1LVGZXSL6CT
         K/b9PVc/VsxX+YEei+uiQNeTZMdlle9pqFkW7t/AAiHYq7MLf7hJKjEgqv8o9CwUOlF9
         pIOaaU48ik3g2r2Mm4uhgVF2AMHdYTaw0BEvd2dCW44ib5v77pLxKyciYYb+kBHD4YdK
         JIsbu1XxwNsr7R8RFhkbGZc8it8++DoKosnky2Uzq4E/kx9Z81OSbGc4UeAXVqnnsSmN
         zeBV11TjGVZ3dbdaCwnToCD+uEHy5peG4PxefAsb3/D852YWdfcvfyxUwH0Yxpp5Ugwp
         uW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4BhM9vuzTtWeaMYamJIjxech7vyUO8jBMZcGLaT2XrWdPu9uWyJhqLo4noF+tY1yfo/qtqgyXdFEQjFRx9vN+@lists.infradead.org
X-Gm-Message-State: AOJu0YxScdotDILgQmrGZNanAbk2xLcS4/EhMH33h02P0ffR6hq0JdXJ
	eYOHylO9/uP8i5eWjGTIea6/5/ORZQhDpLHH25/Nl1jgfket46JZbCpVax5gIf7BCig=
X-Gm-Gg: ASbGncuCJczRtYX2zt+tw1iUicFayiID0gcJNIBjXRGAJiD3ruEesBJI/pkDnA+glnY
	oRutA+GtmkRjGNK16h/L6m4XizarDuAFBBHhO/+hROOwZWKlh98zaPTUXX9xZfn7oMV6Mpw7ATc
	N54zB7hq6Kyt4ddSGANc0FBEcYNNfKDUr5b7nSgKEmCXTpkClKfi7AlJ9cc+hwUyth7Im2F8Iun
	UtLcgNIDvjj0CpQFfsTyemIry5p5qjH0BVzgrGd6jUgmmVJ+iLBWWlJRq1OnzT9QWx+8pNOLaIK
	LQhTlG33kv24tVr+Ayte/s7UpitWmwvwC9EjuInO3DfLrfrwjJ2O4xn2BTmWQ3F/2t5w70oH6LP
	uU2o5KUXYxwsYXN960KUZb3TyY/JSzyuAogi0+GOws9htwS2yC4yaDjVE2rCwq9hfoJNKDMLeGd
	vFdLHB7Lf9IW8j2Wu5gTISttPy9Z4dnIVZzOAxAxrtVUUmeipUpXN2hh3dc9+ckScpAxthSy7pL
	qc=
X-Google-Smtp-Source: AGHT+IFx4sggugwyl7NvTvxiC9DVo19Rr8B3xJJ7gt1HragPcAUN78syGn8W6pBdTcWy3/sRmc9Emw==
X-Received: by 2002:a17:907:25c4:b0:b03:fa9e:4b68 with SMTP id a640c23a62f3a-b04b1696b7cmr1544984566b.32.1757512760390;
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 10 Sep 2025 15:58:35 +0200
Message-ID: <20250910135916.3939502-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065922_398549_7E4AACAE 
X-CRM114-Status: GOOD (  12.89  )
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
---

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


