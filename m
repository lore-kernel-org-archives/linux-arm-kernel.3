Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF14CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6562tSqUW4FPLuBReRttsQP9VRgygDGjnIRvKk2fg8=; b=XribnlDYtAb1I1FUzBa99PUwJH
	AY/S24CRVFfc9rlsjNUrIl02ojddVPrNM1law6cVjmCxPfHJKGVdBkC4+AnT7ltxYNld2etzYuE6U
	NOVsoGcDsiGx6kFv71WvZxkjJOOwPa2LIdgDTmHtduF9mM4gcf5zNI/iR50H+diMTFH5TX2OJe5NG
	NDXXpfwXZleNUpuWq+HDw24qsCVCSIwgvv1s2lrolNcABiZvffGpsP5H/C2uk8LZmqT0SK8iG+GS2
	IAFJZD7p3hO6FRWcNuGwZlLvJn0jtrFJR9HhUS2H9HKGUzSx+O4qGwJGZtuVFCVjzw5Yu672nMLNL
	BQaDT57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGv-00000006KtP-0sPH;
	Thu, 28 May 2026 20:24:05 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGr-00000006Krg-3Bez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:02 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c8279604464so16049210a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999840; x=1780604640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6562tSqUW4FPLuBReRttsQP9VRgygDGjnIRvKk2fg8=;
        b=d7n9vUsXzPgJP2EJrsCDUa1d1bAZcBeN9fVf2ey80j3iF6LNevrF2XrPq6n0mWeMtr
         hLgCdD2vrFWkBzzbaLUqk9Jc/SIGqn6E9Q2z9PLxFGKNlpDK91ADniELfV4SsZXw6PVM
         KieSsQ8vDOt2i4OElHdTZdpNo/jNC1KPkRb+LfH8XjRb/MCpI5sqVUWfYjcOrMXuFae0
         FXgUY0Mn60j9bJDoJJPMNWaInRnqJbbeLqyNhQllxxWO6Fw8CLb4QyREqq9yFPxojTqc
         giPxSTEef70SzNrez2TD9cnefXLA3VBgGZHZ9hfhU7P9T/35qPVuG1s9Rn1QbTWGLFa+
         Is7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999840; x=1780604640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6562tSqUW4FPLuBReRttsQP9VRgygDGjnIRvKk2fg8=;
        b=kSTDQ7UHseQlApuXAntFDxELtbGrEX5CRLNGorrpeAN2H+N8YYj9vlfeNv4pbgBSIS
         kQAN2oPJTwzqv1IZCCuSjwvFd41psdBfkfqLnTzd9X1GzdV76iwyfOZA/HxOaAheW1cL
         C/mZfW/yDQzUz4ZnHQsoyH9exJcKwvhjfPDGZ6WTFnXJTek4kGMg2/Ddm/fh2nR6v22z
         Zj3/DOGK6H2o+SqQAS+DSP5lQ9LfJd7Wj/93KE9gyCXVPE585Dqt9KPAk/BZ6MITI4xc
         zpSzgxXAbngF1tKPUujghPrgnum56V2eEveSn/wxPWcSDdVqcaHvRH2dQT0muBquyMgb
         LIIA==
X-Forwarded-Encrypted: i=1; AFNElJ/TL+lF+vSlcYH0HNg08aO6XcESUtU9ase+PJAsXERJuUiJ+GcuSZtJ3oUGMerXliIaZcQFr1UDE49XqP2H2f7x@lists.infradead.org
X-Gm-Message-State: AOJu0YyPm3w83qP/PM6X4EuD9LVBuryB2Wiilp70vv+15AV5xIUnNnpI
	GIztzJrOIPyl07MvS8GGyG15Cea1mW5y8eDRyvbKVbKj3EE22mwnHhL8NILu+OG9uJRsnVfiEvS
	fJw==
X-Received: from pgk38.prod.google.com ([2002:a63:a26:0:b0:c76:9c2d:449b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:648f:b0:3ab:18cd:7da3
 with SMTP id adf61e73a8af0-3b40e2c7eddmr314116637.1.1779999840003; Thu, 28
 May 2026 13:24:00 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:48 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-3-praan@google.com>
Subject: [PATCH v5 2/7] PCI/ATS: Validate STU for VFs in pci_prepare_ats()
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
X-CRM114-CacheID: sfid-20260528_132401_800140_2C08B799 
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
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 679a3c3c1d54..8057c24b0469 100644
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
2.54.0.823.g6e5bcc1fc9-goog


