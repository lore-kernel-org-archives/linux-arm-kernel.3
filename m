Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BBFC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=QOpmIAUyaeOfBkwmAtdGxaZ3G+
	O9rLzBVrmimLN3GfyuSTd/vvcaFOaPhKELqvqsEZeYZmrQuMQ4LX3fVDLO9ITUymuDvq8tp78M/7r
	3ahyLhvt+ONkDf1QzsjTaBQuseAeQj1zRGuCTajDLTvGrZyApMutkdFvbFBEgtZmc1+7jzrhR21ub
	wARCM8RK1gUVpPuDDgGCqphGEkE2WH5euJEBev8w8rmkbvTP/g7vqEQa9LEG0+OaY5bprjNA8KTaR
	MDUExajykGpllhOr1Qh4PilD/HzwWPw3K97jfN/ZDbX4eOO04h47u3IGI8nBNbjGo91nhzW6VqdSI
	NSOEcFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWAc-0000000BHwL-29jM;
	Fri, 07 Feb 2025 21:45:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwM-0000000BDUX-0zPu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so1505910a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963868; x=1739568668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=Ytf8XkdsBsO1wRzPugbsibpjayZz9nXXawiHM6ButvzS8mGorqO+qbRWtm319Zd8XF
         EhOtlB0RXG4IvAHHE8+VkN2VG8UMvauWHkt12wIAsuQOTitIY5CxD9F3C/X8ExvLicND
         17Sx4puGfNh8OMT7IaMCwaJqGGLT/BnxzMNkj5Liz4rxIi2zlBKWTnKhFWTZxgWY4qZv
         vLyXUdG9VJmZiA+rLq6qptL/93IbPUcLDoGGMNVUbS1KLEmkQHPb5Hzh/yMZ1854v+jz
         V0lpIt8YeIvW0KBmIjIPcMr42C4HE4QjFyVwPU2mANDcza+Phvqr+kh/CVgSFmnhYBMu
         JvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963868; x=1739568668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=DUYHYM9jYStv/o+htW+LKb9XkiUyDO1C5uDyiy4kspgB09+v0RpAE0hpsKgSqDxTCx
         g2NAIXrown6X6JUxL8rObPYlnnDAt2t6dL4+Rk9XzWXr0okz559XSKLIOWvnsb9C2Yis
         lf8Y9wBPSjlTcNCTWF0pFwLWvFG0COrCAdV0wGTyehVlswnTRqDyXJzPQH3PjO5Jj/v9
         ZUghIzsfUhw5OWb9p73bcLlFzyKwvRQgUuZtoqysIvhjWy5YFjDrOHDoATexmz6EYUUL
         93jqYAewjpBjx3nqJYN687kbM3wG4ycp/uf6g6ksE1Fex+BxmenGBOyKxHaDQaZSvSX/
         2qpg==
X-Forwarded-Encrypted: i=1; AJvYcCUOjiD1pnef8aATVk1YNU7DsGiPhcfZJ9R3cDYxE58gAUbCmq/Y7418eUT6kbNsNAjs3uHtAeSxBykV68VbJ6IJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxZLjPJsMzVRpMPSlQab1EWWhmpAd6nHIZgLanGvw3DMCVdrOxI
	0P8n5XpjQo5GsqY4EELjTkWFTYAA4mf07gUWbTt4NYnLqgCkclfXB9UD0lT9a3k=
X-Gm-Gg: ASbGncv4C31w9D79gLBEg3WdtCyAT4E081Rhgfk4q1wpQ689CfnGG4RwW3Qyp8rQnM0
	rH6ybYMLHwSdFDFAVJrY4GpR92HLhULzBdT0Rw4Z/1Euc8Ja5/QKKxc6s6P85hu6cPQnajJaz9t
	iFqi4QrM7ptmMGJfIrE74VgYNGAcNH020aszoY0GRzBSj3r0TJ533nRpjIbkUJ22BFsUBWTQObq
	LtAgpHGw+G7YCxyQhCHfgodbCGJZ+sVsQLlOc/z42id4K+XWh99iZPbdfTUltRNFGseJqQoiNFO
	WQd+hYuVnZUIn+FODz/CHpX+soNuL2LW3JWSrjLdwQhVQftuDnfsteN6YSo=
X-Google-Smtp-Source: AGHT+IFnue8aM5uMyuzX6JhUGUVfjNquFfLUAy682QmcZWe7J/NUbnpi5Rbddmy7cdrZqcN/Fq3qvA==
X-Received: by 2002:a17:906:f5a4:b0:ab7:b08:dab2 with SMTP id a640c23a62f3a-ab789b39591mr578677566b.22.1738963868593;
        Fri, 07 Feb 2025 13:31:08 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f485dfsm333069866b.28.2025.02.07.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:07 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 09/11] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Fri,  7 Feb 2025 22:31:49 +0100
Message-ID: <d77f34885b21a1953a5a498d397432ef377bd6e6.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133110_295373_9A0E809A 
X-CRM114-Status: GOOD (  11.95  )
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..1850a575e708 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3


