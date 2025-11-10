Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C089FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=; b=cMy2Ikxye1sjX08l1Q0AUQaMj5
	h9bPX5Z89cLlZhAzOGN8WXWT6D2aWBRfhhoevSCUu+UoF1p6FHk5leGjNx7vLsPISCFQAZlbftIcd
	TMcMvcbwXm5rDF7CB+3arQ1ZR7r7mJNFNc6t1JJxZu4Bdosu2QNp2sdBF1e5v4kDc2a7HxfXCmPGZ
	RY5UvHPYV3AUw/harDB4fWavWg0MXSlzEirsk8bfRrLfKQ9zhOE/9Z2LaHH3qJGTCWvBjdjDj1fkO
	j4d1huD0Sfw1PArmhaxM8WPK87FtoIm4EV5BgXhgbSRW/3eZ/vswuv1+mq4bTOx84Y9rc2ON7424o
	Fn49s1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD9-00000005Vrt-0Iyz;
	Mon, 10 Nov 2025 13:45:35 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD4-00000005Voq-0GNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so22672595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782328; x=1763387128; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=;
        b=wLvSa4/SqDsyhzzwXf0uH+8LQswkDm0zCwiX8x2Z7bd9V0oodQ0wiQIbVr75E7ZF6C
         uwfbyS5ypMMO/tivxezsfJy5SAYxFJm2GgR6nsccVnak+PQKmkei5ECN1taBEkNfJAh3
         qzqbsgNAwhZaHIa4Szmz+HX8iTCC9+IMiYDrjyYvCen6554ql7b2N1Onws0lUJzIvBz8
         +/JbLdQ0Db7KTQrLR4ozVJYABIj8F46in342k4NYno7nzP6Mon9KreSefkPC5P4cIXFR
         EolgCyFTwsVtjmXPwlwynG+02NZXZhKjN54d8k9OOGPchJHCUL9huRt6FKYzYdprPc64
         c9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782328; x=1763387128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWYzkbp7pgBrTyt1NisY6LsxXizq6AqdKv5W+aeRvmM=;
        b=ZIYBMc/KyURbSCU+B/8kJf0Q/k40ftf86zN7SI6IzZFgMrcjuDdTrZ48xBIfhynKu5
         EoD5GauIl03KhJxMlYLQNVOhVip48neiwgs6LkYhZF4t0J61GMuglZM1fwPzeRBhpj9H
         gSNCZDPuHUdSp1zrQNNFXBp6XSGjNcXOKEoh7iPoflF7P4v85oyl/GU8o1Gviesb/sVd
         rwS20R2Ik5Ji15JE1P31mJnejbEFzHZ15xd/vBnn58zl/hevJWVoe18szrGHlKnIPgMz
         TmpWIFCDlh5MTb9+MwBLy85zDDwkaKynUhM7xkEgQHoWvVj2nsb2hrBR6szBtZe/xeEC
         D4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlntzNkjph0Y802I3uWY70rnzH5+HptMjpo3T4l+xEB0Ucb9vJBN4VQlZddRW11X8vcqK8Qp/6yCupEdc5kIHc@lists.infradead.org
X-Gm-Message-State: AOJu0YyP+bW+jl7eoXGzOS7ou/bO74hzaOEzr85eax6zhtIQvQCFBtqc
	6K0OM1IKTfZotMrRkcGcb0QCdXWlenSUnjAM4pE0YuCv/FnHSxYayvpbID10fzbcr1K6verhI31
	Sag==
X-Google-Smtp-Source: AGHT+IGfU1BqA9eNhyFKGEkjRPjnqWGxP1+pFP7NhnoASQHOzBziL/8YW7i3Jw6fiGBSzdHa2GQpOJgylQ==
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:477:55e7:9973])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4704:b0:477:a9e:859b
 with SMTP id 5b1f17b1804b1-4777327cb50mr64673825e9.24.1762782327801; Mon, 10
 Nov 2025 05:45:27 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:18 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-2-tabba@google.com>
Subject: [PATCH v3 1/8] KVM: arm64: Fix Trace Buffer trapping for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054530_108166_46A1AAA1 
X-CRM114-Status: GOOD (  12.78  )
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


