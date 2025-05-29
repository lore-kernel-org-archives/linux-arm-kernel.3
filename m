Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C65DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=; b=AQ0457kZsGE7Oka+NmRDiGjBU8
	8eSN9MqXvVDVvlIeifEtloaq0Xis0WWI4j7Gb4ot6vziVeTZwQVih5kHymGV2F9sDDsXjtT8l4Vbu
	RqImhqsusavh1vWC5AXEP8VqRuYTa2JBkRil+wc//YxO2YcjpHgo9zwVwUnqo3cLm82SNTkXOg5m3
	bV/h3U6g0ykqa5mZqPSTAQ+AHj7ygbIc9ftht4qocD4WcAjEGcqaWuNx2ce+EbqBRV1Q0P5ojNlr9
	HDcPTt1yNb78DKxfSK76Aph71RgwgrQ4R9bNwp/Ir1jhtaEOwryVUR2qaju9gX+HdXdW8eSrREgXt
	HOHBRpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbkZ-0000000Fg0L-0xLb;
	Thu, 29 May 2025 11:48:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbL8-0000000FbEJ-2LJV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so1399322a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517745; x=1749122545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=cF3HvUUJwhCxesvY1M20FU24tZ9J/34Nka1fnkntKRQZnWZc1Vlozofsfg9asFO8eP
         7e7ko9jOLzBuDsteitnPSjTGhiwySrKlCRtjZcQoOKhUt5u8WVi/E/lnQ4cnIPXOY0K6
         G1eSBc4tEFXXxXU67XeEKG0KyLPtH7/PmIC9K83b8MbPu/bNPOKbZ0vr91S//PILPgWX
         js1Zh90CHlUN/U+AEovgrIATOVL0Ik84Z7mEUp5+cMWENIPHetLVdThViAUMcI6ICT9J
         d4D+Enn7hpjHelHZbGU8Ne9fyhs7fEqcdEO7L97Vv5T47ZlaP00SD2MlWBBBFbCaDsgv
         suAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517745; x=1749122545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=XRdP8yO/lf2XEJQ5ROTaarRxTW6+2bZ70Bo8mRwFh0gn2GJs+eRZku8050yvNnkxps
         /4ziOr1G9qqC0NA5XwpIwxa4NwvgtHhh7WaVeE2P8tWtsiMsHhtVep+tiMsL/GZtIv+n
         zY79ltLYC70I5YD/zThyThNEHGhZc02RR2G+6e8IM5M69qGPJ5u+rHHWP2hhDMsIIjus
         WhCDeRBV1BXb6YJoLditiCRFY+0NnuG8wHETi8qrikOaiU4flSHNGiAVDT0w8WbYK3Rf
         FxwAtcCfnFPZGJWQUFFuACh5GXmro430oTy8mFtBvvusmrXYn841JHJYXM67mCOb1rC+
         XhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGDas/uyvkxLX4fsQRTsXNRhiES0zO9TWy07pjXvyCipfl/I09b/N3nbi1tlaPCD47kov8v7nAOw5RjiXXSSsp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0dsDaE40vReWGqmIol0ebUmtC0bJnmYHJn62KeG40xWeyy/Qw
	TnNKLuWuAUMNQnBmWXrIyDAsmT+UgeXQLT4X7tKpiwxCE3x2a9NPyU0PY3Ym7nh+Wi0=
X-Gm-Gg: ASbGncucQ69L0F2GDlg76f6B6HVOVeExgRtmU2DzzCB4j7Bx83eXajbu6W30ROPvAd6
	wMbEwc8wx1eUCfB3iY85ZliggbB/OkLApCnDF8t0s2+HC5CYCWK8EVLlWHHdZQw6JygnxXaKPIS
	UFw0/7wsZscVdKSZJkawm+DnWyrjnpe7Iqrqtq+w77anQrts2FhZc3rU0is+LVcxnkNo7v4oFo4
	PkBkuag6IdRrCFJ2HO4OQzTFO4wH5noZZ3qG3F5a8W9e7piGL4hf+XYE9gFqb9ZfJywQZ/FvYEw
	R/1EU5gszI/9kYEzkWaxLAQQdTLiWr6atB04tUTDOOyuR+LEr8NtbZm14x/Kp3Yyd1F0QDlSRxb
	P/+7dESQokU03CcHLhFXCXQ==
X-Google-Smtp-Source: AGHT+IFK5HrO5YRWLbTpI1CNg/Y9fsCVsm6BLAVkF3nAzCYZI0eN92baPbfeXmfhmf7aUJkZcUs+uw==
X-Received: by 2002:a17:907:9806:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ad85b185b5fmr1536323266b.47.1748517744799;
        Thu, 29 May 2025 04:22:24 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2befaesm125684166b.104.2025.05.29.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:24 -0700 (PDT)
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
Subject: [PATCH v10 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 13:23:43 +0200
Message-ID: <20250529112357.24182-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042226_591010_DB6E0DA1 
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


