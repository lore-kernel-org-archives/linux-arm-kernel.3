Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBC1D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfmk75Hhz2Xw4yga2iQQdoogsTTdr+c9FXbno8sZsXA=; b=Bc4KfQKv+2IeSilq2O+XNIC5jy
	MYp03CoewZdzUXQrUymGwLXwaefazp56WN2BK6iJN0N7y/6OuJ4gOqPXVCYfldyMbixtyUUzQAx5D
	oIND9HI8blw0NeLBn9d5YO4y9EYNoQnbqdyYEk1F9EWNUmmE057UzfJtR2ZnUCyVhDss1QUYP6Y/0
	fGcmjyFwMWP0GmkYwA45EjY5VjR/vq225bCAnKjN6q7TCdeXXcygKde73JC+RmMEGkcc5Bj7CjiD5
	MyIQBOm6RXhOlB3ZvkNa556o+BGuV3oPKdAYyJSP4r3e38C7G3EII6VgHeEMTiY6UTY/Hb2VUy4c6
	fe15n+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Irt-00000003ZVy-0aYq;
	Fri, 25 Oct 2024 11:52:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRX-00000003V18-0xfQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2264786e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855521; x=1730460321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfmk75Hhz2Xw4yga2iQQdoogsTTdr+c9FXbno8sZsXA=;
        b=W7oLSiHhhnrVzkp1tC1yMq13ryze8EsRaQSyNgutGDK3qw990yeKA84Kmh2h1MZsBy
         GUAfQeGXoRa9w8FyBHm1iSotGzfPii108gwRSY27LkEuR5SfM7mTG918zqr+Zi91QG01
         Su0G1XutRtq+LNZVAuVG+p5xLTGg1xiVoyyjxkCNkHFDaSacvVt9R3FV1TY/esnEcAj/
         dU3IBMpzzDl/bXs0hTea8mAm4RwrdP5uDi0XwZmCwjye4vjVW6swdGl4UghCGai6SvI+
         gqklq7lNsZn1LjhWsREg/aMYp4GNvGRQ5l/jtHLrrRj3SWIQ7W5crDttx0TWBkmbF1jw
         NxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855521; x=1730460321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfmk75Hhz2Xw4yga2iQQdoogsTTdr+c9FXbno8sZsXA=;
        b=Vcy0SIATUwkysz4jFzkoiJC/H1QGiHscHB0whqvZ58J1ZRbNFTMMPiVd6bMNidzUsP
         +hcADa8beBj5jlmisBsUzQl0a+ke6gmiI2yhJDRAHyJ2AKe7lQtIFAGvLIW76OeMt2U5
         XnH9lbgwmmLGo80T1s1VGHodkzpUjcJ3FSYn4QncrpH37FxOcby/9D4SsLlEzi8uUkSl
         YzV0f6xncp+XTco/eiqeEELO8zobOHvwm9ELQ3SYVEULOcHqzlDU24cy9TWnRWknkRL9
         kpZSuRaA8D0shyzKorCgGRjmnAgnaT9UrDhjKz7RCElpgU+H3ZwCe4UF8WWioILts3jv
         T+vA==
X-Forwarded-Encrypted: i=1; AJvYcCW9/Drgkh7wsVutrZqQYAWmqdOd2Kjmx0zrxvwoISjmhIi/QqVUh1/XhzLEnb2IhvephjEC0L6MGB8cLaZ9sgRV@lists.infradead.org
X-Gm-Message-State: AOJu0YztuC2KReaVaT9u2o4p+Hkm+ztrycRWbw9OQonQoVdRJ8txZQkD
	2xclTEcc+6aBvHUqOV+Mr9E1nqe7vUuga2ceyuRB562dQXdQWwDL
X-Google-Smtp-Source: AGHT+IEKuF2qGblcDX0DaNtthJikseGLtcL4BLcwgFrdAEncZrgjqZqtz3jqOjY0n7fo4E5XUjsoCw==
X-Received: by 2002:a05:6512:1392:b0:539:fcba:cc65 with SMTP id 2adb3069b0e04-53b23dead9bmr3447856e87.17.1729855520458;
        Fri, 25 Oct 2024 04:25:20 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:19 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:56 +0300
Subject: [PATCH v2 09/12] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-9-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=940;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QjtBasZbvA/8f0B/+aABkLP1VAZE3+DKqz2/AET0FRk=;
 b=ncmttaClZaIRfTZtg4vfNFS4I8cwBDlN9bWFjIpjluY4rymx8V7ECfUz67WUr9/Wk7q4dA/Hl
 wDMrvBxTz+WDmuoHj1pcX0qkbNTmPwPpgwDYR9cAQIavC8rvf6+2B4l
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042523_351788_21DBAF2A 
X-CRM114-Status: GOOD (  11.18  )
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

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


