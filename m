Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jtytgNItlJgFy4oYQcn83LUARt7I0zsU6TFkZ3Z41Jc=; b=tvUOPngr7q5MrcTLM9c32NtQNn
	N/lXb2ZaEk3bPkS1Y4Ctu/kzm8bpfK0C02dp4WUVnZhPmfXGU5lHg4VezGeSq5cCp1e3oddn7Z05b
	nc4ph3xQJnff37irb5R0yY6MaLg0ihB9HxKyFiAP5qKkM6Kiird9g26HF4gO2D2tfgD/Ote9Ee0GC
	FcCJUETMhtG7PkKUAK+gd1hnjE7QzLVBS/4Vs8T2ZfqAwGwMavtrGW7iOsuDQqL+QXbGD/1JziWku
	UQYrHDaeRozHl5n3H7GJmfydnSfq97t51lQKa9VFb+ZVzWQkSHw7+zSB5e7HqrMm3xUwcm+OMMWIJ
	3XkVMu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXXq-00000009Ik7-3PtV;
	Wed, 09 Jul 2025 16:21:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVkk-00000008yX6-2AJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:26:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45363645a8eso39742895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752071188; x=1752675988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtytgNItlJgFy4oYQcn83LUARt7I0zsU6TFkZ3Z41Jc=;
        b=Vu//bnywFAlkadukdUTOkGgctcqOsx9NUkM5x/i8t+DGLgKztbbbybkLhc7L0qu3pv
         pKc6bqomZWtXCU+mwsvqYGy7YWklcxwPYeSRL7yt3qiV59hBkAOsZbzaEgJobqFvf+TT
         kAx2+r00C2+V5+K+eLl3IhlPdNg1aOlcTZz373SyQbcEwuUAHJ2FlOMOOJg6W4BvEz9U
         jHrxz3Kn2OBUmJOY7HBzApPVR7oqbJiYmGXihhDjuIwT4WXBkNvETSjGs72KPxPl96JF
         aXITbjZDRWr9HeatI76OfTX4kJIF6LjfF5gwM1TYzz8v3D9bWQOpfXEMYn2emI+sYSyo
         6iWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071188; x=1752675988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtytgNItlJgFy4oYQcn83LUARt7I0zsU6TFkZ3Z41Jc=;
        b=kUzQJTdUOLIceP8IxpsZB3Fs7au2nYAp7uONI8GhhyFbVUbJA5nFMfnlckYu/5HyVI
         DwnTfNHLCsoEepRnwcFlsd+SDlkX80mm17U3nxsrjGENNXjfrnMQ+kb6tyfZrLbCR+cK
         TQFeLpoUbuhkEGtIsci7kmXdFwUstV6H+Fc/BF66pQKRlN4z1iicHAtU7gSlxJYsRtmi
         FzN2GhAhGBW14Fo5jYfNt49JvCV0KCMNH91Fvp6Xr7Q0xq9F9//ry0ojuwguDyMRrjlR
         LUkZ2KVAYu8Q+OEqSIJTWP10UBCaBOOz7uGChjw2+BTsaxOEZIudbYifxDm3Dsg8x0ps
         mcIw==
X-Forwarded-Encrypted: i=1; AJvYcCWzP61cdmV3Dkm2PP1r2Z4ss88F+NI0EEVZMsWVbevWV9M+IC+gcZXg1JlDylJBxFPz+qmltSCeC03LsGXt/Of6@lists.infradead.org
X-Gm-Message-State: AOJu0YyW0g/y9pawb6R50UxnpZxNencjCjClTcuYPqaQEGSaM9i4lvoB
	iWSHkoKIZgqIho1uCPtNZUAEhxP6bSDFqL5QUO9iZxTCQL8+KT43zRNEeFhw1Hx6oYHhXQ==
X-Gm-Gg: ASbGncsG6hXVvOQ1BX2BfiS0gVlAcGE7iDq0wC4ET4TG6ZHYfA7zFmdS0lOIOGnFNVA
	CLIQNmuPB1fP2lNtEscdUw4FAgPVR2g2bcLKJ36euXwQDhDIt+GcFkOJpmf2aCl9r19VupkOAzz
	RDJuvWWeBPKymh9G3uHVQh/pWx33B5R5BnwjAXhxP15Z8KMqjfhxFV4BdRxFHBwQs9hQcAcgg9F
	tt0VL8r/bO1gpCTs63xE+1cd4efQpsSpjRq9rUSvAbq1v7a9b6Abtmz0vnao9FFBTg5q8bAg00M
	PjHDsHooEb0kuDRv8L3PpWXDivfqoAu1enyWsRBdtkq7mxPrttiwn5Cc2zKT
X-Google-Smtp-Source: AGHT+IFKMjL8yZjoTHKhlMwGjBnA9oWE7US7cP8cCvq33CCZA8+5Z7xIu2VBWIJ+Dut2TX5qYxxQ5A==
X-Received: by 2002:a05:600c:4f11:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-454d522d0d0mr29893125e9.0.1752071187906;
        Wed, 09 Jul 2025 07:26:27 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cdb31d21sm46723505e9.1.2025.07.09.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:26:27 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] irqchip/gic-v5: Fix spelling mistake "ouside" -> "outside"
Date: Wed,  9 Jul 2025 15:25:59 +0100
Message-ID: <20250709142559.2154255-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_072630_552777_1003AFD1 
X-CRM114-Status: GOOD (  12.35  )
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

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 340640fdbdf6..fd93796f1fce 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
 		event_id_base = info->hwirq;
 
 		if (event_id_base >= its_dev->num_events) {
-			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
+			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
 
 			return -EINVAL;
 		}
-- 
2.50.0


