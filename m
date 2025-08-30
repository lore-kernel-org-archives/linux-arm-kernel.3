Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE1CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=; b=qFd6VJBKuoPucSoZ9788TBRQvu
	EhwahY9+ITpdQxEF2lsa5qVLENIzA9jGsph3wb01RrjaXXyJfdXVcv/YljqXBfmkMPztW3YnUNlVJ
	Au+EWsuwa/nX3GlATDnaRFsqtHWR5qpbw9DkTarpzXrFufhVhkN+EF7ljSXg0dIUGpnewulWNFrwB
	jaj8pFaPuNtJ92tzwbnXHiT3YBhn5cJEHNLYp99rIFcz98vY117ZESbDuFGJeok94UuWZTQMDiz+o
	QMqws8UjzEsSGHTOUd5J5JlBUXq2wjLcVg6tiPa1YbRARIK6Ufih7Kd5/PVes69AL5t26ptVFZDDL
	p5S5aTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOyc-00000008Btf-3S5o;
	Sat, 30 Aug 2025 17:02:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOkz-00000008AAV-0PHW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:48:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3cea1388486so172907f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572527; x=1757177327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=uxqEGXpW0NCrSu90ZQ4spNWbrdnaQ3bxZZiGfakUkwVjWZtgsTZh9kh9CKvw2Ju+8+
         rwv4r6FElx5UNrxj/i8iJjMYnSEfly+nT/eEqzjzdRLM4xpV9Bw0RQif4OXA8FgV6OR1
         xw+V6rq3ovSb0yHGULtxQ0RGzXYyAi0UAY+lL2+d5KclQkGAyi7I+QY0RkxAjI8LwVC6
         9dbGFBdMUeY1N1dB14TRyWBX+g2cudhjwdfc/vixo7azhzhMXwyzgmdAjtW3lLSTpPqZ
         CmSfshIcICblgXdCFBBGgs8tt8sUqWofzomCGAnOJKZX/Ln8s3RmLzioZIZCM6LJv6sk
         CB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572527; x=1757177327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=Z1fErDRZbZcvItbOTaHOXbfJB5A6Bz9WuPDsNBwJe1yHVzHFiLo1RBgw9Mbozt6Od5
         JVeTKNU8EFcKThoq6a0+Gb5Mtcw/dINI5Qqz9MnmV9f4/p8o2qhgsc1zqyrCpYLpqqvy
         qlWSj+yE5FRycHG6Xl+clS0KiG1nGrUWfrBGShzy6Y8WZMDW1RFM43TyDE0n+m5C7/Jz
         6psS0CuC/KmO6k3uiDFWUNXB03a0ssuO7KNaTUdeZp0KnNr0elyNqLmlL4jynkIT5WE8
         0piB2wfcCsqWilS/HZsteBVGhtAVoSdjxXYsge5EZHxCX/sZ3VaFvcEsLILnTYY4Bw9a
         aldg==
X-Forwarded-Encrypted: i=1; AJvYcCVots36sJkeoP/vjrowgBA0Fyn9mIvoNGPqVK6ppiPUGAEdaGy12k7c1wZEHttaaw9MMofYsXe3eY+gFfZPegnq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4V+UtWy93/8bukPV9Vj/WUGu8P/TIznmkOq6hA3Y+VysJunYT
	U0HQhLMAbqh4/8qXf4jQZWpAur6GLw+DvfQa3EAD+HUyEmQk9GIpdiH3pLBG435RK90=
X-Gm-Gg: ASbGncsohQRBwiXsAANkbQ8Py/oPAG7m7XOFGlfisjf3PCdCjtZYJY7vWhL2uDOmp3w
	KGo7xaNjHYsSOOJCiUboo5yGz8xlpEWSFm1x8ujtsMQAFEnBv9xt5v3yksMmiiCS8A4SbEqWlgD
	retON/4zNBpvorFPo4CCwBjfavZC3EVZTE6dAivGRekiEbjGOnAqwMoE7rIYBliTl+FSrtOVf4N
	d9GWl/ELD5R1w5X8uBTP0YDIcBjNvzzjxXypVLUSbE+S/tJUfcIueMEDPX2+184vKbW8fDBt82b
	cI+RQ7RW8hJASetth+dgkoo9q66mJXuRubaUjB6ayRtA89sMN3mdozjvu2uoQ/XH4MYydAQoOp2
	eqQIVOeY50VSlawtFIOA31I/v3GbKMbCUm4vJ1i0=
X-Google-Smtp-Source: AGHT+IHt0KuSMQTDPQqKwlDvsHq9uYVnTMb+JaxUV+LdGdK88mtHqEQl+7TJcM0mcCtVtJuqsHFZ5w==
X-Received: by 2002:a05:6000:2dc7:b0:3b7:8890:8e71 with SMTP id ffacd0b85a97d-3d0fdc6311amr1950866f8f.11.1756572527510;
        Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:33 +0200
Subject: [PATCH v2 4/5] dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-4-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ebjPcUawDuyYiStYmNU5ZL3R3L1PNedniR0atYT+P1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytleZMp+yMmU7xsdbFO7JlxlKksf/lRJNJaZ
 YnqE1JDQ0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZQAKCRDBN2bmhouD
 10QUD/4gM1mCrSjYdcPTKpWDO6kCTZbB6/rtQiu0sGhp1ajK+tkWUy1YKGoYABMormyPFvjUzls
 4xbQEJN5gc40zxgmpfXhXLCfD7wl7VQsCVTtMAycfoR7jhL8kL2OB+vaNPXyE85AyseRAEnvYAv
 IDDGCmTzXLhDx+HejGYmRE/6Xeh2UWau1h6nkxpE6RPsTkr2P8VsGyYtqwuIvhluJShhDAW7DSG
 oPtUQr5q2g8KUANF6+JswThvWjwy0ImF+dNRp+1dHdeg46dbXLuzviBtqGzGw1syBI4N0uyS24D
 UcpQCZ+F4MZLpV0Z4TfQkf8bAr8gwB2DMAEkBZOML7culmARpQnlbqPA9do2wc+bDQkP66EuRsB
 7QzCly5CwNSmvfX5kOcmkhggEY7fSzm025jZLBwEVTs2iskQ8VZTnuUzTDU3jWkgF1bZY+olaVX
 s37qaxVKymOdFawq/CMkiAmqz3E/Nuwi1Uk0RzqejCeuqArxiwsWKp7QfqEribbB7X3BYbmgAMl
 tqsbPGMttaqCRBMqUi1B1UdZeP9DjS2ZNWfI/Jt3Bdgi0L5CZSJAIL/Td07t4tXZ3joYpp+p5Ou
 nGEmXkZeVdmhA8UPjHErtSQ85D6cRgivmj+rE1dXRgsgmZfpzXxRTx+sOGdE/R8pz2K02gZgJm1
 c0y2ypd7f+7giyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_094849_130413_BFD57159 
X-CRM114-Status: GOOD (  10.22  )
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
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 8069e99ddac860b22c793c3ef9479f720cfd8c65..73d7ba0fda1def433a97d10bce21e762a307e36c 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,10 +18,6 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
-          - samsung,s3c2410-adc
-          - samsung,s3c2416-adc
-          - samsung,s3c2440-adc
-          - samsung,s3c2443-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.48.1


