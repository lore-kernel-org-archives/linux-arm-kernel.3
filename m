Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=28jVXj1KvBnfnxIL9i32TlSNew
	I/jM5fL5TLRS6ULvIxj5IWqDApzyoGPc2WE1a1kwiQ2LX9WAYwBGzT/8Slw06P+I153T/e8LdKPHs
	TdKgUH+7PbRzvHmR2PdjBzvzX8iSehzQvmHdvNjgU+PToYoxl0NZfB0/L51GMggvpKFkjTZHQ9rPn
	XdfHzRN+AA6W8CXGnCG/fjwu1xlaGWbBqIbw4FRT5V68WFe5mlZAJ7wMh74eXXrIaKEYZAfPM6RyH
	1dJR3poLksVSVY0U0CR6RaHIwmanMGlYA6SqXSQWlgQ2v85X0ACnzCd69Tl50ZNcdphgTKR33dh9e
	1V25d/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdAj-0000000FqLK-3nQ2;
	Thu, 29 May 2025 13:19:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcan-0000000FkjO-1LCY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad89d8a270fso408971366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522560; x=1749127360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=fEwkBeDVOMYC7IBlbJCjaKOupYuk/i7M/U8vV0c0RczqSSHVeTytWGkoIPV+usScw2
         JytJgIjAltHIy66Zg50rZp/RqeHSJMPzCtpIAE7P+aWgD2r1Lm4co1PNhoT2o9fZihKS
         n2NT60TOczexiMdERdgwMfxDQIklmWY0frG668ROoMCgkKNxdDDlmev7eW7Nh4YwQw1C
         p+OKWEqdTp201h00pD3jfQ/LDrD03nmqmGOQSu8aCW/hdAVwdCPDKqIQCN6COxiTClrj
         hjLyd1oosU+2PSRJ/wCjf/z3I4Uvy7X1nmHCWN5S3X8JQwD8BxQ7T4LfEMQ5unYY2F02
         NDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522560; x=1749127360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=qHmwVd+2FghuymcvJMojeB2tqTY1KKtg9wD3l2raEP3cMwEnvF1Utt+aTJtZFaQvXE
         5dht5lDDhZNOW36t373g6xekDLAZEOZwAFx2HF7zECx1qr2PFQzj64TYhE5waeD3mpJ5
         ceYA0e1GYOftW54ujPEbwyOW7YSbzvci61cLHYUVea6NJ09OLWpPFcorG4JZNwdqQrj7
         ZhcIVdf5ihtcxPx8NfLGKh0brx+2BQ3ZY78YJuxZ8UOZxEkdnvKnekcP9+tmwuiM1bRO
         AZ4f8TButgIkNZ6uLsKoeYczzA/S18rH/0w5uHpvix/BH3pTpSXsbP0Gr7YBjqM5UOAz
         XhZw==
X-Forwarded-Encrypted: i=1; AJvYcCXi6DPyyBG3hMn96NPTNQnbs8Om3pvsZJ7z5Jm62RrGHlQPRu5HzdGl25AAPEdadzVCskLJySSrwLBJkCkWziKl@lists.infradead.org
X-Gm-Message-State: AOJu0YzDE4wgVfNetGEZSwAZEBqUKEPB7tJcZg79tmgLKNm+lX9/yvea
	EbB779UXxnt5gg50rjbopIXasFt6F7V7YoWjOAZ/oo85Puv9oAGsJI1Z7FvMOLROOYQ=
X-Gm-Gg: ASbGncv/r0iq80iOJUhQ5VVvLodLZj0FBPD1d932MzYlTumeNZxB/Ez/DikQ/+i8VSk
	xysuZVwlk9KkpBY7tbeGqyY9ZJf7qgtWO0TUIpYdyf1HmcsV/KgOpjmI0WkTfug0EgRCmOYUuZ6
	x+ZluwEOtHzX4PNfWdxuafjmpe+9EhVB8Wk6/7o+0qeXrkipJMMaJJjkvqH9kPn8fqeMzLK9A0z
	tcw3tz4lBt2xULswEaBKBwvp9YtPyOzJhdhJUPzhc7BUiPG2nXtGT9SakiCAq5nKyDcxTb32S6q
	WcRmqBlXGlbKSMg1fsBLIgkgsKFyC1+in0dsZBk2MWo91kir6J+FgBwCvGrZLp58bDKH3HBNw30
	lR8xl+poZJjgnEHdcjPpk21HjOj64gn9W
X-Google-Smtp-Source: AGHT+IGmBWL+ssQiDerV1S1/XxydSfAjqd0NvxPIChK+RKZPzFhr3ejbEm+LE6gwooRX73fUz2rmnA==
X-Received: by 2002:a17:907:3d88:b0:ad2:27b1:7214 with SMTP id a640c23a62f3a-ad8b0e63c34mr325370166b.17.1748522559741;
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fecebsm138373466b.1.2025.05.29.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v11 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 14:43:57 +0200
Message-ID: <20250529124412.26311-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054241_351629_0173E749 
X-CRM114-Status: GOOD (  12.13  )
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


