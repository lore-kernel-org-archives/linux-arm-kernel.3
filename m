Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ABAC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=; b=KaZSq3NQakwVb0h1AyIVJrBCkM
	k4ZFeOWC6+vp6Xufn8Yatwa8FqW0+dB4qIjSxuCc8YmsCponLruo4m7B40Vcsuj1WBjsf52wZO0Ma
	wOQtfNJsTWaoIkVBp34nmv5EOPeA9iP/nVzGVzeifFKgoEAuaolarqcH9xKWl6Sv55xfNkCBOByin
	LwhKGHkU2c8LnYimM9LLN2AywhEIJKon68u+6V06Q2rcmP7c0jAZ8MexRnymUkgoeI5jsIlLyg52F
	ZbEcq+fBGUmLlJoK1gnXtcJ0zczqnHuhhS+xHnEgBpFhVd98/wtT15ObL0uGa+8+yDqIVoq4/SOAd
	HrsVtt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Es-0000000ARYV-3qH5;
	Thu, 06 Mar 2025 09:09:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq74A-0000000APof-3Gdq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:58:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bbe818049so463715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251533; x=1741856333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=vyAx7JTsA/hZ6jLd3YXdo5x4/DaCkdIYtahagYvU+Vz5qYudm2qR5EomGChF77X0Br
         lWNllfSYIsQd+/RFQ+6vbLUn5cYoiUN+/dhyWuryWUEnU3muREL3o/wRfH1Vq1wHM2s8
         TtWKmN+Bq7ubSFfrbcP8bB6WcVSLUxgNuse5GWsvnsc9uV5PS2iQ6L07suT7WM6AEIHy
         QrJ6pKOxCjETlPidDZL1hizSb9SC+VEegZ+TTO6MEACdZiFuK1S7YXw8qt+A8lk+Z39L
         ChMaFPqPon7hye+24dPjJvDawUy/0vorOu3607To7w9jFVRXqfPKfg9nVbKmEk7qhI59
         zIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251533; x=1741856333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=QhOb09GA/4+69zZM2Q8ZVVqgZlfUBY3/Uzx8V48UZIlF7EMWCp6+6F35FY0PVgoL5R
         ip9gbKtqdM5mRkZjWM2dq4EMqjvI3w+Hjtn+jyTbKDgW+wIbeNZitctjSo92I30+ErOX
         P4lLoQ53B7tmEPyPHtVsE0TfMwzKRt3go6HvP+t1Q9pQHhSpVNdMayFmB8x9VcW1tBpR
         yrNBd1oH4cTPJ1XlWK+yMcRSMpRmCOUiEiCnTnRn3P9+ojZx75l9Ko203S/IHeH9G7/2
         ia0EidFMRJy+Esl6uLyRydAmq9gc+3jewwSVrfo+2/djk3Q3RJf1GT8h4Tqg4Dact1/m
         9hLw==
X-Forwarded-Encrypted: i=1; AJvYcCX9kGJfFMF8FYltlM9Lh5xf2QRD/6Plj/+4Cce2boiPxobT6XGsm/VidmbtWGcRdTPU8vpIy2DDIOuu+l7RTYVa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7GaIgwgj/p3/ki2SiCHxb2uAAhdhYowEYWWDoMhhzOOkQYXkg
	fO6k4VUHNLJG9AydTCqIR5CvlWXkOMkXKN8G6fhaZR9Z/sHd2TdMmuLzjDoq5a8=
X-Gm-Gg: ASbGncsu/foOKgjwd7r/Dd+uMFu6pdpc8+HLhQZwgwnS2OnSPesQtSQSXiT1DsZQUQm
	qwkw9RaLc01u2A+9bFFXR4CMFJBhjeCqYkWrZ51sjxpMfEkY7IOSNut4HJrzD4tY8Hn/sKzKNg/
	9GZlDCwsGE+9sL+CUAUFbN26xCt92y8G8hT7vZdr3GE9Pas5LACc5yxWh7HecWFL6hvAV0eTK7f
	B+3GM3JcnQKaahtigZes+7hE9192ThB8CveBreRTr2Tu6b8u5/K1VT5MMWUYKeZYVWRlt2a5XTb
	LQ/42cv0i7MsoyRAb+ctb+j78cYSc8M4oJ0JP/LYo7ll54FadbAgW6vFKRc=
X-Google-Smtp-Source: AGHT+IHVNtHxGr+nftjAhnUun25Kgv6DcFTFjM/EL36b0UMvE/mwNcZOxoyBOBbcisiK5cck01E7sQ==
X-Received: by 2002:a05:600c:1d90:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-43bd2ad9d91mr19260025e9.6.1741251533219;
        Thu, 06 Mar 2025 00:58:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom: Enforce child props
Date: Thu,  6 Mar 2025 09:58:48 +0100
Message-ID: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005854_862131_ADCED690 
X-CRM114-Status: UNSURE (   9.67  )
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

Samsung Exynos SROM peripheral properties were moved from the device
schema to separate "peripheral-props" schema for child node, but the
device schema does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 67bf606fcf18 ("dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/exynos-srom.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
index 2267c5107d60..1578514ec58d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
@@ -38,6 +38,7 @@ properties:
 patternProperties:
   "^.*@[0-3],[a-f0-9]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
     properties:
-- 
2.43.0


