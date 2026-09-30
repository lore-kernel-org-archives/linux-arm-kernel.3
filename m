Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5B7CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=; b=aKcYMCvF14eT7kUfCrPxhjAdu4
	82J0w84acFb3vn+l3FFsRNJTbvOqyEPhnrW5Y04jlP2/uBnvCF7uYk6NF4ibTlni+XLaW1vcWmPan
	wbaNkkNnueBfvsFAloNvays3wRZM+uwpBjSCPepd0UeoheyehxNp5uzQD+7mLogrRRnGZsZPNS63D
	vfqQ9scq1GJURbO22yd/rGvwQtSn6HEiBAZ0db54X5CMPLwwYWblBPDFMaY+fvBFF3+m9ewSVSm79
	7/m2qkNcib8JoxHE/aUAgwSPx5TJG+QFMVbMjDbTJ5b0FKyy84eY+B/Zp95baH8lb2/Y4HA8covDb
	HGopmF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLJ-00000006XJc-1NJ7;
	Wed, 30 Sep 2026 15:35:37 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwL9-00000006XGD-0JRa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:35:28 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6abb3bc078aso5535615a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782524; x=1791387324; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=v+a+1HY1p/uSRvefcYsHG3AGdy378lA2yj8YhvJ1bdsgPVHOxlaGyAdHx5LHk482A6
         ym1ZlEEryUYqnmTWlpi2F1BRT8dyilworVpGZP8gx7Y8uwx+OcV7fbynqMEnUo237mhB
         5S70we4EAosb9vqTQMbdecxpyn5CdBn6vvtGHFGZSSQXRSsUhJpEbPBlyFmbTsymsHm9
         RuP5ZDXEyHyv6wy4859eeBZE7I/Rzp06efZq5RoQLN4YYyxyqUpPvnHIF7/PtcCX4bjt
         vk9Nnwyy9B7yprluIu9iQ0fMeXLrhPq33rjtyEkZonbdFiQCFLyJHtZYPniUYzLyRjr5
         wcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782524; x=1791387324;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=cT+d/hb12f49c36VuXFhzcf7YCcITjWBd+HzOi069upyufWcXyBHgrFUfHpl/SGd28
         xGpPKolFIHkNDUPZ0bbebDZFuqEfKzpRX+Sq61vCMl+cz9lMoLc92q8t3pZTHtr6Y/jd
         2F5Fg8uayF6g2cPGD/5OyLLexlvoTNAFrFtJZmh9/c7xSfG0VvqSDHt+d3yBhlvv711j
         zDmN6+ns2yFz91utR3RUoC09G0ETqK0dTFUOrodt2wDHFHXuXIYdpNX1yC3nReEueeYA
         G6QAhtKWsgIo0DC4GcQb0mkAttuYDafFWdl+iI2gF/31Eq5SanOoqG/Jo0zyUllDBhWP
         44Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwRY64CFA+/gEZgIVA5yErvmhEh8l+Jk4SonFRs6GahkNQgY6LVnvWr8fgE372RH6Y0ZLrjoU+YuqnEeGbys1sU@lists.infradead.org
X-Gm-Message-State: AFq9FYJFNDyOnxEJJ3o0TS5wEj5cTUW7x90LUI7NDya+mIVKh0HFWLna
	cSwcGxjPRPoG+prodHmniBCFK1SGZwkhPb5TfHbuDQWs4Qg3+BeGpByv1kn5JaptRLb7iIab9OB
	RkZJafKE8oQFDpDIwXUQQfw==
X-Received: from edqs24.prod.google.com ([2002:aa7:d798:0:b0:6ab:17a:73c7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4018:b0:6ac:afa3:6f72 with SMTP id 4fb4d7f45d1cf-6ae19864ee2mr1595600a12.5.1790782523857;
 Wed, 30 Sep 2026 08:35:23 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:35:02 +0100
In-Reply-To: <20260930153505.2144559-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260930153505.2144559-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930153505.2144559-2-vdonnefort@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083527_130640_66797DB9 
X-CRM114-Status: GOOD (  12.29  )
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


