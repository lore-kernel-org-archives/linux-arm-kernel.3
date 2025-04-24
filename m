Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2BAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=; b=UkSmoHwaByXbMvX+HKgzOzIxzs
	llO0Vju96c2YP31oxAyffGzkMDXb8tY/+Sah+/8+1BHNoXVJrvOYrUaRqU0TJXSml0c4mYWH9mMEW
	z8s2JqX+yMDtMkiGYnTdT1J3y1faEh183ToAZADm6AUCFWg+im5yuaPWaEXFRzTONMreYE2qJQCK4
	8Ny5zZl3y4H8mL4x8KkMJw7KIhWmA72jE97L/5E7SACPKUX78jMvIYm01IujGouX+ArTE1C7XITlr
	pFQvdV3e2UR3DhVOwNzhOxfld2UcivCXSo7w/9ynV+LdUyoeZLrh3C/5lhHgO9VdCJe4YyR1qbTpH
	JjdUQntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5C-0000000Ed88-3yrg;
	Thu, 24 Apr 2025 16:05:50 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKy-0000000EKh8-24qE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:01 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1250931f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504038; x=1746108838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=GVJZsTAPagv43TTFE7+RJjxW9mMJYWifIZ0/btxGV8a/tZ2MHnYvqtQ4YHQjlHy7eO
         3cP3tmoE6rd0fwn6JnhusTYACkMqqtFjT/fdsO1FZJY6erZlBocEr/cjnAFmiF3biCdR
         Wi1jjRe7e4txKTgbTLhv7sArxe6XmMuQQpMmZPyiMbdPdpIYECQcH8ZD9nyJR65PGJnn
         CzQ9B1R5h4B2Guh4TZHqR3Vk651w9dgF62V35ynG8MmdXlpZs2ySMcOa+ACxna/XlUCY
         rEkpiOMjYmWzy8rEWWqOLmzgetCUjPYCOswNl67rSk1iFBkcV36prq0E8zemhpAxouxR
         GA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504038; x=1746108838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=t8CNxQ6O747CeScpmn+aazXdfFFudoGGziPwKPBYwBuRQ6LrbLCnlO7tzssYTUJxYk
         v1XNGZVmzVODQtBPoLJeADBYHcvX3396taKod+K3+myYumTfhbyOrpoLPFIsn8pEOLH9
         GicgNbM9xezRK8ArvJylecwnyh2ebxLFl4kZ4Pv3M/Xo7NqkEJhoHDxoVaoiTo86kjeI
         d1eKhpT++kjEyLkPTNG4HUXsQjwkxGcShyERbXfk1QY+CDJzYSDRN2YnDtb/YYYccq6M
         YORgH7IFjAwFECjmdR9odhDjlH2qzWLhIzT+TXxecsW45RwMDz03x7dpU9YDrDjbMfsT
         j58Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6u5SGeZl3QLl18lWfSqBCq0RSul1vpE/R0Z6is2av1GGLydayqGsfCl1BmrBmN+LYTft18nlSza5braiCQTxR@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSqdu0YOr/7JPVskPn6EmjWywTCY38RtMHb4CpoFSzDE5hg1F
	Iydu8Q5Z87mHmLGBZv3wwTQ7DkFB2kRxDoxnejyChMjnkP2Zo8fXMns8ZhS5iqw=
X-Gm-Gg: ASbGncst9xhgnpUE9qEoL5ZZAR0TLI5WPYSJZk37vZuQ+t4WzLY8LGanV2c0copEUtU
	TFT7Y6m8sRxU82W4vLVIzbjMIgL3cZJnMyLNG+lb1geE+R+s8FwapbnB8EdiGksqu80N2XsPOBV
	nCeBnZJZqQNOR6S/83jeawMlvLmEfgaqnL6mOrEj5fd92Y8DLqXTKu9EQo4PR/83rg27sMJTrzy
	mPss+rQ4lI5OfPZ/DdqRnCfl89e1k0KBdUOHR8qXDEJSvfPPTnBhg+MLhTTjoN3PslfYzNQOcIv
	jDZ/h8YagIeQ2VV3ndJwVlEUxsvdzrH3i3tBF43Yq8/Xr8VKuRCLJdwuhEVvX4N8uNBCEj4kVXJ
	6v+OhYlhUbYsfr37QWigxmiw2fb4=
