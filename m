Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B67C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=; b=iglyP4zKlIkewyXJEN5bNnYBkZ
	V9y+QzP1UyJw3BZbtAol7WLr+smtQlc4JQp9e27OpG8QhaAbpOzz86Tqr4xADo3xrdBHbMKsg9eTE
	6xG+qSQFd5ycNgcLnd7eXF2RdVNXeAgFjHhhlZk2NoGqk4aoOgPCh38PBlqhSO+gGLNzMWx74HQuC
	7B9/LlQSTG2w95E+8BOQ6vWnyN0nFccYzcuWVMmEnUaX+w70zQr1NPZJDRPZcdU1QMVuB7M0/jGdv
	YNeRbV2nv+uJftH7znjSRJ71rOb9Ew71aQTcruP98zwCy8rNh134HZXwpkEthGeVsw/Unp2msacJk
	5wjL/Psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJ6-00000002qQV-0Kwc;
	Mon, 27 Jul 2026 13:23:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJ4-00000002qOu-14kb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:23:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b966dd74so17021575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158624; x=1785763424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=EYxM9cpJwITaxEjDhfIhsgEMZUBTvt2oPXcrPae6VKKO7aTxJ2yQa6+CN2Qls0JxTS
         VngjeX3ZBHh+yhrXhyfqZbbnikZkicdVE7QwSqm8m7mwTXRsLN+YVsq3Pa+jkrqAuf2d
         670LiHHyosJTl0j++YH2ywgwe7AYBTSYNmWo/Ccwy71O2HcIt4+r0/TG64bqJq8+edMv
         xc1WVClRU54oh2E1LKYb0vx/sA42OGgsfRMQb+zJtOa7qA7gInX9PqnZYe9FK5alvm9p
         i8NeUn6GL2A4vZnb7UZ7433f/SHNmyehynL3440xJXtF3BKY6lyd75rZvWD4bhP7CeND
         oZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158624; x=1785763424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbIu2gZIapFLsXF2JAM5/C4wzKnu+IiYoG89ZkGUQTk=;
        b=BwjjZlkCeOU6iUcY82WiPwUk4iglh8f6mHzW6tpzExX5Eg2HXFMOGWSxdX7RtsiDov
         jPLCd/fwt8gjIA1eIkCICWzsWTK5kHqFbi2K/qrw8hoJQbhw8sUel9Ox6VKakj6k/u+v
         tuc+dMpJD20D2sitM355DaIgLOyMhIhteohQbglSozc2jRU0FdyOIVUDPfj1iAiuG0/R
         f26oo3aqJE/eASFedIfL1JsuiT3ZzwK+ovRm9QZIxisRs8Jc07gbq5owevtwQ25OTnaP
         9abeaD4DZ9U5ELXTiXk7FtASdYwbz6uotRTXsIGVnadJhtLDpVxUYwN8lpyJmXTb7Xv0
         Wvzw==
X-Forwarded-Encrypted: i=1; AHgh+RqWwZ/wbIUrBAZ01l2F2kDZVEzEDgr0epNLNlL+obxP5SG5EfvaPbyAOknGZcS8ms6MWt/9MH/E5K/iHtxGKws0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz78RWpkNm2CTLBrPg1By81CIZqTtxyQH2ThYGNDY3Bu/Sl1h4N
	zVsiFfxINpL6AtjpBW4uE8GY6eqyPQDTIH9WEPwJbbXzGUa564x4UbhkDoj/HF0SBmQ=
X-Gm-Gg: AR+sD13x5+0sdq//VjFDn8RPYYjZK/FXzeWIeayo02UZLUfSikMxuPVSjCA/hudpA0Z
	E+Y2WXe09jGkA9VB8Hf6TPARoEZ4oWyUyKjht6fv3QoK9Kx0xJ4pxQS5p90+s5ArrR531pJ29+n
	0rcMnftLXyGu2Hu5kMY1RcjKXaR49FA38uCpXP2BaPFSX/4EjE/lcOwb7mWgWIz7QyuX4Qh0B51
	mYyjFpJd9QIWPvmB0Dz2pxvCtWdSaKUzkbhtR3Nt6FT9EIxII25Yod7+7awa59IW1jW4p9QpvRj
	k7ekK3F0+c5p5sf5NcHw+Ibw18yaDnVo6UyQXZYjk6ZOxpWdT5kuVy/G+PHyldrF1LKUO3C8/ZL
	hKEYzqo1McNMGEUc23AKLiPUXSZysHfOg2shq8KeC0yI+cVm8Pov6EXYFIBP86lOrp9ReKp8OpO
	/sEknE2KMn49lFlFeWM7UtINPLNiMT6EmtkuKSPZXyVufQI+r4zTp2ipEvIcxH94DZmA==
X-Received: by 2002:a05:600c:4ed0:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-496b56e6f19mr106760005e9.1.1785158624502;
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:26 +0100
Subject: [PATCH v3 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_062346_312950_2990D01B 
X-CRM114-Status: UNSURE (   9.81  )
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

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


