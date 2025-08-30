Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C09CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFmqnQTGqXxn55WYLK2556v68/MA/H1ggbgVwEpgWEg=; b=FqRiQwYpGo+nSZUS4SIjtwjsLV
	khsn3wutPuEPqX/Oy5tloiD91FM4ri4a3yZx93BrtrZ72/ahlLmjIenIBd/JSmN5WgybmIXFisSXu
	ThKJsagKEJuAqaqnX7zKWlnHtyc0YbD5fAUi/OuKg9BMWiTmS6V4QIVyl3AUartQ4e96eYqBbKrDy
	O1fmqCI6F0dgtM6/F6UhskCFMc6q7wMw7XHMN1oHYy4ZyIS3aFKM4F1r1JHFdn4OZGGNA2xkk3Ccy
	lTqVpr7dqB/MSa8oiiSY2fjNYHJzU82oKxQaB4XKCOGLRMS0A0trlboLttK5VH4xhTww1j7Uz2oX0
	2+EE5Aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJyH-00000007pCy-2aVA;
	Sat, 30 Aug 2025 11:42:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJpL-00000007oih-0WTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:33:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c7b4f4be98so198680f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756553577; x=1757158377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFmqnQTGqXxn55WYLK2556v68/MA/H1ggbgVwEpgWEg=;
        b=qvws6mMrFmtJOBTnCRCYRGv52uVP0cG7Szla6GmKmGsEpoGXVJOwvaXYHls+UWfRB1
         Q5IgAxZA5iHHaEAlD9jsNFHqRWRYEKj6knNaRQv6QxJMbmCbBt2HCbQkICtS0qkXWRYk
         t0B7BqLudDlHf0k8HOJBDMC6xreT49PHs/J4YhXqbTUvJW8Ku1xOcQcXPlQesWNu5lPZ
         6SIaERpMZ/AgVSfayUrsz5Jxw8gYS8U85fPPk5NpS86BcHGMT+AL71ncG1iCXeu6EisX
         Ha4A+EvP0vRyo4ZQym5l6H1n8nmEnALtTAB1qBo+QcERkJOJxaZ6y9FvwybhRY8pSloT
         8ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553577; x=1757158377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFmqnQTGqXxn55WYLK2556v68/MA/H1ggbgVwEpgWEg=;
        b=H1+MGAgWGy0dM88stmn5GprKqChESN0Mxtq4dPG/DMjI7xNPAzPjs+Tuve5CE/nbhf
         /qnZiUr3Gtf60qU/eVdvPBl3/BVyUqxAZ6c/AQzxG0BAeQd2fW7yqMvb5BP2rxEXH/ta
         UoOtdRyfFFgiQ9nKAEAvywkXeoHwRSQtMvnCnPDIJKFIIELiqHcenxRMVdtyVoTsrIfk
         ErNZOq/Cmp+OiiKcGz6dog06Ju/GeDotMmrMJ6hww3eZxsr3QmHmb4Lm0b6Nc5XJ6w1k
         SSHVWRKDuW7EvDor6+PqLtXtqtmt2qw3kqnTXiS6bHpEiAGde6+TWls6jTOO1Hiifs1q
         FtTw==
X-Forwarded-Encrypted: i=1; AJvYcCUC4vWITyhZ8WJvAx8E1fV8mUSV/9h8Xy7CX2Ws3Ca0+fMnUcnP82cbpjWGe9U3GLSaBEkskmJ6wo948M9kxfWY@lists.infradead.org
X-Gm-Message-State: AOJu0YyGmN8kZ0C5JokBkDwAnpDfuBtxUrSMQBH5HieKd+w1zkfetmQh
	AqgoAjdKY80JP6XZqmBLG0wrJc/Bk8zOtbRjJlnfmDiIwv6rColUQ9sxUnfju0ykNXc=
