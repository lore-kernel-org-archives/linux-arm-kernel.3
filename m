Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A5C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=; b=nCHAjK9aLsMKYToxBdgpgvguGt
	EsbTH3xCfWa7FZGeneV+sdC4bK8u6sLVjhuL4/EmxODvTcRNPrDw6CZpcyL/vfLoTyuVgUHTNe+54
	oHZQljU4BGlREabepbxQ+ARw9g6tD48U/OtmkMCkQgkf89tvMVPYeHeTr6uhRxZVaMW5YNY6XiGvN
	xOwO06L0/RDoKNSzgLCDXYRXpZw7fcuf+UbrOX4nfV94PT3HFCICASCcYT8J5tnpzC0IvgUMjb9wD
	2efO0MOzoiSUK2xdaXU4/iOx1G6vk81WHbskqpe7gi9+Sdai+vOHBJ8gipIvPDgPFzM8EP0+jKr16
	KA8JTDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeih-0000000G1PH-3GlZ;
	Thu, 29 May 2025 14:58:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddT-0000000Fu4y-1Ayb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad857db4f52so111115166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526570; x=1749131370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=X5HJU6o2/BtyBqYUZawoKgeAatr/UOkd2HLATvU8aYg4AuvEFCg/XJng3/cRfL3Rio
         Ji2eeQRaHNf1SCYH5cymFO2XroOSzpCwswxDJVZZwOB/zcppKL/fdoOgLnn/h8Gk5327
         4I+5ZwWMPtP5Ixjw1tPlaYsXBGe7Zrz/7ThswI5GkO8LvGxIr59LwXWSEUUmNDR+rQ0t
         sHkoInriCS0eWoiCBLGkZcd5ytIYgWHRAobACvJ+UB9orPwuZ9XCdfoY6IkN8mYFCjvF
         7kL0L8kpjl2/Ya1tmYaRM7V1EBSLRz/w/SRl5J47e+zuDvkKARKGlkL28bSnZfWlNKUZ
         HInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526570; x=1749131370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=HTorS5/aiJ2XuIVerzyDkNldrw3cMMVXGUM8FdF/LiIAh5jTTYyaALSbCMA3xT3VC1
         UKO41FmZ7OgXKLCGeXg3XeeAfPsn/eORCr47RruA1ZyMcxG7mzmlhakRDC7ZqFOUl3Jj
         TYcGuQcsRD+Rqy5kRiyj7ysnPNilHVRIUhG2AFgUdI04QoAUlG1gN1mnJB0YlHxHBOuQ
         Rm7eY1CN763Osk6SSn1oPIaw1mGXUzYQ76cgw6MBZM8luh8eXxup82xWY6qlDNZPQ6eb
         mEY1p33m6YUlsqzQNTJj4BKsz+ySceEC+lMJ610Xx+7lT1l8F2pmXedxNzxTRIaU3td/
         BvjA==
X-Forwarded-Encrypted: i=1; AJvYcCVbzqPHAh7N6LFWtidgCBR7cw5Apekbz3QXdA8ojM5PVav1l3i5+PeCCFzGlbiJV5KQBgwunva/j9izBTGUGiS3@lists.infradead.org
X-Gm-Message-State: AOJu0YxglX/6Tlh2j2DHAlIN88KnULR3zTx4jZJOg5Thpr3GYYN/qcBB
	7/U0iWTwceJRCDBuCOMnQ47OHKhrxycLQvEpOqkfJGSKfpTsOxulSZ+ewc6xAaxn/ig=
X-Gm-Gg: ASbGnctbIvAyrBdY728yF4fAOiOKYtt6OktanndISXjhbdWwPVArRI3e7ORBKcxEb8j
	r6HX5imZDOYU+TbhvX2/avjjHMn33CohERZa5wTKY8yRTZfzFAxI1nC2rGtMwM1ccPS2+AmNws3
	gCt2dcHVvoqIY+origiaaP7I9rRduSl1OuHmI87jmei2bg6bB6ufLpKcyvCZUmaDdqUCfhbCQ2l
	cBitqRgnAcTQlC8g9j0gGcE1rJfDX79vItP1TovdXD8gGGaULtIGpuD3cOGwSaBYmVLGIC8TPpJ
	xuX/189L5krRVKWXy0s3i8wPc1JWlZvYRxXlSm+isNbRmEa7Jo53rzuRCdYNyyD3Nl4f/wW4m7B
	Z3e3C5NtoJsfAYeqxwlk/Pw==
X-Google-Smtp-Source: AGHT+IG4MzMu82x8TfpgUN9WiYCMM5FeHzKNEVK3ejORnoVUR1rTDmcODCtdcmtp8bgBgoEd5vCLFA==
X-Received: by 2002:a17:907:9410:b0:ad8:a935:b90f with SMTP id a640c23a62f3a-ad8a935c99bmr503129766b.7.1748526569836;
        Thu, 29 May 2025 06:49:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82becbsm147641366b.39.2025.05.29.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:29 -0700 (PDT)
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
Subject: [PATCH v12 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 15:50:49 +0200
Message-ID: <20250529135052.28398-12-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064931_313574_3942E441 
X-CRM114-Status: GOOD (  10.82  )
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


