Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D1CD0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXtQqg3yJgLl+HjnpahR8I/TE+d9AkhS+y+OvbC+UXk=; b=opywfDHPJDPFuCxj5d5/JSSfsU
	N/MQfid598uWk6/oPGr01qMxpDLsw2p6xbwTCzbfzt1uAS6TmO14TDHyxgVTIJC+a6IkoVvPG0xG0
	HIieJzT8Y9SX/6QjC9JwzDYwFJOq7rg4qnqFa32Y5dp+YdS7AxDbLu19V4c+Hjh1TFJT3X9k2Upkw
	AXzlaCnTMEa5HB16WnnIDBOI/F3RALn286phD2CkIae2MyBsQcph+icX00g+SEFWbr+/J8z0V4DUQ
	LaKqvY9ZK2yJqIGyIGJUFQVHYN+2Sb/atzb3KPxPC0LwZaivYl5gFYi7rNFK55hAxyqMx1pA7k+aB
	6YP2R0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k8x-0000000G9nC-1bfZ;
	Wed, 23 Oct 2024 22:47:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyk-0000000G6xJ-3AyV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so149035f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723040; x=1730327840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXtQqg3yJgLl+HjnpahR8I/TE+d9AkhS+y+OvbC+UXk=;
        b=CK59CH2Pl1ukhSyCv7sIgWN1eWymBpnsyHShqv3VfcwDmLn9SlJDOKckE8Fnxyjye8
         LORBnZuAYK1daQg+/gVpSFqDMhylW9SADU7OOdLnWGNGMSYA/eTIyq192XRSOynX88iJ
         fVBlafbN1zy/0n/pwM26v7H3P1RZDzJpG1akySqOJHDqBW5kj12jUvB5ffCjHtb4c+dZ
         muiWVXpIdGqRqlzkqfc6MPkRU4CXp8mSc1xPxROzx4K55hp7qqK2yw+IvLj+Y8QBYkC/
         ktRxcgMam2hoYJj+vMjebsrXXgUghE58/oROIyJfMYO50lGK7y8pvwgOZncXTdRf/s+j
         cIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723040; x=1730327840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXtQqg3yJgLl+HjnpahR8I/TE+d9AkhS+y+OvbC+UXk=;
        b=lrTsFV1bQ92zMu2WlkoeX5RDcjc3m43XnyV3U8j3qKKLbD6w3kCNCAHOrE6iGc9uBo
         8zCu419mHH+1RK5rp9j5oaTT1+Buq1d8bj/cF7gLjKLFuEvl33Uq7mIgcLML0BwXqGVG
         9mqwc/7SDLo7L3ORR0MXaf9FrHqe1SkXxgYi44wDeE0ivLuvT8yDRBFeCZflMbFGmaCS
         NFu5RuUIxXX/T/QY2IbziTfUI5SNTw1/b7XVEdp8pQzyZvXyECjLFBpnBMYoxayM4upQ
         sC7icm3Cq2bbJZZug/wVJ+z2svCmTEG7PAYa9KZr6zyEMLZUFEAyMYdneGeMIm7EF1IO
         uwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOw/r4KXbQhsftKR2hQAFRqyPT+ywH4sU+tg6KumwtXT+rzzb6N8nSM+upbqcMPH5POOvAcKlNf1Mm6J8MFOQo@lists.infradead.org
X-Gm-Message-State: AOJu0YwS/vZvl64ZBmowDZL2aS2OEUuBLi01VEig/LL/tyZBMlXvTkE/
	DaNy829F/zhLJNrsiTK59arQrN51cdroejtrhU7YGgMSzXW07pbh
X-Google-Smtp-Source: AGHT+IEv1LT3aXWNGlfQxfdfR1++WDJp/zgt5i4LxTmGAfPafps4VrBKGIrMxV1xd9yfdRIJxSyeHQ==
X-Received: by 2002:a5d:46c6:0:b0:37d:2d45:b3d4 with SMTP id ffacd0b85a97d-37efcf8530fmr2600249f8f.52.1729723040279;
        Wed, 23 Oct 2024 15:37:20 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:19 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:36 +0300
Subject: [PATCH 05/12] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-5-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=966;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=PQY2vvSVvdmqQTK8ZrI+efD1G2TGl0x3uNfjf2Z5EVY=;
 b=OH1oLPoXvG7knPESg/Z3HUVLfSYDzQCUOPxLstHrQyyXHOQDNxEkrMjK/EUc/OUpMOVfIWGQK
 90hki70VyyjDgdWkuFx3nYxNtPuJU7T0Bh+EtRjfAuB4uV79nhP89My
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153722_831860_3B078726 
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

Add compatible for Samsung Exynos9810 PMU to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


