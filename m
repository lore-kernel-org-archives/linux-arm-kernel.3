Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC6BC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=; b=lC+ayuBvTQr1OkDy8GVXHeLJsS
	7VHscNxXZTouk3BURFahmRPHGHw0UiYilJwmBbYvnwofhPPIyEqUIPzsGOI+OlHEX5tZxS6FKutVF
	awlE//x/deVbBtuvx6N/ejxGFUFx+LNXkWu6l+3YuEgliZnEWDjvOhP5kp1/6IjInMk1Ku7VCSjmY
	M7jmCZbL08o8JWYCaLypoXpJFCLEE/DABHmsbzeQU0tsUshfmIBI//qaU4SDNRFDllhe9Of7yiH1g
	qiDHVqA1EHg1ZaB9KxPAk6kT5xh+h0N/51D6dqgCbr699Q2j5k6/i+nPl9XHeqiENLkfMNUJ+JHlx
	WJfBuq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A17-00000004LYa-0h9m;
	Mon, 14 Sep 2026 16:58:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A12-00000004LWu-2Qmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:58:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4858303de5dso3617270f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=rBIhpHpvZ3tYop060oHEXHgbMMScT3dnZwv0As4bJcRT7Titoi/vc41sgdj//VguYm
         uqNrJtPHXM/Rh3ca3rRNKUbipTxNK8sYaV4JgnqkUqiicHXesmU2zZoJyfm/E1ZzzCoU
         5CqjJUFSBGl6Y1C7IphIN7Kc8Le3fuIYyA/YxDDF1986IVJB4ehWNRiwuEoBRzxv+CeG
         tnYF7gMZ0Ql0sdcDyQ/0Z4aR1SJNuF0L56TtwyyTV3kWq8Rd2wtE/iRM+Jkoebe8al89
         NZVTJASIxxo6YKyosrTW96FVV72InnTz/VsQI1pH6j3nn4q+G+d14Qf6dlqaxgxXezi/
         kqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=Cj5f4dJ0MjMyYW3P5nAxveFxpefet+h6aYHBhACIDfzOpmmn1q/y5+J29yk4g3zF4J
         NQO/kz1p7jwfjuNdiQk8lPOtkUM/fOaS1qlx3l+TaN9Gy4Y2vGO86QZ2cPECGFfked2h
         CuWMpsV3mtoAEIQFZi7gNxDlEIquH38roikm0Pv32E+V9hT/nsNdDSVVKP2Cf5uLK/ny
         wNdCkks/sdpe6ypS3wMOuCTKktCDx05PiuNB3ViVbFln5DjPkxnqeZPdvYXryRYL1A9B
         8DF+LzGeKGXxWUDrRkgIB27YrWIsup+FKA8LPapqjLIwG3zebR/X9gR4G9az1vz4jcqa
         f/lg==
X-Forwarded-Encrypted: i=1; AKwUvByMRaZtOblaucl8EjEQMXneTeckqBp2bvWQB7THI72/QNvoow6geJ/kD2Tjy/k66GyFHSMG2/8uw+4Ix1Z6D/Sl@lists.infradead.org
X-Gm-Message-State: AFuF++m0iDB2xHUMx7sr1xqfasf/rFwNF6lbnwwU5mjbdkZTntEiunQZ
	wgK92cozn+pNj125W2Dqv1HP3rSPw9LkRdlbUr8RW/pGko1z50VcC0Z1tcQy1vTdqAk=
X-Gm-Gg: AYBFou3gPYYIIWwihMwRsKTh7BeUMEJptXaD6WqtSC+Go1+Hh314giSyD0VyKfHcowR
	R+fyUsmldR3Ak476wTzOOm4xh5y2ArQlX95ZdqZRZXlzYdYfzCCLLw3VF6qZBfqqzGDP4rtMML0
	pMLocNKUP7K8BgAwjEk+hPCiYYo02qc0Wx2tM8o3HSGsAI8qcNYqyYTTJKvJ4uU+3BubvJontON
	jc2+Q/R5ZSWcIkKQe/hzb4QrQc+R91EdlEdyNXbGBHGOfz8KlWod+lx1r5EipGOqFpQNoO2/Kmo
	/Jltn7ncUUkHL8VieVGwDnckW2n+YPgUAaX0NwZ5H3bTutGJv9S2erWBtxioVA/wjXL3teYmpou
	soGHZMzFpJpvkXoFcnQ0CTqZYRV3bymhBHYqIiAmAY1rLNu03d921qYgmFn//AH2oQC3ktad6WM
	hgQubY0Un1sU43U6TkplCsUH/X1Aj0pEzP/U+/CQE2jUG94GRtW7s83Kc/z/vln9n1doTn20mvz
	oHbWslfq8zRVbNZ7e6FbNRzfLqR78/N7nYhVwXE3BqqP7SeoRJ77R2t3A/S8qY=
X-Received: by 2002:a05:6000:2685:b0:484:4880:449d with SMTP id ffacd0b85a97d-48702aceed7mr5488987f8f.3.1789405126615;
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:44 +0100
Subject: [PATCH v4 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_095848_636797_4D27EBF9 
X-CRM114-Status: GOOD (  10.28  )
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

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required, that is why "mmio-sram"
compatible can't be used for ACPM purposes because it requires child nodes
to be declared, which are not needed and make no sense in case of ACPM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0


