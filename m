Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+7xBf3XhJMHfpZe6B0obtpZq77mLhIssmTOLfcblvc=; b=z2kBifPKfpjxgssqFkdwYGFdP6
	EejHQx53Suwv0Dgl9D6FcIZ+s4lXvQUsHkxn39PZuAYyuVU7Ime9+sEcy8GpqvgwCU9ZVmJyCNpZH
	EVRjbeBAncPQ6wCik/CRZrbRt4FzUubNTGemzNNuPxxKxY+dh+sTQALm4341AgsUjd3c1o6LkkB/L
	4UWrhD0qEyb2WL+uCiWjDvllS8mDOh3g4bKqfDCAEVdFeUjcJguvsJ6rGcnnP9XC6v8lPS9DYmLsM
	9QLt2g/jROxvcoLI4mkVQEZJi87nBWyb3LVZKuRSLmoGBY5Er2IKrGu8WNkebRA7nSHE/B2Pnmw9e
	q3A9ELZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z68-0000000EeRk-3fSC;
	Thu, 24 Apr 2025 16:06:48 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLQ-0000000EKrp-2Kve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:30 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso1149226f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504066; x=1746108866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+7xBf3XhJMHfpZe6B0obtpZq77mLhIssmTOLfcblvc=;
        b=gkVAvhMIGmiTKTbaSx3WqGC+h2wfYg24iEGkR2TvnnXzPaO38vMlRB/0IkF1R+fN8Z
         YDd6q3DmZP8nVY1NjWOAgvxIa3amauKchkQ5FXNPWwH3M8fkHGLjg4S6XKA6++8Q6lpK
         ytA/+vb3qcOTfXPbaRWNE+Jz50ryZx1TpsFXGRADKiazjYwaPdbY7fAULFP6JRvLEy5Q
         /Xl551WScxw3gG8JchlSc/ETEM8zh4Gat3VxUpchsJVXqrPK6V32BKnxMtYQW40wCKfu
         RVk9rNQpyxvQTa5xtiAKgmrK4wxyOvBODgI332T5Jgh3f4/vbGgzDnE+lK7foKEdB60t
         qdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504066; x=1746108866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+7xBf3XhJMHfpZe6B0obtpZq77mLhIssmTOLfcblvc=;
        b=Y5LMrWOig7QNBm6J/AEAeQ3JvkJjk3xX2AUAwTNpL5e3LVQ1ryYz8Yb+oZbc0NNZwC
         bBEKfySlatBj+VyMJHCMS/4+9zx7pL/wv+p2oPabbgC36g9HlA+/U37leaac28/nYzVA
         NcOEHKQgvUTETtrcY4ln4N9FG7bn3Ifq4f7ssJZV3FOGu//dec5IHZA8iVyP3EgDcuuG
         FhQraCWjHUQRrGv16F3A0+agtqpxC0y7SIRAHVWRGSwtTLkb+NzrX8Ty5jXbptmePyK8
         O26DZejZfjlnfrpGZTl9Y6l5Y1Qsk6XUXcRYJ+ad4FvziwV684D6favnBG+Y4loTgJs+
         Onlg==
X-Forwarded-Encrypted: i=1; AJvYcCXs4tjiMVP08NTh4NFdeTcOmg0vPEEIQB5o5VUqt8wLEqKtxt9Md2dBPcfkK2H2lpdwLuIXNFqTo7IIktQVvmzD@lists.infradead.org
X-Gm-Message-State: AOJu0YxV+mr+ABpEulYs+J8zgEfI9QHy8cSOtWSYG2NJmDXqGSCPeSbE
	yyuHLRmBjTMPl60gBS9KHYnBcJ5FPnVs2Ymqd9y9hkGuxpP4eMU6YJSZpbZqM3M=
X-Gm-Gg: ASbGnctHDJdlcsXamnZIG/Gy8SC6KhS8+Ar2OYKSlwSiBTapRpJWWVN8ECazo65UZSa
	Iu/ouJPe+Cb7lvHUnbOc6AD/zK3jfaw00dD60DJ/xWJq01Nuaqcj5YIs1XHZHnxwVu5BN5ZMZBG
	Wf8XUAsQDzGpd18iB+7TCPIHe+lHKWWMg/vpW9/u9Ttctq8fBCvpQn3KKAwMRUtguTTp4eD11js
	PQKCJgEjE58KMXDqwvEtEVrVOeU4SaB0ZQyr4cp/+2u40DDQOT7mz9ukMxHl6qckyfaqKf79ng2
	R1HDJ7gSbZiSBdn0JqSreu/CJ5izcuRbAzulUaGkVxGkc2Vmr6SAph3RQdWJ6oIDLowHIFyHGdv
	tTRxYLOzrH3t3Jgws
X-Google-Smtp-Source: AGHT+IHRjNQ9hktsGOI0gDbs88pFfwmyof1gAXg0Su1amTrqhLAxn7c+kspUyHkoAKmkYrrR9nwrhw==
X-Received: by 2002:a5d:48ca:0:b0:39c:1257:cd41 with SMTP id ffacd0b85a97d-3a06cfd462dmr1866395f8f.59.1745504066490;
        Thu, 24 Apr 2025 07:14:26 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:26 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 31/34] gunyah: allow userspace to set boot cpu context
Date: Thu, 24 Apr 2025 15:13:38 +0100
Message-Id: <20250424141341.841734-32-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071428_593815_C22B3314 
X-CRM114-Status: GOOD (  14.58  )
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

Allow userspace hypervisor (e.g. Qemu) to set the context of the boot
cpu. At the moment, only the program counter (PC) is needed.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index e8037d636e8f..df922be2429e 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -1703,6 +1703,24 @@ static int gunyah_vm_rm_notification(struct notifier_block *nb,
 	}
 }
 
+/*
+ * We only need to set PC to start of kernel
+ */
+static int gunyah_vm_set_boot_ctx(struct gunyah_vm *ghvm)
+{
+	struct kvm_vcpu *vcpu = kvm_get_vcpu(&ghvm->kvm, 0);
+	u64 core_reg = KVM_REG_ARM64 | KVM_REG_SIZE_U64 | KVM_REG_ARM_CORE;
+	struct kvm_one_reg reg;
+	u64 *regaddr;
+
+	reg.id = core_reg | KVM_REG_ARM_CORE_REG(regs.pc);
+	regaddr = core_reg_addr(vcpu, &reg);
+
+	/* We only need to set PC atm. regset is 1 */
+	return gunyah_rm_vm_set_boot_context(
+			ghvm->rm, ghvm->vmid, 1, 0, *regaddr);
+}
+
 static void gunyah_vm_stop(struct gunyah_vm *ghvm)
 {
 	int ret;
@@ -1790,6 +1808,12 @@ static int gunyah_vm_start(struct gunyah_vm *ghvm)
 	}
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_READY;
 
+	ret = gunyah_vm_set_boot_ctx(ghvm);
+	if (ret) {
+		pr_warn("Failed to setup boot context: %d\n", ret);
+		goto err;
+	}
+
 	ret = gunyah_rm_get_hyp_resources(ghvm->rm, ghvm->vmid, &resources);
 	if (ret) {
 		pr_warn("Failed to get hyp resources for VM: %d\n", ret);
-- 
2.39.5


