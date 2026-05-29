Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F05CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2Vt6NJ/1ID8MCy+YuGg9aIM9aiVrg+WLBywxH6BVRc=; b=tp41WaT2Yzw2NFtFJTfoJW9ltd
	+icxB5b97eiOZqb5jbFsvKIVIf/v/6nhaY8BWs31Y6Tf+/4jR1ktSlEeksRoQEYWca+3r9ETsC6or
	Z9QzWbX2bMgAega6bf7Bl0jgdofSuQzzZASXo0B9lWdi072hC3xsrZ9KBuT5eO6Tu+ozsWf4mhiqh
	WOhZqSDLUYLoNVBsRYYhb+Y6K05dP3mP9Te3uQMkwQwLyDLseoOgh0Dz+jUC2MLIg6pn5FMZ2bVIO
	P7JNKgvP87Z0uGVPA1o8pzZxNzJpnxW7PYXQyMfhAxvHuRX/MaEhTt43T277p4moRXud8FjJ0wMcY
	bK8F8tMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyGI-00000007WY9-24U9;
	Fri, 29 May 2026 14:32:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyGF-00000007WXK-0o8u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:32:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065149; x=1780669949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Vt6NJ/1ID8MCy+YuGg9aIM9aiVrg+WLBywxH6BVRc=;
        b=l7HIJyDJAB5Cqf8wrkcAQ1ShMevXhu3hsrqGuB0VK0AaCAM4WXam2x8uCODTx+uhYd
         tQ6PyI/lNfTOu5Owy+ydSz9C5zqLWuZHLcluSiRq99/QVMX+WvZeAf8cIcp5Fxn/oXNj
         IhoY2QfhB4AXEyBML20L79C29P02p/LCxTYkCy8zcRK+qHaL761Mt01AicaiTVP4XN9q
         fjPnoXJw6yA71nrrFbivbDBIAXKnJsdHf7bIncJDVTXlWJzHRHbI6WhWGT/6uB8tBIOX
         bQI2nvjal/8BCr+VAtVf4oT0H16+i2aslU7gcn/UQaD+DRo9AjbbsJ76vTYS0Qg9nyUl
         l9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065149; x=1780669949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2Vt6NJ/1ID8MCy+YuGg9aIM9aiVrg+WLBywxH6BVRc=;
        b=B6M8x9Em5SgdvFhQR+rnyXZL7Stkk6V/Nf/e2VXrX0DgB0zaqCr6yXSo/dZjCj1mne
         aqQfeq3si9ypYRf9pZCzzw2vlyb6rV5CloHOB07w+weT7lFffR3M7n10Gj07bDPJtoTf
         PoVsHyxcmKZrPDs9Qsz8oDG7v3uIuUuXrDWcO/urAnFsDlfjpBjdfeyFnw7Rdie8FZdM
         /gFsagkZMC2Z+A4K4dXUZQFIxTyWV7dEmiAObGe2buCTjTbeyQmheoi0H04Vj9eS6pWu
         LmA7uPl6HT20moq5n0rIgnT6sGklVAQe8VVdD2nReuYEMLuVbB+wmB0r34hxGRX/ngz2
         YdGg==
X-Forwarded-Encrypted: i=1; AFNElJ98jVeXkb/tSuVDxeBLEZxEk2zMtmYcRHczg4VTHVeBqOZicHLP9sZuJA10K3ryfjapEmDx9wLepAZDWMeMXCMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyVzCqb0FoK5N8Gka6m3dmDzjbZqFxIR2embyNwcCZn/R0RaIDe
	NQeV5AuXWtNksf0xRf8ovUr8jp0NFReQ8DJUP7e5Odl+9PYg8DfaVRXT7Am/q+uI6g==
