Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A430C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pamITFUcwnp5TeeHCBPmUcU036kd5Sty9zaNaR/GKjI=; b=pRQ9MIpVII99UScaAJuFLtgEZX
	4nJuw1RQEOrjwEAO765+YqbXDtpxc4btcVhuctSQI/Y6z2HXrvVS0pc8LOrUZzITmDsBZA19F+wVY
	bdNnYDAC2Ve5/E1U3CBTjLtG4IgRXhyEjH0eLUw7T1ynzJsSsb091PCBzkXQuuEjEnaLW04BQbsWD
	LoI1tCtciflABog7fVQ+L5TGjiu0Q0OjD1Grtu5wJoc0aWSfNUwhWPi7Usv1Ci0SJAGxoJkDLw/rO
	IqKydua1TwhZ9oD6Fq2xiCpodhyxDFcey2T3XPROWoomeRP+Xj/BpjQtsCe2XkCBGbRD21DmrmWqk
	DrKwLdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmt-00000002GJy-1BEu;
	Tue, 29 Sep 2026 03:45:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmr-00000002GII-20LA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pamITFUcwnp5TeeHCBPmUcU036kd5Sty9zaNaR/GKjI=; b=t6uPnIaR3HtwG425nnydGE8kL9
	GTGmcbQ97Uhom7qKEZf+bXenFi+SdLsZY2P6OoWX3bT/KWhm8dmRnC5rQ9kcx4DUpuH3wx9W/DrWG
	KcwE6Gk6WuU9zaChkYMf50uVa5/ZAINOS6OdK5Fuo883v0bzgfMl/4kvS1gD2uFCQwfpBZ1p6546/
	+ZDW1bcIB5K5Fi9AN00FUqiY+FAwjy+0yX+pfejK6L2MxwsOa8bDmtEToTutATLGhE3OHN55dVLnA
	5y0yzTaO4cNJBTJbm16kx1Lz+3CAO5pDaVt4MCfCSMvq1kwBU09/Et1dxU/geO0lFrW6Vb5k2Q40n
	7HDdogBA==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmo-0000000AYW5-3Fku
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:48 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso1901448a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653544; x=1791258344; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pamITFUcwnp5TeeHCBPmUcU036kd5Sty9zaNaR/GKjI=;
        b=fI+j/h4pf1IrCjb56ukqmUVYvvmCqO22M6TbuP4ktyLF1z9asNQdXVwIxcy9ybENwY
         lqDMqJssjMpRNk3IhP3s8+vM8yUa8mXLvdcpWLJAQ3b+fOrcBxBZ9bOZlxC6sfXcwXgI
         VvJR0GyttDiNqoQr47DbnKYPVVjtMclmMy4fOtxg68JZZ2QSqQWDpSqpHZldsya5yfGw
         Oqjv5ZSV+puz7sJ2eHi5INtgT/VCf3TMP3UAzWaeUeO0TGb0t1fmfogQTW/hCE0CU7wy
         Gyt8ME33ABJHKRqdkoOpDo44VI2Ow9Wm9PBngqu0v/CPhL0RzOvP5DZPwpsKVQPYd59p
         M1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653544; x=1791258344;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pamITFUcwnp5TeeHCBPmUcU036kd5Sty9zaNaR/GKjI=;
        b=F8jWLPNSo/v2tsIP3i+HIGtuxGLZ9urTm4QyP5jFGBoh9mDw9/DplpGzD+yBOp+NL4
         DV2vVNN/AMBxHKM/9vYtxl6Flx0CpDHLx3s/rsJwMSOniCpJmLPnUkS5WJ7g2hgXiO1/
         HeVhYH6iylBHrsCuOaXE2PAl3aEcLVk+YnJYIpoY5cXj3KdGBwE6DqRkqQsg5iyQNjrN
         SpCoOdRyrU3mjPQ63j5anhdErBj4e08kfqjglthjbkoBPbIIO8aSVD7ZIwWLYmClsWuj
         2swe7D8HUzLdm5KXs2CR7byaR9ybl6pmT+FXkyaa0VgwaDBSpN1uNBkvywgfd787seIX
         uO3w==
X-Forwarded-Encrypted: i=1; AKwUvBzjUTnrRchOhYTBOKdX7Y30100tYdj9tMv2UBaWFDgwFa2belBCjpbl9NupRAEAAao7mfeNXCJd/t24DTrBX6xX@lists.infradead.org
X-Gm-Message-State: AFuF++mV6UhnS3etf4i3ORe+LeMa6nhpJs2Wr0kbAT1J6QH1AB9gHWx3
	uVL5CQCL9rP2HJnYZKJHwdf+nMNRfYEOcwX+56ohQ3B5dZoYM/wmjWfBftCpC0LBHbYME4qOa6i
	VQA==
X-Received: from pfbdl3.prod.google.com ([2002:a05:6a00:4903:b0:884:2224:5f7d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244f:b0:3de:6873:84d1
 with SMTP id adf61e73a8af0-3de6873856fmr3745913637.74.1790653543715; Mon, 28
 Sep 2026 20:45:43 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:04 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-11-praan@google.com>
Subject: [PATCH v11 10/16] iommu/arm-smmu-v3: Factor out arm_smmu_handle_gerror()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044546_851513_CA9E2F16 
X-CRM114-Status: GOOD (  11.45  )
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

The GERROR register's state might be lost when the SMMU is powered down
during runtime suspend, requiring the suspend sequence to handle any
pending errors before the hardware state is lost.

Refactor the gerror handling logic into a helper function. Subsequent
patches will invoke it from the runtime suspend callback after disabling
the SMMU, ensuring that any late-breaking gerrors are logged and ack'ed
before the hardware state is lost.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7347d3ecdae8..a123810fac57 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2406,10 +2406,10 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+/* Lockless; must ensure that there are no concurrent callers */
+static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 {
 	u32 gerror, gerrorn, active;
-	struct arm_smmu_device *smmu = dev;
 
 	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -2452,6 +2452,13 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+{
+	struct arm_smmu_device *smmu = dev;
+
+	return arm_smmu_handle_gerror(smmu);
+}
+
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


