Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19340C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=; b=d+CW3eTRaYtQ45
	s9q3hWkdcHD4XOdFRWi2yJO6wiEpDuqSa510bFWpR4RfPjzwm3PpQ51cD5BuzcZRpwI9Xg0EkK1MJ
	yPoD9BRHE/0evB2hrIpi7zFzR/NTs3vlXsI8pGKiGAAdR8pxo6ycd14pPeRFjGdaBmLyhsr5kkTtJ
	Mngj2MnorWagAWtvBO9Pkte3Hb8y+Lo8lJNGLMHhjfyvI+bJEuESaAfOUXSg/dbBaviHT72NOf3Qz
	bXPMmZu2rs2zEtWFb6w4ff0zq+79a2IGP3S9Qs7jqekf/JLw+QChnK1GB5YmUNUZHDgQy2ha/aXDD
	3MWu3BhU4p2YOc2Ue91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQIy-0000000ArqS-2sZu;
	Tue, 03 Jun 2025 11:59:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGl-0000000ArSC-2a7L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-450ca8e6d05so1738905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951845; x=1749556645; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=wCQspfgPRWZXIFiywjo18buvKQ0I9Th11aeQzoFc/TNHePSo02M/6KJW/TiskIJtlE
         TlvDxCRhsJfAtviDdtmDCHhLvo0/xTKsh0IL705Ep7OChHZ9GAC6XisdZ1WAUXCxsEkq
         Ta7/fHa+03Bu8zlWN/0HpSHTpYRl59GISl9YSzhFAktA2XF23gVUNhKyhbU9b/N8RlvA
         xnhZuYiIr4i0p86KGCF17m9Gisivr233NoVGlfZTaJwlXS52A9mv+S0G07r2GpNRNROL
         S0ou49JTcA+sObwNlFMjYSkiLw9uI86wqRJtB/hHkOniDZbllCGYbdW+dfVYFLvK/cQ8
         AgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951845; x=1749556645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=aF6119nS8p/KiaJrDYVwmNM414Zk4ot5nuHwLTFvjbqoiKvdTVvJg/pY4M7hVY9Jc5
         QrnQIEmo7KplJMKaVIABcwIO+Crll8yxe8iZr5PFSUqEP9ytYI7dkFEFeyDK3F4lpySs
         mSl6Tkle1U1LeYFKQip6vNvolmfdej/7kFZHGt/15ZQFNzM+K3hGmZWG6iV+gUylJ8Fk
         Xb54yZdtax/KYDyjjR4tC1mNSh8PRCKA2yKThPHLcG9/4cBVUviDe2phrWuPcz7DT6Ws
         60bg9nf6K/mUyzfOfpb60OK6/t87vb2M0wTWFUZ82IwqA/O7BrjATEbCkJPX8lQ3Ba6P
         SX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOgpZCwG0M74thC+gN8xu1rOEo+RoekRXTI95FwrRW+AapreRv2aZx3Dj0k5cXTXcORTBfpw+rXvyF8Q9cFjYk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx75XBWex09mz65wNmsZU4T9CPRhQ2jzo9Vif+MR02lGdoKMtt
	k33pydE52D+Xph/pZYJUxkqRCKOpJFubl1My3y1rDHdcoOzfE86MmYzr1or6SLwZhD8=
X-Gm-Gg: ASbGncsF22G6oLpPm6kqBzaLOT4JtFT6ve6yTJ2xa5WWFMrt4nVsw6K1hBFzgAVHtTJ
	7TH2jMgX83wgd+Or58Ku+RcVFfHqwfYqIBD8O2di/z0NVtd63uMXqHAN+U5+0k5Qua7mGhP4RQo
	gI8X2u/9Tc51m97fu8s+lE2neCOo6QbQsyG4QWjKG2LHAttbutHV1wmvY9cnWvdhCan5GjmdvMU
	Kplrl5iCoj6L1FM6beEODFkI4qyeVP8MHd0w5ldBjkkKOAIr5k428UGz2pac/n0+8FzJJiBEVUy
	oYGGBKMm/4a4H0Y9FTmJgfWYjBN1qQC+NUnI6cKXSw6F7JGmXIXiauDDDkWAf3hDeisf5v6fp47
	BV0IQbeA9WN7rOAtY6uc4Ng==
