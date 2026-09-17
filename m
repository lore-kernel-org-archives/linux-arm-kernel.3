Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57182C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=; b=JwucGbjZPdrTxat/V17F/LGRzX
	pnINn1F3kHP80KJlXMzuGfbjH2MDhl6FwK9eh6VExKMWBqE2JdCsLMmr+pwwMdx4CLPHl5d8vzOfC
	90sIbkawy4zLY2EhhIE0LzgCjCiftd6QqNt02ndh+HyTURvZ88y520vrv1PtUs8GmO7AzYgO5TVn5
	e47OPTC+axmaRcm7uqnVQUIPdhsoQuJsLxHYXzzYGw9epoSfz1pEFNS1ZiHcnjOzwiT+cJhNL1lxP
	TmwDBbit+PIWc8YRQZNruRXed9q7WYHqnY4KNzfdElF5V6La6ibfacLLI4obnVLPYLj7Yi1bpYUjX
	B+iAvNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjY-0000000BdaA-2gjt;
	Thu, 17 Sep 2026 15:09:08 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjS-0000000BdWo-49Zb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:09:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso9336715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657741; x=1790262541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=klABWc21IaS7GzCpAdibcr8LN+yRmkoGUJwXx2rDcEy+1MMOoDMK/aOefU7yN/4DZ7
         ALwm/6SjKbiZ7GogjT/Vx47h4qIGg1zSJq65AKeeV6WKknJliveZeNEi/hHzhIOELpfd
         4fOcxy0noBUN8XFfXyfX0QGVqAMDHLABI+hCxx2vdwnCavAi7xS/9nHuJU7rEDyhmYux
         Ut3oyVftvuAQz3wMy4HGLTpIsuSgsC8ClebpGS5TQV/BmvaNlr8YB8xAc1+ffNRN8zXt
         r9CmMWTwzdXuUF1jSwXO8Ekgv/rFjV79XRsQvKPw5+L/TNfAXcANCFWIoRhQUPTkHMZt
         PRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657741; x=1790262541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=SfSkt+7mpm1hlt4bNmz4a3huvWE7xu7XDZOcIUE4qgAeccjuKkhVamIA8nS9cKzx7G
         kAtOuaveJhhKpz6Ea11mTM8XtaowB5HM+c99E5AJXlidlRIQH5ihsWvMAhcCHAZjg5Kt
         /Kc2Glr6yTur/70Y+BnjQQguUeN0fsN1UUe+rXKKQC5sLz1muOdBJor0NnDmRKdOWHli
         L/WMW+d/tHrtXitCYOWVMxG+ibwl2bXQ78WK+Fn2KO2slMuu33hAOrVJAjvkU8Q6XPaS
         NAeRGjXP7eGkkZfzgT6W3wWrITAMvM+r1Jwz0xirewRdkQc9FKDXd35wQ63zlKIT1rYp
         UVDw==
X-Forwarded-Encrypted: i=1; AKwUvBxtgEOGJXyCVWCgBCQUoDTG4Vy2FSHDwn/PGl8f4tdIQY858JpT1p7dZsVswYElHnlRLS8kzJCY8kGGf3npo+wi@lists.infradead.org
X-Gm-Message-State: AFuF++kXv99oQ8kVlNewLGnH6Hbfj+SvfblnMMDwFwGcqQzv/wkmJhV2
	9NC5cPJL1FF9y8jHcUP6ovMuKwbsFvqE/7S8Oa8QU/Q1HcyJnNou+hJk
X-Gm-Gg: AYBFou0wcOGp2HX2X52IGt7R7Kam7jp1jh6/EOjYCj8JEpsg1eAOuKNhs14YPgi4cFV
	kxkxvfSQgb+hnnQAbGUXTDcCv9I6lri+D4U+3nc3r6qDkC3TN9eh04HgDDZsne+6gLTIKgD9IpJ
	w6NRWZUsqlW+OKM8JwdJiAOqy7o8nhFRamFyw8lBraxHQWyVFkOWvJzrzR7CNWpQKZ7XXx/SApy
	qxfe6RVfEZ6ndAbYXDW+kE/EWqOXVPbBQ9FVmY1cQbi1OkqE8NBztWt65RjMoCrtnxTbQG8cdRk
	SCeQHSRYinR6tdAMr3isHVOBUAjIB1MDYCR2l91yEqodabQDPDTTopaXwO6JvcHOHojdr5myBEd
	5+Em3/9WHTOKSapPPHiB/g126n90KzB6f0HP96VYl++bBBvpsD9gGfP61L0v5iOHBIRJaxlt7hv
	ZtVhPe34G1cL9P530gTQEOFSP/edsCNcKThziI+fpkE+uUokv4OBbMrNIAg54zHtUrxPfv3tDut
	GZW4qSkMmdpKdtHFti2iZj7chjDhgEb/n2H2hqS+q7fLeJHKC5udA3iKtenef4xFk4KrqWhPyZ/
	gNbnla/NChKOTV/lzxWQQA==
X-Received: by 2002:a05:600c:1906:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49eb51902b2mr88747985e9.9.1789657740710;
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v1 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:08:44 +0200
Message-ID: <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080903_049250_D8AC32B9 
X-CRM114-Status: GOOD (  10.07  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..9fc0f7e551ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,13 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
-- 
2.47.3


