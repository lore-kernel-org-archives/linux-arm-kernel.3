Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF06C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=Eh4wyUDP3HnYOzI4M/idcUVNpB
	5BfMeyWBUdQ/qx3dRsRhyDqV8/Sz79w3QrIcogRWuq/KpPwTX4y1vrn/iVY5RNizlnqapbz8tzUTU
	z8QAoCATxqSEmG7Elxntq5pFDwKdexnebcDZJoKxA4InCHa0dhQeT16BX2iJjZZMeXEfSw8SNJHHT
	SGfvdV0lOIHmC+svyiXcw/+2fksZvEL9L+WupPcydchPFQF9jTdKsNeY1pjTJd7BxpVDmAj2fswFf
	nhjz3Bdg/oH4yw1aRxMTOV3fZIRKImejUW/tIfJ9oo2yw+iLCNt9iSXgKaNu+FK5B1I2cUUqfD78M
	Ar8dkAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwn-0000000FmaV-1sq2;
	Wed, 02 Sep 2026 19:48:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwj-0000000FmXN-4Buc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqxuh2975264
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCAbiQWo2ly
	p5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=ETKoXRVhyGlZ7FSeYvMx5cgXRNB
	WqQbi89Xz6B6oNYmiWvwW6ZuHw9tz+UGxqyAOqtC8N3NHzZ5X48vlr68HYScqyav
	XWBvmFFBIjiifDXHAfhHsKtXe0VqEYwm+cPCWjDwmsgXLIRKWPcmqs5rCrvJ7qSq
	bpnLfc+S8z+HHPQ3Tx68AidbKngkkBHbye76ETr2t9S1Qs0jsncs7rw+4GTcYUol
	phdh+AGV6ks6n/f9jo3HWZ6Q4b5wRhnSCwyt/YB7sktxxcP1rpBk7wSsg5MEJ4a/
	9DYFvXF/pz6anNSb6fLzkkYkvYBaX5zS8a+LMGsAlcawlsY8Q7EpxgI9u+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8n1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94a158dc8so23019155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378513; x=1788983313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=GdGU7Zc2aEiNr6StTpfsBIUgY9S5U2eR9V763Ud8V3cOMh5njN1W2oAhMxz6EOPhih
         qZeH4gtHqjxhMpf90tfaZdevAbzXmSydpSSfp5j7bXwTRET4NpIaejEr87oD+I+gN3e4
         2BdY8PGs4IwaPX9wnPxEyVH75+3dbW7nrNkJKoq/aOEvafPBp2Mf0V4leZN9CtE39yMg
         b0NduUm1y62atglfTy3WNtwxSaBNIAkcaqiaANRXPeJZHDfGj9Fezn0xdIzijCC+Zbjv
         U1W/17lWi36A6ka4lhLQ521FE+axM2i2oh1y9wij84c7tvckJ1sHQyTbVwhrBJdKsNVF
         Slhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378513; x=1788983313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=POp2LfTJb/MaegIHPPnpPog5PRut7y0vwcxuGBTVCRGq5BtMlPcM8e0/MBGsMZCH6b
         5elI3BfsEiXNQSZ+89eesFuUxm5KU56V9wuI9BKb/9aeXuBbp5MBtH6ChQ7epBgjUdV3
         wYqjF39/3fA/ZOUfYWbz7r2HNNw/boz8hciIxp2ExutEOI7jbaItcu5AjtfbHTPp2vft
         yzWLo0VcQNil+GDmOQs+/WbHgFiwAxqepsYuTGbxmyiESkqzuQDloqBKYpZ9q6iP8WKz
         7On2nz9nBPM6rr6M0LH9wIuzmT4+kSJdNoHuPnSt2rb0BUQolO1qui7j+QYHeTYVIVaG
         Y9fw==
X-Forwarded-Encrypted: i=1; AKwUvByEnit1OqT/BEM2TPmmM/RjJ2ONTDBTeTsVyd5j6SN8tpFz0j9baONyQj4+bbfNcByD44Z3242wLqZM5gmPG0ub@lists.infradead.org
X-Gm-Message-State: AFuF++n2VYoLQ+eMHFeD0wkBj16fafPWFYS0n1j8m/A+L6kvtXo4VlMQ
	OLl3fi0GhcOfVi97JaXPwujnaLCww0RNeh/gZzlfoWQCfql5MstxnOKJeBMmSyJN1ROeRYdGOO5
	+3uxf3bcZDakNk1ixOoOfpul/UZBFYh0qKaXggfc9+/SbnGxGY4yUociM4rh/4x1Zmmva57fjwo
	6TOw==
X-Gm-Gg: AYBFou27xHwp/4GiZlXXyoSPdY8P4QNiZ89eR1C6EHKToYqbDJqQzpQ0FNG/NScLxhJ
	7uLwNGtpVILupLjDkMlzrL+GxqVdm01e/sCQAYhibLrPUpSuFjC3ERAM3ipRikTtXmb39ITxS3b
	Foo1kIKoyvguCfq3pZOXAR+t87zI8wn9HwLaw3Tzh7iaiDy69QFnXrrYCCvvvu5W6OK6ou0humJ
	uQjYaCxOLbwyoHjNUBnT3bRV8sfhWOrcEgEqVE+m+NcpXnwCIuINfxmhJmw8YoJVn/IT03BT6z2
	ngpUfjSAk1odv1br515UVo8eezdBdvXZcmTPfwKwjB0VgracK5MyklRf9tEFShBQci9DSKS5f6p
	J7Gg3Nq8AZ84XA8ctlXzjTz857e0=
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84258205ad.0.1788378512836;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84257705ad.0.1788378512363;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
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
Subject: [PATCH v2 9/12] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:09 +0530
Message-ID: <20260902194712.2003414-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987d91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2L+gLB9oFKrW
 z73Re6Vyq5x0pkMpoct4Y8iq84nB7IvICJaUt+8bCfA44rriCg73HF4q6s3teF63GP/WIMEsqsC
 qSCl7Xh4Is+WYpwk6tFpy6L8OcXhclQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0n3aPCpDMe68
 tEUCzCU8rAYNqoSny9NDy4yR0KOFhjezWe7Jq6xAgf7sqQdfZTd3CrBk8Clr5RLicr2ZCVpAz2R
 CQvqI0ucjgGvABdCCge7z5jQ2L7Mw/6hfyKQQy9Wexm7K8Yzh0LBzrZ7bXxTjvkojMPje7Cd4wl
 P8a5zimjl/4p43OuruDSvRnlklIpJd1Zge1I1bj7tbW0LSZKDj8dUtpyY9gXOI+7uWw+EB+oLi7
 NJK44mOg0n6ZhI1gOS4h94GTRhTRaK0DMb3DouYuj8sxE0i67xayFzxzRkd0E4trD5/jtQ4Bw61
 G6MEHIQJbb8OvphNYdbjpTRclrQcxm7VfetQx28IcwVge1n8Hs95Sfmx7Hh75Uko72tk/PsEx2V
 DMnqqTV/UmOFDBRGKfTt4ZMDPv9qSY6niw37hVS86/FWhaWfUJssgHaGX5GI68ybRyRRECZqxyp
 xyrRrm0VzQPIbcPrpDA==
X-Proofpoint-GUID: DPpPxZ15GxT7oi95MJdvNWZSQLLrqGJP
X-Proofpoint-ORIG-GUID: DPpPxZ15GxT7oi95MJdvNWZSQLLrqGJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124834_051790_42A2B18E 
X-CRM114-Status: GOOD (  17.92  )
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
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.55.0


