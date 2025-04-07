Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B45CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=; b=nVN6Tb3hBQrHdhUweUBB6QtaA3
	cM87RxUFThtc8CccLL619Sk3BFXV6li5l/xKGeCNoSRN2BX0Jav8uLd559yDiMoMWilE6BELJ5kN0
	/p9N/QnPEv82jly2egsHoCFXqy4Z9pucuehly8BpPfyU8ZP/V+JThiLLtvR6z3EHfyMBBg+6Q1pMo
	41qBe3B9idOwvKCpEYy6fs0jamift+AFh0eSBvFh+j9PYBsYr4DS4oU1xtb/+4Tb56VhJUT2YZAEM
	+RYC/h2HiBr9+EtfyeJsmykw/JaT0L6Fgouz5MIEiBoimM21Me5VDlX5Uu1qDHlMsKfhEatXmVyvz
	6Ipsr9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1evl-0000000GRJv-1uKy;
	Mon, 07 Apr 2025 05:21:57 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eO7-0000000GMug-1wom
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:47:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-303a66af07eso2915655a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001230; x=1744606030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=kXoTge0wHre8Ury54TBsjJeEHxsNQ6kuznF5AX1UDWqR8h4O/cYepYRo/+ynu5dRHf
         maxLt7evxeGKEsAomWi1og0It5SyQskQTH8XX4SEvLv3xNPiVJ3FRGZqyELyebbgNUTd
         ZNlO1jd0bsMMg8gWPUZ6d7Nw6A3OkTdRmCd0jM+HvozKG4AmWdbhfLR17qKgzgZ2brHT
         HFPzt59Nxru6XqiMFt442O7EuLuoo5SYwFCmUpbpjUqZIL+eDaS/NbyUTb28f0N+FYPp
         Bj4He68Z+j8VOzsLfaOY7dqQRWWC8MCGhlYO5cAIs2j7XV6UqtFwVgsylFeWja9960yV
         d91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001230; x=1744606030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=MtKNyh4L/6i0W1LMSIo+LZQSh9bc/n/QnBIpxzZ4YdqDiLNgerc0s2dUR5kiCE60ov
         o1idjMkXG3MRzmM8pp6SNPF/HXNK3iHgR/VwxXrJn8fgXaQZXIab1b/bd3n2Brif0GOm
         48WwQLHgPGyvg7Fe9Yfwukfj9/1VQ/VJ3e6SSgsEow7r9R/88r5D8CLwhi9C0Z8bQhQY
         3KeOkjg6CkoB2RTb3SA74tT4C0KnqA2R6IfTCHjsZXS6P66TbnhGsDp8wty8D2cWND9H
         9lfJp86S/vK4bQGp999RgG1Api50CgsB0/jt+3sGdbu7mbHovVgzeJmmcbdKlsbjyj0h
         WLXg==
X-Forwarded-Encrypted: i=1; AJvYcCVr94bmDe+A7RTuOzD72s/ufe54ouzu93IlURHInm5BCsQcBOZl4N4qMRXvNFKUH7pDsoP6sKmNj85d8YQ9qYX5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz05gVfgTZFXj+v5+dnMfHmXyMeYk0x/auxsnPoC1moUl6qg2Jn
	Qn/DqvhuedV03OwEHQuoWklsEelmrz1usnwtesb8Cfll1RNpXJaU
X-Gm-Gg: ASbGncsx3/9XkeaDnlL+tD4ZxbRnjdAGMExGUhaS7Qmi/uk0RGBeOM4A+GlBy3b1LDO
	a5eXl2lxpw3XxRRFsshCHMIX6ERLxwd4wvlFS+Nm8dZO8ROa78ONDNaPeRhiimP+c2Tp+Ry+YD3
	wYCFqmpIorXC61YXYJ6GCK5rzGwH6rOJvI1O5O47D9i1lO5EwXrnXHbmnTCGa012S1xwqsqpwzj
	Wx0PQonRV8z1bGs0WyB4TVirdSzxLDSBj/LCh+DtsuQfgrmWlOBIsrgorT9fQXTFi5/0XSnZMFM
	9blEE8he70YOrWfIl4Zn1amMet1xvKcfeyfW9xGAk1ZA0lc=
X-Google-Smtp-Source: AGHT+IGqaSKJPQ3webd18v8phTfeS2RdyW8CSQ2+EERcN82F3onx63VuOVR+lqwdMYbgi6lgA/f3Dg==
X-Received: by 2002:a17:90b:4d0b:b0:2ff:6bd0:ff26 with SMTP id 98e67ed59e1d1-306af7b7889mr8138089a91.34.1744001230570;
        Sun, 06 Apr 2025 21:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:29 +0800
Subject: [PATCH v6 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-20-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iI4yDZKAdu9wJhoMkGQMGWnvtViIIDchS6e
 YAYt2NUBtmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JO3sEACc/heHWtuO02KNJ/05gdbCQFzrtSUeukVZSXbGO/W10Awaqv//7OOc70tBsW+S2sNMAh8
 JiV9R2J4VxHb/tUxCR/R9hfB60Iwz3atVzCHQqodUN9V3GseI1bu4MA3peFaw0zARzV0379/E/h
 GriUm024aqKYDcGmkbVPfJuY9lJQdSVlDkbpqVzwTi3l1N6x8f7JC7+r3bKKhdB3RO3TgKbYZER
 mSp5T6MN2kE40wxdj7y5bCEvar9cFI1Vrvebs19VR7wq5XHdGrzupDX6m9URm/zrrL8hzsJF/JD
 hyIo6tHq0OlhzsediNtFiDLJs5CXXF3/nVviFQAPywTv4BkHp+/F5P3GGhGylt8rgMvA6DbLhzB
 k2RsElsbCAUatMk+GcOpEk1JUQDkvJRjzr0ccipvON+GXDNiWnxlAaTQAL+kALXolG2O/STN+18
 cEm4dsBwJbNVi+dL88KkzoTQWlduxCrniu9GgKwzzeEfH6EvTTbdrPvSXTS/YoVAPHs0Sa0O4Pa
 NCBSnVwMXTg5xowCFEZ2dFahIM3ZzToiHMlk77gxYiv7xCaRPA7Oj6sGVtpTtIej9t3umPBdjEt
 NWHgc6pCumXxTjXuf2DtNMKYU5PdqKWGbetVl9xRpC1IK5H9iR6kZmm3nREfJrd0zmrG3dI22HC
 IDojzQ1B3jNzRJg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214711_637564_028E3536 
X-CRM114-Status: UNSURE (   9.72  )
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0


