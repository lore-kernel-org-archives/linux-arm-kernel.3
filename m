Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D94C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=; b=5EUTTP4PSBgRIhsIcx+Nz+lnKX
	N4zXgKUuU5y1mhsUmPESCu0LM6Sy79vp34fSCFlhPFBFUJ38YIsXaB30JMLzRZGc1SN3kZVOx6OOT
	d4j/FnXpLSQaVeP/Fzlo/P/S3yQ8VD96TLUX0J0YKzOad32m6jArJxkznOgXXqNdzK+2sNQl/HD8h
	qn0jmxTJuHCcbVG29T9qkxa/XB0XmpV7oFZDx9fJ1AzfKQGRdr06H++zNX2dYL3Fgnceeti/ftdjh
	/iO7U0L+oz8zk/AOPAfwjnejBDs09ht0qxeTc08nNi5/0HuE7qxXRR004M4cKZkyIQqgiM+AV+NJQ
	cUw0o47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnRf-0000000Gwct-0VaY;
	Sat, 21 Jun 2025 01:55:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnLR-0000000Gvyc-17lX;
	Sat, 21 Jun 2025 01:48:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235ef62066eso31743755ad.3;
        Fri, 20 Jun 2025 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470516; x=1751075316; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=YipKJjYUGd5dSDpdfDIakdxv22gnvuAExq9W6QmiFM9FmvpwNfrZ16iQH2++jBvbL3
         n5EB3Zl/rlxs6sHDW2t5JI/KR+vu9ND5LDc0mMIFYo46nYZ8qzVO+8Ong/2fpWLyRk8n
         66B4/o3CRooEq2fRv4XCrLWZ7grQlV7cWQ51fXc+JZOBVV2oawNUVHTorugP3aziYqQK
         t9fXDsmZAvcx9N9NGrXoTtjKsPTP+1maJXU4CDhLDwKU6zhu8wi3T0AhuP8GKI89q3hr
         8AEUrd0E+TUOta5gMZRjHgRAjWm4P3JRsbWbHXbU/A3EagmcGj3xmatXDxzch6PDMd7T
         JI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470516; x=1751075316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=MFUTUQBUPUl5lY8COQE56HXQYdREcXWUgwc68NksB0H85O2UtxBTnnYqObwNFQRF5n
         fmCgLHdOyktuWdw6lAIhJUAf0BfU4SU+VNiuvmv1aYUxw8pXgq3J9RUtBc+W9MXOYKQq
         W2tCyJ+3ozx7rCBtexjsE37nhZECizGIdmgE35RtX/h0LRglInbgoSuQeVX8O1GdwxiV
         VZsxBxeZpMCloOZS2ecJTvdV0MCyn0M9b8i/N6ywBLfxRHuUF0ZUBLsFgpOJZ68OAakz
         n3HgeG9nZ7raQB5J9DgE4FdwY8SAdh5TiDYPH/1LTKYL9W56wfEMrjYFvryF6hdbGRzn
         x+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUKvhWqVCPuPoq8rHYxJpDUHodJov0s+N0XQwV4i0hXPVzaV6EOvm3cdzz4nJ/7X87RjOSM+9vJEUJdqtptncpB@lists.infradead.org, AJvYcCXnwbAcmBz2eTwfCivyjlAVl4yUt9dvU0/lZE48aDA4bjfjFT7VeTZgf1Tp3nM84bxEHZnz9hVXnM4Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf0XBzkMoQ/ZxAcM1Kuy+geSBQvS68IcBoxxhuKnRygk9prxJk
	AQA8+mELrXrfMRFVZQ2NeRgpYhSK1a9IvtMA1j+5l6tEhfGvp3DJTweRn+lkK69X
X-Gm-Gg: ASbGncvovnDbhuDmDByB47N8LOmWgbpva2eT6J/GUMQ4kd8nJSPhyp/VGCTJO7PfnqD
	3nTcinbFcjyfHJMvnVV0nS/dBTbUZKWiAkrfzz+O6J5Ci6StzNNEdA7bJbwRq9jNkQOj7183xmZ
	anXH8ax1SoUHkSL00V8RjCUfKazNylA0wuz8/yZC0KLNPJjzSg+CIdGOIAd2y+O32Rhj5to4DmG
	6SNtYgoIhGBfv8khUBiQyxOvRy+oBkZu9FRIhOO0gVXL+5XY01+q0qO8IC3q2QAwb01RNi3BbNM
	yUdChI4a323N6fpKw/AQX4K9GGkVSGtU3D9ktD2EMOMBlAYhL1C+oLCi8n8G
X-Google-Smtp-Source: AGHT+IGm/Jggfckdj6HI8cIvmve7CSJ/pB5QUFvBniX73YqNMzADesGHqX4F1bRZCdJ5ROCygqCy0g==
X-Received: by 2002:a17:903:1c6:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-237d9852f68mr72238635ad.27.1750470516535;
        Fri, 20 Jun 2025 18:48:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d1c8::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8398dcbsm28491955ad.48.2025.06.20.18.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:48:36 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:48:30 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 2/4] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <0afa6bc47b7f50e2e81b0b47d51c66feb0fb565f.1750470187.git.geraldogabriel@gmail.com>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750470187.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_184837_308568_83495832 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Current code may fail 5.0GT/s retraining if Target Link Speed is set to
2.5 GT/s in Link Control and Status Register 2. Set it to 5.0 GT/s
accordingly.

Tested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 65653218b9ab..25890f6c0e17 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		status &= ~PCI_EXP_LNKCTL2_TLS;
+		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);	
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-- 
2.49.0


