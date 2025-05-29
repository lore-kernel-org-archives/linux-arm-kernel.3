Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80FFC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=; b=WC9ozDzS4+yKMy+lmEJ1covEJw
	t+iLlmgPsNroOA5fo4uNUgAxKl+pMKCxCYO9hjIisv07dhRgfrIgDJsHxZEqBFugKoxSM+gswmj0T
	v7MAdWkBdqtP1PGu1v08lfS0us1RhxJXON3MYEf+m12gSs6x+KyBN6hF1z4z9BFOKg/GxJby4NGxh
	9JjN/c7yHx/KfmMuSlsk7H932xYaVac5ygS+DD3lFL3Qa9+sWmLhzSi1gO4Q4lK4lXpG2flOfVWQc
	dzKjL9MTTcJ4VMOm9uZNkGxZKx9Vu0embZSO/RFrBGOIL2cJi7CJfeNig26wwTDKcJfX8LGYaLe8O
	OnRstSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdLD-0000000FrPB-2LuW;
	Thu, 29 May 2025 13:30:39 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcas-0000000FklW-2VzS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6046ecc3e43so1318971a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522565; x=1749127365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=AVcjyfU5OSroV0xjcYXNHEKv3k4gnxf0PID14iroafQVutiup/JQ5miIyCj+cRhs4a
         aaOnsNj/cWf0GnRlUqL/YgwHPj2JHY8nGkdTv7GB9dZlEGP01a3tLes/aHLkePSfVx1+
         Rhcyh2Jn/LVFgqoVvPXSBxEN0koY526vLjlWOIk6kYxiCK3XoRA+mIPO0oBx76zkOepe
         0X8LuHuKrVzbCvMCxFPgjTP3r9YM97Ap1e44odzIBrPmwMB0qYPoO0pPN1K2RHIJRcPd
         u2Xwawpoz88P3SzGBsl5GrtbCh6K3w4YWVqwKJKpjPvTNI7ARJlwmmlYSGXTSBbLoICq
         hSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522565; x=1749127365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=EPUvX4KJn0E5O2Bucm38NEDKU4+1xpdyvVW0+CCmNQB7FZUGfMYNhyF+osZqCA1GfA
         FDDQtk+EK2gFQSvPFCAG0NIOiy+bqBmydyJDvc9f11+/faYwk8q8Cj7JfGDDiFKA/0Qr
         xGep3a/+SAceanT6OSL9f/nedTITml7j8wb50lWvTw9K1+aIa7+7gDVFQTUyZ8r5gW8M
         yaU4Nj7LouonbAaSJfLU1qf4goL56Z9VRudGV/LW7sNv84vYd/AnEkTAjIcy8vwGBrRv
         gWqqE6918c/19IjYR57FSsI2/tRNGLjMDsBOowhFwt4unmiSMpTJyBPkme/I4FsX5erR
         qtjA==
X-Forwarded-Encrypted: i=1; AJvYcCUdaVtZA9var9cxVKXGc8h5HFl11gX4AskPJwQSbGzw783nj+tResh8bP3tkz988uXnQnyInq4CDaK01JaSQbmy@lists.infradead.org
X-Gm-Message-State: AOJu0YzGfyWSM/pMVc1g0Tz5Di7h+yQBvJlN+OG36gx2tHfI2qX6aF+1
	Pab3XbIvYn+AQZsVOjKZWIFTYMpReJYF5cQk4L+5l62AZR1y7MBCgKNJ/m+fdAJW3CY=
X-Gm-Gg: ASbGncui73/tHZnW8M1uZ8jiA8TOO91Blek8GJv8L4wfYCdB0J3d+J7b+zaMz8Qv+yD
	TSJvlwGqHV1OsYRBP6aXsUIHH5g8kikVpasakD6Xy2909WvZY63uF4wnmS4i9LtL1B7I0PUQ65Q
	u/H6qSeaQTd9SdeqA8faptyW7lcy4zpHOfCNHD3bLdPKKarCnqOPuoajU9nYfHm2SxF6rl84Eni
	+Uq8U5nRcZr56MQmHDNloXsWy1DTdC1WmexhYNydzejGDTQB6not2IvriE393kY87OtQ89h4gtn
	2BEyovxPaQB/fiQ3qTvsr5XH2/csq8wTSxDnK5ImF5WLmiq4eDSSnoge9Sw0VtNCg+i91pLlW+A
	xlqBp4mt2+txbxn/uiX7bQ0BQMhbvvcVF
X-Google-Smtp-Source: AGHT+IGSKPwPkYLca5xt4DTsp41XrvIAXEH42/7GBMAHBHwSDsKU5tUb2elBTXwGWSigWuI5ixWpNw==
X-Received: by 2002:a17:907:72cb:b0:ad8:9909:20a3 with SMTP id a640c23a62f3a-ad8a1fcd782mr609032066b.43.1748522564992;
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed3dsm139572166b.12.2025.05.29.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
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
Subject: [PATCH v11 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 14:44:02 +0200
Message-ID: <20250529124412.26311-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054246_630382_2A288C93 
X-CRM114-Status: GOOD (  11.90  )
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


