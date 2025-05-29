Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE7EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=Lof4/k8dPLaHjPxbmD6q4xIVRJ
	icgBn+PCHWwC4LqIhKxjLw52gqIlC+Bk7/NMjY8yHizoTaB133Xo2nNAJ5fIfyRP+GpkZPSC4UpYr
	FWzXXlVGCJHexo33fGJkzHSWDbdTtVvZWOurUm/B2O+PkiWNY0n6ucUcQZsBmQnefIHB4ODk3f5qd
	Om8LM7FD2QlcZl+mNy0ZbVbXOK8sbsqDnQHfenM0LWESjZ+tTR88UAPGsVM7na89KeZR6ktrINgyI
	QtVJ5+TOynbBdczIBnh9cthslJBWH6Q+y8qgd41JPqctstq/7tnnvcDgPhHxBnybrf+28fpkIUuKe
	1frBecEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeaI-0000000G0mO-0VsO;
	Thu, 29 May 2025 14:50:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddP-0000000Fu3C-14i8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso107921366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526565; x=1749131365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=BukRNEtdgJxGqYM3ZM7X7XZyWcumMU+I+Ox03a2ThGb9/ETZX3ZAlaXG5vE1RC5HU7
         MBf8T94ulVeet0X4ptmphjTpjrPnJAr8iRlgpCK3EMmZuJKH0/k+64nBMlH/kB2vVoDT
         h3eWPaqsDxrA9zeukOCDl0PgJcl3VsFaEQuMSgRtUOzNa84A9TIpwUgMTAzQRgmLxKdX
         N+0QczbPox14sotdPKeMlUIpsbqC7MkWtwjllA0aPeuMV23oKcLNQWY1CKdg058nF3x0
         4BrMotUHPdcxgvdAX/Ltpoa4Ey4mErP60W5xsYt9Adgd2kmMn0T0zr3KDB4Y/qA9B4oq
         fhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526565; x=1749131365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=rb7Hg2CrkBrF5V2L4JW3OxAw1tQXs2GNEdVvaEdwnUF8uZi7wbvNMivG/89AFuYMHu
         N7kQ1piSS00eYmcDQvbnk6YNjZC54YyUZjUVg0SIHm453SvXConj/a37urwL0HLIAtTO
         EZA+fveltA5eWLDNu7a/7yVtww9/ATi3uDBarhqdLVuLLfAonTT/Q5UpYoAvpX3cdyZV
         L8gW06EALTLMMev23X8GCtXmwt9k3VlLRJkFl/iJ+COTWrV+ASNHqWIN0ALr30/RhS/9
         8eBKtgTf6D4FTJWxFk4yOC6M4o/2jScHsg1qMtD1yRAmGpmzGyF2MVoG6YUmnfc14Xaz
         kHLA==
X-Forwarded-Encrypted: i=1; AJvYcCX1bgbXrsWjKRpP1MooGpYJmFIWnMZ01ex0INGEqUtiDaNlJOqUi4HeYGXJzrRbRVwvPN+scTgy0nJCg7j4bl1l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/2+E9iV2T/3BV6aHl9hm8ZmB2siRMV76Gj7+snONowFW1QLDC
	qhCZNbL9U4qjnezVeIF4xyXHPb7CfMJURXUWOsIoTRfhH8dNNF5mQmRqtrtA43fHlpA=
X-Gm-Gg: ASbGncuRkyfqq8jza/JBhjuUPQ0b3jY3TcYoPu0k/H2kpvpn9XMSGLf1WkU/4HdfFsa
	Rgb1b5uxTpmku88Zl5H9FRhdPIhMfXilR4LaJ2yfHgyGqNWDe/tNmRJ02KlMLF6pav60Mj8gY7h
	BzTjjxtC1/Z4ulNSCom59VRBzPNTmcUIA3UtOXVWDmbJJEPQA4fU8NxJfW2RNhzq8sBOmIKYjE4
	TEeKqk5wldhSAi9o8A1ZeTDQUYXgtAa1Vz1V8bxyDL3r5KL4PQqYqmybMe82030wqJxdjJ+9xbi
	ygW0B4ZfsIB41PkF2Gn/1nYVJKw308zcaxBGFiCAMltVymeemqCeY14RxXBfRwxjgSv26/q4Ibn
	k6L81dBxJVu21bIJtAC7kYg==
X-Google-Smtp-Source: AGHT+IFaYnKDP4OR65WeNJFXd2Qcwxypx676SRlwxR+m7cKcv9QtiqthZ5su11rGaYFNLwt9bEtnuA==
X-Received: by 2002:a17:907:971a:b0:ad8:9b5d:2c2b with SMTP id a640c23a62f3a-ad89b5d2e71mr801614666b.25.1748526565369;
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2fb63cdasm4600266b.120.2025.05.29.06.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
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
Subject: [PATCH v12 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 15:50:45 +0200
Message-ID: <20250529135052.28398-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064927_286545_5A5BE1DB 
X-CRM114-Status: GOOD (  12.23  )
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


