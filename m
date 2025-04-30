Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ABFC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKq3Hl0BrIcuMMTCUIpmWVs6NCKyQQcOHdChQ0yRkYc=; b=C/tIWkYSc8WNd1FeuzshQsQe1c
	i8zW5KZD18l72+Xi4svl3iSAMM3aXYIkzeJhmozs9qPofEPTRpIE9iKMKotoQSh6YAfx++JzbGN8Y
	pYPLlXaSczmW2WeaB6GdSaIV8bJWnIdC+UdvjBGiT6Rd65QM6nxkB3f3UYfsokP7LWGbawcagV3vn
	PZoPREnXZw6odQ5PUMRnatjUrKPv3jN/Ac/R+aIoGISC0IGFxijq82HtE2EcAq0jxMJ/mfe8J367+
	qaOlgn4/U3Ng5iidUXJPlxrqET7X7p8qu/NjvtAL7/nIKa9dpvfyb0ZCjhw7Wk8zBkxhpBRlU9Fjv
	jAp7WfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAoD-0000000DVgt-3eat;
	Wed, 30 Apr 2025 17:01:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAiR-0000000DUUd-2pgk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:55:26 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCTNne004579;
	Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iKq3Hl0BrIcuMMTCUIpmWVs6NCKyQQcOHdChQ0yRkYc=; b=eMYfExz/m4143DkQ
	BKXwK1tP2QdWw06akhjwl+6K6BisWJZaY2k7gFM8yttwy0kRfYZQVkIbI5u1ZnV5
	Shf8jMi3fOEYuMBAlkC3PfkqXpk2JsiOBR8Y1V8pCtGQKmaJJvJHfyO/iyrVXzyX
	7VEZ9Gx3d+Jps9z7uP4WlO20VfS11DNy4dstDzTnTWEbZkjuKL41Rek+LuRDeBEH
	L4iFMXLHVnFwvVoX1VblH1hEExiBz7zVJb3x9cdnekm0KsWv7SyvmvdlrhvINpOw
	lrsXYXFsjwaDSuA4qqIyHl4QSfBXaFVmfq4KlIYwpMhOR9GINl84Uo85Fq2cXEGH
	etSydw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tf483u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C38C74004C;
	Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 362E6A47ACC;
	Wed, 30 Apr 2025 18:53:31 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:30 +0200
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
Subject: [PATCH 2/2] ASoC: stm32: sai: add a check on minimal kernel frequency
Date: Wed, 30 Apr 2025 18:52:09 +0200
Message-ID: <20250430165210.321273-3-olivier.moysan@foss.st.com>
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
X-CRM114-CacheID: sfid-20250430_095524_228995_D2AD1185 
X-CRM114-Status: GOOD (  14.47  )
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

On MP2 SoCs SAI kernel clock rate is managed through
stm32_sai_set_parent_rate() function.
If the kernel clock rate was set previously to a low frequency, this
frequency may be too low to support the newly requested audio stream rate.
However the stm32_sai_rate_accurate() will only check accuracy against
the maximum kernel clock rate. The function will return leaving the kernel
clock rate unchanged.
Add a check on minimal frequency requirement, to avoid this.

Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 4d018b4bc3f0..bf5299ba11c3 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -447,7 +447,10 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	 * return immediately.
 	 */
 	sai_curr_rate = clk_get_rate(sai->sai_ck);
-	if (stm32_sai_rate_accurate(sai_ck_max_rate, sai_curr_rate))
+	dev_dbg(&pdev->dev, "kernel clock rate: min [%u], max [%u], current [%u]",
+		sai_ck_min_rate, sai_ck_max_rate, sai_curr_rate);
+	if (stm32_sai_rate_accurate(sai_ck_max_rate, sai_curr_rate) &&
+	    sai_curr_rate >= sai_ck_min_rate)
 		return 0;
 
 	/*
-- 
2.25.1


