Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219A1CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=; b=V4AyUmimgbb32dBP4u53b3PXxq
	Ybx1MdU+gn+8X2FCz6pEt4vcPvEmO+2EfG1b2g5dzg4yh92pM7BcncnJZkqtI8cgrb2yxGn72RakH
	lfSvl+Hg5etNt5z0ZwHebUFbrSS9tA+NifEJqueaFjC6Uh1rxZljvwMWKSyPkH+pNUnMx4Lx8CiIb
	FMIyhF7D/DZ8vsiN+6WlF/YjRnfg2mXRIL2aYKD2q6MKtqcFG0bWf0yM+5Ip/V2pP0L03hAtpL7ml
	9hqtHNuWNij321t0h761ydcf7guf5c8llOhOGi6yNBkRFdlAzletNEcoL85wEkbSEyQSiBZ9wrlvK
	qefNPa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkND-00000003W8x-0Fes;
	Wed, 19 Nov 2025 15:45:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN5-00000003W0B-41nO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3720e58eso6292311f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567125; x=1764171925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=dMfHgRpIKkosD5JW6XdCLbNfmk3aWQvY4kbDYd40eA+s6CUjDCR7lRyUXxPUuRHaQZ
         T5KWkQAoFosSDOFJ5JScziXLeosKHoVqm+6UiDBwpop/gJZf6jDOHry6MO26rz3B4BxZ
         2UK51Ts9E/AqY0DdaKO7NQfPoWycIyTFR3gYJfoNX6SBs+gfyqofA3EPKof8Tbeprzn+
         xjW3H4JvwlldFmmpVLLDJNo1bwLxnxwNnpD5dcP1hceYwt3ueIbVQoHYRSMDCU9EB5sN
         5VXzjTPTCr3gOWljjwTgiVxqmxZMydPPe45zRv8UAO6ti6m+T/8h3ATlSoXN/AQG23yZ
         xdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567125; x=1764171925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=FHDg02a+0QQ8CeND0zvaQoFzoFEdp8rVgVaFbWluw2/TWEWClI0B75mBZgQYRB9iJ7
         ZydmT31PVHx/Oza5vBCiFPhtX/FvGaD9gv1IDnIwIkOrlsT492t02jlSXdx/e8Mf/bj2
         E9PVjjJzt9uQe1dh4HDV+la65978D0Gtrn38SRoQBfYdaJ2H84GIIYsmrumFMLd4czqU
         LamZs1oDOhx8P2Z9Iz1ucbjBXU8lFu73O3yJXIVDxEDucX4TGq+PXnHHMUxr++oPeB2C
         D4piLDd4T2SMz8hqRei/tTXJ283eFQ7Zu+b5dobKwmvaCMovvzTEB230UTsbd8+DpQbL
         ac4A==
X-Forwarded-Encrypted: i=1; AJvYcCUGJ03bP0ktzBQO3qo2y2vHJR97RT04YG/CiHS0utkGiR2kGPGFd/AKgxLK2WVm+oCoe3jjez0t3sc+P/pSyYfJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79GHjzH5j79TO4gzD4ZoHPUCKgcO0WSa93Ey/6KJ1LQC0ALkC
	DtfmKQL4Hm82PLSmNWvo4TsyD6akcRqRdNKll6tGrGUgPqz1N2jsSnvPDEKvHvAQwV0=
X-Gm-Gg: ASbGncsWCb017WXXh3RnUv06sLdVZnIef79w6T7p4eD5blN2KbMErbr1jdT3imfnjmD
	7kbv4W0k7ypb3M9rUggonQamwUJTKHJiRZZ4XJ7Kz4Lrwr6YBssGg+4Bu+vAYhyGUxv2qksxOOO
	ZF8u+mPspmFMp14QU1uNfIkDQbn8WGwMX9T6LFu5+WHwpdPcBdyMbyCyvCV2/csL6o1P+0i1laY
	qaD1Fc8YcrCWwCKXp1+RdvtkqdJrnMBLNsWvb0QNsyduQzhgvADnbiGwtxhpBus5qWHcEsPDHde
	M4TC9V6V5d3c3Si9+9zVvlyBkHtQIZPfoFP5sEodR0MJJq3SBuEmJSqsRDpBb9ZCUsgn1Lct0kc
	7DuJlsJDfRkg1qzRgXblGFrF7VD77pzD4WJzAZ2I6fN3DLDjRoQ0bfAu7j3ILg3OAU94FvSV2fg
	7xWBponoDpnHbNJSXFunl10+fHbwtjLg==
X-Google-Smtp-Source: AGHT+IH7OiMHuWdKqmUscjGj0hpAhy0+8U72IgAGXn7ATooehRTT7HxTJk0qp9VlE6dzqjBsHdcltA==
X-Received: by 2002:a05:6000:2901:b0:42b:3e60:18cd with SMTP id ffacd0b85a97d-42b5933dfdemr19022522f8f.11.1763567125510;
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 05/26] genirq/irqdesc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:06 +0200
Message-ID: <20251119154427.1033475-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074528_014665_48612312 
X-CRM114-Status: GOOD (  10.76  )
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

Annotate vital static information into inspection table:
 - nr_irqs

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..89538324a95a 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -140,6 +141,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


