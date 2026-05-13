Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=; b=Oyirbb3j559jgZfXXMWsLuNmGN
	2NR0M2WofKlU5DLXxcpa0rmxwN/hnAKlQjTWEC4gZIMuE2PNCx1vip1h1TwGPTVHNlLcF1iGMU4yv
	LUkWn8J68GQXq3MXxUqYyQHQhlWkopQ2ZAc0WeJnQrppUVMFgWSePTbbQ0pUYrWdVdR8BYFhlCyYr
	uxDBl0kFeXw9yh/AVFTDj0IEFPeVlwvgSwsrDdjGoaLYXXbhJZJKRU3yJsfCD6mMlHB9oJjSfmmju
	J/bUeCYl/YJVniKT/UC8dsARM5w34d/FGU9tIMqz1pi0jqXb9jqir8EwMMUCen5bTb9gqh5eMQttl
	ckC+bnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q9-00000002VoT-1X9M;
	Wed, 13 May 2026 12:37:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q5-00000002ViO-1xKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-449de065cb3so6135599f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675843; x=1779280643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=hg1zD3XX30x+bDskv5Waf7IJbBXQixogqLWxvTMx4tfBFVzObttvIqvD7uLm08mhQb
         NsY5oMooN3vglj1DRnMb28VV4f4jtCXCoDhiyaLtST9BXCY4YoQqDcEjokUS+lnnTYpu
         U7IdJfwYIzyEfJI13v7EbqpBeD0Arbr8nBnmZWl+Mpq3wgF6FUJDnWoD0WTgmk/9/joy
         uFF8KjdGnwgAIRoNRDm34b/+6n54QrOWrnWrnQqqUs3YXg/AMM+gv8Fdti07u3GtN/Uy
         dDdRa27qu0gCOuubIOEDNPyJ6Im6ot7jG6qoBAMpcehSrYJjvJjiJwmzf+KPicRdHBC6
         /X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675843; x=1779280643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=TAA7tAH6/SjcCNdUCET+PjCbOd046bWiPvQN8zKnbLrh7Pe52ljt0eoe4KVb40JSn/
         uKy2dfJd99h00T/efUyvjb+bv5EJOrXSEVx4IepsqCp3pdKZCKe/MD3tMHkOjHxZPOQA
         q5jtVyRBH1kD8WiYzvC5HQUVlkWsAEGf2gbkohPYomz20ijf9t+qmTNSXDK03KJGORDM
         J3wHgNxKxPNS1NmYBh0Hk8ReKnemUkJgLY7m4uEbv5R6Z10Dbjh5wZ8kWejjBE7McQRC
         x2aWaEZp7gu8oLhdyk82TW4z+E9TLFhfN04imfQAtXop/Rw0qxMQBXCw5z5GH7zZ4Z+f
         pqxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xM28AdOtv8hAbi2GmG3tff4QFXP8yEVd4GoIMANTQ4H5le5D1uK3uuJqzExsX8K/FHm+a1jtkpXKuI+HwBZQB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4QRchRiDoRVCGCosiTdaICr3IDpb6vtFIoqjO9Ogf+qM9f8L7
	NltWUfeC0SG96iBKuqQa9MJJH5liVxfNXgIBsdl6uy4knj+pA9YxLdtIK3XYByvuq1g=
X-Gm-Gg: Acq92OGHDfs3NNHLBiPRClT57po2ANol2ERSKZZvz3mvxAeoPjiK+opD/p5Bv3x6kft
	ZiYxL92PiZxu2p5b71t54sGffZOrvK2zu0ZmbjCG1YWbdR/di1t4fx8qYGvOiwe7NaFB0ETpHeK
	5bssEDmz0cgqiJP4BqCr+OyiKMl4d1VSuf9JENqbv4RSsAuEiT1imlgCXccBTvXTj2+6RW6Mq32
	8lluiXCaEzlmv+1CS8S2UXxuoS7vaaJQpaB44nHG98+1TBtA02g6BG4EsGqNuL8n5WMmbDxLtzp
	WHgy3SxR2a1DZg4BcMsdpKOcrWuDQyFUiTGS4brBln7rAFSo+rJOIstHUTmzXBcC//da830tJuq
	rVaMaHogFoYqpUZgzTUC942fpunmOwES58JcD5xAh5UavjePuUDGlhT+SFKqiyoOhEnCwpNJhuK
	2dYu59stM4RD2Zy0I2TCkJgqXUiYJ5/3ToscWZiPL2Il0a/emI7wqjUoFbFM5NGj46+fhOYtMjU
	B+YysF/m/mHwH8bXWMFRBYL4fE=
X-Received: by 2002:a05:6000:1787:b0:45b:d891:56bb with SMTP id ffacd0b85a97d-45c7b769981mr4290870f8f.38.1778675843450;
        Wed, 13 May 2026 05:37:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:18 +0100
Subject: [PATCH v4 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-6-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053725_558868_5F5E7927 
X-CRM114-Status: GOOD (  10.06  )
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

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
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


