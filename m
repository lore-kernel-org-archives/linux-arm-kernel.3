Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF86C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBUD75Q3AziMcY5PYVnKHBZmS1CbPzVtDbztEvvN+00=; b=iFFQ4CEfFWlNrz+fSLJ/0fyeu3
	C9FDaxNaU/xhl7F1TfgUsq8gleeUOyJr7FJengBr6zgDkZOwgobei4bgJpvtx33rF4tRB9yIU4QTJ
	DIXE9iSicjeMJAdprnUvQCEkl9GuP+9oS3gU+Z2KFLvR9LYu403qD3Aff8DvSokUI2iqifwEV0kzT
	e4RBz18g9tZU9R6p36ZjeOMzgWZEV+wFOaUcB3AC5Rv3mUxqcGZdH95q75vNQ3K2T629zWgIGGA7X
	o/rsGeRA8W0X1xqWQkXy09Kb8CpmfrscrW44yEXvKttlTLaIQUs0Ya0MBnHcuAWFwR0dknkanIS9n
	nEy6jimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkwV-00000005LSg-0zVM;
	Mon, 09 Jun 2025 22:26:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOko0-00000005KhX-0j9O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 22:17:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22e09f57ed4so51918455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507443; x=1750112243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBUD75Q3AziMcY5PYVnKHBZmS1CbPzVtDbztEvvN+00=;
        b=RtRGtZ30jhcngSBSspeAGtUS5YyCI0TedTMEe0yuafv7fRWQxMY/TjMGysQE3564zS
         w0flzdvMPgsuuTwIwYiqvZeeg6m8mb+KS6VBSof6DsIpGiPSuTUnO836G8nqLzERprDO
         +6b1aJccn/YHCuPzEXbMJVJQKsQFzTlP1EpKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507443; x=1750112243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBUD75Q3AziMcY5PYVnKHBZmS1CbPzVtDbztEvvN+00=;
        b=O2miugP29ck9F6fYWH4IgxCFEnlSk35jd7KSAV36VQ0uZyzGX3hZ7Fa/mpxJGcDMpg
         cilpq+YE7MmOkeeIcOdW6GdQJQ9BWFfZa0FBTAWWqV8SphIiboAGqUASZpRuNXc1bgmO
         gEEz7HB4vCpJSunNpjWbO4rRPmB5XEdQajZWTbMAPaRhXuoBZ+iBVf+EChIp7GqkQvyF
         yWuUqa8VRY4Zex/Erxvj3cq0Vdw/vPnT/7mfE+8mX+F1JrahLts2ktVASXB3/VqLP3Da
         GmDHp1TNxPsud5+GWWEkLpZuqUUR0/MlKG7y1EF8yiw61OENb3Y1TWIlETcgwX5Vto/V
         p1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQa8Oqmfh6OanBFWluCYY85WsLsd8RIzzLs4SwVsOmV56ONZ2nrbrzcqhMf4UHJLs6R5xzf7incX1nrknVHQJ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwwQH+0E31EI3HZJUmrZERaoaPovDr2YZknh5XjO7Xad6LovoS/
	IF4dPYErbu+TMtamDCD2FOKxsC63ZXv8FlrMMoJJSy7uPGav0sX67gT/n0GoGmMh2A==
X-Gm-Gg: ASbGnctLeo72J7dgPufMiIwjUCKUt8oZrUk+fwhtuk9nj6WJADpVqvW2ygxlTmdGejs
	508dYMiGXBl8HZ2QsONTXEYXY8K7CQbUR6xFYNd7N9sfrSImtSG8SkL4ZwwQwaYUAmtlJmSVE6V
	fgXcFfZeyun3E8Sh5OW816Db/vxSjVBbgH7Xf0T4PN88DvEbnm1AiamUI/rq/7tnKRvD9eTTKxB
	dVgwmzeFoPRAgZlayuFkYm6g4In+WUIVFUeZs+fr7NVNDlXVFD/PpuenA5IiEMkE91SukLtUX8f
	aVlwDyS2ra4+7Z5BrRO6g1QUaqTtYHLYn0gkdn3MpD5xl9eKf2HcUQVS/BW9y0V4pU6kRlRmbQC
	IUAeYP6hMBAh3XheqJscHQaC1hNeCTGQp5MkfOfEHgA==
X-Google-Smtp-Source: AGHT+IE1FNMKtiTApYjphNha+o5VVMyg4NsmX0jAuwgOPEaUxUgCBJ815QhGkEUl1A7feIyNVDvKnQ==
X-Received: by 2002:a17:903:2f81:b0:221:751f:cfbe with SMTP id d9443c01a7336-23635c522f7mr16738715ad.19.1749507443428;
        Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] PCI: brcmstb: Refactor indication of SSC status
Date: Mon,  9 Jun 2025 18:17:05 -0400
Message-ID: <20250609221710.10315-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609221710.10315-1-james.quinlan@broadcom.com>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_151724_214372_B97882EE 
X-CRM114-Status: GOOD (  12.70  )
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

Instead of using a bool to track the Spread Spectrum Clocking (SSC), just
use a string constant since that will be the end result anyway.  The
motivation for this change is underscored by a subsequent commit that adds
Cable Modem SoCs to the driver.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 92887b394eb4..db7872cda960 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1320,8 +1320,8 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	void __iomem *base = pcie->base;
+	const char *ssc_str = "(!SSC)";
 	u16 nlw, cls, lnksta;
-	bool ssc_good = false;
 	int ret, i;
 
 	/* Limit the generation if specified */
@@ -1357,7 +1357,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
-			ssc_good = true;
+			ssc_str = "(SSC)";
 		else
 			dev_err(dev, "failed attempt to enter ssc mode\n");
 	}
@@ -1366,8 +1366,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
 	nlw = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 	dev_info(dev, "link up, %s x%u %s\n",
-		 pci_speed_string(pcie_link_speed[cls]), nlw,
-		 ssc_good ? "(SSC)" : "(!SSC)");
+		 pci_speed_string(pcie_link_speed[cls]), nlw, ssc_str);
 
 	return 0;
 }
-- 
2.43.0


