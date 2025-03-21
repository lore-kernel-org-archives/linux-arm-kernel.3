Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CEFC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LoofhK/wQGr/+9KAmshAJ8mFNKJgp9hRkahBUOv2q0=; b=lSGLDWutklh3NohtWiOxGGS7Yw
	3Fe3h1Su7bUTgm/b6yuQKZARqaXPC2vsH0dPYiCzIrdex3U2aIWleAxhX+buLINpaMrbH1JYgK1FW
	XqEm4P8uJvwTK5+guqf2Y8JzQshtkUEzE/G+RqQwcHy04FuarRjd09jrQPb1U3RmF4OaJYjjgxEJq
	oSXJCKpSYFpqP8CiFv2QnG2f1I49jbWz5lfxvArSiYaJyq1y2zPTckSvRmGORIclAhvJarreqkk3C
	fpdj007VOCQ6uhUMVNFIABPAWWxilKW/dYFb9bqXtvrLf9qroFy6S75MP9HpNzOmbkg44TkxF/HYI
	RyTlms5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdfq-0000000FBcA-16va;
	Fri, 21 Mar 2025 14:48:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdXr-0000000F9cC-0nBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:40:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3913fdd0120so1239728f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568022; x=1743172822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LoofhK/wQGr/+9KAmshAJ8mFNKJgp9hRkahBUOv2q0=;
        b=FAZLVCtrKH4pjyFNgLeWJOZKK89BVFmg7RI0B/Gb5wZmyD9/u8/qMDlL23UBQU0t9A
         HbxaJjeiGVkK8eeHaPApLsJ67k/ljlGwaT6zLLptNCmZE+6SDhpf1i7vaIVXz/GM8jnU
         cQzl1DGGQy/OYcGmGqzuDUuCTVuzXRbN8aYpxuwofZ9evm3cL54tg4ecN9wRRoNf8cRU
         vVrOP59+C/rjnj91UmUicdmIrbb6rk3rMLOFzCIU3zrxet9+MMNMlu/Kwda/8LzxI89q
         zHEq5W6cKt9kUulIWziWCuPshY/eRdBILw9Pf8dfT5mTY7jmGwYKS3HlAu8NgpZlIhDS
         XGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568022; x=1743172822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LoofhK/wQGr/+9KAmshAJ8mFNKJgp9hRkahBUOv2q0=;
        b=TtaerOwDMgzLb6acSlkYoTOjsUi+3adJbvoPschjb82YTHJII9NI3qnqyACn1L0ebI
         n3ar5DTFUmQzm6fDurOaeW7y17RQd9REdBjZglv1oBWqjDBuHbh8KVW8+P3VfIkfwB7H
         i6Buafjc/mt+Wb17L7BGv8pfwUqLFCwSeFyHDi66WbvfmCDvso7xiFEOuZlHJKjUsraH
         IozDVbtbFcp6Qux/9Pim4I0UX+eTxOEXJca4+LlyDICT7775clxoxkjj/p2W31BT1hUn
         fG6wIskMlKrb4nw7Ulyls7R8jV9ynFnLSB6hz1UQU5NJ9p3Do09/BtCb/XE4krMk3ygv
         INdw==
X-Forwarded-Encrypted: i=1; AJvYcCXB5bjSfmzWyZHHvLxco5Kv16DvFYHhyMUOcuKJQBh2vtMw4QeuH5BZZ1jWnckGzEPJbBZ0o3ersJjRxclggi/T@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVsNVrdHcrYUYeJSZqymbEOm+JDsDTCi9uM/dOf5VeSY5akev
	FiycHPB2XZZQVOQGt8xWcuQkgUZ0YI+yRsvlCj8pt+Y//CfVOBLZ
X-Gm-Gg: ASbGncsTD5Q5B3GjXE/zfrh8/3Atpi1/K5xRh74jM+XGqBaxo7o4K/AcI7gx2KzfecC
	UG2GCtGiBf13AdyI2bAt1U5HkPg/1wFNNYfgLmd0NMIhEmL7jyI9Z2uCBEQ0BZD2FxXWOkKBQYY
	NxOHdbkbrSyyfYgWZJlWM27Xvt/EQ2yqUQvS2q+SfKfJ9sGAyp1JxGkbI9RhAn6T3JIZ1I/xZCc
	bDu8IM+ui5JenfbyDZ2yUbKIsPA4P27HeZW6GzIA5/UjyfMdWH+r2XklT/r2bUC0UNMTOYFagZg
	ef94AKBPhZmdnBluPTO130f8gsYGtIKamldrVasr00MJk/R75uNkczo59FpRIdhe9uW0viIXWYC
	MQftNiGNjpIDG3aHkzhxx
X-Google-Smtp-Source: AGHT+IGKF0/9vMppFQXLfG3fhWhSIXTNDv+iiIejYeyOQ7CuA+3GXv5xqTcwGc75uj4W4ZUzzSuDhg==
X-Received: by 2002:a05:6000:1a8d:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-3997f932d2fmr2949465f8f.42.1742568021582;
        Fri, 21 Mar 2025 07:40:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Fri, 21 Mar 2025 16:40:15 +0200
Message-ID: <20250321144016.1434848-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074023_228028_2CACF61D 
X-CRM114-Status: GOOD (  10.24  )
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

The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
the existing Exynos glue. Update the dt schema to include the
samsung,exynos2200-dwusb3 compatible for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..679088c91 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - google,gs101-dwusb3
+      - samsung,exynos2200-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -73,6 +74,19 @@ allOf:
             - const: link_aclk
             - const: link_pclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: link_aclk
+
   - if:
       properties:
         compatible:
-- 
2.43.0