X-Google-Smtp-Source: AGHT+IHcDKEnQI0iAe8KmJOAN+5AyRCThhejg+k63FaCsSnbGWGPgYCXX5i11cKOm0Js9aE/AZP8Og==
X-Received: by 2002:a05:6000:2dc6:b0:3a4:e8c8:fb89 with SMTP id ffacd0b85a97d-3a4f892f306mr4455673f8f.0.1748951845084;
        Tue, 03 Jun 2025 04:57:25 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: mailbox: Few cleanups
Date: Tue, 03 Jun 2025 13:57:07 +0200
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPjPmgC/x3MSwqDMBAA0KvIrB1IU5OqV5Eu8hl1QEdJbBHEu
 zd0+TbvgkyJKUNfXZDoy5k3KXjUFYTZyUTIsRi00kZZ9cR4oGeJLFPG1fHitxPDQk4+O4a2bUx
 jtH1RB2XYE418/vfhfd8/Li2Ljm0AAAA=
X-Change-ID: 20250603-dt-bindings-mailbox-cleanup-c884545267e9
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8VGdoBQnsW1Y8fk4p9+RrKW9XWt9gACX/CPbdQ0dOb8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMWnfe5utyaUx5gvALmsxmruk7JbV/krIhA4
 j8qvLrJLFCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jFgAKCRDBN2bmhouD
 15ILD/910b+r8xCBseUJF1YO+j/IHLYwnq2p99ZLKQrjJPODK2Hsa8PvABhsMOVX7NEhd45xauB
 1gokachMmddL3QTHvT2SwZxCkXOkbMCydACOrC/fTJt47ZMqSJVTQddnBcQSgLyjNGm4CeOEnp9
 PNBoEYnzvybXEkQACPTe80hUYBPNMff0l9H1886se4gDoMTuKflotBkuNAKnzK+8kiDBgxNOH9h
 bZsCvRJodQOSAPreMvq0IihcpWlEs34BWltovMVcvF9aAUp083WRW+KVQYmOhWlos+j/T4BRIbR
 CwPlyHjcGOVLxKnlJKijLA9qGkIsezGqUQ2SPYxLPKlc2qzyajNrDlj84gdKweskDeOpiBvLN+B
 KyqdmGfxbd7NpRwX3CTYh4w/0CtWItIAUr9Ys7jFtXr/VsuA0YOCgJjVX1uEFU1xkudoFs1rAth
 RJ/8B3UMC55EENVrV4M2L4siLZlqy2RcczsoTJFZF2waT+o7rvR+fmeeJf0wybsj1f/u9znmagT
 kQ8ZnJpha5iIwXpe+p1xsFf82A53nj0jMMo0yNx2V3WeXOWMo7LyjgxfIAQHTUVhIFc4TIZqJVB
 +kMs1/3Ubq5gPtCQo6w7qymB7PfuxwdaWvtwnw2jPw7zgEtHYR+5EiDbtFhXsuuiB3VyuoxS3ez
 N7pia2kgSwXPEsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045727_666313_4D9EEF58 
X-CRM114-Status: UNSURE (   7.94  )
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

Few cleanups for Mailbox bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add missing interrupts maxItems
      dt-bindings: mailbox: ti,secure-proxy: Add missing reg maxItems
      dt-bindings: mailbox: Correct example indentation
      dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic node name
      dt-bindings: mailbox: Drop consumers example DTS

 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml   | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml       | 10 +++++-----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml     | 16 ++++++++--------
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml          |  9 +--------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml        |  9 +--------
 .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml   | 10 +++-------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml   | 18 +++++++++---------
 7 files changed, 34 insertions(+), 52 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250603-dt-bindings-mailbox-cleanup-c884545267e9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


