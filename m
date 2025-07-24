Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6CC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SReSPaHbR3saXb697Yp9wPF5rwCm4qBMUK6NGh7oWew=; b=hFQB46dDr3a6Bz0RQt5MdIQkkI
	oiUVGSR4XlrTqyNw4l6oH8+M1lHKQpiD9F5UAQCuR4nbLQe0A3oXGA6W0k53IQLjT6OoY+xRKfTVD
	WFmCbUy8/VE8/i2i8o04IvzB4uptY8bcppALcT2tSoa/KrFuKoD0XFrNiVhpNiD+LjBjpc8NrJIWg
	erGetwwrtqdVCBp/HHSuGBPF3nKyoKhgxDm/T3RbUSulJQDVNCZEfpZVu4ddTz6fc79wjib24JWiJ
	NMmxH4MW5UWnB5BOSxPTldtKwEqrmjdL5SoxIpPccw5TaqxIRj2REJJQDed64ligLwbQKYIdTMdbx
	tFKZHWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrO-00000007r56-0rO6;
	Thu, 24 Jul 2025 15:27:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQx-00000007emF-3V3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso722752f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365390; x=1753970190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SReSPaHbR3saXb697Yp9wPF5rwCm4qBMUK6NGh7oWew=;
        b=olJcdzpjg4aVH7R8EqM1yVIfh6TuWKf2iHkbuy2OxBBcLGJZ0gXPRFQkf5URrtJAQS
         LCM8Rq/g4cM65qRF8QUm/2iJbJLxNbO3zVT/kX0VQewq5bXbcotxh7WSEwQgKY683ghW
         kvl8uVzRcOa2pbDMqXu4wRYwPyOpcwrNZG56cI7HdZxzubi1Eggw487ykpz0Miw/BfoW
         BuP1qcnEMFsyrCmNCG61kTeFDOGAaCBe3GT5GCLO2nE6mXfWu7WBWM9il7n7IH2utCrv
         6D8RFbtiWf4OKv+kO6/AOc7NYiZ4EC6lGPQnkGzr5+5f9EKHgDBRcSeOqU1NmwjBJiec
         cDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365390; x=1753970190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SReSPaHbR3saXb697Yp9wPF5rwCm4qBMUK6NGh7oWew=;
        b=bIzazgVTP7vLJDQlc4Sk/8/f5aEqf4VvQc/TdBte586MrCub+mdbwGQnWRnVudZTmV
         RMwQE6+RXPxHNm6t7ZPUkcdbeOUM1YugRlImSjpHgb5ii1iAvFJYKiv2yCKW0YanTx9h
         gYX8ZfcAKSg3Ajz9qWXQGRbYq/dCh+gBEPrphiTJVZUO45Q+bh6NnpURNm7A1ZDLR78d
         UQDUdH2RXjUYHnZuE7H65ovLDWejAlLggGWLmm75QyGSz9HGGQaD2MRKMmOxohsH9/BU
         jEly7LzbwBEx24fAdy69XljAHkjFDidTRfmVObXTuohQpKZXabIZF811G8GYJ44iDQ/a
         xvxg==
X-Gm-Message-State: AOJu0Yw/WMCwfNAWXieDLzKyf1PuIj7PBJEieZSnMgqkAlTA+RhrCfon
	3xXpy1jR4Ct59c8/oZsIP5iaEqtEcbbKwOoTSxZIJ3WLgqXqEKbytsUsKxcRyYwWGy0=
X-Gm-Gg: ASbGnctmTxBp43uB1CDpLWUuLGUqVTSYHgLaFg8qCfhZ0cuB/aDQUoUsZVhVHlfBRJ6
	NVbdB//p1etqYrGGKv2XKmYfESD7g5IxsQ+5fgee98NgC4ICBo+A96rNmd+IHJMPrYxt+v2IlIr
	BduKsMhCs7A64eVC5vSrTFgNwh0D/uWWzjB+9+vF+Wm7PRAmcNWZBPDLJ7/xNlxrN8BwVaX+SQd
	guY3S6z+YCt41oihA2qbptgfggYTlmBQiIlbgivhWwRf5KQ0gdLUdB4eCOjDq75r07115tJONsW
	sY0aNZCsj8gimDWDLLVnqBaodGRyOOFzsM4rvtbDfVtmLrgeJWu9ojftptTPXV0L7gr+UxDAuPQ
	6J9akV0Rouqfq6k9DfCv3dtg6+HO1dTiFWBdtZpKhkw+mIuWMifo/LoJqD7vELHlAX6I75O5tuz
	+Z512lsZAKkGCO
X-Google-Smtp-Source: AGHT+IE5OpzTZyLft1dF8PAF1zWD0A9y1GJkIKlmiY5JcqmC3+aHq3C9hKZiU8MWr3uj6ilv3EjyHA==
X-Received: by 2002:a05:6000:2c0c:b0:3b6:333:256f with SMTP id ffacd0b85a97d-3b768f27e15mr5395112f8f.58.1753365390310;
        Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 09/29] genirq/irqdesc: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:52 +0300
Message-ID: <20250724135512.518487-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065631_871890_DA1BBDB6 
X-CRM114-Status: GOOD (  10.23  )
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

Annotate vital static information into kmemdump:
 - nr_irqs

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index b64c57b44c20..6d11b85be2b3 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/kmemdump.h>
 #include <linux/maple_tree.h>
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
@@ -140,6 +141,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+KMEMDUMP_VAR_CORE(nr_irqs, sizeof(nr_irqs));
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


