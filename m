Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928E5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=; b=Cc/Z7bswAxm97nyHZ8riM3PmJD
	MpiWX3rJ4w6czf7jCGMjRV7eNxQcbEO3pUWBVso9rhOSNvtz4CgcHWo75gNYNqOw1F2+MXA03qu/S
	hTiwyQ4JsTktUeRTqnjQpMnlAAHHaNaWLdCJEudqtqPDjacEnXaAe+hfVj3HKq0QqB81R20G+yw8a
	kViIKR0bH3+DBjc3js7UuY1kl+B6Q+wX9sujcUwhLK0mW8UPbaLTUdC7IIWnT5H22oEwZ23kacfG5
	UQu/ybxeypdj1ZPf2B2h0mgn9ZDYOzs9GDw+ORdslu97IeMeeD4yRgduGlminn2Qil6Mi0b0Zv+GH
	ZSiHIVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjA-0000000BJEV-1zSg;
	Tue, 12 Aug 2025 16:19:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmS9-0000000AWXM-3MNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:42:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-617b526d402so766756a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754995320; x=1755600120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=zScztfX/D1xMnJMjncFiez+6sBezB38zLARKcf15IpbsRzCyBLzp49QGMibTGr1ylk
         obGPrUh6IcLTPfg/X1q9wyF3aUkYikHaghhDWGlEgZI+lwptY21kSV/SunjN9FvYDgfA
         to4Q5V8R74AqTPDKZrz7xUK4+jUsMZiu851ONtkxvRWnBxyIUJe1cKaB4zv3YGtiY+id
         HmsFKCMwWqnks7qoekjDRMmnlM+Z2XlV5LxhIkq2hEGDvL+56UEKfDnOr/j1KZWriTbn
         tImVOS2qEuzuOUEpSf19dS55bS/ombxHOVcfreT7uHjuot+npwYbuPl13Xe4R34Vm9kG
         MRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995320; x=1755600120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=aVT84cgCrmCISWbnq60nVW/tuQUSo199hLNXfjGFglgV4sr9FA9RFXAd4353tpwL3B
         7SiNNr+72bleuD1lL0wisdi3v3a3vUhaR3O+/D/REdC74Lb8JrZacH/DTg8LXuWH9w7A
         umQ0OsV/QKjx/YcuWSLsxV3Pwcp4PIaS1mKKDnCWqwBRnAxYv+p2XluxiRrhADeaaIxt
         s4psVfWXYb8cnq1rYW89Px8i7vgbhNBuTokrcKQrTftqe9c1MndJ6LxBa5H2abBbMrij
         2nvdkMMSK1mRO5u+KcTS5HZXpBuJmwErd4cxWVX+nYU7q3e0uH/LRROkR+PstXo6h73Q
         HogQ==
X-Forwarded-Encrypted: i=1; AJvYcCXodhQ0a1l1BdmwGIUQDkHphwr5/Vz8t3RI6+kV70DEwO+oMMfCFDHI18xsf85lVbr2xD+0jltd+Ts8LwJbNpZz@lists.infradead.org
X-Gm-Message-State: AOJu0Yymu2KZd6Y3BGPTsqxxbVJrhRbh67FhS7qVqYjhKDOnhpU5V22M
	DIfvwbx44yeY13bCfnGxxNzccUcuYjZ4UfabrvT0Qc3eeGd6vsB68/8xccGcgtyOo/Q=
X-Gm-Gg: ASbGncvGF3Z8j9HnaM7e9XntQDjAUcLSCBOA+oRAlZsPxZJuTiLRC9D5Dc4DwFKceDj
	JWn5ji6SO3goVo5SzztxGkDygBCdMnsFX5P01VOLYe2qmRKKk44zylKioGW2LnZ26U4vA/7C0qU
	1RfQmvu2jtfRVPSErvdBwcMFMlgzLz842m+dQMJvhlvEjSlvC3zBPlRg42H5XyLhWD5Edv/tGYv
	wVXRPkaftAnYI6NWLNZtSjlzPAYJBufVZTndps3YETitPD0FHsLz/IJn6PWvjtAxfT1NkFhYVnM
	BzdfM7RrsBOtlThOBkPJKcFKWieSFcmWUDqr+UnSBSa5qGqAUAIwJKwKYGul6jHtgEpodI8geMy
	ilb+B3jMzQ8/d6Qp0tMFWUjl0vqys1qpPFg==
