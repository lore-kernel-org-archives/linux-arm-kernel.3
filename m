Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1696CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=; b=qaFFISfDAEQc9pwwNsXBKEUjbT
	neWDK6BO8ys5x8j8GRbAGhu1f03mriLY8g+LAttz9w4q+GGLKccqk3OdkGwbfRXczoGG0BWPu3IGW
	KIPlk3Gmgg7FsiC9BAFOszw/igCa982uW8ijb6eQc93b3jan4UxlUTMffzCwo9PBK0kdG6rVQG7SX
	1oOGxtnxgHCuEckjS477hQRLeYqEf5+25wF0Jt9tcqjcSGyGUCm4E6t7P2nreedjkQRNf+SeOeJuJ
	CGAl09Z+ancg10JReE2tMiUxHYmp7Z5oe3YB9efP3SGOpPS1qfekrBv57LhdMTO7ZB/utvhCc4vHY
	c7svBaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXld7-00000009zZE-3tso;
	Thu, 11 Jun 2026 20:03:57 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXld4-00000009zXY-1LdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:03:56 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9155183b42cso39525285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208233; x=1781813033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=;
        b=lhtjE0wc9AhWOYk9zXUrKhb9Q/B0QOViR0NtsyHwT5cRxzk62OrODmZvAarWwNt9RA
         SnfPXDQMghLp2dGOusnSrXFihkyeim0Lw6Z4gtjFF04ta9WlJ9fULzamcUUPRP9hS3xl
         6a9WNDhHwlOELj17BRkdULubLcI2pMs7plEdgjaQrwtUxGL/cOoONR363iMYuoGExBos
         rmmNcQtJ4Bm+bx3owr2Yqh4DCSp4gPCS7lJIWCq8nKJi50JUbkIlMrnHTAifjpFuKGvT
         ez38b8g/eLHUHhpEJZlEjYe2qUfNa34HHJHLMQBOe8E3ptIFMSFknjuZAFpStLausVLu
         E2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208233; x=1781813033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=;
        b=ENb8DohhzZtVcvMtvSaLxAmOXALUztSr9GKRcxIDA2d6Cd0VLOHbrPEq7G7MBUJ3G6
         C4lS1315dPBVd5RR7tvs8yceLGzGHnZakr4JHvO+2OPHXiG1vtRKP1+dvpGwGUDudOuk
         QLxB1HtwGCffRPszY6FsyKUCAqAhbGh1HPG6mEALk+Dpd6VNK1vfXFyUA21UWgibsiSA
         qpJos9cMXbboKmNracSIrWJgbqkYT4kXmEs6OEsKRi8pU3X7bB3Z/wQ7mIk9wRTtioOS
         ZUGFXVDUyd0aJ/4+VoKh5UctpgpmPA5PpygZoVzdfpLpBCdF6yxDt9yqRo+1yuKxUpUp
         xiIg==
X-Forwarded-Encrypted: i=1; AFNElJ/lV3tzZ3WwM3MQTJ3MOc3R8JESElcxPLsXvP5EqqHHi/3ZX8yUx/g8W32tT54iAz+TWj+I/S5FWW3xrMfrXM8I@lists.infradead.org
X-Gm-Message-State: AOJu0YyLB2D0gLjkPPjyHRWrGpBn+p65ufWep5hHhBDpN2Y/Et72Az1V
	+IVC13TCPSuypKdWlxW7EXCLlp45JnguGOTZHxSUXXAujzF9pRXCYCzK
X-Gm-Gg: Acq92OHQp0lxU0QOw6nmQZDzC876HzRDBGKa3yHYZXn39gFZ88z/6Br8ph0Xpl105VO
	Dac4gMteRx6QC8wXwQvqSMztWSx0x09ttzl9M12Wv8eDWlS2xFEfwfCilAM1bCRW7bkyEatVobF
	3MwXpzF6pr6ptoNeAJifyifNwORh+D75F3WXJdFvPNumF/aH6QTkzwsIr0YF+eD9r+xFXSsiZo1
	kucaSZGoPdGBl03j/gwh6sIQL54xkqircgcEr46xReJ44AuIqh6nCTZ1lYQaoKflUIefeUhhqFg
	qbAd7xbReUzi35GfR+XkkNmjmNn+o2Ar8meSCy+wGqhWOCHtb81uB/VExe3FSmARyB7rWpgFgDI
	Tz7+HTTwxSn3+e8bLSOs1Kjs19AvHTdtvTdNDMVyTz/JL6XMCVJsgxKxPVQqOGNlzmfy32P3l3A
	yFQotLU4ia
X-Received: by 2002:a05:620a:288d:b0:916:5f5:de22 with SMTP id af79cd13be357-91619dfb646mr39598985a.12.1781208232857;
        Thu, 11 Jun 2026 13:03:52 -0700 (PDT)
Received: from geday ([2804:7f2:800b:f09::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7215sm11571185a.7.2026.06.11.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:03:52 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:03:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH v6 2/3] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
Message-ID: <fa9ed4fc6d4531a9216473151ddaebdb70398c20.1781207474.git.geraldogabriel@gmail.com>
References: <cover.1781207474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781207474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_130354_366967_D82AA282 
X-CRM114-Status: GOOD (  11.99  )
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

Drop the 5.0 GT/s Link Speed retraining from Rockchip PCIe Root
Complex Mode Operation, so called host driver.

The reason is that Shawn Lin from Rockchip has reiterated that there
may be danger of "catastrophic failure" in using their PCIe with
5.0GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db3..1374a2c92b563 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -328,26 +328,6 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		goto err_power_off_phy;
 	}
 
-	if (rockchip->link_gen == 2) {
-		/*
-		 * Enable retrain for gen2. This should be configured only after
-		 * gen1 finished.
-		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status &= ~PCI_EXP_LNKCTL2_TLS;
-		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-
-		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
-					 status, PCIE_LINK_IS_GEN2(status), 20,
-					 500 * USEC_PER_MSEC);
-		if (err)
-			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
-	}
-
 	/* Check the final link width from negotiated lane counter from MGMT */
 	status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
 	status = 0x1 << ((status & PCIE_CORE_PL_CONF_LANE_MASK) >>
-- 
2.54.0


