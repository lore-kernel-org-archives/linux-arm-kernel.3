Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA6CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlK/iNZ8DIEQsXS4KP8/YUmihD2i2QrXsBZ3ReqKvlQ=; b=pM5Iz8GQ/i6oeSyX6lYqRqpuOb
	zEDfBT3T1Pr1aiY7Jbrj4n4fwz9pQqacmTjOgdZx2I384ZO6sHGTaeNxCmeOX5JWViNBiQu5ZU9n/
	VN3xJesAGvwMP8WZ9HFwwTTDLQAXzdq9Tel/AmpqX5c3pRWv4Lgy6jfZGhmo4X1tPXbWzHo+tfkxY
	zAw8IldBK9iWjSraGZs8Pxn4nWRjWoCrW9e2/Z0qG+6zMoTCfi0chsaOmPs32tGJodyug4lHIf+3A
	YV1+04nGamLnsI6lI/rQvkEK6rxOacrXKmzdg42ZbIvdsJufhLDcnrmsQhX9Ur7ISMBn0QnI+6Yzl
	mluhURew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Uc-00000008Ctg-0Uui;
	Tue, 09 Sep 2025 15:42:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLE-00000006HrK-3P7x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45de287cc11so11981965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412767; x=1758017567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlK/iNZ8DIEQsXS4KP8/YUmihD2i2QrXsBZ3ReqKvlQ=;
        b=GlgV8un6+Ota+t+yjjQaSoOBdHB5JBXtbMbkqhw7YZt9hoL2vM9zfhPfdu5jtZ1rUc
         RCZiGt4ZPhmbSAgJTwmVQ46+zpujd3+PtJDReRcF5lEG2E9+8J8wyFjW/rFlwlfIajU8
         877dWy46mbThICUimTcvLjdE+xY+CpfKsIbAR06QCRT8+mQdkZ4deo4Y6YuN+4p5WTYS
         cDje5BIO3+1++tCzrcE46N8dHdQLFAisHuwlonCNBJi/eCsHHrII3yRt00mi4pg5yEpw
         XpaH/BxqVMFVxZeS/gO+63mImjLHMcqZOT5XrJaAkNwfH1f1d96GU2/xWqH7vLNtxpn/
         p5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412767; x=1758017567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlK/iNZ8DIEQsXS4KP8/YUmihD2i2QrXsBZ3ReqKvlQ=;
        b=caonRmOGiAFccxU23j4n9PBC/SchgP0V4T8dt3GW6ExaX9hYC5/z4DWgplBMLaPboi
         3Mn1j/5+GpjIutXmqdzQHzenYcFZrMP0XxKdNmvfp1gpqvvceYVuxgjQ+5czr7xk/utp
         FU7ukZHIIJlOxENcAnDZ8y7HsCkYmf6FScLC6JXuHf0l0qdHY/xTZs1p2uey/UsgCLP6
         mppJFz7BbA9fZ9ptV0Ma1TCXnsytWP+l69O9F0RQUAs5WMTfW2LDORvmvCFOKTJanNSD
         vFVDt8j9n19mJ0lUDqtsOW8CwJwghlhtMJjt8PClm5fG4HMLlKuTE5m6cSgPHpg1CMjT
         akoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMS4CaPWVrTC0CYsDmBB3v4gWu/e4rb4aEi9MxLPnh8w/8cCsBmEOAdPPqC8481tKpo2PG2Fx9+yKvYwF2/YMP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5hcLGqm2pyapHcvFe2JbNcI0F9exKQ7nTCMUKnu/p18mAMMjW
	doY/Y/tNe1xLsyYDVR0OqqkEqVSb0CVzd2yRULuvRNcWWVn3pZ/fG3zx
X-Gm-Gg: ASbGnctwHVs875COvY9bXVoU58pns5fLydxPfIxguKeU1mR3L4d0S/cOvD8a0TDf4+R
	N9+BkJopzeHhQc+Hwfy6C6O8OfboWiOJxMl6/i/xL6+w6VC1gvoa5DOoG0kUoRE+KGaQSpNoUsv
	8ypNbnXuIHm3yIiExpDQBX5FwP+cbJNry3TbJFopPmkNp8p5JzDGOHrvdL6MmqlSSTqfNdaO4k+
	58flYuycl2yinu4GH1MNRPkocUuL1a4yXfLL6aeoPnKA4JYa7OV9YaFwuVZuoKfSHJe7YxcBECN
	jVqZD9s2Ff+tWXT5KOmFqao8vfjXqNEHhAGGy0KYHYKihlW3T/eQDK7DpKzi8qC+TgEit5V/khU
	cdGfRI1HpEHoYN2pcSCVTgx9bB+yAMbYvxb251LpQeDdvGnOXMPHEUXzXAHUzO2tUqWJiQbaHGg
	rbtY95ovpaSWnsP8k=
X-Google-Smtp-Source: AGHT+IHRIX6vr2XfK61Crfawn0MHIaaIC95LfFY/9lt6EdrZ/Z8HN/tDbVJ1BoCPFUR1QpzV15dodg==
X-Received: by 2002:a05:6000:2910:b0:3d0:c6bf:60e1 with SMTP id ffacd0b85a97d-3e305964e1fmr11645857f8f.24.1757412766899;
        Tue, 09 Sep 2025 03:12:46 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de229238fsm112894875e9.16.2025.09.09.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:46 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:24 +0200
Subject: [PATCH v6 17/20] ARM: dts: stm32: add ddrperfm on stm32mp151
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-17-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031248_860833_5DCA9BF5 
X-CRM114-Status: GOOD (  10.45  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP151 SoC.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 0daa8ffe2ff5..e121de52a054 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -383,6 +383,13 @@ usbphyc_port1: usb-phy@1 {
 			};
 		};
 
+		ddrperfm: perf@5a007000 {
+			compatible = "st,stm32mp151-ddr-pmu", "st,stm32mp131-ddr-pmu";
+			reg = <0x5a007000 0x400>;
+			clocks = <&rcc DDRPERFM>;
+			resets = <&rcc DDRPERFM_R>;
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;

-- 
2.43.0


