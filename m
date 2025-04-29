Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=; b=Z1HqIXJx2/vHsU5RcbE+noaz19
	htSb5Cuqm4p4b0M5dl1aUOK8QGoRdBBT3Fdf8H7+el+jCf0Yo7xPqZsvhJHNipALF/n/C03irw0PQ
	Qv0i2s1yTZvhdxSVT73oLtyUkD3Sykfo557NjC+bA0CH5D3xuXHlQXr0XkftAZw6kEGJRVfHZfgXg
	doaROUOTGBj9jiy1CdUlUzoq6AgETuGZoAUeCObDX8XBLfGlrl8vEbj2ixME6iLBpDj47JLr+cAuR
	Gv6p1PS2EfAt2fUCrOWzeOn0H4fa//9PynrGzQ3vp0s83PAq9Sy3LlBkXzPtjz/pQrchziX1A1KZL
	N3wsWPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cOt-00000008HkY-3wCb;
	Tue, 29 Apr 2025 04:16:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btY-00000008DDr-3RDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2295d78b45cso79037225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898272; x=1746503072; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=ki+gF9m1cuDUtZ60viZF05OAC4f2Fj461pGsz77oUUbE1EhvNV5Qbg54IdYWy2WG6u
         4kV/SK4Ji4Pd1r67C9doHbJPQfwY8yDqJdG536gPIjCkntggFZDtc+KUCYZXk0IH64Z2
         XrMPs3VxfQymGMlCpO77fppcrEUgmXPWVcizQda1l7Sbkv3aZxM5pCtY1DoviUSrHlpn
         hiOWdj6ZqPgbSOZMS79DJnRg+Fdb5hMw68M+zhk0RjCAKBsWJV3Olxsvdixrtj3omTQ5
         OH4vJIjhClNBVczZDL7XJP65H3LUqp58kjvktZrsVhm9H+oMW9jssglRGl+RyOuJ0ozr
         Js/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898272; x=1746503072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=ipGDqq5PyMWZS7Vma0BfW0RIYRHgnRIWoN8lHUJKedB7L/9g5LRxx+b8v0L+iJntZB
         Wf5wI4LYCo49IRknyya1Chu8bSJfur/mImge3y7UL5HU22jvyY3m6ylWpC5yjm4FlRiG
         43UGQI0sGCfoF9Z2AbOUCJqQaIeUQVk/XvBDc8vn2pRzjBxO6GM4M3qdPwZZjFZg9QOv
         NdpLQ6vh2v7MUnKsgjCTanvSN0Z4wIptTI5JURS+wY87KwRbLtmk1q2m8x2iDwMttM89
         u6N9JDSpANxJHd/Aup4KAeLr4FI0Y1s9KT4hEw9LLDnPEbzNCEiVc5E43BQM4ms3Brkj
         QttA==
X-Forwarded-Encrypted: i=1; AJvYcCVEr8+JJjDAyQXS52sxHq3jn14+vRLkvvvXvp1GzO/BEHMEVE0FxgFYKnagLZrM2C7IryszX0qaji3snEZdDqQx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8jF4IW04Oto3VXPuiQdaVetcfGJwWUorrPnId6OTTNDcmYpF/
	IS+aVzO/NK0FVuZJll4LQ+zHnLOvFFAAYxvAQysUWeF+vFuATX8FN1qBzA==
X-Gm-Gg: ASbGncuh1cqRrsPn4KxoNNLYSeYgDqpQ5tkO53HaTaLA+ryrwGXW99IqpFyQfbB3cBW
	2Hg8s8Syv2rEPJ+Z1KLgg9UJ1R5mprMDTSxwzeL3rfFtwcsbJzjve6AdT2ZJUtOHU1TRZXMUvTy
	jM3LEH7YAg2PDsidbefeIeqiEDxanjcHCGG8kzCSQjW7Leb+KBhVu2SSDEQ45qYGL1bqj191DTD
	uYFopRjX2KoyZjtybchmttSwPuEZevTMiOTxm60KJcH6tmcnxYSiWxPO8AoGM/DncVMwSe4wZkR
	Tyf1USkDPqd39X3b8WABACvXmoOleIfy1SXt1ACt2SUTqO5/T3pGhZesxQ==
X-Google-Smtp-Source: AGHT+IGccqGZ3Xia9Ch8eVE4eB5PhOyKHbvEUCPfUez9ylO+fo9l2C2+BFOaam1hQjLiZd/TEJp4xw==
X-Received: by 2002:a17:902:ec8e:b0:224:1001:677c with SMTP id d9443c01a7336-22dc69f8997mr153751925ad.9.1745898271905;
        Mon, 28 Apr 2025 20:44:31 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:40 +0800
Subject: [PATCH RESEND v6 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-16-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErl5A1ECOtTNng0tLnKXDnvyb07KxJIcMC+5
 SNjbIZmLoGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JHMXD/wJ6027IA1eE+iO9JomMzvUWoHwbUr0+PEnx4lRmEjmaW1Cy/p3GmMkYOUOt3Gcwwu644A
 iNFNEx5jt1OcJmtvU2r6dYE1oLH6JNXzNhVYQ/SJ1KMOakb9dQVKLWxIr/Syd1CuC73eekq6BRp
 VpfU5lr5PHujOxFpXOWHzW8jFShJ47f8Kg9ciBdXAJpI9wSpPDYHkpJwLn8W3TxL91+PKm0x+8p
 vx2C9ZstLrvj6vVpCvxgyCmReBs8Ka6OPrdjSWGiUqb9PJUUWcBKImifiIHMeCqJ3tOIj86nIna
 z26bosC1lp3M1qNqPWMlalzRh3AmVmukfJc0q9DEo5jClErJtsgAgqDn8oEB66/bFGh3XZLf13W
 XaI45hBeIziEk0fxxNCJ1zbNekMrbaM/FLxZx3IxEg1W1MKq26Ff6CwQZ5DXxz3Bghj4x+eCeaZ
 RYTzDjq2Xg4jJ1bTDu1gy4dBfBENStVrKQ9vkA3S3QxhcE3hg07lIz6l7HYyLweU0586d6h9btO
 kRNHxM+bxtOB6uDX6fUEppO2faEgybt87tVfjbOVB1Ioou5Ai707ssBB9+VFQLWFDI1sXzT3GUh
 487zF6FZlcwJPioCb+vP/Ahj9r3VnIewLB0VEgRzvIBrUeDyJKQum4/tIiML9A46Fo2rUEiKzxu
 g1NClcHh8mdaObw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204432_861760_128EEA0C 
X-CRM114-Status: GOOD (  10.04  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219..56ac6e7f3803a16beacc74764262b02c75a96fce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -167,6 +167,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.49.0