X-Gm-Gg: ASbGncsZCyQnuF4zkKt9sjMhuvMobhmkaQYc5opBPk0XxQaLqfnrw4oTUyrV+nP1UcT
	3Mk/JN2oXZJcYISsQUg2MZustQCF6WJynnrxp6+GzklQT0CSv3HXsxaVgYFgTwfHJCxx2vTKxs0
	M8ExribpIJhO0J6dO2FvEtM7KEw2tas121tqO7ZBuBHlJ5hF34h6T/8pC06WKCRVznte+xuurCT
	Q5WGZyaghVD/8VPgupQCMqP2CKARtQf22Rc+nrkqrCVEnzx6yNrUpqh4sMAfxCexGl88qhv5Pbf
	Xonkik//uij+tuen2m+5koDV93ojj6Hpu1P6uMB95+9P+ui+11ZHhLw/RbXT/ZZuNqXJNazjT0e
	qhC+ZXTK9nG7d6dL+d3kdviS9oXFqAYwW1NmhzcK7/gNP
X-Google-Smtp-Source: AGHT+IGKK/qSnUCxIDpMGOBRaCQakj8d6VMwSyKMl0I+FHgNN+kuVHKO2/oVKVJVRl6z/fpK5Ky5LA==
X-Received: by 2002:a05:600c:37ce:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-45b81f23e6cmr21995105e9.6.1756553577525;
        Sat, 30 Aug 2025 04:32:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm75468505e9.3.2025.08.30.04.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Date: Sat, 30 Aug 2025 13:32:54 +0200
Message-ID: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=kXo25ot71PKao96MF4jC5Q47IZVAt+tdcJDhDLvaoXg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosuFljxKGu3v2hhBhALiaOsXxtFwZ1tXYGnBn3
 xTfxiSjsCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLhZQAKCRDBN2bmhouD
 10PLEACNZW39Nn75JA5RBUdU7uRFLAFlwQAQ6FGdpKDD+l8AbufT6YOx7/PBxVjhYlDta48gbu4
 UlLeAl7EQ32fF1mfnZMHRrJ7Js47GliPkqqQRTkbRLSfheo7JYwa5piEB3nT0vxvz95pOIC3jIK
 6Dka65RxK1r/EtTHQga1a2NsL+kwEHNuoIFqwa5QX/8C86fG4RGPsjdlzEsDmRpRgDMPq/swWCP
 Q15I/hWTJNEiHzQRZhGaUuslwpxoxbAC1RBrcf9g5WDcqIzzUAvkWMf8ARez2KIpVTtxIxyBM2i
 AQ4ZL7Jhv9AA7o8r8h0hpqIq+j/WGf/BdVuHVwEmRbn0BaWgMeVYH5UVPhuh3UHvhPoEDogh6M9
 qYnu/EdxJSf/x0pgfx1GD17M/b09DYVf9Lh8RQFClQEW6/xubuuUhK5XvROErwBz31uzaFl9SHj
 svhojbfHpUUWZc4GGQYBLkucUZkWTJL5gVEdYzf34i4z0UbtTe4W5mDQI9u2a6qr2TcjvbTcSYY
 9h0e6+gaxnxSFkf1PfrOoygwuPKXGEwYa/O9hL0MuiFF2Bf++4AywoeM7Itvv8sKFrXC+ZFZmlO
 v0h/yglPvU51VaoQRAwrfqwNxKIW15+JK7G1vCreJxRDhUujE3slFTTC3dkQIr2oq2sq5H+3/wn i+Z6nZNekhuYSJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_043259_159987_F435FDDF 
X-CRM114-Status: UNSURE (   8.84  )
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

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 26fe899badc5..f8e20e602c20 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -14,12 +14,6 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: S3C2416 based boards
-        items:
-          - enum:
-              - samsung,smdk2416                # Samsung SMDK2416
-          - const: samsung,s3c2416
-
       - description: S3C6410 based boards
         items:
           - enum:
-- 
2.48.1


