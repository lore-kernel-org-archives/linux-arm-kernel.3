Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9777BC98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=; b=UmsEK7pY4ykb/EpNvTr5C5CXEz
	K0sqgaxcTl7arTiBzpkLt6Uc9k28+zmK2TdcZNXB0owAJvu2ivVNpWO8z/J2WH4ch1uJy8Ne1QZmd
	jv9cZw+/mJ7s6Z1+KNDl7Hns2OIvh3hOc8WnTK2EU53BYmgGK5lghZEQV3GI3sIoSXrtACvdRDTaP
	SjF2MFNtUvspT3RcSGDilOghI/PSw02lJWBAykwV+2jtKiczOtGXWitjGpp+YEmbttdEtF/BbXB+M
	5+sHtlfNv96vZIoCpEYcmqjd7gHQVOHE0Rgai1sKVImMzpTRs8sM9xJbhCHPTMAY+UXrlit1T2/d5
	+FGly3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jj-00000005Sj8-0MGd;
	Tue, 22 Sep 2026 13:13:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JR-00000005SSG-1oKq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=; b=HYM6BHtcZZZ7aM1CEzbWe4NzQB
	wEamXW63OpqaKpHJ/zu1nXAr/BI/1VDHvV+XY7jFQtHjnKWt3aMEb767SNZSwXRTOcfvuymYR4kUk
	jMEvaNfZUYifCle9gy+evcuFjkG7OEIExY47XKLqHecF81xfzOoKxy++AFQadPgCwehP0gVsxPSGM
	mcPNPQXYDOVGIcLbvH7RSWYibn4yEUcCutqhZxqpN2C/n2pjW4P5EfzZEXwABAHYexGCs49CyeDBZ
	RdYJjaz8gqRVXi4K7wf/4st3vvC6RbBIZMMeDWLSG49mcjTvfg5lVzNs1JuPS0S2NfxCjDknb9xpO
	yNX0F3Tg==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90JN-0000000DbfM-3aV2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:32 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49fce60a8d4so17375875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082808; x=1790687608; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=;
        b=p0kG5RtM0Dvswj7Pzz3kTe0mcmpKv2OfzWCT2Zyw5Rz2HlRjho9WnGDGPPto4gRNpT
         oZqs4BNDPLevTnxYkVO1Gocq1U74z13xhVD9ZdoOzui/1f6h6Ceex/VPlC+Z9OBNcqtI
         j/ZSiju0T204WjRKc/LWi16LS1O3RX8A62zd66ShpFRMbqEmFwGBq4o1rvPChrl5AB1H
         xHo8CkDEjUUzJHSn0UaDqiYw/Q4sHhirpakTzefiYGqRdzPMcbwoU9iP9ch0ESWqfLlc
         zPk7KFoPlJcII4D9gQ4pU0t5CQH5zWnfmhnSG6sJCkaZXRHgQjHT+HAKgCNWWCgG3yhb
         Mu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082808; x=1790687608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=;
        b=oZ0qcybhoIeHgcnDTtNsvvjx7wdPM6AS+EM/gZDduxJM5YXuMklT3eMqa+M4d+SzI5
         33+CnvblAQKcOfnkMsDljCJUXhEjzENl8tHLMXt2XyluP76dD3A3girfoFBDwfBnv0Ku
         WL3hwPup/E1KtleSj1pQQue9LB6098fnqrCwfDzLak9M3BdSB1DJjA2YF+SOVh2dy7I8
         /hxI4sQz2J114/arFzcfiKCUqWTWxqBob7FPbtaWS6gtWTq292whRZ9yBjwCjZfbZk5/
         sl9piQydOXOSeXzi/AIdeHYmluVWpF9FQXXUWiiYdfzd3R1AxVgw36yS0vg3ataMCIGo
         kouw==
X-Gm-Message-State: AFuF++koeqlbwr2Q9JZFU+kzeeVkuTfqNnxyvy/lvPg7I/eZacLfQmn8
	bPQ179hBJwfU6UYNBXM6UCojj9uk7nehDR+fGaWzgG2L9RLApxK9rqb3KIHv1vZNKSOA+6ecbaU
	gxTvina8Ytc1Eyl8P2YErMyMWwTIFLeIPJpt0uS47BwqSkyP5RPvu+5UyF8kVOiLMVWz7UvD71n
	Dif5mg8zIs40hvbJNOf0dKIZWpZcel2vNtA8qVBUX6i6nV4nsTmzeGGkdqj2Mt8JvTDA==
X-Received: from wmxt2-n1.prod.google.com ([2002:a05:600d:8642:10b0:49e:6b4f:f95d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fc5734ef6mr253475505e9.16.1790082807063;
 Tue, 22 Sep 2026 06:13:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:53 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-21-smostafa@google.com>
Subject: [PATCH v8 20/25] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141330_040154_6045C978 
X-CRM114-Status: GOOD (  16.77  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 00528380774f..6e023e968ed3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -215,6 +215,22 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
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
@@ -453,6 +469,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_ret;
 
+	ret = smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
 
 out_ret:
@@ -778,10 +798,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
2.55.0.1082.g2b9226bbc0-goog


