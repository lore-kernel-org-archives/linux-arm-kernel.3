Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF3CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hljhn7F62l056w1LsgMyS3YqsFiEWlqkEOExxjIDOMQ=; b=sDjFb6+5Lz1g9scin3MhkdaV8m
	zHCzpUZMpClKp36vIMw+6bFSSYlTC6k2V2IRPEcQ2uWqlGtJliah35ij6B7wmBt9iZFJANvoK5gFH
	hrnBJKJm3vaPWjZDV6+VXDLv/zV7yU4JGlC8viE+iQ6l77q7NKodKZl2zMPQApBhciI+ZD22YXXED
	JNQBaPHu0XR+sv/lzc8G7mYQeHQfL0mNQerGPQ7fNAQ8hhCAdwRvk0qihOuL/0a9UG6O09tJPfsLw
	5BEjYzCpeBkbD34u1iuTj36RTDbIypda33aAvLudB+iNze2cRI8bLIjZogFvMLIk60t0Y6XbGsOD5
	1Nhzus3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj2-0000000FH1o-1giz;
	Wed, 03 Jun 2026 14:37:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiy-0000000FGuj-1YEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4618215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497458; x=1781102258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hljhn7F62l056w1LsgMyS3YqsFiEWlqkEOExxjIDOMQ=;
        b=qJthQxAeP4HkUlezywF2vHsxcu3CjHDQsqv91f6BQmhae3BceWZ4ry6wUAaRpaCnMI
         t5VsbW2iRl16aJNrfrACpa08T7iP/s8GhOrTc4Ydz7r6ZZuvRLBbH9igBvRXD87ey8i6
         GP384m+/r+7iKnuAa8kGNfkp0c7k7WBBqXpGdgz954FLBvdpfUhJbiznZUup7/jnaGt1
         dMwcEC2is77KQCy/OASdLb8lhbJpko3bBRATgt2vH7IUfhH2sWkxdyVkwa4yJmMd3iSm
         pEM+JLvNxEcZjkqLiJh0YctqAewe+/4k56wUqLvO8dgBtNn785HaoR2dMtra2PHz7DCj
         ghLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497458; x=1781102258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hljhn7F62l056w1LsgMyS3YqsFiEWlqkEOExxjIDOMQ=;
        b=OpX3CaTxYkk4df3tDfdkHe7pYgnrgZSWjHFqr4OFY4zb2KT0LQsqz5iYO6Dzna81/X
         /TPHtuD+l0I4ECiqAgdjtsRJhAPoO3Fkgg+AhPs5kv9knKxWsr9SLx0C5G5QRz1zw7bV
         ubs9SuJ+sDaEur8cgVCwKySVcCKoEKeNOvm80Sg9snbEQuo8DaebeHmEqT2kIUTEzCqa
         ulrub8q5eo89AO173Yn7SYgrJhkHlqjgM7E0De/7NAmkh3XvuyAFBDkreoDKd0hF0AeO
         6sUEVRAtlyzNbjonkmYVsvv0n4XR3oyDyESjVaS/QoO5eObIXfBEYfXLYb8bonTd4tYS
         psBw==
X-Forwarded-Encrypted: i=1; AFNElJ+nWKM3gGZlYn4UXey6rRgaj1OHl03gBIkRTI4CzTRqzIVeSwrVlJLFgBlyYKKUBFJmaDFp4pP0aFYF7fWR48Bx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs3dE5+M270GkHw5Qrzlw3Yl3P37B7qs5L+0xZrYAVbU0af6AK
	Eg0YX9HdDEG3D2Y2lQ0jE6+c0R7IAesxhHcpztK/WDCz0jMQeYQIWlZo
X-Gm-Gg: Acq92OFt7IMhV3tP9cE+8bl3ZTFkOXLB9e6mGeMADZJXohV4J+LIGx0wvjmrJar+tc9
	tFPG/GDKDH2+WGPfEsvafjQtpS78AFJbeP7rpSS7/bfpGnNUaAiA7QgAn/8FeLQlbwkTd/bqGYv
	B4bK3o4x4bgDQfnYXGdoECc1bzw9rng378bqYgzy6suzGCEiIImm0ytJKOS6pX8KJA0nND9ROxo
	Btt368KfCjjYv9fZwIF5ReoAw1z3MI2m2481rnhD1v/qvs0NrHd+JTW1OchoD5/kJcGThDtW6Ks
	46GHR91qQagtM0AoNxpLAe/QXyfuj26+j0fOLhJqkNcvohrm1pPnwg8RZSpbiNQLPTKFi9ZlSjo
	zkb2KtSq5bwQCeijabQD1dz7Gzl4AffcEloIrrmwi+y9hSMznB6MQUtPikBwML1iWJgfN0/EA1k
	UZafdyHhYFE2oZjDmgv1GbEqOmvKxXRXzHhspjjPmw+6ea1Jn6dDbusF9Ji3rL2e2r+9t/lWdv1
	Iw7S3d5xG5VjdM7m64kuZrWDjnM0675KU+smqEv0jDa/8Po/gOIDGN8PyI=
X-Received: by 2002:a05:600c:5308:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490b6121745mr51329715e9.6.1780497457614;
        Wed, 03 Jun 2026 07:37:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 16:37:17 +0200
Message-ID: <3ab5aacc561dc9bdea882a3babd39ba871eda023.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073740_530291_A1846682 
X-CRM114-Status: GOOD (  11.51  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9d08785cdae8..06d8dd7a5b54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


