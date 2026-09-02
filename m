Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA36EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=xmPIKsxLaD91/Sa3IoM2pTeCN2
	V7di++B+S0uiWb4ETZhLlLP0qWyEC1olOdAuQqO6wl5d+T4RFlfSn/5h2F7gFun4eXlm/XyfQfI4v
	dI2z0pj5JYhEjtoAk74pAWLm7MFtsS5H4V9mhnPwRPsLp7S15mT/vu0sJVarKvm7oad+eOwa/9baE
	N+qYwngr5OQ8/d2rkDBNRSOiSdmnbuYNOXR44ESxSeW7ZP6MxgFP5Y/cgD0aDToiRd9jXqzQCkxD5
	OsC90Nwcw54RsfPuEigQJ9K4F5phZYm66DuBXPisx3llHffyMUrRCyt/LE2mgMiMLGFgvCUpxftmj
	iobjj3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwu-0000000FmjI-3tA9;
	Wed, 02 Sep 2026 19:48:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwr-0000000FmfR-2aSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqtm21586094
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvdccM5K3gM
	HO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=d1rc4QZfbIpAUfa1/Cg076ioPXC
	9otIlrXV74HApsxHAcBY65egjvSUZJ/XP+wbHGPZwLWMXrC5yaKXnKjN2cFyoqav
	Sf4AXwMLW0O6E5sQw6/08LRTjVKzxOYQTqvoMfaZq64gpoXjwd34laxqaHWWOgAM
	LJ8h+PpWbylqr4FFwwAqXHdLtnkSGgXILjy3MW0mS4xSlwDjptnTky0IN6jPrhX0
	rQ4F+mI/oOFtQ0pid7mvmomP7JlWgZTvJlMdfqg0LOgUYZNRi6wG53KthQobriFg
	SVSMsN0azSxNW540JH546nB3BLb6X1E3zj26zSlu2ho81OngCUkVlvQ9mYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01tjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso273782a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378520; x=1788983320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=OL8/sf147x9QCVDPeang1nBy8Vna2fYmseBRgs0FCTKZ0/qQAG6AdatM4o1gBnXpIs
         3U6+U1YFsYrvAGlo0qfIVkocj+fFlOKRdEQeaQiJ20pGSmojYXKgZBoZ9SRACP5kUko7
         JAeQX44CREKkGUyUvRFBwAO/H96LQKhnfLiwA0MkIURlahPzjbzBioFExqA1kHLTkFmt
         o9UXThH7LHIIh5W7PNHOMbuwLsO8ArcVbcSv4X2biEg1ZDT49FAmejBZQaTMOgYVE1ew
         S+hBooG1T5OV1wqSVDNABysEefNgl6LN4atly9KBgVjewt2hVkmIp2eDBqux3M1lMNxh
         ctkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378520; x=1788983320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=gGankI3p5KMFv3rmBQaudQ7p30+DfFbKXmdepuG/CG/UQPj7jX0mFcoWr6E/Z4dIfF
         dPsaVvoYx7vt4VqRW0HPHa0PxuWd72783iaeb0e1Ur5yr53oy52zKL3PMr8CBc4FSet4
         lMXU8yl+ymGd+9unck4yPVtmD1ROObpxm6Iez2vg/OXijJqv0c7HYBY9fldHZNvNsQFa
         l1nKgrfeXh65aoKTrUowyuyZJ+V+VTCggliUUaTBrC7JdmNiX1JR4ckbLG6AuM5ud4z1
         CL9Ad4zLPcAZLB6fVHrBqihBH0ns+k9mF2HKOX4gvfWiQ1X2tvX/0AS1eqDFE084sNK0
         D0+w==
X-Forwarded-Encrypted: i=1; AKwUvBzX2OJ/YZBIt4t2Wt+aCEEj4bvDK4cmmR8hU3pcigJqtdGz18zynbz5ElNJhg24M1Q+BrKaRSa+38GxQ40z0Yj/@lists.infradead.org
X-Gm-Message-State: AFuF++nRSeNfnVZTiQnXwMVwFs+mmVkmzStKr62tuXtGFHco31PJ61Tc
	xUgc8IyJK3CO2W0+X+tTKtH9QSeLOZhxHdo4fzytE5OX+R7b3ROFKaUEElyjGeJdkYTrYrVuSly
	yvinAgJz3b5WTRXy5mHLN2d4+iJOFbOryPL4adHE7rJvAQDuSRJJ/JlTaXenaMdpUJuaf/hU7q5
	1Dxg==
X-Gm-Gg: AYBFou3tutLsNOOGdP81HjePROF/6FmmrESib4IrBTJ5wfsZncGpAYMulqO4QivRmkp
	fSPP0iL6Pp4ysWlPPkvNV94+QghfkQThaCYHKdg/UUdKxNJ0Yol9gqKcN99UZwYZDQzIi9H+jkc
	u392X4v+eYNFA9zkLTbQiIXwO/Xx2soR8/LcSc+pqQUwALtDztpIHRUNObzHVVBdUSJQb4S7foU
	GiO+SdIp3k5B9f+TfFxzW99sUPvnSl6XZ5fXZE6XwAS9KChwdgbRtuu9ufNrnMHdKFecNO8bdS0
	ywKxEzWf7D1f+XUH2XH0gUOsObo7W07qNGm4Cp8eX+uthx2octNoAQGM+x63R6NUu8LK+o0t0Ys
	wjpycoI9axgKtMaJZBdlA2OnYvvY=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560762a91.4.1788378520423;
        Wed, 02 Sep 2026 12:48:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560695a91.4.1788378519784;
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
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
Subject: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:10 +0530
Message-ID: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IUoLPGToqBAerHNS4qelNy3Kf6_vosZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3v0I76kqdZFa
 BuS19ozhIC7AAy3o1wrgbukEsjKjckj+6hgwIXlLleoodR/y+Yw2VeQgab+SmrNynjxc3qFPWee
 Q0xiyp2xaj93hMmvM0s7nCJWxRkRznL0j4reK1tNvKiciLmvrVEpnuTiEgD92WArQHEisjTN+Wq
 Guc0CywGkJQM1Krx92b4M18U9Vr7KTWAhIOxS2dmnEcAMMusJQWiynD+DCZzTYHKwsn5NoxcoVF
 9sinSRt0Aioyy1YRQaB1nLcId5d6dK0cqNLvpFQqed99iAG+KTN59JoB9dlf4Ym9Yo8LBmMW+g5
 qM0pFUssgUJRkP04uKxDrNdhExKdydp4WoqeemiulXXVVEvFHjnuBaM9YcccAJm8kPoO9GBsLNu
 sJo//buR802Rnphcz611dy76UWwOoWWToD/7KCLFC3ntt03pSuCzmw67b7fGfG4e21jdv71cEnf
 Es/ebK2/XluihNSQuCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2r5bnRnHMNI3
 UNCl04tSN9m5BNYN1w3hn8D3mePUcgG17gdf9MPOWZf5wMLPB+Sgmqdq/SURMrhuoRH+BH0/84q
 iwn6KIcVBrk/zOq5sC+g4b9BfizZCbU=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a987d99 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IUoLPGToqBAerHNS4qelNy3Kf6_vosZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124841_657739_F3EE3719 
X-CRM114-Status: GOOD (  17.31  )
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0


