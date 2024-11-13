Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81F6D41C1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNsK27Fa1Ex5W0VeJ3TA3Gtj8S2K08nVqm3agCQiDts=; b=wS8jZfOkU1ZFecZ/2v+avO8Bp5
	6XIAUWXcnRntoiLsr+yIh1GdYXod+IfFAdtur+G8PU7gySg044Ed+gKeA6WqNpMALS7/Zxw9jrxSm
	Fx2KpCnVmeKZMH3Ufx1DardjZTmTq07K5mbdn/JNUpmPYs7CEcinjNAol/EHJS4DKsxUzhMeYvKs2
	sXD/ZxGSouCu6EK6BgPm2D6reMSKVv5jJTTd2FNZWLtfGRBxSjPHc6KABWG0w+VRfTIX1dJAqzJuZ
	k9/aU0DOfCnWmAhEXcApq5I6mlgHj/JVRn445+bGzKCOcOdeHe++E9B5o8aDq1lXnm7FhRs4tCbc0
	jjPKVC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Fu-00000006B0j-2l8i;
	Wed, 13 Nov 2024 09:01:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98w-000000069qc-1GPM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cf3e36a76so68683485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488069; x=1732092869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNsK27Fa1Ex5W0VeJ3TA3Gtj8S2K08nVqm3agCQiDts=;
        b=i4Gm/KznE/KakFQGiHatrxvXOYwa8m9pBPqBHNZVpV8EGfJNVugRhIalZLwWySEId/
         Q9bMwcCwnc6rMozFL/690FCzPYBRseHkeMee/AouiZwG+3EbrdyJ+BBxEs7AxjrodKL9
         enlnPX++LkhB4cLAiX6WubNOkDZBBVeeLgsWhB8GkUNNQ0FZ3ZWrRwqnQLGFsn9CMaDM
         mLxLI2/SXf6+wuNOVgCq7alDK/4L77XSS9+5hL4uAsxMvqUckcfY6iUgVRZpJBlyH0cN
         Rs14E3ipt1g2mDUqqZP6Fg1xQu46tcjxOdIDjTVlWncX1z6yO343cToX+UAob+0lt5VP
         9eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488069; x=1732092869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNsK27Fa1Ex5W0VeJ3TA3Gtj8S2K08nVqm3agCQiDts=;
        b=rhVcG/bbqEdcpqn6r76PC245rz7SIrwaGwIkP0PUxGay92ap0TkeQZtlFJaQ2hit3L
         zokZW4oocpknHcMxo9It7uiYMEb3UOHyu6YGK6o2wIB9Y0oV9WaSdrbbZV/RDmV3byYx
         c8Ew6y76rYkmc6r2FAc1GG5BZvB5CJb7SfKTMKsEnTw3m+l3WfE6nTqRwHRFTqryFCzR
         luinTptI9HWHPO33xyffPd4+F0nmBibVpRnOjGC7kHAC0UZ1ECtjZlvAm3By5KXuwyiN
         iX/nfmQhRHMCH1o1vitmqOpNOGjoJVexGlDUAex8iolj/GWM+BC93Jv57soMkP979cGX
         kQQA==
X-Forwarded-Encrypted: i=1; AJvYcCX8n8qN3wumPdutKGJWBu858k5siF6hAuZjJwAQ2JQGZVq1fQM1iAGYEIGy5MF04E8QqhzqIW4VANmtLTz3z4vt@lists.infradead.org
X-Gm-Message-State: AOJu0YxvNzBHN0fL0QlBnQ6PA6yOwiuFmo3DcCLrc8M+BSlmzLEY/DmQ
	O0njO7kiIp7FVJojxm6W5WIqnRhyg8GH8fiwLKbWm2laAHR0Z3vbxANVV1Ja
X-Google-Smtp-Source: AGHT+IGvQQOK2pmty0Ab0hdZeyxnxRqA5cqd4YJeTPkl4mPTvKSC4kOdrnW1nTpFjXXf6p4vsYJGyQ==
X-Received: by 2002:a17:902:ccc9:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-211b5ccdc57mr31401705ad.32.1731488069238;
        Wed, 13 Nov 2024 00:54:29 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm106095085ad.11.2024.11.13.00.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:28 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 2/5] rtc: pcf8563: Add support Haoyu HYM8563
Date: Wed, 13 Nov 2024 17:53:52 +0900
Message-ID: <20241113085355.1972607-3-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005430_487830_D012D62A 
X-CRM114-Status: GOOD (  13.34  )
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

Haoyu HYM8563 has the same hardware structure as PCF8563, and operates
with the same device driver.
This adds Haoyu HYM8563 information to the device driver and document
to support it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 5a084d426e58d0..42382c8709b7af 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -555,6 +555,7 @@ static const struct i2c_device_id pcf8563_id[] = {
 	{ "pcf8563" },
 	{ "rtc8564" },
 	{ "pca8565" },
+	{ "hym8563" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8563_id);
@@ -565,6 +566,7 @@ static const struct of_device_id pcf8563_of_match[] = {
 	{ .compatible = "epson,rtc8564" },
 	{ .compatible = "microcrystal,rv8564" },
 	{ .compatible = "nxp,pca8565" },
+	{ .compatible = "haoyu,hym8563" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf8563_of_match);
-- 
2.45.2


