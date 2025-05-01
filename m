Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8lqK6tfVd59vX3pywJVYOhORRQne8XIPVi9Jx6VDF0=; b=3DVQFAMDzrvjptVhFHE1pHhsk5
	9Yds6A746Qu/YQuT/MV1XACAYjdKsg6PdpnvXsOHrNN8HX4ZxfLQ7jY8ivi2XqbsyhdYGURNs6hGt
	Qta14PWQ/bSkMXQnV0gjQ8O0bo24T2iN6nDbelLrsmiqqFK5KYqarAbUCz06KTKtYV+eL9C/6A8Qe
	Rq+Wrahyg9LXepKibfc1Q0Ou3FWUQe4OxUcuSNITmwCxN40vbr3yXKmffVF1GCtE0H+BegPg7Jktw
	NUe+soVTbm1tPXnYu5RjMoEz9rWXWOsRCuu3csAG7eAcr5g4Ps84RcUGk1dK0Htzqg9Ll+qMNb87l
	a9UtdheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWyG-0000000GCf9-3kQo;
	Thu, 01 May 2025 16:41:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWuW-0000000GBvn-0gco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:37:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf861f936so2103625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117438; x=1746722238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8lqK6tfVd59vX3pywJVYOhORRQne8XIPVi9Jx6VDF0=;
        b=qPFHjvDi2MYyNErj2oX46QO4Z2ez7FbHBClD/nHOx1CNa+IWGyb8I2WKwcLBZhMyIN
         ukTYNiQDqJYwJx/Mm2KSqwINhJtEXf1p4vxvDIquzvCJAnAmCFW6jUYhtz0RJgxC4kmm
         8tzbIkWvljWr3Mm0mBMOknNFT9TkqqDqfLnySyg3PwdLegGCRznMrs6F72qsCWDwiYDM
         bdYdEMlouxEI7Zats6ILaSF+pUeaIAq5hOAKEijRfQzOi60HJ7SXss3VijZNKFdhPEA1
         aYTAu11EMFULHAgGPSAAfJExghg8MufmhV3oSaOTV/wzuefNyo47o8y0NAgCebWqPe7U
         wbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117438; x=1746722238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8lqK6tfVd59vX3pywJVYOhORRQne8XIPVi9Jx6VDF0=;
        b=YzXSTqEncMt8e3spVUxqVZxmxICp+Q330BPHm4wSmnI8bR8vs/+opY7zuBng95bTfe
         q97c/1OghyiCAEJt36DkQdyB/FUoHNRjmwuPn5zf2tZ4rjv8GFnLNiCA8oyEvTJ7ldLs
         Xtf+qyAEI9u8cJcbaNqDi10opGEqD4SPcmHyj9IF0keMzg9O2n5oVuX8C/1QMjNBuHOf
         e6zaaUTphkGsva4+jrv8QBz+IVByZGVTPhoZBd2OQiC1yl3h14F9NVdTqpl0XKwaJPDL
         KuwSYTClqfT2heXdZzxK2JBR68XCQK1A7v9xQh06BumBce4ZQwHxyT3HzJhQlQ0yR33f
         jEBA==
X-Forwarded-Encrypted: i=1; AJvYcCUr8fxkfFygeVNszH8kIDofxRGVPsL8AHjjLCuHh7wPn+ZlLss1KjGCA3P5ZeNMVukhIPqIiXKHZn8Kar2UO867@lists.infradead.org
X-Gm-Message-State: AOJu0YxAs1T6Ep6jj/QW984vfR3G8VlhB5JmL4DEJ4GmXgUtR9hSd/XW
	3qvSA2b4PtSHAHPDdk/PEFTCtXWWV/pw+ySeQzuxDCQ0VUAVXPtdILG7HzlDC08=
