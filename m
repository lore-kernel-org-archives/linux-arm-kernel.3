Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D72CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5yh6tx0rcTXUg+w8H4oTXcRUK8TzdWacjEqbGEhyWGI=; b=FgOAgZOjNmHDLCZfeF53XBHfzk
	g2BDreM1FbQLraCGaBDZfmU+Y/ZGxhPGSsVWN04JXvq00a3u5c9iPqh3eL03nRrLArzA4Z4sDMAyp
	6qW0xhFpOk7f5DBAjWm4HVWQru6Uibc07Xxy7dWDak14fC8a+6Ba4Gtwir8hMStPoC/GuJSbU+A4I
	gMWuH98x9cvzZZm35UVditKqmcvv43o26hRW2ituhRr31D6+EWyK9j7CEaZmbFjKEbLCcRgs77/zq
	bUfnnoJ+L5rhBiD2QqpCzhvQC+5qwwDvlIutHFa81+dLVu5R8FUDpy+Ol90PuLKsJOkeBiwsUM2aD
	cMZd3MLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfj0Z-00000007k18-2j3S;
	Fri, 03 Jul 2026 18:53:03 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfj0W-00000007jzy-1x2U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 18:53:02 +0000
Received: by chaosmail.tech (Postfix) id 61D561CC21E;
	Fri, 03 Jul 2026 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783104776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5yh6tx0rcTXUg+w8H4oTXcRUK8TzdWacjEqbGEhyWGI=;
	b=U+ydAsT3oX7qKlEr/7lwYq9PYT+vx84UTPKteCxy8BvzQLGk0vqE2t6kQhoPW+tJngcZJ4
	NBagcVBkm8QrO6P+1r4SN2cUpG1CRZ5ztoTTZCfInyjtmBtW2Wm7HxdJP9S68eEkJ/pF2I
	WDD+eSj/SBTSiin62q2v/KiCBE63dqo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 03 Jul 2026 20:52:48 +0200
Subject: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWpIRWuIha0g7Hw06pIpHdXL
 L/Fezc4skwO6uQGSyc7XpeILE1AT90ykmATDShRyVLmQm9+sLQLVQjsMDclqoxkBTHYLA18fbO
 m/e18P5M+3gOE8AD6xnmUbgAAAA==
X-Change-ID: 20260703-cpufreq-64-2a23d7261e09
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783104776; l=1126;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=pKYXT+BZ+wJ3YBFYOlgjpxbv7tZC2s26tw/M0N6OYfM=;
 b=rV8RlNcoGB9fGgWZo6PqV81pKfRxc4rz0NcyYGjLsMbudvptfAgphE8sUtztRKBGcLRxKfjhX
 Qj6W+EKtlWKCbSUsLjU5ijhZi4+d6qBuvEjtREm7Vtlu9RHYd1caEeB
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_115300_965958_D741D306 
X-CRM114-Status: GOOD (  10.98  )
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
if run on a future SoC that can boost higher than 4.2GHz.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 638e5bf72185..6a0f1d36578f 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	/* Get OPP levels (p-state indexes) and stash them in driver_data */
 	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
-		unsigned long rate = freq_table[i].frequency * 1000 + 999;
+		unsigned long rate = freq_table[i].frequency * 1000UL + 999UL;
 		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
 
 		if (IS_ERR(opp)) {

---
base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
change-id: 20260703-cpufreq-64-2a23d7261e09

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


