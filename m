Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0477CD3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vySvn0PrZ5KmWWRcUjB0f7ffbO3G5ojONpptbAIcwaU=; b=UqUjrfBJFxxA/RyWN04y4rp0bD
	XxlDlssO7VbX6HC3n5pEDZ3rbqxO51Aw3AlX66d6Ml4Kwyr1nZ2L/ZoUYZJ3XkCsL5bVbWImGkUbC
	Macw/4YTFGpixkeVIMJgvSKk/6Gf7w4byy/h/K8MXHlmxgOtPckp4pCbZFoxmEaC6X9WNRYrII8en
	MR0gxFA2+rjVtbnEcjDRTl+axGGQIJGiUKj3kthSnEJIIce+oRgj011GeON3CAJgWA4eBshpFc5U7
	fLRlwD4dYN723h93sKYnwrneR4PMbyTqnTPJXSEkKwqvaRK0Ft6ji5h7McU+zO5pHIO5llArsgOQO
	1ha9m/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t3G-0000000Fqdb-34CF;
	Tue, 29 Oct 2024 20:42:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl9-0000000FlAK-1WfT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso549025f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233449; x=1730838249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vySvn0PrZ5KmWWRcUjB0f7ffbO3G5ojONpptbAIcwaU=;
        b=WLOtyNuMj7AstjL++GOV9nZlkgwIUCDLPR4GvEz0awKBQ/O0Rlk0b3JOuIxIe/yWeL
         j0u6NHdKg5iiKZ0C8Vv+2fDyVkqQO+mJtHD00EI/FGcS9awtxAsBVcb9Knzn/yG6z1SK
         ZwxOynugiJS0KhTd0LoEWu0HcJlgCzJ8qNMVDO7hWsTnUlkykh5zIztRF8zSQVwT61dG
         ZbGi/Edjs7Mh6AtDgpVz5k2ZknQhSKkdB32uphwzlBlMA53dWGlR/PWBq77irfRka9kn
         2+zKeE604wN6LFIqTmA51lfHQLUR1R8wUnuFDkneGjLSchhIKNroANPqb7BI3+AWaNd4
         INvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233449; x=1730838249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vySvn0PrZ5KmWWRcUjB0f7ffbO3G5ojONpptbAIcwaU=;
        b=HjLHWjAcscTAq36t+fKSXfp7zOsH0gmXAPDcKzfgdTwcQPy72aHNKaraEDd4n3RUQa
         WWnMa8sWkxxIIaFGMG81C79Kpskiz9Ql3aoaDnkCkdfWZtj0+Wscd2IKIsgNMWzNUaM2
         KyiZhGwLEm9hnJJOI2YFJA+OGwNy6WNPVN83+4TKPcZcnYFlj3kgVTUbVpUcA/K29ZWd
         Fsh+cfvajMWwMHV7YXCVCBkkPMsgQ0oNjTnQEsVibIpbF535HWsOyAboB85oEwSkV9VB
         lFFSdRZzK8ecoomrBmkk57QjEFENPHzT4PwCqJ3nt1q1dSAHnwqebAX4ubzO4vkUMjpE
         d3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVh69t9C/tvCnxZs/x0iMN+qM2+2Axtk0zCR0QyNQH46YfSI4iZl1hTBVc/YLdbZiACFS/H5JLgDRqP8mhH9UUD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/LT3Q1T726izo1IUCPc9Zepj3XkYFpR4fRlLWeZP0zoq1LXQ2
	y9VL3APDAtJSLVp5cFidX7Z6Z6vV/812ptyWJ2YKDB+BThBR8KtM
X-Google-Smtp-Source: AGHT+IFSpTV0Tj7I6mQHfK9STG9/cLahfdy+XF2noCCt0RfKclZZKLKsVyDf7dEs0S7eg2BUhcBLuA==
X-Received: by 2002:a05:600c:45cf:b0:42c:aeee:d8ee with SMTP id 5b1f17b1804b1-4319ad4adc4mr46799135e9.8.1730233449432;
        Tue, 29 Oct 2024 13:24:09 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:09 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/23] ARM: dts: socfpga: remove arria10 reset-names
Date: Tue, 29 Oct 2024 20:23:36 +0000
Message-Id: <20241029202349.69442-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132411_420207_CCECC8A4 
X-CRM114-Status: GOOD (  10.64  )
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

Remove the reset-names since the binding does not mention them, and they
seem not to be used in arria10 (similarily to agilex).

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 6a2ecc7ed..005c57843 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -818,7 +818,6 @@ timer0: timer0@ffc02700 {
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
 			resets = <&rst SPTIMER0_RESET>;
-			reset-names = "timer";
 		};
 
 		timer1: timer1@ffc02800 {
@@ -828,7 +827,6 @@ timer1: timer1@ffc02800 {
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
 			resets = <&rst SPTIMER1_RESET>;
-			reset-names = "timer";
 		};
 
 		timer2: timer2@ffd00000 {
@@ -838,7 +836,6 @@ timer2: timer2@ffd00000 {
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
 			resets = <&rst L4SYSTIMER0_RESET>;
-			reset-names = "timer";
 		};
 
 		timer3: timer3@ffd00100 {
@@ -848,7 +845,6 @@ timer3: timer3@ffd00100 {
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
 			resets = <&rst L4SYSTIMER1_RESET>;
-			reset-names = "timer";
 		};
 
 		uart0: serial@ffc02000 {
-- 
2.25.1


