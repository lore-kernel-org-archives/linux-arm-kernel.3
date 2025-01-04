Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B84E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=; b=wSydb4MbGZR5zPTdzEKfzd2FfE
	6kPmwta7bIqQIBZ1gshGYAH2afXASfiGMGpgI+43VpyY+XR2srVT1HpUu/wnh6OMR8j4IIYXS7rK+
	RXiMgCL/7+mQ5UmqXq1wND+L7EX7+ZiPna87MMRC7XOYNcmtsCoa8Crg5qh1kRGdihmBY5rNuxq6M
	sBNx762NTSkm5sINR78ZhUIbSag+B9nPOyz630KYmOq/vts1hO4vufIHB0E0w8yJmA+vpFbRcMz5g
	LYnLbem7Oog2eF+BVVlMDaoA6jTSnQDQkxCsTV15xKKPP1m7YaLjlm6M3hJ3bJQoowVHjWkZnYsUA
	n7+SP3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyoP-0000000EfLG-2Wqq;
	Sat, 04 Jan 2025 07:43:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTym4-0000000Eey7-3Wuc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 07:40:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2167141dfa1so177661965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976444; x=1736581244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=U39eo/NY4aJlvQI9pdFZJ6ZN/69/ROB9RcfpzYvIH6P1VVVJgzP6qHgvyd6xgWwbgP
         u6kUmRNu4s/Oz5gqGbjiHC9n9nsikWCnJrTz1J4Dzbr0OeBQahN4+2oph7pQmlsZZNmn
         xz0ncCtGk1A2WndsXd6j3zsw4A4lotEfT1d7FVtEnAe9EjmnTk2JsrEt5jC7cCoTfF/6
         KS6yqqFQsRSP6LQysX8sOJ8I8s5nTU68FW0GlfkCAmBofN3jrLIgbK4yPbb+BGBdeBrc
         tSxiAzZlJpyDBORvpO8DmGwPTYQYD154BDscDCktabts9bD6V4fcZ1fNhpbtxFHB/JPs
         y+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976444; x=1736581244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=sagxc6hGbGvVMuQyOmJ8mDfTry7a3HIIHbftHx3yWLmSbDYGrz+rCCXaM9JVHdJEmR
         nBrsd3pU11q5Vkogd8CMCCVUetqocDLIWEPIH5oJkY0efIWmX5IjazN7AbDkNmQuXMNL
         BjJg81J2nZ9rYorF3+1/W/+dz60F19m7tUBN22ju1ciklWmkUab7NX2aVcJIsf5Ndgkw
         Pj9Flqda8Rr6/TdMsb12bQJ6jkrjKpEMiGQWoEspLV8J0fw59WxkcRa3Cla39xGPtH4i
         1wTtMev/lCbuuz95oC9C4KzAngHkmzp9Ankf1HT3RfaWtWkRtll0qYOkjWawKRDijRU7
         p14Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2ZoaoF1U6aU3TwKU3kg1zMTQ/8xZHmdlDNeaZzSwRe6cO19cnl5SCxXNs6yu6Op+aaok5lN/wdzyJqIxsjI+Y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv8dSUnehsk4SvnpK1octXOv2M/pci563EILl8mYJjShKLIG2n
	Dy+jntrzXXlV6yU2Jll9p5z2Rf7RU90UOEvdfstfkwGXCHhPNEUT
X-Gm-Gg: ASbGncuZVOVKd439/ey308jblantqwevtqh9JICeBEg2+gGqPOPhdvr5O6bTH+o2sSC
	cCPCeXjyT1dW+51sNX3PmAffKOHzgHCDOaVJoOfWxUUqgdtSjRRyQwYPApjtsL1uIhvTkWLS4gl
	hU1ruaQGEbjQgUknnMWbv2AS4jTKoZo6IoMXJ5ZvDjbnLKWEdYGYSDWYyq72TfsYa53QbRueSm1
	HBr8XwvFb0nR2wJdEAgekduK561bSnG7u7NYSpH7QqVfbWmbQ==
X-Google-Smtp-Source: AGHT+IG16aEsUt31gOxPdEHIOiEhly+PPdwAHUbVPWapyCabc4BBxAcFCsLxS2WeCaHdQrCno+H+/g==
X-Received: by 2002:a17:902:c408:b0:215:758c:52e8 with SMTP id d9443c01a7336-219e6cd83eamr662739295ad.12.1735976443882;
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:57 -0800
Message-ID: <20250104074035.1611136-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234044_878130_B298414D 
X-CRM114-Status: GOOD (  10.74  )
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

Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
select TCON0 clock parent in dts

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index 175892189e9d..4f220ea7a23c 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -44,7 +44,9 @@
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
 #define CLK_PLL_VIDEO0		7
+#define CLK_PLL_VIDEO0_2X	8
 #define CLK_PLL_PERIPH0		11
+#define CLK_PLL_MIPI		17
 
 #define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
-- 
2.47.1


