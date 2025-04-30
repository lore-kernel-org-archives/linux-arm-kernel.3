Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E370BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpyb+c9mE+Q+2Mh2tz1ExittWKkMDszFfcq8RuscDGI=; b=Nsjkdzn1DUlxbgTT3Ib7bbAiNt
	CAa8MxQTW6y2vc60MD9luARMR8G9LcQp8SEz4m9DfuGCYfOr/99fKmbbJ5ZMNozL2JBdLTqr6e6ZE
	HK4XP3SIjaYCwR0magOVcwKJlLCCRU6DE93X3owJokRcaPqbkhW+bmwjo0ZiISd9q6dX5p6Eslc4X
	K5FyAvatkFMt27Aw5vHxgog7ZjZz2AKR02oK7QbFEUxiNJ1XSuc5oyjiMbq29NXGVj6Pta38jRlgE
	/Kx4xjvyGPjGR4DoFHKSLw7IeNm4E7EkmBAYAOI48p13w7yUmNCPzuU931/Ea46V+On4oeJzWTFcZ
	vimCAtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAmK-0000000DVS0-0aQY;
	Wed, 30 Apr 2025 16:59:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAiR-0000000DUUj-3fR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:55:25 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCgokD017061;
	Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vpyb+c9mE+Q+2Mh2tz1ExittWKkMDszFfcq8RuscDGI=; b=4zoqto9UJncUOg75
	9z2dpfdzXwjTwUtgbx5g+D/oHwmZR+OoCcV7CvNGUAtuM4Kz1ZxYf9fDE9r0klZv
	qoz7orVwMJbwyPBBJWXePQiSOub9SY/8AILGNkN5cAZZaDgNKjQkn1MtMactH1PZ
	lIUCjIpDukcjdZXzluY3Fgd6n6jNxywtz6UAFvDWZBCsxUXVKl4V6aiVpeM6pR4O
	5t9WT1SMSWyCMadALu1xveazPI3v2BR7Njr7mtX3UQgt2G/Kr/U9WtUc1BI0P4p3
	9bODKuCCMAQ3oZ6+I+owWWU/mihkysKCYePfSYGu82xD1H3jHgr0f/YmJZ4IHZxR
	VpF54g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tnm8e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A812A4004A;
	Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1992DA47AC0;
	Wed, 30 Apr 2025 18:53:30 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:29 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: stm32: sai: skip useless iterations on kernel rate loop
Date: Wed, 30 Apr 2025 18:52:08 +0200
Message-ID: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.20.195]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_095524_229043_7EC0349D 
X-CRM114-Status: GOOD (  13.97  )
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

the frequency of the kernel clock must be greater than or equal to the
bitclock rate. When searching for a convenient kernel clock rate in
stm32_sai_set_parent_rate() function, it is useless to continue the loop
below bitclock rate, as it will result in a invalid kernel clock rate.
Change the loop output condition.

Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index e8c1abf1ae0a..4d018b4bc3f0 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -409,11 +409,11 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 				     unsigned int rate)
 {
 	struct platform_device *pdev = sai->pdev;
-	unsigned int sai_ck_rate, sai_ck_max_rate, sai_curr_rate, sai_new_rate;
+	unsigned int sai_ck_rate, sai_ck_max_rate, sai_ck_min_rate, sai_curr_rate, sai_new_rate;
 	int div, ret;
 
 	/*
-	 * Set maximum expected kernel clock frequency
+	 * Set minimum and maximum expected kernel clock frequency
 	 * - mclk on or spdif:
 	 *   f_sai_ck = MCKDIV * mclk-fs * fs
 	 *   Here typical 256 ratio is assumed for mclk-fs
@@ -423,13 +423,16 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	 *   Set constraint MCKDIV * FRL <= 256, to ensure MCKDIV is in available range
 	 *   f_sai_ck = sai_ck_max_rate * pow_of_two(FRL) / 256
 	 */
+	sai_ck_min_rate = rate * 256;
 	if (!(rate % SAI_RATE_11K))
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_11K * 256;
 	else
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_8K * 256;
 
-	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai))
+	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
+		sai_ck_min_rate = rate * sai->fs_length;
 		sai_ck_max_rate /= DIV_ROUND_CLOSEST(256, roundup_pow_of_two(sai->fs_length));
+	}
 
 	/*
 	 * Request exclusivity, as the clock is shared by SAI sub-blocks and by
@@ -472,7 +475,7 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 		/* Try a lower frequency */
 		div++;
 		sai_ck_rate = sai_ck_max_rate / div;
-	} while (sai_ck_rate > rate);
+	} while (sai_ck_rate >= sai_ck_min_rate);
 
 	/* No accurate rate found */
 	dev_err(&pdev->dev, "Failed to find an accurate rate");
-- 
2.25.1


