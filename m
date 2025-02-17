Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262DBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2/5+Y7Ff+7jEsKltKVHAC7YhlbKvxCsRgTAXGknrcs=; b=NJIOxHmu8PjKvpTlGjdlwWwFEA
	8d7ZGdPzVA46fzUdIFkXBtb94yan2mKPSSBXPda6PFPcBUVNe07Qi1Kv/VAWJs7ReYwtg5BRm7og+
	HRbf/1lVz9vOJ/1+cqkjNhTKlnxQKQGhrD/zLhWb03wPhH+7g/WTih6yLZKpmrVXKEaPvekf9r5WG
	ozLhIvCIt5SXdjr59MumXPc4eaNewY9TvFnlLZqdzPU5Gos/i1rUROhqnaX7G0DX/GdgFqQlMFFJb
	oHlnXrhP0zDYBSGZtNcIiWcUavqcsh0VAXOcREq96EZ55Jl3l5l5soSQrNmaMiY494wPhjX2gfg87
	nwiVLTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxR4-00000003vgb-37Lk;
	Mon, 17 Feb 2025 09:29:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxCd-00000003tbP-1p1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:14:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso43996775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739783649; x=1740388449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2/5+Y7Ff+7jEsKltKVHAC7YhlbKvxCsRgTAXGknrcs=;
        b=PC6XKOg9Lpj/riLL/Avp150o/YNhNGMBpjwJXzkUOBAh3YsPpLwlLvlFoiOwcdr3Li
         nwCTQUOwmG0PdgaXMtzZMrkcyLas+TyUhcMH+pr2NpQZpgNHuO+OHsQrvR+hbpBu06df
         mxh3aQQWPET2NcrqJ+s9tHHOuU4UrRZMN21kZaL+qCKIyCD0FgIP43UlZ6bHOhX6tV+H
         +fTkU5P73WuG2hnMHUodYoLGGsGm5eLoG1zEBt7pjb+/gkyVdNSlWBCJyqssFdP7EhFT
         BheqllkVRly/kg6WD1h8omOK88cuglk0tBrXzPSm507SyNgkjBgX0ut8h+rG2J2QLm+3
         jf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783649; x=1740388449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2/5+Y7Ff+7jEsKltKVHAC7YhlbKvxCsRgTAXGknrcs=;
        b=nhWdMiTi7fa5vKuAizZ4nOLq0+MQN/oI+9vDF2xJd9g5VTSABtvGEKHwmvRhKbt9Bv
         nM76yRUJDPpcKSXPOtFBWdwOJ7vrrs/ZMOY/hBu44cxyggLLKQLfcPcC/wN9wKZE6dPd
         AyMjXoQkpc0gXgg703SXc3WxEEL3ckQrCNNjov//Xzc7n1u23TAy2AMgJXzmquiA3nEo
         aLsryYwL03UwZIv1r715tR+FRAb+89rgGcVBPQrWGPYTTeoYvBExHcuA48OkexpwU7IR
         hVMXs+3YdH+6l29ueKeL/+kOI/FFrv1CS/JEiz5LP4ip5Ph9QzxKt8vCh/DHzNhAbOTn
         3GYg==
X-Forwarded-Encrypted: i=1; AJvYcCX0D1TwdIUjFU2HPScqRVKJZ2G6SUwiXUh6uOsU/nP/EKOzJINkYskJi3ZXnGIt0uEA6GIJpdBDI4do1XhTDcyh@lists.infradead.org
X-Gm-Message-State: AOJu0YzigEKrzYc0CYwa1q0qhgZhMlL26itiunQ8Tz5u6uAw+FOgsTpl
	cTgAEwYD1sDMXY0kHMGtmwp+oAhS+/6//EWHaZ6+OnhHhJLaLecD
X-Gm-Gg: ASbGncuzLJxGQ5xyoo9k2RXV8oN9si/t7PvphhbaHa/QBtYEEpA+Bm95n3TQ+Fed6cb
	kc2/rMSH9IRuCGouhR5rsClQjnReBPefEsItAdYsdy+7XWjmq5T3HUHAGTmVy2/BJ5+WeQZeMNj
	dCOdK6elsKzym/Yfat7bmPNCHY3qYY8Po8UOWNivDCB9GvgIbMce9k/vvTKBuJDMd6BQcXVewOY
	d0p7IvFBNsygYLEUEHJHp0ni+GY8tc7PDjf5hllT4L1Jb1fP4C8ZX4gDvyHkkAgS3wunZoBAJG/
	zuCKj9qXotx6HXXl
X-Google-Smtp-Source: AGHT+IG3olWzKxbZB7uXgl/e6AWRg54BTyf4+PSo5Rjh4NLRyEDUpv0Xq8U4vn8jjAa6cyj/4py8Ng==
X-Received: by 2002:a05:600c:190f:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-4396e5b9f88mr104227635e9.0.1739783649144;
        Mon, 17 Feb 2025 01:14:09 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439618a9ab0sm114505545e9.35.2025.02.17.01.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:14:08 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"
Date: Mon, 17 Feb 2025 09:13:41 +0000
Message-ID: <20250217091341.297401-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011411_470428_FDBD8A8E 
X-CRM114-Status: GOOD (  12.15  )
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

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 1201380227e0..a85b2dbdd9f0 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -620,7 +620,7 @@ static int acpm_probe(struct platform_device *pdev)
 	match_data = of_device_get_match_data(dev);
 	if (!match_data)
 		return dev_err_probe(dev, -EINVAL,
-				     "Faile to get match data.\n");
+				     "Failed to get match data.\n");
 
 	acpm->shmem = acpm->sram_base + match_data->initdata_base;
 	acpm->dev = dev;
-- 
2.47.2


