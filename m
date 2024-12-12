Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A649E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFThXzKnjRTlltuWbtKfTZlx0mgnbefnBgFBqpI1yLQ=; b=Atbk94xhNKxhRJy7ud6cqrAcQK
	okYQMiPDucJly7dkw3ChiCbjKyTAqqSQT+b1NftpjrVBc+/ObIsaphr8DxlIqbDsfDC528t6Ypx/o
	b8ukKFHUXgCL/xGUxFUhAXwzhIptqxthcsk3ThpAGk4rzHV/XwbbxAcz+swwrVp7oOIbF0KqnFuA3
	44VACVvxtBK3WvSExkgmrbL5owhFRVCoAABCsak7U6hxc0sJzy2w4ETJQCj6JNyxZPJIfq/SAd0A+
	GfjXOgvr0HaRRKySKeISN0pZroQPrCGcpRq/HVcK7szBc3DlvFpeE3F7g96SsKEbbV93CWXQBUYUC
	w9hFUtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo4z-00000001SYe-3CNB;
	Thu, 12 Dec 2024 18:38:29 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZN-00000001JsK-0iB2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so9237015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026747; x=1734631547; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HFThXzKnjRTlltuWbtKfTZlx0mgnbefnBgFBqpI1yLQ=;
        b=CPEj2OdudCQYQ8wAlTgs+EgRUSQY6pkIcME25jEKxQy0OqeaimDF+kflzJeObOQ1Y5
         hbkQ7iggXnrz/TBQByRDnHPm7PeqXF8Sn4bUAwZPa37QHCSi+PsPijyw/XC3f9XYiRod
         PmZass1JOCDvIzxTZiPr/r+xG0E0puLzX0+KsASDqh4aC9L+1mVByNQIJ9DCs5m8xZXJ
         0ooujmn1SC8KDtbc4VN4L0xVLUkRQfJK82xxW4GStbSXO09EesmV8JK4g19oeyNdtkR+
         9VAmS1BNWce++xRO1BgRHN78EqFgLzDk3+amGMbAKufmMkmKbDL8tKDKuWeu747AsjrA
         pBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026747; x=1734631547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFThXzKnjRTlltuWbtKfTZlx0mgnbefnBgFBqpI1yLQ=;
        b=CYIfWw4Y+Pc1f3dK9MD7XZkq31dil7GSGJW8DIKAAkqaDMJjvs3ZNyD9D7DPbLFrGG
         TAgGL3wHGEUVB5bLa/qEc8g3E3GVdA8sLvfU3+TaqjZggRloj6x2yAWNATMPonEJnDYe
         aEP9KLGuCidDnMg6mvV/61iW87l7uTvqOYEhLvg/dg4zMj8QY34sneB/b6OdkWcd9zZb
         HFGVeLL1EHJVWKji18y5v/IW0B3oPUVj0v0IucoxEGaaYLq3KqYhL0ZL9wQpu6MS4M3K
         cxAplx7Bob4b+ZEhZSaOOlgSkkRCEmfwou1DsrqZ+t3fOMJxRt2BxFFRGaJhpGfgEMHm
         2sAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVft77Doxdn7r88Z0os7lRf2ZzkHJWb0oIpCvmcKWNVO6wdNg3LaoogyFPImJF4CkQ+k0ZrBink7VHUSFRHh5sU@lists.infradead.org
X-Gm-Message-State: AOJu0YwMdEBXWQW50d220iZ0YiLkg5hKdt/tdDfbe3rEkUokn7JoFwQQ
	QgDQG9XZNrrzaqIed4ZM47G0ZN9Ar3TF7rwd+rQS+u3SHY859kElWyVTZiePBJuCgmZ7O5mWNUp
	URmOUTEoK4Q==
X-Google-Smtp-Source: AGHT+IEcA6NxPQcYOWP3jecw4tajvZQj85hXUMMgjZMFtmkSC/sm2wXlubiRoWv+mV1LLv3tR1NkxUnUlZkBAA==
X-Received: from wmdv18.prod.google.com ([2002:a05:600c:12d2:b0:436:164a:763e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524b:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4361c3aaefamr76123965e9.11.1734026746134;
 Thu, 12 Dec 2024 10:05:46 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:54 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-31-smostafa@google.com>
Subject: [RFC PATCH v2 30/58] KVM: arm64: smmu-v3: Reset the device
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100549_209371_B6A53EBC 
X-CRM114-Status: GOOD (  11.67  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Now that all structures are initialized, send global invalidations and
reset the SMMUv3 device.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 38 +++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 5020f74421ad..58662c2c4c97 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -441,6 +441,40 @@ static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_reset_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmdq_ent cfgi_cmd = {
+		.opcode = CMDQ_OP_CFGI_ALL,
+	};
+	struct arm_smmu_cmdq_ent tlbi_cmd = {
+		.opcode = CMDQ_OP_TLBI_NSNH_ALL,
+	};
+
+	/* Invalidate all cached configs and TLBs */
+	ret = smmu_write_cr0(smmu, CR0_CMDQEN);
+	if (ret)
+		return ret;
+
+	ret = smmu_add_cmd(smmu, &cfgi_cmd);
+	if (ret)
+		goto err_disable_cmdq;
+
+	ret = smmu_add_cmd(smmu, &tlbi_cmd);
+	if (ret)
+		goto err_disable_cmdq;
+
+	ret = smmu_sync_cmd(smmu);
+	if (ret)
+		goto err_disable_cmdq;
+
+	/* Enable translation */
+	return smmu_write_cr0(smmu, CR0_SMMUEN | CR0_CMDQEN | CR0_ATSCHK);
+
+err_disable_cmdq:
+	return smmu_write_cr0(smmu, 0);
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -472,6 +506,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		return ret;
 
+	ret = smmu_reset_device(smmu);
+	if (ret)
+		return ret;
+
 	return kvm_iommu_init_device(&smmu->iommu);
 }
 
-- 
2.47.0.338.g60cca15819-goog


