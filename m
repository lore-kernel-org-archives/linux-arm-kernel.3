Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F08CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=; b=Og5I+vL1eEQZoTjL5KFB9mcXxY
	0Dw7G5StT6S5V4MfAj6AoUwZ98/u+v05xIIXU9Y13xa9fBGjnPRvAujttj+EQ54riekXo3xVOp9Vf
	Ungvy2Rtngvb7wlhkCzRjo1bl8WPCVAu8iwAvRAtBR5CYpiXa+9mQaISnZKJ06uF4AyGipMUG4JK5
	tKjoUSV4IHXOujR6VvmSPe8bckdju1ZBkdvGXJ8D+VDgmBssCIWA3sv8Gcch7TBh8KGEu2vBUmMhb
	xTO6Tib33L3bLNHAWmw67T9lGaSh/F3MgPIxyh5VRayAgDtrW+Z+eCJi0kqDj/RzxB8+13iSTzguJ
	fWaAJWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUD-00000008GaQ-1yVz;
	Thu, 01 Oct 2026 08:49:53 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUB-00000008GYV-02Fc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:49:52 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6ae551724a0so481638a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844588; x=1791449388; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=rbRxOPiLfnupaDzfovjub/4TgUTbqMvlQkXtrCgje0mS+NC55znsVoC2lv3TKWfwUY
         UZhCPEdZmvVUDSdf1+J6nvQ11gKx01nbFmD2JotbQZw8sM++QJGVv0X+fS9ANq3mbY9G
         F8QZigUP1gamZRyvQ6SEKNCOTD4u9OFjcjuvqvosgqOjkClG/Djs5GIUbBxQ3LS1HZ62
         SSP6jEDwuxvYBN2qaMYcuuVvg+Dw8r1EiEi1/ZvdhhVi+8vO1+JGBu80LaECuuSaI+lx
         QAOA4Rq1ifay//Ndt/tMuTo3+Yg/ESxI3R5Q28JNm1xJm/ljRy3kSCIXQ2N0u1qEOlZo
         8qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844588; x=1791449388;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYDIHbzRs/Gm97BYr5mSO7AAPaWkZ7oe9AO8sumxX2Q=;
        b=F8il2KPVAyZ0B2bPLpWUaifGD85O3pRXrtT7qswNtwPKTWyhVzKO2R9xZftCqJNYk5
         93BJovuIROskhyO+syqNmzsu75HQ2nbIPFQkYN4W3iRpPVi5vR/uhLicEE92z8GjrfnE
         Gd4sTGYXYI65F/QjQiABtMMw5lrkBl5fvjuslVJYSHYtKwV7dhoLehNL6gHnqq2PG2ga
         Qj1F4jJ/Bzw9/kxhX1P1mdnajgaIBt/dYt1UNPRr9+wTprpY2qo1fd2WJ6euQyILkrJO
         6yj3NwQkGnr/CUin6syLaZfRWpwGhjjFwDOG5g+VyG01x+NMADxJ+z2uxvVG+WRAOJ8/
         HK4A==
X-Forwarded-Encrypted: i=1; AKwUvBznY6B4F+smhAXjds5nU5KLmtnYvREqh0VtQcEYLX5EBm/5NS/orea8sxQBWvjKYydv1m2s8DqnQ+DcIUU//CAR@lists.infradead.org
X-Gm-Message-State: AFq9FYKljKhEvf+oX4pc7phrAfsSRjGvgh2rz7NSBsjNhvCF5QIwVgU7
	k3zCIpz+V+DF6k41fQWV3m74iOcK1HrGpyUDJfXwyYlsqrHoItbqF9eEulPWYSJrMmnFxOOm7Q0
	fMVeSDyZGH+lRNpYoSeI2Xw==
X-Received: from edya22.prod.google.com ([2002:aa7:cf16:0:b0:6aa:1383:f342])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:21d6:b0:6aa:fc60:60d0 with SMTP id 4fb4d7f45d1cf-6ae19931c6emr3076583a12.33.1790844587884;
 Thu, 01 Oct 2026 01:49:47 -0700 (PDT)
Date: Thu,  1 Oct 2026 09:49:05 +0100
In-Reply-To: <20261001084909.2937943-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001084909.2937943-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084909.2937943-2-vdonnefort@google.com>
Subject: [PATCH v4 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014951_057241_46D6040C 
X-CRM114-Status: GOOD (  12.21  )
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


