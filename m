Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D39C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=; b=UosnkRDRrPJMR/fNZ2nBnhCr0f
	iZ9i3IVhAtfExhur2kmnnuj1iIInc/3amfmtwrKEGMN8FIqyNjPfL+yV2o0ve8zRxnbi6IqWZgopt
	Due5cRV34gzJ98Z2GCXOPCMMTpMP3llBCizmv/eZ7xJcv0X533rKzcLACUy3YB+D6qYCcC4hj7CyC
	XSAVjX2aF21wQJ2BYxnDoH2+fMnHvneou782dEUXrvw0YohhhVxmJNKY7eAmwtBdl9LI7MQL2KQg4
	S+bWSMcqrEUyiho3qzCnwCFc1sibAjvTpNyZHcxJAtzz5G51iAgE+YRm+NI6Up0v35exiL1pI9UtX
	m0ivkT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmt-00000002GJh-0EnS;
	Tue, 29 Sep 2026 03:45:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmp-00000002GHL-0f0Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=; b=TRy6/G84Z05OzaPbfW0VyAXM1I
	nT6U9GfnUFrk3zGvZN5yV6UEj+0ZQOFJ1n9rm/kP3KFxr0GvOKUOfMfTW+q2IlQIAGnpa4W/EwhCE
	VQxcvDFxQs3UDf09G7uuQuY0qUZe7uwoir+Oxh3tf24oOsssfAd1L2n5YnMKpZX1Xh+D5TTk5W9u+
	R3tnh97aODhFB6BwMem6Px3dTSeE8CxmnY8MWm4nm+pnTAF4CUnGoPbS9Od342ptmfhlVftxwXE6w
	z2CDi5YWa3PG55ohCSsZPpG/6XpGcp49yxoanZdIcFjz8hG4J8buG1LF4ww/FdC6z7M80+5k9i5Ir
	YbB44ZOQ==;
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmm-0000000AYVA-1bEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:46 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso3411449a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653541; x=1791258341; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=;
        b=h9A8/PqU7vziGAsns0WRjyZOVlRiCu9a21CfBCAEJzLgInvxc0rzgdumb/qTcMmL0f
         fQGmVcJh3ODCXP7BKc7VCTblyqU5QscvfIJ9jHY7UnNsK5g3PYOmgZlzPMlK9UGouVpt
         sBNQLJwvluc42EqlzJ2c2XoVGuBaR5rx42fWCJebMrl3Ysd+UxSV1NNWPIumIvOStyRG
         v08SvBGMN3CY4WNxaTBlodDBd3Ia15Y5A0w32t/GSaQvYJ1KrQN3NgqH3ofCjLVKKv/V
         9ImlsKn0WkTXqcd3A5p5pRGQBcqE8uvXmmYs/1yFdJs4T9KLCKCRWuguHAtbnUlzyi2z
         LfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653541; x=1791258341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=;
        b=NSArWlaDN0WYOqZECqfBoekWMYs6/ETw5u3FtUsPA9QT3yjh3oXG5NvtSVuJhY+PAA
         ODjLT7p7pWh/Rvuug8BwwybbdY5Fa7iTj8p4JI5Pa7NLZ0fSnGrUl3U/TtWvx+k/8PSL
         0aklfRwclyUUkPzHGhi5+qbsR7D2+6cznKESb6Yuso03dk72bd3aKogugMdh/ZohFPJV
         OPXaxKmC2FycvUtPa8C5XnhAMzgbcuHrVW7mFGMrZuTivJWJdvay2GRpyel1H7uRMDkZ
         YkMFspBb9+VpKVstMdr4hK47UArg19Bp3o1ZcesC7MERb5RYID5RkGNwZaT4+7aXc4yp
         laJA==
X-Forwarded-Encrypted: i=1; AKwUvBxut4H4DHeAmvz/ZCBxIVn9fDEjsvZJwCx7AYnTqaFEnC7GGZFCCz8PXE5DqTp4ex1eQkOLj7k7rZ0usGd+A7UP@lists.infradead.org
X-Gm-Message-State: AFuF++m3669w6G9dPojmO+zDq4fc4XMOV0CQghZJMaOn7/AmNzMT+zi3
	GYCK/Fx5leY9QNQHCu7S9Oi1QQSWikn88czXzKBoBmqVEDTUGPui/J7d3nQrx+HDvTowoDluOOJ
	qBg==
X-Received: from pgc13.prod.google.com ([2002:a05:6a02:2f8d:b0:cc7:4d12:8a9a])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4324:b0:3d1:e510:9052
 with SMTP id adf61e73a8af0-3de0e6f3973mr13463950637.7.1790653541112; Mon, 28
 Sep 2026 20:45:41 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:03 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-10-praan@google.com>
Subject: [PATCH v11 09/16] iommu/arm-smmu-v3: Restore MSI config on resume
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
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044544_427514_781B64ED 
X-CRM114-Status: GOOD (  10.06  )
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

The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
address, data and memory attributes lose their state when the SMMU is
powered down.

Introduce arm_smmu_resume_msis() to zero the *_IRQ_CFG0 registers (which
reset to unknown values) and restore the cached MSI messages across the
device's MSI domain via msi_device_domain_restore_msi_msgs().

In addition, clear ARM_SMMU_FEAT_MSI if MSI setup fails and the driver
falls back to wired IRQs, preventing spurious MSI resume attempts.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index dc2fc02b5163..7347d3ecdae8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4779,6 +4779,19 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
+{
+	/* Clear the MSI address regs as they reset to unknown value */
+	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
+	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
+
+	/* No-op if no MSI device domain was instantiated (e.g. wired IRQs) */
+	msi_device_domain_restore_msi_msgs(smmu->dev, MSI_DEFAULT_DOMAIN);
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


