Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CDFC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=2xlwiOKD238+2XR/FPmjtDWjuQ
	3BfKV+VMkLfKktS6gN/jIrSGGxPO7rJumUoiMCmIBE+vHKu26CvpvelOMXyEjVqhPuoBaPt02PeUE
	gyH9x1NSyTv1ip764VH4hGJY4vdJe5mk9hi05DAgunywJIwz9DFDIC9hk4QS/Oe6YtW3oAEadkvC2
	iSPlqwyptcaJs2+E8g/uop9OTKI3MfjhH+mS2UbhKZsdEygQer9aZgjWDuTbVSjCCT6aFYuPh4CuT
	v/NaIA4Jz/SA0g9aVwTpTRKVlpUXahf2okpt7gMT0LpX2mOpuQO1IUTQuzdGhBBLwbgPdd91JLBpd
	BxvUfX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx9-0000000Fmx0-0yFT;
	Wed, 02 Sep 2026 19:48:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx6-0000000FmuC-1Jcf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrG0R2270965
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=iibPWs1oYO8ySV2H
	BvqcsytuLzFuPGHZrCg7Lng8YPrn/x2N89uT5G62qWM7kDo/zwgOFA4nHwbZnxLU
	v+PKwZLJFyV1KFt2eqYlSe187NXUulXrvC3okDckIc1BLyojN1eebK8oltyBWmR+
	Pw6VP9xmDjAMcp4yKnwXNvScT/ZOUHbAhnKzFFbJ74ebZ0+LO0bYgP284LA4VEGn
	Wr7962Scslr+O5Xe4X06r2jVjqJ+k/VzakffHMehG54l3VOLHTe+TIskcyXkeoXz
	YAFzGVOx0+6Rd/oPJRfT1iajV69lqNM9x6qTvGyf0ISlaqmaz83QIB5tvjkerm8x
	dZpwaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso2174355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378535; x=1788983335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=DS+J4ZfHLjJ59WeEJHjhv2ybJ5AIXM5oVqNQD8NkUl06L2rWRxXI23lRDtn4v5u+Mx
         zw5cybIdetBvzvOnbUZ7f5Z/KG55D+iUTQ345akJ+LEkCL2CdEAPquMcaEs/THIXmoYz
         MlQ2g3WDpqTDMN11MOOUGrpDFyNswn4Q8qZiicGjYqzx6mvg0CfR2OkTxgMAohClhfKn
         VtdE2mJ6VlSiAjk3FnHPM+s1nOD6URyEm+6nvE84GFLjrJlX0+R2q5LZ7FzumYbHB4Mk
         wnZfJnM+BbV81GYBmp1nIO3jBitHv57h7KJ4zlujPbp+9hCpSp8PfURVLyI7Kgr++0y5
         WPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378535; x=1788983335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=e3oBQpM71gTLDvlj2O/B546rkCHSSRZwIPrUxZ4agWuVKfgqq8JbrDeJaThHQrHnzk
         pBk4b/SM+545R6FFJGNu+YN9WhfYZw7U5fxdB037otar/CZj2SkdEryLhHXI5dHcA6e9
         1bNFTdFb6EPccUurVgv3YsnW3prTVuWVbDOv49VRv7+ceyNbN1ATxKbNlL9RXM48bWZY
         hxO356ONrR0vVDacBLEHJX4F9H7l5DZ9JVT/ZE/EC+JWE/U30Pq7IYqdpl1JHe+XnCwR
         trU7DeQQjepubqHPA4HW42pg86k9a7ctrmRiEJ5mkRbAWgzOAlzQh7OcEjzYPBQ/IumG
         Zlqw==
X-Forwarded-Encrypted: i=1; AKwUvBz4UIZHDwIrjytrawMgGjcFKUKGTUo+DFF+/ZRSMBgpMdQOz7rmQWUQ0e+5ggz2JE9lHS2YYMzETx/Qjlgv2DkL@lists.infradead.org
X-Gm-Message-State: AFuF++m8xfYqd29VOof/oixmueJQf41zOrcgq7f+ZTarfm8KnCQwId+z
	PvuzFpaHTM6dSBe5iKWA5VViCbkl/rdKXqOlgYXD7XQh/CROdWE06+hq9AVoShJLgqxcbHvOp1m
	QHtIA8sJMr2VxdunJ8Ev3xFpDpH+/KX8dJ0MEBGXa7q/gYPkHnVsuRFuaM2JJmLXoqz3OcXo1L7
	I0Uw==
X-Gm-Gg: AYBFou0Zn21uWQ5RkA7+8DH9mogccJotxp6eVnA5mnvknCdw1EcrewFuokC4SL7IEC1
	ukpc4Fkok/ufLg4YMD9GlSZsLtFIHcOGzlqgGqUCNiwG5w8fvrHQh4BLr/kSk3mCK9qUK4sPBEQ
	K0Y3ooDo6AC6o4ZCsUSFS/kw51pzs/T1mlKCOE17r6MumbBtHYh8HZ85XdteRo8q+1Z6DFQH2d/
	DjglwOk1YXX57ulQGENVR2f+ChEe2HZoi3eSCg98FiV/3JKcajm7QfOTRYTqEU/kVfIClNWmFq3
	dadVw5Mmy39bKNkdCQ7ZOK9fDv+J2QZw9QNn9eQqNKoGcCOwKcpyztfkNCOXV7YowQPzpCLRhFG
	9ENNtDP+ZhEtxiiLreeDl9X8gc+o=
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040815ad.13.1788378535167;
        Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040185ad.13.1788378534670;
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 12/12] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:12 +0530
Message-ID: <20260902194712.2003414-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5aVSu2PpnhYX
 1X+SWOCGiFsfaT1uBPF/aFs4V3gxuRWyYIxmmJljAOyE1R+uHPBIcQS+n6S34sn4xzI7qSzYFKy
 pMkouNM0OwutHUYnoEh2FsVaNOYQhb8=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987da7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2i6SWIZp2arRg5wDdTJgQUD8IqbhnNca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXydGEkr7ZkdSw
 t11+mkyGT/VcSJLLSj/UXe4gjP2TbvVGC0xX9jzqMzWciEheSHL0D3F6IQbh4Fyvh/jrFo7prkz
 sZDfkLktVUcxgXcRtASEdUlXwqtJ0HtzqKDAeNh4nZ+a2RkiM5xm1ndL1o1s21Q+G1y5RBIFw/a
 wZabCwoFyMPbQ9GgkUBieBkrD5U1CvAdHvlJlGBqq+4v4GvPLpSXAcfhfquVAE828pNHvsvuJIE
 gr7I795ifqrpl+ksks6/B2a4x/2uVd+8QTKS9Iz50kFB5hJVfe8U84xl1WVS9Ti+H7B/QY2q6VV
 CJgX6tFFqasdoLFh60ZqjuEYxbMU9O0UZEFaAjQrgCzm4zbK2GCf7vTGFoRgkWPKvVZrF57SArN
 3iaLCa3130ihPCQy396rAaLmOYVAVFeNo9BiIpQFOzPMu5Gs5z+jBmEL77NLsDZcBvTbhYM+F4n
 n1SN/bwqRWNz36T62pw==
X-Proofpoint-ORIG-GUID: 2i6SWIZp2arRg5wDdTJgQUD8IqbhnNca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124856_390100_FEFBA163 
X-CRM114-Status: GOOD (  18.23  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index f509a4601de2..2d5ffbe17e81 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.55.0


