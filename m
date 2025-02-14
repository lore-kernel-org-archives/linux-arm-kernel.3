Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E96AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAlxapwLw5ouznsWC8StdUePnEcSqjOB1MsFoZtsKuc=; b=Nl1kP+OHv68OmXr5G5TZ5G3D8H
	P/GtxVgYlopvphbjnLRNzUyy4ay9ecgSQ4ysXcL6I+wfWihLuu7dHT9C+6susAzuqOsYCfeEc7zpq
	z4Tqqi09GwKcD0DHoUQLwwR/AkhKCvGhNvuHCqyg/K2X+7UvjoMx1ajopNob+T/bk6adgsg5/TOCv
	AlflGd4owhCNIUvRE7F9kAO70EFQPMGP3Mo+VTeTwtGVW+Qf8cobsJJ0rA/LB882aMXn3hdXomTU9
	QAHxLwrZyzIGiTwK1FQGogafRHiHJU6laEoafy4bExy76ehkew4M1pAxqKdEf80SNEqUIckhRhBtb
	wtj22Fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0XD-0000000Ftiq-31z0;
	Fri, 14 Feb 2025 18:35:31 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfq-0000000Fke6-3Bol
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:23 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5fa22d0b88fso1487042eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554822; x=1740159622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAlxapwLw5ouznsWC8StdUePnEcSqjOB1MsFoZtsKuc=;
        b=DX9KEIpHC6cMj5zPXZHBwnvGIuXunv1xkyjkqCwrRsalgLPAhY1+DiTXADp5uSZXsA
         tOF1ffwuNMJ+diIFkojO5S70IIg/RYuz8vSLECSnUrSqtJgRyxZYUsPnbYIVjaGraoKs
         qJXbia6sGWHxTqpXHXmmJVsL4KHrtt2qY8NoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554822; x=1740159622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAlxapwLw5ouznsWC8StdUePnEcSqjOB1MsFoZtsKuc=;
        b=LHh6ruBwan0tOrFMr6h/ZR5sS22ySr3sRiudr7okZif8R4Rl1r9lDigxDQioxqtYKi
         KnAJGbwA/bbaR0We1onHz/JsS3XtH97V7xU1k0DVUSAUFX7qly2PmQmZMxYouGkNmFkp
         yLfi1xXifvqpl1p9B3JHItaa/8mYflyQ0BQmdmEvEgBqRPMExVcObZWYoEmfNU22Ukd+
         bUiY4NY1yWTXz1taw7XGZUQr33rfz3b4XSMGxiTgjn8bCMTjzbtkjExZOaQUQ9CAVzUE
         eFn8aWZfhSkf/CUEElp1U03G6C/lUWQuxj20tYcnR+6r54kvYA/k8AkvvQX20h5cR3HK
         f/4g==
X-Forwarded-Encrypted: i=1; AJvYcCWZqJJAoXh1l1ElfvI0Bwn1voxl1zN6uwpYuyZq1/YQMKSEYB96cQN3T4Y/UEBST6C3NQjJ+fVcoXx+jHo+D5lE@lists.infradead.org
X-Gm-Message-State: AOJu0YzMN2Yjws6Ml055oHCZWOrqPJFt3fZomZnbS6Yl5TzEkmPa+fsK
	lWbWdZskktMuV5kGoClA55Acmgf9bfYFc8HeqyEeBwfNizR5n1l/p1qdusJ+ww==
X-Gm-Gg: ASbGncsU/3qBEoUT+JHuwEyWd0Vw6qBm7QY/K1aUisHedmsLo8IgwS2czKagmf/Hxdb
	zER8RjrrZ84PkZJ8BOJlSuQMCDkxYIIZU3xc7uZsZ9SGgT9zzsG7MnE0RUnu5BTTbqbc0FuvE07
	GPCa8mIPMN+U/RSi/QMimCTtGnYbxuJgDFS5czNruxPxlhg+SkLp04P5Yhlxd3T5oIcm3lR8bET
	ALo73KufNTAd2ClQ7ZG92kcscLKLmmD1PVJ1pwJhMz0giMS2j5LjUDW/J276OXUzoITW644ymwg
	e3Eo1daY9o7+QejRwy9NU3ELKjgh54M8jOTyqNBi756hyo5fj3HR7K97yZBJa/gwfpUT3Qk=
X-Google-Smtp-Source: AGHT+IF8Xjib64lmMqD097Fqb8iAnB8oVv8SuKUplvbq9RXROblxeeVuY5j8JISp/0552IXX4jSipA==
X-Received: by 2002:a4a:e68b:0:b0:5fc:a7d4:d788 with SMTP id 006d021491bc7-5fca7d4d8cdmr5224730eaf.7.1739554821727;
        Fri, 14 Feb 2025 09:40:21 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:20 -0800 (PST)
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
Subject: [PATCH v2 8/8] PCI: brcmstb: Clarify conversion of irq_domain_set_info() param
Date: Fri, 14 Feb 2025 12:39:36 -0500
Message-ID: <20250214173944.47506-9-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094022_791340_61B053C7 
X-CRM114-Status: GOOD (  13.16  )
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

Just make it clear to the reader that there is a conversion happening, in
this case from an int type to an irq_hw_number_t, an unsigned long int.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index cb897d4b2579..f790d5252e9f 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -559,7 +559,7 @@ static int brcm_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return hwirq;
 
 	for (i = 0; i < nr_irqs; i++)
-		irq_domain_set_info(domain, virq + i, hwirq + i,
+		irq_domain_set_info(domain, virq + i, (irq_hw_number_t)hwirq + i,
 				    &brcm_msi_bottom_irq_chip, domain->host_data,
 				    handle_edge_irq, NULL, NULL);
 	return 0;
-- 
2.43.0


