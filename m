Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=; b=WUGHTGk3s6nx4zgvOLyu0cQxk0
	29FG2R5ngOK7fpf0CbXb7DZUwQqTCD5/ZhahX+Q8cANWL6/lB+7wYi9D62rFzOkRJ10zjPPFsA6Dx
	QcvVaoCF6/mUNQolwoDPRIdLzwjMwpthIULd4Y8BnATHRdF22w4sbgruvhTuG857LAdSJdGtrYzyj
	lH+vc7hxqfu1F/odpE7mJ++wSrn46DL/NmLVMlUkbjVx/xmm/Y4iTWKFdoBn9MGP7U0btoFjEnI3P
	lWe41ZjEte28SD4XNioorGRFFp+AyEgp9pOJvNdwVjE71nsBfvl0BJ9leQJer4ToycGmRsIkJd9PT
	mEfLz3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTpc-0000000BJrU-3tfD;
	Tue, 03 Jun 2025 15:45:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTnP-0000000BJSJ-1h6j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:43:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so653638a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=rSRebq6NRKp3K5EGnJiYy0ISbKE0AgENI12CGSS4C9tL+yCVy6U8YtpMqVNStJ3prz
         AH24RLS+0Y1VblFCsKtvkOhrtSJhnSbRoAw9tBv/8u7moaNn976D8kMkalnE9JxG+QvH
         15l5Pxkqfngg+RKZ1N8y29WbHcpY7XO3lrb86a5iJcu2gy7rP0hm4ZJIqt8JI2qsuBOo
         mXL7Gv/MHcwlKVr2DNSraa1IFzbvONfX/FQpQxqc8tFr4c0eEluuhP5rPME9545u4sP5
         Fbr9H8nKRU/AVWsWtCpCo6DThumv2YJmOw02iCP0CPmd2J7ypboMT69OQERK/AjWr6xd
         I0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=NhBwYRHFd00csd00fqXFK3HYlzHv04VuSuSBJ7iz+grKhoE+eH0U/lZnFCZk71SyIL
         qPpqUK5LqBewiExfsTu2HOzFGbFqHpFEaogEy52njVh4SBBJGmzYV9Oc8wJqzhqL+H1g
         SxxY+xZq/sW4fGVNlt4++W/YMboT54TDw0pcBVTMoS/HEo100DD7a4M3o2M/t5FKPW3J
         eSed918Xd/ZsPMXlZ+FxGLUj61K12AX9UmmAvTkbGGiPf4XTZKy1t8NslnTNV26cBel6
         vCoR4tISziVePAmfh0I/gjtrQ+BO/LZ1zJx8WTOcBKzf5JBZ+25n5D8iAYb2PtwjnMlD
         ThKA==
X-Forwarded-Encrypted: i=1; AJvYcCVxTTy1OmH3bl2eD1Ohcdo7S//NWqDQn3p7CJXiiBnrjNQ89JElq8549RpJ2YqNSLAa1pUJJQqPOQN9H8zClP5c@lists.infradead.org
X-Gm-Message-State: AOJu0YywAoctePNVBf8WXjD7vJ+mHxsveOEMKZJ/FAliTWA1CH2KWmXd
	tnUkmmRo5mUgHKwLoATiF6NB7dTkTOikAiXkTCiBbaUne+pnQVSQNJiY3XVwMU5ud9Q=
X-Gm-Gg: ASbGncsout6zM7ZQUMOr0RfWuNynnERvG5WUXHTvHCjsMBD0L2BFfRLeeecflFsA0RZ
	2zJhUdJl6h50VBMKLF+xuOfoc4sdGa45l2ZrwvuTboZdRuaQjGnIeYlzlvMnQOj6fzSjKbNHxm9
	UpJRPHnnKmz3T72O5q7jixMapv96s4lcraVdJIYQzyQ4jHFlTbEgKyWl5M3eQM+xWiGfpNF75Yh
	dKsDnI52CVfvOlaDaxqfS3uyMwnma2BcuGX5UusQGlqdFpzm5gTDf94JDx9TmNzAiiHGOxQV55E
	cD95H7TnHu6Oz5W7w3fZgOaObf0vsVZOiYnU99rcLNrKLP6ceeoI3JBgnVe3hfFUasccFR+2ZYV
	AMEfL5LmZzTbfY1vtojl7E5MxO8nf0JlvV3M=
X-Google-Smtp-Source: AGHT+IHdbH5nQxzalWh/NsDVZb6FCYdDH3rQaVkOJ6uhuni+aK7sz1J/yFbrtIh3WrzPAg01pUI1GQ==
X-Received: by 2002:a17:907:971c:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-adb36be2060mr1662069466b.36.1748965401532;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:19 +0100
Subject: [PATCH 1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-1-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084323_441143_60727D08 
X-CRM114-Status: GOOD (  11.11  )
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

Use the correct Linux clock ID when instantiating the G3D_BUSD
div_clock.

Fixes: 2c597bb7d66a ("clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index f9c3d68d449c356019aee569fbe289259624da70..12ee416375ef31deed5f45ea6aaec05fde260dc5 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1154,7 +1154,7 @@ static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
 	DIV(CLK_DOUT_CMU_G3AA_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
 	    CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
-	DIV(CLK_DOUT_CMU_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
+	DIV(CLK_DOUT_CMU_G3D_BUSD, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
 	    CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
 	DIV(CLK_DOUT_CMU_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
 	    CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),

-- 
2.49.0.1204.g71687c7c1d-goog


