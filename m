Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F72C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=; b=tXXf/cwtHGU9nb1EwuO9PZ/Poz
	2oq8G8lw6qWSmre1lwITHDzpyOBHfzu48wMtYP/Myw3lWd1+Gog+Z8JMSzfXUPOz06PC1mT/QyAm2
	yMSRbGNTIrSi96MmMYxqPOiFXwygBUpZkzAJ93pPkKq1HO9gcdROV9/A0kpIFJI3qDzqNvdN9Fx5T
	9Qoa0ddRVDW6K71yPaUNE8vtr63+42wdimgjSVWHcP9tJwT3HI6qbRt2yUyZ24uF1c0YAunx0MCIJ
	H+Qbt9iLPxJ9UzqvbuvZzAXzi20tCQWJXtU/gwKkndY1s6DHAHMLmFGxdI8bU5R5yZ2geCcknSfxV
	qAKw6Few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMcv-00000003YcG-02FK;
	Mon, 30 Jun 2025 22:05:25 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMRv-00000003XAZ-3RYj;
	Mon, 30 Jun 2025 21:54:04 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a752944794so57606261cf.3;
        Mon, 30 Jun 2025 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751320443; x=1751925243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=fWuTmKo5YdZBKNzKDCCDklpvqEbRdzFLTY3JjcOtruS+6ZjEfGbUMXeu3Fa59wJap1
         jCPJLbKmr2NuJNhdN6sGqAPAfQ/CSzJUB63sw2yzQPK9bA8XAxNiFTts+0vFW9C9Vwc+
         of0C1VdTH5PULsFnhJ5TqsB/Rjqr8e6n6jel/xsdcHMR8XUAFJpCN9Mu7LPSGOwORbNk
         5wYku6dkj1S1c5JLa/yBs4faTBFZKyZoLzH3K89Si/j06g/PQLTVQrFiweGrXjiDmhP6
         KQ5nk2zHax8p0lbFxnLz2cjZt3qcETyKHHILSpdafxkg7SKl0DCQAvHIgAb+m33yTKuP
         oSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320443; x=1751925243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=J1MUtvZZ+FGN8FsjYpjR/g53qqplqaIo5kqENBJDMwSL5OcWGgXMpbHHqOm+GFcPKD
         F7h0Ir9QBuNc7LNPH8my1DDCzCdVByjuNwr/CeEAiv7RLftqCwwK8HZrjDC8C8D2nTTH
         ZPjnMiwtxHCEsqK3efo77vctUgzxo1yrgCIOc3zrHqbuMcSGzhVfMyeQY9vAbVJ74j2z
         oUgRLSjfT2IAuJrusM/3qJkjacYIEPT0KQoWDC4/MUbz90OWbB10Rx0S32c27a5L/w8L
         Bnxiz+kBVCNT9Ol/pOG7llI8FYnILZKkSUL8gCkoIKuxK2vLj9nzCkMvMM18S4CwWgLZ
         hl7w==
X-Forwarded-Encrypted: i=1; AJvYcCVhW9coUIluOvU3yNM12+aUl/NTCeMCFoDVUNe/iAn21w3CM37SJ73ujfH7I/GBqqudliXhaRYmkjPNGTtOmjI0@lists.infradead.org, AJvYcCWjgeXD6fpnIQbQo0YPNbTOtfOls9xRbcX3npiykXlDSalbGgAeLCd543Czi/Z08e/CIp4mduCQrftk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1V/cIvVrLb/HQMtyJN8/pPTAKESUGPDxnn0dNs5iRketSHi9A
	la6cHU/vNsbgA4SuUYCegQbfjJEC4ji1lvebZM4SFrOm6IM5f9xdySqv4o3gJ/9i
X-Gm-Gg: ASbGncv62U8j8EC85NvA5A9aJRElkJGUVG+HRaSsfO4Eb5CnRmxWpkLBbHn9k2mCeXj
	otBC84tzFKeWQ1E/sV/Zg3k7mmFSdlWLjoQ+7TrBNpUyOnbqd7hPNs7AjjVV1DLnuRMilLvn0Jt
	5wVhcr2UGswq9GVV8Cszf+toa8W7pAXHZvxFOLtb3+FdkUuY4Qiib/it2YyHoGY/UptZCmQpL70
	Lka0XT6k29GR9jnjtKsgf4GYONRy77vIxGS/1ujDQVUMnlc+jTMk8yKH2NFNNNEObLRMiE4Y1sR
	XcekDHZd9WDase50Yqu5MGwT7J7cJTR4mOXzqXXdfpSd4eE/ww==
X-Google-Smtp-Source: AGHT+IEl8a6dIg9zoMy4z5faHvrY/Wge5nU0Ym4b/IhHk8USZly6BJFNwucTpW4cMCnQ1wqi4jpzDQ==
X-Received: by 2002:a05:622a:2d5:b0:4a4:30a0:39c0 with SMTP id d75a77b69052e-4a7fcab1a7fmr246749051cf.28.1751320442648;
        Mon, 30 Jun 2025 14:54:02 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a81b8ea2a4sm21766721cf.75.2025.06.30.14.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:54:02 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:53:55 -0300
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] PCI: rockchip: Set Target Link Speed before retraining
Message-ID: <0afa6bc47b7f50e2e81b0b47d51c66feb0fb565f.1751320056.git.geraldogabriel@gmail.com>
References: <cover.1751320056.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751320056.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_145403_851367_F4ED1A92 
X-CRM114-Status: UNSURE (   9.80  )
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


