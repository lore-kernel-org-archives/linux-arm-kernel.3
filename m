Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAB6C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgPugb2YkxnKi50b7v+3nkhZYP2FraFhAVSvIFRbVA8=; b=HHW+HpJa7qpOGD6oOcMc46HS87
	n7KK6Ffd4yYurxVRZfM6aopMQdJ+4MTylYBqQ9VA5AOz6SPTaWh25qZhRwTKOwCLCMa9zpEKrr1uM
	LjpotBTjFRqFAkXjTD9Tz0e496dNfDDfs+Lm2pIiOmuxaIqTKK8nMwgLpkgMMrJbTnDmcLrkLLMRB
	JSJmeXb8vASLEHSR75wtYf8buTrY+afrBsFjyWUXjlieUTSEADQo3l90iI1YnW62ztxyelwys+LNi
	gAA9SbJqJz6ZdZV8vLfuPcvOkmROia0pg2RKc/4SeQ6PGgT9lg/cOOMEvIASNMZ4KGVnnwCMgRFIw
	qCvioMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSB-00000009mjR-0EJF;
	Tue, 08 Sep 2026 17:17:51 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRz-00000009mTp-1nLr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:40 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso1698607a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887856; x=1789492656; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgPugb2YkxnKi50b7v+3nkhZYP2FraFhAVSvIFRbVA8=;
        b=sS2HogQ6Y8smW1+fCyKZ1yCxcfLuvHLnEUlsb5T8sjN8+ke9P2rJMq2soWSe9GWEIx
         brs201qidpU3I0XuXpiP5jlK/zlvrgwGA0Q7WdJ1QO2CGjEbqMzudDys1ydPYom4AY0e
         EdGHofJNL1Nk9T4EfyZhx0WhxGsKx/hg1+KZK1DOL9JRC/vBDHkt78n6zI1wldLDQesL
         8kF2x+MN/oPmJJcvxBxEn4YLYnlemRQeKGuMChZdXi/OBWCqqqclnUPHIYeRJjAFlnxu
         G9s7bnbUhzRkPCziux/HUqjBQ5IzFvPAzkQxt4Vj1OmkaXZ7tMSX/PU1fkDGppH0EcAg
         MCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887856; x=1789492656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgPugb2YkxnKi50b7v+3nkhZYP2FraFhAVSvIFRbVA8=;
        b=Pkz3AaAz6/vZC04jRN+HpUWTNxEGsNDJ8ebU6NRmHENKRWRyndaJtgRZcCSobPCcRE
         GLxWVLo/4N6FwidHiGed30fUZLqK8GIsQEEbgzLYdyw/d+lBeyc5AkEOALlH2l0BELFh
         QZJhfI/IETHb+RnuPTJcXhtRemAkINk/i0dnsvMokJYLQshNBCtrjzQuLdFGILHRkwCk
         MJLxoAgROaeAjRGcONOlAacEeny5zrCUlcapVKDnKwUmF827oDssxFC/Oqh66txlyOhT
         4WqZ/ucunLszch/iwJZKSqw9+yb83HA8esBeKpMQbulKuW97CF/QSzDR7Atqn77pkVN5
         wJWw==
X-Forwarded-Encrypted: i=1; AKwUvBxwoL+OE/tMTlfskNzkpgy3aHjoNczwlkEQif+0+fuRlBlvHjUm4JyxGj2XDPyvgy1xIsth0vaIZMXyePaF1Qxv@lists.infradead.org
X-Gm-Message-State: AFuF++mKaBNETwNWYf3ke3NoGn4K4uTkw9LjWyLGPXV4LVR8WtlYCm7y
	GbgN35wxY6/knDkEGQ/I8wE5UVZdxl65pcSG6U0fs/X//p3FH6xzGryb4+r/L/QpnRBcVrlBdwg
	Mkg==
X-Received: from pjboy12.prod.google.com ([2002:a17:90b:448c:b0:39b:9a5d:65b0])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5807:b0:398:9be9:ab8c
 with SMTP id 98e67ed59e1d1-39b26229bd7mr46877613a91.17.1788887856115; Tue, 08
 Sep 2026 10:17:36 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:05 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-10-praan@google.com>
Subject: [PATCH v10 09/15] iommu/arm-smmu-v3: Factor out arm_smmu_handle_gerror()
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
X-CRM114-CacheID: sfid-20260908_101739_470669_474612B7 
X-CRM114-Status: GOOD (  13.56  )
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
index a8166e75db0b..98af7c1fac94 100644
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
2.55.0.979.g7e5102b832-goog


