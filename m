Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmNfwSAKSGPZhhRnskxRS7VGBq4lfQUQS0GhmNutj3I=; b=2//UgsVE5i8mC0mPT01e0KpqLs
	yAYy3TfgGKP5LXw55n1u+XidYMSWmPQt6SI5dg09vSnO829hYRaBexFNWv9PkYhE15EKdnQVhFysC
	U554aa+3c0Hr1pNBiZFcIKj242+mdqYnQgDzswKCDigMFvgsIT9Bumy0ty/kzMsl8e3E0snph+FOO
	OdVH2abZXp/kHYSKGA9WjsO8VhZtET0+7An3tiwfPIxY8uCuCT6428IBRAdG+U6G8Qmx7g6IlCSXM
	ze2iifWU8K+yRJC9qfmns8dvvEYU4xj1aHupeEsskk8NM5goyiZokq9irXZ1o+APGesbq15vaTigg
	I9ZcwiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS1w-00000008jm6-1reh;
	Wed, 26 Mar 2025 14:46:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvF-00000008iRO-3FO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so50710705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000000; x=1743604800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmNfwSAKSGPZhhRnskxRS7VGBq4lfQUQS0GhmNutj3I=;
        b=BE1QdX3aeynhqxQRQscgLwMrB2m5w5VrCSEF1md7hbO4Mm930Y/Zn0tnczgewvX7t3
         ZeXRZ5yjRbuTkwZ71juoprk6UI34wTMDQMkIAzeXptW+XJHTDltuzvozOliF6W5rf3BQ
         opMUdt870s4tmJVMScIA+xkQnvAfjWQBiIK2tVzlEYQmUdx8TRAJJV9RMl2N7vYQ2DyR
         qtdV9TDhxGwcrI/AaaxIKRh+ma/DEKECWMxhdL/7T7850GkhX7j0vK/gYaMkxHqE5f2V
         dSPptyf+O/EwOcEKOV5jRfH7hJNjzsbQQZjNtq+qfriDLKAphvjtWARZ/JISGYfo2OLo
         kiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000000; x=1743604800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmNfwSAKSGPZhhRnskxRS7VGBq4lfQUQS0GhmNutj3I=;
        b=vP8C37izTsZD13AShAgUv9PizZOxjRH4M9yFeVtI0w+ZBhzx/+e5mCkBbcmk93jaVl
         hqDtmfNL4Sn4bIEOLhy4ZEH6Jj3TUD5uKhSMyT20+Eu8zki6Qim2XYge71ELcO6TERmv
         1o6Q5MFf8SoDKU6v3vXLCgIwyQJHKsmUo/DLNINrg7kpDkAFnSz3rFvcxcE97cMKp/ho
         clRI9hImWRuKNlSPId8gnGK9lAKdDWEdjYosoJXm4nueE8CjUO2pqXfBeBAn+Co+y3dT
         ffgPslpyHGLuI4a2symfINVFFo2W+w3z/XSUO3yeu2A9Jv47c2oE5v5G4AILLXTmF4qD
         3Tcw==
X-Forwarded-Encrypted: i=1; AJvYcCVwn3/NiVy3O+ZcPttU58Q1IZ5hSf681Kk4H8Jw1R8Az1u8AvHRHps0BjkTtjK0ZgrDAfPkFDT7ukMh6wF0HBP4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTseT71XEhEiJaqSubvdB6wB0IM3Swas9v1HUPi5zY1uSTvDHe
	ptdGVFRI3iU4FZNlF+E7G99Y0hax9bCFtr09oOpL6EusvovOuhJ9
X-Gm-Gg: ASbGncu0GNPHk7vBmLneHGrWN/5yHmaTbjuUJZWysqVMLP9v6oaz6yirH97nJ4yyQNL
	7vEkeuY0QurPSoUz1V4Ln7IzDeS4ooqKlP3rIX/xw83GAnhXyIveaK3XASDb7X3TsnGE2iD7ckb
	mp6ZOCjRMDZkLisvL+TPTqhxlGMKD5YyyBph9/LpSbTBpoGcZmdLXRGEKbd9lByJW5qjVy9OW+b
	H2xUhA9EaG8gvljXwf3wxWhUxOVItlLzp2ylqjn28TqiyTqBjqbbN9gWmkSIcJts7Qcw0aAR1qM
	IWbUFsrbf+rPHG3WxuvPcDKJfDDxWRPLMgvagy8dNmb/UWeN4rtBUiOd2Cs5brsxE1LC
X-Google-Smtp-Source: AGHT+IFW4brLWtC9uniriyV99C+jcMPdP/8oJA+VeJMpM/RrrFNh6VS98vM0nsOkR0ZMiWAoC4oFKA==
X-Received: by 2002:a05:600c:3c9a:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43d509e189bmr202063825e9.6.1742999999885;
        Wed, 26 Mar 2025 07:39:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 02/15] dt-bindings: soc: renesas: Document RZ/V2N EVK board
Date: Wed, 26 Mar 2025 14:39:32 +0000
Message-ID: <20250326143945.82142-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074001_818642_2104E324 
X-CRM114-Status: GOOD (  10.45  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add "renesas,rzv2n-evk" which targets the Renesas RZ/V2N ("R9A09G056")
EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 3e61ce372a57..3e3987c9a82e 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -553,6 +553,8 @@ properties:
 
       - description: RZ/V2N (R9A09G056)
         items:
+          - enum:
+              - renesas,rzv2n-evk # RZ/V2N EVK
           - enum:
               - renesas,r9a09g056n41 # RZ/V2N
               - renesas,r9a09g056n42 # RZ/V2N with Mali-G31 support
-- 
2.49.0


