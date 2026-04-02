Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5083E1112274
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=; b=sr9fwDm32KrqPKVWtAimadyc9c
	J4O0/t8FXjLhD0pHLEROu9f9ygVQ3RZwZKdfTysPql1YiDHVMJjs5pviQrzk72XISKjBWN7yooQRx
	vZ6HTk4DCCZRYk3UBmtru67M52ctg7FJDv9Im/p1rbbZrOaBF9LLfTQmdmJ8Wys4GdIIDQqRIlrEP
	1g3dfkh9nm6drlLBOR4DC9EHo4C4nSsPcZg6teH6TIHQrBAj3RhoU8eYM8B8jh0Sr6p3hfxi2uKGe
	3YwRxle91sAapq6bJuHb9xVJnuF20Vfr9WFLQiSKkHf1KtpAVsa2h5LKjI1fZuwh6bt7yHseFTnDy
	Z1KzjTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87ff-0000000Gb6p-2VdD;
	Thu, 02 Apr 2026 02:20:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fc-0000000Gb4X-251j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:20:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48374014a77so3947955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096430; x=1775701230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=GdILPMzV0bMOykicXKQm67/we0PAIuVbDtT66qkjjcWnnIiUWhwiuiP3S4aStE5Kmd
         xUk+F5uudwBAvbaffqlJuKKjkVySm6mmp49WdkVW0BI/5znQ74scbs4UhO3ndglTR4lK
         uxker0YY7j393TIUYrlsm7/dGhCyyQkLGZ8JkY/040RSe+qmhnJMiZMtbIUJ6L5UmKkQ
         8xadnvLq5BH2npwqpPAUdqFJzkQBYcYTAZvb3GjO6/B37au08G+Dsdpv7s+YnMy2A59U
         9yDH3QUQVkBDCxQX0bOiLbQxB/2IFkDl/33IEMk8psOCV5mkzD8ZXYBF0YbPjcxYlXSn
         NbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096430; x=1775701230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=T8l67j8R12/NQk2jLIV5KKYxKx9KtpQ3XtPW3mBUTZ5DJq1fRrrjn3iINH6yCPSf6F
         BU4CAyWYJu3N0FmpqHfqkcUMBySoMI6RrU/bagiF2333Uoag9uBsfokTHIAxILfLMRjh
         ue/1w20nz0YbYzaSYdeP2hJ0ronXgwXoaPzjQqedkQJKoKwDiFssYkWdt55x8EfPI3hO
         1v8or/sVbmLS8cbYva3SLvVIEFMKdV6sm5WEHWVJnFxZSWfqKngiotkUYo+Oog01wYiC
         7Q68fLlzukJoriSM2H9Hb/cv5DC7seaQjDTNIed4Ea1SiKNQi5cL+ojpMKvYN8ZRygqN
         bZnw==
X-Forwarded-Encrypted: i=1; AJvYcCW68Nzt9qSIyhmvS+w8hBCb/o5asJxtyorFi6FM2PPvexkLT0yBLCHeRyjz22gtzE6qe4REB8YfGbmUD847njXS@lists.infradead.org
X-Gm-Message-State: AOJu0YwKQyld8o9GwoDPtpCopkrLVIdPTcCavHj3aNPhh1GBxupF2Fnc
	0rS0kryKCHWfu/+3Iz+ZjB+25W1+/79TuAdmcHZt17bntc8g7sK2Hw4xhuIDmKjTXgZr4iJU+u6
	atQXvZOs=
X-Gm-Gg: ATEYQzw5OOW1xKcwGGdP90BpQujV1FGlbH1u++0/Bnlux1QiZVRewIp6NVjzoihHBpy
	gjLls2E4MkUQX1bIh5+jHB+XFqJGaxGYdgW6a3G9ReErCezE9+h67NXJNpA1xMb9CVJwTuh6tNj
	xg3tDnuZ4GEOAw6x7cFOUppGCTLcbHgewTBRZnrQmkPWAoB8vpqYiEx7oQVpTstmEZMxKV85p1e
	vwM2lN5Em+1nb0MsaQFE2gXAd1FcX7Vt7BKqmxlOMgw1DOC8ref8cc6MYZSDpN4vj/GHElXqJmV
	9mWxKuHb7tP8BdPjaw0AslcLb0D/kgPDQfn5CxuH5SBC5VE/Qc/miCXr3ifAlQ9dFbnsfKG7mWk
	z6fxnh0R3xF1kFXJlhNgh7UaEUjH0FqPp0hL8GHg3OltpwkP7t9ZgNyvRF4OimrMDlKKSG6WcaS
	Vzujpf4oDULjKJc/aw1aBjzAF+7NDukcjrSbAjfHBzX4kK3zcGAoXw7pULk297R8cHLlwVVLIGi
	7R3mDUABIDmiKY3
X-Received: by 2002:a05:600c:310b:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-4888b769851mr25032405e9.14.1775096429980;
        Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:16 +0100
Subject: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_192032_869580_A9DBD036 
X-CRM114-Status: GOOD (  10.39  )
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

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0


