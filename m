Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE94CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxv0MqB/ujP6vHvTc2WwDI6QNrDWWZGMfkdvAnlFnuQ=; b=gnqB7qeuTSz9HKaz59wT+p88/C
	w65K2djC7nsln7AjDTfhsIUqthCgFFrZfM1rkeX6awcGjdBbrAnk0nvdGLdhYwrUxpoGhTVHXTVtY
	PP/lntOEQzDh0FpIrNw1/TulSG1pnpqocrXWwsT3Z4/PwKK80cEbGllv4u5rzA29fn/qhGwBTVZnX
	Wcr1W1hKMGNePys3D/LUfG10cz0HXExdYwzMGryecJVsqwNLLgy3Ch8oDxNoTtvsn6+VjeiSTf2Ak
	ZhpBUwT4V6rgYWO7s2z07GPD1UdSSBo9sZyaTK3lJN5urR8e9OZFPGv4KXzHFGeou0JV2tUKCvY0z
	fCfkIi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLjo-00000007x3N-3tOm;
	Sat, 30 Aug 2025 13:35:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLaw-00000007w2l-25ds
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:26:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afe7f9fdb96so38836366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756560373; x=1757165173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jxv0MqB/ujP6vHvTc2WwDI6QNrDWWZGMfkdvAnlFnuQ=;
        b=nePD3RqL/xxoUr/m6F5YxoMBNzQEgI5h+ClpU1iHJ/gHnxi4/Vsr7xB4EW9cj3KcVj
         l/025m6JI5V/RW903b47z/bb1MgMpuzKFnn0qf0nGkR+UHhhpzXSDR9I3NM5/bU3cQqa
         L4poiN0ZnPP8DTLlU2OPHljifs2lKqPMfX45i3HSsy0zRIycZzyPwoh6WS0hjGmxOJOb
         SWGicRufmGjRgiDNv/SxNvfYeySmXZ+nKy8SJDhx+Ki0I2o2sDzRcxUEBp82ItUP49S4
         khbay8jxdiWGqiiAmS8SScQ73rYx/XUa2HT1AmOQvYwZGGBbc+5WHTvmdMnrLi8BxjDN
         AJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756560373; x=1757165173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxv0MqB/ujP6vHvTc2WwDI6QNrDWWZGMfkdvAnlFnuQ=;
        b=FUWrUYLGfa3QXdWLXFUBm18ONozzKr4DOMu82C6VnRv4lFSwn7uXK400L0h8TajloH
         I68CUsQch20wioEYrLmXp44rXNEPog6I7Tyt2AnSf0iH0DvV2/DXv1rt3Db16nqGSNdU
         aS+/ug1j9dKUJ+dIEOZqSCITMSPGROBKJ8LFu/bWkdOUWRA1jfJGot1eSUSk93VwA3qu
         twvtIWBb8ZYCWq+4QgR5ldofpoMMAc+scnf0fn5/r9SYajYREKN07s9YxM+m9mkDgChz
         cr2fmCd5I1xq0B+VYv9nFoSYBq8ldL3YTxzBha/3/Y4bUgJaxsb7SlitC+BSBwOMoPuA
         bigQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1JWbYz3GLSW86zL+Z5eQ8TiZCMIF6IVHsU5s3PsxeEkO2H5hH7i8k2wKvvJbqhcf0kbiLcd06i9iGFe7cADMb@lists.infradead.org
X-Gm-Message-State: AOJu0YziBK5t3y3x8T2oy5XTCbJNvsrvsSsUySES/2oPFzNSoB7FicNb
	qCQ2/dxGmLARLQDORBYhsGtQR/kICyCSzxm3JoKXEusxGnMBWqbOAGGWdQBqnCkQ08g=
