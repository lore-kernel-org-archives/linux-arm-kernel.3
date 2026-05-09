Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D84CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yGeg/u5Pz9hVNyAZhRZWhPuLVPXIN8vusR2dk7eDnv4=; b=LGXkElyxiioK+Z+xNmSZaxldVk
	pll3wySuo0XoIjoj2oAJ+Xxhnnl6PnGfYVkH13oVsYOmQ9vQ1p8ZfoV9XdQgmNi+Y8EAkypU5rOi9
	6uD6ikkJ4/xA2XqGEd05Bn7CsYG5b234gyLWT9cRyl800YOFMcnK/yNnJcYcD7LWnHRDv2mQHGCRC
	/AQ6a3Sv2Jf+JrUVgltDwtDBSTH/+7x0Us1Xa37080OJ0a4KfX1w6KKfFclDuNJzdWDJxp1UsvxwM
	Q23CkGpXHxcAdFA+daDzwRRY7SmMLBiRg3bV01u6fDbbXLaS+sXs5NGrcxucG68Q+WRy1Dzq86ubt
	Z9fll8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLlwa-00000009O94-2q9R;
	Sat, 09 May 2026 17:58:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLlwY-00000009O8F-1cg8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 17:58:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48e72b02bf6so660195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778349504; x=1778954304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGeg/u5Pz9hVNyAZhRZWhPuLVPXIN8vusR2dk7eDnv4=;
        b=PoNFrUhwmQBA4v74Zw15mTWpPVncXicgeKyLjnoDWUE9B9MQskmj10bF3HPDrppQjk
         Al+7V1CkvYo3zYpeCRfr3UB4+Uh47hKOrl3RCqyMLu5A/dIyILXqdVLo/dbnm8l+nuNo
         7CXug6O2bP3yuV3EAsHp94YvMD0USfaDYJ22npzfv3Cu3hPWWA0Q9BwTNg71eyXnXWYd
         m6jbtcnT7x5Uk2MejQZpf9zmGjIrVShywvjxUHwRv6L1ZUCoEyBgmPsYebTHvdeCSjL2
         2JDJWKr+NgXUzW7nYiVb0XgWItPSOxFFIXcg9KrSWEw4ZqVcU5gNr/TI9uCT6i+TTb3P
         mKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778349504; x=1778954304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGeg/u5Pz9hVNyAZhRZWhPuLVPXIN8vusR2dk7eDnv4=;
        b=qy3plChoFoCsLAeK6KMVRfvVRWmYQ+I+NZqw4X9mcvJCDCpC8YAL3aL+vJUJL2hmhS
         MXcJ77ygzqVpMXiZo4RQ4chA2Ib1iJu7F9ccRm7HivHU/Su5SJKalLuzyQBCob2G/lpU
         0bB0TqoJSGQ6r9QSbZ6uIMywdTh8xmtE6R+3Ey3IWh4EiNlT+QI4tNtaBxHrHn+SJWmW
         UU3ZVHGR+OMMnBpgy2FdFC4LOoUiBTYHKKy05WJgwTUsP/ty7a0Kk1F1X4Jmc2zP5rdK
         NLK8e05UFX4o9BsXUM3rbdkslSBn8gIySutslrO1D8UXgEnlDhdf9c/W3w90FKgDWVoK
         cSFg==
X-Forwarded-Encrypted: i=1; AFNElJ/InQksal5asivAq2vZeEhkqDTgraAeuO1hQ58/sTFvbFrZTJM/HeKsWlbO6Li2ywNfpwQqh9E+o7+MaBfwX8vR@lists.infradead.org
X-Gm-Message-State: AOJu0YxjSznAgGiBt0bAPTR8NxfZ6Yl7dAZdWv1v7gX2Sz83E5YxKXTX
	J+Efvn5xzSA9e30S1Bmb8EHap44sbMp/DOCxdxmoSVYzFhEde5ApYd1K
X-Gm-Gg: Acq92OHKYz+0FIK7z/8mX2qMZyHSi2LQ1gbuDzoDE8Kykk6H2GraC9PPy+jwj+UmqVK
	2sRALMEex64+SLRIp2oWUmwxtBt/EdhR2IOCZCFHr2Tl/6xwnWJ6vFm1qKK/qPEMnUPwW4x+45Z
	V8lFrSbqybYN+Z/vhxFSj98oK508P+GXP9GO/XN3KX+Wrjt3V4kHt94UIUeB1Q95lLxMhnY9b5R
	EFNh/wW6PqLZvD0Wo4PVbqkseUCGucM1u030E7vVr/RF2EyqSKUaPX3MiudPpkkmzmpG0KHaXkY
	gVj3Z1Z9uJRuiRbRQHjTJjafmKRTlsbSl3ro3hP78zdxeWOsdQ/obZ/VRRO7cc4A92jcSUVTYKG
	t83xnf5k96F3Zesb7wkGZDMB2+yW50+3RTrKrkotdtvf9rVzQXhW1TCn48DHBqKm+/vxb/KN5vL
	CR0bHoWm2yNFoMecYLSCMSQOK6T1Cii2WrUXJrMfD3bOfrppcnovb4D2U=
X-Received: by 2002:a05:600c:198c:b0:48a:58e1:6cf7 with SMTP id 5b1f17b1804b1-48e530bf915mr123256165e9.4.1778349503871;
        Sat, 09 May 2026 10:58:23 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454919c13c9sm13383017f8f.27.2026.05.09.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:58:23 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: daniel@thingy.jp
Cc: romain.perier@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] clk: mstar: msc313-mpll: fix one-element shadow array overrun
Date: Sat,  9 May 2026 15:42:54 +0500
Message-Id: <20260509104255.15479-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_105826_462080_18541D4F 
X-CRM114-Status: GOOD (  13.67  )
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

msc313_mpll_probe() defines

	#define NUMOUTPUTS (ARRAY_SIZE(output_dividers) + 1)

and uses NUMOUTPUTS for the clock provider's clk_hw count
(clk_data->num = NUMOUTPUTS) and writes that many entries:

	mpll->clk_data->hws[0]    = &mpll->clk_hw;        /* parent */
	for (i = 0; i < ARRAY_SIZE(output_dividers); i++) /* dividers */
		mpll->clk_data->hws[i + 1] = divhw;

So the function legitimately needs NUMOUTPUTS slots in the
flexible 'hws' array.  However the array is allocated for only
ARRAY_SIZE(output_dividers) (== NUMOUTPUTS - 1) slots:

	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
			ARRAY_SIZE(output_dividers)), GFP_KERNEL);

The last loop iteration therefore writes one element past the
allocation, and clk_data->num advertises a slot that does not
exist to of_clk_hw_onecell_get().

smatch flags the underflow:

  drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
  error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

Use NUMOUTPUTS in struct_size() so the allocation matches the
declared count and the loop's last write.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 61beb4e87..71bedb7e9 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -105,7 +105,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 		return PTR_ERR(mpll->loop_div_second);
 
 	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
-			ARRAY_SIZE(output_dividers)), GFP_KERNEL);
+			NUMOUTPUTS), GFP_KERNEL);
 	if (!mpll->clk_data)
 		return -ENOMEM;
 
-- 
2.43.0


