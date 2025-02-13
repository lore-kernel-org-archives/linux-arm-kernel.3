Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D59C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrgHxkjNu9X/Q1hrHUQlLJCmY0Xg+cCRCTLN/OZ/kLg=; b=4YAnmKuggt3SGMOze2ja+iJj3v
	sHIdEqEIS7VC6R9/xZNMwoJNtvuMpbFVSD4LjTQ0CQ+8DXasnpm7ZXRqHIZjqTkzUco/7wFrUyudA
	+j/DvYEvLSLtV6FaphTUEkHK0GYIl/J7oaBCfWpJni2FX/yJhMLOqBWU3b1NUAoWCUdnqr224sjG8
	+WsuC11LkHceTWYotFVORY0P6y4yLtEmKDTeh+vXYdNos+F/Cf2QpV3O42U4iMQW4G8BkYqNTv537
	RMuQvhI8HobFIT6Xn4HSo1YS63wseWhJ1f0s52eO7ax/VV5Rm1pj0kYGhbwY3JK3rVlKiXuFJGQ26
	T3JmQu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tierS-0000000COVJ-1npJ;
	Thu, 13 Feb 2025 19:26:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqs-0000000CDBX-2rB8;
	Thu, 13 Feb 2025 18:22:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so1781644a12.2;
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470937; x=1740075737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrgHxkjNu9X/Q1hrHUQlLJCmY0Xg+cCRCTLN/OZ/kLg=;
        b=GLeSSXszO1CXloVuNjJcP++WqprPiQr9ev8t4uspI2rc9RILr31f7jUYO4WhYcnCpo
         FoV0hllX3L5holL9BBp0uIxKQJ8JsalP7mxeiJCJrPrf+C3WuZKX1+41pnPtKB+jVLcj
         GlTnbh9p1KE3RUSSu+PMVbIo1JfIY3yU1+Zd8yZsxJLVdOo9qztzuzSN1vnX6ls/uwhP
         ZjmiwBWPsYGzg1IpfAo97eskEROKE4+f/xzw3JcxLA4+G092KJvvJIFutfP9F+8HfZtc
         K6Tmq5FA05/foZ73FKJ4Nrm27nK9PRUM5kmIHda+9zSW5QHfWxgUqL6h3xqXupt4QcRY
         Qbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470937; x=1740075737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrgHxkjNu9X/Q1hrHUQlLJCmY0Xg+cCRCTLN/OZ/kLg=;
        b=vIDjIf74ZfERCBlc6I2X1mkRWxSIY83JbUZMvkxiquZS9DkCcIhqHffg3iUieS24zS
         noAgAhKxmvYusiEUVl9YtxNJiUxWBKvLTIhM0EztexEx+xZXVGrJABLvTwr7WLgpdnTx
         qTUupw5DaDtRaFeG5dhKWzs4KXYTTq4FwhmwUPizF/FY08jLyXWt+4uT0836vHuW1mzf
         p1WCIS8PIT0XXAel16MBc+uyPZZbMIVe6d5QH3FhPdkVMek2sZs3rTQG+PhXBzjZBEHp
         hmUd9fBDHKivvFO6sXcITYq6dC7dPKVunJHlT4dYTXcoNVFeDf5fdVMmIjxBCM19itfB
         Rd/A==
X-Forwarded-Encrypted: i=1; AJvYcCWiTi7V/44dbsKiABkNdUZkUajvt0uNw+r7v9KcUDFHvMVFWtGFne21tkpy7ZSVu1wH5FdxG4ril0aIQ0B6hOKK@lists.infradead.org, AJvYcCX1QYt8YyUemVRjY8INZPtAEnulRKhX6LSCGucq7ShkyrOVhpcTheS7TCjE+lAbAMe0BlmFE/0yRupMeUs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDu22agCiZItiRv2S8naF/Qwu1OQUtq3n/A3OP4+xudEGl/vs
	IUl7OllXq+7b/k4e8lR+J29lNm80TZIvHpUs95Rk2L/7LAY7XMfx
X-Gm-Gg: ASbGncuYsYVlUwu/RsE2cPpNSy6S/ndhKOKwBWP7fv6+OgJ+5W0yy6zkYCcwhsVH48t
	oXnqtU46WHWvcZssAG/LLWgDWMLaJDN84F+viAYysf6J9kE4K/BmcgtsLNvb25IZIL2qoIwYqnC
	sNCprfxiARzBVjFoQbp2MTxXB6761w/HZ0vqEgId+4aAiSTcCrzT+gbnVU4UfXPKTMdGSvo5WhW
	JCs9whapm7hs/3UAZag1nsHPCV9d8cWBN1DAFAeufl+8I7OpSUdY2kktVJ/e0HBAeB4vrzdT0nr
	B1wAl7RIB6pZSSY0TD2MEFlefKLL
X-Google-Smtp-Source: AGHT+IH/Yi/EFpYPwVBoMo0zkp4iN2ezmFezqDq4NFl+9G7EivdIfhPrP4/hFUgDkeiAuMIpUimZSw==
X-Received: by 2002:a05:6402:358c:b0:5db:f5bc:f696 with SMTP id 4fb4d7f45d1cf-5deadd751bdmr7502320a12.5.1739470937100;
        Thu, 13 Feb 2025 10:22:17 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:16 -0800 (PST)
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
Subject: [PATCH v4 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Thu, 13 Feb 2025 19:22:03 +0100
Message-ID: <20250213182210.2098718-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102218_715204_0ACF470D 
X-CRM114-Status: UNSURE (   8.20  )
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


