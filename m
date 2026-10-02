Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02125CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4SU93rxO9iU4XoD2a1LOc1G1KTUpeIL9BwetV79aAo=; b=3umNSLLNBudXpSvdA+P6JPmrdK
	wU0tTv5aSIai3jGCz5QzbO1TdiIGg1V8hGIRrz7QE7ZjQ3u8woZbthsBKZISIFrwLNspfhq2wA3i+
	nYO15Nwe+OBysB7vJzkN3S3GR/zP3jHUr+5nomhw9qhV692bzOVipY695nCf+1xEISxMAsJmBDcBL
	UBSb3u7y9P/ymhNy4x1R2s03GQ6rgcm5xRgHvEUnsnNANVoMP08tYFvF4tJxbAfnxwYu+Dkmont3Y
	/UGI+yCaj+PL68OhjeQXDvsXUFKGK6lI6EA/1B9tiRR4xR3yoLjQeziHQptxsdG90x3P9Jp6CWfWO
	Xp8Ib/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRM-0000000BIXf-1cjP;
	Fri, 02 Oct 2026 10:24:32 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRI-0000000BIV1-46hY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:24:30 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso39812525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936667; x=1791541467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4SU93rxO9iU4XoD2a1LOc1G1KTUpeIL9BwetV79aAo=;
        b=aKtmkLjyb6Oa7ag/6LHLbBiT/hoxzEv4MxykpM0qTwTV/dp7Eg6cCnwJ0q+xVhQi0s
         Hiqa31PldzKgf34Do+h67czlpIQIQCVqIJjIYUbLYWBjDdOli5pgCH9tSBQevQ11SVWN
         SvuVkZgv4OuLu85W4wIBKIlAO7hH+aONaAxMj7uFPLl90RLyRgQeYf8D5CxX2/UfAJAK
         bqzeiQyy/l92ivNG0s9YKKRA+K3IpucmvkVuFm1KW85K9fUUDULHk81qkg6YOw2zTaq+
         ec+bsQqot4xCxzsiE7/mbWg5fq/nTm2r2BF0pGRUBvvEso7eQVV7Hm3b+FmXxMqEZKD2
         yr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936667; x=1791541467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4SU93rxO9iU4XoD2a1LOc1G1KTUpeIL9BwetV79aAo=;
        b=1Ihkxq4Pb62ckGVgeETMjbiD4KDmFO2WmkrjcLAGwZxO0Yc35xmIjjhZ92YCmRkvb/
         Yn/gQcEw7vWu/UWoYdtJ0xfh6svBY4C4fPz5rxBXLXs+fUHEUri0lAr1jepLOpNzdZ4m
         KZTiFEG1GVpiHRPnk8Iob2zX/1o0feqJ5i7Ua3cGBjEKT2GqZKKPYX17yqvVCQe8ncEG
         UpHYHnmrNOZxpZZdlli1Lu6VtCirYYAdwZhrK/7ZxdynXIULpqNp4+tIy1Ffe0Fo2qvQ
         FizRF8VgMl6Mmk83yqwyUVISo02XjK8wj97pZwoBb5jFb1StENKxvxWsiZI16+7I5DoH
         6v6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxauT74zDULdFC56y3J+mGJW7VQjLrkA58/WBSg3MKmggRccTLjATqqOq4Ptl40Lf20xTre/irjuahuOdNJ84M7@lists.infradead.org
X-Gm-Message-State: AFuF++nPy7gd3P3QsQGyEQYga/VtYM7ERgAx/+7giAUPnWs/vY6G/RRt
	A9CgO4rNwY9MkI1EAta1bnoGZ+tOi0g4SXzISwebBbYnsaene3mMoVz9
X-Gm-Gg: AYBFou2br8dOWSCog4pEMxeZMAgFP/n0l8SJLSaUY+/+2pfK6x3Sy5JrBhath/Kt7Ok
	qtjoz2LdFtJBl7xhaPA0OlWx7HcRoBV4X5BgZcdzxl8JuLaUST9MXTJddUCCiS0rPmso31NM14U
	WeQCHoh11X/xzRJ+eFyimXWKzJsWmqbd7dbIfT6uxByOG6r33wrDSWT+JMXZFuNQy830I0ziT7b
	Vy4Kb+HO2rRaQdRYfMHqTJqXjY5BRtDFGKgmcuCCU99nBP9jYI9lxH/dx8ifXxaHpxeZMunXIb/
	MEUv1hVtJob3C/xgnN3CFDij0DG5OVsqCzG7xL96KjRM4wAhXclU2gQI6RKjspOZ9xXyicTu/Oy
	KfVKCSCsQfk67k8kYq0KyWIe27cMdyT7ZzvloJuerAnEBSKBht2JZtQnDoZV8q6gg1T4Jdvyp9o
	B15DxdTftizd5l5fmggrACfnJ7kUFcj+JQVRxe/JQzotTiIcrgV7XhQ6GYAWf0ocEqBqKBEBLAO
	9Ol1kMwvyGbbGa2cjITV11JhxGmLFxKQp2klFMNzqmhAA==
X-Received: by 2002:a05:600c:608a:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a02758e6e1mr38928735e9.24.1790936666932;
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm99557875e9.11.2026.10.02.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Fri,  2 Oct 2026 12:24:17 +0200
Message-ID: <20261002102419.830595-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002102419.830595-1-sander.speetjens@gmail.com>
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032429_125747_95589304 
X-CRM114-Status: GOOD (  10.64  )
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

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V9 -> V10: No changes

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.55.0