X-Google-Smtp-Source: AGHT+IFVuPBX1WWXHjE5WiQCW0z9z7axEQSpNRILYD7CKS+Z1ca46MwosUVW2g0lgYDVQmrovf+vTQ==
X-Received: by 2002:a05:6402:520c:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61859a4adaamr378641a12.8.1754995319829;
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6184b807728sm1460348a12.12.2025.08.12.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead of "devicetree"
Date: Tue, 12 Aug 2025 12:41:55 +0200
Message-ID: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=btAyvRtmkbXxP+i+9dkWP6dlhtZYn7iXm7lHIO+hiSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomxpy/fIPdRspqyjtDspdwQP8eCSdbbk/qvY1e
 4DUh4r8dLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJsacgAKCRDBN2bmhouD
 153BD/9pbsdOLBBjuH1T+Qx7JutSi91jJK1OztVssLYs4N3tTNF+Fu++ubUyfqjTPN9DDfUMc7z
 r8N7GY/iIODwgdDoMexHzoriyr70+llWuV2NjB6Nd4Xj9YHZXyxaxnhyhy+GJJ1SXRM3Pw919eq
 616seqX5p2xJqBexrpCIkRLpR3QNaEEQSCC41ZLQ2BJNqgxZAIKjrRs0pkFzMYB1QSIofSoyFna
 f9yeIBIJs9WND+wnezDp5bsBNIE7OkaPZrKwZ0bQPG3eVeI9m4zsCht+AsngcHv79+UG5dEQ6E6
 +9XrLuX3vzUyFkqQ6muXyv9uDNpFdwyeh7B3sd3ZUMezddVdjFBZnabjjUSLntgJuJFl0oB9YIB
 WeTPZ1LNxCaOkY59Jt+dSdUrarHHqxVsL8woIvnHiE7nQhspm4pnReYjzgIqX15ol/dgbDmiQ3+
 a7Xfr3sz3hvMC3ynzjpbZFHIkHlL5EvZ3ZUMO0ru24+KMxFqFNXBqDq/Ay2IYRBRcjMuQIxkqZn
 I5reux0ksT9YUxOa6Bv/K9gHFG+CSX1i+6ssJ0t688S8c+bYD/crDYQi4OZR1tPSkhMyo+aYevb
 Ca6YM98/dQ7Sc/Wm1cIRb7S2HtQ0kzggeb61K8+3DLwfR9swlMo6APbfYaCFZUa3be3Q281MTSi HBP/vBdc3HJW2MA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_034201_871265_4F26DC8E 
X-CRM114-Status: GOOD (  16.20  )
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

Devicetree is a data structure and it is a bit generic term, because
some treat Devicetree bindings as Devicetree.  What the SoC maintainers
profile is mentioning in ABI stability are the Devicetree sources, so
DTS files.  It is also more common during reviews to refer to these as
per "DTS" instead "devicetree".

Clarify that by using "DTS" name in few more places.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a doc patch, but covering SoC tree, so maybe it can be applied
by SoC (Arnd)?
---
 Documentation/process/maintainer-soc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fe9d8bcfbd2b..3ba886f52a51 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -10,7 +10,7 @@ Overview
 The SoC subsystem is a place of aggregation for SoC-specific code.
 The main components of the subsystem are:
 
-* devicetrees for 32- & 64-bit ARM and RISC-V
+* devicetrees (DTS) for 32- & 64-bit ARM and RISC-V
 * 32-bit ARM board files (arch/arm/mach*)
 * 32- & 64-bit ARM defconfigs
 * SoC-specific drivers across architectures, in particular for 32- & 64-bit
@@ -97,8 +97,8 @@ Perhaps one of the most important things to highlight is that dt-bindings
 document the ABI between the devicetree and the kernel.
 Please read Documentation/devicetree/bindings/ABI.rst.
 
-If changes are being made to a devicetree that are incompatible with old
-kernels, the devicetree patch should not be applied until the driver is, or an
+If changes are being made to a DTS that are incompatible with old
+kernels, the DTS patch should not be applied until the driver is, or an
 appropriate time later.  Most importantly, any incompatible changes should be
 clearly pointed out in the patch description and pull request, along with the
 expected impact on existing users, such as bootloaders or other operating
-- 
2.48.1


