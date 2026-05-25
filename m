Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A89CCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U//oE56krJ8X0dzRdJlpBkAz8D7rzP/0SvFlnQu6n1U=; b=mNYCq9cn2Q8Zv1/yTmPhsh21Gv
	pzZz4MLnGRlnEJ0C2v6kQURbPbJh6NITfilsaj2nI4iTZ1Kb2KsNfKnZzGzyzygrJ2Qd8WM0GTsfl
	qx8Qr6TVVm/tNr96Hy1aNyofa2Qc5MKI2MQKRAKVCs8KQ376KEGd4gU/jpNUmRZqx8UqHhHSxAmD+
	J/1Q6A+Q8WCHQwTZK8NOTGIPPUgs0tpyG52uyMtHeZGB1fy4I69a87CqSI7lKXvVdpRHauwcSUj+0
	wpc3kqGP73zHh51NACDTaNRdgKpNaM/mEHiMgwlXnNpV8tREu2pV5jcDkydERwVjNvdJaMur80xn2
	qrfiDwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHR-00000000FxB-1SgL;
	Mon, 25 May 2026 18:44:01 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHK-00000000Fuj-3gci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:43:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36603ad6709so8267675a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734633; x=1780339433; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U//oE56krJ8X0dzRdJlpBkAz8D7rzP/0SvFlnQu6n1U=;
        b=on6DGHFRxvqbxdXBt6m0EP92NwkAc0srGPhTuVPe2X6xdurePricIToV85sQ3CE+PQ
         GSoZWiR5nNFn4BVaYfhLbsTR7yi/J+pWzVXcHkN1TKQbYX5p2ldLb5sGADzAonxtCvkZ
         TInQiLnX4f0vJHQ7xfA7N5e/yATC60/Vx3oGlEd4Uj0TmI8U0/G6/mjhexbpPNQlggBW
         4AFVVzTQX8y63CAU9pIuY3Md6yZ300WUORp/T+iXnX2hJmKLjVClRB/9wP+fHSu3opBK
         rn8ltBFp9Ap51RBAhvVQHK+vt+OOTbmZYfJ0EShl+JEhv8+wGVkwLpRTY/7uJ7JeFxbf
         fF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734633; x=1780339433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U//oE56krJ8X0dzRdJlpBkAz8D7rzP/0SvFlnQu6n1U=;
        b=gJcsJVa4ayUf0fDmjJOEm/mxmNrkRgBGFPcIbRHhZfW3uO04wsL4GF+nREp5837n1m
         44rmPne7HccEiB5WIRT32Ww8CiVal3ysv5zxd+fHms5gLwZpjyKDGBWwf0bw9Ku84/dJ
         oK8s5CiUzwE4xr6md29WiOmxyonJF2gZpNJmWNkfZG/bzqtCgC7YsA/vPgcNtbJg/1XS
         GBZOZlUhq673UsfBsBC7v+weqblT0KQBQiJXcRGbqJiBCfXvTKnfEGFnrWr3REvlkqem
         IxIyF1rBm+5onE/MDq/9V9hbxQKzIbwGLTWv2RueieaYlDb97xGFMqGlJmPCErEl5J5R
         SQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/QbAe++vfjsj5maU6Fy+UsAkpDhIBdw8K/MtG/soXabO5TofFjJfYsfcIWLxhKmjckPUZgdqkv7uwWd7rR+GbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aw9H2pZigDieNzNGCOdWqE21wk4aWBQlI9AAmjcxfuBfdxd9
	kM7WEitd9mz4rLEHuqYgRh7LD1tZISAjQmsgntgt6TzDx8ogYNHxQ/ScWq5LX4uOpl/kHBYghHQ
	V/w==
X-Received: from pjob1.prod.google.com ([2002:a17:90a:8c81:b0:369:c5f0:e8f6])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57c8:b0:36a:f612:e695
 with SMTP id 98e67ed59e1d1-36af612e947mr2150738a91.17.1779734632985; Mon, 25
 May 2026 11:43:52 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:43 +0000
In-Reply-To: <20260525184347.4059549-1-praan@google.com>
Mime-Version: 1.0
References: <20260525184347.4059549-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-2-praan@google.com>
Subject: [PATCH v4 1/5] PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
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
X-CRM114-CacheID: sfid-20260525_114354_917837_B9232784 
X-CRM114-Status: GOOD (  11.89  )
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

Update pci_ats_supported() to additionally check the associated PF's
status when called on a VF. This ensures that PF-level quirks and
untrusted status are correctly propagated to VFs, providing a robust
support check that aligns with the kernel's PF-centric ATS configuration
model and is immune to the timing of VF-specific fixups.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index ec6c8dbdc5e9..a5fa7745bce8 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -40,10 +40,13 @@ void pci_ats_init(struct pci_dev *dev)
  */
 bool pci_ats_supported(struct pci_dev *dev)
 {
-	if (!dev->ats_cap)
+	if (!dev->ats_cap || dev->untrusted)
 		return false;
 
-	return (dev->untrusted == 0);
+	if (dev->is_virtfn)
+		return pci_ats_supported(pci_physfn(dev));
+
+	return true;
 }
 EXPORT_SYMBOL_GPL(pci_ats_supported);
 
-- 
2.54.0.746.g67dd491aae-goog