X-Gm-Gg: ASbGncv2T84WQZIST7VykXnA5z8Wk93j+lohUVEEAI96riq/csRn6nHqE7F705nySbb
	8NJFLT6LWg1DOnpsU5b5990og3+DOwLqw73MK1fGROWoLyQKfaDTsq1jfx8/hQ6tfjf2us2piG4
	Rp3qTWmzKoZ3feHndJxUzJIzsncB+Cae1wWB/DFEko2OXrA3CdeQ0PtyJn8Dptw+ZBmYZmMU/Zz
	zCmFCaQ2oNJEZrr5KBj48vk27lQAgADX+lGMJsozFe8IQwyZPywNUlEYjCijfOOADbdT0etqu5a
	aiDBNZB68Rat+q6SAyPIXGQitAtLES6dEi7/O+3t9bzeJVMED4twD16QTSHPcAVFNYQ3sYBXgQU
	gBi/QiBU/AU5PBAL0egiDgZHmNTzNhLQ1IRrumtoZCVL8
X-Google-Smtp-Source: AGHT+IEZpDjBctuWqYNRlyG55Wa6Z7JlU2nXfaTVYBNjCJjgFc8SZE+7HVHp1fu8CNukponM0TaUCg==
X-Received: by 2002:a05:6402:2110:b0:61c:7c3e:f7e8 with SMTP id 4fb4d7f45d1cf-61d0d2a9310mr2165499a12.2.1756560372888;
        Sat, 30 Aug 2025 06:26:12 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff3dd9574fsm225212366b.84.2025.08.30.06.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:26:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] spi: dt-bindings: samsung: Drop S3C2443
Date: Sat, 30 Aug 2025 15:26:07 +0200
Message-ID: <20250830132605.311115-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
References: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=qwG4c4Xd+B3YoR0uF7y8E1dHfmZd2XS7G30El+hHeyw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvvuWOMibAY+sCtkr0eJY9VfamQvRG859Wy96
 p5TeNtYiMOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL77gAKCRDBN2bmhouD
 1xXUD/9qOZnQ376tzF5lwUEClQkuLBudqcuNOfdDxwqUDHTvhTcOAWvj2LAGTmF9dF3g1gaNxWt
 ABBXRcxT0uLEoGRNlwKDKAQ7VJ5jUAcckldLBROWWIOPCehaoLHXK/c2rgQKUh8KLyNdGOCK7CL
 ebnU5WbX8ihfVb9s9hbyaQxyLEs0KfONYlJkkdOf4Ui3n1/k1sPqAAucyy0YpiFM9//NaNmXXFu
 rNk5FvCoUTHSeeqGnpzUNc/f9GOZ8YAFoggrq/iHgZs+EIsBLvqwoR0c+x/TL0E8DI6cCu6zNJK
 tCNPtD5Zf2PCpCr26GurjsYx45fg4Gc6FAZo0DZvNDzYV1BtNkvdELIAUZP6UPGFg8bto1AOlqi
 P5CBHIp3cQ/GQfm9+jrmwQAGJ2DFl/eFBD5f6uWB6PkWQlup70I6z8pcbDhnChjj9mUYJ6Hj1yD
 qLzs1EVfH2AuYHR767ZQZaHUtV05/HkftI1Vf9h9xVi1tmOOFSMgNQaAnnbYKOi9dF55Tg7nl5E
 B6LRtTB+RGr5fh3Tf7o1uIIOK3LQ/LtXhuV3mD85MgoJp4TACcr1+BMtzyQfYkKZTIpw4Kd4O7d
 2fMfvxUSE25mvLYJ86YpePN0AOEx1vsA8n1MqUe0KoURjZrrdqvpSS0zxG4RR/U+wgJerDV+G/B W8W9Wd5GXVLh14w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_062614_537257_BED2F06B 
X-CRM114-Status: GOOD (  10.66  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index fe298d47b1a9..1ce8b2770a4a 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -18,7 +18,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-spi
-          - samsung,s3c2443-spi # for S3C2443, S3C2416 and S3C2450
           - samsung,s3c6410-spi
           - samsung,s5pv210-spi # for S5PV210 and S5PC110
           - samsung,exynos4210-spi
-- 
2.48.1


