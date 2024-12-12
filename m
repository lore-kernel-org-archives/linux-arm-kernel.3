Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE/i5lAaPb/dJbCdJrBXAH1qN4sLI6tJdn5DSSo5Z6Q=; b=Qw61zTOYuSY2/kb/7EoyeNdD4g
	mZ8EmIftO8mOdmcj191ykFxymgDOD/m3zNgWlSDcBRRTFvNKMRMG10+r6K6mihFnCZFZFpuPDAJI9
	VkwlI9pXKrBlowd1NkF0M7eZjNn3bKYaXh2+RVxkKUKz1OeOFr8JtNNndD//eWOwzv4+dSBcC+SE8
	oGwQf5/vAkPx/IhBZoI549t4L9YoIOKcyiC/4W4+vstxAWqPSgsCgEv8vi6rr5+DzfA0Pdm5KNfF8
	UyIflStLk4CwY67f1+nQaTpTypGxEqSzfGm4ksyKvF3fu4J2zwAMriqt3uRzp9QX4ZNAuhaee01uG
	4XFSrXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3x-00000001SGl-0EYz;
	Thu, 12 Dec 2024 18:37:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZJ-00000001Jqq-481K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so5534165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026744; x=1734631544; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JE/i5lAaPb/dJbCdJrBXAH1qN4sLI6tJdn5DSSo5Z6Q=;
        b=2SciMooZw9zv7tG8HxAzvfT26zMPGhoEnLDiwqWsc2DuCgDw/7dQRCBehGnRAQXzDB
         QRpl/wO58GTbjScF/XYtkOLkYI7OatClHEm3pN3vhV5mOiqEjvXBZ7Wz5dTH5c5oXG0e
         nhVcN+b7AriAcRJmjcjf4tbXQSpErwpDb1DBOpZKnoj/J8/uXPI6I0z0d91Z4bu4xQr2
         fJ6mM4p8+xxgb9LVwV1MHrKfIo/lO5Kqgo9Yu6NhWvqn2EUkTqbR3GcsShNb2KAJlCsk
         6QSrfHqhG9/ebTo3ONCGCCoPmz71GVnvJhoH227O8MLupnc+Hc2UE/iUb5klZV+Pohi1
         lKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026744; x=1734631544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE/i5lAaPb/dJbCdJrBXAH1qN4sLI6tJdn5DSSo5Z6Q=;
        b=m4hFBijXOaaMqBaZVsxtMFreqs4XS7BAA6B2Esr1gP2ybfMYWq3kwnuPfH957twiKf
         x9YYeqSAo9/cZZe3aQj5MVS0nde/iy/Hiz0geZNGrIZlYx40zCGSb4fHOP1L5lzccykN
         o01aVNhKSCtmVYIffzL0KsK1IqMKJUQ/o3P3O7p8lWAInjxwvxfHM6kFsnwB+5uS6iup
         m4mYtfOeWNAK1ePwUAh+auemWHcqQrLCKN9e2jg6ybbkQgj1YWFdYHVoe9Tuu1DiQ9Sf
         tBNBMyg1AZrpGMQBOggC+7YDn2sonoLw272AO/cNCUx+CsV8UwzD2r9hMF9OSzGzb7Bq
         2+1A==
X-Forwarded-Encrypted: i=1; AJvYcCXURmdckKjgL5Dbu48nv/zxHkLSsxPXMcerYUeM/+CRjDhdBMX39O3dNpbdsqg+W1CnZr6DGGXH57Hg5ayPkHtf@lists.infradead.org
X-Gm-Message-State: AOJu0YxC40yGDAUy5+3ukoNYeTqfEKbkk9xzZnaBYC1bJMWMZGf++Lhu
	B/NiGhenZOMTEgWsY1ZIunjTbJN75nRnrgGDGTLChfeLFkujJ0jzHQ2iIO8dlwApJt12t4j3mjI
	s51zEC8IYbA==
X-Google-Smtp-Source: AGHT+IFLzVaDnxOQQpqmcBPGMzPT4gfF0J87Ucqw5+xEyz4q3jDg+AjzzwnSPOPsWSAVi+g32NOxN+jbO3aNIw==
X-Received: from wmbd18.prod.google.com ([2002:a05:600c:58d2:b0:434:a98d:6a1c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5029:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4361c3e010amr64441725e9.19.1734026744100;
 Thu, 12 Dec 2024 10:05:44 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:53 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-30-smostafa@google.com>
Subject: [RFC PATCH v2 29/58] KVM: arm64: smmu-v3: Setup event queue
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
X-CRM114-CacheID: sfid-20241212_100546_022739_07336CA4 
X-CRM114-Status: GOOD (  16.37  )
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

The host can use the event queue for debuging, and unlike the command
queue, it would be managed by the kernel.
However, it must set in a shared state so it can't be donated to the
hypervisor later.

This relies on the ARM_SMMU_EVTQ_BASE can't be changed after
de-privilege.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 39 +++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 43d2ce7828c1..5020f74421ad 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -342,6 +342,41 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+/*
+ * Event q support is optional and managed by the kernel,
+ * However, it must set in a shared state so it can't be donated
+ * to the hypervisor later.
+ * This relies on the ARM_SMMU_EVTQ_BASE can't be changed after
+ * de-privilege.
+ */
+static int smmu_init_evtq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 evtq_base, evtq_pfn;
+	size_t evtq_nr_entries, evtq_size, evtq_nr_pages;
+	size_t i;
+	int ret;
+
+	evtq_base = readq_relaxed(smmu->base + ARM_SMMU_EVTQ_BASE);
+	if (!evtq_base)
+		return 0;
+
+	if (evtq_base & ~(Q_BASE_RWA | Q_BASE_ADDR_MASK | Q_BASE_LOG2SIZE))
+		return -EINVAL;
+
+	evtq_nr_entries = 1 << (evtq_base & Q_BASE_LOG2SIZE);
+	evtq_size = evtq_nr_entries * EVTQ_ENT_DWORDS * 8;
+	evtq_nr_pages = PAGE_ALIGN(evtq_size) >> PAGE_SHIFT;
+
+	evtq_pfn = PAGE_ALIGN(evtq_base & Q_BASE_ADDR_MASK) >> PAGE_SHIFT;
+
+	for (i = 0 ; i < evtq_nr_pages ; ++i) {
+		ret = __pkvm_host_share_hyp(evtq_pfn + i);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -429,6 +464,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		return ret;
 
+	ret = smmu_init_evtq(smmu);
+	if (ret)
+		return ret;
+
 	ret = smmu_init_strtab(smmu);
 	if (ret)
 		return ret;
-- 
2.47.0.338.g60cca15819-goog


