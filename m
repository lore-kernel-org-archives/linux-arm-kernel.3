Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8746C44511
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C0qOSsi5b2SM4RQ0BVtOxMAlSvEVPuXW/TZ/ZTmFdI=; b=jyLm5BHkXGxghTsbeXXmKJDbAU
	LYbOOmm3uDCeVbKZUhSCp9svQ1J9YhHgarkWBi3CpJFpkPkhgPQf+0sJ+tHmWNfR88/HHpz/KyBTe
	0xiuoRExfCobFreCMN5q3aNFPzrZb9aSSrATACh4dONUORabHa59Q6Zu/2y6Ls+Nr8ytH3PqwEGCS
	EbhSKh9bih0ymAxMseVY0jA74DJJaPmNqscBfEW00vK/L8dDk++Ykd4hc/Ou8I7j3emDprj3/svOg
	vBlGwkFCb+TvV/30FzPAXJgUd+vDGeAPCrvH4y3TStOsMe+e18olcc1ZrHtKO4jTaYhaqIE+eMshE
	H+hNaXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHb-0000000EfwO-1e0T;
	Wed, 15 Jul 2026 12:00:11 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHC-0000000EfVV-17tN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:47 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493dc8408fdso16997945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116784; x=1784721584; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5C0qOSsi5b2SM4RQ0BVtOxMAlSvEVPuXW/TZ/ZTmFdI=;
        b=GTHfausvoZ4UvhFTq+mnTOZX5ZCJ7pqiuQvbMQ9aIi9ZnjkKUQrmvnB+5LXTrYrux/
         OLrC0wD+m/khwNtrqZQoh7NExhR4WUSCvUDDkVeiZi0dhxhfkFe7LFWA0ZgM61wMo9Xw
         W7pbB9Gj0Rce6eDc8LpntgTVmdwN2tMkAe6VaQ3SKi31hhYUqxCDpJ+4LEj2N+EXE9qp
         FLbcPFsD7+k4Dia+vUjPAehIMbLkiFRXmVkqL5axJ+ub0OVMoGlJ+NjfqCdl56y9onH7
         wyGGpwMSCjObq0p7Lsbpqm7FkscdGV+TX5qdbFbMUoytqUmv8WsS4LfGx+fkLoQqEP4T
         0OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116784; x=1784721584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5C0qOSsi5b2SM4RQ0BVtOxMAlSvEVPuXW/TZ/ZTmFdI=;
        b=h3YnTKz9wrt/9dZJZF1Oe8merfSqDkuHApnPzX/RfjDUmDQXpV1T8In3t7VuqE/57H
         XWsU1rWUQklvkP/Nr3Ccuh6d6uH1/z3vyJxlary7uwqgIIkJWiCt1ceG5So98z8PhnxN
         VJiiDgKdMrqSS2aPBTEdfE2EikznzQXuvApXbGsBxuHXGyabMC9JxZUantlTFv1dFt1O
         q99OZo2zQxdAVEQTIzPaCOV7XBjWbMvjZLt1IEWlpRWqJmsSYbqCuts7i+4iixYaRaw4
         qs4wSk+UB72LVALa/eByNO9K8uVoMnZYEcXlZjiXu5GsJE+Of/Aq0BhbVFxb3eNd8v31
         JhIg==
X-Gm-Message-State: AOJu0Yy0L5Dae5Aim07Bq9LLp3sXpcK0O9FeWFSIrxe919fehS9fX9Al
	DMt4LCDPj4K41Q+spm8Hvk4jviNA1mkVp2am8jkL7Isdi+QtQ5VAfaeeywHVTnrpc+jPRzZme9p
	G08o5D6i9bGrHA/UVn2OTpyHD3mBL5IDB1mBN4+KJZysgxkiBLAzj9sSqtUbgFS6VOYhUm79ztu
	9eyjJ44/d1/DRxN5hHdlmFfAiR5FegTDBijziiOg778UiC0uITAl7Q6WCxDOk1wBsZGw==
X-Received: from wmiv11.prod.google.com ([2002:a05:600c:e40b:b0:493:ab17:3e61])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:16ca:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493f88180f9mr114853395e9.20.1784116783668;
 Wed, 15 Jul 2026 04:59:43 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:59:05 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-25-smostafa@google.com>
Subject: [PATCH v7 24/24] KVM: arm64: Add documentation for pKVM DMA isolation
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
X-CRM114-CacheID: sfid-20260715_045946_366987_0D23DB37 
X-CRM114-Status: GOOD (  13.69  )
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
2.55.0.141.g00534a21ce-goog


