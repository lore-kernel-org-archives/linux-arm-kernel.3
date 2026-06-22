Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244CFCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S7aEd5EX+YdrVp9yjK9xP6A7alsmVtEUOulKR2UA8VM=; b=SsW5t2X3ium224x34y2Qt5gq19
	UgFO2OK00OxK43s2VSPgGDNU4wV3qZQbGvYmWGrwKFfZ5WWGfNgpEhPOljT7v9nZ7V54S06yc2IbK
	1v95QteEdqUOVnsauBEHDoET1rnyqcKHTIAdcyNq9eX+AuNcHepiZ9YtuQCTsGy3LmQhbFA0/ULNq
	X9tf8FS+HcUWXnJyPUAiTkPF77JkqzhEdAqx+onUvrLtKUdkyKRq61ahkHOvGcPG6sFcgUtPNlgn5
	n3jAoYzCcZBzWFA99Zm+5Kvg6LzL+UM6StlbGedj8J6PivYUp5prV6ci2KvD7oV1AKCSontfaz9mX
	ZCCld16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhMB-00000005AwY-44Tq;
	Mon, 22 Jun 2026 16:18:43 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhM9-00000005Avn-2zZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=S7aEd5EX+YdrVp9yjK9xP6A7alsmVtEUOulKR2UA8VM=; b=aB/d3oZdTIWj2b7PH5y6DejBKh
	hM9/0pM7SLzKmf0oGnqAmrPyRxLQiLTsrAw7jsnoOSdRCkkSiZgZHUbeogsXR6TTlFIpC1GOGn2lD
	TRhCS5I99WiGQYHhPWmzBKblzTTsRAMKc2mCgcEs2/edCFaCZQNLF4KG2crdVADR944XZZN+psxDk
	O+EqJCGSCsapptvxCiQtEGfppvA+0GAd0Dne8m/vLq5IKnBCwxbgFJCCHQbVKNDQeAdPiN0Bar3K+
	vKrAqX1/a8riGKnjIH6E4ROngufSXdhayyvLZ04opdnINxRfQzp9SJprZ8Kn8mpNhiXCU+Ak8Grn1
	TU7uc28Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wbhLx-00105R-1v;
	Mon, 22 Jun 2026 16:18:29 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 22 Jun 2026 09:17:03 -0700
Subject: [PATCH] iommu/arm-smmu-v3: Disable PRI when no priq IRQ is
 available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-smmu_pri-v1-1-14ad92b6043f@debian.org>
X-B4-Tracking: v=1; b=H4sIAP9fOWoC/x3MSwqAMAwFwKuEt7ZQEyjYq4iI1KhZ+KFFEcS7C
 84B5kHRbFoQ6UHWy4rtGyLVFSEtwzarsxGRwJ6DD8yurOvZH9ncICIcGu+TCCrCkXWy+6/a7n0
 /XI5q4VoAAAA=
X-Change-ID: 20260622-smmu_pri-a33326900c33
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, rmikey@meta.com, rneu@meta.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=leitao@debian.org;
 h=from:subject:message-id; bh=Xfj/GKcfUN60lJa0KVwkvKu98Hb3WHSEqu1XiMbs6wE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqOWBRxW4cg8uASIBMlgSGZlN6WUBefTyJh2uTA
 VgOPZYjFBaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajlgUQAKCRA1o5Of/Hh3
 bfTdD/9Gzzcx4dDoWg0o7SyVITStwljS54RUi8UotFniXFwq7ysLmAK5t47D1WJPAPr9ZGrnusm
 2aP1c+f4EF+JwQUi/9dkmngYYUePtAn63450Of3l8yGdWT6PRbHW4AAGLzRNcEHGP7pjy2nd942
 s/rf2rlqaLOIHsH9YFaTbM2pb9pZtOfVcVwibyf6RbNrn5puo9X0Do6zTs184B1yToyRjStFZJu
 GypoOCd+F5uT60SDHRWGmuAqioFxVvh8MqLmBE+aSvAOTbp/V9ZnOqvPas7tuD9Z53dI9wQX0Kf
 rHasv/eOLeSrZbKkYS+brZK3/flOIZNh671dRwk3rKZUkc1XGe3ViLsNicI3Plr2KPLpH8CPw9e
 RAfAG8QtSWQH8s3+OdKDD2q3/cLw20vBQYTdINxM6fDIPY6uXPncrKIGAGVBXcc9kAQnFYvHvqn
 BTrQ2i7X7ocrz19Z2RgrsarLjPhfzpcAlXlezMoQs9TWx0+EYr8563RJzO7T7famh0rBtS6xmXl
 UpOo+vuNpt+OBwsYNJBm6MHh18BImKHFN5BW4/ZA5RW+JJ5o84ghqDTDX4JtGgSIdCpluTGZIUQ
 rzXz8q+oIQvG37qNeTCCVJ0HFUDYWc9y3A/AwKW7dhobslB326e/AfZAV0XyHlRkLD5j3zKNEzW
 Rp2neFe4N9Brc3w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_091841_763252_328BED6D 
X-CRM114-Status: UNSURE (   9.81  )
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

When platform firmware advertises an SMMU as PRI-capable in IDR0.PRI
but does not assign a GSIV for its priq, arm_smmu_setup_unique_irqs()
warns and continues. ARM_SMMU_FEAT_PRI remains set, so the driver
still allocates the PRI queue, programs PRIQ_BASE/PROD/CONS, enables
IRQ_CTRL_PRIQ_IRQEN, and lets IOMMU_DEV_FEAT_IOPF be advertised to
upper layers. Page Request messages from devices land in a queue no
one drains, and SVA binds appear to succeed while silently dropping
every page fault.

Clear ARM_SMMU_FEAT_PRI in the missing-IRQ path so every PRI-gated
site in the driver consistently treats the SMMU as PRI-less, instead of
the half-baked stated.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4f..44bafbb38e242 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4659,7 +4659,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 				dev_warn(smmu->dev,
 					 "failed to enable priq irq\n");
 		} else {
-			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
+			dev_warn(smmu->dev, "no priq irq - disabling PRI\n");
+			smmu->features &= ~ARM_SMMU_FEAT_PRI;
 		}
 	}
 }

---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260622-smmu_pri-a33326900c33

Best regards,
-- 
Breno Leitao <leitao@debian.org>


