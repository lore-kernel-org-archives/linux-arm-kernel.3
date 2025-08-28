Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ofMDnt8aegB1RhhNAN0+9aJ+qAFEpSg+iG9bqL1LWI=; b=FylEaoeD3bF+y/3mL0HVhlgAY8
	Fgc+ZFVY++68YeGf4LNDVNSvbxZZgQX78IFUzHPLo2a9ftMBbDWuwQZoYhdA52WEEoOtVUiejXBgi
	TCrPFLdrh+JGjJlaNdy6yFifX47Da5+a865U2wAu+G2SZqg2yK0Uv9e/xGywHBL7orLP0rQ8gTvh9
	6fiD3pogON1SidV+XroHuAoyjtUOgwqBSSZ5XdmCLU6BFvFtfFQ5tx4flwxAXh5G+HPi7Bt+dDEPG
	ZSwc1mxWHxK+Y5xJsrq3wHA8KGkP7kwwtT8gF5NgtYK0mUiqdkjSF50nAbKl8bCivhk/CUi5RJ4SN
	72XazEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgUI-00000002YAa-0Bh0;
	Thu, 28 Aug 2025 17:32:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcz7-00000001myf-0TES
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:48:14 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-61c325a4d18so1624970a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756388891; x=1756993691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ofMDnt8aegB1RhhNAN0+9aJ+qAFEpSg+iG9bqL1LWI=;
        b=crXr1HxgD9r+TICKXjpeb1o6cV1TwVMUP3G9yBmk9DamI5ght2/QVDEmODflVY8lkZ
         qqae62nPF4DsIJxBiydAnaR4AXnup8V3ocdvQj0CQqK/wNNNOtQCSYQC3wLX2iETtP4c
         6VE5VLmhKtOrHxcfE1nP9cjPjM6hQXSM76s+uvurhd3nz6QViMEjUARjD6oQlepnVZAv
         WkdUR6giNt/xv2MRPBiNvfELCbS9Ve8be8SLbqrMNn6hClCeQOf81ood4taSA2cQ4njT
         CHkY0ZWkhzhOoO54rpplcXbdJsuCmw0Pw31fKIMImNDybV9aoS4ZACV6NFuq+LFzu3Yy
         Hvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388891; x=1756993691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ofMDnt8aegB1RhhNAN0+9aJ+qAFEpSg+iG9bqL1LWI=;
        b=dhDdq+dWpa3LHS7smwKxW9cYb3R956iY7M8acVK97WcdJcEsms+ApaQgeVf3RvCQ0V
         0gLy1sS2OZngZnl5MOggqc/Blew+Ax6ZVlWOPWs+HZcKMXkshOW266nTJrEXhvnTlFYH
         IkMBT2Xo/x4lT7e34TlTJ7kjODEUsRPiclubMrgFRLa9jVl6ImH+9pHp1sRDmXjOuPB5
         guMB1GhSkZPq7OGFeG+zVtnPAN++mus9VTZwRihwD2rwdZwHUXLHLX9w7b4CD1r+i/RI
         DrCAjNfUZMKPNEoEHYlGFrxf6HsZFZedgSRpQUtJBjnH+mVL1l6wOWwJ9sjV2ZBG0rKf
         iQDA==
X-Forwarded-Encrypted: i=1; AJvYcCWqxsdH+N/yGnqzxLmkoewAJOfnAppJ2LWtSewh+zgmj36781fbG/OqR6VTThx9ww/LDZEahmf+Eldi/9mYXeWl@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMCo3gPD1xmdlbkw7jJtEJ7ukKgbBnXMh8yAJFoNUir6DFWhK
	jXcVR0lrn3TYDTJ3inTgH3R9G8mw6mOSfBX+QBDaSXtodiVBHQP872Wb0K8dB/erq50=
X-Gm-Gg: ASbGncuLFa/8ybyd5QWF1KNALvJOdUsTwfCzO7RouJjjOMiwOdvnJvAKBQnUA4eA2Jv
	vrSTLaZi9pkDUVFZIVBlGHh/zq/PEH6j+IFigxw6joLsmbDQmZl/+DlDk8vOuTYS/yyG1CiwjGt
	o7VIR6bjFX95zSPH4erQzNHVtNuQOXaVsceWqGOBI/9K/XJ+0pDtjo5FnQDlAXUyJYi3ww8aQ6a
	anvF4Kf5QiGwy3WM5BeKgLw0RWLfMAC7RzI4uNTbZoNmDAVj50t4hSX0c8f2uZCXtoHdbbHikZt
	vdiTvOOF+FyNxchbopK9KerxKW9Sf6XvAMdQ4IUH0ArJxum2cjePUbWFbOmoawZBH7KmZQFGM59
	3OO9OFor9xxMWFXbfCGn5rubV5nHmG4lKe5hp1gU/w5G0ywh5em9+xhfHEfkqkLOJkMrkkzYmX3
	GnB59K1qfUQtXDo8ayxoMUwmDpX2M=
X-Google-Smtp-Source: AGHT+IFkrszRCxrFihFU24ZaJl7ZC3CwfnZHIryHv8hl7fJKUiWiXfcIaoNunoVL5GDO8tLcbR0fRQ==
X-Received: by 2002:a05:6402:430d:b0:61c:9585:9eae with SMTP id 4fb4d7f45d1cf-61c9585a269mr8045358a12.6.1756388891487;
        Thu, 28 Aug 2025 06:48:11 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cc8d32821sm2092757a12.9.2025.08.28.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:48:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 1/2] arm64: dts: broadcom: rp1: Add USB nodes
Date: Thu, 28 Aug 2025 15:50:03 +0200
Message-ID: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_064813_154705_C4E0D814 
X-CRM114-Status: GOOD (  10.23  )
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

The RaspberryPi 5 has RP1 chipset containing two USB host controller,
while presenting two USB 2.0 and two USB 3.0 ports to the outside.

Add the relevant USB nodes to the devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5002a375eb0b..116617fcb1eb 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -39,4 +39,32 @@ rp1_gpio: pinctrl@400d0000 {
 			     <1 IRQ_TYPE_LEVEL_HIGH>,
 			     <2 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	rp1_usb0: usb@40200000 {
+		reg = <0x00 0x40200000  0x0 0x100000>;
+		compatible = "snps,dwc3";
+		dr_mode = "host";
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		usb3-lpm-capable;
+		snps,dis_rxdet_inp3_quirk;
+		snps,parkmode-disable-ss-quirk;
+		snps,parkmode-disable-hs-quirk;
+		snps,tx-max-burst = /bits/ 8 <8>;
+		snps,tx-thr-num-pkt = /bits/ 8 <2>;
+		status = "disabled";
+	};
+
+	rp1_usb1: usb@40300000 {
+		reg = <0x00 0x40300000  0x0 0x100000>;
+		compatible = "snps,dwc3";
+		dr_mode = "host";
+		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
+		usb3-lpm-capable;
+		snps,dis_rxdet_inp3_quirk;
+		snps,parkmode-disable-ss-quirk;
+		snps,parkmode-disable-hs-quirk;
+		snps,tx-max-burst = /bits/ 8 <8>;
+		snps,tx-thr-num-pkt = /bits/ 8 <2>;
+		status = "disabled";
+	};
 };
-- 
2.35.3


