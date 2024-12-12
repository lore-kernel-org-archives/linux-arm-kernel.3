Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA4flaYxQ5BGtfLZd9pc3kG1NLnmtH/l93s5ei2WXOY=; b=BBZ0iViDhsmpzJdqqpRLRp0pOV
	qMOaCe2X0l27EeaEVKYN4U85LtaU2OC/keURemWwM7688P8Rc89NsFcijWVjTDedt1w29397RPMJY
	UZ3h1NW9Rt3cMtapR9BlNi2GV7alS14Gm+Hq610Co8fFG9Pt8cpE3af27W2pt9NS5fqVWBE6SYblq
	YHDh3YYmnDigqzzQsHwLoE5c/158jqI3I/6broPfOdLWq1bd9n06VQhrKLKEYlPZqRFSVJhuD2qoD
	bI2NKkOpJ8eVukWcWaRvrijHiZW55ZHBaJdcYS3xonSnk49q6wdwt3kRnp9gakibaMlXISgLPoIPX
	k4lJbN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoMn-00000001Ww9-0nIG;
	Thu, 12 Dec 2024 18:56:53 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZw-00000001K5O-33tK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:25 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa6a7bea04cso66335566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026782; x=1734631582; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oA4flaYxQ5BGtfLZd9pc3kG1NLnmtH/l93s5ei2WXOY=;
        b=mTO/yVmyff1eWSuQ0WvXWfYXWVsPrGLUYRx7TKMc6hIxolB/LQLCVTCQ5K5qqWYdMH
         hn5UO9RZn9IcoXaztW4mhsesoxq1IT2+S0UEpHIGhtyAfh6KSMzdY/eF299iU1aKIlRz
         EcSdKqOf2XQXDpWFwZb6t+7R9PiuA68ETTgpUvK4AxtD/6i9nFOJ5E86U39xuzVNa7mk
         XIq4r016eqMY7V8ITw7bGij/0VyyuaFCWs+akBohsVzR5pi0D8gHv5QhlunXXogzV8Gd
         lNYCE5dY0TZDnCHwgEYS4kBPqyLtU400zF6Ess7DnxdN0cVMwP5MFSvXk8l8N1t7C5sj
         DaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026782; x=1734631582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oA4flaYxQ5BGtfLZd9pc3kG1NLnmtH/l93s5ei2WXOY=;
        b=dvVWEN3Lf4ReGB8PcNAlQpW5L7er1bi7GUb/Za4mWp2l3XYUxY6M7H3eHIEM4jEgUB
         8FkX+gLGU2tm3PtVjjoz67cgiBhojnkAoTcz59fMpLD8sqgHlEODxd3ug8nAOkrcvTnO
         QL6ccEMdcodyNwQmzsVoSrTT44B4q2EVOf9JSJ9BhO0XeLFtEQfA/8U8xyhKCaeDLazO
         Ssk6FMkMv/MJYpIzfyyCYo/OAMFKBvOtGuWXc/pVoCTEUIrM/lz4rD6twRmJUJFwrfKt
         KvdBP7WXErpgyKmEw94KhkRknZMaymkAV9E3sTOrrr+EVLeiVTcpB2hKtg08ymaUWpCC
         nVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflMvH48M80c+xLC/fjqxbC1C2Jo3seKXBM17DYPI71SBk9C7m69rFazA5LqeFywBksrKtT2Pw/MHPU3oBiA4h@lists.infradead.org
X-Gm-Message-State: AOJu0YzDSP7V6HB7ME+J+jqmQv5Rgsoce1C/PF1rHVHdbNOF5/0DT2tU
	65HlLShMFMambwq+hs5De1Ug3S9uDJzz5gUpwBlzs+D1rpztZeFgPenkT5l4fxe0dNDvHkxrCMW
	giziX+3IZmQ==
X-Google-Smtp-Source: AGHT+IH16CwAGQZdlZ+j17KujE/o9PMEBvOMuLsm290SY8dsLy1Bla7B610srDL7eN2tped3VnaOKpJ7Tllo2w==
X-Received: from ejxj19.prod.google.com ([2002:a17:906:8313:b0:aa6:a222:16c7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:15c3:b0:aa6:8a1b:8b84 with SMTP id a640c23a62f3a-aa6c1d26981mr510164566b.57.1734026782147;
 Thu, 12 Dec 2024 10:06:22 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:11 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-48-smostafa@google.com>
Subject: [RFC PATCH v2 47/58] KVM: arm64: Add macro for SMCCC call with all returns
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100624_764954_52576ECF 
X-CRM114-Status: GOOD (  10.33  )
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

Add a macro that returns SMCCC returns from a hypercall.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 59a23828bd0e..3cdc99ebdd0d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1248,7 +1248,18 @@ void kvm_arm_resume_guest(struct kvm *kvm);
 #define vcpu_has_run_once(vcpu)	!!rcu_access_pointer((vcpu)->pid)
 
 #ifndef __KVM_NVHE_HYPERVISOR__
-#define kvm_call_hyp_nvhe(f, ...)						\
+#define kvm_call_hyp_nvhe_smccc(f, ...)					\
+	({								\
+		struct arm_smccc_res res;				\
+									\
+		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
+				  ##__VA_ARGS__, &res);			\
+		WARN_ON(res.a0 != SMCCC_RET_SUCCESS);			\
+									\
+		res;							\
+	})
+
+#define kvm_call_hyp_nvhe(f, ...)					\
 	({								\
 		struct arm_smccc_res res;				\
 									\
-- 
2.47.0.338.g60cca15819-goog


