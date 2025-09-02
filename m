Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33987CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpTL+8UAJAvc2e731Ib5tRm4izD0s+sqQLOdVQdO65Q=; b=rGy9XsMZri9a+c5ZGaQjXEUh7r
	srOCICzBQjZxrm6BX5TXOWhVWNMzYNUIRos7SXK8AZOD0Lk9f2ryZMLdUdn8PoUu6criSaF8Wv7OG
	zmfN409SEmggQL3p3SBcBoO2pYEzyAlEmO0LK5AZ8xWbDoZvgGrteDF7kWMNd/qiFk+xiyKQOQgIk
	B/gPs98kfsKVX9Or8o0sJScy4qOdHsT9lN8aeq2FvS1A2aVi/WuB3gawfPmY8yxozG1k9Ek24nBg/
	EN4RGDDBSYjC0/V6ZIrqaeXWFjqWn2/ZpA0o5v4km60186g4528zqEwUEQeSprN+WFcWYIrPgzab7
	sszxHPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMf3-0000000G9jL-1TfY;
	Tue, 02 Sep 2025 08:46:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMEs-0000000G0i1-0QD7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:19:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-771fa8e4190so3335927b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756801177; x=1757405977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpTL+8UAJAvc2e731Ib5tRm4izD0s+sqQLOdVQdO65Q=;
        b=XpeyuwZp78c/ZZjVMIMPomi4eTCvclGoDPjgtyesczQpq73dLKVVH81/Nqg4ySs88l
         nHhRCjCJHCK4UAhJ1BTR6kR0CqqwYqt5MqOYWm58DTOeaxGjrnXjbS76bqt87Ja/trUC
         Ed20EbPZVskdO4AMLdLhdCZRRJvYyEQxPlYWysCMxrVOc5R9jlYoaGTBAhDuwB1dMlc0
         CA1tGYOkK3ZufxxDrr81z2xhZM1QWg6mvCad0TKye0anADzY/BTBYVbsaOZRT44evFuF
         ghWvV2BQYFgReyeGE4MJo6ovrAClMu8RT8pQrLhDgM6mA1oGL7gJgBINoNq+zK2eCkQO
         eNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756801177; x=1757405977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpTL+8UAJAvc2e731Ib5tRm4izD0s+sqQLOdVQdO65Q=;
        b=JnfD/J7yurOp7FumEBcaHCMFNJfqH0PZPP1E0pxx7v6g554cdGjDG+8GwH5EJKLK4h
         hOrsLo+i9JjQ/88pJeq3V7x0ofko76FOrQ4+Tp/R8VKTK0o1mmJG3QyI5zDyABVdLaUr
         YhCR0Azh/lr9ac2ykH/Ll7tZG8LUR6VbP/Cj3QhgjSXw+euqkfZEf+4ww7gvyWjQENl5
         S6epNSuTF5tY07KxWiIyqC17LhAhffBM2oirfqUzXWxzDFR6aM00w7q7Vw33a2erNDdq
         afpA5wxaNa/cj/8G6saxbMF7zLm/GLfNWhUDyIWoMZ48/zsdQ1DymdCJmVO38bBaXV4f
         xqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVfN2SaFwOPi0BV3ghiGXQYvrns7r7GyH6S8Wj8hbVx7sZKdzr4KhMFzmYqzxE74nq+k3neRgLTwVqm6Qw5aiGZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxQok+42OWd+MfvGhYe/+N8BM2RIP5FTaEXFR9brpqZp1t/j48s
	Efg9+yjBk1Gx6nrPM32kgQ8YQJ7tGVO9SWQYxLu274SXymC6IZGVlLEO
X-Gm-Gg: ASbGncuGQOl4mJpv4uuSTPdxYxRaHkHl372Y5KsPqiIfdvqaI5xBO/3+v/eUulk7xn+
	jHki0dVh1xTIC3TLR2gKeK0pL4aXQBztoBw9r0bbtsVxsl7iVIkPuqQCxK0hRktUUA5HUQHGqT3
	2KAu1lmHpYjXsmatJ697mCQPrDjS7kgPUwgNkOErfjX2smHRgRwLj+wsYjaF26LPzB/8sprUOlO
	YoN7429XryiXTmrVZowVqxNYLpUDJofPcEaCr4u7PxKC9sYom/pVkuz4bDbZgiQVebctV2+/N2H
	PugCbw2LWw9TtowXfYf30tEPssUriLrwbtDYJYSazllR/R7fMQyZ7nc5bsmBW8KyCZYH+VzcOen
	tCNeXNuLVGyW5OEA+eGNYeFFbAA4EgEEjoODo8M5272R6Bibv05iA8pJXsBweYkNNSjQDKo0I8O
	2WDKJt8hk3x/AKG1jlZ9uzrWl9FK1gyk1cFWcue/RO7cOBlvoDOxCYoQXN
X-Google-Smtp-Source: AGHT+IHMn0mX5CJ0vwSNBKSDg7gEeatnObxmLvDcjQ8QncO3GhezbOnpScCrxUanP00/q7WT9RoRCQ==
X-Received: by 2002:a05:6a00:1828:b0:772:499e:99c4 with SMTP id d2e1a72fcca58-772499e9e23mr13221266b3a.18.1756801177271;
        Tue, 02 Sep 2025 01:19:37 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.34])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-77236d7eb7fsm10930193b3a.54.2025.09.02.01.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 01:19:36 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] bus: vexpress-config: fix device node reference leak in vexpress_syscfg_probe
Date: Tue,  2 Sep 2025 16:19:27 +0800
Message-Id: <20250902081929.2411971-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_011938_148598_7FEE9205 
X-CRM114-Status: GOOD (  10.82  )
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

Add missing of_node_put() call to release
the device node reference obtained via of_parse_phandle().

Since we don't actually use the node, decrement the
reference count immediately after obtaining it.

Fixes: a5a38765ac79 ("bus: vexpress-config: simplify config bus probing")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/bus/vexpress-config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 64ee920721ee..aa17f819dfc9 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -393,6 +393,7 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 		struct device_node *bridge_np;
 
 		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
+		of_node_put(bridge_np);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 
-- 
2.35.1


