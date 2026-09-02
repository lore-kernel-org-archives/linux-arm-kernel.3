Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06028C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=n770fgW4MJyMlxbMtJCZzwEdVf
	VMELJ4i5DMxjc3+cN2Uapn4AiKb/VaFUDhjcXhiR4to+SuJzZ4gjUAvNrmZtZGL7NRwXOesGUXUUy
	eBZTDj9SRDQwH50nCyfgVW2DZLi1yObiVOy1AJiOMg9cHeVV+TMWPRv1c7SshRcNje9Su8deg673h
	lHAKcUqZdOaOgbEw+H/p6PnnTfsoz7Uf2DkcPQw+GIhsE34f/y1Mu8uJTwZhyRECoiFeZriGCVPJI
	lGHikwapVjRbLBN9CA1w9g7LRizI4urVWoY8grHOM8ZXHHYS6kKyASw85rM/CeVccz7Bt+nc2ItBZ
	omlkZUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwR-0000000FmEw-0qqO;
	Wed, 02 Sep 2026 19:48:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwO-0000000FmBr-26Cc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtVJ2209578
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSI8nDh7SJ+
	4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=f9MRTSDk3pl+Xm8LGcfZuQKkl63
	lF4WIoD4QuA5qHY2ReiJ3flaKBMFAM+uThec/wSWQz9etrgHEP6tcXEs7EIYFTBh
	dQ0XAExdAxSd0Duruih1RZkw2j8DFjKxqFwwSB/cg41jyekNlPgLBHRMSXLzVv6a
	qNB0MqF3nOAPv1KcMcAkOq6XyOs70W0/W2uWqLOA8jspbraRPopQBI0uAcsSQFNO
	DB9YR19g4ijdhghltd9v2NaGxrrP+gFRElnvS9D5ZrytBDsHs0sEYPx2B9JO8LLr
	rw936RaWCRxEbXgs9M4S+MMXlRqiYXM2BfyV/TQjHL7rBfQ0B0+MzlcUSfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2153183a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378491; x=1788983291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=Yix1igxWix81A8M5NKS47UV9HYJI6deydMYSZYmEbu/PDs0N5vQOdC9XXICNOa1x37
         2ed0BkxkPqwbpAia5BGu02fUvhKHpmlh7NQUVcJvnV4RspM2typpa4VYEGSenW3IkuZb
         JQ7kPV509mxVqb6WSzLjwpOh79MzBE/BJ5zR9IJOFfGPU9He+o7wFrnDiwCV6l4yBW23
         OLbGEOP1iLbdiBDOu8dqbqria95t4HzoMQJucYew6fEGKNYLKcE40FQkUf8VXDJvYFZW
         nTSGOI1QOEwqUGXxsJWWrNu1rLs1KNPlo34BDm4e6+zw97MCdDuBvTiP6Kn2FJBWkwlO
         BHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378491; x=1788983291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=ns0ZNO+P2djrmb3+jE0q4kEAxZwpgWDekJr5w9k80PAwFs83sseyHYvCEhSuvPU0uW
         jfRxzyHBfUVIcyQIWFvVujjldDod5dbf1CDaZaFety39/Kybhg5rBTzKELS1DxmMg3Yg
         OaKyDFrbXy4uPS6qmN3s9Px9TwQsvKICqoFjd2h0SFlky2qnPDoxUPZ3TIXwRAZHVP3s
         b+qNeyHf53hzamWdLPbP/6OkqMxHDF/irt+pyQcMo6P4ZQT13tD2tdbriWhTZoSMwPbb
         FpvHXN+VyWmDHtnLfoRFWuIquzlt11cW6wLBkRQVCN9Tt8joLHBonhclYXUk2GUKrVAW
         nkCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeI9FjBmE7pykXL8XtPV/aw0Ze/tl01/s5GYmhCnsFhsH8oc3Uz1g3mVd+IvDPKoDJsaLDe76JHBVg0hivsYhM@lists.infradead.org
X-Gm-Message-State: AFuF++k+TpEx/7bZhJ+gTRHOkPhC3FuqeEuvW54Yseqflpda8TvT/5ts
	wu+Oh4X/UkkY43LF0q/r5NVc4rs6vH3eW2RMbsFpJF3r1K/1UcftLxAwjKceDVtITmx1xaua4Hz
	VyygoV5+K9HZl6iSCV31O/08a/wYifls258e6xd3SJrzWf7qIQtWcKQRSHOGAl2KLVYHNmoF0tD
	z8xg==
X-Gm-Gg: AYBFou2jio3VOmGxxViJKo+1cn0c/AIQ7nT0ON2e8rHP3xoDZvjUALJ1g95nXgfkQQT
	PhsC849s1pL/bmdz+TNW5de9SxAwiLamNBWIRDZKpLe0fG8OqOonPrObqlr3mQf3zT2QqueGZiO
	iw6ftq9yT8OWVdH2/7isO2tL5eKzM+BlAotYAtJNgv8upmbPnn+XYFZH4c3p195xvTIazIgqgYX
	c9wkHp0aI2mrw0EamysTWatGkFYj8ExNL3YxWIspO5FsCx1o1UzKBOFesIZMf2mBOOuMH7iDiPx
	wgi+Sgm7WzFgOJEEpg3kwB0AZoenFczkJNhxnYv+34F9aYmDJ+e58p9Rw1NuHvUVxQd3STIiKmw
	ChK/3K59FifQ6rdyVDdrx4Ex/zLc=
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442684a91.25.1788378490481;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442629a91.25.1788378490006;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:09 -0700 (PDT)
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
Subject: [PATCH v2 6/12] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:06 +0530
Message-ID: <20260902194712.2003414-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d7b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ywISXsvdcR6B-KRxH2Stka0OD27eiwAk
X-Proofpoint-ORIG-GUID: ywISXsvdcR6B-KRxH2Stka0OD27eiwAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxshhtQIrvz5w
 8bFjDlIvgiLXsoc0uQco6cXWwNZnlAGAhnirT8Ux4U0OvAaMGXKOyTKCs/SiSmuFxZJFb94gZu8
 tvZUTcQAGNPH1nZNYArL7QSwy+ybqFU3i2rfxMH7LsSHzhh+A5D6fU8DRhQ4tsXSti5R4IzCJ2L
 jIm3OPt/m3hHVnx5NTrS1DMhOtYWcjLlZT/Bg6kZgftJKnvnwxTv0Qy4RJX//EfvQ6byW35PwSm
 Eb0vbKEPbSOfZtzle7DSWDGTs6EC7BDrJWxielimcMFO3iHEV/5SFI6NN/N0XiKjQmPr5ui1dL/
 IKc299o+a9Z7fhXglUCBdfA91iZe1OYN7pCxryqGeaE9/oq60nKAlF++BbHwfBA4z4iutI2h5hr
 mtdc8eGApRbhIs/OoOfTMbsQasNqJRCPJ8iWngN8ipWciY+g8ken+gDmyAnqC5OLJS258517IP2
 HGvJyxN1+Y7EHojiNWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX9AYRZTI8n0sS
 w0gIEdwt09yUGBJzXVWQlMqxLrrjM0cub4UDkx6xCOL4yc/Nnenv5sUc9uiCdcp/RgFQmMQnWsf
 W7ubn0cCV68iDww879TqTxIJRr8Ue6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124812_664222_1D0C0783 
X-CRM114-Status: GOOD (  17.78  )
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
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0


