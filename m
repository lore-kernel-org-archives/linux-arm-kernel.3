Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E09AD10DD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BR7917va66KYfi/dxTW86XB5ZaenGMbVA2IyXvz+JIw=; b=Ggnf82/vxB3gnZDp+/Wdfhlojl
	AqoX1WMw50L+UKUF5dfH9QyJ3OynvWmgFar5gk8pRsuH1raoC0+oRMKi4pfEnehSkg80NbdZpN1F2
	4vn2p3QeZKm+RLD2PMNbjCyoqVoS3YzPQ+uvvHilkvVct6S+rz+eQ8BCD555iJVeIyb4hBWX4w3/Q
	jkEKHHGg44DLWYtGPXifpWQn/a9xoYBWbEcSX4iXFyPEjtmDCgV+ujskY028U+QN4ycmJ7DiNkOkC
	eDQv1q3o7BwBVW5wFt2sebWtN77O9lw3+BlUcfDykjI7hTvLRkdDeEnK7hF6VqEAtzKeFq0T9D1Hw
	5+wZPmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Pu-00000005Vyz-3rfA;
	Mon, 02 Dec 2024 09:08:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Ou-00000005VrX-48wu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:07:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a736518eso50411415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733130447; x=1733735247; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BR7917va66KYfi/dxTW86XB5ZaenGMbVA2IyXvz+JIw=;
        b=xdjSVxoX6ZkmSEBtMNNoIK486TqHsKrsAPH3T0/Jo7uHf19f5Ju5WrOsDliaH3JR90
         Fc3nsSCjYsxy6KLhdVmjt8b2MGFIedxJqlfeWTDcORFSh0JdwbY6wGWVN/q+C4LSnBdJ
         kgqc92vN6B7Ow5MDCSaYPlhaEEuGlkF+qwUVP011AajCvUp0xQkuemwcmLuphnevbhMr
         5M1Ye+m+zZmr4XX8bBOEnY3uQAUXkjCmDZGT5cBlI9UtrPtahLYfPQvx2uCb7AzKY9rB
         cmgWYC8pQf1iYK/OV6FXQlS8c7URFY/GcZglOvkFxmn999aqMamzvnCZ6aaEW6qD0j8B
         RzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130447; x=1733735247;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BR7917va66KYfi/dxTW86XB5ZaenGMbVA2IyXvz+JIw=;
        b=VjKA727cCc9pB67kRmkCFLvbKZxMvnP2+DeJMAba5j2HyfDNOw0RCZEDNWlnyH2lMR
         7SZJuQUJ1BINjZy+QZ/24CfqjKhzuRHajGeBlV6AaaeTs7SMjeul8UB5iAdMfD+/KOzY
         gqcIFvKYsEOAb5RMjVvEWVmJ/vV4Had6K4Papm5DbJnFzvEzwRuKDvR8jflFBugnrp2P
         LKmOE8b4mH8BqzdSZ7tgjg9/YHTMCe4hJ+WqUVy8SXmVrJy2JkGfhFLlL52kB0uqF9mY
         tdxuYOjUIk8OQDIrDRw8gw6GnpP0dV0i29n0wTlaECox9YMRMqXQOPsk00d6yuHnQk/A
         S/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKEDNMTIEqqtfJI3GK7PjRPKQccw6BXGXLkmI4SCjIuPo2onCqAXW6gTocIZKduVH//GPyUxz2Es/7f7lBX4fA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ioSVKORHuLjTVFizDVcgk2mhT5SY/FFmoW3O43XkhMW6XrAD
	C75Azxeo58xmzxFrZjtfH1UvMw/F2Izw2ZyIRzhC3PREsHqxOcXg7FhT9kr4spg=
X-Gm-Gg: ASbGncsIHAp2z5BR/2WBrAGZdOoAJ8rW/cbhKQG5VAbaLfp9gwFdURz/nf6kf3S5hDZ
	5k+73O7ELOQU+oEY/LaDzNOU3EYc879gTEmGJtCkuXb+2NqtxSZK0o6F6CvuCaeWe2au3z0DoKY
	00GN8bxG7SqWV/V2OV3SXhCCivZD0DXduKby69K7w9BKih2I7mOI/jW3N2gHbZbYvEa7A5VVbu2
	/VnlRmUyAcusIvk6wZv/0+fCN7TEydK2/1Z6EqY+WGDhOS98cihnj4=
X-Google-Smtp-Source: AGHT+IErHtjKyBNSf/XUWvWl1AoW/h4AU63KtH1xNYUNQzmKxpbD3bUa+ZybCCBWlQeaV0PJJSm5wQ==
X-Received: by 2002:a05:6000:156e:b0:385:f062:c2d4 with SMTP id ffacd0b85a97d-385f062c49emr4402219f8f.37.1733130446807;
        Mon, 02 Dec 2024 01:07:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78120dsm175382645e9.24.2024.12.02.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:07:26 -0800 (PST)
Date: Mon, 2 Dec 2024 12:07:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <Z014ylYz_xrrgI4W@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_010729_085315_E5AFF62B 
X-CRM114-Status: GOOD (  11.63  )
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

Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.

Fixes: 945648019466 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
v2: Update the git hash for the Fixes tag because the tree was rebased I guess.

 drivers/pci/controller/pcie-rockchip-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 1064b7b06cef..34162ca14093 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -784,6 +784,7 @@ static int rockchip_pcie_ep_init_ob_mem(struct rockchip_pcie_ep *ep)
 						  SZ_1M);
 	if (!ep->irq_cpu_addr) {
 		dev_err(dev, "failed to reserve memory space for MSI\n");
+		err = -ENOMEM;
 		goto err_epc_mem_exit;
 	}
 
-- 
2.45.2