X-Gm-Gg: ASbGncu6ow7OTdZb/e9XU97U+8KGmpHZKOPMqRtqX9Qm0EMiWTja0U8G8AjpvV4h6O/
	zQBucA/WKBxnoJI4oqVivpBmsCWfoGncwjRuSUI4mmRLxGK3U7DCsnLvWJopecaq9HrIev1cdeo
	DxCcKnIWLU1pg4DBhhZFh6Ir3yPPvYFkMEHpdlpZJF6FfkLtDWw16ci5bcx2hx5VHxCGYCa9gzZ
	2IP0A1upnDppLCodyadzeHh4E9kIwTpnjBbCkMqZsRg1jTrpcNFS2zFE9Q3+kK9TDMrqvO0ebU1
	Weqahmg+mUZb/3xQeoi3jDbZL1Pzgl0gA9ei0iTR/Z5353KOGypDoskvDvk=
X-Google-Smtp-Source: AGHT+IFZwlTD+VXEFQskm5Opg4QT08E4V4yhKr2btjZ2ach7B7s8+ZAR92EKMwCOCBvn4Zdc7T2oaA==
X-Received: by 2002:a05:600c:c0e:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-441b76b815amr9384095e9.5.1746117438399;
        Thu, 01 May 2025 09:37:18 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:55 +0200
Subject: [PATCH RESEND v2 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-1-5a3cab296972@linaro.org>
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5iZ+1LBZMer+pZpH3XZWHbsSvLh2Yz7gnxpvLUEV64s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M2ILY0VIn3BIClSvY2jKPuO2ZgMzm5a6pN9
 Hx8f2cAHZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjNgAKCRDBN2bmhouD
 15TnD/wKU43Zt+z6TRR7birMMQYuwrxVFM6QbcBghyAdrUuYvBvaFWylo3sxGwRXrxQEi7aVy8b
 Y2uBscPzKtNC+oIxA7zRvI3ttqWtsBwY/iJrd1LgPB69tBvCvkPE3x6liwxclqrWv83JRpxOfh8
 wTbtqA0N+N+H7tH58L7E40i7OkW5ek13kb8TCqSZhe+GC17WYbQreJZ+f28Wg5VBLT6y15iF9wo
 e413uncYze7Q9LGmPeAmWW6+3AhghiKuqg/kAsQ/mkqSuDzLPKkphG0CFxImCKH7Ktniy44KJ2f
 FaJ/px0bcruKsShHrH81Q6auY/JSWbGP7krcrhljbSqsEJ5JpuGkt3MfkGQjTzJtZovjC2SwbuC
 WDAoJpWsXwq9v6WXMxdML9yg4et6s5Q5sWJpTHbjjiScPfg+if13v3IxFCKyRnZt08iZdsqqEYf
 ss0OkD15qM7P+PnYccuMIcbVGQdrX3qQT7Y5Vcmtl1WHAbePL3Xj45nbYke67iyk5urV4j8Xgxs
 Ckr5V+w2cZUPlReNlqD/oshdO5Ln6i3PQrSsHIUTBndConaw4BZ1J6x2fmyHjvSSXn9tovdtXFX
 KjPcSg8HMs9XewBrAes4OT41kJMBesAI5ABhORTNE6g0s/mmqZDyqfiQ24RreU0sFZh+COAPGcy
 eubtyBdyW4diOqA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093720_206935_47C94EFE 
X-CRM114-Status: GOOD (  13.73  )
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

The syscon_regmap_lookup_by_phandle() will fail if property does not
exist, so doing of_property_read_bool() earlier is redundant.  Drop that
check and move error message to syscon_regmap_lookup_by_phandle() error
case while converting it to dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3c62337f43c67720a15b67e8b610da7886f6f39c..4448c0a512137c79195112eea25d762266c77bc3 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1123,23 +1123,15 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 					      struct omap_iommu *obj)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
 
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	if (!of_property_read_bool(np, "ti,syscon-mmuconfig")) {
-		dev_err(&pdev->dev, "ti,syscon-mmuconfig property is missing\n");
-		return -EINVAL;
-	}
-
 	obj->syscfg =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
-	if (IS_ERR(obj->syscfg)) {
-		/* can fail with -EPROBE_DEFER */
-		ret = PTR_ERR(obj->syscfg);
-		return ret;
-	}
+	if (IS_ERR(obj->syscfg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
+				     "ti,syscon-mmuconfig property is missing\n");
 
 	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
 				       &obj->id)) {

-- 
2.45.2