X-Google-Smtp-Source: AGHT+IFmkqrLYBA6pxT3bgHP40xSeHaZYwIrDUExxYU5PjMxiNNE1p1s+eiHaAutjdes9ZQldE7V0g==
X-Received: by 2002:a05:6000:188d:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-3a06cfa5a93mr2715557f8f.46.1745504038249;
        Thu, 24 Apr 2025 07:13:58 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:57 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 10/34] gunyah: Common types and error codes for Gunyah hypercalls
Date: Thu, 24 Apr 2025 15:13:17 +0100
Message-Id: <20250424141341.841734-11-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071400_533203_F14DEC78 
X-CRM114-Status: GOOD (  15.95  )
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

Add architecture-independent standard error codes, types, and macros for
Gunyah hypercalls.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/gunyah.h | 106 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 include/linux/gunyah.h

diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
new file mode 100644
index 000000000000..1eab631a49b6
--- /dev/null
+++ b/include/linux/gunyah.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_GUNYAH_H
+#define _LINUX_GUNYAH_H
+
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/limits.h>
+
+/* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
+enum gunyah_resource_type {
+	/* clang-format off */
+	GUNYAH_RESOURCE_TYPE_BELL_TX	= 0,
+	GUNYAH_RESOURCE_TYPE_BELL_RX	= 1,
+	GUNYAH_RESOURCE_TYPE_MSGQ_TX	= 2,
+	GUNYAH_RESOURCE_TYPE_MSGQ_RX	= 3,
+	GUNYAH_RESOURCE_TYPE_VCPU	= 4,
+	GUNYAH_RESOURCE_TYPE_MEM_EXTENT	= 9,
+	GUNYAH_RESOURCE_TYPE_ADDR_SPACE	= 10,
+	/* clang-format on */
+};
+
+struct gunyah_resource {
+	enum gunyah_resource_type type;
+	u64 capid;
+	unsigned int irq;
+};
+
+/******************************************************************************/
+/* Common arch-independent definitions for Gunyah hypercalls                  */
+#define GUNYAH_CAPID_INVAL U64_MAX
+#define GUNYAH_VMID_ROOT_VM 0xff
+
+enum gunyah_error {
+	/* clang-format off */
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_RETRY			= -2,
+
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+	GUNYAH_ERROR_ARG_SIZE			= 2,
+	GUNYAH_ERROR_ARG_ALIGN			= 3,
+
+	GUNYAH_ERROR_NOMEM			= 10,
+
+	GUNYAH_ERROR_ADDR_OVFL			= 20,
+	GUNYAH_ERROR_ADDR_UNFL			= 21,
+	GUNYAH_ERROR_ADDR_INVAL			= 22,
+
+	GUNYAH_ERROR_DENIED			= 30,
+	GUNYAH_ERROR_BUSY			= 31,
+	GUNYAH_ERROR_IDLE			= 32,
+
+	GUNYAH_ERROR_IRQ_BOUND			= 40,
+	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
+
+	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
+	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
+	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
+	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
+	GUNYAH_ERROR_CSPACE_FULL		= 54,
+
+	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
+	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
+	/* clang-format on */
+};
+
+/**
+ * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
+ * @gunyah_error: Gunyah hypercall return value
+ */
+static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
+{
+	switch (gunyah_error) {
+	case GUNYAH_ERROR_OK:
+		return 0;
+	case GUNYAH_ERROR_NOMEM:
+		return -ENOMEM;
+	case GUNYAH_ERROR_DENIED:
+	case GUNYAH_ERROR_CSPACE_CAP_NULL:
+	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
+	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
+	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
+		return -EACCES;
+	case GUNYAH_ERROR_CSPACE_FULL:
+	case GUNYAH_ERROR_BUSY:
+	case GUNYAH_ERROR_IDLE:
+		return -EBUSY;
+	case GUNYAH_ERROR_IRQ_BOUND:
+	case GUNYAH_ERROR_IRQ_UNBOUND:
+	case GUNYAH_ERROR_MSGQUEUE_FULL:
+	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
+		return -EIO;
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	case GUNYAH_ERROR_RETRY:
+		return -EAGAIN;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif
-- 
2.39.5


