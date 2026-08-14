Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=si0qdL0+WRVmcaDS3m3V+/d5WwTk85WNRswe6KdeyhE=; b=uQPbQqShuOwgDDaBqpEQm+dAOt
	O37WihFOTCC/wNn19ZAeXSodyirj9csvK73TY8PXIyiQHl2GIVk1k6BbZv73uou7wTkWdJxM8nNkF
	YO3wmaTA9B7EN0YVeKpP1pUbOHq2gQjidqoc3BIadaPtiZ+Brfobycc2Kl1FduCMGVYaAwE8g9uWZ
	8o4I/oUXOjsL2H/Hq6x4nJIeQZryCbZiwi4QApDPuavNMdrDXMvdRgS8DCY3MDB37fnmxgR9yMBGQ
	gf11mML4aLwYmvGlKJnquehkcR04F3YjQyRMJBqBgQYdQiYNsUNRSxk6gCIySipX+yjwNDlhJ8TwS
	C4k1ALAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus8G-00000002jVG-0e3b;
	Fri, 14 Aug 2026 13:39:36 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus8D-00000002jUh-1xh4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:39:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso858235a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714773; x=1787319573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=si0qdL0+WRVmcaDS3m3V+/d5WwTk85WNRswe6KdeyhE=;
        b=cjKczEB/ByxBcxw+3Cb8GikqUZc7Tr/PDjSoY5aLmmhrde45v760Y3f6Kl8wEzDrWs
         XRL4BJCBu+oh+lxKpBiA5kbXHTd7CAMFQyV1l9NaInj2L8UsiK8e0QzudOVZCgHasj23
         336CrQz01BDVXOnATgAoAJYP3QjqpsGyoTrqkbG0Pyh07ethfHn+uDNGFwX+paKlaptg
         Rh/KAawiu6hZkJu2ILAxaBNTtdNd2cpvHXQ/XAy3CbIVKU6D+TMWHVHzkfR5ZF6QpUOp
         Pv/dzMUyCGNIFCyOlRX3QDOGxM3gx7rLBjXrerhLGdcF6wdHBj0myZgK4pazU1HdjPgN
         n5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714773; x=1787319573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=si0qdL0+WRVmcaDS3m3V+/d5WwTk85WNRswe6KdeyhE=;
        b=USi+2VEskc3E2BW5uddbtAmxYBrho7gXdcLN7Q8hedAhslZXSoopSgLnYzXoo476HI
         xHO6RzTHjuVftzw3ow4MAWadzr1C6SFOtaaA6XdVybJXt19jnGzVXRfUDIt0kuYfOUlY
         pI1W+WWfosVUtrL7F/17ctZzGtL4dSJdV3oPWduvlmHYLT9RfRYJ5H3KcokaFq1HOO/T
         zgKaIdfMOPK8bPGYNmNncEWduR3KcQ2tPLXyZxoYDxAJwiFhJIHfa9rYZiRHSyUrXNTu
         lj3BZXDNpF9GcU0GpsnSMbeVOwIqD/3QAEwteHaJX9Jls4C/e6SeQOi/jtBX6JeI1bd4
         AdjA==
X-Gm-Message-State: AOJu0Yx11pNEDB1kZR+LcW7ujA1z11iXVlMsD3tAd5OXzUVV7OKd4jhP
	NxLFDyKBvGkrNMBpt2Fb9El4PEDBWSA/KjwPhZSjRPmq6Bs6gEQNDh63
X-Gm-Gg: AR+sD11xHMK2LCJh61wPRaeVSTO2eF/iKA/Uq0EmrFnV5EoD+IWyx+wqHy7qLgZOdz0
	AgX8QLgO4yc0CxgaFkHJaXQOjQW8CG122zGR8/N3ynl1LpViF4Pa0MEhuGFdJ7xvl92uKjzKV/H
	jd3suY6T31a+rDlOik2H8BAGOsXiSoT9kpFMAkJjGtfG+wxK804mzF46KzfbK9Ao6hmkDMK9LF5
	KbgXz5xQGjnleYfepL4ooOdfuLc6XK+JeaNafMBof7C04VwEKk2EoRFWbWvOX2oqduE0uYxvGca
	D6KVFT7+0GgOG/mRpJZMKUrMIZ8ypdfUFdOP9vlr0nM5zMi4xg9j+O9yinEuWAW0YmlS6G8ip2/
	zBQTTAFhAeRQqo4DkuOpQ6T00JzBc1M04OrfSzvf0ywBxjk6m8xv/CHeRgNoiUkWWI1UqF9gHF2
	JKRuJgdm8ycjHLAWrOVkIRcwhkEmRbcrgHPdYTX3R9uMKPaO0l7cK+P6wWqYCOiNQlKTeVSRJcc
	0lpsO3L
X-Received: by 2002:a17:90b:448c:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-3933b52354emr5655567a91.0.1786714772510;
        Fri, 14 Aug 2026 06:39:32 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eaca8e4fsm2767080a91.12.2026.08.14.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:39:32 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] perf/dwc_pcie: Fix PCI device reference leak in probe
Date: Fri, 14 Aug 2026 21:39:25 +0800
Message-ID: <20260814133925.1385687-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_063933_510764_1F11B282 
X-CRM114-Status: GOOD (  13.77  )
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

pci_get_domain_bus_and_slot() returns a referenced PCI device. When the
subsequent RAS DES capability lookup fails, dwc_pcie_pmu_probe() returns
-ENODEV without releasing that reference. Repeated failed probes can
therefore keep the PCI device allocated after removal.

Move the existing pci_dev_put() immediately after capability discovery
so the temporary lookup reference is released on both success and
failure paths.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 7f35b429802a ("perf/dwc_pcie: fix duplicate pci_dev devices")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/perf/dwc_pcie_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 5385401fa9cf6..baa736fd9a6ef 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -710,10 +710,10 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	}
 
 	vsec = dwc_pcie_des_cap(pdev);
+	pci_dev_put(pdev);
 	if (!vsec)
 		return -ENODEV;
 
-	pci_dev_put(pdev);
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
-- 
2.51.0


