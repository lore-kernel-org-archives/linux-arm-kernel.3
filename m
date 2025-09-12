Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DD1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=; b=HlfteWkhz77ZMpF69PCoAgUOLb
	MYzItXhaczkRTJtWYQOmJTiGBAKILIBEHmdKWAl0V8srF//WnrSu6MKrNNen+HUntZAB0Itu4Ghnr
	u6OfCuGNQhSu7MRYPnLuAiDAct+Chshefw5u7+c006onq9fdBXM9lZZTkxreAck6KCttFwwkjAWV+
	0BjfAEL7GlUZRA42mShYHtSdEuxKHV77NGE7ueJKovIOgsEBk4sPGSobV48/zTOW1zD5KRQr08JkN
	HuV36Xyh5YSBWaoEia4ln4wfGZGPo7oFWjW0dHANrPb8w1rUotOLMf6PrFvMSCyGxOH7+IZ62Sqyc
	WU+1lOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Q8-0000000A8Pl-3AHx;
	Fri, 12 Sep 2025 15:10:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Q5-0000000A8L1-23ER
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:38 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d71bcab6fso18125197b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689836; x=1758294636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=WrmMScz8jgFhqUaJaoAk53U7ddfpzk8P1qrbMjLhUyg81yZJTEHkpNcFiUi5DCWNXp
         c4lSRYFob5PaPkdbygcWZFO9Scn1fwsgEg7oz/G7fhL3a5aG6cLHSfSyB5eoGI6D4QkL
         eRhT9Ac3UdmNHK5hQa3RetgAFmIwGXg1oM/qfmOqeTcHLuYoBqqNy/WNHwT6y864m0Qp
         i4xRR175eb+OZ7mhQUha6KdNOSxZJ2o8pjOAtlewTOSGurJvcI8m8IoQZnniJ8IQTMgj
         4I9Xe7dimsrtZnUuxPAUjmSvZzySvN0+HANX4v7QOhAxebd7PWmIU0e+UPNtzTW95NUq
         lYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689836; x=1758294636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=mpQGHOU4XcEGNs2D5yJ06vE6Xw88iChG6VNM9a6a0WCLjivQYS4HQG5Krt4x2YJO5v
         zzYreGc6QL1aNezHyQJnAohqyTWyE54MLrSnfntQcDt+z0w8lyegg6upYok9x8h3thQN
         BLmIaCAAONDIXZZPVWZfLKkM1CzVx/LuGPmaQBHZarPaRdaQxQEHjna5QVt6hlDyFB0O
         xmf4HcdSjLsQYrpDvsRV9hTAw93LR+XFNELmT4oVUttOf2FSKnAfyZdUhXQui3I0qDis
         2M2GSvWRQBoBumTX1yeLcEmOwesx4oO6epSKZ9nhHiv+0eXkNgv2IJ6IkDwGqOxIJamH
         Is5w==
X-Forwarded-Encrypted: i=1; AJvYcCV70lSdJTGrMygeNZRTiv8uFFnwPWg9A4S+JriVYvy/J0UNurMJ27ysDI8d9s3oYtA/2m1nXtzfcQls44H5GQbL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/MJX0AhckEw0C0A2s076BjlcLrEWREoYgLdI3+5hr6rK6nKu
	6/gGBslTijlafikMlHOQ9ts3wJP/4Jm9WjEhBnkCDI8tDreWo91D5I/O/wpTr8dqvxM=
X-Gm-Gg: ASbGnctn2BdRMhGojNElAY4HbyTgxvYZTomzaExYPtZQIL71Tgmd79pK+dph4VmEpfa
	Y8O6bLrzVZhfkY/yN4Pf6YoT4bB4s/7kD77UVQyJnDmAfgIgUaflWk2+L8oXZ1OkR+XCdmWJGlV
	v8xPauTFgm/LzYz96zQn1RBOp5n/QGoZ9GgaXqJ9BNfaa+E4mRaUSvJtwKZQz9Y5L9Qy2ZVDKAj
	0cbGk/QikGQLx+14vzyq+mjN4PfOTadasR88T1jurbGLEuQkE806xJ0mHoAdKt8V6+8x7xJWc8m
	eZ8QwxDotCf6vLYVEIu6hsuEPkHJ9khQtVqsHsyF5usVOU2GDg02ZhCagNtLemfrpz+fztHuPgQ
	evNEn0ChLlSksnpR9ShDM19k08IoofvFjMQ==
X-Google-Smtp-Source: AGHT+IGUk5zUSgxh+r2dAU6fmhsNlb1RTWa2J7nuwDb4l4jA+t4jqiomYFBGdZGHaaNJrIZspvEapA==
X-Received: by 2002:a05:690c:7286:b0:725:dc12:3004 with SMTP id 00721157ae682-73063d589abmr33964367b3.22.1757689836260;
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
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
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
Date: Fri, 12 Sep 2025 18:08:48 +0300
Message-ID: <20250912150855.2901211-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081037_576111_1F94C010 
X-CRM114-Status: GOOD (  11.74  )
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

nr_irqs is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..6c3c8c4687fd 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -139,7 +139,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 	desc_smp_init(desc, node, affinity);
 }
 
-static unsigned int nr_irqs = NR_IRQS;
+unsigned int nr_irqs = NR_IRQS;
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


