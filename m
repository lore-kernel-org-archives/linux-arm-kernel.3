Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9316CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STrbsxYWItkqEzAymOvwmHkPYbP8QDJrOdPBgIyV3j8=; b=HGfYhzKVa0YGeaCjTdrS3PMsMB
	wgAA+2pQXeLaWmVBS+ZE8eIN/THCsh3De1QpN2zYbprmAJ1I7NRaxkjo5YVTZrafSIICWcQzUrj/9
	ftltH4FdMrrmAdXrJH8ND0dV3efsHT19cslPrwkOC0nZAtoDJ68wOEPmcsWs3vi1KYSDZspD+CmCo
	A7z7rrYjg5EINanseMOK/Mu4pKySNwPmb4o87LMdDREKCNbPnMp5psuxiL9sHH+XlBdNSI8nc0S08
	o0cxcAWq5jZ4sWtmrnw69RFtIp3iLxvwWxrmt11ay/e8IYMMOwncjy0SVbUDh+KXcY2jUe6EwZ2Xj
	U7w3kjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUXv-00000008DJo-0mcp;
	Mon, 11 Aug 2025 15:34:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT14-00000007uPm-0cha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7698e914cd2so5484307b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920605; x=1755525405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STrbsxYWItkqEzAymOvwmHkPYbP8QDJrOdPBgIyV3j8=;
        b=ZA8L95to4x7L19NKBAL4Do+CZIxBGvTVcNiy7nwuN9Hu1Y/wzgK0xWRUNfUZ3klCww
         Hl4Ap8miUz8/xGFeXsi1KVId030ATr+o0Dh6DhmGQ/5LBsl6q0ZVg9jVDNBXn2KRv3vI
         z0TDoV/VIhWZLdI9NIGLG+j8CYzGtbAZs4y+CqtiKFrW+JpgY2StO0xmPv7Vp9Q0ltFN
         l1b1MOloGXwHn7DBfqrMCCIAYd0Y/RPqKPzGOvtXxz+jqbO7zd9tc8LQvJHof9Dy9iK3
         /KYI2SWIdo9SvLl50qbihBE5ceaTGqKfLHGdzFTHowkcve56hjg0tsDOhn+tQS3U7RkQ
         pJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920605; x=1755525405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STrbsxYWItkqEzAymOvwmHkPYbP8QDJrOdPBgIyV3j8=;
        b=F50e+adEhNe2Ri3jXRiU890ic4YWxyQQXTDlOxeKuAN8eSFw7izoSEDz0Cs/qU196s
         zRMxpddrnwzzocF1nU/xMgAzdEtH849M5T8nHpsGzTSN2dkBBqBpnFx1KWL+IAx3XodO
         Z9Vaw+Jo/c1qUMuPnycOoEY4LchD+LBXNxczcIU3vWjVUcuO/sse5MD87+jWgokdOdk6
         RVBw+eIzR3KNcKSXwNAL2MSBfT4UnKRM/+8yAg8Fqxb7DCyZ0YZG+m8d1YkbwfT1MglB
         Y/OiDEh2L6P8e98x2eZpPp0q0ea7njyJo2WHmxnnaLP0gRuVZ6OQXHOahgzlS/q2qKYt
         ds+A==
X-Forwarded-Encrypted: i=1; AJvYcCVE4sztt+85Uh89MmtbpmaI9TClGLlotjy3NDu9VcMlp0tZ3AHLHEWPqh0HjyEB3gKhhI5D71c59gQb9oo8XYzO@lists.infradead.org
X-Gm-Message-State: AOJu0YzLwo2ovdQxT2dVcDTId1+b7vbapt/iRcgFRyW1rlLhxAOdtSSs
	QH4caf8w+jTasuL3VHYcYuUXhpPDQLOL7YQOVNVsu8SK21hVTUl27rsv
X-Gm-Gg: ASbGnctmYqzUaZTKuNX+X6WBywtT52hHYbM4+aZQJO9hP5W855EerFr9y0DBMMvF2cw
	9cr2y0ShH2S7kLhd9Fj1NbTZ7Kj/PLuimETfq/T8hVxy0dYYRs2rwOWz2ziHG9bW3z5UuASKcWb
	bWuHu2ZWcIlk+XpXOa+BxUuo6xUJZo4upvfOiXSA3LfrEew4skmOeoiFkPYQy5xJhiAVsktPFFU
	7vufZdB+k3o/Oa7BM4faCJ5HZYndCsEuS6wtFv/UIua/FDVdUnnov8WOhF7LtrVJKpJ8fNnbgWS
	ud6yDoOc6op2eDzW2PVrqCPwmyVXaSUUVZ0xtojHv2uYL5vohKpvhb/N+2ctfB2kQOnOga8Y1VC
	YriOl6Hc5WVcBYWDo5YWq8MBraFAaLqw7Jj3fRw7Yc63ArQThT6cOFZsF3w==
X-Google-Smtp-Source: AGHT+IHBD2IYxmueKQyOcCYzWNBHtwL3jKLlI0OgxIqBd6mjfZItD3c3k99yQtX3GF1PY8NI7NniFg==
X-Received: by 2002:a05:6a20:9389:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-24054d84f37mr17824995637.0.1754920605437;
        Mon, 11 Aug 2025 06:56:45 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:50 +0800
Subject: [PATCH v8 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-18-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=q+65zojFG1TGAHucNLr5jhX152q/m6db3+pGwZ+9s8E=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDWavEb9dp72TKegs9MzgJCqQuluiaAYYYK
 25PHqyXvMOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JGe/D/4+2TtPJxUdQMwe6Rx0KfNo3BxF4xi01/ODm0qd/4YMWc4Wk3g5FY7fiHbSmurf3T0uO9N
 T/6P6vFc49AerjPlmWzR2hq65X9QTq6PY9uom5cQTp8R2vc/vbg3ZhzWL/2m9O66imp8jsvz/Pi
 x9eTivGP5M7JVpUBqJ9LoTMl7AF/nGy1RqMaiD03iFaJhKjuu3/W/L3NvrXAkU39V/a424tks5E
 cWQYFJ4gz+XpEa3Osfp4PKRjqxlOxfHYLMRMLbpwsHAogQ0Z8k64jr6mMGlnyKOdfkn2EV3aOxW
 s18L8MWW5S9JggQoyWcbhloriXjVsN26+i1+cFTADNZo8/1xRbOdNEeZvJ5taWuyeYTZ2b3h1KU
 QBXsNb8prJIG4LCSLCIllDIsAzTNPkaNtaq+pMWZJOTt9nO0HpMDC/eZQ8tTD+cpoucPp6Q7o+e
 ED2ucW+2gAjmbiWm+HCmJ8DfXMll0rBgy/f/9B3u3ccDaduTz/CTgKK42CWMpQXi2GKdiO7Nxse
 uUQRsN6gkvsmvDBJHQPck10E77oNcK7BquLod1zMRCxqRswJTY3QbhBMc5XVkIG03seXm71w6T2
 lYs5Q/+sTtzmZRkYPE7pHyEj7kW6bKCmfD36y7cmX+OezPXuGNRUF5fzt0l6zW6bZ0dVL/6pgFY
 DM5T++v71Ulj5yg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065646_228532_BD577241 
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
2.50.1


