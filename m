Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE27C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnnNrRFux5qVcGjuNFA0c9YQRdgVNUximYQurTlnUC4=; b=h650+9/vPDGr0JAuGUynwXOZYS
	ytIxgNSYtFcnBvWyYxdXvIyGtgVCZOsFQbfA2nb9yVYiqoQvBFVOYnAyAOyAO94GqCA3DFvcnLJog
	0J43Jn/URDPOiFpc7oQfDgLPrTdB3VOz/gkRyVAs5Dp4WPl5WbXAcCtO3DRcswiL4cMdyEcNPn+mf
	MSRv4TdQK2vPjZ6IX6kiEfK4QFrbr3a0vfTz+2/cIVyFPKktkh+OEoAjZJZhHmK2gb2wIJPLqy0BZ
	BvCowgk1wpSwC2tHPIWq85mKluKZE8gwtBtXnlZrjfOeN7ka3j82OxFvBvnsrWGgdLvlEy/vDmkYl
	ppCUE77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5d-0000000Edho-3fo9;
	Thu, 24 Apr 2025 16:06:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLA-0000000EKly-1dSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so953004f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504051; x=1746108851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnnNrRFux5qVcGjuNFA0c9YQRdgVNUximYQurTlnUC4=;
        b=HbJyVFmX1I2A3D4cKMEunRVoSAVHGpjXMDjvTJaLW0+c8L8mqEswEairN2VsXYndBW
         iQ0mURy9TGex1D1LvZVvKE0ityjc1YinQ4Rvh5hKaubWJQdMhG/ZFOAfV301C/1cORlv
         Vwa5IInnDNgD9g/SV9xqGPhDX9P0brBlfdt7XBgaeLE81WXNi4CyXua52wt7pr/8CLVO
         IWmwM1yw6P+rhmzTxP+dB0Yz1Kh/BAKKpBAcNv4TvcpyjryN4/tfTTQeKMpLfwJqxOLa
         cztovt3fZb6CzduxIKEmQdcQi62fQXNS0XOsh8i2QmghrajXWUl6YaxS167mJ6xDJpPQ
         0RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504051; x=1746108851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnnNrRFux5qVcGjuNFA0c9YQRdgVNUximYQurTlnUC4=;
        b=QUcOPYV2Hl2RwtX9+XFGYa0U6TKmT9NjHDF0kipzRv2NF8sl07T6vIsDLOUnTd/lci
         vQ4Jv2zrgZUHbLe+a38vCyxz03ID32VvipYmp5zyUTr4ZCqBaQiuqR4j9rUk5QqTclWn
         zDJauMdQ4w99dO8vi4iXv36ofAmIWXKUOiHTmWAGGHIpsMHTAAyO9j12UO1b1GOpg10n
         tJXvnO1iKUvfEmCXaojJWUv39KPDJa10Ug7VJBHRWwEzMcvGSUDEzFfe2qzeVC6uJbJS
         04++pyhTSCYLBccsP/OtmRyM0pRN7rjRBZo9b2EIcbvK1K3N04RlNj4c5tTBeRpiZOMb
         omCg==
X-Forwarded-Encrypted: i=1; AJvYcCXH4nzjLZM9ALM6fv2txCirjYBHX3O8ZJc+wxWyCpzlkXoz1yOFCu/8yEl3Zzsj/Caj/kg7FLtRpvMxk81loPvP@lists.infradead.org
X-Gm-Message-State: AOJu0YxH2poJTDiW+bb6DJpdhK8BXmf8EtYCNdJfpX0+u0GruONeod0L
	YAJs4+RqGXCCN5PxP4pRgtlDcTHLEFz6/jLXALZJDS9SXCmfGCIIW3SyK7vbN+0=
X-Gm-Gg: ASbGnctPIDOeiAPW0pVAMRZ1H4a1Y33oMUnKz7AUDix70tk0nzDajZgB1AD2Z3doSLR
	xJmzLX5WTblDflyGXVBZJhgIKmkEp5mVar1YECujNyVTUZ8SaQ87j3X0a6T826UUUgJ8sw/Lp6b
	BJ+s6mLHQzdUwG8IFyzzW65sTGbGqy7t5BpR1nzLZqgEVDVbntheiY+EsCqotZViYM1LqZ15fI7
	x2r9ZGKvKJm84mgsDJd5jPdfgzdHo2pfb5Tkz5Q3LaaI/is9rxnZjSOGz9iAvLN0jiZO4GBxCq1
	WfjBBxI9Tt7yCETaKn/q8jRmmKrHkcwupdMtD2FZhpZp++nN+HOv80SqqbbvE2MTYgJDF4TQTBB
	DvMliwPxMXcWQXImx
