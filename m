Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8804C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=; b=UB24vS7Y6alllzUMt8diU6uGcM
	iz8qKadiHZQebst3qM6jf3vNB2UtRg9mt4i5p2jYu/ETZs4tikWavXpTHKhVkryJbB9FiPlP92gfM
	xbvMWYuwNw0IdyYkyOh+Fmg96ImD6+Hjq96l7TMv70/4hiQ6uR8iKwUxDcwrddVJpczQlw0f/U+ft
	WGK0cbkfoHxQ4Gs9drn0wwXSb13M82IED8C24ShbKWnSvw6D6a7AOLG1S3lLajMEn/rZ+yRMCISTJ
	/tqNx3RBYmuFy8gwv9fEmUyLdl007BsL2M6uqtu/5XtZfCYwwkcjEJkgYoEo8aqt6ApY6AYbYRpwW
	hu/dh7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbv1-0000000Fgyl-3cTO;
	Thu, 29 May 2025 11:59:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbLD-0000000FbH7-3U1R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6045e69c9a8so1321905a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517750; x=1749122550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=JeiNsdzIeIR0SfFmJbc3LsEafxbmBNxGdScByULDwH9SWBDcgvbHixlUBAUO4jXe7r
         zfglgj17fXgkKSuYR3EwWro+xANnNG3cBKtAQD3ghoa5r15Tu3rMgr4WuOStR/l1aYPQ
         O0qWehfwenCHuDUdmm7k5ntGXQYvVCEIwEnjC9SMZb69r2Q4LEflubpxwdlhpue34LX/
         HOkzKKgCu18Q6hvDWU7T9+DztLK3k/v+aQ90ziNe55kkGLRtGxnEIZZ9o4e958l7++X2
         Kypq8aABMU/lig4Ex/i92GtO7bfeS4aN9Y+LFAmGjyvR99mMJjRJl/mNuDGmTCfiSTcp
         MqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517750; x=1749122550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=d6xsoOjuwwpeRWNPVEw3F6N4IoepjSETZS/HqqPfdWasXuPcI5swzdZ0npJ3/QdSrK
         IhNd9Eqc0FPuL/Ap9vvZhCYMlFNKqPvgd5eGgPW1OLGOWNte/p2rZwoVYoG/pQvi0xR8
         fMEZUqT6vBsrfwLkbrJF/+OpxhaM4uYZW6o3NYVROhvTQ1JvdMR/k5ZdaO9kcUIQHHOT
         u3ASLQezjSsNq1Txey4RLZDLv8yCELLmxtuVL5D7reVqcF6I0/GVx2BEUTildprRKEhQ
         BtWFSVmdNKvbTFwZ5mTQKOQVBUjTM5GVtDfCooArC23CpNvxkGgXnwa4i/RYtfsrxLZC
         Q+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWHlguA2nT20p4ARx86zeYvu/KbZlhRhWcVXtoQbDWA03u5QvijVtNbpnmeRmYsTQukPgGbSnJpwkgtkkquWIEr@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYqE2FX8cY1IwuLpsa9TRvW9nXJ4BpIs1TpLxNmjQr7UVeD3L
	urlZkVHxY1T3bILLRBIZ00QRxw7l10Es0FnuKvCpWLBq+mfDeA6B70+LGifHk8+RbFI=
X-Gm-Gg: ASbGncu3IT4Q8fcYjGDsXE5CI5ZpgIbOQNcrfJwm6Eb+QaZIk6OJibPEP993TEsth9P
	tlfjY6h2UBB561ydsVs+nfRBASwgjzsYDaC92PEGDNcxwvv/tfEiU6DK1MDZRoIXyzcOVkr/0tg
	U0YG/a0dYEN5kkw8+8hhFV5lbPDWoTzen7RSknBoVyFtHFDOh8cQwQk0plSW/qOcJT4Kesxm05X
	+PPKajMTWC4Z+JVeOrk9nMKZ44dVENwOwUOIHibxAQjTF7+g2hVSx/KTzsEifSKioFbktXmXHlW
	+6QuLZmkpq9hZG2vjLpT4nPPSkSYAUh+MhIQ1gm3fTQ389h+JwH9JTgv4eg+2KjmYhL4wnjKXT+
	btt4dzkvKbxHCxu/u14M1ryoYMOc5S5fB
X-Google-Smtp-Source: AGHT+IF8XwGQ/OgGZTBGcr2X6Fq/XxCyQEjsrXV9gHdoKK3u2BCfu5O6iMLab7sWG6PmCBIWss/qqQ==
X-Received: by 2002:a05:6402:2803:b0:604:becc:2f6d with SMTP id 4fb4d7f45d1cf-604becc3233mr14133877a12.27.1748517750408;
        Thu, 29 May 2025 04:22:30 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f814esm2194013a12.32.2025.05.29.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:30 -0700 (PDT)
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
Subject: [PATCH v10 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 13:23:48 +0200
Message-ID: <20250529112357.24182-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042231_871361_DF64CD55 
X-CRM114-Status: GOOD (  11.70  )
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

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3


