Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F36CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=; b=hBy1OhGZEeKtJgSdBuaE3r/iIS
	S8mVJPziUCpmPoDhasO2DUxJEKAVUzRZwRS/CNReWQrDh5cTHZbd800HMs78Y3ZOUHbvSHk19Hhkw
	W8essyLGwz3PK70lmde+FO6rMO3fhwUeUZZTu5SjV3tEyXaIE6slvAUeNzxJBkJkfb0uTj2LwWhOP
	2fFpfU5zV6NrYnGiV8/qdqioFqNCptcEfiiEJIYr0x9JJlr5ZNPxwHHMQS8XCWlywHTxQP3IoW/nR
	AW8BQTd8O8ofqIDmQuRaLNamNsCsnIyZ/+6tRjfKgMbIplw9dDaH5gx3Bik1VzHty1OIdZl2jZ8Fu
	z1b3XLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gak-0000000GjTZ-3dLy;
	Tue, 14 Oct 2025 15:05:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaa-0000000GjMN-1iTS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b57bf560703so3544729a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454323; x=1761059123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=bDcxEzInNpMRxStv/iyEgqoXTyWVOQQLUHe78kMI7ZRfDWyzLej+eHxP+R1yflBp7a
         8kHiG7jJUV2HffBRQWByjGVIWcq99KhZdhjiE8L9Nzw5b+nizcIKCM8w/mc8oAat37fL
         2ZP/DaE2eQb+rZ5EAiDTgM6K20JW24gnZuBt72w2ob5Gees+6/MDCQuSEFCMn1K1ly/V
         +6fmhgtLyHe/pIw39FE0gT+4U+78yYZtjbLH56UxzVt0mOoedHH6NHxXIK0VYSixrg+9
         z6yLEm2vLc9ft8vSzvZioMMuD7x0JlgAc6lgltIRlQA2owIio4lNCZNtcTe7jjBXIFOu
         ElOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454323; x=1761059123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=pVj9hbKab4QG9FWiltg82917Bx10FrD7CN6tjP719jRFmuS8sUxyFSe2OB+D+0LgVJ
         hQBONqrAhnmZ7Y4/ubRJPJDO0D6Ba7Tx+nVI46Vuvtuik2J3E8zsr3UoJ4ApvYvzUgck
         fDABNdJoQFiHGPpau9TnM26llaGrB12xZIbBM0XgdG+UvdqcFC9Nzcov4lZ5F8PUYv+V
         ymMW3LltQswrWgufLNHLHUshuzmUE0r153LcrsVSbhmxJqfh5H9vBRD2sz5jge2OrY35
         3gryb0sT+IXS2zPvfKMSFK5UNAdEppZ8p+WhyoN+8fgp6EgOmqfhuHb55J4oua4b5WDy
         jN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC9yTJgQGy1Pz4M0hxS5qP4i4LNUQEkKJs/BjP9nXnc//8gWcjgepSnzSnwTVnxZnttJpt7vs7YKLUS0cS6j7z@lists.infradead.org
X-Gm-Message-State: AOJu0YzOUEJgJ461G/oofNcHYSy/jmMBwhSRmI9lcx95sp+53qvWhm66
	3N/tVjDww0CoGuhnEBtm98F+U5Hpe03MARRvZXAv9m/7IxQX5O9VTPnu
X-Gm-Gg: ASbGnct1Bf5TWDfiJQCfeRm/Cgag4qwixTDRskNlTWtf7jyL9J26h4FRjEOEwM6Tukj
	dNO+IZdiDL79Dak9w6l/MteDrT6ku1Ho/a8TRg0C3ZLGXDtULPtpg1Y5Nie0bjyAqZd5Ezr3jbj
	RegQRDV86tg6owd5WFPyyf2OebVnZYjOMB/kQyvPC6YvKUHbJv8/hMuaiX2w2oGIBNRGkCxhSem
	8GtKHP8r/u8DlzT4euhCcDfC9nzvW9GUNvQZE/1U3EbWM2LyRMwgwHL96pre8Z3hR6TTjVLGFJJ
	kIyQpJcGHMxmIbgwz/OVYmmwx6lrUcMGfILoMeNumP4EfGXdX4ztfIq/YpObB0dE1/PXGrt51Jb
	WvSUGy8e28rX32eaUaZi/FysuXXOiogLWuGyy1iNwKJw=
X-Google-Smtp-Source: AGHT+IHWoti0arhwAJ8/ehOp+A7jTPL4DfjepOYMl0fCMINaTjupjut/t4zvp2r+UEnm0n+I2R1stQ==
X-Received: by 2002:a17:903:2b0e:b0:254:70cb:5b36 with SMTP id d9443c01a7336-290273568d8mr282473335ad.8.1760454322930;
        Tue, 14 Oct 2025 08:05:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:51 +0800
Subject: [PATCH RESEND v8 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-18-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuYkjRFb4PXdnwb4fw8h24z1bFwhtr/DQZY
 FpwFq8WkAyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JPvuD/9ymjV0qW8N2VaqTxRqTnf7Wso+LimS4Evbq267jx0oIEEuxIAxTGDbeQWAWyet9DAebNA
 tHZjixPKFbR2gP2QQkaVW2uG0jZ7xSumkITy8nVtog1K6USKN06PNnE2L3D9oAfhg/kFPhym874
 eY3cdNGD4yoZhDeH441f44UswbG6ioxOJFOJQvBtWvwMRr3M4pX+6jFutcsAy9hyd1bAG99Xfqq
 A94kTQmdAJ7IWGM2LsC8gKNAaQMTdlQ5pGI8mdVDLMpT10fqOTt7sUk9SvMF6cffSuf6t5yV2fw
 HAnndoskEI03SeHfRmAqLzonuDsa1I4NQxmRZMUq/DsGjoBMr6nHp9ChSC3ve0awXWQo+0oeobB
 6J0CpZ5KYPeluNH1qA3WdyRWLIp8nWZwFe3SvuSUWUpJhSrB2j+MoBxjPg8gbRnGgloqHbbe8RO
 8jjLSG3KQ9QBRt/dAkIxfkGB3VMtHSz1Tmx3ElsmxIKdLPIwmQTa2DlqERHfztZW8lEQPyZwz7I
 12zfqcYDWhn87u0lyqFVfUZ6kZcRUx/tTBSLp1fjXm5JRJ2KmTb7EhtwHmwQOP2lcnSMpq2opY7
 d2UZgRW4510C4wxfSWVNPuZfSVJxaWJM1UiqpE88/hPoMl+WY0g3i/R6/wBuCiOrq1vmlW4fqrj
 4j5IZLtJeyaobJA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080524_543762_E9780843 
X-CRM114-Status: UNSURE (   9.95  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..d187fbf7e7a214cbbc1027034efd0724ef7f8b83 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -256,6 +256,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.51.0


