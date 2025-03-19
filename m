Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884FEC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJsAUn2tJ/N0GZBEAi0IEG/qBVORqD8jC/NmJGn5En4=; b=T75KJrpPJMPE1AmlLhmm2jvu7Q
	FeIs0XDdKsGIuVRl5GhWr+QOtuDdVbSln8hVrWJH5DbagryfteOyZEOtUWZDoOKziZdXAzHKfcb4A
	WRhyiV6tc5gOXTBbGU02fwIgSg+tNiB8zX9GrD7I9ftT9sZG9InCJCFw1ZwJEhz14/h2no+0Y6fpP
	r4J5pfwpsgi7E5plwXVm5jQ70wPpXUNv9BiW4PW6n5ppGrJyNe8EbiigDDj2mT24IwcOUdlWThf7/
	7f+U4r9U53yA05h+GEvmvOqPCcScT/PgePUw1sWLbuZRbp0AsKKDC56wWG+QOQYAfgKtCMtmo0nE0
	wxcoqapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turs2-00000008sGU-3Djr;
	Wed, 19 Mar 2025 11:46:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turlN-00000008r7W-3kT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:39:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224100e9a5cso129204605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742384349; x=1742989149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJsAUn2tJ/N0GZBEAi0IEG/qBVORqD8jC/NmJGn5En4=;
        b=jWfbDOmJskR7Xz1sPGF9IWAqj4HYcXxaf0O6p1UdL/KJU9HHKmN9IfrnQFsVV5fp1R
         1OvzyPDnsnPoQrJxeLgRENGHke+wC0wmidyJ/HvXS49nAQR9y0RKk78zn9HHw0vSGxix
         M2ejKn3TXEWQY2AIul3N2AShgrumt8SbjWnufAB34ULBPp1KtizJ5KJzyeXNgJ6sOtKi
         NpW7nJ/4fyTEwmRo8WvDcRqk5rPp3iXgax9Ws+VnwSZ2h70NN9ckkk2Gwvf47WamQPj6
         EkEOH5C+X3WHiBsPCi9yiRAxWTMDIvlgplci4Y6ozCGcOSj7hezM6BxIxMAyyYD5lzf2
         aEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384349; x=1742989149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJsAUn2tJ/N0GZBEAi0IEG/qBVORqD8jC/NmJGn5En4=;
        b=dNP2FKgBX/4mTDtQo5HMqt2vn761ICs0ppwGUFwdDNr3ABWhdS5ikFhQbD/G3CQTfu
         r4aGFErq5QDSeUj9T7sLE4zmq0PbFFhoza5CKz981Z/v6NHa9AfwT/Py7WGRYzrG+5JT
         a+kJLvkP9aLgC29W31LeGRjCe3QMZpSMaD4ODmbp9mizBaVwtBBDMF+Jsc0F3CKP3oIE
         jIhh3kwSfWE1a0YvgZ/KnwMcHHGECXoOV1speM1n+kzDSafAy1wj3TxmfL2VJhmnxIOC
         Fk6rN4OzdS0srNTdQ0Qj4kYo8XM6jGgp1tHtLSWjiKtTwBBhoamTn6Im5fE2WnQGanr1
         XNLw==
X-Gm-Message-State: AOJu0YwIbHfLz3JXZVaXFU0fcyn+1lA6pBuUpfcWntmlh2+SXr7x+fpz
	Zh3E6jXHCrAl7uMM8RnahAL28tumSX2AcaC2SOuK20pxJyoih7YQ3bUZq7UevrY=
X-Gm-Gg: ASbGncstYN32CxKnfb+QPYskQE6WDuWEVlY49cuVHHAs5kX8X0DT2gtIrhV4KAJJbfn
	BFXd862Q5H/774QplqYIDSXw5ymhC7nCUufH06tyVX8RIhJ/ZDRCdOKTTuKP4OrFY2wGQJZErDo
	S6tEVFglEonNyVNDMI02QRzcRci+0fve/MRAiiXsu/g7siavRIq2rSclXOrRs5WE9ySYtMjN2cT
	AW0vRThM0GXpbGrL6p2LzOcHCeSSApYFBgczaKWpJzi1JThkrgFojqRUK6pzUKG2/BRPp3hCW6m
	2dSaT6v+P9dmahdkCGsI0fpvocxVlqM27t+LAN8oh0y/sJlI
X-Google-Smtp-Source: AGHT+IGfWVdcLoiaUgIHbjMMUMvA2v0l8u40e6hMqGpDW/wkNrA/pWWYq1nd4axTz9YOadVt/J2Xdg==
X-Received: by 2002:a17:903:32c3:b0:211:e812:3948 with SMTP id d9443c01a7336-22649580acdmr35244335ad.0.1742384349386;
        Wed, 19 Mar 2025 04:39:09 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c68887fcsm111347295ad.39.2025.03.19.04.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:39:09 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 19 Mar 2025 20:38:56 +0900
Subject: [PATCH 2/2] KVM: arm64: Trace SMC in a way similar to HVC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-trace-v1-2-0fff03204efa@daynix.com>
References: <20250319-trace-v1-0-0fff03204efa@daynix.com>
In-Reply-To: <20250319-trace-v1-0-0fff03204efa@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043909_938281_4028B98A 
X-CRM114-Status: GOOD (  11.95  )
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

KVM handles SMCCC calls from virtual EL2 that use the SMC instruction
since commit bd36b1a9eb5a ("KVM: arm64: nv: Handle SMCs taken from
virtual EL2"). Copy the tracepoint for HVC to the SMC handler to trace
SMCCC calls whether they come from either HVC or SMC.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/handle_exit.c       |  3 +++
 arch/arm64/kvm/trace_handle_exit.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 512d152233ff..087880b645be 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -55,6 +55,9 @@ static int handle_hvc(struct kvm_vcpu *vcpu)
 
 static int handle_smc(struct kvm_vcpu *vcpu)
 {
+	trace_kvm_smc_arm64(*vcpu_pc(vcpu), vcpu_get_reg(vcpu, 0),
+			    kvm_vcpu_hvc_get_imm(vcpu));
+
 	/*
 	 * Forward this trapped smc instruction to the virtual EL2 if
 	 * the guest has asked for it.
diff --git a/arch/arm64/kvm/trace_handle_exit.h b/arch/arm64/kvm/trace_handle_exit.h
index b0308d95304d..a3a0e0a46c60 100644
--- a/arch/arm64/kvm/trace_handle_exit.h
+++ b/arch/arm64/kvm/trace_handle_exit.h
@@ -46,6 +46,26 @@ TRACE_EVENT(kvm_hvc_arm64,
 		  __entry->vcpu_pc, __entry->r0, __entry->imm)
 );
 
+TRACE_EVENT(kvm_smc_arm64,
+	TP_PROTO(unsigned long vcpu_pc, unsigned long r0, unsigned long imm),
+	TP_ARGS(vcpu_pc, r0, imm),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_pc)
+		__field(unsigned long, r0)
+		__field(unsigned long, imm)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_pc = vcpu_pc;
+		__entry->r0 = r0;
+		__entry->imm = imm;
+	),
+
+	TP_printk("SMC at 0x%016lx (r0: 0x%016lx, imm: 0x%lx)",
+		  __entry->vcpu_pc, __entry->r0, __entry->imm)
+);
+
 /*
  * The dreg32 name is a leftover from a distant past. This will really
  * output a 64bit value...

-- 
2.48.1


