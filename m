Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49275CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFcZmTOFsZoMO9gy8wdBwLf5bhkHxxJ9J7LR6D0FEOU=; b=BtB0GebuPCkwR/n6d3SsMkM8Bg
	al6Qdk86hJJqVG6vkxbow7S939jouH1GyIwbBQZC8k/mD+awKjfmqc8XbsryGEqyM7558/brPKUID
	XNyZ0LAb7xpf4bek6PhA+M2qcWV/QoErt2vk+JIYWAop0UXeXJ+QczNfFyuLcW6ywQ0BfILaXmWpS
	+lalmT5tEPQHua8joHBTqk4j6fOperJ/bqooPoriAhzkupwUnGxjBK1uguXs5867w6iSX7exkn2KV
	R5eFqFVPKmSynh+ZVGbFAocN7E2wrJzpa8ooCK0tqB0wRq1Ud1KINNu72Gp/bWrc/9+MERnWB35V+
	0P3/+Thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1N-00000005wqp-30bF;
	Sun, 18 Oct 2026 14:37:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1J-00000005woe-3mUQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 14:37:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48df4f540ebso618239f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334272; x=1792939072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFcZmTOFsZoMO9gy8wdBwLf5bhkHxxJ9J7LR6D0FEOU=;
        b=RI4q7LfD1fdxSUkH6KexHlhHZZzPM++o0gwkWPhjn+GxcOsJHNH4EKh9DRNgljdV/q
         IZH9ao+s5bmAz7t4hNkUjSEE6Ldrh61uC9HY4xGUez/mtzdIe4u8FMyYSnqt0Yh2XH5G
         zXxx4hYHvau0/KxOlkRNE2TZPHKj3EPwZsLLdbueUKXYINUoJCSlNszDERXm98WxlDQn
         UEezA26+LmNDKkHMu/uPTrIorofCRL/3VFoMTEaGtBWoYwTOzWq7te9hwPvwlotyHfGD
         Xeaoqwd3gCSI3JY5JfKHLr3KjdlfZO9nsIPqWkbOs1EoM0tcKUNYk2U6gYRHOllxHi4A
         nMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334272; x=1792939072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFcZmTOFsZoMO9gy8wdBwLf5bhkHxxJ9J7LR6D0FEOU=;
        b=pB/JgwLXMKYxLfT6FEa9/S9BbtG5f4Y21yQh3iw5fH2Td4a/Fjt+eii/7Mqge39zqD
         6GHgysOUUVYfmSW6V+1nXdzWuuPLNtMxQgujcDyU2y+zICsS6dafFjcvdVKW7wEVCOJQ
         avml3OlXYintfBWzNHXO5rG/d6FK50achZg4tS4o9ocyn8+CAcmVKiSaDPEjjWmDienK
         L6hj9yDPzcnRcEcltib4tArYYi9VULZjOeRq9IT6+FhL6RNUtGG0coyvv6xxjj/lIqgq
         ugqw9bjtzuqy32TC6Y8DDIQK0XOvqsW7fDNJKc+R4pBpXu9dxb9d+RYVJzG2P/xY1wub
         5SVw==
X-Forwarded-Encrypted: i=1; AKwUvBwSkITVuXl/Y5i6UHtYPE/wzXfIJUF+lMN9izHxfXSsEjjFxAenrwVmt3JPA9wGD4hxbCc9ZamFmQkn9y384JBA@lists.infradead.org
X-Gm-Message-State: AFq9FYLqNLyIiLa+57mifTqvGNjKeDS1ccqHHgDL9umI/gFGrdahkT1l
	B3K+tqsIZhurr9vMkgHAxLiYyfSe1P2+jTt9+eWmIV1Qu6uJ5VslKAKM
X-Gm-Gg: AYBFou3Vc5DVx2fo0sds1/w79PBN8M/04uyn6xqwu9JlfQRsusALvVnenonI2vYCnpI
	41xCrMLdguZpU+79KY5ojeAxT6Ou+/aIUBjnfB44mW4vUoKCBZSrV59wYupLaW60hJnwGnrMCPT
	jTL5muQsirdkydmt//DZBcD3zlYQVZdAUHaBMaRhBDMR3/DWHkrEi472HmC7bkvno+dO5K7f/3H
	CqvZrMwLNEn72C0kwPSK56WnQ3pvgziQCMdSLk4oR8TnvLxGJbr819p6KOL+v3AL6ql/vRPpxRD
	pDmYJBaWqBZSIjcf9PRvKibyyNZJuSb7Q49axx9aHgESleWWne4MQUWfhruSu0TI6EonHIFcmcp
	glKGB6lBdSqJUd8KZSDQ8R2EKJMZgHO8uTEHtrrHFyFwh2PnAwKzKkQ1M4EPFPZkLwILyddxbM9
	RqGXE+/PdBjiY+VBtarb7AAh7nMr8NQRppsDUhZJbqA4B9WGbdd/ffy/JFf+mGrLWjTjKfMvGwX
	cYVt5cZWRUwMQANpi8hVmAi+3CfOFOrIQe93RujmmNvNg==
X-Received: by 2002:a05:6000:3c9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e08017195mr8926508f8f.13.1792334271780;
        Sun, 18 Oct 2026 07:37:51 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:51 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 16:37:10 +0200
Message-ID: <20261018143712.1040152-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018143712.1040152-1-sander.speetjens@gmail.com>
References: <20261018143712.1040152-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_073753_977306_B9511D99 
X-CRM114-Status: GOOD (  10.44  )
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

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V11 -> V12: No changes

V11: https://lore.kernel.org/linux-rtc/20261014083016.332338-1-sander.speetjens@gmail.com

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0


