Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED5D1118A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzgzMpcRdmKNSKal7H2bOhmkB/Lh3IDIXdJcfZ+Ojsc=; b=tRDz2TiHODDOjFtSLITemebRj7
	/IsGgHI1eSMKOs7P162kuabGjaCkaQjPpUfeGwEOvfYgIgMtKu+I+H7eRbaQo0EebScs3d9CICAh1
	dlgZIWNmHbm/wj5z/hWerGAz2xNitLsF4t6Iq2Yj/fVTZUBH6k7wOHMSwY2+c2ebsOaX7EPYYuUXK
	yt24vINSApL8R4wbVXO9vRPKuoYnD/S3XximRSSxSrDIcalFEST0lGKsp4pVothQBbKIYFaxVUmsD
	evxN3yJC58I7+R/YJRb9a5oOOFmZeBpJ7bFPQR7Wn1aN8JVi9F1D0qcQvXNiRTd+Eprp8thqXO0Ly
	VXFEredA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fJL-0000000Br38-2dtC;
	Sun, 03 Nov 2024 18:26:51 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fHf-0000000BqwR-0axR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 18:25:08 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4609beb631aso28395211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730658305; x=1731263105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzgzMpcRdmKNSKal7H2bOhmkB/Lh3IDIXdJcfZ+Ojsc=;
        b=a3fW2vvp/iMJ/hbyKy7yTEwdE872gWCEmvU8qPZfYHtBcM4HOifMm6XRZHAdEJP4ig
         oRCw9ph//I053WB5wskXjCXVUC0wxT9AY+RNj9VA3C6Qzimco/yj+GXAqferMqGKg8++
         7D2QTF9kSZ5UX63fPKn0evk5dOqvETAcfBthF52lpImGgx6EqU9R9PurT02DYjlwKZDS
         bO9DLGNteb2lXF6chs2tKRI/S0SiCfh/h2Bs6WrIS+T+jkrvGrW5tMruKxwEjs8seNak
         Xp7u3fWCo/4J1PL09vJdtcVqhavppQBCMVcTaIhiKDcjHMEJzEbEIDbg78dtAYNK0+yO
         ioKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730658305; x=1731263105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzgzMpcRdmKNSKal7H2bOhmkB/Lh3IDIXdJcfZ+Ojsc=;
        b=V8ZoZys6w94mS6kOVncLVGQJF/TKMB4lAhvNg0Ox0OGsXINo0K+UxqFHA8ZJB9jC8L
         I5YY+NgcOHEMxnNPeVKwy6O7wlHZ004e2ZEFYwBHFXYjnZLHQz8Imt3pCng9Jl1QWlL5
         Zqfltn87M283VriPSwlZj+wksYkA+Ol1MbgbAUlIuTBi4GEYJSC1TZPEutSa5vpSzHbi
         2Va14UkaS1Bll98UF3cgebv2GMsuN3jgvbBpGY66ndYp5t9L/SeELZilX8tsOvXJD3pS
         oFNr7HUcGAPfHt9SuJt2Z6IJD9nqoYTYOL6LblGW9iBjQHCk2lWVL0Cd4iGp9QPTqmE9
         T32g==
X-Forwarded-Encrypted: i=1; AJvYcCUSs/XrKO9ZORXsyowzlV+9FbiyC9s7EhnMVPui3/kvKzmsJFpSd16Jet42IVIEhTKp9yUaSe/9DdpstTlZKE0/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy/ALEFS95xNX9gEGdX2ImxJMxN0ZolW7qCxA0oO1JdZA8UyrD
	otCD7GzYBINts5bnmhbAccjOPqn5FUE0T07g/Duck2Owy+t++85Q
X-Google-Smtp-Source: AGHT+IEaw3nGMJ8bhhqo73g756ybtLD42XoRl05nXL1wjuN+i1W03TlspIeQ3fHjcuKr936uMQ2V8g==
X-Received: by 2002:ac8:5a87:0:b0:460:8bb8:fd79 with SMTP id d75a77b69052e-462b8646bc9mr145956651cf.12.1730658305244;
        Sun, 03 Nov 2024 10:25:05 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad19b328sm39287511cf.85.2024.11.03.10.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 10:25:04 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: fabrice.gasnier@foss.st.com,
	wbg@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Jonathan.Cameron@huawei.com,
	benjamin.gaignard@st.com,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@outlook.com>
Subject: [PATCH] counter: stm32-timer-cnt: Add check for clk_enable()
Date: Sun,  3 Nov 2024 18:25:02 +0000
Message-Id: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_102507_212429_35CA64A0 
X-CRM114-Status: GOOD (  11.78  )
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

From: Jiasheng Jiang <jiashengjiangcool@outlook.com>

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management support")
Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
---
 drivers/counter/stm32-timer-cnt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..0593c9b73992 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -214,11 +214,15 @@ static int stm32_count_enable_write(struct counter_device *counter,
 {
 	struct stm32_timer_cnt *const priv = counter_priv(counter);
 	u32 cr1;
+	int ret;
 
 	if (enable) {
 		regmap_read(priv->regmap, TIM_CR1, &cr1);
-		if (!(cr1 & TIM_CR1_CEN))
-			clk_enable(priv->clk);
+		if (!(cr1 & TIM_CR1_CEN)) {
+			ret = clk_enable(priv->clk);
+			if (ret)
+				return ret;
+		}
 
 		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 				   TIM_CR1_CEN);
@@ -816,7 +820,9 @@ static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
 		return ret;
 
 	if (priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
 
 		/* Restore registers that may have been lost */
 		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
-- 
2.25.1


