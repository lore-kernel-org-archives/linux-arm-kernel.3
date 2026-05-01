Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB70CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwSpZfMSAme8K1/Tu2WzVQA/LKpXv4XDkU/OYSLP8lY=; b=zeaj3kPo8QjhN0OVmu4SDL7KZy
	aPPBsCt/qeN+hqJhmbITdpq9xxjBmfqyJ1Tg5H6EcwlztD0fc0t4I5bRavRqtpugmZTYf5ktJMHdQ
	kjXCpWWf4/dk8beU0aMMUi7djVeh0ByyA6YfjqDm+G0Sw0EpKz1WB6vl5LuuY9K/3ji+aum5jDQsN
	459xIbVFb5JmSwhLWcesgx27YjH6MnfOVut1UwkZn/0Z7a58nus5iuxj/WslrZ7r1ghFbeROlA1yl
	I76Nbx830/x4YL5zn1kH0LTqQD57JlJ7cYT/t+aDRiWgQ17UJVWsyGA7zPl26/VVTTtg/tLDzDscN
	ZCgkkdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvM-00000006dfY-1m4A;
	Fri, 01 May 2026 11:20:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvC-00000006dNU-3eZv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488c0120047so14016545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634436; x=1778239236; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwSpZfMSAme8K1/Tu2WzVQA/LKpXv4XDkU/OYSLP8lY=;
        b=a7Ld/Ly1r03TVIA3X+FJMyz2b166f4nKSh/TlbPxOiCaL27GTgMaF7s7rghuA4LWHL
         O6vkvtWwuxB7GoDa2bhU3CLeGMVEnNv3d1P6OUmKxq75+bJX5EzeTz8/crJ2Y6pAi/W8
         owU4eqWh2ZVUP2Ja/gXyiol6FpoGWuI7FAJM/0LE4VeGaALLIN9iayU91Bsis27SwRIy
         +TkPAA3Y3FTrH1Xo4cHfjqfnDggyx2JTQsiK3kDsr1LYMezruetja8MlhRTAz4ZiX5P/
         s9CjRkDTaXkfMtPVQldD8osSBkvP+L9ybkCHDm/UYA9oOp62vxmRBXJmzgBjoj61Rpez
         stTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634436; x=1778239236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwSpZfMSAme8K1/Tu2WzVQA/LKpXv4XDkU/OYSLP8lY=;
        b=AnrWnTPe3eP37QbPfzsGRMq2RV28d5FDAJbwZLcvA34DpHi/b3jl96S/+BKuyxUy7R
         gOW9hkk+eAirSyh/GdOmrlfrT48BSKi6+9SuIhTqjdN0A9/Weg1wwtEzUTtN5iOgc8rN
         Y7wtwMcr2sHMUrCyLvEGcbC2rGzOVStNzji/Hlo7OKqlrtnr3y3ZcybbKdn8Mmf4TomB
         pD7S7pFxL1uH5M3oFX2almlUnp/iwiO9tYuc1DrLpMfQ5lybYTSgvQMRjg5TnOJmgd0p
         tS1s8w561BCYOkJSwxCVJCwBOUCtciJcFXI4Y/8Q28dFseg1w6Ag5RZJWhz/HGCBSWOD
         F7ag==
X-Gm-Message-State: AOJu0Yxwz0+CHSGcx7G7AizFqnJekSHo71j32HQQWYFkV7Gi7EoY5N53
	uyvGuuNg4u3biTOEzayTwOx1+NkdF3ZNr4/OfjDvsK1nFcghznRwDggx5Bafibr1Sorau0obcP9
	ZDowyYK+IW/eCWQaGFNp/yEzcFwbBwwgVUdUIrrN0NgTjSWKnJJBqz73MWOwRievwwlJBa4FVkq
	onPXrd/mclGpxGT1ypNDRSdZG/YXRgbksyZkjaIQDk7jYVDtehaJpF2S1h79Poowvx0Q==
X-Received: from wmbjn2.prod.google.com ([2002:a05:600c:6b02:b0:489:d74d:f20])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64cd:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-48a83d6e17cmr115589325e9.6.1777634436116;
 Fri, 01 May 2026 04:20:36 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:27 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-26-smostafa@google.com>
Subject: [PATCH v6 25/25] KVM: arm64: Add documentation for pKVM DMA isolation
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042038_998666_656F4B99 
X-CRM114-Status: GOOD (  12.89  )
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

Populate the section for DMA isolation in pKVM with the newly
added KVM IOMMU and pKVM SMMUv3 driver details.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 Documentation/virt/kvm/arm/pkvm.rst | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a83..46e5c553646b 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -77,7 +77,24 @@ Status: **Unimplemented.**
 DMA isolation using an IOMMU
 ----------------------------
 
-Status: **Unimplemented.**
+Status: Supported for devices behind SMMUv3 supporting dual stages
+of translation.
+
+With ``CONFIG_ARM_SMMU_V3_PKVM``, the hypervisor will take over the SMMUs
+on the system and provide an architectural emulation to the kernel SMMUv3
+driver transparently.
+
+If some devices are not behind an IOMMU or behind another IOMMU architecture,
+DMA isolation is not supported, as a driver must be provided for that.
+
+DMA isolation is enforced by dual stage of translation; similar to the CPU
+where a driver can register their ops through ``kvm_iommu_register_driver``
+and implement ``host_stage2_idmap`` to shadow the CPU page table.
+
+This implementation trusts the systems firmware not to allow the untrusted
+host kernel to bypass the SMMUv3.
+For example by resetting the power. In that case, it is the firmware
+responsibility to save/restore the SMMUv3 state.
 
 Proxying of Trustzone services
 ------------------------------
-- 
2.54.0.545.g6539524ca2-goog


