Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A591C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=; b=l/aimv25N01G53ypg8bKvBqMH0
	pd6YAIMwWOLwfrRI+mCzGkgKSWxWPFqwAa9+GGXBOtUS2CYmnV5KI522spUSDJlFX5cHvSCUkLsiK
	dg3k3HZ0/Cg9AI045EWB49USIm7roekA+mtzw496YZ6hHnugqplkOIm509zXtgqLpv85z0WBJbYm0
	/95Fo/I3kegXfDiYsmjYirkWAyPKHCI/XHFGpvrGTVm3V0qKWeaNavMQt+yqxmy3Aqnpgahx5mzZ7
	ZJu1TcLvzR4n4mB5OLCdn6sIhSQaqC/kvCz2uxGRu4TcSegV8yyPcXsZ1XEpNqom7OwrDLL0ulSdV
	nGmdt3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WkD-0000000FmuW-2sgs;
	Sun, 06 Apr 2025 20:37:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WiO-0000000Fmhx-0IOH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:35:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39973c72e8cso402700f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971734; x=1744576534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
        b=GYbuoujM4n8qb8iA3MT+/H2N9hJO+KGIzDCsqLztp4RLVqq2ihNvYJoShi9pXKce2p
         303oKYy6qtEQolfs+4UAl4FYYBNSwoHlDiWO5efJzYsHkoFjCcNFSvXf+Qz/yGjw5+T/
         s6qM+GIGPKtNi4vvnKjCS4GG0NeuCDZjWFOnziDp3Le2grCC3/Se+UyTLV1o6HymIf52
         yjVEIfw5aOoAiyxA9kYyVqxi1mcMXmGDjarFeMgbWJrLfW7LbMWTQ9kx7bf62vIkGKhT
         IhRKeep0C782ZvQz1sOsWkjmHeyaSlR/Njam/PjqGoTxMnjyBc48m876nycH9m231PmA
         IzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971734; x=1744576534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
        b=QS6/N6K6xEI4UMiiG/MRLO1y/iSxFG/Y6Ng4Kc75NdM6ulowYMnrlJ6PdiuikxQihz
         4fuLZ7I8p+HpxOy84tH8DPY2lgkAOMf5HwRH+JPC6BjD5vw+yejywUbgkl1U3sC+lyT7
         KA/Xfu1tztec+q82t3VIeWZ3gY0qEZumDGOH0K+Lo4fdJlalk9PUTM8TwpxtxaXpvYXn
         956b2R+U5kL1lBh8CPM3jHM5XJR8dCX/OEK77MlPK2LdJnC/JckaVles3EaexIYkaP0G
         84ZfoXEyuuhzfFfduTOjGFrMHHXF/CBjO2Wn0negMMX+HtJ1owLkGKtqe0cCKvog2zh+
         Xotg==
X-Forwarded-Encrypted: i=1; AJvYcCU7AsfnNWLq/iCKyrNucQRjXlFkYBGCMxqgQpoBZQlBu54E+mdfNOsI4AQiCdehwgLzyt5s7HYUCp0+MG1eKnEo@lists.infradead.org
X-Gm-Message-State: AOJu0YzjGqFwKQx/wwTNOlf8JVhHSkeuiIufMCuwK2x9ENpOMpXddG8k
	2uawvJmWw0bZvrnS+Y0PtzqJ96Xm0LelCDkO3K1GjEJClkRT3QreV2DZHMzzxg4=
X-Gm-Gg: ASbGncs65cwuAsfX3jZfZTIgxCO8x6LXKLJpk4wCB17sy8+NaVvTgwr5u/fxUURREQh
	QdO4rkwZu06TgmRjFZArKNLeJ59cVwqY7tSoEmCqh7z+ml6FBd5i3FunaL0mmF+0sIVmw7CrpSm
	YBPvJptTFHAv+HzUO9MxZwwd3ecyRqICJK+7V55XLs5AkHtS1f5n8qNbHBtp3v95lSDIX6jYQWJ
	VPGEN4sfa7E8CX9lK7Q5P5pBADg1usBf5rEgrW08JyLnjTgAVZnN5agvoY6O6LRNg+s7QQIiM2G
	+tYFZwwHUvLT3EsToh81TGROZRhbtnpyZ0c7zdOc8jvjgXM7TmdqJA==
X-Google-Smtp-Source: AGHT+IGnWAB5N19dqxV+uf9H1b+D2cecFF/JdZzD4NafcpKENqOS32Y9IbVOYHktlCW19MYWLq1llQ==
X-Received: by 2002:a5d:5983:0:b0:391:277e:c400 with SMTP id ffacd0b85a97d-39cba93faf2mr3373054f8f.13.1743971734540;
        Sun, 06 Apr 2025 13:35:34 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:35:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:35:30 +0200
Message-ID: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133536_139022_661A4AFF 
X-CRM114-Status: GOOD (  11.97  )
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5ad..b356a272ff9a 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.45.2


