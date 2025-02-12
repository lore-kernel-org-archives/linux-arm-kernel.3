Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697C3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZXh53n6VCDql3hZOCr9qqqfbnvH47zg00k2fG55aMs=; b=hjHqL6+6wjJ+HgSaAoemvMth+v
	JY8Txc6sEq47la3Ki6Ra15Vp9eQXNWVzpnFYqMj/9ETOF3BqxVJTA+vkaXe2QmeUecZOHH8KxXX0X
	gQeoKJI76faYwTGJqHmJ+njv3QSdDoy5FrDGUBPHWMDpDAe8gZKzHYpxU02MaO/Wy9js2yjh36Yyb
	LC5VZE9k9sbnoMltfpU6oXmxFaBFTEv8LcnepKxRlI492PR0VGyR92sQIRGRvWHnICr1gsxistnrG
	ytoAXjzCXdsTXy3nBaSxicJeVs5Uq2q3XJUOlEhChAc/O+V4wSObnQHY7oE5yH5hOAwQfuZ//BW++
	1KZcSD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLVP-000000095BE-1xvM;
	Wed, 12 Feb 2025 22:46:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSY-000000094dd-2sXM;
	Wed, 12 Feb 2025 22:44:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5de6069ceb5so2357073a12.1;
        Wed, 12 Feb 2025 14:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400237; x=1740005037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZXh53n6VCDql3hZOCr9qqqfbnvH47zg00k2fG55aMs=;
        b=Bo6jj6yK0jcBoq8LXnrc+kn9mm171gDZU+H6e8EUnpqDm0kYUaCExyY6D5oZZLs6XU
         Ooj7RZFya2lj2B7mCn6XS9g3ySUn348UyufhDF6gxA8Jg7npJS7XapUUecBmNzAv1lTc
         qbucB9ATVukKK7plYTKDXwW6ljqwrfX2058KXXK3WDL3pbTReKNgHenDDLRL/Q3Fhb9V
         hXajuWHA3gKPtdqKJzmye5oruxd8wtCW4GPX9srcVSC23abN5wh3aWJCbv34ItkkA0be
         syLV8jledXo0KSnrO7C2aiBA+CndG3w5uPk0EXOwafdQjopnA5q1jLeHFWSvbRNZTIwa
         Z7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400237; x=1740005037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZXh53n6VCDql3hZOCr9qqqfbnvH47zg00k2fG55aMs=;
        b=klmphQU86cETUEGvkr61c++98PVkBW0eUd2AsaL2pX1ytGMMRn+llc2TS2h2aOAtOq
         J6tcni6R/GNtFfCoorPboAOUpuybr0+VxqAQFHYzSqHcEXwfS06LfVRKiFisCkjSGSi1
         gYBv2Ap4v7PCrcibmAJCqpLSRp7rXUOBmoo2syVMV4A2Zyg6naccFxflSkpH+1LmuNNC
         dqTEQ7SIzVoJkM2zSHlZOK7v3PySumbSKyS0CaBIn3rBPYgf4Wu4TA0nw9bpPf8tSqhj
         actyGeQzKBgIR9f6rQhhKwvWWMj3ceySeU8VRA/Z/wBdt49rRP0VAd805VIAqgRfopkI
         vBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVJbmz2PfxFW8zBRfrVO4CrL9PdBRLv7YLoIP6V/9ffU6Jzn5L3xxOJGGqUL+rKC03JsFKcXCTVarTRmEZ8FGMM@lists.infradead.org, AJvYcCW381NEMJWVha/PT/3gSxoxZO6P4WND1vBBw3BdFLV4w4zJYX0b49Nr2OQkobihQlSx0yX1SQ6B1KjuDdk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9YoaJPQ88DWe0GFR/pSaqzcivyWck6AQJAZtKEv/U6IU3pLzW
	8k1toS26SK2mYl8BYmzKRlhYzI+oehjFgY/+B5SGZDaXwaBfeTTF
X-Gm-Gg: ASbGncuA8HEbRmrRP8FZt/tQW1FgsgY5mxu+UKslBL3aFc4wb6MWbVs0BkIuocWOQ7I
	sUuNzR0TfvWjd8JOzKpy3vkZnpN6Z+wkeBouxHMmi7mL608QBdPEujTWoZzBuUzS/1C6JdpvPvp
	C2Crd3wKyokiBw8mrey1xmM+dsNekjS8RUxiJR6rbE6wd89IjAsrkL/G4Vv2KjHN6LaEwLK4cza
	XyPX+Esy8/3TC8dtocJ9Hzq6Fg286Wm27MuAsYUJ56OaooZNZ1qEtUC14raV8X7lRyqp7utqIir
	VDxfCYEcaEX4pI7sNDBJyHQdlsXT
X-Google-Smtp-Source: AGHT+IHBmtagS8Rywtty3nyKWJ5uTo4mUVNCLeloZZ6MDa1HOxfnWgqxmhF80EhBNTH3MA3wmgnX/Q==
X-Received: by 2002:a05:6402:4316:b0:5d9:f0d8:22d5 with SMTP id 4fb4d7f45d1cf-5decba8f0d0mr438452a12.13.1739400236755;
        Wed, 12 Feb 2025 14:43:56 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:56 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Wed, 12 Feb 2025 23:43:34 +0100
Message-ID: <20250212224347.1767819-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144358_722082_5A0BDFAA 
X-CRM114-Status: UNSURE (   9.02  )
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


