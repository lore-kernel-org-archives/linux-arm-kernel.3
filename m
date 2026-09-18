Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CD0C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BgrE+qMf44HKw8ZKydwe+LbuJjw2yiC2KnJN/ZD6phg=; b=ioVrTznyD+SsCYrxUjIP8xnwlc
	nfLGCsH2sPEzgxBMiUrNYBkzVmqAxMhndUaQfmPO+bIk5Uy3eU8mGM0udGqeAKzvN+xUUQV4aI2Dz
	++Cztx6GnHyAqfq+IwaQG3dE2XmXv4hZfFO2NaGkx3TsRBHf5tvKzoNS3L4Y9cimAMPcJ83XFdiOh
	lwVNkt5NZdxzOC0zBASJ3S3DVdLFlocxiZIygK5O/bl6key7Q+FoIukxlOZnCDxIDQJlcWyJ7LTVP
	87t2e4wql+YshVpqwhihFmJaf8+IOqrpXKZxmhM+zhhTk4S5omYwCUJvz+vFrqrN307qIl1jIDqaD
	S7RQxK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bi3-0000000F4QI-0xrw;
	Fri, 18 Sep 2026 16:45:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bi0-0000000F4Pp-3PDk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:45:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db18fe433fso8650465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789749908; x=1790354708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BgrE+qMf44HKw8ZKydwe+LbuJjw2yiC2KnJN/ZD6phg=;
        b=N0pGJXH97XGoKMuhMfLrM9O45Wv8QdXEQi+3Vn7vLiDd8knjxhimN7RIrvwsOsNnBF
         UrgVAytnV3cPxk5Crf/zRrV5Ex2UzpIHRyq5UukqLgw8PYcenJCt5QG5OPB10nCjbMG2
         EUwnew6Cg3y0uPGz4oQcLYHcB6+ZkGt+vLLB/GRYiMsJr5TTxptxZIHSza0BCA2bfrQE
         CC0s5zecILJjh398CXw1FDNn9mgZwR4ybgGBvPMiIECgqTTCFZj3r+az9+48V8J9INR6
         grgBaKQ5eNNeyUwehBMtCuC8cO3fXLOrKdcjPanTrrTlTLLnB/+9mmYVFcAqcbAVr137
         jf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749908; x=1790354708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgrE+qMf44HKw8ZKydwe+LbuJjw2yiC2KnJN/ZD6phg=;
        b=wlP+B5Z7/ksG7EtPQfy40bOZCtPLxuId9tqnLKFaOLxq/JGEbR+SCr6HstoFXg811w
         7FNpZywDJWlMcU3mSCL7pLykUP/WeCI9bWSJ2vaxcjTatEgx5/sznJeYKuYzwEeCsbyl
         XPRxB2q7n3+LefC8X5hEQUCyw/4gGyxFNbNmOVZK0HF+qKotht3A5aF9sedTsWFSMc4n
         +mppCBhE/3uc4Q4tqselIZpIqsE1zE7geTN458tSijcvrlebwNv7nixGEU3K/h0c5Wtt
         3l1OKb5ZReQbXUqzaECsijSfV9YE21FAO3bZAEfBiuW4cC3oLLayEJ2Vqp4B+3t9Fvis
         o7WA==
X-Forwarded-Encrypted: i=1; AKwUvByNJEO6JXzrFgGtf5h6HemMTyNg+kAvD7pfgoczNOHoR3rWzTh2FiMsqBW7nPOqzJHkKOWQabzQP2Uj0VLaXYU0@lists.infradead.org
X-Gm-Message-State: AFuF++nK+zNy3GG9MwdeTfyIoSVlwj96fDPu9iQ0VzdctuqXeF+83kgO
	DAe0iwTAEjXW/Fs/M1s9JGa/nVVfVyvAFmL5O4RNF4IxNv/r0dlE2mjV
X-Gm-Gg: AYBFou2OnbUrKiT7evES0dSiTHhZRqN1QasOZdOnVhmklUDPHTu0KRg6xlBYqbWTHVu
	QmlzKmTLXekvgcXPlubDzT0Z88n6jd7XKU1J0NZRxP7hD/p10BiIgoNNY2r9lMYbSe40mMyhTra
	SKdOlrvuBtlb4u2GNHcRpo69XplNT/P4AYBMZhr0B6QZ0RqLnxVfWN0AlHKC+mzPQYfHxezbxkS
	o5bBNycC92K0rtuJdaN/tgt1ZYKfNspuVvbgz5YvkOfN5q7lCfmchFzoUqRppOy7V9eU7Y4ja7E
	ha9m+MJO7E3A6RrsguLJ8NiyNl5+9ooUSU9eQJ/k2vzqOBB79gA37tBGvxCJRBADjVMADEvl5d0
	BgBTya8XgaEOrCeEfoTjwOQADDWWionYbgnM0nW5bVmlAM3pyJ2lgU+Nofyj0VfTGb1usHRdPYD
	VqV0jHwIhjvF4ITyal/JECI/rxKR9o+ljg2MSMaTOFaPYG077IqE4NCEjICHpAZr29C5aOaTaaT
	mai1tovkMKWJ/UPhfggnly9mF4=
X-Received: by 2002:a17:90b:2f47:b0:39d:eca2:5c81 with SMTP id 98e67ed59e1d1-39e54b19f9fmr7403518a91.8.1789749907789;
        Fri, 18 Sep 2026 09:45:07 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca86d83sm206717a91.6.2026.09.18.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:45:07 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: cadence: fix clk disable/unprepare underflow warning on remove
Date: Fri, 18 Sep 2026 23:45:00 +0700
Message-Id: <20260918164500.2726242-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094508_853906_A3FDEFC3 
X-CRM114-Status: GOOD (  12.40  )
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

cdns_i2c_probe() enables id->clk via devm_clk_get_enabled(), which
auto-disables/unprepares it on unbind. Runtime PM autosuspend
separately enables/disables the same clock as the device idles and
wakes. remove() never forces the device back active first -- if it's
runtime-suspended at removal (routine after any idle period, not a
rare race), the devm cleanup then disables an already-disabled clock,
hitting the "already disabled"/"already unprepared" WARN().

i2c-imx.c has the identical shape and already gets this right:
pm_runtime_get_sync() first, balanced with pm_runtime_put_noidle()
before the final disable. Apply the same fix here.

Fixes: 3d36dd1161ca ("i2c: cadence: Simplify using devm_clk_get_enabled()")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-cadence.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index da8770182a18..d0919593456b 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1625,14 +1625,21 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 static void cdns_i2c_remove(struct platform_device *pdev)
 {
 	struct cdns_i2c *id = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to resume device (%pe)\n", ERR_PTR(ret));
 
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
+
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 /**
-- 
2.25.1


