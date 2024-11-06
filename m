Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A73D59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG5UJizDLgMxZKPQD1e03z/iuF1AG30m4Ug3E1znb/k=; b=tW3ZIjUfQ/PXj/c7u60+Ilgf5T
	KFgSDeJP0Vf6YTvMMN+U+KV1Ah9pTxOD7EzXTenOU86nYIUGCGaCKJsrNcdyGjyBOQzrwaDT7Djl2
	NqKMkjq+xSTYlbomuLRs9KSp1Lna5NuObjYR7Lt3xgT7SlsSe4hcWsxrNQA0e5txQwW7s7f4Fpl6y
	d9S17kLRQNGAjm+b0Az4sAuSuXzpbobnOlLvNJvntBrh3mCFhp3At4xXTLfu4nlsmMXYA9z/8lF/u
	HDyR+OQ47moaJOCVHqnna1pxRkyHg+lJiTeaTO0JPg29w/coBmGJRO+WFLum9MFG6L7DSGda0R/48
	jUSikiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oEp-00000004sXO-2qXO;
	Wed, 06 Nov 2024 22:10:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o9l-00000004rms-0a5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:05:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so153149f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 14:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930739; x=1731535539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG5UJizDLgMxZKPQD1e03z/iuF1AG30m4Ug3E1znb/k=;
        b=Efa67CIsMDfcq1LcDC5a4JMNePe7slilVRvdswdGDmrNjmt9GHELlYLAWecV8jpu6P
         hk7+YHRGDj5iiggkVuqDuLkH3/hOVuVpbPgZ6FxM3fIvWAO8boeRKZC+KcL7Gy9HFjxp
         slU3mSDj8YDxuDBNTYJF74g0v7pwrln54/yNzo1KdmvNUrKsklDIzvH3pqfTv6PlJAIp
         9aTFhJN+iXQeOHTOGQDbtHDejPqGUXBXLkW+jezVaaQjK9yir6b2Q+HntXN6ZqUwl3az
         yLbnWVB9f0wabYDNHWX1ypHKm1W6OgG7Goj+ErQHpgub92MVAJZ7roMToFOdciHm5A/r
         G/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930739; x=1731535539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG5UJizDLgMxZKPQD1e03z/iuF1AG30m4Ug3E1znb/k=;
        b=PT8ExIoFb8gAsL2SRfrdNOjvCnkK4AIvB1BEqbYdL6o7vlgj8VB7cz7JHc4k7TMQ+x
         1VWNaU3X75aBOg/pv17ByrOHn9hMwla8c3XTIifdzfCdNIWYivMCAaS+79sExtV4jJ+3
         SRAI7T+2lftWd+5x0AULMstKFMop+zBQvO87Ww5mMi4KIsXXqty5Fge4dfH950A5JMqj
         Fh+nc25pkP6Q0LWrApEyYie5HqBvxRTZEw0jq4SDqylMje4TsQxGofU6hw1T5rH/FZZ5
         QcAL3flGaMEAQnHvRgaVRCsS7jQYp+Gp7ms7eB9vAA4WP8dLBwjHlNB3TSKyHIq1ceoJ
         E0WA==
X-Gm-Message-State: AOJu0YyTF9PqnhavcZPqk9A79z8pe9DiRSGboTur888I80oFyeNhcg6K
	KpV3HyEihyfu1FMFrv9X2DOef7CYnXS+TQAIKqxTCu+nC+ykJXG5+M4DBw==
X-Google-Smtp-Source: AGHT+IHseJSgbFNBVjoWiS3THi9dEo+NtqEvSttov0W6mgBFSYQFz5OMcDBoMLaZeVcaYvk10rAg0A==
X-Received: by 2002:a5d:4106:0:b0:37c:d558:a931 with SMTP id ffacd0b85a97d-3806115902emr28098034f8f.31.1730930738992;
        Wed, 06 Nov 2024 14:05:38 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:38 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Nov 2024 23:04:40 +0100
Subject: [PATCH 2/2] pinctrl: samsung: update child reference drop comment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-samsung-pinctrl-put-v1-2-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=1049;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=HZ84kAwePXH0iKsBrbTmJ8UZTEP9+KZqEVc88CIyNII=;
 b=GY6vOISzcv48AjyktwTvRi2p1sfYnHYxMpMijViPTLIYSWCBj4YfC+77AwLWNjcrZw5AN774I
 AJUXkmiayo/C8hgHn0p2gOJGfHYpceafRuVWOX8TmTl5w5PqmY565mo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_140541_214611_1B58A912 
X-CRM114-Status: GOOD (  15.05  )
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

Commit 954445c72fc7 ("pinctrl: samsung: Drop redundant node parameter in
samsung_banks_of_node_get()") modified the name of the function used to
release child nodes from samsung_drop_banks_of_node() to
samsung_banks_node_put(). Update the comment to use the current function
name.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 3ab5878b69d1..cfced7afd4ca 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1172,7 +1172,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
 		else
 			dev_warn(dev, "Missing node for bank %s - invalid DTB\n",
 				 bank->name);
-		/* child reference dropped in samsung_drop_banks_of_node() */
+		/* child reference dropped in samsung_banks_node_put() */
 	}
 }
 

-- 
2.43.0


