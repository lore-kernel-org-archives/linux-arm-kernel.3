Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EE3D65C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiPcXqx00CT+g9yrysVEHSSc0YHvwdzRVZ4uugck4gw=; b=A8idvzrQYkGnUX2WumFb//Q+Dd
	Nw7Byq+4vAm9Uxng530gA92ihjjZp9MAN1mtgcwRzGvWtE50c7RT8KcvXqybb/BKbKBJhtBf/hYBV
	VGpd3pymlQ6zzueHP/TI9yusw/PfdnBXemKUm5z8iQdKv8UYwPQIOImowxJU9/o20a3FnUCr++SoX
	AKJ1RdxTOG/HrBkDZIsB0v3kIm1uz80fl6Egd/XCHFW3OEhyYjgPTH9vw1nROOZ7/E0FJ2Gzh7Q0D
	F2ASugGKsminxQxESCHpiTaOV38YE5wgOrNtxwApPLOWI20v8SNGiIhegEwtSyy6k7SLIso5GmFN9
	bckT1eEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY0B-00000009iyU-3u0Q;
	Thu, 14 Nov 2024 11:27:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX85-00000009Xp6-0N3B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:31:14 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE7WL5J031759;
	Thu, 14 Nov 2024 11:30:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hiPcXqx00CT+g9yrysVEHS
	Sc0YHvwdzRVZ4uugck4gw=; b=aTWm2+xFv7l+ln9kdScdK/yDueFjIDL1xRPZHD
	GS3/A4/V8xNXAyG/r0heQKeuNBCfGUNq57v60JLw101EXMMkdZPCl9JsgehOklXB
	psTiPiZuopKfb6OXmQ7OSqQMYgIzG1nG00XjmQ5RVqJZjToMFk4qH1ULqPF7X1mY
	e2XCeVGRhrTYzUZKg2Kqzkgcj7Iu7je0ph9s/6u83St8EBF4w2L4yq2ikGzRE0oA
	OFUUtleEBycQHTbINjEaUEAMl0OoVmyd0bMtumQO66cwF6qkMjE4A0n8qVR8pDvc
	lnvM4LFUmc6UavUW7L0GKeTmEkke+IOm1iDOj43JCzg5UVZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42sx1kyagx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 11:30:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3DC6D40047;
	Thu, 14 Nov 2024 11:29:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02C98245E7F;
	Thu, 14 Nov 2024 11:29:01 +0100 (CET)
Received: from localhost (10.252.20.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 14 Nov
 2024 11:29:00 +0100
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
Subject: [PATCH] ASoC: stm32: dfsdm: change rate upper limits
Date: Thu, 14 Nov 2024 11:28:51 +0100
Message-ID: <20241114102851.2497942-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.20.241]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023113_463294_13FC0093 
X-CRM114-Status: GOOD (  11.72  )
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

Increase rate upper limit to 192kHz to reflect the rate range actually
supported by the STM32 DFSDM peripheral.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 78bd817af839..c914d1c46850 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -142,7 +142,7 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 			       SNDRV_PCM_FMTBIT_S32_LE,
 		    .rates = SNDRV_PCM_RATE_CONTINUOUS,
 		    .rate_min = 8000,
-		    .rate_max = 48000,
+		    .rate_max = 192000,
 		    },
 	.ops = &stm32_adfsdm_dai_ops,
 };
-- 
2.25.1


