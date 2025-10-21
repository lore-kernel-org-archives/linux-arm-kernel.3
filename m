Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C53CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iGJuDFRRuSHDHUNQgyFQLmeRV65OPg6adZAytCP4ys0=; b=n4KMi6vm30gMlJ4V8rEpPYno14
	HMBg3WvxMvKkrz1EUwGl05BeNpLARm1ovWPnKTd3DTrr951Zp7f7hcokmJQ5Y03BQy6nvE6PtDBIm
	WM42G0uvpS3c8S9a3uyWA5fzfI/WTwWoe5+JSeKraMrUCWYn50VdTPZC/QE4/wFABjqRweyf1bDAT
	9fRaig5Bz0NYe31WqbbsFrEl3FfntpRIm/bGrnDJO5CcpcA4XW6LsA1IN+Yu1TsGldvBANANCXYec
	X0pG5/D3H/6mjI68SxFOHWdYyngrt8qqUuPeBsNvqv0ayxPV1BaFPfgWGHI9EwmkHAGEKy7NzFVmU
	wrYufvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB94t-0000000GXj8-0sFW;
	Tue, 21 Oct 2025 09:54:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB94q-0000000GXij-1qL5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:54:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42702037a01so781708f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761040486; x=1761645286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJuDFRRuSHDHUNQgyFQLmeRV65OPg6adZAytCP4ys0=;
        b=txONYJdyZeGS32jgMwYsSFxnvmUL31z72nM2152hTx/yhXKDzBehfMu0YJBtzYfe8q
         WqxbvP3yAXgqiNU63knkPktg2VNUQSCsTUSdhXfZ0tp52CD/kG4Fozt7Fl0m0g3kKqoX
         shueFOS5NacXepaMzm2kseLqeqM19kCoBUX66LcW9fSMKvH+7GMuiPGr1vgKazyenXTo
         6bVX3c+wKVxJorhlSl//ZIiMsY327yehXUhHRdIzuuvHDbRXGVzmv1DPDPPwwtzlFcQa
         7sacqoIHhOlXd8KGCTwhfX557dLAo6M7zlXXmavGBVheSJCvDIXD/KBh+4CocYQHVH5p
         JWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040486; x=1761645286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGJuDFRRuSHDHUNQgyFQLmeRV65OPg6adZAytCP4ys0=;
        b=KzfPYLw2hnu3Z6zs8CCoMO0+qHfLSQOZmSq9jVXCu5CA8QRxAItS0ALVkzmZWNoCjL
         swOi2LWwlm4mTXxiWudVuz0YFxKZVhtCQZFoSt25gpSXkF6C/Zq8caNgN3O4WdgNPdvI
         VqfdlfenDr1tCxsbwCvMLTsamjeo7HeN9Oha1vQCCum+CW61oKqyWYW8wJkU05V+KzVV
         UHddNrxPin/lP7mEEg1AP+/tecuN+4UsZFvHAAjp/dnnC+gLkLTfHVkBGnUMCCVyaKVO
         vRUepVf8XILDLh8NXBGWXf62F7Y+SCOFKp5dVPImxeKwSZDIVJ8qYUjBjAL5rP0THFSY
         YwKg==
X-Forwarded-Encrypted: i=1; AJvYcCVwuaQ+U3MdnpKy6IPxAgbGMTdvkiTGZJobQo5KxK7rE5wJH7o8yPlm4FOVP0UiFse9AFJdttOscahcdXUJXEP3@lists.infradead.org
X-Gm-Message-State: AOJu0YzGODqvSX9cRmT/SzBVQOJsRiG5gNP+Y1eSNUB/2OVbVBHZhOyf
	FN0ix3+90kAievOB/GnlAQbc8YjDZNFfqCj77nfRUj0lGIn6MfNRITUH/8DY6+XKsQagkiY0zFH
	QV8jS
X-Gm-Gg: ASbGncv5Kh/WBWX96KHfh4xmGaEExpWjK+8IbGutxJ/WhgqQ8Fpg8qIBp50KhQwqISw
	rq8JWyBgi+ocwbW84QOWHNnFMrzy7+eOR5gThlLAQa/yoMO1Htv5q/2kFHkiy/gE10PAQwyCzkx
	vGHpOrCZ5p3pTnMoPL6Pn9KGjHGZb0tnH8WnlW4FbRVWDuI9ruyUrXfJGiYZWR1muz1NgvMqxwO
	KBz8EYyArc0nEYk0VzxJtOreW4nCCdkEzWaaB2HSUYsxVoMOU6WnQz7AwEM5hX5OIDAyFNuIP+P
	cNg8zISxR98+HDrSRaH0tlZXGyT2fwv538hzalMOMLcseEhkXmIDLcgTqNuSJYg/ug7WeyZj+y0
	V5KJ78MDFES0sXw1xecweapF9MiK7PZU8+y6D37Q8DFXuKAwAIrZK8/7sZw1mosljeTQNPh38Zg
	+EnokaBe3+7aKSQkDSdod5MQ==
X-Google-Smtp-Source: AGHT+IGWw71OlcYgXji+89JG5Sz0DKNTCPD0GYaCIpd2i/j7WhXpZlNWd4iMSirznEOwKDsUpO+ZUg==
X-Received: by 2002:a05:600c:6308:b0:45d:da49:c47d with SMTP id 5b1f17b1804b1-474941ec4b9mr10231385e9.0.1761040486310;
        Tue, 21 Oct 2025 02:54:46 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0febsm19491256f8f.6.2025.10.21.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:54:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: Update Krzysztof Kozlowski's email
Date: Tue, 21 Oct 2025 11:54:25 +0200
Message-ID: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_025448_513231_61746AF6 
X-CRM114-Status: GOOD (  11.92  )
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

Update Krzysztof Kozlowski's email address in mailmap to stay reachable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 8a19cb96f448..797eeb6aacab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -435,6 +435,7 @@ Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@linaro.org>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <krzysztof.wilczynski@linux.com>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <kw@linux.com>
 Kshitiz Godara <quic_kgodara@quicinc.com> <kgodara@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 04193ceb9365..13fed9ee260c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16196,7 +16196,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-B:	mailto:krzysztof.kozlowski@linaro.org
+B:	mailto:krzk@kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -21165,7 +21165,7 @@ F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
-- 
2.48.1


