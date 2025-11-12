Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4873CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=; b=zeany4Os0nskUGi3OkYMZiygsZ
	8f7yFkJq6oyCAJ8L+Vn8P1Xb+N0FHw+FtmfYpfN9GcGHyfvA+I26nFo/1vyKB3PhCEHPAwLUwuL1N
	XHls3J1omqSk4yAa4AXL7WyjEbZp2aISwFw8USQOyfwwi/g2cH5UEgH6/PQVE+Kc0pGX48HOTxtll
	1KO0WdlTK7Gknkk1kQ7XWAghxj7ZTenyoZ55B7DecIP/GQdkuQE4P4N2Yj5BO+wNuZkj5qACdr/Or
	RidAmXxtf/9qsXMNqB0xIPq4RVWgabE+fud+BKYCLYIcphFr6/N/dk2sCWI4BgD867HvaY7Qf6A3Y
	i22XsXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72C-00000008RqK-0bkH;
	Wed, 12 Nov 2025 09:21:00 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ726-00000008RnR-3513
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:55 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2ad29140so272853f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939253; x=1763544053; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=;
        b=HqC+iqmR9Gmpk/RZISaHiKCglnJ2B9/KaNZ1wvU5t+0oEKtyxFr8wc3Q0eUnRsceGh
         5IONXMl1+7WjFNk/s2seuztorIoCvhfzcndIsbE5Oh7fw4el+eyzE0AWeGccumyxN3gC
         YyBnYHMHkkMfV+CNbV1WTB27olRIQwgNARBCVIPkz8XSlsKgi64hZ8xRqG5NgCONet2P
         YNOkvc1hhUXfCgbi5q3DUWWHvyV5TCC+0HEGmeUuO10SocZPd0ufGaYAeNR5lMuEUaMC
         B5SxLviwwx/EnqXHnR34HOV3GLUR5mTJA7DAo7qIgHA0By0yFSzyBu5nFVX+SCYYn2x0
         RSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939253; x=1763544053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=;
        b=Uix1cNVdnZzszojmH2oYyoIL556w5ZYQDsJ1jS1DPaCXsAJmq+TyuX07CnTXfePs92
         FttU1khZ8rjcz33Ro3suOE18Ykf9gJnVomeC/XpfRYq5vcbg+yK4d+QHcMnQgZpp8/aS
         cFfodtt8YCwzKlT7r6S76HlVcGwX5hSeERlN1Pbfs8RFS9z7uEUKZcvJQ+6bihY/gE4E
         7StVfrlF7iDXu639R3n1jJ5T+xdM5/XF5rFL9xph0Mi+HIibk6S0mtYjh7E9dE+NBv6x
         FbimWXL+sXwytrnlKMyPg3vGpAZjsxMJ89f8lmqo3veLJTfIO9GTOMuAq0NZncN6dkWv
         CAxg==
X-Forwarded-Encrypted: i=1; AJvYcCV8SXn4g7frOF1yQxGWP6qA5QFnGIBrnugDeLjX6Yc3bZRuUr3NvNeP+xyMJePIWeV+ukjB3JrEWm9M5l5I8ODJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/6MLEYZ32QlVeHCq69MSV1xv5ID3nXsTq5o1TRDAErTKWt3ys
	ENrlPL3P/u4dPeg4g7Q9jx12SEbUzI/LH8nUFp6niNKMVeTMqgjEV2/2DxY88v74inWJHfwA7zg
	hPQ==
X-Google-Smtp-Source: AGHT+IGUxVjjdxFwwNK4gZXP4qgE13aKlaUArWEuRF3RKto04rT8yPc6uk6hvts3WN96BEEYzipP0OdKrw==
X-Received: from wmjl26.prod.google.com ([2002:a7b:c35a:0:b0:46e:37d6:c1a6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:354d:b0:477:7d94:5d28
 with SMTP id 5b1f17b1804b1-47787061cfcmr17563335e9.7.1762939252639; Wed, 12
 Nov 2025 01:20:52 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:44 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-2-tabba@google.com>
Subject: [PATCH v4 1/8] KVM: arm64: Fix Trace Buffer trapping for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012054_774518_99E06339 
X-CRM114-Status: GOOD (  12.50  )
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

For protected VMs in pKVM, the hypervisor should trap accesses to trace
buffer system registers if Trace Buffer isn't supported by the VM.
However, the current code only traps if Trace Buffer External Mode isn't
supported.

Fix this by checking for FEAT_TRBE (Trace Buffer) rather than
FEAT_TRBE_EXT.

Fixes: 9d5261269098 ("KVM: arm64: Trap external trace for protected VMs")
Reported-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65d..8d06a246dfd1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -117,7 +117,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
 		val |= MDCR_EL2_TTRF;
 
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
 		val |= MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
-- 
2.51.2.1041.gc1ab5b90ca-goog


