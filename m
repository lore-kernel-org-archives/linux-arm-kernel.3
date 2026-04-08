Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B510FC454
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 23:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvbCwq68/qWYU9XfnJUnTP1IOqn0jqRNVTQiaBiIGqE=; b=mopa8uo29BVgCzv9aXDH1MpzIt
	AnZJpolenDQwzMz+81u2Bxu3rMjSpYo29faX+3k4Tx/9vvVZyw0pa43suzcWe3d8kSrWKNnIlFozA
	8NfPI1UXbHf2NGmPVEZYRH2JzAA0156wrCGXiFEm8VvZM8BpdDdPi5VFYbNmZgSBHWKu1tynfaqyP
	ysBsg/LvPsoMq3zK95lcPPme0py3QIHR+CY6wDZ9wR1RfvKVlYUc4sR/xEDG9tj3BjgQiWUezM52K
	44LFbkdDKf9bsk9oK7ZBAuW06424tVRm9RJycctjHFR0xBBZSY1nwR6qsknMiIyW3Uhhy+JmGz2qJ
	p74SIszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbua-00000009VJu-2lOh;
	Wed, 08 Apr 2026 23:02:16 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbuY-00000009VJB-1kTc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 23:02:15 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8d4ba1518afso18390285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 16:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775689332; x=1776294132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BvbCwq68/qWYU9XfnJUnTP1IOqn0jqRNVTQiaBiIGqE=;
        b=l+nwzhxHqQucBFJdwCMudzDKhTfk9FpmlvooRzG9jFHWS5Ng8ijmbt5LohxUs0vtwb
         1O3c+TqihxULVnOzdMwzzb8WQ66OMJNLR8PqZN6h+1XbeCJVGGp6LLowADrR+7eRqk/f
         XIxCWVOfUeq5dB0KSMY+d/bSZBmMlExrN8aJMIYaQj2h4C96pe9/int33+hCzCMxhys9
         Bek+ehD30tyZKuWVuOA5KPwxQkpz0YkE5MPi0yJ/6998fQs6k/4V52KF6ttiY8EX3kyP
         hQllRfIcBwI9Yw1rIqJgEZ5nYqhP8c/Q6fOdSDfR0EDoTxymBxuGpBI6v+r/RKFxRBaR
         93Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775689332; x=1776294132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvbCwq68/qWYU9XfnJUnTP1IOqn0jqRNVTQiaBiIGqE=;
        b=VjgwEIRaMrGwkPb6/98b6wyB9Cq8aVjLv6XrLiz66vbOmG7Uw3MPOtrNbdTIGcjMTm
         Hx3SwmyBO9DQIE2d7I7XCThMt7uC6gWeVv6fUrE4DfXoZkKjgAgbBtCm/2HnBNQobncJ
         WjSEMTWdxdJ2OXuiq2uu3mBxdqMyca4UlN6XkzGQ7OMo4xKr38XewcyPHY5e/p5ieu47
         7Psr8rDTcU4fqCDH5kzOoDsb1LLy+D3xxTM2b2kVU2RHJkbq4rWWQLLzLUMjrnCRTY03
         SK19tgEeDsV2Ny7J4SEKDyxTgCqBIfFkg2aPr/qv7hcBzA9XkNim8SGM6VjWE9xdef+l
         Oo5w==
X-Forwarded-Encrypted: i=1; AJvYcCUTbnjtq5aX3dZN5QndSXOD/tppNOXyc+lbCOu3Nu7APy6BQU2dZWXXKyRpypiYIVsOXXSkJYd7hgUAe2f3XbAm@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4KuvhjAo8FJB79Vh9K3kgtrIMwP4qb5xO/nlg/y1FFMQAv8h
	HcT9s3tZpGOxJqmNLzNQUXqte/0cYqKDTg16EEhgQ70uTwNvNepHTGts
X-Gm-Gg: AeBDieu7M7vPZFUiAGJkv3XmhGio+DrfbyYljG9GGwe6v4hBL8KGwFo/fr6y+S9YvcG
	kpWyZhOU77d16M6eN+lGBlZ+LiOuA7c+R1mUfkCKSnQGyeigc681j9VDKLfvh0806I8ioV9sIb8
	bTKPGd0u8Gty3e4qSxPCg7ZEcWzLd1FB1qIWPuBiDEdiXwxH9G3K9eaTD2/trsBVIqJanldehJR
	PALAVCB6poKCr+Eo7dYilEDw7+IJXNfc3kiJ8vSYKTqrcYYaywoPj8Hxu/iS3dTBXOIdRWgQGR8
	4w89rEj42LccHs3JMHNzJXSJUvPrVIsM7L3U2e76Me5BBsvdLbbxzxFcGs73mUa2yzaEP7T+Y2H
	5OezxcBYLw1/jtZOrOCnx95zYdMHF1ydjl8U3AwkNp0QpxrsqwvGXHP/5O7nA3XWC5jHd5gLtwG
	uQyHb/AlxBthPd7c5MgrcDeyRpMDEFYDGniQ3gyEpB1aGX/a4PmQX9x1g=
X-Received: by 2002:a05:620a:29c3:b0:8d8:13c9:55cb with SMTP id af79cd13be357-8dc439f3cbbmr205076785a.4.1775689332280;
        Wed, 08 Apr 2026 16:02:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5392d35sm1611561585a.10.2026.04.08.16.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:02:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] nvmem: rockchip-otp: alloc clks with main struct
Date: Wed,  8 Apr 2026 16:01:53 -0700
Message-ID: <20260408230153.20726-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_160214_488079_02CCF5BC 
X-CRM114-Status: GOOD (  11.44  )
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

Use a flexible array member to simplify allocation slightly. No need for
a separate calloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/nvmem/rockchip-otp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 0ec78b5e19e7..2c0feb036f3f 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -78,9 +78,9 @@ struct rockchip_data {
 struct rockchip_otp {
 	struct device *dev;
 	void __iomem *base;
-	struct clk_bulk_data *clks;
 	struct reset_control *rst;
 	const struct rockchip_data *data;
+	struct clk_bulk_data clks[];
 };
 
 static int rockchip_otp_reset(struct rockchip_otp *otp)
@@ -424,7 +424,7 @@ static int rockchip_otp_probe(struct platform_device *pdev)
 	if (!data)
 		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");
 
-	otp = devm_kzalloc(&pdev->dev, sizeof(struct rockchip_otp),
+	otp = devm_kzalloc(&pdev->dev, struct_size(otp, clks, data->num_clks),
 			   GFP_KERNEL);
 	if (!otp)
 		return -ENOMEM;
@@ -436,11 +436,6 @@ static int rockchip_otp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(otp->base),
 				     "failed to ioremap resource\n");
 
-	otp->clks = devm_kcalloc(dev, data->num_clks, sizeof(*otp->clks),
-				 GFP_KERNEL);
-	if (!otp->clks)
-		return -ENOMEM;
-
 	for (i = 0; i < data->num_clks; ++i)
 		otp->clks[i].id = data->clks[i];
 
-- 
2.53.0


