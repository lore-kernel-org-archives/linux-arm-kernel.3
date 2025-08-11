Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C407CA0ECD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzyO9TBVlHI2cPtgob1qEX4Sc7tYhu57JbOynAF1T00=; b=nuJwR52s9nJ4VtYBU43r1Oy/lV
	aqraN5a6wYAiBNoMymX3e9+cHz9LLrgLQlZuu9VMDX/QEmAmGjOEpy2a6EwbEHYtvCtUebxLW3Ad8
	0yxBtruV6VhjUhb/60gWLtnGmIDfJm+fLhopCR747snUlfGYiArQaR9/qAAU9UnFspavdpISYjHJ1
	DpGMXz2rzDXTmQoUND51NQkVPWPS7na07Eq7K5/sq3weF/MulNSMX4l0/VM9YkGz89dHGp4x/+uvR
	jO9bA7JSYk2BMf1CO7TCdHKSaZ8GfcxAMrOrZ/dRvUE7wQZpynLYm09alAcVPmvQBmi70LCe13DTV
	yana2kRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUNY-00000008BvB-3X6Y;
	Mon, 11 Aug 2025 15:24:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0l-00000007uIw-29KB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76bd6e84eddso5225502b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920587; x=1755525387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzyO9TBVlHI2cPtgob1qEX4Sc7tYhu57JbOynAF1T00=;
        b=S+9FrEORTV8CKtL3IBLOycwKkFj+g/KUMNUXbc4I7F693sL9vNv8NP373aUeId3wqo
         rBUpJBEDe6ZUMwNhS5v0LLlEOrST66W/cjduXIh0iblP/cE6TuW8Pp0J9WApiQ+6MBIV
         aeeAj7BHUjAK+eiznU8TnbinrFrcmR+IskBUJyh9YtXaXZMqOSXByGcHLwG+yHsGKhIw
         etaXBaiJGmdcl4X4cle1Oq/24YeS1JVo5YoOpOWi5YDUpYjWEM6Mgfyof4SRGr+1HawH
         foRwYNeD8c329h2WoVK/Snr3Rsg2wA03ozuju1NLswy/mHVnCy5eiY9kLPaF3aoScDYW
         zT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920587; x=1755525387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzyO9TBVlHI2cPtgob1qEX4Sc7tYhu57JbOynAF1T00=;
        b=pJVOPYfoShq9nbNwxWXs1lN91xlrtazW9vIiuVCJS3W7hxY76smowGUKHR7qHxEDqH
         TOqdgZGcMiQ0oKr/p+pDOZAM2/+K0nx0JSbEwxjz2iqAUrHZaolNqjLnjXbHQUI8QPxr
         puxjfb3I3Q13O7kukp4tjFi9p87tgwLjxWaeN7sIK3RyEXD5QgAMqIlp/kWeKAhIY2uB
         oi50i1A1YvQ1n4L44LoGwjiTlWRrv2A9IKIY22IT0XyKb0swBX83pUdaq36mNEQ5XTqU
         91us/dSmBOSV/uV6Q7r1FOV1u1bbVAjkHB06vjkWQDOdyISyGKmBkpIKS9TGFA8DVYqt
         NSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpLZeNU8WyH28XFivl8v0SuZqjE44YT2rBgbKDRxuCtx1s8t9RBacsqL6VqASZ2v1r1qu0mrRSX1Acm7LdtklP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1zOjVLCld9OU0a2tO0DMDnPGmSCeeqq/YCUzz2V3e/WznNBG
	LaRtHBKS+kUeIeUvma0JjM7dYR8y3d/nnuNsJm7liLfTmkPCY66oMi3YduRjAg==
X-Gm-Gg: ASbGnctlzyVS1opKDBGZXjQLLtSzFN+HmWX7UJibAfjeZOJR6rrcPCdChCMklCBDKzw
	pynjuvRzyrAOZ9ewUVFydvDwpw9mN5FNYlhdl1q5gmGrkLyiWwFgaRmBkdVU2UnqyvfM49NzOLv
	S9Acf1yH+dG88HAYzjFeHAKWmXh/xixaUp/Omm2jfSNM+pdrWNOSGlKOT8jqvRN2a2Su+IjGcZM
	7hFLNitB7obpvJNXXus7MIMIUou98JlfB5wTr8xIM5O0W2fPIi5BjLayxQB33m/ui2WWEPGzqCo
	vdiVL2mb9wGjW1jT+XETKQ0P0nv8QqzsPNzlXRl2cGnw1xPvw7wZ4R9qSSu37A+8Hho1uDVswH+
	Mr3LKDmxG6UXDD+BGV/EUB/Nf/HRn3Q/FdxjsK7/1v6o9ax0=
X-Google-Smtp-Source: AGHT+IE7wVIulw5MzW+7jFqgGJ0yHStIzq5ClP2ToPWDlVbvfo0lp387iCzjoEkRqhGR8ITPJDgzGQ==
X-Received: by 2002:a05:6a20:3d19:b0:21f:bdd5:d71b with SMTP id adf61e73a8af0-2405501aaa9mr19625402637.2.1754920586681;
        Mon, 11 Aug 2025 06:56:26 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:26 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:46 +0800
Subject: [PATCH v8 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-14-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=41txjamnPbAh5QmdirJplHpDJAfdvJArnR9bCC9UlxE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZC6TjtYbWMvMGxoQaVIB/WaxX06xnDnzpev
 Unuhtp3YryJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JKb8D/4hOvwHwoiF6SlzieHwZqka+hBILLsAnmopUlq94FibUzyOY4GVXOlX+aTz0GYmR50/VBY
 pqkCOCcRCjE7yrC4uSg87KWES4nN5pMt7iGMQyuGz2RZziMnPu9LFXy57ekbi9bQ1suG8icWe0X
 igbooTRnmvaWQcB2iLYlsKPVawrIjmkoaqyE3oWGwvwkDmqAZ5i5NKbVyBiYLPD1cHOtqxOPhwy
 wW1EAYmxk5XCjeNLOXzCTk8w9+TLgssDNbN5T3f4wunI/nL00uXEakkDxQbWzx/LScNCBg/t0ZS
 VZvZbpSvgLeyHgNje5hZX1tN92BC2CxFUP/olz1fQ6XW9oJDWvGdK5ezj8QDNK/o5/yEFQSrF/z
 Oz8rgBNjUi2gnAimdos5DxYO6O3xOEzwHyw+n4stMctffs9DiSBGxqBfrpCjU3npnsRURNlzTHS
 fu/q68vfn50UDAHz/XiRcl+Na71+JUzEE25BADPf6x5fXBUzl4ekPkcM3Hn3Lx5FhyuZoKwo9td
 B2cqNfK6p5X9q3JxSoVwE56I1QtBSNzKzGRmNl3sfz8s9xI+OW7Y/8tmWx1ODqs1fN0TkmzejPk
 AIOjAf3J9kqPky5MoJ3Fj6DN1oWiLtuwOmaW5VgKqGoUW4M8Jlt98+8vYbemNK3p+ybCtDMaNDN
 UkGuYLdY6CfB4uQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065627_554545_15694FBC 
X-CRM114-Status: GOOD (  10.26  )
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
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
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
2.50.1


