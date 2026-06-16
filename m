Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBCDCD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=; b=Njfj5C7YKXJCs0JTVaKiEs9Iey
	ETOoZRw4grli6SaxrnnoViHoUoYr02Soyo3v9dy+27uDvca+ytR4F8rMF9HgfwtauOxjViMHFkN8N
	c2vtBo1QN6NrkrGcoVwjgJWqGxF4yC/t+wlLut3my45pON8xtINRZkLoWf6FaCfYkQcQ1KZVyfW3X
	0lsD9SUOyOvbaYr+Idk9DnJtlv7vedv0M9eyS7B0hvZHopO3ZlOSME5rml7h+r6DXfvadfRjSLBvb
	/AUVnOY5ED6JeKD0bK9OjR08FaJwJz+v3Hzr0+nPpfdnv5uTsUvZX+WyrU+4OT0cg0VMctemo2Z3l
	C/iHnMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVfn-0000000G0fu-1ZTG;
	Tue, 16 Jun 2026 15:25:55 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVfk-0000000G0e2-2jOk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:25:54 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3566eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623552; x=1782228352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=;
        b=shvXAFIFGzNp1bFOHqb2odGhEJs0Dv8nTnkmu5e8K/mn9YR8TYaHIEvGhAA9i2CU3Y
         khTohXG913yZNrkW4vxVBpMf7yQ6NOUjEp+1EskzLlU1SCSjy7JVt3T4LRtj718UBVwx
         HFbEkdMMg5zEz2xZG/r6lvOUoXsXMRLT3S4KHAgzBjt8nX6sBo/Wh6rZm9spevOdJ5Yc
         OSWhwfPDBFvYotVqrDXSEFRyCqCz2tYNvdDJwKhFkR+iNEWSaiRogjcYY1eHiYbE2yZ5
         feg6pApcNKOiUOL24Qkd08pymWyQsKcbEZIni28T93+Uu3fWglaLqbVZzSv2cuoEtnHV
         7C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623552; x=1782228352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OIfDLIkJhbaUkdh0HltZEozEAObCZ7mgl0RsbHOTNY=;
        b=WyIUrUIj6eaaf79ksV4DZSEY0w/WJB7wFNcQ4fpv4EFW52xz8op1TTm/8Km3Un5Ah6
         MWC1eBr1+oUbQOAa5m9ZGhz2YjgMENZTYW1SP60HppySlA/xJ6FzsO0j1/0igsunGWn0
         EKvDBtpjRwEDV/HxRJaoJJeuHa3vCE8c8jUM6jbQs98qG+QyguP/NSeS5pndVKLSM6NW
         ZJVQerZhtVliagJDubBOCMIZwPnwqctciOFTr6SyHYhLodV1QFwqb4uvmg4GZj0eu9RW
         NyPjTU5x6ZGXUMr7QVAyZog0ru2YQjBXbuIHx9tXw3h602NxMVfA7enFuJoSF9dhFnzb
         FaHw==
X-Forwarded-Encrypted: i=1; AFNElJ9yagz02X5f/PlvTKH8mWq9X7vDhQJsQQNeCyK2rfT87DYdWDOK5mXtPru23SVjuN3zN/rhC3fSWCRfFu8mINDd@lists.infradead.org
X-Gm-Message-State: AOJu0YwNG1c/5rZJZCG/wyDPcgIoLiSXqCXoq0Nb8JbHiAFbJdo/AVjx
	17k6Iq39m7GyFI9NR8Fke7Q25wdo6wbLcxbLTgM3btX8CKvZyW6cEvVU
X-Gm-Gg: Acq92OFrjriyHYBNWy1ekpsiY9Y8WVxbJvyXECbcCo+pGAH/orEcPR8xezaa46xj98K
	4Iw46dCzqnz2SD9RvI/CKRpczXIqWis/C92o4hlQKrq3c0l4x+R/LdZ01aLnV4XBEYUhl444UpB
	NuV9GyoQqRSJCWtWYXr4ki4TyHDXJAb9yxKgIn0D6ceTl1mNp+K1BWqme5omsY/uyFcTlPjaNFt
	RewlDXktKSgKontYtUVfKNjW3PXuT3Ifuo8L7GlfVCJ27+CAfU+UjGOVY+3FbeEkHoL8sOxgj+N
	s8g2vd86jYJxHzaZYW8DkNEl089gmUV9LvOnx94HvvNfqHi/JtWz8HJGp9M665TugBgu+W/6dYb
	lGNigvIdsQa07Yar92AEdpBsqMNWyyjhPik1suHfo++2uq1kBIGV4wWDLANP32sHlY/3P5ctPAa
	1czpHwbe1AXG4I2jPMnTFj
X-Received: by 2002:a05:7300:6c15:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-30ba5fcc635mr2325529eec.30.1781623551532;
        Tue, 16 Jun 2026 08:25:51 -0700 (PDT)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm1525643eec.22.2026.06.16.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:25:51 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:25:45 -0300
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
Subject: [PATCH v7 2/3] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
Message-ID: <68f6353e3a2ea4914de36c42b6906e41282adad3.1781622998.git.geraldogabriel@gmail.com>
References: <cover.1781622998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_082552_697520_A7F2B066 
X-CRM114-Status: GOOD (  12.51  )
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


