Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BB8E6688D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=; b=fpv91tfJyaGvw/m5mCRGeNdUXP
	fHrl2BXJ2g1O5KPx/SeSEUsWP77PH7lzFInC2npG2tz5gmqfbURRDva9xclqAVQmIh0Xm8aVDSyS3
	dvliUTWzubXw7zQrYGdnU5QlDDGEGtUDUSqOj9GaK0epPw9m7Eo31AQl6Dq7Leq9Fb71072EW7/sF
	2zpfnrNYYA0CXQU4yDCTSxgZlwyTgONYuJXhNmU+GvZlc/nCDujDbEGtYBFfTKECFPW+Fi9XjmZAC
	TJmN1ne+6Iep5sNvZMCpdi1EQpC/P3Dy4PPiIy/E7Z3pMpOh7cKzYZtfc6RcqVKkoApZ6UVx6jDLg
	5ByzFfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAN1-00000005fJY-1kIy;
	Sun, 24 Nov 2024 11:01:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFADF-00000005dbf-4Bfr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so562138266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445492; x=1733050292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=bWOpdO+D0r4iGso/vMoBhnXPw9sBtA/6xJk1NlDZZAdqt4lE8h+46ZZd4g/WQJj1m+
         wgfL/FTxydWi9wgBbfix+FDgZ6i2z8u7CxN1yV5e51Ij5ishdFkfDgsFBnTQLUIFDmzE
         wpOHnqsL8qzMFTZfiGHPzLetcgzxybtGoj1hgYbqoRquVyFSI7AsUq7cNLLNPrl74tkG
         5+S8VE18l9257fxVXjXgSCSVmKcnz7/uy3jua7IMYoQdyrjlv/Swc9MkMZsmtaugrt2w
         q07SCscmiPa/WIcLKLh6RwqIFcPx6OPnMJyW9/MfI3g8l90cUZhgp2NdtNtTuS8VjNDV
         JlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445492; x=1733050292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=MiMeDIo7tc0hXwIUGUUmG83geWlEhH3Ueyd1yJcMPQNf79+UZ3CwpJ3zFZ2xtP9hcl
         sOdhO0z5uILQ45NG2VwyVcn4UelFrK0M9uRNAwyhUDZ0HzZjf/M02KadTLFtpe7hbUVL
         75igGUD1Tm9/FZq4WMcisKdHhCP5c7AlrSAAOkC9Wiq+pMkSLjQP6E8dt731lygnNtBN
         JyS8GbLLvbqkyE3vlEs1xp/euMEbwn5zElH9RJZE3djVkcJwdc+Un/o82nZT+xVrV2kl
         eezIa1Xpo6GY7xbPicISXKw01Oo+m1BZ/6Cohs435ioUgTsK/+pSnIso+i82b/KIjvOa
         qE3g==
X-Forwarded-Encrypted: i=1; AJvYcCWKlclwQS8i8sIZAj+FgeN/q8z5FreqgWEgoUmOzJ+oU8H4qEYiDG6L6QZRaorTWPbFuWFTT0DMJLmZYVB9v/GA@lists.infradead.org
X-Gm-Message-State: AOJu0YzF2QzQLa6eQIKlbYpras1T5A/2w16f5jyb7IhkL8N19LeVeVky
	JJIRyBEUxMK9T35jlyjG2o1AkC7JmFOfXwHTj4gIjzKGA8Rmm8yUFwz8CubmDME=
X-Gm-Gg: ASbGncuqXSaYmJhzkm5bBixqcq/TAKj3bQCv9TP5OefoP2sN7ozY/hTVDXo7yZYj1AD
	0kFTZmQiabMlQZGAn8NdRpDAibC8ahZjALMxnZ+G6+qxUDS4pzeOh+ILZDbmUKz8tW/OvJc6Ji4
	3C08hdgfjWIclNXtg30ozAgCBkNJT1dJ70KMtaaXPiY03cP7TrECHsOENZ5CM+QzwE/EBnHMBJP
	qP3oHdydd9L6U59pKQ6HzeoHdLSYAs0PH9CA0yA/4wLg4AezQ/8QJ2HPLhH/pRPWCI/JwTOeyR2
	X81zyHMXc6m+vV9w5O16
X-Google-Smtp-Source: AGHT+IGSDpSzkP9o4gSgW32myd8F9uUlg7N3TWy1+co5rBtWhujU/hEjf312CRmk2+jz+0sdWz9GeQ==
X-Received: by 2002:a17:907:7758:b0:aa5:3591:420f with SMTP id a640c23a62f3a-aa5359144f5mr387240666b.16.1732445492516;
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa53d1e1279sm129418466b.162.2024.11.24.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Sun, 24 Nov 2024 11:51:46 +0100
Message-ID: <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025134_044530_ACDBD111 
X-CRM114-Status: GOOD (  11.48  )
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
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..b00261992b71 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-50000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3


