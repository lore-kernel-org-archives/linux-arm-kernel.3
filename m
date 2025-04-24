Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50360C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlljNambtbwwvkzAI4LjAz2eo7Ti1KUJrgs8M2UB6Bg=; b=gDQfCi3ho6SjM2YPqNOeQU+dbN
	cWKPIayntaZuv5S08yu00j/Z/Ufs/H8O6dRWEnsI3wU/TB37OocZzIq0cot31Gg1NDkY5594YF6De
	d/OUDNN03GlfOkQsE2jhw3ad0LETvTsxKJR8yxnxAVVnT8KRlHiqfy18K7sdgnSTiEJi8yrwOKnrG
	Fsbc5syH6OReTd/hOgZMlkPjFloVVfPnlgYLQVjYz24SRfV3VVTrFTwW7j7zAjE5zSuSPVtJC7wcg
	MNnvSvdf9A5qCC5BHlltdBJpkzfF1em3/04WTQ6/8ppWAml4EmPXYW60/aJdkepSfABGil5tQsnyS
	2yqav10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z51-0000000Ecrl-0uqw;
	Thu, 24 Apr 2025 16:05:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKq-0000000EKdD-19HK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1036071f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504030; x=1746108830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlljNambtbwwvkzAI4LjAz2eo7Ti1KUJrgs8M2UB6Bg=;
        b=c2ahvKKAvwe55igER8Wdnw26JrL1dK0jm6siOHIE2J6SfLagQY+IqQE1F7Jep0BA6g
         +zjThipFlJGmZC+zmc5wWsKE4j11JtWzKOfzAbMyXddePJ/aQrL10xDmjabG6pm13sVj
         Kw40rAW3S2OtxyNjsDW72s/CwigxwXnY77o2viFwzVWP9EgNxOWYUaZot2NxOJ4XmzkY
         /l+V623Uzw1AKjKq9yUhyumURwebnLT7PA8FutmuiG3v421gOiFmfmlEFXWfUY9B0dDs
         3tFRTRUw/NbaJAgk73OEhtVKs0E0M5bhKqmPTwKLFf1muuJKpDhiRsyv3/1pk9LmJcV1
         PiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504030; x=1746108830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlljNambtbwwvkzAI4LjAz2eo7Ti1KUJrgs8M2UB6Bg=;
        b=J0YLBvJOTy+So6KIUQnlvHBK33pthgU3L4fQI1K53i5lRgpBTMpcSuj8HMEzwOCDv7
         sQDJz3HGSzx8Z2zb3czkc54c83EzpkRSXwrGKuNImH4ImUT9XIwzIP1eOPiCXFIWy9oA
         fNBdyMUKQlpYM4x6DcD98BahNt7F41xthrHVvbZOQcBuWrfP4b7WcgkPk9DLKxJNz/yn
         IyRWdKNwClZPdg920wC6HeqEz8Vn2ysopLPBTfI4vbd6Gd6GuvgWl+SQvPcMXgd2Juyj
         3bpVvDZ5gouyTBIwcBW5OUKt8dZTGfWYE7X4zROll3DdL6us7w/uwdBDU5Vuyrl52msW
         oEEg==
X-Forwarded-Encrypted: i=1; AJvYcCWrqFFj1HHlYVacsxJAI9CVcoZT3eBjtRIOzRMYb3bErn4rnypSmO6NOuEWLbRIob1Y3OTvlLbZobm5yapqPKjK@lists.infradead.org
X-Gm-Message-State: AOJu0YxwrueQ6AVZ8q031TdWg0SWt8m0MVGpC6xwOB/0DN8xBeHhkYCd
	4ka25nyVGF+OP8YineMOZu6X+OW64/9VGiBL20o3+mseroot3xlpqaFhZ/ccF8E=
X-Gm-Gg: ASbGncsLLhJDLXQVdKOiXxcnVIIdeeuTaM3Tqa3QaJaZ/ndynAY5VYaUgyG0663AHko
	KN+uE8lO/kRMwGNz2b8LqKnK+j1b9Y3+y4lMu1Y+6BfRf/oGS6LPbXxJn+12ffInpkdXEqU0XQY
	VQ65rDoGNwQeOEoW862uAIeJSqouM8hHcVO0Gem5RPGOEA0SfjnwfROQ6uuF8YjLmMIZPXXgX4l
	F/cPKp5wXmYKak/+GnXED/Gxv9m5t8NkWQXNbl1weYLAc7ahABHv8H0p+H6NPj66+IlIsHDEs1E
	zcjPIO/1xfZXBCpwRdXvt7gkoue8AAHZjqLpGQseUjaVF99o4NYWO1wzZAAh2DS/0Axug1BkkxY
	3HIokXV4CS4ubTHBx
X-Google-Smtp-Source: AGHT+IGjTSYHUF3tyGvvpZJy9ttFB+SjTk/OBEoax4K5qs9LZf6N8lXayXTA0lInN+EeJy++KbQTNQ==
X-Received: by 2002:a05:6000:18a2:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-3a06cf5ed4cmr2481988f8f.23.1745504030257;
        Thu, 24 Apr 2025 07:13:50 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
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
Subject: [RFC PATCH 04/34] KVM: Add weak stubs for irqchip-related functions for Gunyah builds
Date: Thu, 24 Apr 2025 15:13:11 +0100
Message-Id: <20250424141341.841734-5-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071352_315124_16D530D6 
X-CRM114-Status: GOOD (  12.64  )
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

The generic KVM core code (e.g., kvm_main.c and eventfd.c) calls into
irqchip-specific helpers such as kvm_set_irq(), kvm_irq_map_gsi(), and
kvm_irq_map_chip_pin(). These functions are defined in kvm_irqchip.c,
which is not required or compiled when porting KVM to run on top of the
Gunyah hypervisor.

To allow building the KVM core code without linking errors in such
configurations, provide weak stub implementations of these functions
in eventfd.c. These stubs return appropriate default values (e.g., -ENXIO
or -1) to indicate that the functionality is not available.

This allows the KVM core to build successfully for platforms that do
not use the in-kernel irqchip support, such as Gunyah.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 virt/kvm/eventfd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index d6702225e7f2..2a658d8277ed 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -56,6 +56,26 @@ kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
 	return true;
 }
 
+int __attribute__((weak))
+kvm_set_irq(struct kvm *kvm, int irq_source_id, u32 irq, int level,
+		bool line_status)
+{
+	return -ENXIO;
+}
+
+int __attribute__((weak))
+kvm_irq_map_gsi(struct kvm *kvm,
+		struct kvm_kernel_irq_routing_entry *entries, int gsi)
+{
+	return 0;
+}
+
+int __attribute__((weak))
+kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
+{
+	return -1;
+}
+
 static void
 irqfd_inject(struct work_struct *work)
 {
-- 
2.39.5


