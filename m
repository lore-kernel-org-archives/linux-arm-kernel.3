Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A088DE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 05:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zqIsEszztQaofpg7Apmowpob1qU+kHY4W1kZzuvfgdE=; b=x1QWq57hy/RVUjnVu5F7Kq+rp9
	WtZX6hK8g2sWytxZDfbBpt5YI0wjR5G6TezcmSWhProGdtFAkDO9j1A3LQ5YgUUmnesBrfz0vMYAa
	gjNZqUYyF7Qsx6jXORZ6rQE/kRb4N3tiLtqXz9FD1YkBAndITx2zqBDrBC8YaYCLZ5LJlEa0dGjD6
	Ss93cxg4fIsypq1g3lReUylEtdmlcaBG/ZZT2eb55YCaVPPvXofG+AD/TAI4b7pW7Oal9PMpP4Pfo
	53KjERgyy69sIGq1CJRy6f4dVP6HqBJT/b3SE20+u6mv4A1ue4GaiFn7aD0cR1VtCZ6eQnvRrjKt9
	qbRdtG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4D6-0000000En1O-47tc;
	Thu, 05 Dec 2024 05:15:32 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4C5-0000000Emqo-1X9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 05:14:30 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-46684744173so8062211cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 21:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733375668; x=1733980468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqIsEszztQaofpg7Apmowpob1qU+kHY4W1kZzuvfgdE=;
        b=nSPxp3YgWsz4VSVS3AxkACOklFySCvBGmfJTk9MMvZwsFquK1v7Xxr844wGNbwidLs
         8ysLzjrv4hw22XtVOIGHla9yoV34tqHMzvA1pANJr+3zL5ctmDMtB5YblcPmDqi5yMI6
         cMSHKahXYG+x9x+UoGBxZw5eh7uCfTyH6oDHgRm2Cd3TuETu88Xomop/gUuJtZ1xzxy+
         LrINJCrQ/e+B/xwKQsWq+hUGLz0rJ6+vdXiaHr/VjRAXFGZ8kNKjl9cMLOQ2FCgSeJrU
         mGBeE531rnYgVGmHnIPIr71wmofuB+3z73hPmr1QpWZ3NpIF1ixN1kEEn8qjIoUMNH+e
         MHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733375668; x=1733980468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqIsEszztQaofpg7Apmowpob1qU+kHY4W1kZzuvfgdE=;
        b=CmLoEwRvhaW3Y/qTsJ03JH58XXWedqSN+0J4wh8ASpOzQbLLmFGTBnTcCcaFtRRoAK
         uZjGZHyq/Aq1QmTlZYJDD1vFSQDV5wjtnQyljvxhQ+eKgfN55m0KRHMNyn1pVErWJH1m
         /batUKK3cS4/s6WI/WsxwMBK6WHTjYuC18nwAtCEn3I+TABc2UQE7HpZQbRZKql8Swmd
         WjT2mISZASF+9LCTgnRYCeK3fWgbABEhBTwdKjHZmk+uuTsOduO16b5N8EIjTC+AsiqS
         Ib4msJPnuls+KRh01DDhZmiSEFE5ecJVS1TXfznLZ0CAu/nRANAmg0K6QlYjj29bWmsM
         ziqw==
X-Forwarded-Encrypted: i=1; AJvYcCWyi/LLAJhjaxTvChFjuJhNEwDTS+SDyK9RmsYZ6OteoruQ+SIEB/7Igi9++NxRGerd8ywjZQGVDaQ9ARjuLXAc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1uDmf63kOeRjlDiZw/AT51xE7Xx5hGxXE2t7kMupNHHw+3JfP
	6cgmvzt9juib8GwNko9Fc2Q4t7uJUAn7yqqAziElxIp/QQqhPWT/
X-Gm-Gg: ASbGnctstf6H0uNIClbu7y6he0Slwez3QgqpXfL1uiWiGODdqhPiNJ4QnUuD1rmr8e2
	wvD8By8P98gnVF45Ztu+Ol9G9SieGIuKktbpH4VvbgSHeGBjVdAsR3U529/bra64mLArJrmALfB
	qv+pk6JFS3gIbTHuWX+nDF3h17CKC21ILAouQ7f/VAspWV5w1yQbaVEm66sXaAe9JGuLaKNT6Re
	GEweW1qVFDaliGzTKytd1ExzfmI9XNKb9VlzvW8B5A9rVQJP8ebs8Kigmyeiw==
X-Google-Smtp-Source: AGHT+IHzGOaqKMeldKYNCc7I7mqnuoEWuHAjvkW6hiehdx/v3xwHIV4vK2uaIYyHVBgVn+HHe4JCfw==
X-Received: by 2002:a05:622a:1992:b0:463:5bd4:59b8 with SMTP id d75a77b69052e-4670c712e88mr150275551cf.40.1733375667946;
        Wed, 04 Dec 2024 21:14:27 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467297c239dsm4041821cf.77.2024.12.04.21.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 21:14:26 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com,
	ukleinek@kernel.org,
	coquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	lee@kernel.org
Cc: linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pwm: stm32-lp: Add check for clk_enable()
Date: Thu,  5 Dec 2024 00:17:46 -0500
Message-Id: <20241205051746.2465490-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_211429_406987_5EF531C5 
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 989731256f50..4abef304417d 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -163,12 +163,16 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	unsigned long rate = clk_get_rate(priv->clk);
 	u32 val, presc, prd;
 	u64 tmp;
+	int ret;
 
 	regmap_read(priv->regmap, STM32_LPTIM_CR, &val);
 	state->enabled = !!FIELD_GET(STM32_LPTIM_ENABLE, val);
 	/* Keep PWM counter clock refcount in sync with PWM initial state */
-	if (state->enabled)
-		clk_enable(priv->clk);
+	if (state->enabled) {
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
+	}
 
 	regmap_read(priv->regmap, STM32_LPTIM_CFGR, &val);
 	presc = FIELD_GET(STM32_LPTIM_PRESC, val);
-- 
2.34.1


