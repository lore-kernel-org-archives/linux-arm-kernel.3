Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CC1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=ynGSSMQcjCQ4ppbAv5Ir66cVuf
	IcOyseS9ycXnD8F/cQQ8FNm62Tl4pDZHjK9BakKkwOVWTWmZdY1nkD+sSnmeuO/clxAbo5I9FD+Bu
	Aoeusfp4Ddig5VxJWr7Bsy9G3lf+nXDMLKU/qvIUt4oaXnMCyQFTpAbyIBXyadBr/ktM6j9apL78f
	dkrShIfBbM7TZyVpf0+Tp1uBURPektlStZ9N19l/VnTLk5toVtlxjj+Vt9tqFYe73qel+Q/z965Y1
	5PA2VUSUKdIlYcZcIO+oas8uNvn8WPwQgHtJkse36rzR7u0JpEcCr9AusZU8hz5hh+5FhiUABT8iZ
	6lcYYbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvy-0000000FlpH-0gbs;
	Wed, 02 Sep 2026 19:47:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvu-0000000Flmg-3qXC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr9gU2105110
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i7IUo5ODu1Q
	vw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=mUvxqWw4oJGdn61l8WtLkN5uIbC
	pOe3XUIGU7bNwqp8UilUWssgk7nvV7vFxGa8NGyg4XbgnGg3Cyr8ZxunqeYhQ8+f
	TCiZjQMM60U6inCxKvFki6V3rZcNiuqzMAmYJBCJ8GXJCs7/+yunwXADfqiZPLlC
	NQqHTfMpTn3DYqAPCrQq7UawxehowYfaIMMqCReJix0QfXobob3YqJOQhcuoxQSp
	S7RjP/hXbrwfZGQm65rspmTNcr6wbpkCMgFkDIA37V4GWfIjv4g5g3RwYdZxY9dF
	vyqcJC/0j0ItsF+Xf91mfl/pzHyIEh//JF9RYLhGRR0tsDBpwI2Wa5g/KEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsbh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:47:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2379206a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378461; x=1788983261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=KVev7KCtIFouoQp6doWix6ADDta2+kwbEnOt8rhv6SBxQN0+BpGFCI0pE48MbkTDbS
         S/7qJFXuJ2Vw/7OenmEkjN+N2f27FzohUze1Wr8LTRB19jemfGBjIEg524Oe0OiFdte3
         ybM81j245QM1ipE8DcteGOb8jjYGgAvEZFJIo6Rhe6UWoEVWhOYBj9cKtKybS6WffjZQ
         W+WevGyrfEmASkbHrqNkhvENxb6jIIRNVv6IU6JOmdkJg/hicf0AxnzsRnCaA3FRs8Bf
         qjFofmuCiZyvTeEqHJ5S5F76fDRt93PfLnyKWT+a0Vat0fKWLPWoPYnTNQihxlYuwy5w
         PORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378461; x=1788983261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=YrFIR85bQO55smgx0Yw8BpaLrtHKyZOAZ69n+HxucpVqsIj1Fdfwr/JK6niq3YuqMq
         /m4zsrh6MVC2JuJKc2NtCK9q+hDZfNd/SulAIKIxMadYwvxAbRR246V6tLOTEvnXGI5k
         lrcsprtrSh6VJ0uxf2RVPRbu7uN5BxTJjS6sKVglzwiJOdqIThzvSv0Mpv1kGmXtj32d
         5zpA5PAlrTBb7CN3UktY5aaUgUxV2Y3G8utlkqfvC2cv0btTWVYUSa9yR5mQ6Q2aGT9d
         CHLHYSpCkkw5hahaOnKERp5eHXzSJNMCAxRV8yFGW168dUuYIRKr0Y5FNqMUTIqrDurj
         xIZA==
X-Forwarded-Encrypted: i=1; AKwUvBzIFRt6d6lU7NtpRNBKJNaSWXLRBSoPsywLsmJ4wDgYw/Xk6jGUgs8s2bSsX9FvL/yLUeUdmhdOZyPvZQflFxJY@lists.infradead.org
X-Gm-Message-State: AFuF++mi+aQwm543TNViOOnqUbkZ5JiWzucUEiMBLKLGmUkdcXBPXcx9
	F9nRx0pqpPzNQNNQObP5eMKP/WAADcwEfV+hOpgiGU9+9Ldbqjiy2ab5VZU75ypOX7IxScXrUgU
	Sg19D/y4XXVGivp4xEx6gp5ecBlaSlvYu9jNtu/+qkZajN8eIGKwGsCq7RR2Is2xsX3GNxSAA1+
	ki5A==
X-Gm-Gg: AYBFou1hIAKhAskxDT0ACiRltEvkcU4IdxG9dOXbviMGZRc9aWVQGof7XxVRTal/sD9
	Yt3C56cAHMCtxeLshb88W76U8tM2bPPyWQMUFA2+nf3Bg+hdKP52D5N8CvLHba2bjLYZpkShGZM
	8qEvTeUDJ8EODSvW+90CUkKvDBhKd8F0QAaBk//vBFK9uYUhDrYNHH1JZ88pz/Mi/A2YOyzDytc
	8hOf8ZkHgUW+C9MowWvn2bCgaukWF0k/cnLhVAIcaY5+FtKuG7Dqle+qdZ28gsMdLsc9dyKGDHj
	CBEpR28iF+Loh8WPtl6DHWC6Tn19oPS57Ff9KGo9BhLSqTL5yhiYLieKCfliNMhtLKAveF99en8
	g7K9c+10Vq9cTY1ep72dmMPUzKiI=
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569153a91.22.1788378460856;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569098a91.22.1788378460471;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
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
Subject: [PATCH v2 2/12] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:02 +0530
Message-ID: <20260902194712.2003414-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987d5d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Epw-RBMujpMcR55kOQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: VrTgmKc2IiB4RsHZ1Td_U3SZhlsQout6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2qnMkzXjxBlr
 qiXUDC63lsM32M3CSGR1zoDmkJukOvhifZ5OwKRUINwvxFi4ZGGqCwfFzmjGBndGtnzshqTBM8Q
 JvW7tvJW4ttLQIyZ/5iB6HGnVnjtTKbN06wG/+mEN8JdE+sb7QUqTjTCLMxueNnmaQmE/cCeRYZ
 9FlmoN8uyfUoPGR2CaAqCfeh7A2jgZvj14Uuv9wAM1iCWoCCLqxc3gz7Iza0yPRn998YsoQMGoK
 53L5Hm951yl+43ikwPtwb0KkbnH8qfGYKgrs62Ly2AvrzMUo7ZzQRY1/lAlqkowbj+Akjr8ng+A
 KGqlse5CP9tjVkDx6jUZ4i7UPtEFEPIW6YnnymOd8MYfvD5KUoHmfCjCVJbdUC3MP4hosd4STGz
 j3jM4RgRmIY4C/rZeSkQ4ppBFy4/dHlNdXRPaVp9UMpZBDn9HRiZsOXxjtHnl+QilpgH/2mlIbB
 8xosF0MiTOAjhNvnLhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX6nAOPqSfrRvD
 X+SEtJCv2+pbQ+fcwBn4CyObVFkAE/l3vnTN+GYrYN4qbrLV8acjePHIiHUVyCuk9c9jmLraeOg
 hX0iXt3Ltud7NMMDziDEDm1nqMw+pDE=
X-Proofpoint-ORIG-GUID: VrTgmKc2IiB4RsHZ1Td_U3SZhlsQout6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124743_069740_A7418520 
X-CRM114-Status: GOOD (  17.30  )
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

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0


