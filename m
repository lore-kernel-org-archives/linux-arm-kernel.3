Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B95CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=; b=2HyaYaaBlJYB4+geBSzPf365Ml
	RBTDENvm4MBxsd9YNJ5vz6xcMOjlwKFCXtcvJSge+DPR3tDcJxO9SmrzINMqW/C2rdvChdwOf4ssR
	Lk3v2kxRZSyzz1T/YxzC5ugMqX6ajEAxFFzL4XddQ0irgrI7MamrUJRW2vzZkECABymYLlUXWeOXV
	T7dV8p0rS//agvAbb0oUfRHhBpuPKMi1IuGOcDApxFb0LDXqv35L/n9CrHs9UgvSHYMpy5VvAZFTE
	grO7xue8eUmE34ujGOOSP3gw9x1j3tulzoH8yuwpkvU8bmUacVpA+Vvm1wxerwMQRiMMBXIGyvnfA
	fF6v51bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNIG-0000000D0eF-1yhu;
	Sun, 07 Sep 2025 21:51:28 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1c-0000000Cw2R-0X8F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:17 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-72374d6a6caso43263426d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280855; x=1757885655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=mXmivCAewVk+rG5Hh7FGVvZVyzLKMlQHmYOxwNBLN67vqk80iyY76F80SG20bbRCpA
         G4SDQzc9yE/cPAIS+wOYvYn9Oo8rS/bbZNQlFzlqQwcG5IQV9ikqh97z83yZqM7BVYTO
         Z3os71Zdc/JH1QmAD84Wrq335Iz+b8OvvIJHlDF97srqu7plPTZkKKCsNcjkURAcozt/
         NwO2Kwtf+L9iry1ICGpj8nFYDwj/K98kOx7GlZvfIk20qyYBfCW+xaCn2g8wBs+PSP2L
         lIOkJ8ZeqOHhtGknJgFpfOWwoeiMCPo70ZnWON6xg7cPo8qqocRG3WJsHtmMhqdlvlN5
         7dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280855; x=1757885655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqeQrJ185DBlW+wE5YbZzv/0chMQu7VeHkRXHAPzOgQ=;
        b=rVyiKqpKh7WBYWVRKPTyKW/c7Kxr5GVVeiPzwCRQLP89NIAdq0dNYHfGFm8GFkwy45
         MS/Tk1woWluqGrH5ZHV1liVagb1kCKpl9r2gV88TmHIO9FbrpmgBHQSXLPLe7dG92TIJ
         hIffhNIrC+SfUmH4Mj1GXpm/9pFt++fonu7hGSRkEfKH13J+agtVS8DTz2NAseNE2XEo
         JPzTp7kwaSJLuDGetbvZN22t00JT2Amxc8lT0DxyyCX1TK3JNARd1KoHpn6xAqOcnIe9
         LRt0DYd0fcvpveXteuVIY/5FMmX3Chrg4iPiHZuI87nrsdt+btHQYMjptBTHLCtmKv+m
         B4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXjJacrPyj8P/hMgOjNHUig1p+4IbXGR2JsOt/sxe8EDfXK6eKZAQem4dXI2Tz+k0lP1xMOVOJctkZk5v4U9Zw@lists.infradead.org
X-Gm-Message-State: AOJu0YwOyqOR95WOnAW21P7WV5uADsZaqR1VWSZ9eGniDv6UPCxVIHkK
	wT1pxBOwhFTQZXoEATwLC/bGiYJkSBccUE+qtnx6ti1wNUO3TAiK32hP
X-Gm-Gg: ASbGnctMLi8u0muM1AU71hR5X+j1h2Fn2Gf8TRDE7YwDNKpywx4ucoaISpgtmAmYMok
	LioBT4tOoQgiI0AeqyJtZ/2msFst+uZMx6LKtCqegVmORHJ63v1CpTtT/CpRvGh2AwOhTcWhFSS
	s6gY4/DnlBubkoDXozYux4+XXOdr1WaGCAFL7zDIiGwFD6emY+qxIPB/wxilEuM40iGApsVvGCT
	g4UiXZxPYP88yJqD/v37BwmKWzCKiBhOe3TFSSFRNZ7tdOdVBsn0yhCuQ41LhO7oygzsZhDMeoL
	obdX178Y6r5YyaHQ4IwmApdV0ZgkesiUB1rbbUuUuauC4kWXeifeDe92FwjheoGlstIRi3Ao6MQ
	UZkVA1nPQrTD7LisAC+z/fmCrnvudIcI=
X-Google-Smtp-Source: AGHT+IHXklgWFXby/bp65BLyGVcDZtpXh+u/zMKhn6dIPnXSmK7pvBMv9FBiAh8gjVD9MgRLg8Eohw==
X-Received: by 2002:ad4:5e8e:0:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-7391f30407fmr72791436d6.8.1757280854878;
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:01 +0000
Subject: [PATCH 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-5-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=829;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=hh+9fhqz1kD1dKfMIXYK4xNk4jet9TVO/6QTyzg1yh4=;
 b=1Kf8VB5nTLeupBLJfZNM0bhOTvUL+qq2/AmUVU/5EIihFYKCrUKKPoF/PlIxZPJVM5PtoFrzF
 1O8gkd8Oj6sBHzp7Dnm9TJoDgQB/zuBOuwb7Qko+1MBu8m4XvHXlQWZ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143416_170463_75ECA737 
X-CRM114-Status: UNSURE (   9.92  )
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