X-Gm-Gg: Acq92OEwbuxXhmZzMXNZ7JqtSUbfN412AA1kBrUZ7gHz9W2d1VAX9UoCBlsy/xuIOUh
	9MDX629n873VIL/q8VT9vaeSf5Xog2UJE/8bdEyRTKyLG1fR+hzB8yK9wSkk7Yg0MRcsIsUn1P2
	YIp/qmaqrR1T1jPYrTL/aJCZPqOBXvqcxU+YQXs1mJkVn4tmWcQNKG0ybTRTAKPaMUn3HBiTgxa
	O+IHA7xgc6Ejnql2CLuHkyX8B73vr3CiuWM9Qwc2QovcwSA5CqiwFN9FWV9VcIrV9eXuoUfvpIt
	r89ioWFb2e6p8U08C3CX4uw1cnxu+IbcfDzgxQNxcyBFmnzCz3gPavJjC2BL3Z2HvXM5UkqdjWr
	75fGUYxZWH0WhBysrAwq6CnjAdKMyRu/cyicbNWV6C884hBZvqlw1Fz7zLOOfaXftpg/LLct5rU
	yUb2FOnXOAepMh2cBVh5jqDxo/nTUO2wuJ2dtYhaET9owW6m1W1BW3u5siIR+cBrVlwHJl
X-Received: by 2002:a17:902:db07:b0:2b9:a39a:e5db with SMTP id d9443c01a7336-2bf22eb6216mr1645625ad.7.1780065148948;
        Fri, 29 May 2026 07:32:28 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd85dsm20999405ad.25.2026.05.29.07.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:32:28 -0700 (PDT)
Date: Fri, 29 May 2026 14:32:22 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 02/11] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ahmjdjkhCHWpD10P@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-3-praan@google.com>
 <aheb/OLd9AQO6rD8@Asurada-Nvidia>
 <ahgaQm5y_9mISKg0@google.com>
 <ahi8/7NnqW5TzY4P@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahi8/7NnqW5TzY4P@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_073231_282976_075AD95E 
X-CRM114-Status: GOOD (  22.53  )
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

On Thu, May 28, 2026 at 03:09:03PM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 10:34:42AM +0000, Pranjal Shrivastava wrote:
> > On Wed, May 27, 2026 at 06:35:56PM -0700, Nicolin Chen wrote:
> > > On Wed, May 27, 2026 at 10:13:58PM +0000, Pranjal Shrivastava wrote:
> > I'm planning to rename it to arm_smmu_drain_cmdq(), sounds good?
> 
> That sounds okay.
> 
> Though my series is still at the early review stage, I would like
> to merge those two functions at some point

Makes sense.

> 
> Do you know if my implementation can work for cmdq too? Seems that
> only the WFE would be different, which can be a bool?

I think we can definitely unify these. I had a similar approach in my v2. 
I've reviewed your PRI series and I think it would be best to use a common 
helper for both use cases. 

Maybe you include this patch in your series to combine the draining logic
It leverages the helpers you factored out in your Patch 2 and adds a 
toggle for the queue_empty requirement of Runtime PM. It also checks for 
WFE appropriately:

Subject: [PATCH] iommu/arm-smmu-v3: Add a unified arm_smmu_drain_queue() helper

Introduce a unified arm_smmu_drain_queue() helper to handle both 
snapshot-based cohort draining (for IOPF) and polling until queue_empty 
(required for Runtime PM).

The helper dynamically checks for the WFE requirement when targeting the 
CMDQ and uses cond_resched() to avoid starving the threaded IRQ handlers 
responsible for consuming entries from other queues.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 866c711b118b..cf41b3cf5985f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -894,6 +894,38 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+static int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+				struct arm_smmu_queue *q,
+				bool until_empty)
+{
+	struct arm_smmu_queue_poll qp;
+	u32 snapshot_prod, cons;
+	int ret = 0;
+
+	queue_poll_init(smmu, &qp);
+
+	/* Secondary CMDQs don't support WFE*/
+	qp.wfe &= (q == &smmu->cmdq.q);
+
+	snapshot_prod = readl_relaxed(q->prod_reg);
+
+	do {
+		u32 target_prod;
+
+		cons = readl_relaxed(q->cons_reg);
+		target_prod = until_empty ? readl_relaxed(q->prod_reg) : snapshot_prod;
+
+		if (__queue_empty(&q->llq, cons, target_prod) ||
+		    __queue_consumed(&q->llq, cons, target_prod))
+			return 0;
+
+		cond_resched();
+	} while (!(ret = queue_poll(&qp)));
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     readl_relaxed(q->prod_reg), cons);
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
--

Thanks,
Praan

