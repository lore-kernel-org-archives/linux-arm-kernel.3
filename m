Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1781CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiKXRUXn6xq6TYoI+Rs6kF3Uk5jW2G5xFTPNGqprSqc=; b=tGZ0LCGvnIMQBTOzAO/3wAg2AT
	AfnXI4pwQRJYf5WebC5eryNXqFv0KbLJq9Eml3LhloA4OyIMi1zuyDOUYhKEqWSTpPRK7Y7zgFfy+
	ZxeeL1aTh5phG5TjfmSut+mBGWjhZVsr8EAGYkyUV6BFtsnUUQCkUuvnYoNJ7fbfc58geucHQz67I
	sMgH2O9cxk0S+1IHxwZ0GLFnx3CUP+ZY7XRvaj9bXc0pZV7skYV4Zn7wuloG1MVHrTmoHktfGCDjq
	62A/fBJqIcLo0gCQCQMoUL0uQQkNAGta0FTIEODh05lZmfmyZTPAHG5e2JS5u+VPDoKeBs3E2uxCW
	o8853gJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4J-0000000DUiG-0CDS;
	Mon, 20 Oct 2025 12:32:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2B-0000000DRgh-2seQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RiKXRUXn6xq6TYoI+Rs6kF3Uk5jW2G5xFTPNGqprSqc=; b=WwUsKfyiuR1RFOaKF3BD5nlZFo
	2w/261YzzeqNnM6MAaLguLt2WJtPVZXA3ne47d77Vr8xJ/XMDFJu0GLI/tr/91OUlhUxkQePewdbq
	jsK3uHNP2Q1P/oLgdo2ClFi1tnVXMxQBwhK050bjHWm2aN+i5zGRdjrCjjCNObnaHZuFxaFbCVDi/
	UXMJXzSgscPLrviHN9KVjy7cye+rsBx2NcBJri5/pSnX6r/zRDAJhfJcgJ7Zry7J/+Fdwu1o66PQS
	G/YOPwlQnSITcpo15qHC6sdkJXQaMn4zxOYlViIGKwkQT5EO2qbssSlJb+XBi0R4G2L95rc5cLwed
	6ZQLNmLg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp26-000000074BW-30VC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DCDC450A5;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51595C16AAE;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963415;
	bh=SD2Umc58RAYBDBTzYKG/F/oMtl5Yq55ujhMJL6VW3lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ile+P+67iCccGOyk8MsETfiEbnx1XINkCvcKe1oS0JLCfbTSO6bT5eLL1vmiGqjlY
	 hW69mpFQsuZRRCUr2MHzNB0BplAZGaajF29Ib6eGFJZXT1zTgDOaARtI5ANTmyU+ZZ
	 gGpQzF7tzGoVsvXdCoj9vcONOvx8w2RIZQ/6e9LIOQFFVTTnLBxUZXg/jbtMlunIoV
	 x+ksrfeGMsm+ki0fYJydhWoCovfcZYBckl7k4M/RZTqcnzQY8f8p/sJX4iAcFEOzgf
	 7PivfJRjM2RCYW1FPjrehrX+B3Vbu0YmNghcWa/OLZn7wKelAP5ha/bcGar7EA8QQO
	 DrJtcUBDZH4KQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1h-0000000FUu2-1rqN;
	Mon, 20 Oct 2025 12:30:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 20/26] coresight: trbe: Request specific affinities for percpu IRQ
Date: Mon, 20 Oct 2025 13:29:37 +0100
Message-ID: <20251020122944.3074811-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133040_136314_E246B0CE 
X-CRM114-Status: GOOD (  11.83  )
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

Let the TRBE driver request IRQs with an affinity mask matching
the TRBE implementation affinity.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8f17160fec442..9f64f463339d6 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1494,7 +1494,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 	if (!drvdata->handle)
 		return -ENOMEM;
 
-	ret = request_percpu_irq(drvdata->irq, arm_trbe_irq_handler, DRVNAME, drvdata->handle);
+	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
+					  affinity, drvdata->handle);
 	if (ret) {
 		free_percpu(drvdata->handle);
 		return ret;
-- 
2.47.3


