Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053E6E6688D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=; b=KpEvfg7aUlJP5604lPetr+CWq+
	rWZEcYBE/XyXOwAdSLqvJvwgWYoYH7sdcodcBkmXw7D9Al6qX4aRqVShrfWBOD8kNRonw6at7pYuD
	X6skBDO9mgkHJog//LCja60Jrw6ibdxNSxnHkwz9BhNPLokgk3ugAqgoMbE1NlfJHYIxptvRO6Poo
	lBmQ9+Kv+iHOAxXqOQoXQ3g1gdlNQPDQinGzSbXDJn0KXKTQlAmsshOHeMGVaNSmzPU/sV4Pjf1r9
	TPPnrW2Oi663znrWCimYeWVdzyi+SPzwEppucN1hn9qyLBWdn9OM/aYOv0q3xLfMdzuYoczdth2Ad
	VPj2jzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFANz-00000005fRA-2GuA;
	Sun, 24 Nov 2024 11:02:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFADH-00000005dcU-22It
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso263184266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445494; x=1733050294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=fWlLiOvQ3wqusZzLVTCMgjAL9G/s3OdoXUYWujKLzzge9r/b8JvMNQ0ZFoiZc/8/3N
         XdN+8/OEFTdBkdssZrnJO83kkZMfRy5DDMZxAQXgaO1YU803ogHu4xn5EnS+ig3cAVu+
         UTFpKOVYEq4B+5JFuxY42PaocZczAlCaUEnLBcvkvAPCGRRGJnTYA86P2FwUAHeu7Xei
         DM9GdZsDlP709Bh5i3RP066GD9TNzbNOL8OnMxp1IOETgpoIS9a9i3CVWp909v3Jdn0L
         RfKpoNQhcBz0YdLiiFZbwtIOiLOSacfLeHv7ahaUbuc44HHGOsvjTjM0d7FwsjqltMwd
         7K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445494; x=1733050294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=YFsGkgNB0H5pC339k03FOHIsFalPOAN4OeGdya50zmX0eSBSFJFWvrWdSl+m8V7caw
         uXM0MBR3K2fjj+ZYo01KYoyxcprunHryvcchhfQO6iwxu89spMeejrX6c6RPrrJdilgw
         4mTBRtfa+/vMHSqhFMvmGkIMthQh1qQPnmdhomKlRKW8p4x+wXdI8hC3KXtM98j41yNc
         +CGpiisRKNLR6MwjkaK7PETZthqPHQarosFxcra7QJGfpNv3pUx3nz7ukA24M8n9WzNx
         6S49o8eCCVXMaduDnCDrJy7xcgqLSOKSKmHJcPoTLLbT3rs3yeTmohlJQZcMmAqkrCeY
         b4eg==
X-Forwarded-Encrypted: i=1; AJvYcCVUh3z0xa/gDl780g29V3hHqB2eA+R1Pb4ZeXu1tKgx2xdUPl/bsa6bxCHl6+vwOxkxMVDjm4VYGjaKkWQpNyZw@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJJ6TEZKXwBWT+kUKxZkGwgl5Fe4fh+9omwp02rr+fAA/BeYd
	z55813Rsey5a/vvba17lRMfVfUc5IXpwvYv2b3FDv+xZhocSNwE2cegdMwvYE64=
X-Gm-Gg: ASbGncuhiRfUKgzjE+7FN9wngYb9oV7oq1L7RwPs76APF1tKZXq0NELkaVEHAaYLUcQ
	TO52iaJ/2+/qZan3a9fvZJlqunXF7G8+rs++fw4kj8NBInbklMvmEvRNZnx/h9Qm0ZZeAVjZkFD
	wytb88a8pAIAaF/97UUp1mof+cIpGyO3fE3GVyTbp6spDUevszfe+pKZrM9hD76A5p1U4/snzMh
	iwOtZfbfLqneqDZfpn/ekFX10XWbD4q+nhBcE+IXFFGqxuLTiDttN37cSkFuIC2A14dLyrsYO6Z
	+/2iXdFXsF60MV3e9In+
X-Google-Smtp-Source: AGHT+IGkXmpO8F4Dhl0EGpNxs7dSonbb3C4mmRh0iCiEPq5mTBcYlRE2EkQKpKCjp2nit8IeufV0YA==
X-Received: by 2002:a17:906:18aa:b0:aa5:4cdf:4a29 with SMTP id a640c23a62f3a-aa54cdf4a4emr66028666b.31.1732445493808;
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f9e25sm328892766b.78.2024.11.24.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
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
Subject: [PATCH v4 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Sun, 24 Nov 2024 11:51:47 +0100
Message-ID: <2292350a8bcf583129f93996c8a6ad5572813d9a.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025135_538954_270B265C 
X-CRM114-Status: GOOD (  10.55  )
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

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..7c3254b043b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -689,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1270,6 +1272,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


