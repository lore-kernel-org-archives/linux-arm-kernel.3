Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St11QoIkuwt6LD0qyFy2W7TckyvP5Gq6gOAm3aWS/Ik=; b=dmShnqwQheT0Zcrla5VbpuLX2h
	6w28lr3edoRmG1e1vPUMg3jYzsEdc3zurogMKKpuab3+JK+MOVB8n+VK0BBq50BfOcyuh1obBe+yD
	iugZLKSbPXjLni3Yl5adtuOzAN1Z+zNgERwGsYlbt9b6gvJ0cWBY7UzootqtXWXfHOYhyEBHl18mR
	LBcSTz3eiSZwuOEVJm3k9NCJR8YqK30EyyH4v48MEFPOao4oUzia1rw68VxZEBiu8oyXb8muH5Qak
	3YFFaX9Zfsxp+pZbDONXFLEJ5oSoNMHM7cGJ38vS/hJ1YxxoOVw3fSMOZ4x/zfO6WeCAcsquh02Fe
	IdxCKzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urISP-0000000G2pF-0ZWn;
	Wed, 27 Aug 2025 15:53:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFkl-0000000FVDR-3S9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:59:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so36583005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299590; x=1756904390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St11QoIkuwt6LD0qyFy2W7TckyvP5Gq6gOAm3aWS/Ik=;
        b=Q/9LOqc8s2J3/rq43M/hn39TDPB1fy1ViN0374o1F/sQMgUxHgE2DRVQd/8OysNgUb
         2mkgky1yAG8k6Y9OHR+fYuwvCPepR08g3P3TUXvQxZyQ4x2Gt8pz5XYcsqGDvyrqXp5a
         hOa7k4m1Td7OapK3cfa6gU4rzM/a9pchcLLDPt3FqdGYU9e4TAga3xFsTIR34oiX5686
         dW9kYq/sTxMKOEOo9Wg8rkQ4RRsNjbdH7/7ijWL/t0oHsKKLnNrLS5NsVMGQ2a5HAt26
         40iv0JmwXCztiYiC/N0F5HHxSXTq53pgn5wp88yGfWaO3cLuzrwXxgvWf/WDO3m9JJ2E
         26XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299590; x=1756904390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St11QoIkuwt6LD0qyFy2W7TckyvP5Gq6gOAm3aWS/Ik=;
        b=Av51I4yQX18AcqR0bxvZdxg4/7hZRMUH/s96oA5SmO5P/ouH297ZX7HSDnw0/kEJJs
         Q3P9G8DitHRIpZooCkXEvm3B8pKTGQrlFhnDAT1rG0EGN5Lg4zoJviTq5dGi3lGu8Fpm
         fTNP6CfitLC44wNxJWUWnfezKao0Wf3XTIL2JGTdTwUHNgwApHyGrQVv1D3Bcmlmu4e3
         TrARLkrLIqtVH6Eu8Huwc9yCkSskTfzyI5f52j5O37I7qPwGnZ274RKKr8ktqLm8SWzz
         rvK7LRVHruA9e+Qa0UkeoFCYD6M6NIrMXS5JU3Aa0z9k58Rr5NUlqqXz9yDASRC/gwG3
         R+Hw==
X-Gm-Message-State: AOJu0YzCewgpY/XFWyA+DO4WF2COKGYEcUSDoDeeyTwkjAxAQNcNL60D
	5l1PyFgaWZAb24vYyi/s9fhXEuMaw77LYfm0OESJr+K2+ehROO95cQVca/pBjJ/ZHTI=
X-Gm-Gg: ASbGnctfiD/AsUA4e2mojiFkWhO3i02YnvznD38HGVZx4HHHyuGO9EtsrFqAF/jwMHG
	cjX/8Nhr/SkTigbMNV73ZjFGPamgUY4Zz+zRPNPZCUuzohbSLyMX983P4TIsKK8OXMMXfOchLvb
	OwwY7h9KGpWbNE4fX3Nn07P/dGwc6CoOnboGWX0QV3TLu2R3ncBzwbY/dJ5UetF23cYHxUMZahs
	qzwKL3MujAb5xM1k8bAvcbtBOJHo6dUdeSJGtWWw1zuJd9d1BG/v4ZDltTHX0frKE+mIxn2f2/n
	twV6H2iknp2ofp1g2oVfkdkPgI6DsN+nO0TFv2ztsFinoyfvmDXmERJkFqc3vskXJ2AzkxSuBav
	ALd1RZ9YIliMjtPDpSp9EOcYQm39/J47kzmklal+L4vTBu6DXzZkdltYzWtGZwBrmQP+xwRONut
	Os2A==
X-Google-Smtp-Source: AGHT+IGrO5in4kxeXFs8Ggk7J9FQe0NLAJGrBqkvOKY0AV+1WCmJgGAiQ8Lyh7hq52k9MPnYiLZGlg==
X-Received: by 2002:a05:600c:4f47:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-45b698efbc2mr40559705e9.7.1756299590136;
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm3272069f8f.52.2025.08.27.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:59:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:59:46 +0000
Subject: [PATCH v2 1/3] arm64: dts: exynos: gs101: add #clock-cells to the
 ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-dvfs-dt-v2-1-e1d2890d12b4@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
In-Reply-To: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756299588; l=858;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=lXqAHsVVGobAqxHDBDj2hfAW5L/ixpf0F+OYYJ4nT/w=;
 b=1hf3mcPjyceW9nVsY3YJaxdSK+F2L7MXoZnBJFli89bCPqeG8RhhWI+dgSmVFITri3grRwv4z
 cDeXEVit+3jDX/fnKLE9QVz2WyAluN7lZ9fP3bWF51Nsyhbi7g8lZJ0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_055951_868730_61634E89 
X-CRM114-Status: GOOD (  10.30  )
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

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference
its clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..f00754692bbac39fd828ebd4ef7c269f746f2522 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -202,6 +202,7 @@ ext_200m: clock-2 {
 	firmware {
 		acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
 		};

-- 
2.51.0.261.g7ce5a0a67e-goog


