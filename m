Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C714EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=; b=cGvMXXdxKHuYze3vQX9E+zGMH3
	y3RwsJ4eWTHX3ZGWsxJ6zFetWerYUot10C0SvFN1Uk6wJ8n7fDuMFvAMlsfDsbnHXhpkYaeZO1yPe
	OalH3yli2faqLftBSN6C2QXURRQ0Kxt/9kCB5Mcz7UdKJWc86Np+k7BlQf+FuupUT7bl7WeG+Blj5
	ZXRghakwYF5SGcZzYxyJSJG2oJSA7Ss9w7dxxI4aXn9HOfWTBzcmdAab5oLwnfzLcyOn6CmhCCEfC
	uw8iicGmS1ffkf7WzYgcNcXBMdfU6WSssOmspHgxwlIuOhGeh4+26fH4xTDN23uGREUEv+yEBVgcW
	KeF4hKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaY-00000006j6u-3xow;
	Thu, 01 Jan 2026 09:03:22 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaW-00000006j2v-17gT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:21 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso18067239b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258199; x=1767862999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=gj9CRoySjw+LEEzAwLJOdnkOH2XFKhU+VcNw0hvhbisNP7FuEUFi0njhQ6WcgwpRMU
         cnCLDvepoSr7s6nKGJcZdCbdHtLT0/DqaypGfO6QlJ8lYw7q49I3NP8OQc7CsqGl2msB
         k9vvYGR2Ige4ylmO3rTswlFI081RuRDhKa29Ut21BO7ZGiAeLkYZRd5Vc7wGN43XwSQz
         +0CvRkJ5YVGRWnl7EDuocYaVFQWF4D9cJmJf/nxlqrTMNLOCnc6ZSOI5UkFEQeWCI2RQ
         A6Vxam11M2X7H8jqFTZlZs6zZ5qOYHTKSy7vnLY/e/GWV26fEKliq3t6Fa1H6VBwohRB
         lo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258199; x=1767862999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=ElytaiEYg3CTfKsz5OIKJmLGg01lxQhdkfsPshlQXcHT9yJlg/9hYlbbAA4ASrSWq1
         DndDl7oB2jlcbd+oc8F5cFAhwyj42D8gVhKkDGCdQmHo6lfdW7b1a0qiy5/uOJts4+Q6
         ilKZB2SMbP1d6kdjxJHciJ5o5Y1E6HOjM/MeVZU7glyAbCDn48+txR7PG0YLzplY8vJo
         4GJYevOpS+NbCw0JsZ5tMVftdB0/CcbhkmhSQO1hH3cHBsQrC/VL3XTLjG5k+5Xknu+X
         c3DM/iJCVe1mBrayIMATlPcsiGR823EB10oJ0hUYyY6B03qrNtx0DOvWXbxNjvpL8kuy
         j/2A==
X-Forwarded-Encrypted: i=1; AJvYcCV31S6vvJNNVZYN/mDnIpv9pC2PA+0/v0heD/0R3HwvvcIWTV85oAMIHvzRH+SMJgOJTuTdgkLJTkda1r2G3dzT@lists.infradead.org
X-Gm-Message-State: AOJu0YybFVvPYOTB978G29PuiERuV2Oc7BTZ5rmFEpT7qjQvWKW5GJO8
	+WFyMEINnhs6+DzMmwp2u0f8CX/RpsJkCdq0IcCsIrjf4+n0dd0Xmntn
X-Gm-Gg: AY/fxX42O+sSCVRjz/0XY5pgBnE25Pry0KUh5robbIqT3MxcBdrx6Pg7YI8CtakzyXw
	XHNCTMUHSrtP5C+8fBiQXu3VfNRMJsktRUGTmIRXJSBqxAeh7GGryq/fg9NVKpaqIwdr+zi1zcR
	gTNCM33RQL4//9c+2MZCgwmu5SXv2p1XOCfq5ucSNc3o/r18TPfppMfMZhN8f9h8FUT7FfFvciL
	xWEoZ0irY4vKc4KDBu383uX+/RRqcyZRF+akpYlK5jn3sc3Xdj1vVgfWSR+9KfQd3sIbS2UBjns
	JZ6HF7JSyhOzHQJNe5pr9mb8+isVTw3mbCgLK0yturBq/+fk8EPU8/nDp+dLW8JliiOE+4EasEy
	+nOI0mhrEWxH28riX9+NaBOACd6bWcqgQW4VV3nXJmAwdqbqDjm/4LFVzScDBQyNYLChL8b69ak
	araDlq55GacdVF
X-Google-Smtp-Source: AGHT+IHXyupRiKKKb/4zoV1JNUxwD3K40/cUxyX9Y3ajY/gxIhNiwbzT7FWVFkk23aFojsc3KZwObw==
X-Received: by 2002:a05:6a00:3016:b0:7af:19bc:ca71 with SMTP id d2e1a72fcca58-7ff64dcdacfmr33662579b3a.19.1767258199200;
        Thu, 01 Jan 2026 01:03:19 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:49 +0800
Subject: [PATCH v10 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-13-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoYJSa3RInwv5nD+sjZTycFbc7veNNrVV2u
 Q9bgE3qS4uJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JDV1D/4qSa+sm02aX09GOAHOuuJpgNky+qBCXNLWI1+AcOBN9LiZpYQ+Fr90I8D97ZQblOanbo4
 Bm5YkCE191yV0uwSprrmzRCbfOCtbF+/YQWJaANV5VvkXpQ4CNiC5svCuQOWUDd1h5AjoE9vp2R
 +RDzd852r7hJf2NDv75NIU1oLo987J3afoAJ6l/jhq4vO3CUsOKFUrPUXA0Kq9MF0uRZSwj34WV
 8LI4nH41oOLLGiGP5hEJlHJZmum8gKhRRs0N4OH66OhdsWjdDqfV+zOk1/E0kBCWmCuZNQ0KBcr
 dw68Y5w3EWMaIuDZj7dBeJQdDqojMLrQnBMe/9mT9ITUjwYb/2DheKcn7EnzWZDC8nSHtDEIviq
 kQbuSGcKst3sOXRYpUr0W5KpfgJqTVQk1XLbjwpzHg1mNM6U+EsWXmB9+nDFmVAQ2dj6KmGMeXw
 dRQIGucMqE9rV1rB40KBG+ieJF9X5lA1TkyF45Qlzn67TRGBr64Jd0fzbnqDtBtuvxGiY/MUdMb
 WO+Rd2rbV9XmSgoC+xUz0krZSKIx0FCehBMT5nZLLf9m5bc0ni/m090vXq4ZTjZc6LImlcQty7C
 SjnuDbsMj0gt9FooHtsPHqClPaixtwRkrEhQpm5aXqjOdN35zG092nyc4k19xGPHjn2DftgrEhH
 SPQGCU9hqN5jfXQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010320_355167_C5D84B7C 
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 462ffdd348fc893d8e1d597b11d063dc5f88bdf3..d7a9cf1bb4911805a946d64e5892c1fe4b832186 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -227,6 +227,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.52.0


