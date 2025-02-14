Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E98C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxVjaXboKEqmhgPS1SWexvRwQQsKkPF5XcZy4FqcIn4=; b=OXWisyFlPC0/9tBLa4iZy2xA3w
	ajFhU3MZnb+Pvcb+eJ7ve8RS8I070gPNQJNc1WGM670zLSpOJuFHAmchHd+KpVKKIcd7o1vGE3eYm
	wJes1cdAF+MsfB/SQXpXEZVX+kWNi5Sw3BLtwl7v1KDUkssvfhu6SSpnvRq18AxYCM3bnt1WvpZ4Q
	I8x53KDblNcdSSTqKUM3dJy0FjHXN+16SBToNhIwyg1DYFQ7g1kT4r462qBcjj+rKkBTzZQt3x/W1
	veL12U5+7Np3xia6xWci0zhR6J2bTnviGNfX7TNBbBPyNIlqDJSkIDR+tYFueSpSc468lwAYgRzbD
	oResxY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Sy-0000000Fsw0-2hVA;
	Fri, 14 Feb 2025 18:31:08 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfg-0000000FkZq-04u5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:13 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5fc447b03f2so622841eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554811; x=1740159611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxVjaXboKEqmhgPS1SWexvRwQQsKkPF5XcZy4FqcIn4=;
        b=OlTGEzNYS5GfPl87LEq4BP1qd2FkRBhMyN/pimBxY5lius4K4lQfGfMWZATC3MiLKZ
         HV47t7pCd1S1nmbgPWQbjtEX/k37fsATxRAToQYsC2VzfMumBtNi0oZNH18YS/gQJZwQ
         FG3WJ6qtkW2j49PPAt+JzRrclW/4J6mNGse6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554811; x=1740159611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxVjaXboKEqmhgPS1SWexvRwQQsKkPF5XcZy4FqcIn4=;
        b=cz9pZ8w0Gn1FleaiuWGyY05F7IN3JKCJQMk0RSb4fnZJx6OJK81OFcd0gyF9TipfF3
         jYs8ADshuHfV7jsctvnfUn9nJX9jUOmDbx3RoCnX7RpX3KUfQJij885kNlg13MG8UCr+
         Y9AM2SB8DvNg87kvYHW5XLHJfJ0azEt51F3R/Dxog1N0IUyAkw+EHy7ovIO6ZaA1ICwJ
         BfBO6R1CKJJqz+CKH8cJdvgbmSqjqANmpt0FjzG+uANWgK68Wt1X2aHRdT8jDOTMktFD
         nxhCq83OCfDVry0+0q8UdDpRggAtFOjC3bUzhmwbXKKkbd1BV/W4J31vD9xG+cgboPl8
         8w3w==
X-Forwarded-Encrypted: i=1; AJvYcCU4VrWtgsPoHtyk8+WNigsTPzlol5zUXFtz2apvnK85Y4ccAe/dfTZo41PANQCUrsEKdqisHkLE9qBvmSdzNZPR@lists.infradead.org
X-Gm-Message-State: AOJu0YyRfb2vkW95/m5VXAN8cFcLDc0Tl6CvYvPMwz25zGmpWyreMumT
	6uqK45pZZP7DIhO2dU0O7ZCT3M4g7rsdgTcRC41pP/A//mzxtF2/YJnq6bsSdQ==
X-Gm-Gg: ASbGncuzDolcZB8FSmWg2WowvQWWQ99ytBXWyKF6Yi4s8DdXQPKtyvqSxqtDN5IxgdP
	Rubh9llYr8XQb9Cb5D2UHVNbHoNWMhxBBHbDdoIcYo+fc2IxKEsVrc+fDr5ZCSjFyW1YhD8KNs1
	/VPtbJqwnQMby/zhSJe70E1rjh114/PQ0nGXFgT6IsayzTNlD+WQuKkcbW8tqov6qhhS46mGJuz
	IHkUZi9rhT/mwey1/YTfnCRwK5murpG0EXoJm379VK3gLskCkbR14A96MNE5U2PAzYLvkbEc6Ys
	C5piS7KhBqTSfJ6iIrqE4gUBIN1Q5072RFrctEyZWbfudANJ76CuN423eRVpTzUMGqBaGIY=
X-Google-Smtp-Source: AGHT+IH+XOVc8NTHW3k+78X5WYAnuU8kXspEfNlGrsjwFcY/02Yv6CZB+J3SozAcYaszP+QsOrsaFA==
X-Received: by 2002:a05:6820:1c90:b0:5fc:abe1:98a6 with SMTP id 006d021491bc7-5fcc54f758emr37937eaf.0.1739554809423;
        Fri, 14 Feb 2025 09:40:09 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:09 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/8] PCI: brcmstb: Fix potential premature regulator disabling
Date: Fri, 14 Feb 2025 12:39:33 -0500
Message-ID: <20250214173944.47506-6-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094012_056499_560FFBAD 
X-CRM114-Status: GOOD (  14.38  )
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

Our system for enabling and disabling regulators is designed to work only
on the port driver below the root complex.  The conditions to discriminate
for this case should be the same when we are adding or removing the bus.
Without this change the regulators may be disabled prematurely when a bus
further down the tree is removed.

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 56b49d3cae19..e1059e3365bd 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1440,7 +1440,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
 	struct subdev_regulators *sr = pcie->sr;
 	struct device *dev = &bus->dev;
 
-	if (!sr)
+	if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
 		return;
 
 	if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
-- 
2.43.0


