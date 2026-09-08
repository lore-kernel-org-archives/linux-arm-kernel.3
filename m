Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D84C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZQ96GtbiVZMUuZJG5wzZJpcCp+T4Rvb6Y19B34gIxE=; b=Xpu27ox2LdyxxiXDt+VW4vYBiF
	wMmkD2974fqD9Gy41USpL8jFnf6mN3B6U9o+jBYnwnyVzNPMV6VXA7yH7QZ/MwZIS4Tt07HsavDcf
	3+VYx8KbA1AO5kAmJxxQspPUnZUnlgixxsvylGbDoE7s6slSiwiR/ZG4uHHMu4zfs99IjkqlBcrjl
	xyAJRVK2IIT0m9BIK+FasSrz7kbJxD6TMknwmH5g5E9p/VLR9gx7Ou7HO9iCajZ6WtaGtm2CpxOH8
	nooFhmipQqn3DxMbLiyC4ztvuyZHUVHUIaeGI15E3mBDSr88EylV+djuCxbfWLUaSAGJ8BCMl7DXt
	4VGLtL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRz-00000009mWr-0Vh9;
	Tue, 08 Sep 2026 17:17:39 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRs-00000009mSr-3YYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:33 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-855f662439aso2278896b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887852; x=1789492652; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZQ96GtbiVZMUuZJG5wzZJpcCp+T4Rvb6Y19B34gIxE=;
        b=o1VYQldX2QMHnxmuKXbN+X+r99qv7/Vo+nfos+uhqLlrhyREQWV/lBuC4AsbOwsduQ
         dxJCDA2zu8gTM1ZidCInbE36Go43PBiyR50Ty7b4KtezL722kScTQPQQHsKOHNePgUVJ
         tDIarO0ecchawWfCUhtVPu2+x+1nypZEMRfb2/ZLFj/WapVwCcJH5TZt/TD/DG9IMBUk
         4uMwGLTGK/E3s4GC8pWJF+aY4PeY5USzadLU6cqAshM+ILaHKYCeyYFvMsdHDrdaNKrs
         gTOhXrWsKqiVPucy9OPQ5OaZ6nNUXGmxZZVVeey8lrHtixLEL1BMzEwPz2VMHzQzqRW8
         SSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887852; x=1789492652;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZQ96GtbiVZMUuZJG5wzZJpcCp+T4Rvb6Y19B34gIxE=;
        b=lCx/h265UrnoH5J9cf8/3G6bHmFbQWdavs7YYRUCT49X21omVL0zFa+OAoAvGwFT59
         ju4v9dPl21+5M6/RpsW7eqkmJGZ8yBUQBh7bOhuCVrbFlUlKUkzlUoqYcMyJG4pCFTtc
         BtSgIfGb8fHjrFmSa2yKl10qrerKewg8rnsEyKpGGu4TK5FOijzw9vh9WWFDJLQ70nC5
         T+Xb2ISlPLGRhzCch67Zhr3xnt+ejgdtcd964PSDV/yCZ4b5zAPVqNtW60lV0eZo/B7/
         JKhZbxnSM3odwk+fhxbzkm5uXIS1ti5/scoO9AhhlGNd2SplcILryREWF/O1x9JDtR4s
         G5NQ==
X-Forwarded-Encrypted: i=1; AKwUvByi/n3Eg1m12YYVbEIFft0JACZA+Q1Cm07lK+wGq/DLUpFlHSK7GTfNVl0KjVOJO+YdRqJmyT0hcSawBhemPMBF@lists.infradead.org
X-Gm-Message-State: AFuF++mKbb53HSentbjWNcxcjGd7Orx0o0CrnBUIyXv1tLF4jdxhDrM0
	GLgWJVo1SL1o3bfMLQPZHI/+dPZxg+fwf6242VrEEbFG6BQoYAbi2wBFOkfNX0vEWddnP95WuQx
	qXQ==
X-Received: from pfcg5.prod.google.com ([2002:a05:6a00:23c5:b0:847:7f5d:6b90])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a1:b0:857:726d:2708
 with SMTP id d2e1a72fcca58-8616c645061mr40446869b3a.20.1788887851696; Tue, 08
 Sep 2026 10:17:31 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:03 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-8-praan@google.com>
Subject: [PATCH v10 07/15] platform-msi: Introduce platform_device_msi_rewrite()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101732_892457_2C6FCC75 
X-CRM114-Status: GOOD (  15.87  )
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

Platform devices using MSIs often lose their MSI configuration registers
during system suspend or power down. Add platform_device_msi_rewrite()
to re-apply the cached MSI configuration for a given IRQ using the
device-provided write_msi_msg callback.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/base/platform-msi.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/msi.h         |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 69eed058eb20..022febf2da93 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -94,3 +94,40 @@ void platform_device_msi_free_irqs_all(struct device *dev)
 	msi_remove_device_irq_domain(dev, MSI_DEFAULT_DOMAIN);
 }
 EXPORT_SYMBOL_GPL(platform_device_msi_free_irqs_all);
+
+/**
+ * platform_device_msi_rewrite - Rewrite the MSI config for a platform device
+ * @dev:		The device for which to rewrite interrupt
+ * @irq:		The interrupt number to be rewritten.
+ * @write_msi_msg:	Callback to write the interrupt message for @dev
+ *
+ * Rewrites the cached MSI message for a platform device.
+ *
+ * Note: Platform MSI does not automatically cache composed messages. The caller's
+ * @write_msi_msg callback is expected to cache the message (e.g. into desc->msg)
+ * during initial configuration so it can be rewritten on resume.
+ */
+void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
+				 irq_write_msi_msg_t write_msi_msg)
+{
+	struct msi_desc *desc;
+	struct msi_msg msg;
+
+	if (!irq || !write_msi_msg)
+		return;
+
+	desc = irq_get_msi_desc(irq);
+	if (!desc) {
+		dev_err(dev, "Failed to get MSI descriptor for irq %u\n", irq);
+		return;
+	}
+
+	__get_cached_msi_msg(desc, &msg);
+	if (!msg.address_hi && !msg.address_lo) {
+		dev_warn(dev, "No cached MSI message found for irq %u\n", irq);
+		return;
+	}
+
+	write_msi_msg(desc, &msg);
+}
+EXPORT_SYMBOL_GPL(platform_device_msi_rewrite);
diff --git a/include/linux/msi.h b/include/linux/msi.h
index a4613de11960..72b0d36160d9 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -673,6 +673,8 @@ struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg);
 void platform_device_msi_free_irqs_all(struct device *dev);
+void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
+				 irq_write_msi_msg_t write_msi_msg);
 
 bool msi_device_has_isolated_msi(struct device *dev);
 
-- 
2.55.0.979.g7e5102b832-goog


