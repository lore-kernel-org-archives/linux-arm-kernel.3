Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B2FCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNSAm6axqZ05EaUIQu7UeTl8Xa4fDLcv83ivPd4b89Y=; b=onguytdr73LDJf1NpzEz1hkcpc
	pUQj+5oG38WNiTxBPWw4d+lpahMAlq8RDl5JBiAhiu/IQobrAyb9n7796D46leik6CNc0RMsNwXBN
	V2qIm6bTPP1s2FN1ZafN4/aIX6p34dHcAiIxEXrreBGMSb0eeGNteiTFSAqhdBuUZ6VOOiKu+rdA1
	GGKx/1Zb+vVrM7vrEM09gvKDT/TmuBV8q1wFIE311iKOIvJHoqPVkgdE1TYocc1RK7y3t/E8bwhUq
	uXRpEFjo7JNvTE/0owdNwdrzgCr5Zn6L1QMX9Lq2qlICKg5nJnuZV/IhkXYrHAPh5J+7drviDdFOQ
	btxhFViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDZ-00000006rkG-2405;
	Fri, 08 May 2026 15:34:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDT-00000006rdP-0eag
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xNSAm6axqZ05EaUIQu7UeTl8Xa4fDLcv83ivPd4b89Y=; b=ogQaNiYLTgCTkvFsWweco5KoWS
	9mWp5rYgr6mXDhEZ5+RjOlVoc32lJ95yEuXRTD8ynzqJyHoKwNqsud+A1NQMSemLLQta8iSNOnPW8
	XcvzHU5RrgR06x4sR0bJE1fYLZztQ3tu1DWVOhcyr0JVgPPS3z8dKKgRC0td0m/62rcgXt7ITESQH
	i2hgWsr0+xipePiUyi5HvjIAkMd11sSSrsRX2fMi+ndQ+1aNbjOitfd2QGh+nzzRIQ6rJ4pWPvTHk
	oXnpQQB688NmqWgK1hE+NKjRz1B7HjapzxbaMwXmwc3fJx9/WSf5XYGTjPlb3SXPJFURJucw8+xGG
	osRDRFog==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDP-00000006iSJ-1SZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:34:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0D93359E;
	Fri,  8 May 2026 08:34:04 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D506C3F836;
	Fri,  8 May 2026 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254450; bh=STsX6b3KBooCmiC+B8JoLtiiyGldyQ5DAhwCGnjnvhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UP+prNQMf+nvYQ85658n34TX5u3a1kGTtXjybUk0uzJlMU5TP04o7e8yXlSinJFeT
	 N7jf/9zodNIoWYzyq3z0SYhchx4TL1EyGfal/WfpHcxobNYQGvACWcFbjnmgQS08tH
	 X+amAnLydNvSMHPekU2QXAmoMgP7l+RsO2vUn7r8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Fri,  8 May 2026 16:32:59 +0100
Message-ID: <20260508153300.2224715-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163411_899875_4F41BB2C 
X-CRM114-Status: GOOD (  15.01  )
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

Lazy discovery of discrete rates works as follows:
  A. Grab the first three rates,
  B. Grab the last rate, if there are more than three rates.

It is up to the SCMI provider implementation to decide how many rates
are returned in response to a single CLOCK_DESCRIBE_RATES command.  Each
rate received is stored in the scmi_clock_rates.rates[] array, and
.num_rates is updated accordingly.

When more than 3 rates have been received after step A, the last rate
may have been received already, and stored in scmi_clock_rates.rates[]
(which has space for scmi_clock_desc.tot_rates entries).  Hence grabbing
the last rate again will store it a second time, beyond the end of the
array.

Fix this by only grabbing the last rate when we don't already have it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 955bb9565ce3..ab8c65ed785a 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -582,8 +582,11 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	if (ret)
 		goto out;
 
-	/* If discrete grab the last value, which should be the max */
-	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+	/*
+	 * If discrete and we don't already have it, grab the last value, which
+	 * should be the max
+	 */
+	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
-- 
2.53.0


