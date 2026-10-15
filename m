Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F870CCA469
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIrVQ92JIOcBfxb2Vgbbd+S0vgGCTt9XwUnEmjZAhJs=; b=pZjGuvLHUEx93U5PAy1AxtisGS
	t+/xFfhHY6aK5ONLxwYDQjmQzsh1xXO/hmOGFGccg+uxvNZWZ/5x1/xMvKHkuIlAsq57Z1HhYwAPP
	HTvVFYT4JzY05diqAIoPd10iOqDy9zPPkKygSNNSalnopuEmkF3S3MAAKH++3iEUjWYab1Q9mPiBy
	ji6Nztp6+MJQ84rRgUgnx63Jm18j5N5RVP6t0hUdOSphWnV6+dGMuqD3ZeUJab8Kf2LhvQOJSsSVT
	MU5rnOknb6Gg831o2HLJKylAIlWFiQgunYsCG8R/jmnTu77rmZmTFqZrJpLJqbR7IPWif+L/ssojP
	kbcb3z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JON-3nkX;
	Thu, 15 Oct 2026 20:10:32 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlo-00000001IQl-00mG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:48 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a166a9ea21so47935925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094982; x=1792699782; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIrVQ92JIOcBfxb2Vgbbd+S0vgGCTt9XwUnEmjZAhJs=;
        b=OgkUrpz2KsrIhzStoxbtXB/vmI0jh5CHlUecYH2ShVgjdt0xtHhnCfZMcO77v284lj
         EnzNncqicPsQ5e8ZIRCFOym94bbXda14rJeCpOdWpoLio18bWeQGPjvuYPPxFwmYARoQ
         hrhGoNB0lxVwhj6rYKSVwp8SKAhLSTNc0BpgjJR57C/NV6P6MeAIXGWTiy5jNI1XMqi3
         CagILjqKQ7tc4yRzqr7Tia5Gg4i8GDi0de8Jzmw6sQra10VXCqw9S+ZBM/s8RkPQNWNv
         VnJdGzSvmI4z1mrm1jEUe+0Y7neg/eB9oYfU/dPnQ0BZuQndsFG8n+ygyeXRyT5zCaZ3
         7dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094982; x=1792699782;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIrVQ92JIOcBfxb2Vgbbd+S0vgGCTt9XwUnEmjZAhJs=;
        b=MMWKpIfrhrrUOQm+ZQrXbqQLUwDHgye/BN0Q2FuBzG/zDTnOV9/fbZYkfkxNPJRvx+
         UR8Ov8vkMTyjOHiyt4EY4Cvou5lwHBUYI9IUGOZt00P6oSEsyyAgxh+4Lcgt0fI2kiQF
         elk8vWtWR8h1W5JsGJbLjHpLj+59E1iaRbUK7FagNX3O5UrmcWnStpeQC3dfdCFdkk/v
         EmPYs7cMf92FwkRsxwhih3+uBGFEs5IlV4A3t1aSA5PJ3XhAdL1vSm7tqxQUVrikjoLB
         i2sYMywgfSVBcXIm2sYQRIx2s2IA63v91YhnxUEZGlmGcOytzSqfHNGTRg5dkcO+UipS
         kdew==
X-Gm-Message-State: AFq9FYKhmY3C2LfBeS73w5hdIXh1IHNR8SNrT637970zoF9wzH3yguf/
	JMZwpyk6spsPjNm9rvXVQPav3XGwZVlvqGZwdUt9Dp2AlWCghbCqYfgRUDYYoxctqOzFUgF+cnI
	Pgry9B8MbBHAv7fgS2g5b1xgQ/0l9t6mvQvaTIpKrnsXTrm1bbORmGsHg83+bWraFcdRpoh/cev
	3JpVG5qr/yUuqKwC3s7C+Pl07BN+ZaioZbENTPXoMFhIjn5nF7OjJkd+U8vQ74PabRUg==
X-Received: from wmoo13.prod.google.com ([2002:a05:600d:10d:b0:4a0:4b7:a33f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr214328195e9.28.1792094981436;
 Thu, 15 Oct 2026 13:09:41 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:56 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-26-smostafa@google.com>
Subject: [PATCH v9 25/25] KVM: arm64: Add documentation for pKVM DMA isolation
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
X-CRM114-CacheID: sfid-20261015_130944_106330_DAAFB31E 
X-CRM114-Status: GOOD (  13.81  )
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
 Documentation/virt/kvm/arm/pkvm.rst | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a83..ce67e2ae1f9a 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -77,7 +77,28 @@ Status: **Unimplemented.**
 DMA isolation using an IOMMU
 ----------------------------
 
-Status: **Unimplemented.**
+Status: Supported for devices behind SMMUv3 supporting dual stages
+of translation.
+
+With ``CONFIG_ARM_SMMU_V3_PKVM``, the hypervisor will take over the SMMUs
+on the system and provide an architectural emulation to the kernel SMMUv3
+driver.
+
+If some devices are not behind an IOMMU or behind another IOMMU architecture,
+DMA isolation is not supported, as a driver must be provided for that.
+
+DMA isolation is enforced by dual stages of translation; similar to the CPU
+where a driver can register their ops through ``kvm_iommu_register_driver``
+and implement ``host_stage2_idmap`` to shadow the CPU page table.
+
+The page tables for the stage-2 SMMUv3 will be allocated from a pool created
+at boot with size configured from the command line "kvm-arm.iommu_pgt_mem"
+The size must cover the worst case scenario for leaf mappings of system memory.
+
+This implementation trusts the system firmware not to allow the untrusted
+host kernel to bypass the SMMUv3.
+For example, by resetting the power. In that case, it is the firmware's
+responsibility to save/restore the SMMUv3 state.
 
 Proxying of Trustzone services
 ------------------------------
-- 
2.56.0.176.g3575e65682-goog


