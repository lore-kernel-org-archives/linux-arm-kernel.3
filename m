Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F003EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN6kFZ271/Vjt9LuqJxvnwus9JIfHbc3XvmUWyOckqs=; b=0gBpPZC8IQJAk9uBmUKOpLVKdS
	+LWDcwVDxC8XbTZRx/cHeEAMqkEh51LRAUQdooCLJuhvT/ozjtEGWv0XIIs6hvOLZfXjlppU5YGDg
	BcUXnz9/8iqfr+pTiLGZDeu3EpTPYarKG9bebrd43qFY/SN6aOeTUpW171Q7CrwzaoAlmYFr/1VwH
	e/cIRQnBOLVVf0MWTYP3J46zFqheXKk6eCWIK5BbB2Ry0ixN3HSpu6RTLVT2hm9MhOgUDknOzk0+7
	y3LSUaPKFSSf7XSZrq04QjKNMoRQJdOW96MXsqjnElfLsxK++TdEO3ZsxkEpCbO4CUbSTa9nSq3H3
	fBeFJBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFP-00000004pye-3XO5;
	Sat, 14 Feb 2026 18:20:03 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFM-00000004pxB-2Vwx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:02 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c6e1837e053so871221a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093200; x=1771698000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN6kFZ271/Vjt9LuqJxvnwus9JIfHbc3XvmUWyOckqs=;
        b=MzCRRzI+7BYVNOuy/1/0TIek7T8TCh7skJuYx1EfFVBT8xNoFLxl+MOJndscNy8vCX
         W4HiPrcxmXZJR5PrT3F+zQ0qTWC32ZnflSROcQh2PxiHRxs1MIGlcvTjXzq4zDQSFqp+
         mUs9nH1dBt4W9jsIEKFvyjUnhv1zHqq/lRGslrtGMQR+w6rJsD6JYC03+BM+qBuPG496
         w7RszOWYY5Q/T3hieZ2F1sxYZL26UcBnYc4mDtZuOOAJor3tDTBeyACQdJQHAZoJWs6m
         HU1ZrMJBar4gsPvICDxMd3ybTBc2z8GlgyTQ642wLZsEE2TB2u0zA2gfY/HymAe0gGJb
         I+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093200; x=1771698000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aN6kFZ271/Vjt9LuqJxvnwus9JIfHbc3XvmUWyOckqs=;
        b=T+aWe07TCygFdcvnbbRR+GM1mCPO22ACudTdrRx0TpBXNTeuEirFEy2Fj3Ppb6HqOV
         H37VpM/icUCwXbVBN4v2Mff5/hrLQgVWuGL/gqBvRh5ytSfnnVCvQixI9WbHzSJiAWU3
         N8Cc8FZ9K58cJ+HuSSLgdSshrRXaUCy4wvNVS8AJ2+Eg0a9wa/nMts/pKb6RqSB0OHr7
         y0Gt2bbBs7PcPH7itF+JDw1pfuOPUDUdlU4mjhcvbF1a3QNhzcmf3+FNVc8FK4cjDBj/
         diK6O6WxVkF/WwzthKwFPfMb56Xu/FZhGVkMs5vgVL5dkZyJj0assBbMy694O0Z3W5o1
         6wlw==
X-Forwarded-Encrypted: i=1; AJvYcCXnKzXe4oOEBfH/OB4KFMt0axNw92As0LaU3MtqImioUJfzYP6C4ahMqoi0sDkQDWj51SX46hl2DdP+s1rcY8nk@lists.infradead.org
X-Gm-Message-State: AOJu0YzySJsjR50dkB5leGEhTdO4GxPkjdZQPf2nZgDKkevEF3SPvyJy
	wxUZWnjlkCoIPxXGKnh3LpupXt85aeSwGyMMaMeueFrjBXV1fm2+btqi
X-Gm-Gg: AZuq6aLvDY/W1WD/4T3bGZ/yy+kslODjygeMyd6Tf5tuhbu4q15/WnyTXAuJHgOx3Ab
	JbtTMQN0bW8bssPGfAOlPDhJ2kPxG/zfVry/0THambpTu+u+f8/HbaDRmHVTxFletN1FemgD9DO
	NZMbr4EkSKD+ypMQld33wz+ibHWfEhSIGPo4yXaRTySZgGMH9y67I3UP7B2B7PMAZjwTDHa6qpO
	FuFOXHI/dYvtr+n5sUwGfYN7JU9l7LHJNavQTSMHCAgAO5OEa+696pAmjxhB7n+lgrQnUxqkXRy
	KWByVxxCk64rNRvxw8sLmByXgQ4QkXIF8kJZY5qGLsDHa0V7i/2rkf58WPmmUy70qNCegAg8cUQ
	bizGkBfG14sY0Oxcppm82dhO8zWxJwn+NZOGK/K/1eDUUwRlpxHHmkzkJ/a5I9GQnnh+XPgbkZq
	6guViaVoMAfFtg4pO6xrY=
X-Received: by 2002:a17:902:dacd:b0:2aa:f2f3:bca1 with SMTP id d9443c01a7336-2ab4cf4f72amr54134195ad.9.1771093199695;
        Sat, 14 Feb 2026 10:19:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:58 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 3/9] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Sat, 14 Feb 2026 23:49:00 +0530
Message-ID: <20260214181930.238981-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102000_647598_B1837315 
X-CRM114-Status: GOOD (  13.90  )
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: None
v7: None
v6: Add Rb - Lukasz and Fix the typo in the subject
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index aa0726b33c84..5f017a78f437 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
-- 
2.50.1


