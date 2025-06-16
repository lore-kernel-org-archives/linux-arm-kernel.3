Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72983C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=; b=GIdpS4jkJ2rIunCUVeVOAlH0df
	/KgkAwKWOm3u8BuMpOtDtNwmaGleNMYcOuPQLXTfHMnqOjRBlRCd+Z2jNvv+KN5L5F7dmkKNnvtHV
	kWc1eb2L1SqpBxRMMcLySrMS3gs6NAucsDbtaqkv+YjPAUi3p0WHwkv1/zqTM0U2KG+mTwgre6KAv
	ZZ8GXUZ9h/7Uqp7g/no4j7Rt/EKYN9MxxLvjPmC5AifB/8T1CSssqX1lbziwMwazQeAJE50r8LxMt
	3im+eb3XCerk/S89IgU+dqaRTDvtHk+fE8pyYs+TtNDvO8GTLtipJeiKAKgoOP/mCa1GGHwuzPctC
	q5WlIznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzEd-000000037zJ-35It;
	Mon, 16 Jun 2025 02:06:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyia-000000034NI-2wTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234f17910d8so35786615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037580; x=1750642380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=aOltuUPAWlQThxjyEeTtEpJaaeaeimgI/lpE4S7XyfmXbAPyF8KJ3XNfHgVO42HxOD
         3L8qEXwnFztBB0LJG6DGNbDCCmZBvQ+WKEui5k92TLgLdmF/yS4JodSwF4E1fhMIRFJx
         KQ6h/134hTB1TOylWDjmaer9QCu/FPq9MfaMBUgqYhbi+3PBvhH71xHGuXEXgLYSXQpo
         pFbAOQmGk37z7piasyMuHrf9RnTi7jWHjEEHyOi3t92PAr0WDSo6+zJZyetfOKrAs9AB
         I0X/fGhar2UCI8WSS1MBCZk2yfs4L8Zv/vBukjUC9A/8OlUJ2od5yQNj+9T5V3iAtbQk
         rLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037580; x=1750642380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=mFfGzHA1obS+gU7axo+wRHnPy/I53f/vndd8trAzQHcTEaAxZllM7xhlULEhl5K5fn
         CmcBTIBw8GqU3w4hB/swDHgpoUHHwEsbIrsRpRTiIJzXHg9RMtt5br90mhbtq/7FFhyZ
         4ffO3ugM8WV2lQJEWMpcDRDhpS27uY1i8gnf8qKuvAGBzW73GVMwTY0WhmwemP2KSqlP
         vUsnl6GyNpHEwg6bPTHxbfieV+76aBcQV6vmSgBrADGedW7Mwd7NanosrNbjVdoS3Aqq
         WImqssnzpXKLlO6AGtdl9x2LodKQgoFTZAezWbFi/uE/plb20EbwrtpslAcyQtEZcpE6
         HT/g==
X-Forwarded-Encrypted: i=1; AJvYcCWzvRIEcXfVxvZXtKZqmq65L74AYr8LTchi0AmLWEWEJATrgZ6NVVJbsj9R7S2WjIhfIvckaOT9VeanYDR7/kUy@lists.infradead.org
X-Gm-Message-State: AOJu0YxwhyQ3bYTNDcnZDOdIJaUs+Bx3Jod0gftveGm+UKszU3t6DSPL
	ZzPkzGFTv4Hi3IfENNCi0Ju+poaDLLxmryVM7+Invrl6FZEtUHu7J3+o
X-Gm-Gg: ASbGncuei2ggqTd2NyqiEB0vyXRxU3zk1m5FOCW/cb2J9Unhkn3V1sDb7xXei5FfQzw
	yPvOoJOLHzXq7G5refOXDHJ8Lk58xUkgb+khsCk16vbQjkKnRMCfCyG63hHF8unClp5zgOWm/Hx
	KoiJwm3dMGYm5UBp30d3yIUPW2J2uF8YcoNxsElmF31NC53uhsX4lmtRqVjGBAFesXKIUOJ56Cw
	ZFpeOkk2WnTj/DdBdSAQeUsfVdFj2zFpsyOlZ9jIM40vT8KDYWjr7ATAYY9rMX6Y0YaZGlwI34X
	QBtxQeO7gYotoB+4L7ZcITYUXdzPzeTR8kel/4HwXXei3arwUlyyx5mo/7ER2gmhffzZ4lE1s9A
	YjQo=
X-Google-Smtp-Source: AGHT+IGgk+UDqjGBXQ/jAlFUVtNuJ28xq8CqF7zuw/GIVK0covhXtNdMSPcYwH3H5HMFOq3rIKm2Dw==
X-Received: by 2002:a17:903:ac8:b0:234:909b:3da9 with SMTP id d9443c01a7336-2366b14d30cmr105655215ad.27.1750037580157;
        Sun, 15 Jun 2025 18:33:00 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:59 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:03 +0800
Subject: [PATCH RESEND v7 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-14-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZEW1fC8sK/zRP5v9tHDE78di18+WRlDWek
 8rJMpr5rlqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JOBxD/42w9CY3rh2s/hF+0SwApMmvqGWI9Zb94hNeuEMx30t1pV0FOug7/1+RcLNSNw6faVlCY6
 PmZu4VjpZSq7S1wJytSvk+X8/WwjvkEeUIQD20i1XFH++kNKH5Hz7o8jiIw2Hy98JO2Bm1GF8pO
 7OAu1fmNopUdue7TTnNyAT/psmj4YRgF6U+g9f3muDHqaVi4QQhkcqElY2h6/nBBt2LP1kwa/pN
 Q8YMH9Szg6a9drSDq0GuVKAHLNBk2olT3LBVuuE8nJ9JURZYIm03Ql7fBTGdq2DSvFu0Yxs9gkt
 E+2TeS+yoVaKI6Nwicdz++kTytPjWyyYnnp+jq+p/szMSaJJkIjO4MmYBAY5wRCAjswDFEv5NXu
 gHC9B7VHEqwWdKv6M1ZG5i0sYq02PFaQtuFU5pWLGsumM96/HMDXjTW9K0CMPcCQEEXIjV8L9tp
 sP8QCN6NxIeW6ugXkbBvzNbQ1yE+m2QL1aS8KlKN3hZbonCkSQclAtEHD6UpIFDI7m0quUOLdDe
 tdFG0GzOgcShiymHZdgxnbdgZiSv1eU++hR4kXnEix7dr5NDhN64vvF5xCfh+PqnW6HkZ4/h+Ce
 Wkj9YEzlaGHAeaw3+CbpFfAYjO8bkZm5LbSkuxzFcUfTuXV+M4t58UEZLtaD+6yUPfF2f3Q+HJU
 yejpG1ouBFAW4IQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183300_743714_88823B8E 
X-CRM114-Status: UNSURE (   9.46  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
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
2.49.0


