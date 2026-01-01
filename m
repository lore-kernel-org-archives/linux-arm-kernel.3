Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22541EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=; b=oyUdDpD8wTO2AtanA0B7sr/4m/
	mDkxjoSO5IrnunHrRc3PyHztp5+VEd/BdvDMBR/lPNDKOAF64WpVCbDiMoL9X8j1cMXazYt3Rzzbh
	Txl60G4rHHI2hsm6eFl1HXCsIVyjoIwklEKT6nD2Qqrr03R0EJoGa1A9HDtbjNZ09IxS9NPgNYZrr
	KFxF+ZsYrTiHttUcAaiypPM8u75POmXnnCkGW+fQNwHCSdwnxJIRtQDYgDfA+sY3CRZThCRFxaU8k
	akPCTBgARW1VZaBXGGwsjsR9s+ekTGIrM4zRMdQv2Ad6Cfye1zuM726O8JUQKoO+R0AfvmnxCkhoA
	lfCil5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEab-00000006j9q-1I3D;
	Thu, 01 Jan 2026 09:03:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaZ-00000006j6l-0hcm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7ade456b6abso9172930b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258202; x=1767863002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=A8/e4/nu6v2O0NgAXoDvFzgXEEtBwJgC6oP+Dz1ECisGSfi39cTJ+g28DPh48btS/j
         e2X9zjDqfyguvNnV2Jsntl33TxSXzy1Z8Vt5fTzUMmRIw1KPmhIoWcQTeUQ/1bZONBdD
         vEueRJmEAcDBJDPNoGQETiUS14kbsNKJclP0PdD9KfHQQm12IvpZ/QMkoqy7rU1IX6WL
         FNifhUaVNEPBnyGfyJ+2096vUj3B7GLcvekqFhepzvom12iHnK3BJaDe+mAfTHuEddcp
         3i9G3q1kCBc+tWX/aUB+gvuZuaYraYaz+Lea13ydDvpy8CyZtxui26FCbV/xXGRaUKMA
         H6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258202; x=1767863002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=SGftSN0zLAnyUClGsd2TXZEFjLIWwtOmzcIaNr+/eQU3p+3aYgL4iT39Z/QMCSbO0b
         kt50BHewmlIAgZdaXEZB74B/Snd+k7/DFb7qyJIm4OxKGXlKiyaF93wfamWTXEZJR2As
         Huj3UNUjyGO+BsrVb02KoaLXaWHTlLhTb6gs2v1w2fw0qx/EawezjqHhdLZz21lZWnTJ
         7/x411lpqsrBgn3LJP+a1NMwS1xczMJm6X2+09CF8sOFph0nvRmTJxzWwRI4mjEujTiz
         Pg6bX7fiP3kE5qTT3p6lQSzavBJ7sse6GrwYZcj3hih9WFyW29DY27KOXeg1yF7sRw/5
         Bm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1vGPmPlaIsdW42aCSUINNLud7x4Yifwhkn801tfpJmV1zYM2iW6V6Id6r39GiiQ7tSE5t7IhAQCT+/2SxxKXT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3xP0SzjdQfACi2cr0T+XQwJ7rKdC0S13b2u3qnGBEg5gs7VFh
	xG9nHdVFNK0QXSL3D6HVqf9wFcJ1mh3bPZPh1esqZTDYPEyMLeLviQUH
X-Gm-Gg: AY/fxX7BML2MjDyHnuVwpoIRYzG/O6odY4cD6RUi/yfUP+C721em2sRebcGUn8QaFkb
	aKPhBwhfktx8+H0nJXNTLWWp6mnLWBXn2i9nAft5KAFZwQxdh6Ne5fIbUV8bMyALNyNxZoD/Kqw
	ZsWC0+/J0k6EV90TJMpoD8Ddw2nA+Qh5A22NelXp7W5LbfeLQ3qVOqlj/BMCuGHsQHowteIiMBU
	IOxmlBgw5xakZBKVfdigcltY/gHbP5DYrroZt74TA22ip5w1EA9N/l/2ML/JNOYUaRHA5UgjbzF
	APXNIko/dePLgLTlM6ouJ6nB9uvcnBFi6cixHVvHL2HYPo3oIL/cnTV3aMG53BKocsEZL3hcaUg
	LwBDZh80DlO/iODmdAuudPP/AMJiz3MgH83wo3d+MMUcETMpNKLLHjLkakisDI5XYWK+Inw00F6
	8Rub0vGa1PK+E6
X-Google-Smtp-Source: AGHT+IEmHAcWqnpliva3OuZtHZc4HbdIYtIJNUaBfJ0BdwokwtWmkHAr4ksqGBIwXlgYOW6W79PJfg==
X-Received: by 2002:a05:6a00:6087:b0:7e8:4471:8d4 with SMTP id d2e1a72fcca58-7ff66872056mr35885583b3a.53.1767258202305;
        Thu, 01 Jan 2026 01:03:22 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:21 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:50 +0800
Subject: [PATCH v10 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-14-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgo4ZMseGjapzGmuJSYJ6+DsYX+adysnVIeG
 8wqHU2nL5qJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JJQXD/9S0XPtF0kKMXxI/Q1LjACD3cbRZIY7t5AFolcJGp/jRItTNlBaDdLEbVOMPeEFRwkfZGl
 y/Gcp7mY/nlXElyZHrT1KIq9A1lQCQV8VF77jZIa9dmR7iWIhHdRr9WWzwi2ytX/T6NrdIkXCaf
 5wK9E3IFiaKNVRy2AYIw9dqbHy4DSuf8t8KYgAgnpdxis7MXLLas2ticMEGBg7lM4t9exuez/e5
 SmwiDxEYrhDAeaAkX66as039lAo8P8cCJovbLlbl9ULGIFN4HsyF2I/x/oKKRCgO+ZynQqASVEg
 AXYs/6qVorx1emzksduBpbNOZIcDHf6HhlVJyO6IGpzzs/F2rACsyObHX+Ik3vZx/3m8JvVetYz
 YLYTpgt12HqC3lVj+XUT774nqmD4uaaZ6uMf+e+hr8oasL+GEoGEQurvFGRTSLGCwjFiMT4X66u
 pgZo5c/rAwrji+CTfKCNIat6nwvXSfTI7Nvu5+IgTtsvodPxxKms27+eHFGr0AF0rsmQqgaHFul
 KHvqbOoCCgHYB+8vlmkBkmhHRIHZTLuxcpMHILBivcAs1Hmo5BY+csQwIVjxe3czOQZ/S/Z4Ruw
 H/OAgJskUPMX0VsiGeshmsFY9tTD+sn1qy5A8Ej/EFUxBmoIssfosdl2t1tbREfK0fSg+46FP0T
 iTyEsqwcmghVyLQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010323_238038_EA040F7C 
X-CRM114-Status: GOOD (  10.15  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 0342455d344474d34f7924a089bf5f5915e68d55..a416cf8204173d4e45eb7baab42302eefd0e55ab 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -282,6 +282,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.52.0


