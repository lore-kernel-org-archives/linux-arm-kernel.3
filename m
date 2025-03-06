Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A7BC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=; b=X+IiGNmDOCnyuYQecWOqaxqQOt
	WjqoorD1VhEqTXRxKvXIONvPp7qRCE1gzs9PHYE+VsSzlsfuQivS89kGHOYmaXE9RaCatST31VGrz
	8/5kjqLGixOj1f8ogmaDrMZbgkfqRpcU1aVZSDjkWA/j3HO+z3f4JPBMT8gdci5Krpukpo6hiXz15
	/wcYAJE7cyPa7WxTuqf4dkR8SBvQln/Ep3sLh91EAd2lZEUCIqeVYwUQRIfqleLMt4ZElBNebklmI
	r5imD5j5NpHAfw9wegknowmq+gzPCXsQhLKuTwB0T23Lp+Y4DIQtUuabEbcGXdG0AC0IlNRFCbeNK
	do/4ayjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Jb-0000000Ad5l-1Uhg;
	Thu, 06 Mar 2025 10:18:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq74C-0000000APpY-1bjj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:58:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43935d1321aso314785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251535; x=1741856335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=ts/CnSRJKSFFOsNJO464xcpvJZprYJKL1hq5UI8mKfLHXMrARIp9i9MpthRssqhnzY
         raWkqt4jy2AZzXvLSLKavlaCBhnlWaG280+i/WzSkTKP7Izf1Vc0ZZ7YIS37ukXecMUa
         zndCcAFNoX58W9Z/9KaorFslA4zvpS0cuG5uaSjYz5mncapNS3JAhUuFlqyrRRBDOKrr
         tK3FiCO5G8sUSxCmNWU6IlZ8BB7oCjuj/5InFf0nD7oLAiebslNpiudcSlKFR5SYtn8C
         xGDZCcYxRkrv8u9aAjfEcJVcbk28KgLqYjPaVDq0PzYdyJayXLQMnyQOjX4EzmqHsWJp
         oD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251535; x=1741856335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=JZUkcxXPaRPbM+koTzN77/F1crIV1RUFGNaJ/mZ2Ykh6EWy/SvgTZtu5ueXX02D1NQ
         mp69SyAQdih8xm1oNHzSJW/Ce83N0VWVvSGSYMcl+j2bALz3thpYT3Wk4TnmY2p9sLpM
         LC0owCuQ/6RpXak7Y8DhY0YxVXLoOP2xVI/zGiuN8OK4lzJXH9DrSUhGLoklOtsAwa5J
         V+Qsg0x8MBQVuTJYKDZ6QCgpNBoLGD0krY3twrjUydazQEgCGOnbxiXL78awZVljTzW2
         MxyK+E/F+vb+89MZCkmNiRygQexNbHv/qrhMND/fMifcsJAuWINYDr7Zh2hI4ASt6PJo
         p4yw==
X-Forwarded-Encrypted: i=1; AJvYcCVJsmpaqhBP7imv7cVvDQXGTN0HZwaLDI+Vm+pTgSdhk6TMy4Rw6L60SIAE10P9UWRcJjaLEVQlU11ylsOOYMi0@lists.infradead.org
X-Gm-Message-State: AOJu0YxuN6iqNld718okLYtfaC7CdEFG1VJeUhkEtRdF5n7+tUUFX5tt
	ev6TUVDd4Y5mRw5+UbaAfISMsuXUQJvJWZT9im9fnOGoxwiR68eEibwfbFpP0lw=
X-Gm-Gg: ASbGncuh2AUzphJze+ssT+/ohg6ig73N9YMLwAgQayV/Wz5yBHr6ROTFgbQYSulhtOF
	OIOF8X7Bmj0NT570j49LUqRrX45CO9pbDp+iJ4Q1qJwT3GXFqYD2X1SCuaSehhkZCGi4A2xqkdb
	FA9zePsUSUZr9bykuUjdO4RoHWsOLs6j93YNQ88psCWgEPvN+DpbPnhOzgWNCG3BS06RP5ut8ao
	xu3+TleOPu0TpaQo6T/gCw5jUiFYbj+ILJZjYixPhoXkDHnBlwHgSn2GraDu0SbApEgA3Te0pZq
	Hd7A8sgo96mubsALmqRVNLU3soYf5IH/PWXvKh3FgnmZ9o3YQ8VYWAfS5EU=
X-Google-Smtp-Source: AGHT+IHIwsYxtasUsH7F1cqK4+j6EXhOQvlZn/zl/WS+mfi7XrhQaNW7pJTzxIk7YBr7G3/zWRlTbA==
X-Received: by 2002:a05:600c:b8e:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43bd29b66eamr20092285e9.4.1741251535085;
        Thu, 06 Mar 2025 00:58:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:54 -0800 (PST)
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
Subject: [PATCH 2/2] dt-bindings: memory-controllers: qcom,ebi2: Enforce child props
Date: Thu,  6 Mar 2025 09:58:49 +0100
Message-ID: <20250306085849.32852-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005856_420883_DDF94614 
X-CRM114-Status: GOOD (  10.14  )
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

Qualcomm EBI2 peripheral properties were moved from the device schema to
separate "peripheral-props" schema for child node, but the device schema
does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 06652f348f28 ("dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/qcom,ebi2.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index 3e6da1ba460e..423d7a75134f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -104,6 +104,7 @@ required:
 patternProperties:
   "^.*@[0-5],[0-9a-f]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
 additionalProperties: false
-- 
2.43.0


