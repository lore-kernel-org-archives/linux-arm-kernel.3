Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC33CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=; b=wIcby/Bpmz48f2Q3TSo8txXDHf
	T16xtO6dp3ZSqZiPTCpQSNmcqlMF3a7UCD6vg0GyQ8YUmFCwKDtr1kxTCyF/47S8DBAAtraqiVXT3
	Ola8cmczwrASvhto8JeY6CkurhICfkq/6Z2jIWUL00og1+e9IAuO28zNPZpQVnDpg+l+3s4ulFwVJ
	o7S5OW0dDOfQv64yCDZ0n1nm74SGEXlHKGjZvLfE6oyuAA6CWnnuE1DRwt6MxpbjnvaEVEnQzeQFU
	1vAd+EWZH75cVGSip63ios/Fbi29hN6ZGvLA/g6/x3lIzrsXB+WsaFyQ4wGkqS3PCMdfj3d4MyrTd
	JS/DIouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1iB-00000006NLV-0HOO;
	Thu, 06 Feb 2025 13:14:31 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1cE-00000006Lzy-1HbA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:24 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so177529366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847301; x=1739452101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=ICrOpeXnMAJULw3sy2yFq7zd7GElQqcNxCQVMCTI16E8KUDUmJ2zdQiAA2yS0988iP
         Szgu66VblnCkUQzF0GuPCo9eKUZR4OLFIrwH7+/uo0DiPYcFQcLElY4TJM3c+mDKH67r
         4mGrLBvXCIBdN+xkpQZ5qvARWy4Xl4+/uNjAXvo3Prd/ZpOYvlaJY4u5NJho5RYxclnU
         EHRVlsW1q5olh1PuWjVp/ueWghYuv5w+pJtvPUf79iAyjye58xbEgbpu4PYJvlFbkpao
         10Fpq/M+yFgL4yjiqFXpTu0OS1tjMJYwoVZPoENV9bdaIOXL6eR4JOH/RHqcKOrcuD09
         uRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847301; x=1739452101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=XSaz1hmeFNF2HjxyTecx9vy4X8S2buXjNL0AQWCZ5yK/vXY+DUBvq6syxEzGwK+Grd
         klwjX9HgaU1C6wBa3S67hgZwASjHXg/BTXmlupozWnbgeJL96t1AyVJJwQ2mbcQiUsgX
         +A1obkot3W9dFGmcRXKJMlukLdJYNb28gzEP+X971Hz1JiTSuJo96kel9WWDCX6hvwTv
         GRdAuSNDx6D0o4Yzvsz7spAU3uty0xjY4gsFZ46flmp1DiMNZS7DHP1AuroaZhws2cWv
         clTm/y3/KoLWKydATDk5ieN1XMwUSKmO8pu9EhUK2HP/uhMRi8hc3jy+g891dzPSP9HI
         zMKg==
X-Forwarded-Encrypted: i=1; AJvYcCVOn6YqjuUROMWBPUGFo9pWURN6bcxQ2zkbxDBR9K1yz5S/22Tm+LZ2/TPnBNPrKbmxSvris0yRjjvZG8KnQwP/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5bnryT2lawwRLnCTIOo0cLigreBUhS/zkkMn5dAJSMxFlVByJ
	g/k5J5qWVXkthP338kE6VBMLV2ek+OBUIhKZ6qLVP9PrYsiddXCM35M3rWBpsAI=
X-Gm-Gg: ASbGncvPmqiwcoAYwINxfdFks5iuwcl5e/5/q89ZcDE4UqQoTTAZYguwnCKFLBxiTyD
	2jYrz/+FkvOipgwcR4EbOLiPfTFSsftSNmd69Bu1HiNGs83xaO93iUq/3PHqvcJzKWk1nU4Wbr2
	0cXUkFlKJt4NAnzogT0T5EPHsEcFrOPbv5PGCDMTh0EhoqW3MIh1+R7X+6xfAlLNgnaA6Z8V9H1
	/eLpGqXRHeNYly2zlQsCriWFwwrvh6mTcXIQBg2FETNrbqymhvUlhOqM4bI9Q1RFIvbWy5gz6zZ
	T5psJgZj3fRSl2AScwYtZznKycTlH70XmYkG6k+nYlrVqVQWb+gXNSvmWdQ930PE8+TDNbRuj/A
	=
X-Google-Smtp-Source: AGHT+IF1BlIvboKtAcfd9MgfY7h0B//QZpwtD6hvZuGWR6NA7xoR+qRJFpfzOckYvT3dhmaj0oJQoA==
X-Received: by 2002:a17:907:97d3:b0:ab3:47cb:5327 with SMTP id a640c23a62f3a-ab76e84c45cmr374142766b.5.1738847300776;
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:19 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: align reboot and poweroff
 writes with downstream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050822_348776_0FAE019C 
X-CRM114-Status: GOOD (  12.21  )
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

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

For reboot, downstream writes 0x00000002 whereas this here ends up
setting bit 1 only and leaving all others untouched.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..4f45bfeb33c0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,13 +1401,13 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
-				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
 		};

-- 
2.48.1.362.g079036d154-goog


