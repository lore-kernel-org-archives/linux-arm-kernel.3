Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D0E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jpeJmNd3SZuuzmsG64ANuW49jVrr7teCJ/vcrUeE7Ig=; b=hjLEHWoomo/B7sRzcSyoVzrFbh
	2ikB0dejYXSUGbjMXGukCou86W+S7RYH4OPAaPSqVu7e4aYA+wIuqvTbcM8z7sDns7DciQSkfZP4d
	TffsH76ay4Tulbxhkv5RyeKCZ/BfdKA4LqEaZ7zzdwfh88/6j1/+hQhY84e6lTjKYoDm/t2i+pL8c
	SIvqrJiCegCCTS7mZMmE1yY//D9IWXR4kT1/JH4o7CpOcAD8sYnVnhtgzcUhF6i/pvcrQdKyZ7Kby
	6XsXPHMN/iUQSIibG1oICXMAGCfThl6HRLbOgDsZXE93P2Xnx88+LpwYQv1kxV/2zx7z77xyGCzwZ
	X+F5KyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgdo-00000001HPy-4ANr;
	Sat, 11 Jan 2025 18:55:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgcY-00000001H7O-33wb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:54:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436230de7a3so4209465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621645; x=1737226445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpeJmNd3SZuuzmsG64ANuW49jVrr7teCJ/vcrUeE7Ig=;
        b=aXB8rF0RuyFzKLHuWfZQ7KKyuhr0epyhfWzAo99mCIMJtuaXRYXPYoUkGBAX1ejKW7
         NmMwvGNbO65MgTIcGDwXOLL8m7JhF1GydTCOPxxYL8IIfYUOHWQ01rjFHns8GurISoh3
         NNiALrsrHUc1tgyJvwDT/L9D2qV2eYUaEYjnn+XrGDr0B88DVnqCdKk31KpDHTQXKjzq
         Efijy8dU9SfJX4wS0I8eqsAN+qpEOgAanOVgRnvlpvO9l1+BkC43jPf3N/mBK6wfKW1g
         69GqXRFirewjlZ0e1ar+S1c79eKIoteTzgA2jJxUCaX5qOIJyHu8AV4MxlZ/nlHP6PmO
         lo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621645; x=1737226445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpeJmNd3SZuuzmsG64ANuW49jVrr7teCJ/vcrUeE7Ig=;
        b=uCBAQzUOlUp64m5FKQ3ECpHpYw9MYQ7bOy+kUyTZCWyfR5jJN1KZlqmnIJN7aORY9z
         zvwDhm7PszDpqseuge3LrbyPq4optkspjwLr+r2YpmtdHbdP82yFLkjQYdryZacVBw8h
         1w/7e0Y2uTFI5H/y8/63EF1y7Z/lF/m5oNMz7w0eb20LfSviePDWFqTJa8DY9V2dJQ6D
         RYHsJQPLS3/yH6O2xtQGT8HjYg908TgrIbzjiTcGm37YGRtsYq4gtWpjMIKqCqZvCdO3
         8A6L6ddrtU7YlBPLmmfwbfsINiqnPZY24Ed2umUgCFT+QLlmzJ1Bm5EFgdtROB/L+3hK
         6icw==
X-Forwarded-Encrypted: i=1; AJvYcCX0GbT4Hn6wXFtVX8p4eIp9LTAps2/1PfBgnSGmr8eh+5ohI24ynHgR7n7JH/Sp8pgWv5dy79HnvCP0HKDq52Ry@lists.infradead.org
X-Gm-Message-State: AOJu0YwJnk1nXovtdvVoUEnpqf7UVh1o4uFOzjzlz3f4v/3puMnu1HZ1
	z/HRUJBlY5vco7f/TQScSA3sS6b9RlyUGF2litsDKvPiZLzjwzHWZ0OYy6CCt/w=
X-Gm-Gg: ASbGncu50Unq3yO1MO4ElE5ns2Owvrd3LMHTw14YurM+/gJB12Ysjsu1Hmr8rr02e9e
	gmByULU/Mmhtn2BTQHxczQz7brBDgyH7UxAPYh6d/SV+qZOmzVSD5V/ZFcMwDaeA/1DOgvvzcb3
	9/VAe05gvZndtMTiHkVBM7W2gCUwhyO+j38kk2xVPzYexAPgyINmrbO1oFO+Vlg5pgyNTG2u8r1
	hQuy2nGfNqCv4XSqSCJUqiMLYi46pcdrdxQd/SFDSe81zL/Es5PozeqG7kvqw+uwmukTUQ=
X-Google-Smtp-Source: AGHT+IGhaDDKUbfokl+jU7qgUB7s/J6vYAVw+eGLas1JhElcOU2I0jx8Rxm9e4DElHdlP23nsTC55w==
X-Received: by 2002:a05:600c:63d5:b0:436:ee2e:ef12 with SMTP id 5b1f17b1804b1-436ee2ef108mr32106725e9.5.1736621644668;
        Sat, 11 Jan 2025 10:54:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc5csm90730145e9.2.2025.01.11.10.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:02 +0100
Message-ID: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_105406_788980_50B4CC54 
X-CRM114-Status: GOOD (  10.52  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-usi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695ac2..1fda8d72f687 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -186,15 +186,11 @@ static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 		return -EINVAL;
 	usi->mode = mode;
 
-	usi->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
+	usi->sysreg = syscon_regmap_lookup_by_phandle_args(np, "samsung,sysreg",
+							   1, &usi->sw_conf);
 	if (IS_ERR(usi->sysreg))
 		return PTR_ERR(usi->sysreg);
 
-	ret = of_property_read_u32_index(np, "samsung,sysreg", 1,
-					 &usi->sw_conf);
-	if (ret)
-		return ret;
-
 	usi->clkreq_on = of_property_read_bool(np, "samsung,clkreq-on");
 
 	return 0;
-- 
2.43.0


