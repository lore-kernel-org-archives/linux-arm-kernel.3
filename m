Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F335EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+xYDH8ZA1ujcqXzLdWECgpqE3X7iFSqlkU9E1XnNX4=; b=J/3fou14xeWTrCMHMgUnpFbvVW
	MKrwTHiWalDLBmN5i+R61GQFDHnIJA30iqpF8tI0oTaDpGk/fTylR0Q0fVYxokEw9icdki796TTo0
	HiDBpuHsJi4iz0nRXwnpZjCpNgMnVrzGpNaYggu8R8XgHHIcV2uh2O+NAXSu1aIy/VWMGjaBlK0EM
	ooej29e7/nqdHBqeXdN51GEyf4OYI4ZF6jvv/SP59on4TH3KL8qIGHW5WbsOGj19ysl+F601UdFGE
	tjGMpDMM2f8yYmIeEQkq7BhfBDYO5kKTVOQc0ZpfgRrjmzTDKB8C2QS8fSQXefgx/SjD+4RVgWp9k
	PXRS+10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbk-0000000HLhg-0JIU;
	Thu, 08 May 2025 05:15:44 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtXr-0000000HLMa-0Noz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:11:44 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736c1ea954fso402390b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 22:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746681102; x=1747285902; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xYDH8ZA1ujcqXzLdWECgpqE3X7iFSqlkU9E1XnNX4=;
        b=M4BfuUqvwf/UMTUk987ewBTCZoG8mz6koirhq3KFK19gY8bYNogxQBXCUnPrBNHR5+
         N0NSsKwV9j9+sn//9jMfDdO2ZdAW7t0HIC365s+QbmIMw3hC12mI9ShEx+ubKIx7dsn1
         MwrnyByC7mfJgzrUTeE98T2byVHahVtw6XCIWl8BiUxk2cCQgK3mhRV4ote1N2rDnRd0
         1c/5vjwCafMnfitBgwiBicvyXQRD0Do/oyfJOe6Zt5knu3Ml+Ehprl7xrVv3lXpSzNEC
         L14lhDXpB9xyI6hdQLHALGWGWz/mXXyL6AkBF7cYALPSHwo3V2UHLeBytSGBwARhG0sA
         OwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681102; x=1747285902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xYDH8ZA1ujcqXzLdWECgpqE3X7iFSqlkU9E1XnNX4=;
        b=TD+9pRoUymjEsfDm+KNv/UmpyXMlAdLk6cuxASeDP06Ngwy+JrjNHDHAOEn6Xl/+6x
         tDLFhjWgVJp0fQfJcz1ePUAkHWLDWN96E1ma+lM10TUqHgXjIdaPk40m3zj4ZWE2/xJl
         V1h2araTV+TDu1NM36DAZJt3hUJmjvVqGpcqcneo3lOeP0/FwiS26TZbjV6HbZCSJEh+
         vF2ObLR+vU8iUFyu8V1tUWJ1qLX68US1YPvvHl5jQUh2XMa3hZYNUkygG3pJPUruPeGU
         Va4zd2TNPyT/4L6JFSZmiUy0yMrapJxl1W3cL0TRbnu9/BZyuTX7Lnj5WlSOWcCNnu3H
         MTxA==
X-Forwarded-Encrypted: i=1; AJvYcCUGJfK+nXlCXY6GOsRUMIKkpOo+X49QTkS88zHH/94t5AE4jh7xW+O3OUavDCTE9vEuyeiMz+IB7oKY9KlCzs3E@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu/RMXU3jixX9tUqkh5iu6aFCRQsVJeVS91R1DgXSIj29jBaBP
	5BlQWnXpFwpoVobEpaB5mCoHwAC9fYTBiUiDqsORxD8LnkloLNtiknHMTH5Lyd7CWsH4cPEqQ1S
	1MA==
X-Google-Smtp-Source: AGHT+IERIVcMryduPU+3ecKegN+A1vCg/pfEbS6Jj0XrVd99pcxtEPjMwKwdWRUuqmNGdI0hOKLRwX5lI5w=
X-Received: from pgac18.prod.google.com ([2002:a05:6a02:2952:b0:b1f:ddf9:da49])
 (user=amitsd job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158d:b0:1f5:7c6f:6c8a
 with SMTP id adf61e73a8af0-2148d332422mr10163138637.35.1746681101676; Wed, 07
 May 2025 22:11:41 -0700 (PDT)
Date: Wed,  7 May 2025 22:08:51 -0700
In-Reply-To: <20250508050856.674782-1-amitsd@google.com>
Mime-Version: 1.0
References: <20250508050856.674782-1-amitsd@google.com>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508050856.674782-2-amitsd@google.com>
Subject: [PATCH v1 1/2] dt-bindings: power: supply: max17201: add port property
From: Amit Sunil Dhamne <amitsd@google.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org
Cc: andre.draszik@linaro.org, badhri@google.com, tudor.ambarus@linaro.org, 
	alim.akhtar@samsung.com, dima.fedrau@gmail.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_221143_127105_75B84E7C 
X-CRM114-Status: UNSURE (   9.86  )
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

Add port binding to represent an endpoint that connects the power line
from the battery to the Type-C port connector

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../devicetree/bindings/power/supply/maxim,max17201.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index 4823021ff16b..50c2d672cabf 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -32,6 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: OF graph endpoint representing power line (VBUS) connecting
+      with the Type-C port connector.
+
 required:
   - compatible
   - reg
-- 
2.49.0.987.g0cc8ee98dc-goog


