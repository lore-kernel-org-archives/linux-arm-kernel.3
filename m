Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BADF107636B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOW9GJE9Tg53d/rO4Iwsh1y7xwv14EVejMuPlQ8bsTY=; b=lPcqcQOoPTwq5Jy0hhVYvSZEtZ
	07fQZtCESP/LYWBhAOh88CiuUwLd6V6UEtoCfgie7ykbdP1WCEKNWBSk+Hou7tvDl60OlQ21fIEcn
	FiD7h7/G4Tfls+r0UZyO/qb11UXWY7XY4ObP7ctGFf8ZXlcAqNeB1ToOeH0bfzkQsAzUKE+MGmMeS
	tLQv2HrxfCykizr5BuZGq2j3g1mCTt/vikjwy7SN406F8NcV/zm5aj04dUFY0IkiWLcbF8SHgIVj3
	y2/A7Sbt8zJ1IdTKxHTYJZyikqBJwqq0x33Z15I7d+NVxUd8MgcJ9qMWsnbBElrUWtfXuc4ehhESn
	Oq1+C0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYu-0000000DxTc-41Re;
	Wed, 01 Apr 2026 04:52:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYk-0000000DxOk-0bXy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso18127835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019124; x=1775623924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOW9GJE9Tg53d/rO4Iwsh1y7xwv14EVejMuPlQ8bsTY=;
        b=ZHhFnWC4HTt6CC32Tr5aj43I7IbhA4wxPE1xohXtgDEs3Mcow5U3JmLt2NXkfDUrWY
         MyuLIBkI93JTZwcbSVXvH3f+sSNqmTN8jZF5U82UmGRbiciqbP9pU3nesJA+wZ2BMcih
         AkyX5JiukCdhcLzaa6eZiOjGHuBAUz29sHoNXU7gbrRjAFErbyERSy4BZpWswPU34m3d
         NwqWAVD+jfUFkh13YU2sR0MsSkvvV4EiSGjSNGNkTwUw0sgSfljhIZL8bHk4Bdw1t9ah
         hwsWEUkgpbL8qV8sThj0jVy5bQyMRr4j/qMcBA8WVLSq+Q0B9jU+Kad7T22GPbX2/6FZ
         hAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019124; x=1775623924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOW9GJE9Tg53d/rO4Iwsh1y7xwv14EVejMuPlQ8bsTY=;
        b=aJNb9q4k1K+mJPQenhW6FpczlSrI1iRsjvqI1TpjFp5+gdijOeWhfwoQfJWEF68Exw
         pKZnu9nEojOuG9VxshacMH+s3VXwzh4kfGF/Qu7nWtkJfkZNuS5ZblkS62deQIJd2Pfh
         5ZejnUOOBr5RAKQ12V7YCs6OaQVzTOY9JwhVuwwovcT9JjfX6ciZ0cjqdWMeISZlqs5c
         c7RaRGtR+Tw5WMRZIWeYUjVGwIzi7515Ap7mb2jRWTLBEQxUcDiwiU5HE94ZLCZkS145
         3ZTa4LC7xUS3/IoLSNlOQ9oWYWxaQpZPJuNS3ffI3rIOqwRXzz5VlDiR6JcOAUthuYF5
         JTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTxDKYVrXfXQr0RTITbhq6EzLYJUESwoBqlhsLje4N8LfOcgPZq+Uz/6VtQ/1ffIRrf8g37H1BAJYWc9VzwkcA@lists.infradead.org
X-Gm-Message-State: AOJu0YxFdOSOxgpyWSsdGB4Nyt/nhQqy9Ph2PECGG8xLAkCZkSA0KJ5t
	Nzb0gy5gaoZqs4TYqtdxRA2shPHdPnNilGfrYIFFFLrUMQyOdj/UU0akW6FQhbHW3C8=
X-Gm-Gg: ATEYQzyfHoMkIhUpZ0ZtP7gI67+X2wZHJt3iVDvAUeh+JvdrAu2INr4yFSXh+tP5uk1
	UUCoolnMjO156TRLHyYRWAufczYnJejmAtU5IdUD3tte/gfIhIAq16XqGOktuN9m8RdEfspECCo
	E84ezP5g+IlLyFKwSFfbjT0vNEd5gTnl8Lnm3anBxd+UGrZkZLKZ0PxO2p5JoJ3Rknq+CyxdNC7
	NOa7G+MaY1g/DC6MTRaiP/XdyXt5jFjxep6gZXnkGR7v0cxno+B9xNbkSqjBivyGCKp/bkfUuv1
	TSm1KhRWfOHKGbIfleG4q2asgnr7dOTbOv1F6+A/e0yNaSp+OWXj/V5F8YhC9Sfm0WLdzG42NRG
	qeKI6YqLElx/ZVSr8pCNthKCvzVJcPRcdWiOJS7KjUZ6mQ8J5/C6/ExKxHla9Wz3s4hQP4qftu/
	XZnY+5PAisEaApj24gRoeLVGsOsHawPxDBd+SUkh2LY85x+gSlH5wIRR1XxxFXMBnLVJCuEqxrb
	yuHmoitPM5y8w8i
X-Received: by 2002:a05:600c:8708:b0:485:3dfc:57d with SMTP id 5b1f17b1804b1-488835a59bbmr29153805e9.30.1775019124159;
        Tue, 31 Mar 2026 21:52:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:52:00 +0100
Subject: [PATCH v2 7/7] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-7-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_215206_207702_268642D4 
X-CRM114-Status: GOOD (  10.67  )
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

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..f5cbd4d86226 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			samsung,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
@@ -224,6 +225,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0


