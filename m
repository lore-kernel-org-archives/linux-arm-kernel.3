Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9789DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=; b=aAYuVq3Xc/xYJdf7IJvLFAU/mv
	qVItf6FkQsPgP8/DUem9rHY8D1b20yuWdVjEiEV0bVUlgRjzpUjWBQbLjXHhZ4sbchcG795SNY1i8
	9b+S9y2IBi/j1gC8+hHWnY1Bz/K3NgtLDL6Zm4icDsuEWAAs1PYwqHgFugLRqUeUh/WH9mmr5a0vo
	yNQDxVDv786KgbtpB8kK/CSe5Q+dlop2tW3umjtDVCU+dObh0HJjWkOkEz96APmTvbuwstXz3F+Fx
	Oq1FPBJv6pCQAGI9GAbFLB9w3cAnNw1zhrT+5kpIeHLKeFcbJTM+bb9yiCGYhkfQ0zTULcKKbaPQn
	qoE5aozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6C-0000000EeYr-3kF4;
	Thu, 24 Apr 2025 16:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLV-0000000EKu8-2uUp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 14:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=; b=Aoa8iDXiMmhcCDMEXzEiAbR8XZ
	mGzPSm6Fo89B4KxKOl3fPzy+9M3Af6LcUn8mNEWfzIo8SBml1NruNFNcYqrUWwbwvnFbN/c6gy+bT
	9b7pvhWoLIdhkR5LFWAeLRdEruEAlwsLVEAzh+QoAoCyyHIgQ/nzM0PxrsM/21rSl3bh6I7gpd7LX
	447tlBZhzaEdP2n6thC/1sckoTMD9iT4tpF/7v5IZLYDndT8oudZWfERpFNus4efbT6dCpOkZOaRO
	qUU8F7T96edoXKaJ8boMANI2GoJLqM9byAHJxFR4CR0AHFdKfeVGHEe6Glgg15n4k2lqe8LaIohuX
	jtAHkwUA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7xLS-0000000Bplt-0xmn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0618746bso8282125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504068; x=1746108868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=;
        b=bK4CG4QqW5anFkd4b4S4NpiPEJwY4m9umwTUuqaFIJGxWnfHzaPigDZRi+XrlUFWDI
         F6ADNStPdtvo0lZJFvb7r21FE2DGl54S3FBKEzHYu5oamb3N2HNNWSzC3RMHLVyxL5PL
         8xA13gm7xT140PU4CO9QM/RwhCIvs6WwZY/nTD5LlA0bFHWdsWURC4Ga8eicZ8/6qQTM
         iGfvSbQVefPt7+9XN3yCZ7WCKzYA1XAkDKgQm/P885iE836VN+/r7C4oO3VOhQR7Ca05
         XVdVZ0jLR1nHukpcvM0E4ud2kZhDVYVg5y65LJs6jbIxrDBchuiL+75zeid3FaG8ffaa
         WbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504068; x=1746108868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=;
        b=eZy9gZcE6hbv6tbdUkGWnGItCLkI4MltHxf0Fcuusc82xssAKqvuF6/AnlD0MJ1GHM
         0iqpzUpBUEdwr75cxi0LNxlq4SiqAPCkmNCYBSxsgsk4M70p0lHKAgmjEN5+cX9i6WFL
         4zFGMdHDEGuYocljZVZDnIAUW/ZGqdLAIhbbZZtZTKNcCth5VI6Jh9JXLFiv8ZMVxrnC
         XHjYckq2T5xP524I+vXx2jcL1aXQoD3x/ywy41TovhoE+6mDMKIfGtCG0ZbUJcW8CoV+
         vXWP4+qXDVxd9zR4cxt5JmgQlM1ONHormj3my2f6DMfLQnS19/bRb/nWfjbb2E3tjzi6
         oqQA==
X-Forwarded-Encrypted: i=1; AJvYcCXsIT8FkfyH4iE4lGVETBEnwTqGoQqjm6T7Sq2KyvAx4AT4Zmd5bAvgMgZFW7TMECNlNrILfwh4HLhJOR2PqeFf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9CResLYovMQZH8XyUyBFyiTJuyN4/ZFPO/xOQSTJ/BWqWxeqv
	0eqQovbXqP+SaPgI6WaqA0bTwxJgz+3bjcAYr5g/Bli4Eh0+O106GRSWcLRofhE=
X-Gm-Gg: ASbGncunw6tEvxxGBkgnkJ56Rzo+M2dODS6vOKqbJgmpn1eegNNHvZzBsnA2XcWpaDa
	zyjXRbD+wFPkW4VULqXC2zP1Lv56UJNVEvXBg1LCsz2MNTNnfjxbJWoQdFMgiPOzEGk7vih1YMV
	FMdQjMP9Dz1Ie40uWGLEOakaTCqxJwjBnrJbkRpmVhC+vPUMhJObXGu6Re4T3lZH8JnZmCcuoEG
	zbtN7gFlhKMYNSiUs7A9IIcbpLWMhZKFOkibreCBGOYRtqKaayl7osNeBDtD7kJrO8IQvOJJYIP
	RAhejiY4kSTEREhOmrXDQZRpK6OMVyKuVJ3i1KODmwjnRe/deLRPR1t+kgwI9B8HguK2+K5qxjr
	S0o+db4QmJa72GLSm
X-Google-Smtp-Source: AGHT+IERVpNU2DILo0bvt8R4DAynThAP/fjqterv2/ng44U7A/g/KpyVK5SJtSkw42xdSMDhah0Vrw==
X-Received: by 2002:a05:6000:1acb:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-3a06cfad64amr2138772f8f.55.1745504067786;
        Thu, 24 Apr 2025 07:14:27 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:27 -0700 (PDT)
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
	Elliot Berman <quic_eberman@quicinc.com>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 32/34] gunyah: Add hypercalls for sending doorbell
Date: Thu, 24 Apr 2025 15:13:39 +0100
Message-Id: <20250424141341.841734-33-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_151430_522264_1BD06A70 
X-CRM114-Status: GOOD (  16.24  )
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

Gunyah doorbells allow a virtual machine to signal another using
interrupts. Add the hypercalls needed to assert the interrupt.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 38 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  5 ++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index 38403dc28c66..3c2672d683ae 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_BELL_SEND		GUNYAH_HYPERCALL(0x8012)
+#define GUNYAH_HYPERCALL_BELL_SET_MASK		GUNYAH_HYPERCALL(0x8015)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 #define GUNYAH_HYPERCALL_ADDRSPACE_MAP		GUNYAH_HYPERCALL(0x802B)
@@ -64,6 +66,42 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_bell_send() - Assert a gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @new_flags: bits to set on the doorbell
+ * @old_flags: Filled with the bits set before the send call if return value is GUNYAH_ERROR_OK
+ */
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SEND, capid, new_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK && old_flags)
+		*old_flags = res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_send);
+
+/**
+ * gunyah_hypercall_bell_set_mask() - Set masks on a Gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @enable_mask: which bits trigger the receiver interrupt
+ * @ack_mask: which bits are automatically acknowledged when the receiver
+ *            interrupt is ack'd
+ */
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SET_MASK, capid, enable_mask, ack_mask, 0, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_set_mask);
+
 /**
  * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
  * @capid: capability ID of the message queue to add message
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 72aafc813664..26fdfa3174da 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -329,6 +329,11 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags,
+					     u64 *old_flags);
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask,
+						 u64 ack_mask);
+
 /* Immediately raise RX vIRQ on receiver VM */
 #define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
 
-- 
2.39.5


