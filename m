Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B8CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLGSgDdl5g9MmO62+ZaKTd5URN0HQgATTN7adUAMeJ4=; b=zgwhulu5LxnQfYGuE/oWz65Hrz
	ac93VNX74V7eo93gThmyXaZ4Weq1QVpdgg3sqBbqm5dGVU2/ad/xww0Wsl37m/RTE86RSd+osOZ5I
	0gxU629DEGH8wpidoT1+IequG7qIf0S7gxTEUep9RKRXfFVuLDNHwWQOGZjKrlAoYEmU1G6QXEjRX
	fDqPkWkCAd1MtYPgV4QHIDJUU17FTl29oyZnTaA8l2rl+NlRvgr31arHzAmimtO0gw2XhsU9LCzFi
	w5boOAq3s9LjelEBlJPiMXKQXonHO7VjddE57rdCj7oL+qkFdSoYOuQ/YYUeXxJZKub+miJGIaA8A
	yi4oqVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfntN-00000004jjk-1sWI;
	Wed, 05 Feb 2025 22:29:09 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpj-00000004j2I-3P4B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:24 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4aff1c57377so165029137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794322; x=1739399122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLGSgDdl5g9MmO62+ZaKTd5URN0HQgATTN7adUAMeJ4=;
        b=apS5mKjUfBGyohmmdLOytL+KUoFun6SvdA+eNSOY6lSLtrTl7OdTmgjyaMZ7Fanuqs
         Cib2J9Lk8MARkglzWlCmv+YXhPlVqEgsLxVbFvDtBtD34wmJWHoiOwgD0ZryutifUbs+
         f5zWNQETbiFbKOg9NhDFNCvVcxrjJZCRXSGkTkcJlqprNq1KbezTewLOaPt5jhS5dV4j
         769yp0dG9IxRAy9Fg/Mlxu+suhWN44xRFeS1a+81NxWqN65YvfnBx9L+U8lOCmIXg9mJ
         jWzlmNO0V2VChWiX4lXy5sArlHOmSs05fEjO8VtEvKp7ulrkIVTGJ70vts998kw7KBl2
         q71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794322; x=1739399122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLGSgDdl5g9MmO62+ZaKTd5URN0HQgATTN7adUAMeJ4=;
        b=lbLOhBf76Avzxu9A9G+ISJwRmvEdKc08uDkMNF3Tkkty9ZkQRQXHJJaWGy0nRq1U/D
         IUKpqxjXqH2b04kI3oVIEVVnRxkEmaSwr4oe9JFX0YzbOmc39PlxyPYTlEub99mb9vnN
         UsIeBCZHlEdbt+DkVRRmVU29RFY2KB+MR3ZKa9ASrkBVM3Adv+Ll0zOK1UDZGlj6bIwD
         ZSmMo5oSu0i0HuWbVyyy5DRn/qITv6PbDpwEKlmmLwE/yt9iG1QRI9GwyJuQsa6ySLnW
         nN9iUE5wjje3IWOBehuPolVsoiefsaXd40yCo7R3dGlM5Lm2GZQIMtEb3R44OGIOd/tN
         vRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhOh9uTYEjnhGDI5gSYc98lZXmL1YXLYj35QoOOLyOdwp9057oa8hqE1i26jS+o/UZDkx3IVPdb7kHOdd+K6V1@lists.infradead.org
X-Gm-Message-State: AOJu0YyCntN2sNIvmXMt8ePg6XDYRu6aZXk+BRypaOl4Y6ukVVD4dbFU
	Yr9oB6+39tE+H6PWKdykwvDm2Jva1KaHCI7B60q9ESUOtfk3Rof1
X-Gm-Gg: ASbGncsby4P8g7aL/rNrPkvCsR8YuKoVI9NeSkmtLTk4Tci7cp7Y9u+/3S5njcTb5Wl
	aFE5/9MCyoFLEzOpTimaoKIs1slly0ZZushPKBz96XwndLEpwRP6no8eL2Ce82bs64jyk/bF9rh
	Sqyh8G+jbDWek1IxWQEIrLtHTn3X25TEQkXj6PtQKHJwWM4tFpHTDPcUbhaDVz20CASNQBTt8Rm
	QnW94jUZGOum0junk4cQRVkaK07unGjlfQIjdj7nqq87iEeY8JmeXWu5Rzlu0UHKGc11KH+tv6I
	GKj1l87phtbi3pADUbODlccKJOMjTboMIbvb1MOZNTHNQOy7Hr0w5ybHakeKZDoqZtKm82rmODa
	+aQ==
X-Google-Smtp-Source: AGHT+IE0tEZegMQHIWkk0mn6LCcU2W7qerUiRb0uNn6UQq7E/4NmKo29oH1zA0GoKMQe8I67Cz1aug==
X-Received: by 2002:a05:6102:82d2:b0:4b5:c302:37b3 with SMTP id ada2fe7eead31-4ba71f8cffcmr740160137.5.1738794322551;
        Wed, 05 Feb 2025 14:25:22 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:22 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/9] dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
Date: Wed,  5 Feb 2025 22:22:16 +0000
Message-Id: <20250205222223.613-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142523_846834_010B9E69 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Add samsung,exynos990-hsi2c dedicated compatible
for representing I2C of Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9e..b05d1e9e2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.47.1


