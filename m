Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E2C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gzfb6HckY9UdtJPRmS+pKyEgA39e1sxVd+XOM9U62U=; b=aAgym8w26HV+ly4o4Q3X25FJpY
	UZ+V2FyoLW6p6q8feZzaY0TUIgq/Bsou+7u4/v9OIGT6XFNkh4u8NTGvPps+vqrGD+kpu3ByCSdkD
	U1Savg1x8awBYDk166YVnMJkGFScfKYoE7bM6hw/GaVn4Ej3e8dzfBNw9tL/OsJZ0npBggTOUUj9N
	j9Hg6C0VhH5OH2RFzxy3lfM0FqNXTZoIhS09m9sA5wm3LDzQI5mz/NhJVDJ85Bo/tlpUCXdaLQ58s
	8I8xDa9yEOb/tYEFv8vn1u6I2+V8i6t3f0LOS6O9u4s/m+8fvsqGDqwSsADautcRBcCHHhpAZhOQo
	yDZoC7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgQI-0000000FuK4-1WSZ;
	Wed, 07 May 2025 15:11:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfuV-0000000Fohb-3jmD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so8423335f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628690; x=1747233490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gzfb6HckY9UdtJPRmS+pKyEgA39e1sxVd+XOM9U62U=;
        b=EWdPgepsOiVYGrkruxA3MztiGRomv2RcVfjCltJRJz+YVaveN/VC+QMBdKz71e/y2x
         x6SXs6mBpYeNGWl4jez83h2VDyob2O3M9jwUnuOxQJUIJ1PpaS11RBAV1tKi25oZ8FlD
         X0mfOg2XNikgIGS8AVfrD96h5T+IP5Hv4oomO7D6x9YxMNM8OxAgZBwt9YST91eOkk+0
         56x4LBXnjXIFHvcT6t2RosjBp2cbsK6RTS6irYq2lmaXcDhYRGwOtXoHkwFHBketRXLs
         0IrLpsLwv1pdxqnomoyyI0tTNN/mhSHgu5Limsn3zbEDbtzMmoXCdKOHAJ11cpY3Lev7
         jCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628690; x=1747233490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gzfb6HckY9UdtJPRmS+pKyEgA39e1sxVd+XOM9U62U=;
        b=n1gbhjQEdYgsY8IKttO183bzYhSqCPL/sAMCjMDZSk/ICy4K51IGnMKMtYxj3hGM5u
         JellsLakaIF+hTDPlWrFR4d61jB/W7Qjjc9i8cknyx3t2/MRyrPm98sHP7F55RPc+QgT
         KU8ZX6gYImWUgTNG8aIeEafK6nSDZ+Ujd4iWAYU/b7o4yld+jyjDnTe4PUoauJyLa839
         a0QzS+2vZ7dpS+c5S8UrkDHmbRYRGujt5s629oqF9bKvQRkGvd9EoUfr+VbBHv03aaMK
         Wab+Wt/rstjp0vN8G1OudXsgMbhMCHxtupgNkOfXdyPUl+mHlel05Ldxpw5J4Zjvj1g7
         hVhg==
X-Forwarded-Encrypted: i=1; AJvYcCUpxxKmBmslp+bdejcna45kKi687qz2tQpHZiirpFmuVyziPIB/31rxP2XmKT/QcYLtbAS2Kg3pKCIa7Grma9cD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvexen3XEEWjLMN9RZSKa69b0taJUvULDvZV8HMzAe+8cHECa4
	URdbtZozCM+MD3J95fS8Hd211H1lMT0JZoUjJmeYlAXLhofQw12YbP6sLA==
X-Gm-Gg: ASbGnctUqhqnhzM6q4rE5Li9ng8ArHjc40AWgLUgVXCtQxcYFrBgUC0c3928HPUW6fU
	0qzygA/y29z770pDkPZa5qL6U9z5AQrhJhoC4il5Okl4z4xNJ4fbnVSSTy1cXiNwy5gcVV9ICAD
	+kveyCsRU4wdIeAyoL8CXGJdFNV9rcrFcoC8XnCpyC3aZvqab3dzscJltCUvRvD5IuFFl21yTqx
	H0SxG4upErj+pu+mR4UCoLSCdMPiPkwjs6z4I4CdwrevcSjF8tTXTM6/jICTw+e/u63uIKiecx/
	Js0cfSk5AKerl4Avr8jrjPm7o0NgdsUs02YKl/gTGfZj2F6K+sfiOpTACqBWc2iEV9haw5EjBG/
	yBWyupRzyLbJqZG5xROMhDSD8Ft35KX3g
X-Google-Smtp-Source: AGHT+IHGIVl6XYUEA7AWDEFbYtJkO5/zuXOHWGsE7GNB3B414dUBW633ES48dG8Ps6rJLbFr3W+SEA==
X-Received: by 2002:a5d:5988:0:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a0b49a7f45mr2923886f8f.13.1746628690510;
        Wed, 07 May 2025 07:38:10 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b840737bsm431253f8f.67.2025.05.07.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
Date: Wed,  7 May 2025 16:37:57 +0200
Message-ID: <20250507143802.1230919-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073811_926103_1966EE05 
X-CRM114-Status: UNSURE (   9.34  )
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

From: Thierry Reding <treding@nvidia.com>

This is an engineering reference platform for the Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 65e0ff1fdf1e..cdf5a730d8a9 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -245,5 +245,10 @@ properties:
           - const: nvidia,p3768-0000+p3767-0005
           - const: nvidia,p3767-0005
           - const: nvidia,tegra234
+      - description: NVIDIA P3971-0089+P3834-0008 Engineering Reference Platform
+        items:
+          - const: nvidia,p3971-0089+p3834-0008
+          - const: nvidia,p3834-0008
+          - const: nvidia,tegra264
 
 additionalProperties: true
-- 
2.49.0


