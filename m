Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5974BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K3SR5rYqhar5HSluEhYKtptLhpVhd2aXLVfmSOkbzz8=; b=BjBQrgCcI2BtUZGduYKVQFu2mB
	eIgiWyxkuMJ9HiFsBovP050UUOanmk0TU3VsUspCRCh4EXptJdKKDXtjB0FNNGWS0FIb1HmDOaevN
	U+liLUHjINXmdGTAxb3/GMmb8HBo7XIRSr0PNAc6RM3nGFzqwgN1RKPI83xQN/M/De4aLFnO25UWA
	l3qOr0xoSUFpojMiBmEBuDVqflnZLt5XhKZHqwan55KHYNYjO1jteTx0NSwVN8vCzz6hYNLGGbAj+
	uZIx5bC7GQcSE8cGTpWAvfghEQDqduSdijh5uafahGnLyS2xGNdlwW1tAEe4fh1ulkLD8o5iaoK7E
	spr1mR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkxI-00000004OU8-3278;
	Wed, 05 Feb 2025 19:21:00 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpS-00000004MnS-0lnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:55 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f9c97af32eso51479a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782773; x=1739387573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K3SR5rYqhar5HSluEhYKtptLhpVhd2aXLVfmSOkbzz8=;
        b=avS+nV7mqJOor+pDcarXhlGwlwDbdwy6oHyCszYgEWK4TJzqiaYLVoGCfnDkR001oD
         DNS5I2YjDr7p0wzHFJxSkZb2jVmBCIwDvt+tZA3B6nyoUPPnwDnC3fW1il8hrFvYng/7
         ePsMTDesZyPQAFSyWDxKNZLHihKCd9EOzR0VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782773; x=1739387573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3SR5rYqhar5HSluEhYKtptLhpVhd2aXLVfmSOkbzz8=;
        b=sut+P09B8zbUOQKnhevjuSnDkVy9CE6jfn/HuGlu4EebBY5vzzgcQk4fCXjLa4kOpz
         2kqQgE0wjbQn0IfBGVdxNONDE8nK7tWg1f0Rxa96XvhzR8N26U6HLxvIXs5S0jlHhvbE
         1Wyk9yCbpMTiE7lIii0j+S1hRSONVIKEaYvixK7+nPEU1PRQTxbEle0rnF2mgAf4m41+
         xcFKkYdPRL1wUeYrui472p5L9AMWoqkWXiM3yTAFl8Og1/YvvOfttppr9Ev6+z0vJldP
         3pXR8eyubzXT6Ro57HHJgg4tX10gS/ZSGoOAARKNFFAig60CNTHjHgQu8K1fugqn3iNr
         zjiA==
X-Forwarded-Encrypted: i=1; AJvYcCV4SigQ+oiIjyZwsFct2zMbPFuntuP7Ect8dQoyBjgCT8N698h/MS+iV1Yb0+fmEWZhAg7uG+ICRe6Gq2AuDw/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzXcFgw2WIPxILdkTV8Ztg1TYKm1mU2MW1FLsojtU7uNNrJh1+8
	ipePD15Gw4k07/Cm1JHBn1aQ9bUkz8yX34CHsdOlb67pMa+1BmMU4GTLiJzG+w==
X-Gm-Gg: ASbGncvBwxmF5iNRgQ29eAP6eDgGW1QIrLpVSQEZ7Wk4SWVNjLlOI1rVPW2aiQbVmSy
	LBYJ1m5aAxHuCq55bl5k2uTafe3a7PA/hVP9q2BcYJ/JGvhfba9UplftZhJeZ8gUdKb9zX0ldWq
	TjB4LYVzuVzEE/at+wI81FWDrBFNz5E0iE62FnXLSXhUlM75Gt4AH46ezpTzWqG5CCf5UBmNsg8
	BV/2Z+TY/oQjjR+y3AhY3GEuVwey//KidPPJm73bJvCInXkwWdcs6vQJzdfUgKqG74l/54AgSCd
	gz4o52bAebxN9r5h+81Xdp+i+FVAWLMDd9Lry9dYDZkFri8K6hl/mK9fPrtkmWVvbNHsJqY=
X-Google-Smtp-Source: AGHT+IGXI/zeQKWdy9WGXNP0IFCmaXexbux+MNSbbXKXHNOnb9/pDSTNXOi7k9q65haUFvvYkJLYBA==
X-Received: by 2002:a05:6a00:9095:b0:72a:8f07:2bf2 with SMTP id d2e1a72fcca58-73035117eabmr6665165b3a.9.1738782743623;
        Wed, 05 Feb 2025 11:12:23 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:23 -0800 (PST)
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
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v1 0/6] PCI: brcmstb: Misc small tweaks and fixes
Date: Wed,  5 Feb 2025 14:12:00 -0500
Message-ID: <20250205191213.29202-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111254_223421_CEACA7C1 
X-CRM114-Status: UNSURE (   7.46  )
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

Six small fixes and improvements for the driver.  This may be applied
before or after Stan's V5 [1] on pci-next (they should not conflict).

[1] https://lore.kernel.org/linux-pci/20250127113251.b2tqacoalcjrtcap@localhost.localdomain/T/#rfe31466507e3e540ad681278924e0ae4e0b8a727

Jim Quinlan (6):
  PCI: brcmstb: Refactor max speed limit functionality
  PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
  PCI: brcmstb: Fix potential premature regluator disabling
  PCI: brcmstb: Use same constant table for config space access
  PCI: brcmstb: Make two changes in MDIO register fields
  PCI: brcmstb: Cast an int variable to an irq_hw_number_t

 drivers/pci/controller/pcie-brcmstb.c | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)


base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
prerequisite-patch-id: 17728ad3425bcbd72e06271f2537a5aeec9ec0f2
prerequisite-patch-id: fab98130bbf5ffc881704b02153e387aa4a08e87
prerequisite-patch-id: 0d2d8d02821ca742aed46f16e9ed60db2ead359d
prerequisite-patch-id: 8cddbbc69bd26c0284784d29f5abcc30db1c8327
prerequisite-patch-id: b5d9165e3627079a44c08faaa306c17ef735fc9f
prerequisite-patch-id: 95858e79f69b693a7955cf12549ff1ce8df27699
prerequisite-patch-id: cc66e7df1fc7acef4ce10f99033a39359b6d57ab
prerequisite-patch-id: af00ddbf164acf1742020616d8c0f05cbd5c1fa0
prerequisite-patch-id: e37b800216e856a32ec7e7231d5191f17026ebc9
prerequisite-patch-id: edeed902cf9a962e3431132dacbd95781b1cf970
prerequisite-patch-id: da4f731901ffc44f2f1a3e69c1c35213d531fcae
-- 
2.43.0


