Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBDECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=; b=lQPE36+gkKXQBtoTcDDezzVYDk
	ANycC0v4vUmVMDkRjwNW1mKLMnKAQD/Us1MckJL4J9JDv7dRU90YNKtjOuEo4FDJGIH+HXodq4tzg
	BrME4HiRqoTcdBygRgsJybn6pcMDALvOlUAUKZ/KqAT/Izqv3isLhO89sfBcQPbGHbr7lwb1m9yaS
	p0Gf/yS9o1HIceJSfgDgvWvcmmr5isPQXgCQIoA1oMSUjGFFKCb7sYmbPGOPOe212ytbAZy9774a8
	Y27HN3TvoBDYrct7oO4bFXYHoMw0dz3OiUbT5o2ecmqaro4SqE/Nx55bXTNJBAIwhkuDKT9McUhhU
	B00QNe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKL-0000000Ekhd-1LTt;
	Wed, 17 Sep 2025 21:04:33 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKF-0000000EkcB-0yGe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:28 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-77623a63dc5so1641366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143066; x=1758747866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=OGvOc+ZuuRlzWe3vzuTqmQPDviyWPMOKvWaIhtcKeo/aZJIx8P2rY8w4mzurq7ujQM
         i0Qs9G9+BfDXFwwEDKSQJZA30nYPzC9PTL+vZHjy2PzUPlF7ox6fFGUDM2jsDxAdH+xh
         5tBAqYTr74vv9LM9pZ7MkqVbJ8ncbFfba2AqBujezIBD0wZtP/Mpf3ywv8icGZ6OkcdS
         FZicWaeOiyK4eF9ehG7eH9Bx2X3kan9sm/IDN9kza0TrIci9XAa4uaky7ypDkK2/M/k5
         qGm1yWPl0Vr9CuA7oUGQraAlxfCauWUSUw2aRmiMmrYP+60isOAXoWli95NqCfnGei9e
         zAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143066; x=1758747866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=jT08+X5h965k2po+R+3SSON1W9lfS0/ZbGc22Q4uoQYoFGqmPjg93zPoNJtUcxW96u
         pMhmZ0TRuRNKzWXpBlQ/z0unIoDgAFDNWrwcfiE8Ozuku6qgpnfcZayXIjx16HRpMLEr
         PLz1V2gHJGr3GjRaEjPbEfiAxPCLK+p5pqQ7jvzrWQ084m0FC8vhdEKnlnM9V6wIZa74
         F4zVZRfL7ZSiJ8X2l5WCa6wHUtJqCE5hTy0fSspp1qGpv34ibIxdwbttp6zKNZ20dgRE
         N0xjhR6+bbzU3mkcVdJV2wzQ5ivQCnZtlfvdEXtRySqY8syN3nrKMjZ7FlznR6jNKcf9
         5+vg==
X-Forwarded-Encrypted: i=1; AJvYcCWq79b2IwAGRv5zl3zG0SZczrlfEoPDz+pzbt7fBzXI4fsFJ7gy2Z3NpUQ5nvGnNbuc21UAknuFH/uQzKN5xAgb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2FzfTLFOY1y6SsVCzlouK3WqVCvqMA/ES4zu6pknjHLKn5b1s
	WbLNLWgKL0Lik6GVrHvDBZXo1TovxC2RtvUjhNlPE2SqFJy4gZ+2PWcU
X-Gm-Gg: ASbGncsw7Ap3C+74mLKI3AwN0c/9rSuPDVu3+UlUc7Nz/GmswV6VU9Nix3E3c0v1ZOl
	fE4GkZKJ57BGv4NCzlUQ2sgjAFIkk4Y/N9kzi5rF3SFun0QynT/+nGAvOXbWT9btvTBPbrjlvdp
	WAZAlVrErgG8g8M5N6otqYRM2ofMUPkmnsf53XwvDuXq7MAM+uaoyDzpDuCSUVUDjejjKCjFfA3
	dUkzCSOSndevoDdq/bNS1I6VTVxaFvHDUS3DnFdI2bsQoavp5fHhOOizE9h+aYXJar+WXOnzg9N
	TB57VUR8II2uKr1GTzKc82CNOoy6qwKtRqF8tmY3OcB2xI2qQWWNl2GUzt0BRybccCmPNE+9mIp
	J/RiOb3T0Xp1Yci0XCWZ2iS/s8NvMXqHSE99yY+dGpjt6M4klty/HUF4=
X-Google-Smtp-Source: AGHT+IFrkfpjfpj4V1IzxwzgKJOiCNq9/t9HIBwNE2UrLVBPq1G0Uq+ssai2vuM9RqyWADLBL3pR8A==
X-Received: by 2002:a05:6214:f6d:b0:76e:7c27:f040 with SMTP id 6a1803df08f44-78ecf20bc3cmr46716026d6.54.1758143065909;
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:23 +0000
Subject: [PATCH v3 3/7] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=YwGiTLaTBVm47v5bQ1r7SxkCTmRNrDBm0v+/xK7ZoG2m3QWbczPFTXoj63VvdUma7/FMZZavm
 PNX+CL7qfzgAUhzJGU6eQe3/hjmT/WCuBfEKA95LyjY8PVKIYEYFIUp
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140427_283774_FB639408 
X-CRM114-Status: UNSURE (   9.15  )
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

Add samsung,exynos990-usi compatible string to the
Universal Serial Interface (USI) bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index c694926e56ef991965153b94d704fd53addb5cbe..4a719cea81f9d3c3b5296ba2d45b05dd014a1d9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -39,6 +39,7 @@ properties:
               - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
+              - samsung,exynos990-usi
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi

-- 
2.50.1


