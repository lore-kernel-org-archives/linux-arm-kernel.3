Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B4ECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=; b=0RlB77AZf6TZrRQL46WWgQfbkT
	Bq88WluO+IaJe0SkrWx1cG+unCq1RALOvyMsOs3zoUFUCmONSRQ95SaI4B8BFLF2I36BovuGXGhYo
	1TPbtIJQmoGg1HjQ4TjLduH/DxspmHZ2pDXyCxCUjKIs5u1+wVQsMsWRNE3BjO3RPk4k4LOjZx3KY
	c/4F7czLjQBHQfjB7LbLc4zvOozE9q0ncPQUP1Rs3QgxiOeLmgNHeA8Y0c5h9tql8t8vSNDaiAtcH
	zQrQwPs1TSAsfYRMayyaI6vq8oGD/XDkjeI9dIvfAm6LSWoJ+0CLjXXnftnKcItYFrl27uew1uXFX
	lKNJr64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwG-00000000Vl1-3GZw;
	Thu, 18 Sep 2025 15:52:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwA-00000000VhZ-3sri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:52:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b046f6fb230so233125566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210765; x=1758815565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=L/3MVX7TL6uBSQanctts9IEEpCjNEe9EmaAWnZqWGXZsr+yHBvWTaKeTt0BR8UHdNp
         rvVpCb0NPV7NERu8gmGb4w6PholvrZNPlvKbLrZWstQ6O9d2d5haHitEIOWYzUyuYlJt
         /PGOoHiuks8iL/dQgiHIu1ebw5b5G9yQl5fuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210765; x=1758815565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=eVnCVGUi+o9lO40mOGjnpmtwDJVIfMy0RpVtJGE0qGtoIHDeAfyTCRFFHc3FBNVqbp
         atSXx+J2GKSrmvHeSeV32Y5ljPezXdqgpqAzMuRbxWVn+aTfjYgDaC1xfAicJ8RsMTMU
         pmRa3tYxznww3+63Pgz6tXY2FDO4UaE6BC3Cq/snA+P3rMms3VNza6JFHtapj492XHZ4
         h7jFgLLp+wjhvOUEnCcEZgOABtdcmUOW0/+Rw24H+2avE5MuoITrzclYxWR6q8T2u6RO
         0G/WMtn+74yb47CqoLNMi+5XL4D6xFUNMVVUALwBXx4ZMieyUqoYAILwDzWvn3G/repi
         /d9A==
X-Forwarded-Encrypted: i=1; AJvYcCXycFoRIc76g4xUATvGQcoI607Iv92QFhR3yxmHSOWFYdeMhkg7Ms/BzVuvU0M3Pfu+kmbNX2bXOtxpDqFIaqZc@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgfwf5WWMxbFoIye0aHqUfvglQ5W/uaJP9vZEJVBRgzWtPXnt
	1fS/yWQUEHbrrfeEbWf9Jce0jR4m71aCq5ifHkp8FjQizly9vs4ignfRWH6PSEY7shk=
X-Gm-Gg: ASbGnct+EI+R+FhRMhLItRYMzkNKCYj0t8eTIzy2Jv2fO6xXBPIrNTBsryvPpWL7aMR
	1VOBPVU4oZnouQS29qMjwhqi7YXHUVVlWw8Kqw2Wc5ZwrtZlxvSrG2pdn5TQt7IBWiaBYiIuFmU
	tbZIv19GdxPp6BJcANgKTA3+8YmRNlghyV0XriDcxtPEW9n7TxUFM1Z+SSFYf58c4+i9wPIlihQ
	MtEiAqRSSw4CROTBxLRitDdFOyfmJy2oP18UGNlDbUCZkcCEj7QTguXuufAuL3K1/IvtpE2MZ3m
	maod6XA5MsIgr16jDSnAYbbB9RUjvJhJm0e0I7LggzYEcXb/EErUcyIaJunfEDljakYH8uxI0IP
	p8+oqi6GHBCl11DkNhLjyobvFz7hzNui0Ca7KlFTaDVx0egbPuB2120xPcoTr+hjs9K3eb2wxW0
	MC4Ndqi/ITgSnt2aUYvqGZliqHEtuDj18r9rl8dUC828i1uF4Mm/1gkT+n36Qzve1sTIClRks1e
	dV/VtCPo9o=
X-Google-Smtp-Source: AGHT+IG+gvq9vJTCt+5pyWxiCzEcIfQz6BO4MhPzenmoiqj/1PmPt6GDmC6QwRXxUKbRTif4JvBq0A==
X-Received: by 2002:a17:907:d7cb:b0:b04:1d85:7106 with SMTP id a640c23a62f3a-b1fab24299cmr333418466b.21.1758210764801;
        Thu, 18 Sep 2025 08:52:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:44 -0700 (PDT)
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
Subject: [PATCH v5 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Thu, 18 Sep 2025 17:52:29 +0200
Message-ID: <20250918155240.2536852-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_085246_976922_523FCD67 
X-CRM114-Status: GOOD (  12.87  )
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


