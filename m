Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A66CCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=; b=0qAr9EGGVnBsbLQsxveE+SAX1t
	GL5jqDZD5Ljp+TX2ExdsPNjYl+aLYrTQmvnxG2mAUtMohPTYVOGKdC5GnEtJ3Cf94J3z5fkmY1Y+z
	U4yyNnr9uybzOtCayYMeh3kkNh5c8YUKmoppdQndF+qXJACLUWFZYbgC//dhuzuuECTE4uHKmBHBW
	YnvltIJQNP/grw7gy6vsJFPv35oIPCai+ZhD9sZsPRU2dj4uOqQhFWmz59gKRvgl6Pp0glIBs6A3G
	q0vzN0f6pAwGjLZmmGSGMvnHGwQjj/8Yptx5YnwyGchsWsDKZcRcy5ZjRzZknmPFIr0BLQkGmSaFd
	uoGTkR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQGA-00000005rrt-1Ej4;
	Sun, 18 Oct 2026 12:45:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQG8-00000005rqP-0Q8a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:45:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so12731275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327502; x=1792932302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=sU9/g2jx8THvZYfBrGnTUxVoDBZm4gNk61jL5FEUrqpJ8/4GYe9W6K40MX293t/bSw
         0aBIAKgxhvUZYqH16zCFF7PFLMJ8uOhUFp8KSo0StkLNvyLZrZ6pudLAmb7TDOk0jWHt
         hJU6ghBV3Z6gmV74HL8IP1D6DGaLYrvVHjopY1qEPjz5QDKgtTuikEZ3C0aK+dGKzxjA
         K1905Wp54GIPnkGtXKckyZMMObJtB/cmkpF1zUg+3HjgjEeYs3SuEQPofcP9VCmLS6jE
         SDy+RJt6P6Q/mF8OtrMRpOQEF47N9y2rNr0EBEwgQVVFHHBtze/Mb8FuMPRrFLqhqYpE
         ch+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327502; x=1792932302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=bFRMWUl2UqeiETeDHqZMqJL9xcPc9rAZiz1p+72+UQZFiOd1/rrkjChYJw1+T1RF98
         XgI8w4nb4JWEiZYGeygggYep3jQH6b8EiLsIGR9FFFNyXGt8XEnKjtCiKi0vOOD+J5eT
         W2Jf6NzxKqOHL703QkWwkY0qXZOnnQeGdK08EYT5EDPzTSSg+uANbooqaYF0PPU2zM4Z
         wFb/kS+Ws4Sd+i9zvZR5QsIIcMPqjBezC2VMeE9+3P7L5ASBuw158N5tPnYLQwrXNsbH
         jCAmksiSzSE6IhMDiiLJatBwTN0rBAE0u5oUZAwhjsGtOY+SRdlCHsL02dpXOgL7Xd4H
         KMtQ==
X-Forwarded-Encrypted: i=1; AKwUvByz8Rl1Vb0sXqH4SCbQfSv7m5NjEjFA6qu2vjMI/zspq13wGypsbhdPhL6ZyOPUqNn6sUDPMkhdMo6s/bAjrbNr@lists.infradead.org
X-Gm-Message-State: AFq9FYLcgHyA13XaVotZ8EgsXsduwJGCZLmJbZQnsAtdaDZJ8EqTPvIr
	9GkUkrOQBL7cIAp45feEXA5ypeTu8CC5D4MuxmY9ytqi+OaPaPv9rla4
X-Gm-Gg: AYBFou2qYqgu4EfVKZhhi/ilIuyQTCPxb9QFpGcBmwE32u8BtDJt/0tPc8D6i2lME0N
	Vi0Q+4Uno+wQDKouFf3VAuafjVKn92rn/FmjqOXphZs/ao+LQYG7YRqHnA/ZhewPo9q/ZSr63/h
	V/7tPE5dSeDO37Em+YcGPIOES/Oz44iru4aqbJ8d/+S0iImBaejiamvpzTgIebLPD8C9G9dtR6u
	BrNy6WwXNeuym1HfqxoifDX23K+4Mq0il3DYyW3axo3jpokjjkzo2w1l/Ks5jM4U6hiL7T/P1J/
	ZHykqPVVtoEOV4U7185UflF1RFwkegX18AP2Z0TtKZn9vW2hTdwq8WsVUYeuuzUy9M0/xv5guv3
	E6oxC8S6kq3T6dBqR5/AHg/lM8HvxDUjGq+ycuHjT3GLJEd4dBFCttZ0XmPQWYkVZiP6hNTXeOS
	BaIchMvYo4Au6oBMKUwcUUa+XHiMLOJEPUN3CmWJA6+hemCag5tSqv45jpY2z4kOfU2njQgxpg3
	Sstruz2Ub9fn5sOkyRvJThKI6wKWDAkGLjdqvk8Ez8GRvmenBMzrSIsqLrAOZ9SJ9lJsFaghmvJ
	sBlFoT9+n0LS7z0PXIM4k1EkFStlhNSYAcnIFFC6fUG5pbmP/K3sOt3YSHwH3CuvCykFU3+95Wr
	uqybR10lDyhHuxxS8XOBJs40=
X-Received: by 2002:a05:600c:848d:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1e722a360mr3167745e9.30.1792327502114;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:58 +0200
Message-ID: <20261018124459.3026-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_054504_158503_694CCC0E 
X-CRM114-Status: UNSURE (   9.94  )
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

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)


