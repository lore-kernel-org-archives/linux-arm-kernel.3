Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyT2bWVdm8wmAxhKkCKSvPwD0J4OVrLrdd0IgPYh5vI=; b=4490yRlXUsDiBEj7OGYH5tNNFH
	Q6g+lv89Nom6lICJ/UaGGqN9fs0YA18Gq7PWDLjdf4G7elTv0Zd5tD+yjRZNQPKesVkwli5JrmTIi
	bNMl94tFaYtE81b8NkM9Ojc+pEHjDsv7vKyN/SQux0Y+95PIZmkBqY3KSlNblO3zrVNk8UXbnTOe5
	8dtBCG+boPp9gxyYkUqAiE3/hEedtqS2VmK6722O7epAgZKIRQW+G224m+dYzcDUhjIu6hwpkpSuE
	71S2wJgsiVhv/W/1ojHeH+7rpd4emVNN3w5SzV/HSiZ8uGCmF9+Cl1FCNjkIt90DJkUkFEiG5i4f0
	Byit+VRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkSk-00000004ZC0-3hMv;
	Sat, 09 Aug 2025 14:22:22 +0000
Received: from smtpd7.iitb.ac.in ([103.21.126.62] helo=smtp1.iitb.ac.in)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkNl-00000004Ysf-3jBk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 14:17:15 +0000
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 3E366104D009
	for <linux-arm-kernel@lists.infradead.org>; Sat,  9 Aug 2025 19:47:09 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 3E366104D009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1754749029; bh=oOl1lfLluUGf8jjlHcaqlYu8boxJMibtiQHsH1EO70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUjWjcxO0askdcgNxpSgwzEpoIhQr0xWrF7Ia/h0BmtUQQjmhYg1zrgSmhym9CIwV
	 mPEiYvCkQkVATS/E25lXdwz4QUyb+ovlfjeryByMlPiI8fDwJEhInLV/9aWytTfEij
	 dV72HIsc0oeyqXQhNcIFY2r+WasaiiFkpdhZCsnM=
Received: (qmail 13276 invoked by uid 510); 9 Aug 2025 19:47:09 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.460336 secs; 09 Aug 2025 19:47:09 +0530
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 9 Aug 2025 19:47:04 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 3A54F341554;
	Sat,  9 Aug 2025 19:47:04 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 1B40B1E81308;
	Sat,  9 Aug 2025 19:47:04 +0530 (IST)
Date: Sat, 9 Aug 2025 19:46:58 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 1/1] cpufreq: armada-37xx: use max() to calculate target_vm
Message-ID: <26e67441fd3e91beca47fb4b6fb2accbe1088c79.1754747831.git.akhilesh@ee.iitb.ac.in>
References: <cover.1754747830.git.akhilesh@ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1754747830.git.akhilesh@ee.iitb.ac.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_071714_183629_596D2E57 
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

Use max() macro while calculating target_vm to simplify and improve the
armada-37xx-cpufreq driver code.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202503251256.rrl65HgY-lkp@intel.com/
Reported-by: Yang Ruibin <11162571@vivo.com>
Closes: https://lore.kernel.org/lkml/2c55fb07-b29e-43e0-8697-f75d1f0df89a@vivo.com/
Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index f28a4435fba7..0efe403a5980 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -265,7 +265,7 @@ static void __init armada37xx_cpufreq_avs_configure(struct regmap *base,
 	 */
 
 	target_vm = avs_map[l0_vdd_min] - 100;
-	target_vm = target_vm > MIN_VOLT_MV ? target_vm : MIN_VOLT_MV;
+	target_vm = max(target_vm, MIN_VOLT_MV);
 	dvfs->avs[1] = armada_37xx_avs_val_match(target_vm);
 
 	/*
@@ -273,7 +273,7 @@ static void __init armada37xx_cpufreq_avs_configure(struct regmap *base,
 	 * be larger than 1000mv
 	 */
 	target_vm = avs_map[l0_vdd_min] - 150;
-	target_vm = target_vm > MIN_VOLT_MV ? target_vm : MIN_VOLT_MV;
+	target_vm = max(target_vm, MIN_VOLT_MV);
 	dvfs->avs[2] = dvfs->avs[3] = armada_37xx_avs_val_match(target_vm);
 
 	/*
-- 
2.34.1


