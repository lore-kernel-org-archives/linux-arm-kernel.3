Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BBDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=; b=4ej5hcm7HCclLni3lQRndGEI/+
	OZ6cXU3mjdo8fGXf0ZpHo++96jzIJICMH/NFddyhDnbPlsYWu9GHlHGk/Am7Asj//XhHoNrRKcXtn
	9OVpRH5+JSjcmirQelagm3+ChVHBBOFaUlE0oZemtmoRvY/8SzrGQZOLlvZf0ajYclYUHPEsGu8KE
	PvyD7GDCpNlZ8mahw21qMe8QB3TM7HzuqrIYiijNyipOzxhdtvBVUNPcLqEhXpF2dyy9hgepHEE9h
	uZtzWTF8INYuOQF7VUxODvhrQWKB28uGmet3P2AhsNaPQ32+w7NOqR12TXXP2tpERKGQbREw1Q7KY
	CTCT0CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzTt-00000003973-2bnh;
	Mon, 16 Jun 2025 02:21:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiy-000000034TA-00fL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2363e973db1so39289375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037603; x=1750642403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=d1FFGQBYtNndXtVOZMgk9ABLQk5Da2Ai66TtJC6/N9R8Uy2fYF/6Yj6nMNSQ3aNVT7
         cr1cYaBWUXnHKkzjombmSt61zLa/JtNNoL9nYMkIZjTDkjE32Tluv79DmH7E7Nqg07TV
         +0KrMGSruw0/Agrf/bBFbRnZaT9TK3vcHM9Nl9v/OGNSpadVmCecA8xuSaxvKN30lJBf
         lo4lclCGiNndviL725YyoQY+wquZBuCzKH8u3X5cx1wCNNz4UsWRJySEUjS+Y8rqAHan
         o+7iM9fetNbT4AcO/zTnWnCd9jgXi0GAkYV8Mx/Sp6zx95k316DJyq1yQRDXxKA3Lyqa
         BusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037603; x=1750642403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=CcfGzK7jZSUdQ/GIUPgLhYPOTLTbT+akUMv/N/oRCUW/wuRGwyu72VMf5nttZ5hkBq
         fQaLCZZ2Tj5hK6+/j0W75IE+EwPCYxivJeqKSItCWplfLvw6NaBnBl9BPU90wj4oocBc
         Shh9wLllpRzRyQXtHg5rmOq49M8tg3sZzRdM0A0gQaWwQayMp++6TGeh8+xoZ1ZprsQr
         pVljXVpkwdo40O0T+SBE2UNos2y4AP3+49aRdVTrHJ/Y+WYk/oj6b7sHx4kPk3TQObaP
         JSWbOHtQSn3UhVLu/7XdICDWQC6+3PPBi5tyVDO+ZN6XDGegx7W3I6Dzfbqw940xIkwF
         R0ug==
X-Forwarded-Encrypted: i=1; AJvYcCWSTfxrrjh1Jr0UijXIBRM0Yja1Ulr9Ksf0RB/Smo4f4r/fSnwkrsM7uyYtTZUAbYbJPhVKv2E1Dym/opxJGve7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41JOzei2GmPZsMEyCbPcKG7Yit2YowXeq1eJ/geLs+HhL+0AB
	VcYyIh+B/Puuupv5xzyNB3lGDRUPReMUQ8M7JL/W0F46OhIELsYdxLBP
X-Gm-Gg: ASbGncsezJbUKp3ksEak6hR8cnGt2heHe1WBAmKufTkqilFPHi59VW9aaj1DS9a52l6
	7oeOfwwDGdKC/UKM006sdHKonbir/LC28GPROHmNKjd7e385c9rInZOLE9OIN9XrBjLhfAaYeTl
	MTzaRB8XG7TQ6U9uqhcQfBhnLUNlHkkQaqv1kG4IMQ0XMrzR+sm+xEcu+whTkRvwn2RdXCXMSJ5
	MRPu1/HMdd1JE3CU7riJGlC6csiDEdlJgdXGosyqURrdV/zph4f9anV3/MoNuyIdKLFuQLuDqPo
	3B1cBZhai13WUdoFXBce1PmZSHO8XLn+rlEzxZ2q9freCgzukogP0yRip4zqitIswmZj/CcqdX8
	lVOk=
X-Google-Smtp-Source: AGHT+IGUNE394ORxjIh9GhaDQ4I3KqTxb9FUPwuTUfcms2kv5CaO57PXeF2Ec3A96Ssb2JDXBhtDnA==
X-Received: by 2002:a17:902:ec8b:b0:215:b1e3:c051 with SMTP id d9443c01a7336-2366ae0ddedmr101009925ad.11.1750037603347;
        Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:10 +0800
Subject: [PATCH RESEND v7 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-21-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QaSXqCudX2xRA+ssME3ry+rfSTxP+sC1MrC
 ixnxG3HfLWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GgAKCRABygi3psUI
 JADEEAC3bkcdx2hB1A0jAuE+jQT0MTVLry1QJzypyt7uDz/cbauH5T0Flh6NufBZjPuPF/Sv2Mb
 rD4RMil6Ax3YXWBc1aL+j8zwQdq8wRFn1XvphQyCVzPcG7GEckhipulqj7Okfn9ORpTNI9VZNY/
 geWfae2fnK0yc5UUtGz50C6/QAysifrAjrAefbV9XGSW6b7sYyXXlISwB6nqfCt8A/c5y9Kpk6Y
 BXEgeqiP1Sb4UYQXBBIxj2ycsYYbRr7pWWsmqVrk9CGOEmYKZ79qQG4uYjzZNI2/GPFkMTzaeSF
 GWbX51uX2Y8WGyzuqHJrUGRMHx0cvSK/YUUuNW1RppphZPWHTYGOEDFfw1gPod3NPjMueLg739Y
 6rXnPWEEXwdfMluXd/qpa/ZS5pDnDnMNnjqZep2Ya3LNOyvnhBCBqIoL4mOF1NAQiAhtTrOvVtf
 Z1TgtrYc8zZoa+1NgT21fugtO25LVSxXRbtPBP3E6hGz2BhG1AtqgpFfAsm/ZapQhomR+vxAkcx
 mhk50zGnK45EUy5twAajaN1i9FyMw91eWP/zsdue2J9ILg4FYTZ90km9mi5Ln7268c0vR2fThMU
 L5ayeXeJbFaFMHgMkyBWIdNe5fJDPc8e12T+KwnErz7hevAZknTP+1m2G0FYXTVn5z4M0RmiaB0
 BbO6+1HlUNipYpg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183324_066278_5BD0AF9F 
X-CRM114-Status: UNSURE (   9.40  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -380,6 +392,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.49.0


