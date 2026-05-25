Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1773CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owlSh2MmqvAnTYupb6o8O6jSpQ6Nv1/iuRHiC459FvE=; b=zt8qdwBA1R4xUh7ChKvj/qoQF6
	hcOyIOaIdfSyBP44G6YhALkXTafn05BsIvkgs9+7C2rPDyNRJ6J2seQEy/XOdrD6ZR22yP59F6TFd
	bSrSnYSSG/KfZa0jB927t8+CfU7FX9aQ83bPjCpJla+lEg5y8Gu5Vy6LQVKYiCIP9kk/Q1x050vVO
	Fm4SQiyS6A51UZZfmLOolDuymAeaAK4VFY/W63fmSrkACOi/R3rzMgUebMonOiHZ/6ssnrBovAYcT
	A0J/+Oa0KrDpWCVb4rd/ss9KoUrH4O4FeivfgZO4mAHAA4IM6eEO5nzpUWyHAev7vYypLRW9Em/Dt
	nzR1xQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHR-00000000FxQ-1ogR;
	Mon, 25 May 2026 18:44:01 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHN-00000000Fve-1glL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:43:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so8625404a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734636; x=1780339436; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=owlSh2MmqvAnTYupb6o8O6jSpQ6Nv1/iuRHiC459FvE=;
        b=G75f3p3HKsIT0rCqgMzgDq2Kw/Lv5hKiP6d+R0ucuXMxdxWdM9foqcJ8Vd1jkq0lvZ
         897GVdZ+yIv7gFX17O6higkmr4r2e5hJi+Va3l9MtmRyV7PXWnmanhLXox2p8/XhLWke
         xmYgV5SGzQu7CyhAw7VHxm+Me+uq6J/DoM7/qY7Qsn/s42zI2m1hz+oXUQDkuMR4Lhkh
         IHsJ2Cm4r4Yk/uX+UOCQ1kWqhtrO1T+m3Spc3W4f5vJDHFtHOOfMdKRTDFwQcbqSl0hL
         y/uCGW33TnThznQM/S/UoiIjwp0bEFyIRmi7wh9Sawo7qkgYn4jam+9oxmRuyGCfm0VT
         W/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734636; x=1780339436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owlSh2MmqvAnTYupb6o8O6jSpQ6Nv1/iuRHiC459FvE=;
        b=hUF+BZRNI5UHZp/PHdW/9H6O8UN/FS0Jf/pU3U6iCtXjfBRBZantDAwkNChk38cOZS
         dKogJI8PXEx4d/UBJbpCyxMDtC7SvGipiEtY6wjGOeBFXoK6A7ZA0prgu1iz8Wt6D107
         8ExHGVqbiOktzlvk9i+yO9x4GxJM91Xkb8kXClhJcF/HLrW/CdvWVjtdbhMqUKmAR26f
         UyhzbkeacRYfsKdAHWBfCeCuHDECUwCt1Z/PhGbxzK8hRAtUuD9Y6pCHTMw7iJ1BdJyY
         MNyuX+gJ3Lua8/FXgQfzR06U2xU3448uAL9osQMpgJ9vQ2d94O/LoVu8YF+XjvYAyUlw
         ZeFg==
X-Forwarded-Encrypted: i=1; AFNElJ/iDf4132Ixe5+G3Q+zK/idBHoJTbvGl3pwR2zkslOlSVr6JlzT/MPwKzX2KvJqylvgwUedDnLTTkog8sWg3SJ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01CY2+MTeNqM3ROOSYOhEaQeZL4eenoLKzxc+IUJO4SYbwiFz
	MHzNSPb5gDFDrtIvuE6QYClgTzXIfdb9WIyHtU744hCZ9VRZnnKSHyNhn6fO6pehq73UkciVqkU
	brw==
X-Received: from pjbos3.prod.google.com ([2002:a17:90b:1cc3:b0:366:4086:51a7])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b52:b0:369:7421:75cf
 with SMTP id 98e67ed59e1d1-36a67508574mr14714152a91.16.1779734635610; Mon, 25
 May 2026 11:43:55 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:44 +0000
In-Reply-To: <20260525184347.4059549-1-praan@google.com>
Mime-Version: 1.0
References: <20260525184347.4059549-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-3-praan@google.com>
Subject: [PATCH v4 2/5] PCI/ATS: Validate STU for VFs in pci_prepare_ats()
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
X-CRM114-CacheID: sfid-20260525_114357_441727_DA12BB25 
X-CRM114-Status: GOOD (  14.73  )
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
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index a5fa7745bce8..54319854bfd8 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -73,8 +73,13 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
 	if (ps < PCI_ATS_MIN_STU)
 		return -EINVAL;
 
-	if (dev->is_virtfn)
+	if (dev->is_virtfn) {
+		struct pci_dev *pdev = pci_physfn(dev);
+
+		if (pdev->ats_stu != ps)
+			return -EINVAL;
 		return 0;
+	}
 
 	dev->ats_stu = ps;
 	ctrl = PCI_ATS_CTRL_STU(dev->ats_stu - PCI_ATS_MIN_STU);
-- 
2.54.0.746.g67dd491aae-goog


