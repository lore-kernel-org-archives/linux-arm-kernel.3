Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76444C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TllJCv4hZGEv4MQpD7/+87GoKncl49dwvargz348xj4=; b=aSvbWKfFzxn+M37dVkKkZsQ9tk
	Yh4ohxDI+GIvJ3XCMn+z4quFGV+rx+S2hvmyFOhE4UElXi02uBmGejhW1FG5uR4kl/qw2x9pgqAwu
	SkZn3IQ0nkDbYotyN4SRZq+IVR30GBUGTZdXi+d5rBNAgmYhrf/2q9YT3TjDf62yu0InuylMVcygf
	vfYXvTncju2qcrd5i0FyinjtaUY6mnKkirS1VJ4eRO38NzHb2jckHOyAbYTwpoB3OMlYOrRl19+z9
	QkprQUxCt0E4sOKCXNjv2MaNLKL7XVu+YtiWXfrFehfXzr5rOJgWfm2PaLGF9bTkcxIrpV43M+6uk
	N8833Fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nL9-0000000BmGd-3LQR;
	Thu, 24 Sep 2026 17:34:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nKu-0000000Bm8Z-0OLA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AAA01E4D;
	Thu, 24 Sep 2026 10:34:15 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6B273F86F;
	Thu, 24 Sep 2026 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271259; bh=sS68p+atF2H8DVQ56LLhJJdiwhdbaXcCjWgoc3iiZJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KjFfftV9PivAqPaWnCX/EhuACvFWPoPKGysT0cTibCTb1cM52lDIoPL8wKJ1RZJx0
	 CfP1EKbCEBLYqHnVfMYlO+TOVXYW8rV6g+LJLPB77frTvpXe6bxethDCsrHlxrtrii
	 BE8dlj5MwzYcDsmngdrui1SBQRByDpQ1YBNxBxN4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 18:33:40 +0100
Subject: [PATCH v12 02/14] coresight: etm4x: prohibit modifying cntr_val
 while session is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-separate_etm_cfg_v2-v12-2-a2b41d2f7c2b@arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=sS68p+atF2H8DVQ56LLhJJdiwhdbaXcCjWgoc3iiZJg=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8MfDB1+nWZx8wYikco0l3/g2a5nPn9uIViT
 c2Xq3C9BLKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfDAAKCRBt1cPRWsUx
 M5zPC/9KRSAhvos1jMAiZwYx1G5YpmNDuJuk0N0s+pE+tp/HEdEOKIwKP8dc1Hwx0ejENEM+Jfu
 0mbSBa+XCu+AaXLDjIrSliT9HATTpsA+B3BLMx6s4iwNmjeZEScFO0gEKUxsmuWmjCkvEpk4SYD
 mprsSSBBiYE9TuzkPcPBvDVOPRQ+A5N8ltBA4zT3P3a4yJbEE5x/z9tkO7WA/G3G17UpypVwFSA
 6s3sWAr9LL4CWNurp3qXU+F8dtxBBywpcZS3f4A5ENa7ZHFC886Z+TWLmiwP/NHhsnPLDqxN8+b
 LWdYr9C6Ki9ZsTYkXoZeA05DHIIqOkJ01e9TYKPzRCXpu4qa9NruZ3+CrbcOt3HA/cnIUGgJoMI
 SJMeRRhGIbyk2WWvpiDTswqewRVj34Dux3DBvyhU8sb08jhVJTiMITuwN/R8FSS2KI9g3vXka1n
 mFWe03P9JCZtJZ/9C/1tqsGRB06Pw9sycSM1SaZboYq+lsU1FGaX2CUdpZVn+Fl9bWO1A=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103420_175086_459448B0 
X-CRM114-Status: GOOD (  11.82  )
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

cntr_val is overwritten with the values read from the corresponding
registers by etm4_disable_hw() when the session is disabled.

This means that any changes to these values made while the session is
enabled would be lost when the session is disabled.

Therefore, prohibit modifying cntr_val while the session is enabled.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db3cf4ad6806..a547de5a3f9c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1615,6 +1615,9 @@ static ssize_t cntr_val_store(struct device *dev,
 		return -EINVAL;
 	if (val > ETM_CNTR_MAX_VAL)
 		return -EINVAL;
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;

-- 
2.43.0


