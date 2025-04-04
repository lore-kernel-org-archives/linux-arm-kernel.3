Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=; b=YWFSxK9KD67nSE3H2gmXcWGhvk
	kXpKDnbkMp/LYg6jZkHdm6/YjqHlUHo4nwNLwGbfMcvLNOhN68eYxg4qGM/b1r9GokNAJ3BxBtqtN
	S4Q7OOftS9gTglgaA33EMKrcr4m9JrQqEExZrl/DSPDZ0P9GanvWs6Ov4buRabObxNzi0nvyxk/Ww
	7seevALTR0d2DKFGtL2MOUnWMsh87iZOQ64m1r8KeolWn3LEGovubzRR3QEAAXHDv73YaQoeu5tC4
	E5Uvb1GC+ATNIQ57NEBBwiklncuwixMKDIWZvVA9LKKqkW5tQLrOUYprbVRERcybp/Cfvc3X2VRru
	c2TaFE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gOE-0000000BhsF-1f75;
	Fri, 04 Apr 2025 12:43:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gKw-0000000BhVG-3fVC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:39:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso170626f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770393; x=1744375193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=vzVrWUm6wr/Cno2Popi0wtqIYexiks6tPpbV2StsE0x3VM6b5knUGrtgHzulttkI/l
         HO4wVaC3/cpWe2LxDZJiKXHa0hhHvLlgE0fnBXSE4l+DGsWodPlSUja/VBKnKiqNCKlX
         0F23pTFLV1Ni5uRJmTl7cGMCjdYSEOCH+XlPsqKmT7KSDHxy+RWdBxHsZ8xx5mpUF9ks
         eMOwiacU8ciOuWFf3vmu/gXGnVdlnXJFPM0JbgsjyE/131UKG0R5PrlfRgjCLvjh/Wr3
         Q3UpOhXa9QgAuFqflJH7oep1dzhL6lVoTbrSH9AGYf10wOmpaDMavjLjvzL6HdCEYyRD
         XNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770393; x=1744375193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=ljuz8/5rGJ9rXyyTL4W7t12AaIVppP6bqhLDd3R2xCJNVi3PB9rc4Eq6zXF1ZrsxQ9
         qyp35uZ8xoySCNjjPBGiKzkgYJuk8Dv5HKWMZGBmuKKNwsT4htIdYQRP2g3vtfb7m0vE
         dhR5weH5HpXpPFGKpHnz/RSnPjjsFeKJnr3TJrQDLaz9WcOwCLj7i0OmWbf838eJIjVK
         X4WhEViZY9zjO4uTH7NOnGLI8IbwfPqxrHyKgTkgX+9W7yrHQG7noZUw7kBhmlgwOFkt
         YJ4k3WURJjQ67+iRvPwZ6aqT0zjO52ENMqY85cYjtLBwdUCMxNh7Gv7K1T+WtnmaL4xf
         R6qg==
X-Forwarded-Encrypted: i=1; AJvYcCWbeMSDHoQHyEF5RJiY2tpCVW+8uy8W/jBQ2qlsq97OLi4Nt1fyPZr6SI7JmJ43KXv0HFBAOi+RbKPDGCcAjS2b@lists.infradead.org
X-Gm-Message-State: AOJu0YzigekCj96WS0KsqMyklIk//p0581xuO7Xlw0w6c1oGG6ZOljp/
	dYoB7ZW+BfudHiBbajua1oFDizMNyy+4lgO+bnn/1HAdbJKa5LvzcF4z77bXfvo=
X-Gm-Gg: ASbGncuZVA3/wrMXhlY146SIXYy/c3uN3/hRDLkfEN6bXs4+n613eEDCDn/3RoBp1XS
	dVbE7Q3JTvYprcQMZijSA05FYXev1LfAHEeTJP9m1IGPp/NO1tCzD2TCS0IrI0+Zg/jpDz2zVKI
	9c7iLAgpVj3mRs9VKBw4u7IyvGqCwtH9HzxIbeDJnQVACJ9Mlyo4cmNWPZwsklBob41uX9CS/v4
	7pr+8oaEcMVGOuBistQriW5//3TTed3C8Q4pFFaLMKiT10fe1Pp8CbfpLTLWyrDowt/YYAt3q/r
	DPAKentmev//F3z43+3sHLWXeF+FQjbx8ACUIyaeE/15/SzNrnS18A==
X-Google-Smtp-Source: AGHT+IFE/BNeQcKRRWZIPVRmYBmQ1t5nK5Wr5F4lJXYDnVHNSidWI2olRFDyeW5mBZo+ZjR5fCLwxA==
X-Received: by 2002:a5d:5f44:0:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-39cb35a76e9mr962968f8f.7.1743770393235;
        Fri, 04 Apr 2025 05:39:53 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm4261898f8f.76.2025.04.04.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: meson: Do not enable MESON_SM by default during compile testing
Date: Fri,  4 Apr 2025 14:39:49 +0200
Message-ID: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_053954_918243_CE6DCB8A 
X-CRM114-Status: GOOD (  10.31  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index f2fdd3756648..179f5d46d8dd 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -5,7 +5,7 @@
 config MESON_SM
 	tristate "Amlogic Secure Monitor driver"
 	depends on ARCH_MESON || COMPILE_TEST
-	default y
+	default ARCH_MESON
 	depends on ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
-- 
2.45.2


