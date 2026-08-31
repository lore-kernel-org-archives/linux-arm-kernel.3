Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A1C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MVWbIG+FPtZ3MOvl/1hLGDkOqyRLPEPkcfNhS/eoCo=; b=R2vEuLM6VsOVYbIDR8XePa2WpU
	Ca0vLVixylR0MOUiQpPG0qb0KAvrOEWny48b6FRN5fXpde5lDq+HrgrrHKOIeaQWShSRsXQGkSmOl
	gsZOYx3jvpFtaoHDbthfpDxEZi6uZQvlO7MbReWmaO7n6/uxnhW4Y8WYGxuFZ2hMZ/mzkU5MiGapQ
	ZInJSYK9P+JrXqRdJ9ODolmy+n2XMQbqhgzoWEkJrmtPQSnp5L5YHUKkRjmtaoaWsRA8TliTAqe2b
	OARiK7k8OIgzWkYWOA3vHle6cpohxMBJ0dNy9vzSpFe+D/I/DvgU8D2YOY0xUeM35o6MhNROVdGPw
	besEk2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y3p-00000008zT7-0dXs;
	Mon, 31 Aug 2026 09:12:13 +0000
Received: from mail-pj2-f8.google.com ([74.125.227.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y3m-00000008zRo-1sAG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:12:11 +0000
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so824481a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167529; x=1788772329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MVWbIG+FPtZ3MOvl/1hLGDkOqyRLPEPkcfNhS/eoCo=;
        b=B8pPHyaqESCv9YWn5lFG52RmpklRErP9lXYDbUVmtegf3NXnuJ5Y+bCjl5/0d1P5CV
         FLIDd/ukT+zd5K4YUweEYyO+jtZazL/9doedH01MO2RDzALB+zYXxsRgSbl+FDuUZ4bc
         KiExqaOZIN3OrJ+WzGnckUdC/ps31TusYdaGQq1K/WKKvazJm2Z/NTafkX8VhqN3bwZa
         zttT4c8XQtYNTKTqQ9V9eG1gbJD2knr0vg6p8LAzUd/2dTE0AJUs5c0Cue+CErJzzoWc
         f1fUPvntLFF9JSmd2MvH0viAC9NEpPtVXw9nXJ2NtjvXjLOHU0GVObt/TX5CexDevqBD
         saNw==
X-Gm-Message-State: AFuF++mRv/M27EjJ59RuDIozxXyUquQ95pTqajOFXh7XIQFhZfIx2F66
	kLQuqU3vglhqiIPIaVIqhjt8WhNYlSc8lLYADMLSUnaBMi+Yv6DUFjFhES46bkgg
X-Gm-Gg: AYBFou1DfAWEHEcqNUmhxN27PxV61a+bDbcTzU703J6FhPG+nzZxTVOO3rlo2YdzzkY
	ffwPvta4dx5OZHFqQ1swcp8pXJosQ/6hh0U4v2BebPQNkv8f/QXmF17tib1SQ4XnbqfeMJ4Siuf
	5iGG7E/XUZwDGZeuY2G8Nf2tqVXkQbTxqWIG1zzPBm54kshD4IvS732WeojAZJ4T3GO5/ACBvAI
	eebMJpUs4I1NdVQksDu2pWbjOih+oPCC5frFu0ylOHhbksttfeUIlcK/YQyj/wcGNxyS9HSbmsJ
	mj3e8NltCDVGo5gw4sqL21QQq0UYkBYgO+q+7QvIKVt6/iHQxdox/vWOXM1W/3ftlwPm3mEjCeZ
	/8D2p94o7KyIN3dUA6ATXkOP4KLnZmFF6elpA7gLz5CZADsYNSiPhV9kk8OvSsVPQSRj7QpTO/9
	gglwMklZy6HZNT2nKVKcnMdIJ5hSdcV5K4hp56GGJvxgncgZWB9sPLGlo3KkKWZuIsZfogfrT9z
	GZnFlCbgQ==
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr10064170a91.7.1788167529083;
        Mon, 31 Aug 2026 02:12:09 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952ea3dsm31587995ad.24.2026.08.31.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:12:08 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: patrice.chotard@foss.st.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpufreq: sti: avoid NULL dereference in dev_err()
Date: Mon, 31 Aug 2026 17:11:59 +0800
Message-ID: <20260831091159.3906287-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_021210_485179_B89C3EBA 
X-CRM114-Status: GOOD (  11.43  )
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

ddata.cpu is NULL-checked, then immediately passed to dev_err().
Replace with pr_err() to avoid dereferencing NULL.

Fixes: ab0ea257fc58 ("cpufreq: st: Provide runtime initialised driver for ST's platforms")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/sti-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/sti-cpufreq.c b/drivers/cpufreq/sti-cpufreq.c
index b15b3142b5fe..144ac0f1d85d 100644
--- a/drivers/cpufreq/sti-cpufreq.c
+++ b/drivers/cpufreq/sti-cpufreq.c
@@ -263,7 +263,7 @@ static int __init sti_cpufreq_init(void)
 
 	ddata.cpu = get_cpu_device(0);
 	if (!ddata.cpu) {
-		dev_err(ddata.cpu, "Failed to get device for CPU0\n");
+		pr_err("Failed to get device for CPU0\n");
 		goto skip_voltage_scaling;
 	}
 
@@ -281,7 +281,7 @@ static int __init sti_cpufreq_init(void)
 		goto register_cpufreq_dt;
 
 skip_voltage_scaling:
-	dev_err(ddata.cpu, "Not doing voltage scaling\n");
+	pr_err("Not doing voltage scaling\n");
 
 register_cpufreq_dt:
 	platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
-- 
2.43.0