X-Google-Smtp-Source: AGHT+IElBFJDMQbW748Xhn6uR3Gy7UiwZwfaHD4iyiwy3AqrKyTZYkKWwIgzmc9HZX/EcWP9CEo9Lw==
X-Received: by 2002:a05:6000:18a2:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-3a06cf5ed4cmr2483522f8f.23.1745504050693;
        Thu, 24 Apr 2025 07:14:10 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:10 -0700 (PDT)
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
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 19/34] gunyah: Add hypercalls for running a vCPU
Date: Thu, 24 Apr 2025 15:13:26 +0100
Message-Id: <20250424141341.841734-20-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071412_446658_4ABFF2B1 
X-CRM114-Status: GOOD (  14.89  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Add hypercall to donate CPU time to a vCPU.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 37 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               | 35 ++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index 1302e128be6e..fee21df42c17 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -39,6 +39,7 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
+#define GUNYAH_HYPERCALL_VCPU_RUN		GUNYAH_HYPERCALL(0x8065)
 /* clang-format on */
 
 /**
@@ -113,5 +114,41 @@ enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
 
+/**
+ * gunyah_hypercall_vcpu_run() - Donate CPU time to a vcpu
+ * @capid: capability ID of the vCPU to run
+ * @resume_data: Array of 3 state-specific resume data
+ * @resp: Filled reason why vCPU exited when return value is GUNYAH_ERROR_OK
+ *
+ * See also:
+ * https://github.com/quic/gunyah-hypervisor/blob/develop/docs/api/gunyah_api.md#run-a-proxy-scheduled-vcpu-thread
+ */
+enum gunyah_error
+gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
+			  struct gunyah_hypercall_vcpu_run_resp *resp)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = GUNYAH_HYPERCALL_VCPU_RUN,
+		.a1 = capid,
+		.a2 = resume_data[0],
+		.a3 = resume_data[1],
+		.a4 = resume_data[2],
+		/* C language says this will be implictly zero. Gunyah requires 0, so be explicit */
+		.a5 = 0,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	arm_smccc_1_2_hvc(&args, &res);
+	if (res.a0 == GUNYAH_ERROR_OK) {
+		resp->sized_state = res.a1;
+		resp->state_data[0] = res.a2;
+		resp->state_data[1] = res.a3;
+		resp->state_data[2] = res.a4;
+	}
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_vcpu_run);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 573e3bbd4cb6..f86f14018734 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -219,4 +219,39 @@ enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
 enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 					     size_t *recv_size, bool *ready);
 
+struct gunyah_hypercall_vcpu_run_resp {
+	union {
+		enum {
+			/* clang-format off */
+			/* VCPU is ready to run */
+			GUNYAH_VCPU_STATE_READY			= 0,
+			/* VCPU is sleeping until an interrupt arrives */
+			GUNYAH_VCPU_STATE_EXPECTS_WAKEUP	= 1,
+			/* VCPU is powered off */
+			GUNYAH_VCPU_STATE_POWERED_OFF		= 2,
+			/* VCPU is blocked in EL2 for unspecified reason */
+			GUNYAH_VCPU_STATE_BLOCKED		= 3,
+			/* VCPU has returned for MMIO READ */
+			GUNYAH_VCPU_ADDRSPACE_VMMIO_READ	= 4,
+			/* VCPU has returned for MMIO WRITE */
+			GUNYAH_VCPU_ADDRSPACE_VMMIO_WRITE	= 5,
+			/* VCPU blocked on fault where we can demand page */
+			GUNYAH_VCPU_ADDRSPACE_PAGE_FAULT	= 7,
+			/* clang-format on */
+		} state;
+		u64 sized_state;
+	};
+	u64 state_data[3];
+};
+
+enum {
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_EMULATE = 0,
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_RETRY = 1,
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_FAULT = 2,
+};
+
+enum gunyah_error
+gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
+			  struct gunyah_hypercall_vcpu_run_resp *resp);
+
 #endif
-- 
2.39.5


