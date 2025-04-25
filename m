Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EABBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsI18Xf/CHKkah4xJmhEWwgp27gCELl2tJyFlsso9N8=; b=owkvOjgFt8XHog7nlJ/p01waed
	b36Bw24rzyWTcNG/OTPDwRGOJ9kyzMYI0vQCeLnBqCzPSE0O4x+q8XBoeZl+A1cUWBgY4vN2xquyw
	b2IYAtpOOGdwWShBKsK5695tMurbysHMtdynmI+N3qyQyDNaov4wwYvoPiNtkw1sLZmY6aEWT4ndt
	qa+lo5yVMOjGw2JavkwLyMTYRntuI9OewXjpYKmidGBDvWa1JHXcaXIsmy1GiPIiiCrwd/tZqO3ub
	xBg8Qvo8pRwVqfWbmMpDoq61aZXrY2chmbTNQRrPy/BoXfPsknbswrkBeMHkBQa46/qfYzqCXbgDV
	hes3Z3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MhA-00000000Mus-2dQm;
	Fri, 25 Apr 2025 17:18:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lra-00000000CZ8-0Njo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso16976245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598316; x=1746203116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsI18Xf/CHKkah4xJmhEWwgp27gCELl2tJyFlsso9N8=;
        b=v6eg1/YLC7y6vjDDsrXQhxbCozRmP6IyqZ8IdTqK8fKBcUfCWeDRI9JlJ79CH5RNU1
         J+sAcnUKlEvLHxKQzjvN8ZOHEjzcs/8HGSNw0ez8aQdyOdYubfUhpgAeER4rgd6nu3xT
         Pjp9T4wVL9fD+MV0Kkk7mNGtsZM39kJ6gRuNj5rCNGrnFfD/B/jDIC8EuHAYqrMuoG0w
         nCOEfC2Dbm1AiRmsjJ+HO7+o0LQeftHvMvwuAylFgKKdO/KunVBPaewb+pOu9m8723Wl
         4ro0DBGqURn0tIuaXUnVuokRtebma8P65G/mxUcBu3yTsYn7ntm+JX7e7raKqwwPs+Nh
         BWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598316; x=1746203116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsI18Xf/CHKkah4xJmhEWwgp27gCELl2tJyFlsso9N8=;
        b=Nj1sSCZS02P10AN1Sew0n3EOdIz2Eeq7aAn2nsTSv2CihgdWE3fPdVvnq1qws7V0nq
         GfS+yCrXDUoLnVFKTVN9JNQp/45+KuCj6GSuz0GOjlxJ5+2bRG3BiMyfFGb72F58ij5F
         gOXL9BzJLQSJKoumiWrmlH1xvd5z5C2qedn44FVz1WT8ukOP4u6MXKkn4PD2egS+jlwq
         zk+0eOzk3LGoqndrFCnvwr+E1bedYaJuc5QTUH0hYdPMPjb6A7mAdZQZZshBjRPVtUb8
         LYjn0N/flTBZaUEXc+1dW1mGSjguuq+818AEdxFO3eb+ZkzWDD3PfF1DfC8iGHYDFc3Z
         sD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVPGHGOnP7RU9fX4mV4Rk2d+N5nTOqT9MwdOGRl6pzthEcNvE4hRVXi+pccoKOOM6rKDQIuhGJk9VY5w+1Vn1TW@lists.infradead.org
X-Gm-Message-State: AOJu0YzlCAzWWnheYLgP+BTSipzgsIraz2p8E9aOdsu7TotgouN8g/gb
	C1BEu3Al/S1/2XaL6DyzEJzVBTumdHOHVSrO2Ne9ybHwxBZ6l+m524dDs2e/KUI=
X-Gm-Gg: ASbGnctZ1ljtsjcLqd0nKYoWnuwrv8Q7+GKl5hkFQN70gCUKZVJanXESJZPUEOJc3fu
	ueGaVkY6bhPBRiISWRFUFwmZKYuq1Df1E/o8hWJhHQmabaiGLMshea1UWUs50PBVxvsOmlOG7o5
	oFD9Yu86js+wDDjzmTOVDSBpqNB4q7siLY2IUtEZbLXoVa2ewPl54v1FbLm5MgkzAyxGcHAxjHv
	G0sUtU/N8NCj/rvr4nAoKvHijoiv0uw2UmznJIyM3pP8VTIPxHskaMVVfCKTz05YrAh9KHhlNoc
	83Xx9wrVHXc970FmXkgAGTrwwWvZDjw3FMh2w+ktmepMGGHP9J+FtaRKL5QNfv9rour170su
X-Google-Smtp-Source: AGHT+IGrLFYdx6vKYFjWnvED+XAvogiWSvHljvBsG1OSHxLwoj0z28dlqV0hZlPGnAXdMIGHsFan2A==
X-Received: by 2002:a05:600c:1f91:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-440ab7b7969mr358875e9.10.1745598316424;
        Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:07 +0100
Subject: [PATCH v2 3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml
 binding file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-3-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=9KY4pmL5Nw8OZrymj3IItPSsmAsd8hOb7aSbkU2GSg4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dmVolJGY3IhYW7Gcg9Nhq39TSkQzR5G4U1I
 kdh8x/qE3+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZgAKCRDO6LjWAjRy
 umGdD/9bfmKSSmqlfgMWlH2Ru/Y7Kwwcqy0/Hob2kOwXVoDJD0mffgzTklwRpwJicItfbCicGPf
 UpDc6vy1Mzh2ZoabFpfMXzruY3O6VR/2e+9U+zYP4ykQ7TigiXvhtD6btQDyL7N3S6gcGMEuW2F
 sxCWynDbmy53H5oHFLDYgB1HhdwZdpcqtCm1qPZ1iUsWH2isE07cObG1NMllAU4s45yS0VOkmt5
 8LGWM8lJSlmF4VCTJx2JhyPIA3f2feTDwTl1o6GL6Nt6C85DRf1SNF2zS4HgPoIXn5Tw7S+qGRm
 WhGW3YoqhNatxRgKnxSihRoPCWOS/fkbvunitf+c3Hg65Jzj++NOEl8ddrxwUb48WO13NlmE9CB
 qD1JDLLQ1dFO9SVL5dfQDzqoZ9RUmQ+wAEuPVIwfeTKqPA2SllpZzzEJDsC7VgKq4f8KZDZ6Jb/
 X9zCuv/dspPGhlvpJyrt/wMXLXmMfxyebMH49ljvoKH55MGYjee3Sn37mFH9yOjTt8cT/3b5DDM
 M6/SIaQryKCbma7K0qXn5FG7ksju4zhxePGIGKeXDePpYBc7G4QLPPIdR1d87kHWFdDnFy7o9re
 y8yt9IcgibaQPqKYhPXf7U8+Tlckdc09J12kfjLdj/tF5jx6QCjBlChiqu8lOKvFBtECH7llYFQ
 jyONRsOJNxsMKHA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_092518_137588_1AA9423C 
X-CRM114-Status: GOOD (  10.49  )
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

Add the newly added google,gs101-pmu-intr-gen.yaml file to the
Tensor section.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..5b2ec4c2023f39a3dd532ac61f0075a0a1555411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10118,6 +10118,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.850.g28803427d3-goog


