Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1OhefJlO7SddiDjet5+3aQQ9KCjHVV2cUEJthb1Tt4=; b=EKTptMCsYOUvs6qEBnXEeFWllv
	kjRUOyuojE4lIzyDN1CjDlmMk0oXB68Je1ch4+zD1q7bf98yKYXh5hdboK2V+KNb0lTagv8BH4BBW
	y7c3iLm5CWNITs3SPpldOM1d2gS0nq9VV1CLBUtT5nVqI6jzESJxZuez+qimHuLhjFbhQPy7ZxIwB
	2q8F5SxyFOd7er9yhmvIvCFhsU97YId3lGnMPD9qaRVVTwqg0MLn7em3a8uWf/J0g2fujJgbQez2i
	fEwvzDuw9SZOc3KAgMVagYYQMc6KjmCNyS3r5bnJSnyi2k2cDYKPC6AwqnSJiOA0xQcKP0byEgI26
	RY0u4DrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8Y-00000007Fce-1Vau;
	Fri, 29 May 2026 11:12:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8T-00000007Fat-2Q4P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf11699875so17026225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053137; x=1780657937; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1OhefJlO7SddiDjet5+3aQQ9KCjHVV2cUEJthb1Tt4=;
        b=kuygsDoQZcq8Z2LrYd/3IkwQzbTKI89Jg7EDGcoAdZ2QxtSAbNj+xrsJcGU1ASHXvS
         KNP99pgNjqzVCeW6NnCWaow5o0vngHlybdgDTTCuB0KKUOS5KNg5im+K4sqUuDBTkuSI
         +q+77hV2HZUdYzAC3A+pkb2OLc/ivaRVvkxXt5wZQteMrbrgGCQsw/QGELxkAcz3fdJu
         8hq1q1kuNibJT0o0zXSfeQ+xVeVJ/JFGw8li+PG8RLMGWYeszGO/HyCqsxPj2mdBR6sA
         STXwfBKkK7YGeiw0DyWuLNRwf9sZdlExCLwieM+XpI62wYWj1wgGmztxeRoHphTxqiRY
         sMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053137; x=1780657937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1OhefJlO7SddiDjet5+3aQQ9KCjHVV2cUEJthb1Tt4=;
        b=pgnHw3ttif6f6zUprrNxnW6pdTAgIhC5dqrZ9brYNb3bk9Z+oUNRB8gyWDrvwPzBBw
         5PqNDrDAj4sSazCnJBbV+ZxLDFvTFfyTSL94H08bSH1QpO0vQlLTY4iYZNVfzyJh78xq
         CxUdxD5VutIls7L9sEh2jC1p1E0Sbl3g7EtpzkUU82/ZE3tGY5cUXZ+KGyrRkI4PIagw
         0aURUDC+SsudYOeo0QV4JT0Yw2bV94jTQm+z0RAMQnE2hsRt6aAxJpl3xP/YbWNaqLhT
         cqMaX71wKBomCiYsvhxr0FCTpFQT4utEZpIXx11Juiz1GvL8VGvB7V5z3O2gdotAkV2N
         ySvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fZmbbIDn6f1+MnZfQadP8MR1MypumnC89d5YOTYs/DGJZ5MQzbgFOM4a5Ht8ABRaAyVSnSLHkUYAo7etUCC5w@lists.infradead.org
X-Gm-Message-State: AOJu0YxIXcRN6yZHdgVZQch9tMt59pBD1HL2uRu++7cWZCRB6bm0cJfC
	8FiK+2Kw2omPbyMZah3KEzw4HZrhsByD7zWqW27ClQV+9HwTKhpvTcLw3cjEF4s25JuTHd7nuri
	Y6Q==
X-Received: from ploe7.prod.google.com ([2002:a17:903:2407:b0:2bf:a0d:a7e8])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cc:b0:2ba:838b:bfae
 with SMTP id d9443c01a7336-2bf20dfae24mr24843145ad.18.1780053136322; Fri, 29
 May 2026 04:12:16 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:04 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-3-praan@google.com>
Subject: [PATCH v6 2/6] PCI/ATS: Validate STU for VFs in pci_prepare_ats()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041217_622819_A021A981 
X-CRM114-Status: GOOD (  14.42  )
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

While every PCI Function that implements ATS has an independent ATS
Extended Capability structure with a Read/Write Smallest Translation
Unit (STU) field, the kernel manages SR-IOV ATS by requiring the IOMMU
driver to configure the STU on the Physical Function (PF) before any
any Virtual Functions (VFs) are created.

Currently, pci_prepare_ats() bails out early for VFs, assuming that the
PF has already been correctly prepared. However, this creates a potential
mismatch if a VF is subsequently prepared with a different page shift.

Update pci_prepare_ats() to validate that the requested page shift (ps)
matches the STU already configured in the associated PF. This ensures
early detection of incompatible configurations and maintains the kernel's
policy of consistent STU sizing across all functions associated with a
given SMMU.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 679a3c3c1d54..9cb23780093d 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -73,8 +73,12 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
 	if (ps < PCI_ATS_MIN_STU)
 		return -EINVAL;
 
-	if (dev->is_virtfn)
+	if (dev->is_virtfn) {
+		if (pci_physfn(dev)->ats_stu != ps)
+			return -EINVAL;
+
 		return 0;
+	}
 
 	dev->ats_stu = ps;
 	ctrl = PCI_ATS_CTRL_STU(dev->ats_stu - PCI_ATS_MIN_STU);
-- 
2.54.0.823.g6e5bcc1fc9-goog


