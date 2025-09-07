Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEDCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=; b=Jp3b4lPqA94lh2k6LXfr2iW+jD
	eKQahhdGqwJaVoCT52NuxrIqw3q+ewrgagEO0ioej6/o8rAJ2ywRKJOODnYanipCOX3yFNjwQKW/O
	LGcsJdC3ah3asN/kE+LwK9OfqXqhQFwpYOLKnOCCnrK/T8I4LerEOijoSrdKTGNKi0PqgaPVlTUTc
	33gne9uK39OSCVEMcBZ6limHtkC2aRIKbjtOxMEPHM8UNI8h+gvG66njPWoLg8QuZd6MCyUYE9uXy
	LAu+f+5EHwQpUi41goVKVfrgYYSlDkU5MVlaFiEC5zRFC7pLNi3FgBW3nqUcJj0t52qSQCynP+7Uj
	VHA1ahcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNon-0000000D8F1-04Tf;
	Sun, 07 Sep 2025 22:25:05 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdh-0000000D5fW-25yI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:38 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b340966720so24716611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283216; x=1757888016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=Mc75uMGxmx3saO0EtiaEHQJOfA4DR+hX0rOzLDPRH+lNV9jaj34NIrrDyQoQu3s2yP
         0KMZT0Id3ozCJzxi0ua2TQk4uBfrzpvtZ4W/2ekEIs7wXFExsoGUfExzzhZ+qt/VBu7V
         MAhXfkWVerXbLUgccc30QTWTAiUa3HH7nm81/hl8+VXRRC+HxYWtHxwqo4ZOipAePnKB
         oDCgY7M7RdqKNUZ0VqaAazrYJNU8DaSLke0f14fEjCI44BZo9wNcO4P/W4AUGFvyavXk
         ZcHYCCiFvOIkUSlnaI6iKXqp9AndFVMjLfwZVYw64RpRAINkEef4SyBr15ksHOX1GZS5
         kkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283216; x=1757888016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=iWR7sZI4INa6bRsNLqMqGIySGzRG6WJkC7+A5y5BII4oeMjGyljiP5NvGq8iCcv6Hl
         8dP2s3n5xzFU1FcN9P75PlynGxerLqEjaz0OGz+jJsxuJ/ubzfA7FoH8gdlGF8+pnl7r
         fV9IAQbYe5DO6Z11zymp1vSBFFRQ1bzcmtOrJb949Llcrj/cDRPWErrBS0piY4AQfZgO
         /7GBk0ePuikz9DKx7eZrRt2Uw2odN5/vlHFr+4vYPHY4mXsaTeNvL4c8ud6ewkovFxDl
         2x9xA4z0399TE1pihIiADEyi+qOrjKeBnfxz2qr9vzrwkZ8V+sECMrnNAOMPdIhR7TE4
         aKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwfALdfSv2l+4dvtvYj0ZxC2HJpGnbkTzZvRhJyIjuNm89nZ7Lvsz5jVrsUjA9mUNKWzwRplwG65AeRYPTsA+I@lists.infradead.org
X-Gm-Message-State: AOJu0YwXCU0r86Mnfm0AtDk5D88n0cwTPugqcZP3zmZMisiiMnEfwchZ
	7JowQS9GyFAARj1RGu3I18hNQbbmqc80mBoh/tEsmBHGPCUMj8dY7AZ9
X-Gm-Gg: ASbGncta+bh1MO1fM1SLpOx7IUa2jcxWx4hYXO11HkaHzimXzwpxylirCW/nj8tTbRf
	hPRib1+edUgSqvxIHw7ooDpxXh+jV33a/j6xECZe3ABxUqD0FzFVs58arUZim0940HIRHJ4ARJj
	QoG8fe7odG3eqNXaQdCBYb7yW+q2B4h/NM+jHGxLXnkwcSkAZ1BCYJUCozdctIHoejFHra/dLRS
	HGjAOA945WOTOjASKgQSwMBn5Lxx3Gi7uFtbQo37hbezunQX1AWYaO03FmXfggEQGjh/JrSQwTP
	+rBo9aJGS4nbUDbBTZq7QojsP42d2I2+W4Y6qkYlcUOiXj6+C/xguIWeGznVQgTAi3mXULH3ci/
	+poCT753VWr/HV1Jly9WVsQqrNp/n6Rh5xtycqwFx/w==
X-Google-Smtp-Source: AGHT+IGRmaKRtSfKfKpuR9f06lJAqo/i+CtuomFjPSttzNv9cDCiAGEffYRZ42ZrysUr7h4RmeZBNQ==
X-Received: by 2002:ac8:5d4c:0:b0:4b3:4c51:642e with SMTP id d75a77b69052e-4b5f834ce6emr59720921cf.3.1757283216310;
        Sun, 07 Sep 2025 15:13:36 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:34 +0000
Subject: [PATCH v2 3/8] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-3-58f41796d2d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=nH7LIMsuL+aarJrc1MqmQ0st3ivx8IadsZQGo7cUUUeZShshaLongk9s2eGBpGlfdZl8aoJJi
 sNuzoJNULipAM1Jrif/IvgHxTklPYWEamF5r1tQJh6jJcQ3L7nvA9No
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151337_532576_369D5659 
X-CRM114-Status: UNSURE (   9.63  )
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


