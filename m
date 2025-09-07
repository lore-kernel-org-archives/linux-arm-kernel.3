Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0141CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=; b=y7j8/0Ijj3VocWn2ZC3TeswXXu
	GJRlGs6ks5H3/K5CyRkUcmJgSXU3EWCQG02KKBcKkD4F4cGk4b0SEEMVFA3fyhyvHfdVkmutQ28s4
	Z2Z6peISp9WS/vae/HEht3HZ115ChXZxJU8wBlxlKRFvfcWm/MOZVq7Ia25ZD4hJsL5NaxQj05M9Q
	8gN/Cl1dpAeXlxFKTdTqmOb60R37cqeNvfk+VnunWKpGykFj9cq4uSGOhnUdkfAnPDCguTmpcmb+O
	ieckwATPYJgufDUwU7n3xmSmvBb1S29coI368Uc22hoNd1Atqm6QXo8rdsD60t32CzN1Cd65n+LXC
	4CoHT7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNuM-0000000D9al-2pxe;
	Sun, 07 Sep 2025 22:30:50 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdi-0000000D5fz-45gT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4b60144fc74so11579081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283218; x=1757888018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=LDK1thbezps8sb8l4zJyppHdpa0aZVsIn65pzuuv0YYaL4W1rBRhrIf5YvEiU5YF1j
         PabnbJbXFOD8ZUv0m2LD948OxQvJ7KA8FnbJhRMviaUytVpir/NhRrR5YFgekJ3hn6a4
         I67krURT+TD2s107nT+gEzhNIebs+U11dX1iyStSAEuJO9HUB0gOHeLjAIFs1bvMi2Uo
         O4ipyV0uI8a1hgMJ1vr85GAew5HRGBAt2FRk/F3G2ZOJI6RvdENEEhahjFNp3SfV6CNa
         YQ6jJpwzJjhtHkD5raMXe4xjWmUIpMuCS/HqxASBn/ZBUkVAg6vvizoMn27AznkCBDw5
         xxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283218; x=1757888018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=pPf0XkQ7QlmOQHWxLaWtmuKMi18mJvtf1oniNsV6dxzzSQ23/n9LHWCd9HWwKgGTmN
         dxYsggvXn/53xL+lh4Za/kBFZ0xzVaRdzTII7pg3RPmPRtGl/yAmv222FB5ZpJcA/XHQ
         yq5KFWdFh1wkwWozULuNsoCU2gD9Cu1qa086eNCwgCmM8x9c5kBQUceLcJM5d9yo+f9G
         SfSS3n2YBCEoMlRKBz4oqgmwd1K5HJ2mSuKb+5DAls3biGumKDM39zZatSuY1qR/UYza
         GOsGarxPtBJxMj3Pe1E8Di0HaOBSmvejry/NcdqGRwv9AWy13aR3iuGYJ81kQCfhFJKg
         ykBA==
X-Forwarded-Encrypted: i=1; AJvYcCUXAA7gmEbau9UslRGDqPpxpByfhexpSf+ufEp/KR2eqLfTF4/NsuPuQLhmRC/86tMtPiWQhUmtIWIZ1w09xVDP@lists.infradead.org
X-Gm-Message-State: AOJu0YwI0xsN9N5/PZODA69BcbyqwQnC/nE52O8tL8mIg9yEkqVA5kgu
	ZfFcczgs9M76+EH1QJrWO5LF6xgT/8LHL3tx5ZDMgITnn1JE//qV1rNx
X-Gm-Gg: ASbGncsu3ecyCUtquOvRWc5/caiwJWns2i4ZG94ADfd+v+xfEEU8WEgk1EpnOgOi/7J
	GjFYY2VPT+1zkcDnK2eUjaw/N/upULUPwtekIYfPAcza6Dwr3BJXN+3Ya3XbXNiyyYINp+ri9lg
	AT9iq1WZALVeVmc0pzputfgavOjSxTtvew6Tur3iT6L3J/oERzzwAuNUl9hnq1KrHqL4CHOKSYk
	erq8zwZXMSCzbUnGPD6vPHRXLMik558H0XcWg6dmtf+kNngTUrYurDDodRFxOkx5fijThiHwfQ7
	Uvxv7JmXMngHOkN0DBeONdWOudNcBYQG6B561b3ucjxquJkpcEcFE8GrZDoJ+PpfwcJT4rWQHS+
	EfxdLYm9rtHRb7c5Ur1GWE51GcPfIJi8=
X-Google-Smtp-Source: AGHT+IGZaBH4TwcPqZtnw82BMwVdYyuU2qWLCQACmyOWTpIF+b25kmP9e4ZbPYHeEXievv97JTeJDA==
X-Received: by 2002:a05:622a:4106:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b5f8448a5emr51473771cf.3.1757283217877;
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:36 +0000
Subject: [PATCH v2 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=829;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
 b=66Ak9qnbiUmCDBf7LbfLilcqOdTExwdXAPkCin9xNY7bmRoXIxXnM00VaPZBvbcKbZjmQgK8U
 ph8Ir8hdIwmCo1XNNBe70qWyt3hGa6jp9C6PyNt/DTkX8gALhcNygB7
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151339_010820_92E9DA23 
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

Add samsung,exynos990-uart compatible string to the Samsung UART bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d536491007c7a87b24a6efd4ec3bc0ec7..369eaa9054908f7e1b63bba2e83be612d22f0718 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7870-uart
+              - samsung,exynos990-uart
           - const: samsung,exynos8895-uart
 
   reg:

-- 
2.50.1


