Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C1CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACz9N/uLV4ni8vIh9HTqb065WbDM683/OQmKXL1iQNQ=; b=BOHEyl4dYw6HW4z0RoxpKtL/yZ
	iPavI6UDuOKZlakIOagD0EjTX4BgqamqH7ackE7LI4a5t4aR90Lt14W31VjZvWWBT6hlwrxPaMN4j
	HsxaBsLBwi2LfZCIxRfafUV078TwaJ/ywoSNW/NsXiPMNVXCfFjrY1sLBRcvO+aDytAK79l6fMhGX
	RDazaInVVbS8xtekwrmJUh0sPBOqudW8UH2YoP+opHfTfy5CyPRA5UWBpqOZXFLc9WsZYQATHgyAd
	KZVowhebL+9kH3c7lsPbxo+K0sjaoaVL16+bWRkzq9u1xxECFi0G/ZbV61xJgEwns7/jkoKl7V83B
	w5yiHhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JMw-0VjS;
	Thu, 15 Oct 2026 20:10:32 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRli-00000001IGu-3IFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:41 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c2e6cbb6152so41297066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094976; x=1792699776; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACz9N/uLV4ni8vIh9HTqb065WbDM683/OQmKXL1iQNQ=;
        b=mcdM4Dya6rFDxukeT1uDDMBG3jyEuRa122z0APSOZxWv9rdCViV3kIvcNw8m4Vb0IE
         3Y+XISToAR/MJCtl0gGjzYdCl1T72CpXsx6WtxnyxoNq/pH6USG+14OpBU4UE1Z/3aPU
         yC8gsynBeFKIDtaZDaxLNQBlg919M9gLhCZf6JOm6KxpczMJgeBuEwhLBaq0IoWuxdpX
         Z0e+gy7HL4g1P1pXuvYEc+4QI03LrdVaD0vrYdv8hTxEQWjevCGsjHDriYM2JDl8P1HA
         u7TMeGC2cfO900TGB0smuOrrNgaEum+Z7BcdZuu6miHatGYTj3PfbvK9l1B5rJpXd0ll
         IAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094976; x=1792699776;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACz9N/uLV4ni8vIh9HTqb065WbDM683/OQmKXL1iQNQ=;
        b=wlalwOK2erP6khEug9pCnLfDfPDLcuuIJGfpvgY+1yQmzNeOxTJdaJNoYNtDPJf4rI
         oVyZWOKO2ZlYw0+XNV9Y8dRWiynYcljjSzfc+2rXJoGSBfTpGe1zBBdd4oNKRT8G9jCD
         LIGu4PRpOzWvPzxSdDzA86gVc5ldknIIEeDmSkmWLs8v2ZSPUVvHCS9iMHSytPLzD7xQ
         uY/lci9/FdOSYHwlXGKXmtji20x7HuybB8i0u8T8qGt4/DzstK7OfIhVizBTjUdM0Lxr
         i9qHZqF4jvIo5cK1b0+pqAe5/ixFWPz5CweAFf5/fzIBcRL6+caOisvHiUmp2ylJj7uy
         oHIQ==
X-Gm-Message-State: AFq9FYLBZASVbWAl9nP0GaZKl0ZUL0bGHJcJ87Pra8jbc1VfKW7ICbIc
	FIR8rGmUZnBulWVeXjJrSm6MRZ4GuFB/qZSs6GgdLsQVQ0hhqL9Pajsr0m9gJ8Wf4Z+22PmfqjM
	6Blb5cMV6w5YJbUvoHx9z5gptPvRGKlJ8g86VeGM5rDaSEiyM6rvWO6AFWNJ48qUI4XEZVXthQn
	Im2fQfHDVE7Lq6JaxftkdLGaBUMgvjiJ6+hwSpfwIbD20Vj7v4hHebx7x2sUuVPQ2ifA==
X-Received: from ejsh10.prod.google.com ([2002:a17:906:584a:b0:c3f:cc01:4b72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d11:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c402349d091mr109107066b.33.1792094975445;
 Thu, 15 Oct 2026 13:09:35 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:51 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-21-smostafa@google.com>
Subject: [PATCH v9 20/25] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130938_938632_C0296DED 
X-CRM114-Status: GOOD (  16.07  )
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

The last bit of emulation is GBPA. it must be always set to ABORT,
as when the SMMU is disabled it's not allowed for the host to bypass
the SMMU.

That's is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 1972df1d2a8d..943ffef0bb4a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -217,6 +217,22 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	ret = smmu_wait(false,
+			(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+	if (ret)
+		return ret;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT | reg, smmu->base + ARM_SMMU_GBPA);
+	return smmu_wait(false,
+			 (readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -456,6 +472,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_deinit;
 
+	ret = smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_deinit;
+
 	return 0;
 
 out_deinit:
@@ -781,10 +801,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->host_ste_cfg;
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_GBPA:
-		mask = read_write;
-		break;
+		if (len != sizeof(u32))
+			break;
+
+		/* Ignore write, always read to abort. */
+		if (!is_write) {
+			val = GBPA_ABORT;
+			goto out_update_regs;
+		}
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (len != sizeof(u32))
 			break;
-- 
2.56.0.176.g3575e65682-goog


