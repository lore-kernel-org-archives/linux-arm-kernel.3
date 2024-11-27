Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD24D609D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ela2PSfA/tyEVDL+lOFVH15DKBPE6OrGnsuqeliWc0=; b=cBdq/wr+9raGYWaBh+BSM7LGY1
	tPX3fOOU7Uv4UsLHd8Ke+ol3BmIW8o8SVc7oWyyrbM+Wqut1/uucJL/NumKnGZ/Yqa7cakgFMMehk
	7LLaBOwWryxYYQ3Ihck9OCXvRlYPIElirrom2t3GXYd9D58YVQcTTv6U8hEwM2Nq/gs6Zmn3RWX7S
	RKqA65GTyR1yJVDpUS4EyrB/ZKJ6pWUHOLGJmCNEML6nXhlaQ54SGYilPdpja1TCJk34hv6R244CG
	ihWWdGHYMwHiAQ0LW7735G3+YkoBnezOHBba9fFpLg2j+yugE3fsWWNgAOMi4+FcJcH7fQZxxPrk8
	iIgb03fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFr2-0000000CwlI-0pwZ;
	Wed, 27 Nov 2024 11:05:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkO-0000000CvDK-1mEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa53a971480so526246766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705095; x=1733309895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ela2PSfA/tyEVDL+lOFVH15DKBPE6OrGnsuqeliWc0=;
        b=ujd81bL6JTdy5OWn1xpJ5FiLkKLhUOcz/rTp8ZzsGC3MRdqJMb2Q4VA6hX8+zG+aG7
         p60zv7lfvtM6s2rvjyH8vsHMsJN73S2O0uijIvhGWx4W+G7JBu72u6XLoVS7oUzh+4It
         vvLuccdaMvEkgTcsDaQijEDyPv8ttDucnxOXbjtGvsDmhQDMAGCga2b2QveMgLp8M01k
         98DjN//RheNolSYp8p4J5RhN1Ld12F4o921h1HBLUdwC9KWsa6GqigE5OIafbk0eclJc
         fDSmaHT0vqd8At+DONwgC2uuc6YxB732BMSdDwsGUiEUE6j0+g8p7C/LEqZhZ97eRSZJ
         VPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705095; x=1733309895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ela2PSfA/tyEVDL+lOFVH15DKBPE6OrGnsuqeliWc0=;
        b=sb5rqpz1jcYo5izn7gXmbMnKO1KLatEaFCf54BsDEk1J8pZdLCWmIVxUSCT9u7Nvqr
         jnrlqyHZO4BPd+zv6Lp26qebZYhcuSZyS73KhVKboW0Gan+ZF4zPMl8zW8iIuYV6QVEd
         U2qkRJBwkw9XCcJgiyjvmnf08nJMfVyt7m5YRXPGJoifgtq5MtDH6CzMdYOIwIsWdNZZ
         rMvw4UgG52yfK5Nxa/VxRrn4zixoRkAaQ91K3jxb4KkBXcgTGGvxUhpyabDQq9DleXRo
         GsdNbXmmmrtE+QytTj+1zTT4Q8DUCSWF/7KNWGbYQpvaHnY+h9pJ02DjNPCDC7C2n0+U
         B34w==
X-Forwarded-Encrypted: i=1; AJvYcCVrkucVBgT3pVOxCGbrmtlKGK4R1Jbxm0+7qZFVUbnZlassLw8yhKHeTIOJzUpVoeP2VypZm7qAWj/11lLQPb9f@lists.infradead.org
X-Gm-Message-State: AOJu0YzKcsfd/1W2elkt6cGHg9ysnFj0IjzERNG6d6LnOQYSRDXuKwRI
	EO2cslpdfz1BDkbgL7CZMJTSIh9ZUinwa+Wabrm1R2/bN+vWF7GyewhJtreLjXY=
X-Gm-Gg: ASbGnctJ0ztKMYLg4oML9zU2SK+KT8Hb0XYtjhTvoPjroPQIukbp6jUMM7OI368zSMg
	CogHc/V9X4Y/r3zy0ra2wVEIJEB9o0IF3uIfrO1pYSmS6hTVlKoMEs/J/1/J+kPv5MqTD5JOB6h
	RxmOJbXcWuoQGFhpaLW/JXtv7UPmGFJ2Eq+hPL/UQADU0hPlB+RoOmDJjVGdwT9rEbbl7xUa8bl
	VUCzpds7F+glrafrBY89mq+IqXRFtH0j5zibEZ2hLEpJ17FSk1OTUAX2YL4k2blLXzmNpmGWUPg
	qWu44Kb5QZzJDXxx8LzbrFQG0oxniGdAyA==
X-Google-Smtp-Source: AGHT+IGGy57a01XH3UbpX0NsvNr8Tj73NtCtISVWPxqvv7KY3oEK4Rqy5+2NoX4k6+nU1RKiz62pMw==
X-Received: by 2002:a17:907:7da4:b0:aa5:43c4:da78 with SMTP id a640c23a62f3a-aa58108aaa2mr177836266b.51.1732705094719;
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:15 +0000
Subject: [PATCH 5/9] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025816_453969_92E6775F 
X-CRM114-Status: GOOD (  14.49  )
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

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog


