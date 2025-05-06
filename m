Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA6DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QN5rI0CgLZpq9/Ji79Ve/NM8Bwk/JPFOjTpmttwdLzM=; b=E+B2iXO2z4l6G4eU107SpDpFpF
	36yLD5gdhiR7/Zn41S29kkfDWQfiz8A/eLkwIkli5MO7/wOaLYXplckoy8Q34J0se4n7Cgfkzbb9T
	rmHOA0N5Z7AD0IETl4wr3Nk97UsU2MS/xfLV3H0Pvm1LlUjPs8E0ZF6jc6YZ4/AXXf8i6gU1lQZNy
	vBoA/g+UWwhtldZBeZDf1+VBs9lzKqe3zxvL0iFqVWBwhBkJ+dgsok/NL30OI+8aXWQ477xY+z3Yj
	MQ1kfJ0FO8EFwHs1JFFyrHSq2Wm8rEPLNizYNFxqJQDCenAzi3P9vBmLDYf5zwq0oHDUIicmrPVHG
	rYjQMtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ2p-0000000CGoM-3AXq;
	Tue, 06 May 2025 14:13:15 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGft-0000000BmBN-3O48;
	Tue, 06 May 2025 11:41:26 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5f720c717so757611485a.0;
        Tue, 06 May 2025 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746531685; x=1747136485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN5rI0CgLZpq9/Ji79Ve/NM8Bwk/JPFOjTpmttwdLzM=;
        b=CelbsDWR59tXrj2wWn6Ct05VAkKpFT6x6HCXzd4sQkN5muSzrsKGgr/5czGTXVfixm
         Xg241evUnq+lQGxkAGxAqS2FO7qn796vO8URvjagnn0nJgoU99mvFJfYsqkH6brfR4vN
         y4P8aFCLz0Htmb85w9bNhB3DyhDuzcZJqL4Mt0G0fF0aYdLw8yYQKP+t7s9kxPxuupWd
         ObJv4yy9+/OFbmOiZqn135FWomEcd9qegyp2aCkb80ihy0Gn2/XAZM3uFjSTPd5qf7fT
         Fa6MSNq8BP+8vv8hYkGHHJIiZF7BSHe4LIHql2Mm1v8DPqpdqpn3GWR9UbrTnuaACA4q
         00Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531685; x=1747136485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QN5rI0CgLZpq9/Ji79Ve/NM8Bwk/JPFOjTpmttwdLzM=;
        b=bxJHUiiVMwOYjMJHsugXgnr052GMFf/XNw5U6Sb+03jY1jGk57GSvulaX8Q4X5X+zS
         8s+v8esDzsXgeisjyMZKSImxHuI/9UpcdOl/vUsUsYxmn+Lj8OCZOA39cvMj3ra7g5EQ
         jxCf/+Zsy0oIvaVmTcXknLHvo4ub2tEC9l3Y1Q6nQ5bo511Khf9ip+vm9h80aykrIJhC
         fSVX7RwosA9wyfb2Wiw008y9VDBbdbT02Cys/PaGbcoxQ84pZ3r5QrWJVSO9rphcWHDc
         LaSNOI24Fcq39zAKQv5fWvTyzSj1gSVayXnSlPY6nzfXBc8RI0gBYhSvGNrC/knZpahS
         IjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsd+18P95YLleND1+3KQHDiqjYu+tj0sEkvkeOBe9hlTWAzEMmyRC+cFpIa2D5WMZFT/6KtQPjS42JkCymxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeR7htXJdWkqBfwMHuGQ2tYY0idAsf0udiDRfd5oOlyV5M0sX/
	8GC82s+DsF5mI1e60emrTBqvu45WyoJY1q9HpBLkYxLlB1DRjOoS
X-Gm-Gg: ASbGnctUXETY4vbCf4JN0XrWuYtXxlW38Vplwzes6lb9kkeLjXf+ZXYZcq5tY2Xvjya
	mlEd72E45u7UbpTKFNN8ugXCieZ3Uv19ZvgATJnB6hjd8i69ZZH5BSkv8bALvx5XGOCitWtw1ds
	2+3U06nuBIcaiDfqYLVirzvFV/1qFm/bo4bChFA0nyhfIXbiaLtnX7v8NqQp8CV1P865f2nOfGn
	/x+fsb2BgmFvqpg4/j2/tIORZTQQYpX6bSJLmAluOuZ+fDvihRab0lH16wGw4CRtUrN7Bj+G8up
	dLcFtA05ZZH3qhm+9BSodY2b3GLM16uaL0ikBCXKw65XX+DrTkvI
X-Google-Smtp-Source: AGHT+IEjFLZCSLotYuzVY2pBtkU5bzYaL7j+EE0hhEiJ+gFO0I07P1NMKS/uyWME7wRiKdFGKseMAQ==
X-Received: by 2002:a05:620a:3192:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7caf04a7bb3mr560350585a.2.1746531685020;
        Tue, 06 May 2025 04:41:25 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b51f9sm697408485a.21.2025.05.06.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:41:23 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	jonas@kwiboo.se,
	frattaroli.nicolas@gmail.com,
	andrew@lunn.ch,
	John Clark <inindev@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Tue,  6 May 2025 07:41:14 -0400
Message-Id: <20250506114115.613616-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506114115.613616-1-inindev@gmail.com>
References: <20250506114115.613616-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044125_842322_B5B13D73 
X-CRM114-Status: UNSURE (   9.36  )
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

Add device tree binding for the Luckfox Omni3576 Carrier Board with
Core3576 Module, based on the Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..826dede32145 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,16 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Core3576 Module
+        items:
+          - const: luckfox,core3576
+          - const: rockchip,rk3576
+
+      - description: Luckfox Omni3576 Carrier Board
+        items:
+          - const: luckfox,omni3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5


