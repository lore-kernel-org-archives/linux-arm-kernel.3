Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2BECCF2F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=; b=dZqunhjaykfK/wlPsKMh09Mue4
	AaWPL4O50H/IpfyD2QT8WnVGaBOGBBDNiHV1GZIZ+j56HGlb+isZMx4zqC3pmSdty1TwkECOLA1Am
	M9ooT7oekZS/279+iuxMJKU/chWQwKijLTAUW1DGhmdiN/KUEXwM4inf4oCNeTeLFWwANvpkbPQdi
	2/eO8ryEqXz9Z51zWLgd1Rr4AeQGi9CZMxzsWgjtqidn144f6vO2S4i7VgTe4uY4QWfeXTGC1Z9Vc
	Or3gePuhtjvRHjqs13/ONu0QQCMs/CglQqYylW54a+/d5DNXzIbmScPOpXSwedgp6guC9Wpq5Q1f6
	xRZueMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho4N-00000001xZL-2JxB;
	Mon, 19 Jan 2026 12:09:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho43-00000001xSm-0rgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:09:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so37305795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824537; x=1769429337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=DbBTHyYH9qpGMOrbwda7GBRKQpMmcGdR6aRVEjfqO6t3aV70X0szuuiseKj4pXzC0i
         JkDiBe+frm3iwxy00amhLhOF7k55fJeoS7D8c2Y6zF33ZRv1S5jLXT7R5j/ctaJHdSJc
         SJtpNCVpv3ut3EXd7fY3QVwM3IoFQScem/9B93dtJsQmvguheSkrQlh6I8ETy6aFQ5fJ
         7fIFFk9a+puPWmt/3LWiS4ASkaA8fkPIWnWlX3Y3PvYrTcdHyEo9U66etutUYKk09JtC
         0X9t1BLnc71k7DtNtr6/B7QrasJPARnMakube3wPYHy+LpgBcA5ZbLzlz7WvxAVGtqMU
         tT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824537; x=1769429337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=t4YmZgEAUB/ttCbcbPSH4FxIbXjxZWDnxVAmyjyRmP5RTeTwYBFzY0BpGs6tihDZyu
         DDHEn6klaZfkU43Z2Hep0kFL5S1Ns4EG2lWTqV0Vzqro5A9wsLYV1TM39got9DTU+kLK
         s3JPaVTAlpHnm+0bpMOZmQpZ16kW2M2JhfTW6B9lLRzWKSUwOO5DqqBDphrJan2moD3H
         4bwY/IsRnkBvnrGgefK+QNSubfTJo4P16OVzRu73VZ0kTZODT2QiLfdSBiBb4rcdfYts
         FDh2W2wBzeBjt63L+ryZx5FjPG1Bjyxaqm/Pp3UumWFRvoj9uU7Zz1T+UKYFqPT5m3AI
         eNPg==
X-Forwarded-Encrypted: i=1; AJvYcCXmQB6P4VLrxZaN6ZlkJYZPOEkndFetqnXQEfqjgNAMk3uQG7gAb7lLT/DnsKtry9yjbslD8NHEynKHZuDQJe1j@lists.infradead.org
X-Gm-Message-State: AOJu0YyCqR2is8x39vcK3Jab21dAkn3PlPZiQTo6EbJkaTwzm6yd1eJn
	HEcI9bH/fZeN9bUcSp0zyPE4dx8xnah761hpAkaAWmeuUQYFCkj/6VOM6u8wjYVUJ4M=
X-Gm-Gg: AZuq6aJ809uHZdUp4Zn99Qf0tHViYfUdn3H8QUwLIniKezbLdl4Y9A4NmHR5ov1x3BG
	3IggfFWx0sNRLsxKI1i/Bfnd3spk4JsdiNkJ63UuNMEP64LPyMMatqA1snYowbhw9CHb8Ibk3ZV
	KaeYMFnojtCTdjqGOhVsi+nNkikw+2plKRUj3UHm3ZRkIUqNwCIPeCPzikyf2DNOQTarilThh6u
	UAc9Yy/RN1v8oGp6zl/znZuF270nEpp+nSrZru4ayCiLLMTLU6Qscu6qM0cP+9b+IrmeFSxVOUP
	ZTo0JIWuSplzYxBt9aIcAkbs+SJmXE0906KCS2TV2jQz/KLCzHHRyhQHCNXeTCgxi7fkPs+IEzX
	VUbADys7qtzGZJzFdrpiktsBScaz3WU61uiKc3dFemowqwCzwjI0RA4D8fEr1JAqnqP/ydhN7Wt
	AE8SlIfJcMUYmktYPBAGhrWYs6sjb2WRXDWVzY6SwQLrEUTHWjFWXC146Sc3jxZEEhdpzHbA==
X-Received: by 2002:a05:6000:40e0:b0:431:2ff:1289 with SMTP id ffacd0b85a97d-43569998e7emr13611166f8f.16.1768824537135;
        Mon, 19 Jan 2026 04:08:57 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:51 +0000
Subject: [PATCH v2 5/7] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-5-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
 b=TlBEnMuauOll69kA3Iht1mp8Vn36O+nZ27Yqrrl+ucAF9TVN0wbdHvi0EFHd/dHU17mHdXaSU
 xi2wLoqH9f+D/9H1BB1EA+6a5jaXfj1M4JXToWWKa7JZ7HltBPIb1du
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040859_303218_8AC3EF25 
X-CRM114-Status: GOOD (  10.32  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..ab44f2de8e8e03ad9bb022ebdf1b6c0058fb0425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23171,6 +23171,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.52.0.457.g6b5491de43-goog


