Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29436CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=; b=xCqBxVzJE6VGTTPm6gm50ArNEu
	KIA6MDQId7Ee+3D+PwnmvUMbBwtq1eeU0DNeJVBHsGTvxx8ns4gd01Kdg5/OWFkxR9me2UCWdXzYU
	+f4/EdcEMedP16sfJ2796U03wTx+UMrAtc2uAej3pb8834dgwNHfkvEW6A5DgZO1I3qegq1q7V88k
	Mt168REEQ+cguOyzqLVPm/m2x6llerOd91JbV103cdkhnhyLkN44JIqq5afVDdvGrhMtpkQevcG/p
	zIBm7qU5PKZcYx/PG2yycXXA0ZVhaBoGJlQNEgcK7RGji7XljBsps3uD1sORm+WaCiepUho9ihxDL
	w32DoR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnc-00000009OLD-2qtt;
	Thu, 01 Oct 2026 14:30:16 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnZ-00000009OFj-2WEt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:30:16 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48b026b8133so1317794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790865010; x=1791469810; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=V8SWa9rzWHWWNWjch8uD6u30YCcesbhng+f0wIRXJiT/GUbKrw79RW1kTs0Lml7K1G
         XD6qVBu/HRN0aax5dy4hbY4GRGcDreb0QiJiGH1elIOFYo4yISy0yeFAhInVdGkLo/77
         EQpid78LdCQ5yie5RAmuLJikQJBYxYHysWBwzvqX/DJJag4CkR6b1u/18Vf7SxtKHmzx
         Zw0NZGFzQ0ANn2US+s0wCSx78578L9tpmo4fOa1FCMo7C5NpquwR6VVUF199unIAKUPw
         PsI4XNHOmld2fqBEfon2eSodDkaUbUNrrk9UwXJzSpqmXn8SxHEqd7ljRiyRUQqYhaNf
         na7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865010; x=1791469810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=0TAySCZ7SZW3gVeX8LMX8kSh36wb88GVYWdNL3yTZiSpnwWFKYdPLQ9uCD/Orjsj0N
         cizVNTIjUtcNanGJkSYk2nL85w8se7wKBZA5vK9eS5WHPnS7cDWhuvxzfOvWYyQ8Rwe+
         j1zxh1Bsl+vGrc26DSBdEooqxNIUmydKcQsTkC7B/gnuAS6dNVR8spsUmDkttFcfqce5
         0m0Cdw0y156CelMA5Vccx3kGr9vtaMKL5TjxuNgv+Ps+g7lvoxdJwIGgqVKTjG4ETaZE
         5geJcmZq7niK7J61k2AFySojKwDlM4k97Yf8wrhb7tygSJq6YVN5+YiibBvrJhIfFkWk
         5iBg==
X-Forwarded-Encrypted: i=1; AKwUvBwRx2SLf3r0vfwJ71tc0a8nMwz9BZzzPIKuxchz4HdvWEuZp2LSaxw+eSgumWbbGP7hDhX559Vyg1Y3E0Zy28vy@lists.infradead.org
X-Gm-Message-State: AFq9FYKO2jsDPhHA2wPz4xlTyyad04vJ+dJiQiqqtwsEjczRKLSdqL9T
	8gzgWgTyJGEXW159gCwv37XJFTSGyWV6l8lxTLBNoxQxCAWM9gP0tRaZqQTKCL1geayZJHPG3ib
	1RGxpptqCNlpBN9BGpS+pjA==
X-Received: from wrbhe12.prod.google.com ([2002:a05:6000:15cc:b0:48b:d23:21bf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4811:b0:487:27f9:82c with SMTP id ffacd0b85a97d-48b02538b74mr9807609f8f.33.1790865009509;
 Thu, 01 Oct 2026 07:30:09 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:29:57 +0100
In-Reply-To: <20261001143000.3371786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001143000.3371786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001143000.3371786-2-vdonnefort@google.com>
Subject: [PATCH v5 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_073013_677962_D766D743 
X-CRM114-Status: GOOD (  12.11  )
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

The hypervisor tracing for pKVM relies on the __pkvm_host_share_hyp and
__pkvm_host_unshare_hyp HVCs. In order to start tracing as early as
possible, allow those two HVCs before the host is deprivileged.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   | 4 ++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..da8b6e3c01e3 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,12 +89,12 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
 	/* Hypercalls that are available only when pKVM has finalised. */
-	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
-	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626ad..4f824b01465a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -934,9 +934,9 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
-
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
+
 	HANDLE_FUNC(__pkvm_host_donate_guest),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


