Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A90D0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=; b=lYik6bNw8QHWtgxiO3h/UYXHAn
	0OPuUOzJsdSDZ97Wta6Ly59fSgsHuSWeafL79fNuCr7muZeXvUoiA7z3p4iZHJU9GoVz+GFXzBELD
	6YIShmVheR4vkqn7Hm/PWpXrQ7F8PWQSsNQXbwa1iCy/swxMPqgy0/heFTwJXTz9/lUl+1uW7JrxD
	kb/JH0SOO5lU9/bCbL/rQFZaurqFKo4Tz+imlwgFueqQGa8ykh99CLMN7b811+kmRUBy2dI6bYmdR
	FEuhM4Sqr4Qxbt81ZsaOE4/TtGpaCkaabgiHcwy/ohCPLH/XDIQ30bYVpKOMvRaP7N1Nya2S2G+Pw
	pyJOVVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ng7-00000007Dtb-2v7s;
	Sat, 26 Oct 2024 20:46:31 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nSw-00000007C95-2NEQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:32:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so3206887e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974773; x=1730579573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=XfEPRz8oMS/hYIJ7u2/5usV4S420Bl5sp/J2DsSsimsG0NO9W/dKC7UrLHU+JPbpmg
         o+FCGy02lOptMNz9gLYVI6QfxVuv6B2OQNFlfZvokZ2xPnn3q55a1pTM7HA4G9lw/MKz
         YZDVf7s3JBsnayXLe/MK9GKoCE+14IwxGmGANzMfUtXQP5nKLbQRDKY7ODmyN+7z+F/b
         m4h5ZKcopdzvU5pkZZgAyy55G7dtuRhiCbPuWPBrtMJ9diVHAeJUyVn2yXqE/Fb6fwTm
         B41+xiKgxc8Fnydr1Ipf/p7PwFQz29posq8+ifIJ1L2d33u6UCGdnR68PyGbgT0J/Rup
         /Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974773; x=1730579573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=cpVJI8R4Y6SA66Qkzn2LQRKxH5uy3ww7r/p1TuoIYkbyi8uiQS2p+asokHBJf/PoeY
         7kpKyIG2ecTYzwzzZEDvnDhtR+2TdCG9Do3IkkOAQqm/cFyMIHip/Nq3YyzW0fEm5I8F
         zmascozpVyAnVn/LFseP+jV9A3Bk+LZx5/hQKSyUjIGaZp94wxgsDK7xZ7FDtlJ3VV4L
         WaruzJ44gr0ve1Pxr5Jf9yyhVwNBOaHB8xmFvN8bptluJYKnuUnwAwKSrYRRF6HrCGwZ
         qfdxR+Ww+i6E3a846aNl2IY/hWGC6ge1SOD2n+OECoBJaVrVONpOG9d6YseB6I+6J7Kw
         c+oA==
X-Forwarded-Encrypted: i=1; AJvYcCXNkY7eYCHKL1/M+xRi0WtWHO2z2Ipe7UJZyqDc7MIGtEgttOd6mGsPHvv6KRTAUUr4gW/BCSTzbJEpJF689gIv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr0EDJXfTYwxXFd6Ci8bArCzZDOXk/haSIpcatIWqA0k3cl+ox
	6j38rvuKhlo+7RlN6n/9kj/zg0Fq0xa6CxSU5ah5aizyQvgAlPwG
X-Google-Smtp-Source: AGHT+IFLxbRdaCEjkbzhHVNrBiPqEaPx3e+Cav6SBYUMEISg8VJPQ5muiArk4TMAIABtjOOheplC7g==
X-Received: by 2002:a05:6512:b10:b0:53a:1b6:4624 with SMTP id 2adb3069b0e04-53b236a6986mr3415466e87.5.1729974772337;
        Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:32 +0300
Subject: [PATCH v3 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=977;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
 b=pEgrZ5Ow4GFlkux1RDET5/Od+ZRKUIB3LBVDU83F8TVAIUJCjWsnr2oMj3M/bUm5C0iUTkEDQ
 FLN5CFlwbJpCuWSERdsz8d0FR9f4Tb1A7Tmtw1Y8943Lrupob1xPM/+
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133254_643545_96A60D21 
X-CRM114-Status: UNSURE (   9.39  )
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

Add the compatible for Samsung Mongoose M3 CPU core to the schema.
Mongoose M3 (codenamed Meerkat) is the big core in Exynos9810 SoC,
designed by Samsung. It implements ARMv8.2-A ISA.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


