Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17617CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=; b=NjZDJQqmE4lMbS6zX3YTTlMsce
	vY6iM6k2OEqQgnahtTxB2L8DusRwHNRFxqpLIezpb9fsKuqikNBoMiQ9odGhbZ7vaGj9ghVSNlw5N
	9Kh8PTugu9R6+PWG7kBTPqZJYYfZwgco4NOZUVWpsnZ2AMQSJ92ZIRzANW2Ccube9tunpa8LIQbUq
	aulmEDM7HoISQVnb3GK4FucfjK7BaI+sqatrJPPVxYwzkGtXYg/EtqTf23Q05/3OUhViaLHXbJNyw
	ZOFhrsAAVYQqVnX6HlAkwXugFnpIBuoWblp7ha+6JcJ2qI7iQ4X0/C6fXptJwGiXvtk6SwzO4ygGs
	kN7a4rQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac7-0000000GquF-3Rf9;
	Mon, 08 Sep 2025 12:04:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhH-0000000GELZ-157l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:02:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24c863e852aso37865555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325723; x=1757930523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=CHAI/5yxRLfLgoQw+WnYCmVE4UBRSBd3P/uTfS3asLLvXePThXp+BwUXqHGrWaOAZF
         cqZgr5ZPXO4HXngp/E4tn7xVYzc1mJChOoIXueMDtYgOAHZ/ts8dmzWTGN8aXClEJg2/
         bCzHleItXQrx4LlUGHNw3koDum7NbbOBGE6JxbSOHe4yWMoVo/I4pB4+9M/qLDmfdL/a
         ad91h09FTbo4BD03SIPvK7l4Dj+YZIgHt2PteCOx0Zo7uPwsAJCfbNW3U0tn/Gv3aWQq
         /djYEF9f1A/yiGH3ryChBEOmiL6tKCO4CqpLRRHQOA6UlrsoOpCWcnZHN/Csx338GKgK
         pMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325723; x=1757930523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=IbkFnSec1EIbGG1jkQOtJqZpA2PEKghZOK02Rg5J2qsM3CJlIt+F53AyVzbL8BjB02
         JW0NHfM7GqybZdIcUs+p7dvdTC2PRgD3WjTcuhCq1B7J4znQobenpXrS3RqJCDrUhFG1
         1UthqChAVtbHHIGalXV1E+pgThUrkdLCsU65rK4I8OnP/vS1axNCF2gfQBwnPKbUIdSy
         bVfBBSD81He7jGAOVexRU32PwBA4hAnduuS75+HVQAFMii/2Cvv5kiItFB75dg6jzTfc
         GyzZkegIaLEZpnXKQljDPcG9KkClWy70DT74H1PCMon5v0hndStfPa3vKuobWaT0mA6c
         NFrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjy+sdMsxO0vfuH/weEWqgm0cd1L+9EM6IZkqfcQgWmUTfFvOAV0R+NwFNYkf3f7b9xBcx9COFIlwb6VfP6gDl@lists.infradead.org
X-Gm-Message-State: AOJu0YxrBKba4YkJDVfyLylC58PCmwWESmU+jSs6qme9v83/LpRGN7Wq
	EuSoIkNZ4lVOVsxxwwLzkQk6ojH0DlxKXFK0NTKjFfBVtTf9KquMDNG6
X-Gm-Gg: ASbGncsLmOpi5N239uEAx+dcoAEYLSI7+IWJLCV+H5Q2It+pWqgfdi3rA1T9rv13IQu
	T0C8jGL7E6HvvRKF99r5sCasSYW7PjDUdfXCvb4ospR+WGJF4wh/aFfJlRVRp+f93TfvYBQwHg0
	Q9hJptLkOHW+PRSYTk/0hWB5n/T1HeWy/luD1I7ZfP5UhNnZk7+nsUWV4p3+2DY77AGkzPA4eZC
	bdLVA1iOh60EO5WJxefh2vD2M+A1MtUqirjsuNdjzITend194EfQ1DDjUGfYZhKgT+JWA3PDfxS
	kbhHINq9aRZm14YJQvVamRa5llRP1Cx0b2CYf8x19FADqY5zHq6ntWlfDDm/eiyoCNmVblMDIed
	519T2mFznK4pXJ/rfwFV2D4CGK1I=
X-Google-Smtp-Source: AGHT+IEephzG6wPv+SDfh/QNJZfyYYZEGiN9nvrRGlXcpvwgSrHUd5DTgv1ApG48nCxk+8qMKPMzuQ==
X-Received: by 2002:a17:902:ea11:b0:246:e230:a99c with SMTP id d9443c01a7336-2516e97e544mr97305725ad.20.1757325722576;
        Mon, 08 Sep 2025 03:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:02 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:41 +0800
Subject: [PATCH RESEND v8 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-17-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFdIPv4SPsQfS6q50PvS6+jpXMZuVxHeFTQ
 rKoKjDWLbiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JD1XEACgJgkU1uz5AspTlaQ/vskTVHNVVJbTFwN29DKlUvF5uCFpzsIXD83ZajprFY2ZgAlL2Ds
 CZmwmM8JvwbHtT0IMBZYLkMj4V2j8k2fQYv+HoThtLD7q5t6xkkqIHkGQsth8Kp9bnTsbjwAy2N
 eXy8BKTMHlHMbBVNsFgws/1FSIeQgDTSquG7I21zxR8dZe0tIZQMy4q7b5QqLPEY7pKgGzBCORA
 /hfEtDf6TrAIHmSbfDL/aJXylc0IXCHZATjd6jj4OWhEVO2vSO7jBJ7niapmSoMPyDSN0ISzfd4
 wtD7pmHaw/ojoSYcDzYQJQDtCraK5PX6C4DHS2cdGbAmJo/iSbGs/NfLfGA1VU6FVqJUzPHW8vF
 HGrDmpPQ3r7BlfFbYq+hvw1SaEAKFAKCUwoxd5qNXnw32G/uSwnNJ01tsAFvPrs47+mN7fX1Owy
 ai1rjW+8cJKEx5rscsq4BER7DcBLTUUffna70buak+VESiKYCrU1UgejvJob/E8BEN6oHkY9kHQ
 sNvmWfYy2wAQkEGYzDSpACkEW/32J28diUq7GoWhZk2ka3Wqo2xnKx/PnW62VNpIMaxHOwoR/52
 yA5zRmSLUR6W9+oY3gNkgF2YS1F+5tcG4P4o/DUztQZPQR2SNHj4nu1HPzOX4LpvVWVWR3aYWiv
 lV/Nos227stGHUA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030203_302305_3FBB7A14 
X-CRM114-Status: GOOD (  10.50  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.51.0


