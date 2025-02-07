Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D815C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lniNSUn6162O5PDdXje7jyIZ/reSQ42wbs2b2Ye2MZA=; b=nqOIEMT/+x6Srg6pl7zBIyPA+M
	3E8++0a11dcwDk5r7eLtInMqpD3fxkGGaQ4m4dn0F1KOtisVSMlwi8WXWT2hN1T/osK7noKtyG7zh
	wRbrdtzHgDX+CPiUyrHnH0oE88fQiA+8k1eWTENQr3xMMlavLqzHU/mpbCRFZy9iJIa8+RR0LGZdK
	oc7f0sIk+io6CTms9pEcdZZhq0HqKJE1o8AuS2ZyaCo7XQJ7JboSvN+xfhwfQKGBIcQd6DVxCAkNa
	daBEt87kJo5qr5YuISEaqY3TeIx52TiI9be1vV8gWXQbdNlT9I+aedEF2SQinpSoWMPti0Nl/tOEj
	H3QHUSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQmr-0000000ACMS-3cw2;
	Fri, 07 Feb 2025 16:01:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQin-0000000ABBg-04az
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:56:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so69710f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943807; x=1739548607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lniNSUn6162O5PDdXje7jyIZ/reSQ42wbs2b2Ye2MZA=;
        b=GGXNrhyoT7dRWCVtxxQFHLBRfoSKwdYh6sZDTTTaKCrOHDyldvcZq6E7Fpx9onBF/B
         Zrsxy8A5JnrTNch2jOFteSZkvHuMLxlbTk+gDpRutReDExDH6WjYli3yqb7ytFfGkc++
         AsoqzWDD6qLnCJh7LTs6Z7/KvwfDTnLt74TjDY5aF288h+hVRvqdrGqiUE5MmDJnpqt3
         yLbjaLJsWf9FiT+Tk4Hc6OCWDvWdiZ+szXhfqB0/MffpVS36RCTBjGebQNwtQT3jBzIG
         0+YjCzVdGAWCGVn9w2B5KEd8bVvXdl/1CQaueLKdw03pxMnqM8DKvOT7qgMQY667MKOt
         nZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943807; x=1739548607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lniNSUn6162O5PDdXje7jyIZ/reSQ42wbs2b2Ye2MZA=;
        b=ng83i5kE9sPwWtXTiEOBas4GJK6wmCbmUV9A9DV1BXuq/pwzyifA1aTEsGs3sWphZP
         56PODmkgV3y4VfMTcCxLqsCPZdFajfxV+L8yIfIXrF70W5Wy2ILSF9MakqZm38/F4r6j
         jqhJ0tCtmtYfKkjDmKx4UVQ+c7mrGxMW2/StWRW0OoAOyagJDFHbJGXhxwAFblnGLpGo
         8d2hInaEetIZQtDcD3NMaRIXbKoaXA1XQ7KZYxPqxOTdfNdNcGzyONRq1wfzCnjmKDv/
         s8GzMpagL5oB625ugbpUbT15LBzgFz6m4HUz06DhcTYVNHBV6Nlz8pHqfBAaA9NLdxnG
         m3KQ==
X-Gm-Message-State: AOJu0YzzuFxU+b11BTEiZjj/HSSVj6iU/8JsOhb392Euga1KsbI1RjMb
	8PjBnVQbO5xSHa6Ks6nsNOnZNt9+Ua2dhb1n5G7/ld0avXddBW0p76sWAZ/aVws=
X-Gm-Gg: ASbGnculq39q2E1KClQEM28cXYqn2DFiGqh3zAP3cNQUORm+REckRUxcHccG7+x6xRq
	z+7znkzrliA7/NBvxOA49P8TT3Wl7gizcEJk1lrGNAf0xq6DIBk9JdvHs7MyR1bjWPPvwOCq6+2
	nO7nJMhLGaNXHGJdvwXKhOhvnQGG4ao2Vvx8u+K10yE2EQrrLv4b6NGBXZIHoDezQEZhk7PdV3K
	x2SrSBcZ5hUWpVp+0lWih6l9BjEpogZqKF5vlQ8KneYl1PHL0RXZwkmfTcndD6mxXbyMTEcGu9T
	GfDYmplVWAycXL9qopN8iu1mXf5Kr9Z51XXmnqMqWWB9SCOBwPGqvQQiLzILxR6uNbYaTPc=
X-Google-Smtp-Source: AGHT+IHi8rK+1gm4ZytmYt85/APeyehBbsrxKAffiG9SmO0U6k2MkOEmbX+kpklIstUrpkqeHLkOtg==
X-Received: by 2002:a05:6000:18af:b0:38d:cbc2:29c3 with SMTP id ffacd0b85a97d-38dcbc2310fmr1909394f8f.33.1738943807281;
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:44 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-2-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1282;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pYolsvKglKk9Jl9llzXxb7ekkcAK7LRlmIETEtDeUxQ=;
 b=HnSbYgmTkBKh9ZEimff9jE5hKC0fcClxXqEW2F9dsY5a0SY6Ul5MRx0rc8W8ndKqIF0ff2xTI
 /aGvzXwNFs8Cwta+kPFRA9Oe+eKp77wt/V2H2oPsj0NJgHfzj8zwQzR
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075649_060273_82A7E6FC 
X-CRM114-Status: GOOD (  11.19  )
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

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 798ed7b4c4c6..25ba262e3b3c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1448,6 +1448,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;

-- 
2.48.1.502.g6dc24dfdaf-goog


