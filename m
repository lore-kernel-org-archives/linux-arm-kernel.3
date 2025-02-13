Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7EDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=; b=sWzeqjXX/ovNAI7yFc3rWfrO8E
	ABwtwBBo3UCDy54Juwy+3kdmo+YPLNUlXDWP4qCSpG4nnj7GVsqWRJ/1qPmED7RmkZWkyY8gqXi5G
	Oun0WmsMegbz8UDJu3LG7h9TsNudw7hguLZJazSIMW265pZ8iL2V32RcJWQ72AGfjV5oNAVMYTcXV
	hUuatt26z6kmb8/LLJprA1tYLf1uBvaULxDSgabjWv+D9C/WNJ9mPorn/9U3YdwDnGMQp+opu5apa
	k7QAcWO9vb4/fWZl5rZ1Xt+fSSCu2LzDbBiSfSBO/OE8ZZpjU0VTFsavdQQgbXRSOx3GDEYcjuxx0
	E9rgKs1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZAJ-0000000B8Va-3MNm;
	Thu, 13 Feb 2025 13:22:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYu8-0000000B5mL-1L4e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:05:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43965592e1bso1917165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 05:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739451918; x=1740056718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=pNqxdfdnd3YK/FvWaf0cxOxl9f/MH6lTsKgJ2DhXrs5jPfTyIfRAHTMOtDc+mJkW5l
         +38CBMCQcOiFPdMt+1GAc2d3/scsd3UaeDxcgbDirE6c1q1xtNs1WWaFIWhPJZLKxCFs
         fDVzJQIycAvLb0bhMpYRfXna9t8W9YjYbGWEBwScgrT27hdcbdOg4jgwljIKtC9hUdOm
         lQ9ESX5RuRiyXiHRfwRL8Y+dpgkH6exhsZbn6slSJX1AnYydUQm8ntA0Mo+gPrETr6fG
         zX0dVuaB+EZb1bIA8BlWqijpSm33ztzof2jAofkBpB7MxwgEdbFL/2RWh+ij/tpXLgwE
         whlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451918; x=1740056718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=DCCIOPBiuCIajxhsuoy0UgR+LOmEYh5BHHqik5lcPltMGS1S8yzawQpMndiXRgo3p5
         s26QNf1C4U2hlTRHGZi51rkJ2igPZU0jD9MStVGCRKT1c/d9P4TuomR7VyI8VanqaaeZ
         LyK6e0a1Q1ki8EY0HDgDdQ2R8qVJ7j/2emtj+zjPakRViAAlmRX8NXr6v5oWgU9T86sk
         hicoCWcd3Vwq5U+R/2eaa7PoEtzfY0s0Bk5SI5PbY+REVL31msNOlyvdfptzi2n5Eqcr
         4BzeOn4ZEPe0N+gP1Ds/W6AiAI8uTwG1W7O05SDHT9AMK5Yf82tEucstJF0GYiL0jKlD
         yypw==
X-Forwarded-Encrypted: i=1; AJvYcCV2XN8WfDl5HZJVuf0rcsIg1YY2O2ZN/T7kb633b3F4INnQPWLBBaSRxQNmrTw07V8NoT1loQBDT26Nlxzlhx3k@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/pNLTbrw3XPQHCd/Vaz4kiP8LiauU6nLmFlGjMvNMioElZZt
	LDlMdL4ojuzWcBGn7ol2TbSs8/pY1UaQnwyWUfchXGIqOl93poO4AfL6ye2hN5c=
X-Gm-Gg: ASbGncvU/M/78WtJ4X8jmlkCmgqmdWyF2b98CpkayDPDGCb20P86NQQjpSIFkWr0Dvq
	hlyJtwUbHTnEtV6ViQOh8KCXaSbmElcruk106FElzuVoAE3rlpXJJvXENcrhQUIP6SCEIZ1e4lu
	3OzoHBxsUZ61bz/wNo/Cvh20TDKIrJJfBocGWpnLOj4+qJCtj1a+3C1l4dSmDjGp8iFdkhWRopl
	bISVWSQfLa+hcxsRP49aGJREm9ImgB493gerbbj4Lh2YlQ8rHECcGqJvHaQCBJAPa572tMuTZh7
	UbiKYwakk30waU9yxLJbj76NcZSIKdcDxDs+2qxGVmkC7cHL08jyLlUXIS1buQVOJeMMuQk=
X-Google-Smtp-Source: AGHT+IHgAl/NTXWukWtRPOrcZw6v4KuAstgKfnNDDXq/WjRE7Xg59rRDQuiiCesGIdxFPL7opskBkw==
X-Received: by 2002:a05:600c:3b92:b0:439:44eb:2db0 with SMTP id 5b1f17b1804b1-4395817ab18mr78523335e9.15.1739451918162;
        Thu, 13 Feb 2025 05:05:18 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884251sm17004025e9.31.2025.02.13.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:05:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 13 Feb 2025 13:05:16 +0000
Subject: [PATCH v9 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-gs101-acpm-v9-3-8b0281b93c8b@linaro.org>
References: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
In-Reply-To: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739451915; l=1230;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
 b=GiT09Wr16zJYvD7p0ZCHkOHEx8QQPR1xqF7gPsJekwN511IOr3sW5U1/bKSFoCjDMsYO7zMub
 7HYPPkCkvERCkZePKsrvCh1pUdoxfmcR4KxfZzUNiIkht1bVjzHd0Sa
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050520_354365_1ED7F456 
X-CRM114-Status: UNSURE (   9.08  )
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

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..79ac2f3abff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3070,6 +3070,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
@@ -20899,6 +20900,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.48.1.502.g6dc24dfdaf-goog


