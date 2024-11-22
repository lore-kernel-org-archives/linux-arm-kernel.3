Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567A4D75E27
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gur2xynCjgcWp41HkQooTRKN+u+15be4XbuVrf1N/Og=; b=E/BSVwrcJoQv2K6ff2/w+NtllY
	FUdcXZ780To2B2IxaokSGv5s3xxtMWy4ZkQ08tmP0KFa57f4X0QL6tYtpLPLTPFx56mFeB/5FkWoc
	wurNzLOkCkoYGdgaD2rcoQuQjDgmMT9QviV6F9wylZQjNw9nBn2utf4coZyS0PXulnR3DQub82ump
	ZGMPDXDMycOUB1dt7Q8uT3P4/M6mBbzjaTK0F8L+0DcXrzhFDmgh37eDVladfVLBGo/HQQI7QENZ6
	CQNhzOUUGyIW4BDQBU5pRYlIM1A9C2q38/Rhby/WAt1QO//bXjjD4SKAPo16nL0Rpqp7MHhd+LGK7
	dLJxxMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERYG-00000002Jyf-3Xrx;
	Fri, 22 Nov 2024 11:10:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUf-00000002JQq-3ZaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4315e8e9b1cso11199675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273592; x=1732878392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gur2xynCjgcWp41HkQooTRKN+u+15be4XbuVrf1N/Og=;
        b=2puyc1Rw+OCzUYH1KEtM0lXx28Tc3loG83ly36D3H5KjyKnIYm/BIMXV5fUp7JNDwm
         jXqZUlcOD0deyyuyTs/LDwKGgyTOnKPBX51iCXuLNK4L3TEPDdrNXv3iT2Ve0dDzpixr
         CmQ6KxX4wHu9zBeYqpvrAQzuTcVSHWXvxCnmB/Jds1kTvveOe4ReDAjjPT6Sx+M9wI/u
         9/3Ri/lh6E16qS8iU8XoxmcuhfUtE4TOdi9TPLdVlVbByXg2ilRaE+UYRPp5my5CyEhv
         rIVIhBiQ1zyjpCtvaDEdUCU230STwDQnWVHEgqqKtsO4XwqpO7/ZDZC/lKg4aPJNiz3u
         X9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273592; x=1732878392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gur2xynCjgcWp41HkQooTRKN+u+15be4XbuVrf1N/Og=;
        b=O39GzW8R2TCHW5n9w1+1/N/x1hF8JGlJVsKMZLMZ7gx300MiKizybmHeWzPIj/3E9x
         R3w5zUTlVrXRoeKpSgY5KRsJZS8RDa6J3LXtYSylJtIQAcRBEgUbAPUWwBG9HZKGxVTT
         GBCxaHNx5AWyWWVSYJaAfPDWd2YVAU8Fd0gtJH37GOLBE0nvRJgBwyo6FkmQvwXUM8Z7
         QD+yZhhOnhlbX1LRIy+6Vzf21DK805vs52LmqJCytG6ZTIlmHIr70idPLuYHAhE40bMK
         Pg0c5QWr8+x3Sjd9A1o2+4OaoyuY9rqgY2JBSy9xC0Fv4yVjbBGcubofoBfqTLY86Z+B
         NiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6RlBrfupDOn/WT6gqLMCo6jYlWmPOE1K0zL06ZZdnNIOrTLGkwqATIsXXN/NfZGFIua/05dLJA1U9imu/yq1@lists.infradead.org
X-Gm-Message-State: AOJu0YwSgjc1QDhgxWA3gjFleO2maa/X2dmpGOTx7e3bpV2zlMLMy+iM
	mLqHLYThVuMX3gs5UriH1qR20OCsnfIrt7SWt9RboYhIzlCVkUUxgpU+7rilPnxqSEb58ff4yQ=
	=
X-Google-Smtp-Source: AGHT+IEGR5iaos9a96LoeCuq8AX/zU97pwwRDaEVQhWXXwWDVUaSc8yCOJEzvYtzi12QNeFZMM4NmTsDZg==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:4594:b0:42c:acd5:c641 with SMTP id
 5b1f17b1804b1-433cdb1836dmr141865e9.2.1732273591798; Fri, 22 Nov 2024
 03:06:31 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:13 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-4-tabba@google.com>
Subject: [PATCH v2 03/12] KVM: arm64: Move checking protected vcpu features to
 a separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030633_900707_55D23C90 
X-CRM114-Status: GOOD (  14.52  )
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

At the moment, checks for supported vcpu features for protected
VMs are build-time bugs. In the following patch, they will become
runtime checks based on the vcpu's features registers. Therefore,
consolidate them into one function that would return an error if
it encounters an unsupported feature.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 45 ++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 1744574e79b2..fb733b36c6c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -178,20 +178,11 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 }
 
 /*
- * Initialize trap register values in protected mode.
+ * Check that cpu features that are neither trapped nor supported are not
+ * enabled for protected VMs.
  */
-static void pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
+static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
-
-	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
-	vcpu->arch.mdcr_el2 = 0;
-
-	pkvm_vcpu_reset_hcr(vcpu);
-
-	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
-		return;
-
 	/*
 	 * PAuth is allowed if supported by the system and the vcpu.
 	 * Properly checking for PAuth requires checking various fields in
@@ -218,9 +209,34 @@ static void pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD),
 				PVM_ID_AA64PFR0_ALLOW));
 
+	return 0;
+}
+
+/*
+ * Initialize trap register values in protected mode.
+ */
+static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
+	int ret;
+
+	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
+	vcpu->arch.mdcr_el2 = 0;
+
+	pkvm_vcpu_reset_hcr(vcpu);
+
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
+		return 0;
+
+	ret = pkvm_check_pvm_cpu_features(vcpu);
+	if (ret)
+		return ret;
+
 	pvm_init_traps_hcr(vcpu);
 	pvm_init_traps_cptr(vcpu);
 	pvm_init_traps_mdcr(vcpu);
+
+	return 0;
 }
 
 /*
@@ -417,9 +433,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
+	ret = pkvm_vcpu_init_traps(hyp_vcpu);
+	if (ret)
+		goto done;
+
 	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
 	pkvm_vcpu_init_ptrauth(hyp_vcpu);
-	pkvm_vcpu_init_traps(hyp_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
-- 
2.47.0.371.ga323438b13-goog


