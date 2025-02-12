Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C73C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTqxdDwhoyrkk0ykc+A79xarZygYOcQGT3XPrS993bw=; b=bAwmz8sN6RaMGcri5z9kJieboe
	zto35R6QPI5w96lVmU6S7tjCWDDc044NSmVKIkUyCwYJVh0fbeR4MD1JL3VdGhTdU3jyz+WkpZZtz
	VaHs/QB+amjavavJjwaxPELRvJm4WABXB35xRLjAAwS7XPOFVGRz/pJKz2V1zy4l8ivTSpmqQaxd1
	H0moEiCIOkGAByWmGDqZt+r+FFLNMUcdxO5RMW0r19tOlj5Eru/B5XTqZ98BbhoTbHiGcp0fk3p0f
	zasWD5yOugEArKBkVVd2VR9L9DBZWGuPkHULWp2+luhdUsVjrD8HvMDQAZIpL9dM6L8O4tSv8zGSZ
	6EF3z5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMPp-00000009Cks-1JJw;
	Wed, 12 Feb 2025 23:45:13 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMLi-00000009C0L-2c0C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:40:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f49bd087cso3492665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 15:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739403658; x=1740008458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTqxdDwhoyrkk0ykc+A79xarZygYOcQGT3XPrS993bw=;
        b=UEbCLHJlKnQSzbMcVqbGsxUWb1lStRo20YO5sQaBw1rgX7lWEbUKQHe44ius7W5yJR
         rYQyinsGauT74wT29MsyuWRILnB3A4PZHmF4ea/g8dT7UoHPKZOadCO1t86SeF0Aqa/Q
         Z4s+MOh6e6vUyr6Nt+MTERdwvPXg56GCiyVKLKkvgesAzC5UvC1ZU0kbOHj12MDIdLbl
         cHg62s/IrAuqYZ/j8XP5snEN7QecFOuWTvRUSeHQwozueL9+hdG+lRzn8L5RF/TW9Isd
         2FRLRCgmgQPgMQBTYF3ywFraAdMPhtTovAhK7rR2eAnXJ1DdF3MEyuAcu+XEe2bEtE/S
         HcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403658; x=1740008458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTqxdDwhoyrkk0ykc+A79xarZygYOcQGT3XPrS993bw=;
        b=np6E5ma6da+DUh43CW0ljnnkkxXARwY3hvZruLISoRmUZfjCyEMLX/R7I76LL36/70
         it/GfuddHjtlnNbZiMYR4oNord9Zz8DxXkQkuir0HuNaCYF6irEsGLjdk7gS18mJig/X
         EyJOEypLpkPO+jzni0h5x56rC4XfLCZP4W8K1yq/bDvjP9y5rZjBuGK1q0b0kyiW3SIm
         /oqT9c2qWTHRHcj4n4WckY3czx1H1dGwIC5GnzZKOZsD9deO1oINCYzUATGqXr+25Ej1
         f97aeMhbpmSsUZXENlP64OqjtCXcJAQWyAzHmgKRuSwWblM34oVs3Wh3ooV26wKyAoWj
         ZRew==
X-Forwarded-Encrypted: i=1; AJvYcCWR7TabRKvgkMeMlhqJBNcKBouAXBC7sKgcuv1+aO9IIpdlQkhY5ysM/Utn7jo+pqV4xccZ/QBfoo0yQqMDDNQV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+SePTOJGlduVRjy4g2eEgpND1F4q/y6CeeEAyw5/FsIPagBBF
	XZKuhKWdA0Liv5u49iooOa/StSlgzvr8pa6AWvhOul6CpDyiB4Xe
X-Gm-Gg: ASbGncs+BBCzNbzH+7sONbgJsiptbT3m/gqNw+81kHZUpYntG0+tFSiezgvexNsguUG
	JNl7MjWMn7M2hFQ6shn/rihkmSazRC7RcSCoZ04fdpPjaouYQroSfQea7d0WEh7Wl9BJdgpH4PF
	vSxEeN8iWNB1AKHZx8yWa/jdFEU/Lvi5m+UavYkqQu3cQMmoiOicNJYpXyuSXtAvbJp9gC5bVCA
	d/T0cR/J/MLoDJ97T3Y5kt892WGm3fec4uC1Dm8xUURYijKBnm7g0kOlJUzqyoqyfMnzeLD5A4N
	ldKlM9YuNZrasY7ysGvymjOOElxLK5KUiE7ehc+W8IklmHlTiVNbUN2H2AENTaJPM4NlPNRNBQc
	mzA==
X-Google-Smtp-Source: AGHT+IG6x3yXfU3f1EnojPK/KNZbA3fqQ9DGcNn/oJNuX+crs/iAAqwec3I3G8I+oShWxVuS92ppQA==
X-Received: by 2002:a17:902:f706:b0:21f:7964:e989 with SMTP id d9443c01a7336-220d2368b12mr16223855ad.52.1739403657662;
        Wed, 12 Feb 2025 15:40:57 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d021sm964155ad.157.2025.02.12.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:40:57 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: serial: samsung: add Exynos990 compatible
Date: Wed, 12 Feb 2025 23:40:33 +0000
Message-Id: <20250212234034.284-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212234034.284-1-wachiturroxd150@gmail.com>
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_154058_658295_C7E77E81 
X-CRM114-Status: UNSURE (   8.71  )
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

Add samsung,exynos990-uart compatible. It falls back to
samsung,exynos8895-uart since FIFO size is defined in DT.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 070eba9f1..f38be8e95 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -28,6 +28,7 @@ properties:
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
           - samsung,exynos8895-uart
+          - samsung,exynos990-uart
       - items:
           - enum:
               - samsung,exynos7-uart
@@ -42,6 +43,10 @@ properties:
               - samsung,exynosautov9-uart
               - samsung,exynosautov920-uart
           - const: samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos990-uart
+          - const: samsung,exynos8895-uart
 
   reg:
     maxItems: 1
@@ -162,6 +167,7 @@ allOf:
             enum:
               - google,gs101-uart
               - samsung,exynos8895-uart
+              - samsung,exynos990-uart
     then:
       required:
         - samsung,uart-fifosize
-- 
2.48.1


