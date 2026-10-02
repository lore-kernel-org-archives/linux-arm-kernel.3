Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D47CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4Bf2ZFROeohsX/7IoYLRoVtwsXCs1sBLFwVjm2jBVc=; b=zRgV9DKFhV4pJ5bxQEP+yR5KXu
	teX5GB5dN4Ob6AX5KFxAUJGc88/64+XOz3XijRBfJtB3aForYK/AIV7ZYOHfwRwqeLZTjlZ12ozSy
	ySdYyq5n638jyGsWjb4cFtcSAcBsKTi6OYgL9SqR0YnS7NXQmYPPwUPOM4XMsDF+xb/Uuydyh90wG
	AqoN8VoSrtEcWg55b05u6eVuzJm6LWBixBNSfyzwLry9du8J8sg4zVmtrX2xWdQl8M3GSM5ACiCTs
	PgvgQQ5hdLAZSqdvTlVOZrhWxtFEb0tCUS1bY2cvubfBixCcU/uO6HzvSVwVgOYDrL/9khx2H81kM
	LEs2QVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXr-0000000CLlh-3t0z;
	Fri, 02 Oct 2026 19:03:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXo-0000000CLjJ-3woa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:03:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC900169C;
	Fri,  2 Oct 2026 12:03:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B45C3F85F;
	Fri,  2 Oct 2026 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967824; bh=M/H8p54y9BAGRBok7Bq+l77HPKLtLrhketpnjFmnyH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WfhCgDK+9XhnjuR3De9jgnN/FGWV7aAaabtw2WRZQwoIqu1jMtHgDb8R36WqYIkv2
	 N6Qrz1c1UJywEo4Zh+8PONczt6qLbfWxAMJjTnBzaidXRLcziBiOX2T5XMz5oDua3o
	 XHuxCi0p0MUrXz++56+j3NrBs8NeS58J3NGQ4eyY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 02 Oct 2026 20:03:24 +0100
Subject: [PATCH v13 03/14] coresight: etm3x: prohibit modifying cntr_val
 and reset while session is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-separate_etm_cfg_v2-v13-3-fe429d8d96fb@arm.com>
References: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
In-Reply-To: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=M/H8p54y9BAGRBok7Bq+l77HPKLtLrhketpnjFmnyH0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwAAANaCHRrJq1IZ+THa9oiCN1RzwHFjZqtQoL
 11fkBrmWneJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasAAAAAKCRBt1cPRWsUx
 M6znDACpEU8j77dVWTk+2JlWg/gtTni5kf9ZczFAGLyz3AWr9SML5TihyHoKluhPWtsea/K3uNE
 kjOydUDPPGp5JaV/HRWz5oiDBhZLRCiP8kZTIFoj2k/SvZdZOOYc5nhkPE/A8oeUTOvs5Oksft+
 RkfnEXWfVey0S8JakaGq45Tcq7bTz4sGXTy5wN7Sc4dsRCqiXjnwBTIeX908Si9ssOmSlqi7Tma
 fohyKtrQdvt3mjehFPZ4ppLAkRtXk4FTNgnQbhs3tmKz/pAJi78EbX3rWCPWHvSuBTLydbYqirc
 4zJsxoOWlE6iRcts4hRyvX9lYwH7nARggktYyIXn/gtUA3Siy7xYVP4PAJzHz+uX3NJI/i51r9O
 BdHB91LZdrLNZgTBsSxHZe5SazfjV6TqIcMVxzUY6cYSYlAXEJKn9UMMm3PmzTjKowehlT9DPrU
 Rx4rZMV1DX3BJoI6bVYy6lkjgEYwvHimRvQHJZyhyqeMFb/NPoVr5t8A6lmoehmjwd3Jg=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_120345_086828_E1BB03B7 
X-CRM114-Status: GOOD (  11.54  )
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

cntr_val are overwritten with the values read from the corresponding
registers by etm_disable_hw() when the session is disabled.

This means that any changes to this value made while the session is
enabled would be lost when the session is disabled.

Also, reset shouldn't be called while session is enabled.

Therefore, prohibit modifying cntr_val and reset while the session is enabled.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b3c67e96a82a..cdb70a4382eb 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -75,6 +75,10 @@ static ssize_t reset_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	if (val) {
 		spin_lock(&drvdata->spinlock);
 		memset(config, 0, sizeof(struct etm_config));
@@ -744,6 +748,9 @@ static ssize_t cntr_val_store(struct device *dev,
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	spin_lock(&drvdata->spinlock);
 	config->cntr_val[config->cntr_idx] = val;

-- 
2.43.0


