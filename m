Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D7C55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6TeYs4RXNnlLq03Nmw/3D+up68HnwIKjwAEcJQqjZ8=; b=Af2CsXKmSOT/dgy0MJ+7PVXOd4
	1ZXrrRG8AXblYGhLlWEoaLRadi9obnXVwgzeFEwXsdV8k03V5sUiuoDzYMzzMsxXxsj85lO5DJHy1
	cgUlu/izXd+9LTohmmqp6YI93wYIFIPmKNDOvPayrDGwY4XXinVHmOFnpyRCL7GWKCl0pYZ1ws9Pc
	0q4VzKliWDrNgbPMmW9xfySxvcHlJx51YphHmabzUbFb+R30wZzZ/Dh8KOzzD3yYq/WyRDMQSA6Vz
	aRp1+bjdByFWZrwwEsRT+UIKRBQ4Ktc0Vca2jmS/dBD9O69l/aM35GyZ73QFGmrhgp+qyDD/Z0yHk
	6pgl8cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpda-0000000Gn8D-0sLf;
	Mon, 03 Aug 2026 10:11:14 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdY-0000000Gn2X-0HXS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:13 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49554715277so17970885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751870; x=1786356670; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6TeYs4RXNnlLq03Nmw/3D+up68HnwIKjwAEcJQqjZ8=;
        b=RswA0nVJX9GY7cJwa8iy8GIvzUs1HZLsYyXzJAmQM4YH54tDpSt5g1XrCWrxdFr2Ry
         lgzTS/xM1D0HVTQaftMAdOFZsrq20xsxdkzQUnqMChoE20vLmcri1Ffd0gWlqFdXs/o5
         eHKIE+FR9oW3pMpzlAzbDYnULmvPySj9mPNFfw+vh4e+4DgF4Z/lK7UM4PjbMki2L4FC
         24TBMJx6akwVmFnJsQ7uKgHcJEV3qu25XFnL0YfR4s+ktKiDjeF+GKAu2BQconhweMV8
         1QtKI7di/g8K+vqxp8sDimL3DGqQGx5NlbyWmLCQsMxd5H48utAxdYmWEJj2xED2vbid
         89KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751870; x=1786356670;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6TeYs4RXNnlLq03Nmw/3D+up68HnwIKjwAEcJQqjZ8=;
        b=n3zMol95PhG4lFRPuSAz2ULVn+RsoTOM3kiqYjuU6/nnJUIBpT+H4vqKlAIXS2647j
         +6fN6u76Q6A2Ca/+6aVWsqyWmmO8AsqCuymNTNgkUB0BBRBEk5xPC84vPs2YoGLHNaa9
         Zmh7p/Coy5LUggGpF6M2h6kqOBV0v3HKn5/5mlluNw8JTDTQjgbi5Qlx5RNJGX+5r8Du
         TVzpiWHevltxSUsaQT+sAyM6NENpOv003urp2WzulLmXxLOm8YoaVgdybFqxu4jXvZmG
         QTm6aSKO3Fzs+JW2DC/SNjmDVP4W3gdYoLFR0Adih+PrQv3k4ownrpjgZ5W7FmWT79OQ
         MV8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq3e//nkGX55aYk1rrSWbDUrm1UL3M4Z+Tci+b35KIpNJVFICTjLvBmE3DKosWo3DAwpamgHW1XncjMHc3P8//U@lists.infradead.org
X-Gm-Message-State: AOJu0YyeiOLBl2+D3K5w/SCfB7oxylLRWIAt+WXITCychSc6w2NiS6Tj
	5igCGW9fczApD0u43cVTxgUtsKt3PeLAKL284yTCDCeUfCoTzhDkbZxBqrdaILtoNy4US9nAITk
	6NyIgWkHnpQvVFX6A37dXAg==
X-Received: from wmsk23-n1.prod.google.com ([2002:a05:600d:8497:10b0:493:e006:3161])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4980c652515mr251315495e9.11.1785751869935;
 Mon, 03 Aug 2026 03:11:09 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:57 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-14-vdonnefort@google.com>
Subject: [PATCH 13/20] KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031112_114847_B3FB3245 
X-CRM114-Status: UNSURE (   8.22  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_vcpu_in_poison_fault() to work with PMD_SIZE mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 47c5c6b4869e..2340706e41d3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -964,7 +964,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (ret)
 		goto unlock;
 
-	if (level != KVM_PGTABLE_LAST_LEVEL) {
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1) {
 		ret = -EINVAL;
 		goto unlock;
 	}
-- 
2.55.0.508.g3f0d502094-goog


