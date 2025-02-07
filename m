Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4BDC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=; b=XSPJcTYvRhMNkr/0P9wyqoMCrM
	Rrmbvg0BVu9W7go4BkVYZBFz5V0RDQ2Qd9mbX+1VjQd1DAGH/7t+4f6guEKShHHYkiQFgpSYQRMNV
	fIfPHmSG4ieKOAqNw6pdV6Vq9/4qjTN04s0EB08TZYktx5YdsoxQhvg87B+b4ZVIp4NXxUvH3n7A+
	z5Mgt6l7C7Z7FZZCwDn20+3QUcSjMwTzcxcQ2YcpgOxamic5S7r9AO7d26CDcInhP1EiAO1FplOWC
	n/l4pz9QkyA2hhVA6ULvQ4+FSWMy7DhtgjqgXEvgI76Zixyn9v2OJdyDs7vekMAjId1fxRMB+hh5B
	W6brqpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQbg-0000000A9e4-3CL4;
	Fri, 07 Feb 2025 15:49:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQIn-0000000A56Q-18Tn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:29:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361f664af5so24152835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942195; x=1739546995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=MgnuGqgNKyhX2EbwUkxMS6s31P4uo8nmzcAEJCfic+RvWJdG3S6tU2DqEFCUbGnk5J
         in4cICim1oGo2yLxDcaZ4Np6Dl/F1bvFC1rnMvUBBOAeNJhX1+htVNrx1eHUorTu3IRD
         4cKrUFONgQhGiwUn0+TbFm5JKSDJr4w2c5e1PMExlSyKAhoSk++UwCnwyIoSbnq1HtSc
         /w5OvbkQByqJXCXVTvBc3c80osqnMRNGOrigyldrFO4h106AaLIpjGRZoYnOfGWTfCpC
         70iE+y3PV39RlZO4JOv63bF2eMcCey8pFWQQ/tGxQCi9L+eE8BpVbx4DfADp4Ew1Wg4M
         K+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942195; x=1739546995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=lIffrloAWJcNsWeqRbUUGIqrINZE/znWs46ZUAqHkDF+j6PhQA7ietFZwMtaX8lMju
         TgwYkEb436r35mZqMYrz6mLpBv/N39l918SKTBrckiTEPmb/x+/fgugVsmaLDjpM+SD0
         lDOTnZzhGxPO12yZKeDKA7xv8xQl8c9SuaFu/c3MNIO1nTD3Df3f37R5mH/r0usQRhNB
         xWvrDtfMljQMMEVZilwxfJwMvi1+badIAWaFpp9BgNqCvaxxq0cdQ/85YX8Vd+4elzgS
         jRBDKSGnxFLmvGWnyfylNgQewVkPwq10KBh1gdkeGK7F5rIeZ/4sHwRhjiDYwolvhMh4
         ilbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFGp6roJ1quUz7Z8Xy+YunCaGHSkjmeYQHWfbLDcDIercqacbwtJVDEEiUt8Di4mWD1dRU92yw5no6xp0pTXma@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAtP3eA8XEQ9W0BYtPnqD+kR0StneJ2EpfYC6h+M7NyrZqd8B
	wK8NBz8xCVfdqGc9bgYucGzBkrXW/RX2iL29eEutWRXJWb3TO3uvy3+Gl7U8Tgg=
X-Gm-Gg: ASbGncub++YeXwu+hRAuw0jDkBt+vIzGih0fNsdpDKIVzARfQnm7Dwl8kofhfhl7lCF
	UiYLTYrdaO4nuAMv3tFeREBXe+Dpwy2yMk5fN+j4EcTLk1c4INfrud06oo56ZsbZggUeFjFVmuh
	JiMZGC+Gi0OANKQWPUB+Qop7LTI/bQvywx35dR4ZDAFy6MUEpaSxk9f0YnejBYthOMdiVYoBARr
	jd8ftwfeTUlit5J6e9oKjFxYZ245eNiubfj59vkLI6j4Wk4HvMSAlcvsCq4CXjodPCxWRo4royC
	B5ta4L05PiWM53V/nqTp4B3lnpz7NE4lom8RJGsqaB+lnnC1F1CNIJn9dZPaHNlMI4X5Njo=
X-Google-Smtp-Source: AGHT+IGdqv97xrtBJoIofBrfUc3ARxL23naqLKi1paW3wb8UdJyaLrah7QQ6vKWacVX29yRHYn+oNA==
X-Received: by 2002:a5d:47cf:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-38dca5578ebmr2259844f8f.11.1738942195412;
        Fri, 07 Feb 2025 07:29:55 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm57141905e9.10.2025.02.07.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:29:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:29:49 +0000
Subject: [PATCH v7 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-v7-3-ffd7b2fb15ae@linaro.org>
References: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
In-Reply-To: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738942192; l=1230;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
 b=KhnOBxDzV74j8z58omKzA0IJmx9xWAFG5ot7hR2igY0rGVzQ/3XIaB3fQc+nNSealUF4hNWoB
 728XiqFZjDwBC7pvrW3YbBlrgsB5vVJjn4dEGIal63aDr6+7hODczPP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072957_327432_560CDBAF 
X-CRM114-Status: UNSURE (   9.40  )
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


