Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5637AD41C1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqqmxcdVkzTCOajtcgiZXftpHXD5dGukksoxeGfTga0=; b=LKES0/lT+TRLZlSziZj2p3Elrd
	r/zWmNP2y0GB3lckIpo51xbf834xYdvnouAsFNdSrpKoDDooUSnlPb+tkfQ33UgYnQIhpZceHc2S4
	1ABBt2L7YRBeC8Tu0aIgCxoDxe9esTVm5RmlbfiViU7HGkRsQiWAb2w2B7rCNLHLHl251PYPgx9f9
	Hl6Y1mWgIXxe8pYKI2EHQbzKBpFPRxpAZzhtvc1vnc+uOH4JMNO9hpXAt5zOHKpMRzEZsiY+atMpD
	bH5nONFqvY9gMcFw8GsQJB9h4gxxweK0SMnfkPH9dE/1jucoTMotW3N01iZ07bsWEmjJI0ZeBPlkf
	Nce7ezAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCZ-0000000GUox-2S0X;
	Thu, 11 Dec 2025 10:47:15 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCX-0000000GUnE-3ZFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:14 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b767784598dso64085766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450031; x=1766054831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HqqmxcdVkzTCOajtcgiZXftpHXD5dGukksoxeGfTga0=;
        b=kEILJZC0UzfMLi8cWQ+1sZkJTsg00vJJWmJt+QdN7RnUY2bUNRv4DGZ+G0CS0qdCFp
         bbFVqINZNtgGyOdJN3kVx8kMpf37Q+4830l+N60xk270cqtIbqwlJVlDZ3Ghh6ArZY7O
         yFXlw7sys7J6/xQPRn/G+YqjeKqXs2fxoakFlTiVm1b2t6kTCQzDGwzvFJie2mBWlB9U
         FjtsD4pDGkT3b68xhunnlAW8Qcl2jM71L8+PPK3DaxEZ3RSSm/dn9SH7szidFIe2+cxo
         GCzHoNSSB9gpdcXNexrliQYrsCPv0C5IQqEb8+FGG2qbM3ytzxLqdh5wqKDzlawUqOOM
         E1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450031; x=1766054831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqqmxcdVkzTCOajtcgiZXftpHXD5dGukksoxeGfTga0=;
        b=AF4oPiRHhH5fdrOPRz4xpq/MynxxBddOicFC3fHeZqCL5nC3UVcUci5SzImyx/C/MB
         e5y9vru/m81GuG1Vv3apxQTkzNwurMJGSws9JqOmbw3I+kaEl5k8ksChZ+oJEkYJPg5q
         2xZhVp5qEpaxVnIclgsHzAYnYlt6+eRskuHdGVCaVF5kNu8Ivp5X45H53DX6qf/Up4k3
         dBQiu+65Q1z8ajezOCTLdATNYbWgvNy2loBbK/bjAwpRTzl2l3vcT6B40TwlRqX2o0Az
         EqyoWwajs9trBSZbVBJOjSezP/G7xpqgqDSpSKjMFeZtflKcG8tf17qd1nAtfMyc7Xs0
         WgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXogvjn+oaikx5Hzx7inEAabQW8+nEIDuwkZ+NTXOosWKbR9FmXtPawfZFzbuRa7o0gQ/CZ1OxZwxLLqXP2itS4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd2JeKDpZuQFPRZQ5HAqLRQL4Xavlj/vfA7U/ezCSJz8AnRtM+
	SiRakAfnOfhUEXUY2wpRHKb/19NdzljbqxqktTCKrGymFG/kF7kc7c40LyHA8Ji5yOwiRtUlJYT
	Ikg==
X-Google-Smtp-Source: AGHT+IF+0VU7+ANp0QfeE8zIM8Vmgpcs4f/A+ibyHzS59B8VrSVBA5mSFGH+wSJ/LBwQMJHzgebSqsDiDA==
X-Received: from ejdcx5.prod.google.com ([2002:a17:907:1685:b0:b73:7b15:46])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:1c0a:b0:b73:758c:c96f
 with SMTP id a640c23a62f3a-b7ce84853bamr566099966b.52.1765450031334; Thu, 11
 Dec 2025 02:47:11 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:01 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-2-tabba@google.com>
Subject: [PATCH v6 1/9] KVM: arm64: Fix Trace Buffer trapping for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024713_893110_E3F07ABF 
X-CRM114-Status: GOOD (  11.84  )
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
2.52.0.223.gf5cc29aaa4-goog


