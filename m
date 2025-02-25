Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3533C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=; b=YxrCC9wHZlTTbqAzpuyjT2WanW
	2wLdNQ9EpQCXD15hXBi7A8W3s9RHzH5lSFC3T5WCFQALoihFf9mVl9WE444qi6zWZHEAXUNR4U9ZP
	irBHi9JB+Xpu+TIHZFSRFNuEmfeqK5QTkYcwtn2T463WlKoUlF0uiy9rMQVRUStj0eZ/6J8yS8gYn
	PPBYzAJpHYhQyG42ny3lTayNnAP3Zah/AKXotZlP0d08FZwnn5sHDYJc08ODaM95cDndXv43WcsbO
	D1hPx45/K0xMGogn9Fb6gAjdpmOPDl3eht3pAJluZHriBTDiuLuMmnRLimluogiJkueNQ3/d/rn8S
	3hHZpRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eg-000000019My-1244;
	Tue, 25 Feb 2025 19:31:46 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzyn-000000011OP-272g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:48:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abb9c8c4e59so99524966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509308; x=1741114108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=GYp0+5YHRNOmiWtm3KiLC5ukfwvlsMrqlRhAdPSqIs2Ue4ng8NY5Ozmmub8VA5BtsV
         tGn0yDvR2RoQpRTBG+LSmDU15fJ8TDCMt22borWP39AB0MtkbO19RQpi2MSVyH1kO9Bf
         4IciQvbbkPefJyOC+oOcPdJujTU+1Or21AFIeuFwdOKrcCz8VaYtG2pGl9PszReYx/aH
         ZJiyLVtuWzddigxPqPfwNY4M5nFDxHyEKKDFcigA5fN9X993oS9Er3crZH2ofJdRRdVb
         CWK+jMaj84xlm/KhGA1NxQTsmzMaI4+0jFBsONJYV5qVc16fM17veOP24qVttCiSKwmv
         3brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509308; x=1741114108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=OI3PBCyCs9ocrYsYTeBxC27cygzH4JxI1Pg8AnY45YH7VNbkYy4kx0Lyt5ULl4gzNS
         W/VP/TXcDg+DAKcYjRYjd5nth2CrwUMMJ5oqsEGHJ0CQa7mdHtsop3KYJxoRf5aSDOtK
         /5JT3pTb+36BKZOSfbzYvvxxnfRQs9gS+i0JH6SqcRBKW0N9pWmG0AGeJFTZ/khE1QtH
         OO0CxoZCCTXBm4PAEeX3cpmsRuMmgWyQJ3MMhBDOAbJ5Ox/mSOKwTV5ZQQCUBdRy5keE
         SumszU1m4A4WrdfR1KNZ0d2dwokZsmfF+0kR5/AfTvjTMag4AWseJQOE9KKRa2Kl9dcq
         98ew==
X-Forwarded-Encrypted: i=1; AJvYcCWkeV7RQJskeGd6zjVXzLI2+c+crf8ZKv200Rw/kdDCqwweB0GghgG6iR0gr7fmpTLHJYnR86VL84+za7j9ftx7@lists.infradead.org
X-Gm-Message-State: AOJu0YzlretvhdDZSsLBaATuyB8MsEae6E6ST6u8Y5K+lZ+mWHv7UBso
	OqqJEtQZVxM599Un4TeWe9eG9bIHlykNP3DpK8uHOB/oW0CXmyHXKCX6mrhcgrE=
X-Gm-Gg: ASbGncs2XIxoJBSQWHMHysFXodwtpO3R9OySTx9pbE38urIbovMG6fCUuESzDLPvkK7
	2Ino81ryqG9+KI0pBTH0wAQiLQ72TDN1uuj/aO/8sY8DSVFEGx1rUPBZ+t59TzSDkabEuE4yOR8
	uw0D8avtFRgI/okm/7mhfS9yCxuPc+i7WGrQH/W0ktUH6KCO4JE+vFGmVFDNZZec5YzR5BGt/zj
	cItKYuzFGpgNhD6j0wXw6OMwF6v74UxkDEZI/jGUxD1vkradf0RNnjfUglwUqO+hzHwmfazBCSb
	OOeSjhRTiFQg9dn7osvM/Ls5tNvdxMIykGH7qP6dXLAJETbpJakzZFaZHySrL/TfMBacz5mQSWY
	=
X-Google-Smtp-Source: AGHT+IFKOZhRHtEHCCTN5BHVYVCPkFDsRkb7jCM4fs2ECH+kp2S3Jaa2qQ2qzrnOEoKDVZtT2N63uw==
X-Received: by 2002:a17:907:2d20:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abc09a14d0dmr792407366b.4.1740509307824;
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive
Date: Tue, 25 Feb 2025 19:48:22 +0100
Message-ID: <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_104829_540277_2C3C543E 
X-CRM114-Status: GOOD (  12.94  )
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

Devicetree bindings patches go usually via driver subsystem tree, so
obviously testing only SoC branches would result in new dtbs_check
warnings.  Mention that linux-next branch is decisice for zero-warnings
rule.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
index 1b32430d0cfc..5423fb7d6047 100644
--- a/Documentation/process/maintainer-soc-clean-dts.rst
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
 No changes to the SoC platform Devicetree sources (DTS files) should introduce
 new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
 results of issues in an included DTSI file, are considered existing, not new
-warnings.  The platform maintainers have automation in place which should point
-out any new warnings.
+warnings.  For series split between different trees (DT bindings go via driver
+subsystem tree), warnings on linux-next are decisive.  The platform maintainers
+have automation in place which should point out any new warnings.
 
 If a commit introducing new warnings gets accepted somehow, the resulting
 issues shall be fixed in reasonable time (e.g. within one release) or the
-- 
2.43.0


