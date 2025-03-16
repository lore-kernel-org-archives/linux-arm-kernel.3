Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52777C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzk2teZVxdXMwphTfuXZGFBjNByuLEoXPWf93JJtGZY=; b=Y5oo39wbUVCoj7xOJorFXbotNT
	MlJXoKf3GMs/LjM3efZnCFnw7Bq7n+KY6s2zujJNPRgG6jPMSgwGVpja55nMaIGUD6pAm9CqVkvUd
	0XBEVUTQlb1czAsZBDDNiW/k3mI0QZQjZY/i6Sda9uSnOgxqJaAyfCrHrcqnLqe77oKP/RrSjeWcT
	ACQkJdQQvBeuSjVhuoCBTr+cwqlwOk9aXnxDembSMXDZ++g/0KJ3ayQIaPDMj+BUDbnwkM7xFh7cl
	D7SQNIhFqIXIuASTTcguQU9yoNzZK+8muVyKEu+1P32VKMHnsUxZDvI/+HzkkrMksMlmEP10StZao
	N4jS8VCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttFE-00000000VQU-255Q;
	Sun, 16 Mar 2025 19:01:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAF-00000000UN4-1xWP;
	Sun, 16 Mar 2025 18:56:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7317735e9.1;
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151406; x=1742756206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzk2teZVxdXMwphTfuXZGFBjNByuLEoXPWf93JJtGZY=;
        b=KDKYvHJyLX4PvlCreVkTUY/0xppwUhuQ+EHHsxuFBFRQ4g1Jt8HUK+6O8PQL2v3gpA
         +bhKrolk36GoayWKP9G1UZR/ZVwjUtL9cCo00pfvGNd5KqJf37Cl8oUEVMPlxnNkYD5a
         JGhCNtG5YKmJ1Ge0ScKJElQvgPguC+VfGkykfHs76T8iuuMmmRXvjW8xNYUXhVGwL8tL
         oUa30HK4PKeVDdHY2jPdl7xTzJv5vNYuW47OVznvlxDNvr7NtiMvBUjqsbpHQ53mvG6k
         1GzZSFjSIDeKYvFNoHAjvHz1PxYxTfWQCWlBN6zQQ1DLR5a7RBGeHfiGhzp9nsvWjUMY
         p2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151406; x=1742756206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzk2teZVxdXMwphTfuXZGFBjNByuLEoXPWf93JJtGZY=;
        b=I8IuLF3US/YVGQFu05ElFOiFBnlZpCG/NtU9Tt6frNUq1BbCEjk9/L3zyEIWn0dzw9
         26TUNK3fc8R/50C4WjwAqvGaatt96a+UX7VT7HX+6wCfE5UeMWj+M+XpWOrctAESV8Gy
         4utsRqSavktuPEjQiuKo5N23UvTZ+g+aQfkID96KPtVFEL7oXZJwRTe+vnNJGEg1lrmI
         MGJA745t3eT4EQAK4A7FGglFL39ZCfM3y2y4h49t+IS5pc376fgaaS4HMMxozSDyNg1j
         97/QzjmXnCjk4E5LA1hLjnVSEF77fBwonsXdit5zxV/KVgDW60HQLoxd4aBJbYcLNDAy
         9zNA==
X-Forwarded-Encrypted: i=1; AJvYcCUbkxvwAHCCwJkwtdgxztiuM+Eu52kdTRJgxqoEpeDwuBXpaCtydb5kkyrgbeY9wHpXjqjDBTjuL9R1jL8=@lists.infradead.org, AJvYcCVN+BMNHe/MhJ34NQ4/ZIUQou9BXBfDf1PFMBlNGlZJcAmGxuoDG/tpelGCOrsohWRKwxtEMFqmQo+5PIU4WjdK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1TDYYez3CgPlETS8+766yBMEw1oGiee0nXyu2R6Tfwrek/9v8
	9sLU7tT9HNKLn4aQo1OMZwskmAnwhj0pw6cE+CNT97vMRuNb7CBm
X-Gm-Gg: ASbGnculzYco4KfpafW7bjUkr3GblXBg1p2eM707nslf0WW3X9j9bX+MNehal/wz1Tg
	LyJajXcughV0DkMaU3Z1SsE9EHKqGNIwzVU9dljvTS6VbmCLo9spHElqnXVJNevSpkmlTpYF/7F
	ew3vgCxJWQ4sciEPKWzZMgaFh8jnpIwKvBYuph+Unrbk253diKtCvTsFRroESECXmqqE2QeNuRN
	BvnEThhnl15qOGUTd5Eo8BbwpgIqE4CR1j9ScSWn/azlFIi/4aLo4kXicPngDsOWRqLIC6JxPvf
	rx2jEJWhLeAYAGzQpL3s/2vstJZXaXXtUBR5irbSAtLMr06kGJVtxdbEXw==
X-Google-Smtp-Source: AGHT+IECHd83CexxVzAZ8pNQZPc8xCrp0cWv1eBYkNmKsGFINq/gOCr5P12MPmJNN96+kopi143wkg==
X-Received: by 2002:a05:600c:1f1b:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d24e78c6bmr67452775e9.10.1742151405638;
        Sun, 16 Mar 2025 11:56:45 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:45 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Sun, 16 Mar 2025 19:56:32 +0100
Message-ID: <20250316185640.3750873-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115647_505037_1C712B92 
X-CRM114-Status: UNSURE (   8.94  )
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

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- patch introduced

 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index a14cb10ff3f0..5d73d0ccc547 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.48.1


