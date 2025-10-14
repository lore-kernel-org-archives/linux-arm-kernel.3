Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC7CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpDUom30mVihFUe1ZHKp2VNngPZC0EmXCJHb+H0vcDc=; b=dSl6ZbmaKq/1X5exb/RJ1zIjUp
	qEt9H7k+Hy5hk1Mw89i9C/nYlawmc1e/2HMnCHrtOWxhJXLzRwRXr41wIWAcvVyqD+ROUSfte5xcn
	0XUTdGWSnP7r9ZHXqhgoLgRUbLHYIDc93I47cUNTzeLhzhjLclBUrpq3Z1QcvSp37ZrO/rGKvu8xh
	QByVHS9vnGsP8iBmJOSWLC6WNOx5sdv0cNenVj+kq45aHSuhSGfc3ruF1FYexgERq9b1+qQplc2Ge
	Y5r3lVpVdFHGpSvMXSviIrP0ULA6wt8jhCa6a099wTqxmPoxMWy/RtxOIM3rYUWtff0WO21JrRnoY
	gowqsyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dH6-0000000G6zz-2TlZ;
	Tue, 14 Oct 2025 11:33:04 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dH4-0000000G6yc-0Vf9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:33:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3073042b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441581; x=1761046381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpDUom30mVihFUe1ZHKp2VNngPZC0EmXCJHb+H0vcDc=;
        b=LWt0HYAmjcPO/JhWr0oOQ7FWt7ODY82oFRUCJcaIDjjzpLlH7JCIXAfhM+NYXavvTf
         UOfRE5cmK9KwkN4tDwm3XSgN4yw+CFlPcWShiIFcrq1ER+1r8Z8WTYUvuM9iTMjUU+Oy
         U6ZRnAz7sMj0znKhhIw+032WwGcFf2lRmLfpD1amIi4sJFwQT7/lMg6JriIJl9kEGN9F
         OE/lQV4H48DEfytjLggSS/2trsvZSvakiZnwrNdU2nwpavcl3M2/dEKecNE4YeWTTWSK
         s2Tp60TLVqQkv42w5ySLbCPhxzSTUo+5gDIdpJBUO6GrG9QWBzIrdiMf6B5fPcXI/1sA
         wwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441581; x=1761046381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpDUom30mVihFUe1ZHKp2VNngPZC0EmXCJHb+H0vcDc=;
        b=LDR8RQlYojhl6fY4PZzRou3RYoEp8s/x8tRqfmFMTM6BRcmtPDSYcrbW66oEDgDNsz
         zjA8Z3cBGOg1weD7Rb5xQGWhZL3L30YvLq8vE22mOGaonmxJ7SY3exlGSg3lhiQESdmN
         uq2g9LSslOJys1ZvLaXJDWlss+LN12zIz4aoXe3kgxXk1WEO2MK02BjP76h5ptTI3lM5
         3GkVR5RvvgluMVvXZOUjtxW1wcShe1f5rF0EHITlKYEJMJ79aYs17cfBx4yuskzw25Me
         NYTJrtrYw1bfEvoBh+ddm+pOiwU8g73vuLNCfkOJqqxIFGQjQ3vot6J9gl4RmkLQlzgP
         DIEA==
X-Forwarded-Encrypted: i=1; AJvYcCXnohvldR9Yday3/StjaZDqqKSVrFKu2Gh0MEw/amVDrmTpzK5OQVo4n9EaQiaOQ7oQ8TJ7jro6XSET04OO2pgE@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnx3QFbLFxMPjr3JakjUc8aCwbK0iRlUrAql89Yn1hjHRdDZb
	gHkUEN98PVCs54JkdY74L4eFL5g08ZVI5t2Ci7P/S3f0KQ/PYOhrgB/x
X-Gm-Gg: ASbGncuggBYjU4/1bmrtZXLUhqh5mWnTpMjTtL85YJvU19Z21gPXN+EmznEDzpm9trJ
	YKeNT2e4VlRaqn+WJHt7c2IujrYnKnTVdwU//vPl8J0Tb1KtOIGwApjr/AJTdYkJaelSw4zw0pR
	xKwSesYv6xK0UpqMGWRsxfp616TYsSQszGr4eoCzxrPA/OgwOPRIwRWMxPDomENuGWFbHKD9d1o
	WmeC6w6LJzrgkw6FIiCGcEbowB1wMuAhWeClHH48Rkb3mo45u0/j7XBR7LRJeoWlsyFwBZ+z8qW
	J86VPsFIcxnYsy125aBggl9pkoFQnmtkP2PsGigHFbAe3BOy32TDsVrwomsA2WLppJV5kjFSwxg
	Cs+ExiCOmNzwi2/GkevG7dQSo4k3iP+jkSryqarscu+pGiYwBhA==
X-Google-Smtp-Source: AGHT+IFVLpe1YlyoBz6ibhhreG6Fl3FbCAxKdtEs4SmjRs5bXwF82T38vjadMP9BpiSOiF7uDxR7XA==
X-Received: by 2002:a05:6a00:1705:b0:78c:97fa:6170 with SMTP id d2e1a72fcca58-79387242e1amr34246206b3a.17.1760441581102;
        Tue, 14 Oct 2025 04:33:01 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:33:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 3/3] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Tue, 14 Oct 2025 17:02:29 +0530
Message-ID: <20251014113234.44418-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014113234.44418-1-linux.amoon@gmail.com>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043302_375547_9104FC56 
X-CRM114-Status: GOOD (  17.02  )
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

Change removes the unnecessary local gpiod variable and assigns the result
of the devm_gpiod_get_optional() call directly to pcie->reset_gpio.
This makes the code more concise and readable without changing the
behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: Add Rb - Siddharth
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index ed8e182f0772..bd8fda0baba8 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -477,7 +477,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct j721e_pcie *pcie;
 	struct cdns_pcie_rc *rc = NULL;
 	struct cdns_pcie_ep *ep = NULL;
-	struct gpio_desc *gpiod;
 	void __iomem *base;
 	u32 num_lanes;
 	u32 mode;
@@ -589,12 +588,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
+		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(pcie->reset_gpio)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
+					    "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
-		pcie->reset_gpio = gpiod;
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
@@ -615,9 +614,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * This shall ensure that the power and the reference clock
 		 * are stable.
 		 */
-		if (gpiod) {
+		if (pcie->reset_gpio) {
 			msleep(PCIE_T_PVPERL_MS);
-			gpiod_set_value_cansleep(gpiod, 1);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-- 
2.50.1


