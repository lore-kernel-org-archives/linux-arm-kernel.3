Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2645AC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=; b=C/JwxYWeBOiIoe9/xJA+VPKTub
	xuF91IIZ7kYHVxKNdPxC97Z62BU4kqA32Vj0LAUocEYn43X3s97sYcMQYMgN49uD1yVbxCJawY2tF
	RwkOLomQMw071zSNDkNTfIHD9kxPYeQ18WTRmTcN/EZWoK5QV2C49vhYLYf/HvXs3ezwObbL10xJ/
	G1PM+m4yoa5qhMT/7zsnYntDl4rFIzqPiRDn2sz/22T5wFTAmcLYGxagBhO2pcshePy4Z+FOXcX93
	5nXzlimPl1ZhZ1dZLfU5f9/TWiIg4CNnPFCm80BHeqfDUUoDbDr0UeuU4M/6IcwScIYRU+ORaONL4
	Xh0VSydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7n4-00000008HwN-02rE;
	Tue, 10 Jun 2025 22:49:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kp-000000080ie-0999;
	Tue, 10 Jun 2025 20:12:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so73677435e9.1;
        Tue, 10 Jun 2025 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586357; x=1750191157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=US7Ym8cg9TlKmop7DtRCOkXw/2nTxuyVgzqlECmVVerZsv+xnu0LDPsBpK4cvTaixd
         vo065cGXSS8eC7n5a5KocZ2gG2RHs5krT5HyPaK+FzqqbhDHHl6L/yR/MBOYG26QpNQZ
         ADw2Cu6qBverJc5sAMAUbrix2g3NFP8gzvnTEA7evp1BnvFJsP8e6r1P+DWNGE++8rog
         NyWv6vJJ7+urqNKhE3bjlQ68X1FDc8SWEMXtUFZuiRgZC5QTOVrURf/0uZrFygoeHm00
         QA5vi14e8la6JN+NapqiybOOGgMFDJ0u7+dOtAHuwbqfPE5uhlyyQ58jOZ7G26ue9PoB
         fXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586357; x=1750191157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=njfi2R7k88S5o4qFuvIl/Al/cPtERsqFk3yma9xJ3D2zKETbicClNxwMXutey2cSKj
         TT3dS4z4M61FFBLJwqxis5JQLP5QyQcp3H0aE7Q4++u53xnNUr7rU8bMJEdnXnWX2BZv
         PW95f1ev6ufK3IxD/UfbeXq1iAfFW/npqf9hTLDrsnQ8zbfkV6GddBLjfWi5i0mORcdg
         qJdCGUG6ummZN29KEAVIGUEMMzUAUywglunC2RRhzFw4cTuT4RQCu8Nyf8VYlfFHBiyu
         h0mg5K7dBwWiuXMH3EjhTGnI+t0h0clC3ZY4NuMW61Dm2dyF7UA1J+eJs72JwsQgJNIl
         CiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVrTH5525EASVsNW5Bf5X6bDKvz/9GWHeK1TfIKboutvhQdoueM/mxikVOaydnLhnkdyJGiYch9sDaiYxgV4wJ@lists.infradead.org, AJvYcCWhmS7cV85KsZkrA79gjy/5ku4/tAU8IIh0GlBC1Ouz1xkGQL4oksTppUSjh8AmB8+EWsfuyIOvf8kqpYw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf0rSIpiWfSryHVzK3mdHXvzhQ9VzW85tHgtd3cq897acOckCr
	awyiYP1xJTlg2fik55CQ5gtsDCn+cS516cmnNKgsP7NnOLOyJmaUTz3o
X-Gm-Gg: ASbGncuVhnFn/OmFJrmugGUHkJd/8GC9usCtCS5O64Rq1eYrYq2E8c8JRdSCTtz6HIh
	Lo+Do9tfr9EyA/7X8tWQwcD3XReBaclaHQCW5FgbaVyPXlif/89g2vFAbadc+JruGRwGfJ+W42x
	B+xsA9sjMpG+rZc/ESXdnC/NivowaiH+cdcLWKb1WNHJPliqYa+U9MzbYa7+WAgR+nhHMKFxx3f
	ur6fJ8AQmsrycdOZ239R6zvDetzNV7DgI++giVZNGWc68MO/9weRssIEWL3aSwxgSNdiT/UEQbZ
	YbNSHWVy2oPrTXoKaHuKOM5checmk61i5itFeA/yw+pRVi84VzNHv6sB0STocT0iJ1SIwyYLzfk
	=
X-Google-Smtp-Source: AGHT+IHuckGoI1j/EMl7lkrmT2zOOTmsg2Sb/9pg87R2veE+HZJovaI1z2FzlALGyE6dPK28uuYIUw==
X-Received: by 2002:a05:600c:354d:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-453248e1002mr3364435e9.32.1749586357157;
        Tue, 10 Jun 2025 13:12:37 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:36 -0700 (PDT)
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
Subject: [PATCH v7 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 22:12:14 +0200
Message-ID: <20250610201241.730983-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131239_079675_B5386809 
X-CRM114-Status: UNSURE (   9.45  )
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
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
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
2.49.0


