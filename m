Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A1C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0ZTsssVvHzsc0e1DxaZAFNaCnLOP9m4uEkLrLv90vI=; b=iGBYl3iIQaj338/XSXs4xP1qSK
	8a5SUe91jTUUhMo9/jpLOVDhjT3wQuqnahGdbp/i5IGJKNFghyhTmCF6qrz9GHUURsc/pePv8GyYg
	0oS6napORtEdvjrCOwbrlDZY5O6e08FWbtKGPfE2VXxNGx83axVqImNbggRNHJaamofaPm0lgW5Zz
	KLmIfJnvzGSTkDvap1gkep76jjvDuhtB1f4dmYfFw09LkswVLKUQbbHciyFnExh/elmko9n+N/aoL
	YHOGlE7Hwr5PDugGamszwfTcmNjK26BoIEqMClUJ3t3m3+NVkdjQpcY25YUkFE2GH8wK+bJGErYcb
	9SxzOVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkvx-00000004OM0-0Aby;
	Wed, 05 Feb 2025 19:19:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpH-00000004Mk5-3UpG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f05693a27so2266785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782763; x=1739387563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0ZTsssVvHzsc0e1DxaZAFNaCnLOP9m4uEkLrLv90vI=;
        b=Nium8749FyqfIvcQ/6bcbVkuWPd+W+Ay4VkQOaGQrxCxmHFMWKMQixCXZGuM3db2ds
         6U2m0I3uyC4t/un+r+kl8plgl0IoDmwtwpodYF+alZnJG2Kd3jMYtZ04G1BkPWx+gYHr
         7kgdxXO9mlwKZSc5+BGtPNpzZOdgbfyIds3z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782763; x=1739387563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0ZTsssVvHzsc0e1DxaZAFNaCnLOP9m4uEkLrLv90vI=;
        b=sIlci0+DqiWJ8omZZPmMts4Sb6JqYIC87Vb+HcDA0RX2qtgNIpfF+CaaC9NxnMYqWA
         TcmBZ/uj+hRZJmu8lWw3/+By1IHWoBLEKifqjgnN9Kz+dn5xml8Smr4VTgpcTifmy17I
         7ZlbYdUx4gn6dD7FW48dW7Ex6nVWxYg8dUCV9TcUVxyKtvbCKsDIHjFIBWEvZXTeIiD1
         FiMKT9eIpXE94lN1ow4b30IsI+SpxEmNzBHVWEEGFAgTIwWCygeQ3n3r0hETzfhh8Cjt
         8v8VMkJvleR9oGbysS5AzBJKYxBwMfppor5a4frHtJJp5LgUz3RRZQmTYDDAFb54tdi5
         tpvw==
X-Forwarded-Encrypted: i=1; AJvYcCWt2PB2KxtCr2WD5oj3qmwD/LIKEZxoEzEk5sfLZkKWz9BbQv4KA/fjNRkrbfPDKwsWkySFOHnWvM5glH0N2Cfp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx112HZErF4g+90iEA90meffEa/PoINeLx1lTkjxtTKALl9yOEC
	rpmDIFMV8ICZaQDsXTE7l/woXVrpMqNex/A3BVYGzfW0g/KjSZnC6qfhpdyByA==
X-Gm-Gg: ASbGncvP1kgQz66twYvqxzPUkb7OcX/347vTqdPqxADfIgIc3IkezVPaP0kSYil5EGt
	Eawkr4nJYv7POp7CBqzDA97uT79O0U0F6ZMqdERNvwrnOD5HNntoDOdBbiD1bFwUh1qMSXrRhf5
	RxneAKlWDjESutrIazn0CplPnYCCUfOAjKBa2zGoEv/XhvWUlV9Kr+A/bJZ8a0UdwJ0FH9IAHBB
	7Bs2nJRJk2qMpUrah655gEoFhMtqGvbd6XiSbzipFyDs51fq5cTVSc1oYUHhj+Om+Kxzkq9I+8v
	trFW8TyqZLdki7lBs/VRD9W8IlRRqPZizFr9xrkHGjtN8jqChS5c2yjyj1koSN/ytu5Jr/E=
X-Google-Smtp-Source: AGHT+IEXcZFzv42qZ8TJ/klgDwqqS/+A00tWNgeMvaWCk7kbJI8shXduYKzokviPveKCUA311SJ4wA==
X-Received: by 2002:a05:6a00:851:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73035224858mr7975973b3a.24.1738782762954;
        Wed, 05 Feb 2025 11:12:42 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:42 -0800 (PST)
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
Subject: [PATCH v1 6/6] PCI: brcmstb: Cast an int variable to an irq_hw_number_t
Date: Wed,  5 Feb 2025 14:12:06 -0500
Message-ID: <20250205191213.29202-7-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111243_912067_516DC57B 
X-CRM114-Status: GOOD (  13.32  )
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

Just make it clear to the reader that there is a conversion happening,
in this case from an int type to an irq_hw_number_t, an unsigned long int.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index da7b10036948..1e24e7fc895c 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -560,7 +560,7 @@ static int brcm_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return hwirq;
 
 	for (i = 0; i < nr_irqs; i++)
-		irq_domain_set_info(domain, virq + i, hwirq + i,
+		irq_domain_set_info(domain, virq + i, (irq_hw_number_t)hwirq + i,
 				    &brcm_msi_bottom_irq_chip, domain->host_data,
 				    handle_edge_irq, NULL, NULL);
 	return 0;
-- 
2.43.0


