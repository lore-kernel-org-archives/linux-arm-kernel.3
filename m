Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB4EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGvZ+f1Zyma1bBzTOIhQdIYYMP/e8EzANI82dsN3dLw=; b=sVo3CNVYiZSdVp4t9dn6/ZxeMu
	abgAqzdBtadrVrt/iERiFsyhXI3U/ni/bCqEgsymqJ0x4WfNHBj/TiGDQ5HxaDT7VYesn3eF1OTpe
	bqwAg5NlAB0ClCqmltmPaI9tDHgRlOFNp2ugkPnPZAHbmJfNaSkcT2nSWCshvXbWxER6Po9O76iOV
	sj2owXhCOekUoy+WNT1G9qpJdNvdB8j6ZpZJpgd/cZzTyqeD0HjN6lMn9yxI+oG4SjboctXTDJ7AX
	wxz5m8BSs1cana+cT/Qb7L6TS88XRrCnwYEPOFZ/Mb0yjAiedVCxp/cI07crlfoRlbwa6ZXW+zyzN
	5aie1GIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoW3-0000000BHBe-35TA;
	Thu, 09 Jan 2025 09:07:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoSS-0000000BGJ8-24YT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:04:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4363ae65100so7337145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413443; x=1737018243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGvZ+f1Zyma1bBzTOIhQdIYYMP/e8EzANI82dsN3dLw=;
        b=R6C7RImXOWDyZFz5ycsD0RywmWBzNu/t4lrYbaMURSA9WElQRsvrQbgY/SEzD3a6uE
         oEPyjVw+H+GDDn8+iMinQsfKvkzrTbk1s1KyFUcPYsN5t5G4Ha4aUsiIA3PIe8jsFkpg
         aM4HjM+q0uPJEVjczn4reQUep//P1LbB/RSy+kddfzjdHUv/lV++27RT7hf8+t4/pGLB
         QQcjDfo6sdHB0PcPCQ6ItzjM05RyDdQNY4YA97EHGfM3mr9t0SlQGE60AP81iLTtbfNP
         Z4W5qmUjrJfFY+5QxRzz1vHrwTJTkmQ0r6Ycg61hUcOLHJINrshly7oE4hmXHwFaWs7Y
         ub0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413443; x=1737018243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGvZ+f1Zyma1bBzTOIhQdIYYMP/e8EzANI82dsN3dLw=;
        b=ldH7NVF59aeAtT1p/axileSjud1je9qn6UMxDPW7T/QdQd5FGrG9B5BKz9d7D5Uieo
         tyARFeCD7TNMver/Hht0JAVH1NleXlxUJT99vm06WtInfHHPPpnRajE72n2hfLOv7twp
         ZlS3erlvU00XMtP+9FuMnB2e35un6ZqTcCgyEwWvjquXiNuyQ5SYQYycre56w/AJ6hCk
         avCxx5BDa2bj3qNRCBb79qLWQ65cbmpsX8UtnDe1L3BXjSLGx9wWGxJyUgieV5r+2bMw
         +kanoVGoX0rrU1lKsJQP3X/BIF3ClyIrj5likQwpeOPerhc4wYlHK9Wq8mqNsMKjA6r9
         VQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXKee7q73SK0sUw+irPFLNaVrpO3mvqKGYWPdePr1bnhDN8DQ97Gp72zuUufixaE22x5wbfqWPqWwEPlRbEVeIo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ImywmqeZA/OaWAfF31ld3AO3DxSa2m6yuoJD2UsYBIlmvMmo
	9IXF5GRe4q0IZGc9w8gkbKDeT01WggHElmbpDYy8uRoegIVkfu9J
X-Gm-Gg: ASbGncu/nHVJE8MlOXMCYFCodoyzWGJnygOLEaN2svMCAyH8+XV+UMJReYWou9od6Be
	kYJGroTq6YwSV/vl5gerqjvSe/BBd6ImiThfQpxohrP+0JLsQ4pysutvlQ2duPALUsF+SPE0fAk
	hFJLDo/tmvDH7t7GwfQe25Gca3NftclYVCHZkAlNRgd5/bWtGo43RSz+ZUjadRdmsk1rfyC7QOQ
	He2ypP/XuXCge/5hrgECvqjhMbAK+jg43Hvxoa6IiDzLMBg2aZS9dDKlqOMSijz+U8H0AWmZIt6
	F7iF8/N9oI0RCWswUOM=
X-Google-Smtp-Source: AGHT+IG+S1p+g9llpREUzQnFzEQznCPzgiIz8QVHak3a3fJsQBKY3XpKOsmNBaUFThwuDVvhWCgyDg==
X-Received: by 2002:adf:9796:0:b0:38a:88f8:aabb with SMTP id ffacd0b85a97d-38a88f8acdbmr3467553f8f.55.1736413442625;
        Thu, 09 Jan 2025 01:04:02 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:01 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring the ip
Date: Thu,  9 Jan 2025 11:03:23 +0200
Message-ID: <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010404_530316_5DE59DE8 
X-CRM114-Status: GOOD (  12.98  )
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

Add a devm_add_action_or_reset() routine for unconfiguring the USI IP
block whenever the device gets removed.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..4b84f481b 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -174,6 +174,23 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	return 0;
 }
 
+static void exynos_usi_unconfigure(void *data)
+{
+	struct exynos_usi *usi = data;
+	u32 val;
+
+	/* Make sure that we've stopped providing the clock to USI IP */
+	val = readl(usi->regs + USI_OPTION);
+	val &= ~USI_OPTION_CLKREQ_ON;
+	val |= ~USI_OPTION_CLKSTOP_ON;
+	writel(val, usi->regs + USI_OPTION);
+
+	/* Set USI block state to reset */
+	val = readl(usi->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+}
+
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 {
 	int ret;
@@ -251,6 +268,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
 			return PTR_ERR(usi->regs);
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
+	if (ret)
+		return ret;
+
 	ret = exynos_usi_configure(usi);
 	if (ret)
 		return ret;
-- 
2.43.0


