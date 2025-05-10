Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE845C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=; b=3UuQzAOfzyWAjS2HpVdTRGezd+
	unsg/Twc2C783+djmCgBmzU2D6AcJFKljKlWvkXSY/VIHUWbZmFNcTlA0C64gGSwadvFW30lzBAkL
	7eQVz99+QYvldgc/pzS5I4aPwUWsIG4/C6TA/L37Y/frGknT+giWmigX+z3DNRaC30WrZxNg8PDg5
	DWXGESYNkz4FREQj62yskTa9AU+Zi7sblFGOr+TFL6W7VWmr9GWRNjh0Vd9v0Qt39YEHaPXQMint3
	ZW4rJpN7QjRtJjqOI0X0IC2GyWpiEriywnXPOtsNK4CUke/56i2EEAiiicVqKW2Z5s1HZpxQidFHZ
	DCEkYjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmOE-000000066zL-2SDG;
	Sat, 10 May 2025 15:45:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsB-000000064F2-37Z3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b1a1930a922so2251152a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889939; x=1747494739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=hsPExY4JTfGT8/M3y4ErNDatEJ17I5/snpfPl+vSxT7nr+Qld9LTZkCUx56f8U7HUV
         i5yvtLj1PvcDFJHapPaZIMj7zJQB7PA5Bi7VsxTumWzfS3Rt/fudQ+yMi0+o9nIM/+qA
         FLTnFtwMmjluQZPb5UqmuEFsBD+LoMTCywo3/A7tVYnNduwywOpWtPASGOXz0xm2D3gN
         l4jukssJeNBPARfUz8RSmCiP6EzIpVpLgFTzjzATRJSLM6uqqYsod2bWR1OIk7VTQINF
         pyTwQr8dHG/9uM0cnY7DFqyRfQ8yQyqdCMo5OUAJGtuT1CpmTmq7fq1RgzOxYOSWgh75
         L9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889939; x=1747494739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=ddD4170nguXSE3lFGiGhnre3Jolb+1thdDaHScWGOEpyr5BF6nZ7lXYLZfd7LY8IiF
         BdqLXqYc2JV4jp7oQNvNMtSDCFdJtTSF+i1AGzuOQJxpox5qYvbilAxmLba/kzqi0lZV
         hvkYZgLiPLSWQbhaHAqNDpdm+PkJV7CTBkUVgWTMHrhnK2TAoHWADojSml6it+RkVsVY
         jXCGzgjLWSbyojq0he+ojIkX9+JMczUCH5IGVz/aD8FNAeiBmmnGP8rOo8JubxckmZdp
         Rz4JUCgOKxExu/alIiBPqiZvdm9vVe0Q6F8rymCZILHjoEz+5yYPpLdQ5zuJSwVuUU81
         uNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcQwjdrFYUMP/b5952AbcSd4IlC3xjPx1y2ldLtsiywz2eJcNe+SVAN2manDRhhGTujqskqGBz9KuDjWpdY7zt@lists.infradead.org
X-Gm-Message-State: AOJu0YxvqFolZQS0oqrwF7YvDLOJKnkeMcal/FSKORJFHNaRx3HYFji8
	BAegpdOSykSWbNaXoz9KYKr7lY2szbXC46G82mTUbXQwxVovy1cVVvBXJg==
X-Gm-Gg: ASbGncvTzRmKWLGO0K11zAema7RBekaqobMh4x70bQgS6ceFYhk+YZVtN+NxQQtQE73
	FO11wzuuKHdOvRav4RLxsjrmXHHieamxxFkjbHIJlod+hWkKL2E/PhLRtW7Z//F09U3EdJVN/+I
	+2uECGPJyIwTrEveJVfxw6D6seDpW2056+10K/ubJUcnsVsYXWK9nCEreWByuQdCHTcNZq8Gd8R
	eQP5eBGum1cXuxQEpH1zDhp8FfmD8lgiDhwxN6uXM0Y2oFg6tkOUHONipCIbHWqCiYGLoekms2L
	dXv+0hU4GFv+8F9oxIQPtrtUkLhcaV68Hi6AWjPw45B98s4EafmsoA==
X-Google-Smtp-Source: AGHT+IHmycZ/aubcuUmT3KlKs6D0FqxvUeGQpzaAoaHzC0PGrVNsskD6TOGx5X64B6MlTwp5SLMGBQ==
X-Received: by 2002:a05:6a21:107:b0:1fd:ecfa:b6d7 with SMTP id adf61e73a8af0-215abd07500mr10502554637.28.1746889939055;
        Sat, 10 May 2025 08:12:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:56 +0800
Subject: [PATCH v7 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-15-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycPedKl6IfEwy0+uwFnPe6Ku1PChdZ5B6x+
 HcY9/bBpiyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JKVmD/wIKSyDQM2B87kji0YzCYd1SgIlFwMTLc8VuSi4g6ICeDvigM3F066a6T2XA53sYqLjatM
 CKzmaHqPIrbnnXSEkjL5mGjYTYtES5SRx6k9PQBDK5c/KbJ4l5Xpeh+d6Btgee7PEXYz+E4AjyB
 c5dmTZFhuQEes/57lC5ewrpqZCyccxQ1vZr9pM0jejMfICydp+8Xl9repdUKoCZzY6jK0ab6L4Q
 aVT4ap6D8cz5oDqbDPA2UUdKm83tD/VrsqmCNZKhfvrUn5WPRKBJA/6JYQYiByEQ05EG/gbZ133
 R3g5mJ1oKEL4R64bWbDbtb5z5G19wn+UeiwHalLkwZglCDre69SyoU/IjAcEVFCNh742N8eaLz0
 mKwPvLO9eqc8Ic1GJ1Y1zezdKHzVFRpHG+YxS4ROi9USkGfy/l7ZevN7NbvHbZSRC1NVPbfZ9PB
 dg1Tdhfv02EkcgS14voAyJJXAXtA1XG1/8ze70I1zeQXW0bv8cBhyR6hF8CbZ/sDndcISZ9wI0t
 /vYRyPH8mlbqzs4FWiSt9GQDncE4194KAzifAkw136mNd/4qdXsLU0jQ8VWVNjlYugG4T4Fy2lK
 5z0i6/udd0on2ngFSqRiAJuHb+qhGK+Ua9RroG45AzA1OD6XgCYOm3QvsPJpKL+ujwwvvx1AjtI
 BFTF/KLxIuHy/sw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081219_788737_065E6FB6 
X-CRM114-Status: UNSURE (   9.52  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.49.0


