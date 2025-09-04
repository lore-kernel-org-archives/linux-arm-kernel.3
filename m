Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB9DCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=; b=SQ2L/FDfVHjbdvOyYfib1FU9yP
	7iVhwEF27YtfGxZH76em6OSfRMKTv/wlNfwlqjBMX+dC0WIATIg2ALkkIGSjsfCG3l4byMT5FyhvR
	twy4iA+HUHE3DXGVTobReeuVfgSprSkLf8YfUmsrZ+0zyqeq4NWiuDCD/E6xF5jkXaBePQAW6Hqb9
	zpfa0l9LatiVnUkAr/xq6UrsmRwVN59f21gq2lmABe/7nE1Se95vIlAVC3MwpAsKTw3T+BSNtzn9C
	G4MJ8Hw/Gm06v/QjI9lOfRAkOacBwvM3Y7nzU0DHh6HqHTG154EbEREazZAVBGAlDMUsJVz6huak2
	PehZilBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkr-0000000DbFw-30Fi;
	Thu, 04 Sep 2025 18:32:17 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAcO-0000000C5gS-2MIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:07:18 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-80bdff6d1e4so115083585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994835; x=1757599635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=EpDxdA1RqGdWNXubvJkB6lfSEhs4tR8CmoyAJNMLANPRqtYMAp6ur2p/dt3DVYbwWg
         fkBjO2zTDHyvMN7nWR1znAtCLrrw+cGclIofz0OX+rjC6G+ydN5N4ihzxGm2tMOwo04k
         BWAyArklhSXQ5BhZVTiD3Xb7ZgDGj4hQurHkj0GpEaSr0x3vCuAgYgysnScyMtXxF5aj
         Gqkr1A8cIpfEnL5ekuPNQPL2imDLoZMWWJrtPiTeIx+SSq+0fvmTakGjtU9BESc1DaKY
         SpNzBIGuDUUfzuBy+5L4ddVHYkkkl2bmDEgkpD4WDjAFn5QDZ4SSo8YSTSQacFHGfvDP
         QCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994835; x=1757599635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=j3akttHgsfqKIxStLKtKa43B7XuT7pJepGmHN63QJZYp4bIfjlN+LF1r9MNgMOY/VV
         Zsuv3aRdpZLFjyZ13jiZsbfmUKVm2bZ1WuPaaQDUPVvDZVBBdYJxO0Ro3Ce6a887obUC
         Nx3ROi3iAmU83kFywY/Al7J2Q6OtWk24WIQijod+IKtAgkCtR5IelbOFSMEFaNQPEHyo
         Ex1ser4w21FS/gIBardVJQfFmmmx4b2vrNX1qG7gsW4FixbQPRUjxzNbE9qJsuB6hXkz
         l9ag/c5KvfCPG/cYiEUIV8Uh5vKPgR3x0sijAQJHIW6YEuhKFDwm7KGIrwLXSLRp5eM1
         xjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkarsMe6MQMkichCAF3dPw1A8f38zEhwe6R/WJPcvcXUZWmErEGcQAOjDNbuoWpqBYngg5WtHhj8Pf6lfXjku3@lists.infradead.org
X-Gm-Message-State: AOJu0YwXwhEC7zZ+bBLWiE2YdAZI2azmx9elxMx0ndsGTZho5qj2Cik5
	/TRs/DkkCOaSIkT5icnYzUzVJUpA1OwRqiTpukJsh2KQGq32K+LmVBFj
X-Gm-Gg: ASbGncugDZsH6n/Q/md62v0V8ze+VNZvuuW2Bo6TipiY+Eay3dnYx5vRHYxP1d4yCOo
	Ueck7kbqAPd2BdpuhWwCq/BjW3OXqPWL1NsrPejMlVHvLslkM5hyv3McV9Du/hLbEJQgu2xX8nm
	jfaEk4Gb0KaivWCLHEPjhGIHjkhUFxAfO5GME1YKwUXu7BPS+CMOEiduP66xXxa4A+TY3maXsa1
	tYttj49t9S51iZ35lcBsWkmpfb0/4z26z909ah/3/hgIkt5H3i0YrK7ETvfANPM83K4GpN0STKL
	fMnOmI96wfYLZuu9ji94wNdk7RU32M8pTxXwrLv/0L4QIGnKcbYDVbS6LByI9iOOz3fcER2nDnF
	ObkFOcx1CPeBZhGqL/jMYR2llSi7qVINYg1ekoeE=
X-Google-Smtp-Source: AGHT+IHj35nSbwkhonpcsIE6LnuEcLEbvD6Lw/8IqKGueIuk/hqKTIJ8PXvUK8DGI6HGTm91Dro8QQ==
X-Received: by 2002:a05:620a:454b:b0:80a:fc34:564d with SMTP id af79cd13be357-80afc43a00fmr663708685a.6.1756994835256;
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:12 +0000
Subject: [PATCH v3 2/4] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-2-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=7guy/wYSjdLOmEb4qL76oQX2nEHkn1zfJulWnyHwyvGlhcf2LNzzk0/JqXTYbW0xuScmty1V0
 RuNXz3S20fRBrhSE0Brh1eYaONapvpw8QaRMo/OIfmiqJI+3ryo3vVy
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_070716_604006_7CEECCBC 
X-CRM114-Status: UNSURE (   9.56  )
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

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1


