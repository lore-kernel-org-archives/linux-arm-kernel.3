Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2718BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTX2x3w2+rrqKrzKo+38sY9i/3t1a9Grj2c0VzKk3Q8=; b=kuGHsvr1NeTWLJiwMb5a4gKSGM
	8zGnTjgEq7ONOLvvdzjvxzGqDx0ATuG9LVQ+8xyD5ZYygSE4ryZu8U7D8TsQxfr2R8xAV6FM+v8Ht
	05PUzhi9CwSAWOGPmV/b969myvuvAyNHDIy1lSPVWe1uX2Ryz5fL7lpXLey13x6WPpZtdQ5IykRgf
	+ISe5MgjYppS3SwCEXVkFtHtBxKUJuce7WeXF9C7cV+dblO6jJx7WEviaq68f0MavTybavyrdwOtb
	XsNWNKMrk7JjUtSH2FZjhA4W0+jgE0sF4nC77HLv7chmBucY3fSMD3kMs0bUGkrCY+pnv4CM7NYbs
	gbvwZ4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ir-0000000Acny-3zSv;
	Thu, 06 Mar 2025 10:18:09 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ff-0000000AcCW-3SRM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:14:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so792805a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256089; x=1741860889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTX2x3w2+rrqKrzKo+38sY9i/3t1a9Grj2c0VzKk3Q8=;
        b=jcuEPdGB66SPKI/Xrja6sjqeiqWTvd8ygegZZF0NM8+oTW/CortONYiIKicAn7VycD
         /6l4W45U570CAHvl0794+1R/DYaVxhqDTcLQ3YKQLQp0q1IrcS4zqVwdOz2ybxcl4PIW
         y16EhujIbJi9vEtbsKFRgSdbOgP8GaZyhmzXYfCLAnH1LuMQy/kNR5TlhyIX3pTlGYxe
         TFQJeTx2z7oN9x7HHkriw0pMbty28dwTg/GHHwlrXfDR50A+eTe+5xgvgYDPGAk5jN/+
         6p3OX7WuMZWczjtitRfk0bsUOtk3YyLnxCx+DeCt1NpvfiVpncsP6H1YeG8BDdaj1UHJ
         7MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256089; x=1741860889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTX2x3w2+rrqKrzKo+38sY9i/3t1a9Grj2c0VzKk3Q8=;
        b=PU/4io+3vr87KS64OncskmnI2yv56kSN6cnjh3eIt3qtr9ZdtS6eVt4faotQkNhN7G
         g3rEpWJ09p0NWSg/06W7Y7f1eTSMxn85O2erpNf21OZIiEzC2lvuM7zKse+3LEO/X2dq
         y3HyyBoTI/kf1eWFxuPnZfd5wsnCRtpG/RbeRtcBL3mI8Ss2JAOtsVT3wr3C1irVGFdB
         AClUlgI94upID9GmXcFpp6WjFe9vrY2HUuHEK+3CRRArcVeBvUgVoZRbbO2pvFLXIhXJ
         BssKmklos4RbAIUqYNlmvFPXTTJBSFQKqyKaOGF1WEn7NI/bnR2nApnuYzi2UGfQIAb6
         o8ug==
X-Forwarded-Encrypted: i=1; AJvYcCXN3vdExxUiTMYA+PyaMHvU1yXRrzUaYYg1MAi+a5iuMYzD3AHDqQOn8ZqCFePoI9l6IyenpiZVZqMTbpJ0KiZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyqPYuWMMrQ4iNMoWvx0jROseSBAe5HeY9J1SmXuGRW7/mUuGz5
	ffz93YRIGAwXb3r0nIl/Cx/vuPSbjTB98CySHVnOfZRvZwWypIwWaIgVJRJ2QE8=
X-Gm-Gg: ASbGncvhw9Q9BlOR9PEW+W/EiRg3aj2BOZVW+nx2O+DpXPQuTfrpuQwmyY3D901YyCE
	r7eVGC8fxnz6as32IRrkqtrdn6e79svIUH4BI6bAaD6GnaMOC2uOWe+1BvdRV7DD2mPAi8TPIHJ
	ENnxzwddR2HDN6/JbamgEhruo3kYc4dPCu2twan40dD3AwO4ASiTaT/SkVIQt+AxOtQLp3S6VIU
	YWX9/vwV7g8XgfyhBD9IPLf/9WZCreOv727dAunnDpTB0a/qHM6ELjr9Ml9omfdE0JMpp0rx12y
	QQ1lT2gvUB3830NnnNfsEMi72NnPakZzd6EY1Hq8Jsf9ml5nDMwfhF3mhxmLKT/LtZMo3XINclx
	bLMjY3fWyh7dNwHlnGrs7XTf49rda
X-Google-Smtp-Source: AGHT+IE/o3v5XJFu7xvLRW9BZC3NmMkBoh78OMt+bw+ZmwbbxHMBjWL9+2GSNHmM24JOepTrXIj9dg==
X-Received: by 2002:a05:6402:3902:b0:5e5:b3cb:38aa with SMTP id 4fb4d7f45d1cf-5e5b3cb3c80mr4508256a12.25.1741256089661;
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm708972a12.33.2025.03.06.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Mar 2025 10:14:46 +0000
Subject: [PATCH 1/3] arm64: defconfig: enable Maxim max77759 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-b4-max77759-mfd-dts-v1-1-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_021451_860514_46EBE1DC 
X-CRM114-Status: UNSURE (   8.87  )
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

Enable the Maxim max77759 as this is used by the gs101-oriole and
gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,

The child devices' defaults are based on this MFD driver's state, so
this commit enables those implicitly as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..eaa88c3e6a93ce555468458763c2531fee2a903f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -763,6 +763,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MAX77759=m
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


