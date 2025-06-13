Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D7DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZG2gbmHCn23d73eIBj2Su1Pr4mdTTmU2U/OMW+hTCg=; b=0tqKXrRYf97KARtZZoyP+TS5gf
	nRx8/UrIMeHMHB2st7jP2J8XN1ujRsGqommWKKag9BWE5Lic/xq9gY9xOlHzwjG0uk6U+NNaBUPfZ
	YH9ul8Skfk2i5ZmHwklq68lP/ym13OS6Moxh46EK4Q8DgCEwRUtw1jKsXcBlI4mw1lBp4ZR7KaaJi
	8bYjto2gKznFEkpDhaSK5IhIhLHRfIOOsILIljwf55JFSDD2Vg3t37Bp66TkgumXUNAYSesH6eqRE
	/8rFdUbAqcHFFBFC9Vq71JslOFgRQqDzjZPct1FSMBolel4OBw4lG3IhLfyvvjGSiqBahHKrgjT1i
	ILsqaOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ90Z-0000000HIk4-0RYt;
	Fri, 13 Jun 2025 18:20:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7ol-0000000H8JP-240t;
	Fri, 13 Jun 2025 17:03:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2351227b098so20403685ad.2;
        Fri, 13 Jun 2025 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749834231; x=1750439031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZG2gbmHCn23d73eIBj2Su1Pr4mdTTmU2U/OMW+hTCg=;
        b=ZmTYc4xlnehjZMSy0Rpl22r2kf6m7j3qpJteUcjmO+OVtcET86ixjrmr1G7RNzd5J5
         VlWCk2NFEPPn3GGxYzUXvUS4Y9K2mFxGyX4Su31le5MfFLRl+dwxGki5VmLdWQADGX9c
         5iQVR9KJaBXS/0cYC20+ZomeKP4bqx0eBB8pJdHFvAvqKzfD+46GZIJsgrzNeZbh9nBz
         6DCARUeUq6j/eptBAhg1WihUVLhL4nKNY5sABPQ6MtRiE+3MlJOSz9y+blTDNWAGjBJ3
         tcqGwRvGeqq2YqbKeVYbNpLewW3qINLF/XnuOYJXyN5a1xQdA1nDqQSx7YLFV6AHUcwk
         YYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834231; x=1750439031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZG2gbmHCn23d73eIBj2Su1Pr4mdTTmU2U/OMW+hTCg=;
        b=dyrfJvBeURiO6OZlXsaesGsDvHb0CWyMymOdE6Rr4kNk/hxmJO1PpeCRbqHj8baesg
         piQevLNnwmnM0O1zwFyKWhW/YLCEcDSC03wfyI5GECKmM0HuNgWOyX3rHi5WFuKXNJS7
         6hzZrAo2dp9gljfPIqjnZxxclPHCHxFTOMArfKQEX6evRTe33IaSZ+RyKbdN9PWMIx1o
         ZG/HN7ijIFZfPAbqAIVIrxlot+vDIo6ZdJDdI82ZPNI2+2MhxB4mzeVd65fSAQwlwcxp
         WDFLxjUl4IBPoT5o8j/Q5uQsgsS/qjQqSGbj6eATL99FlDX6wi9aFRaR+wFcvr3aPFIL
         zRuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7N8F+cOFeBgyS3XHiUMJhkQMn0+QSpep58b7j5Oi3jrhlTShkqqZspxVaHHa6wswM0GUgQIyNa/aW7K3G14bu@lists.infradead.org, AJvYcCXNqtWlxp3aQ9/pqGQbBIYpe8xa13HohLqeTawHbJwbvEgsQzF18G/ddFu7c8ymtpBIza7n6Qdq+cAu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3EQFuKE7f3kRZOqoVAegUTPyYtxW6JD+t7mBaF3S7viNtuiNQ
	g8FO6PrGU6Y73a0fUVHtLYDPIYdnUt28iJJkuCxMFlfXj18ueXVm2egiLt14S7Zv
X-Gm-Gg: ASbGnctGmJ/HHxHNx3wf5Wab+SIipFPEEfCvh638VMF/g0xELHBg7GywejSm+1AAI9N
	EgKhWl2fjloJSys1yLG4cbJp7MhUurBwHewVV5SIvF7akq60mMMrNvZKIY5KgxQ3K6QnW277Wp3
	zIfaDSMVvBdy9fWQRHDWlY+1lFK+BYtEARwmbRUtAIDQY16A0gy9ibGHkkfb/ELHtLHH2ismIKq
	rL7TFx/FLDqIAki/pDdKgEpo5Py+431zbKnYWpXpilvDxWPK0cHv3pL7IMrqhtRvSzvnbjmXx/r
	o21BqPfI90A0GzNeIS5PUNSIgJ13GWfNMz+KsZT7IK0x6NWpmw==
X-Google-Smtp-Source: AGHT+IFLJ9bCor1c2WHJ7wrTZBUINfNRlAF5VdRV17WHMRfQOATSlzvrkpLZD8EH22C2Gl67bbMhkA==
X-Received: by 2002:a17:902:f683:b0:232:59b:58fe with SMTP id d9443c01a7336-2366b3169f9mr3651525ad.1.1749834230599;
        Fri, 13 Jun 2025 10:03:50 -0700 (PDT)
Received: from geday ([2804:7f2:800b:8497::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb54desm16813665ad.179.2025.06.13.10.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:03:50 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:03:44 -0300
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
Subject: [RFC PATCH v5 2/4] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <1966f8ddc4a81426b4f1f48c22bea9b4a6e6297c.1749833987.git.geraldogabriel@gmail.com>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749833986.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100351_532633_E7089CB0 
X-CRM114-Status: GOOD (  10.04  )
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

Current code may fail Gen2 retraining if Target Link Speed
is set to 2.5 GT/s in Link Control and Status Register 2.
Set it to 5.0 GT/s accordingly.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 8489d51e01ca..467e3fc377f7 100644
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
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
-- 
2.49.0


