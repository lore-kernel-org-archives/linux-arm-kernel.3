Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF986C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZU8H4o4KTkb6BEX2VrLFhnIWaFZnnK8taJBxY5eb+bI=; b=MqucONuTzt4NeiJ4nt8bEyheTZ
	PfrjNRs3hobnTVHTOzNZDNzWtPIiShrHA0gg/P7SxJoUHwodcHLsXh4jhbN7APJYB6G6HzMdxrWEl
	O17sUihljsDBgYmMeDrFox/oote9AioGe5+Rvc1HJsOSg73VZE2e2mIozbEvf47gkRrrZHPygxfyV
	h3lZmVCJ6ZdZABrGnWwAqORgjlfPBDL0O/DKQygJFfMo0QdIdzpu0B2+Ja2kTDIzBMcMsQFlicG12
	+MRRmeVgL3ES8Dpfk7zGaPCPqNggGAj4b+dHzOEUpDB2aJ1XFGakHQAIrP8X5Zehex08nCqHNDlNj
	CnW4FQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliV2-000000066Cy-0YgT;
	Mon, 20 Jul 2026 07:33:16 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliUy-000000066Av-3Ob6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:33:14 +0000
Received: by chaosmail.tech (Postfix) id 3AE4A1C8676;
	Mon, 20 Jul 2026 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784532357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZU8H4o4KTkb6BEX2VrLFhnIWaFZnnK8taJBxY5eb+bI=;
	b=WZLAR6na6wI7D9oror3TOoNxolFu58n2FIqQpLaY3PSIGomx6kX0seBrLulwSys8LDwSsX
	MgAjnD1PWjv/S3A0hFFxYQu9yE8T/CrjyOL3qPf/nf2YQPp+gJXd/I2/ymdqdM1+1UIPvH
	rJVGA/V/b9Kibo4xZP49fI8ZO8Gk+Ic=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 20 Jul 2026 09:25:10 +0200
Subject: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBREf4XctTV9YBtc8R+GRS0XuUYBW2g0h
 H+3xa3Lk8ycmRUCesIA52IFj5ECjUMCeSjA9Xa4IaM2MUguNTdcMTctnccX0yWTVqrWSC2QV5A
 Kk8eO3rvs0vw4LNc7ujkbcqKnMI/+s69FkXN/xVEwwVzJtTP8pERl6/RlDE9Lj+OMrodm27Yvc
 l/rhrsAAAA=
X-Change-ID: 20260703-cpufreq-64-2a23d7261e09
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532357; l=1448;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=tZhM/iGRRI+oZD5fXQ5GSzTaLhc9y+lLypS7IUaOEQk=;
 b=8SXwAKh7TXuOgyGGdO2AwRp/Tzz/IEEkfMgzHejSJrJTksw4kmQHgHd+K6CsujzN5ORVt2YwL
 QJRRTKA3HnlA/lOU8JsMyRsR0MBdClhN6lno4cT+7mq8Gv//EBIaApK
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003313_014182_88C3B633 
X-CRM114-Status: GOOD (  13.17  )
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

The current frequency calculation is done in 32 bit, causing problems
if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
should use a true u64 instead of unsigned long and "knowning" that this
only runs on 64 bit machines, but the core code uses ulong everywhere,
so this should be good enough.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Minor style fixes
- Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 638e5bf72185..5ad274a1e6ae 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	/* Get OPP levels (p-state indexes) and stash them in driver_data */
 	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
-		unsigned long rate = freq_table[i].frequency * 1000 + 999;
+		unsigned long rate = freq_table[i].frequency * 1000UL + 999;
 		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
 
 		if (IS_ERR(opp)) {

---
base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
change-id: 20260703-cpufreq-64-2a23d7261e09

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


