Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245EFC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=lwVzcTFmVB8t+mU7A/AD4ZsAIg
	dyaDXe98n/0Pi5As2DIUS3DFUkXNCy5yOy4Jvpa0UkB0SVBQHzPXWZJuELzcShXCPg1OVEY+Ld3wV
	M+IJ6PDcz0BElNOtBsKyDsw+zvRpBKWI8LLrCrajrTLBv9Cyo9v7U920KJpcZSEQNVcsWPTwE9gFb
	YZ51h7jrtwGbzMnh+luttXHHEbXrZ4l1OhpUDgCn9ICMb6kwh9vS4pk2jBzo1wnpUFlFzIXQBihS4
	SqguGDCrtZ0DCPLzbkDESjsvCkviQapD/d/alcb9HuuBEBRHS+HRyLZogxbV9vEe5ZlySLWgL8tlH
	vSxAr5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvo-0000000FljY-3sbN;
	Wed, 02 Sep 2026 19:47:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvm-0000000Fli6-2MGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrBjn1714648
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dJIDfPMkkp3
	4lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=ZZiYhzPEh3cueO11Uk9yw3pog8z
	H93TvnrCSczc7ynU37V2tLuSwqtKdv60v7y+jdNrsmgPdVltqepXeXEzYjW26oqF
	ZeVDYRxDYszcG/nx1LOJyK5HM19DmBXiOPbx1soFK+9fgqoogiuUru9KTOZ5ySCX
	wHWg5Yj0kSk6Litwz5TnQ3bdApO4XGcPoi9Isj0fAD1RmFZkoTG9yiw+ykAkWOd2
	uhcgX2sBMoQvq6RcbS7LZrCnVgiROKQegrdZnIKQMKWRm5lYFX05raMQhhDh6mUn
	9pslF5pM65s4mqzd3u6M2dR3wI6q+r9VlWPo06XJwQaRPGVa8bQv/rp20xA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9tsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:47:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2872759a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378453; x=1788983253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=O5IjnT/GE9WYnpYO7HCGGhL+/x3R1ThcVKwRE+jwAjb4gNsnZMHToKqKTxBY9RHcPC
         RnzesYl+6bnI4Mn9hrF6n3OvDV4RtkRStaI4yAiIJbHilldo3dwgVoyHD6rmipzuWvMw
         jlZ79AIBBsTCP6s8KRAA1rJBABQUzT3MGuOwiQTCyQybW+nqtSIoobA2I6PpfYJbBr3b
         ixunc8xXNQb7sZrMKB9dPksDAoIULD5eVDWb+evGZ7c5iJ/5zKRdA1Ozswztjm64+FsN
         mcdLw8d3LXw1LxoR4WiD25hRt8XNUjvA7XbPKNZJL2lewiPW2xvesLfzWFRKFdHouNvr
         PH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378453; x=1788983253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=SZ8f3FKK1tvBdLDFmb7wT4zhx34dYJvMe47YRaP4eaa4NPM/kA8XGSF+HSjXiEx+6+
         txIwQYA3fWNW4CUgtdzJw7JpJgqnFWS46XFhTJBdFoQiiIJ9cdB6kObRELlhM0AWyIIe
         Dl/ljk3faCTo84E2EZvcIH4crhR7DSs+ePYj6kaeK5nBX+YC+0ns00sdthlAeb4uaUVS
         Zw/cEpsxVgPaMaHxYxHBu2MQ1RY3oYB85Gi+HQ9tIeoYU8lbrLj6K5miwRkZcVJuo20q
         ftZo4TbQQcZ0MzPKa3VoqT6lem2rotoqZhoZksZMDkMeaHccRJ3quogfw2ySNE+3bdbI
         Z1fA==
X-Forwarded-Encrypted: i=1; AKwUvBwSZcQSYaBU7CgTs2RTig8ssGASYY+vrP+W5DY9YKGtF1HMm3t6ZffBF6Mk0h8L/IVrhMsqouPo5EUnvUHIk3PH@lists.infradead.org
X-Gm-Message-State: AFuF++lYhNnrGJv2konqeVZjplS4tbFtLb7y97U2M/QisZHhNCv9JOEC
	wNAIa0HiJbh18nSJkhIHuSbXmqSHwJnPvESpeBPPIhwDkMnzA5rLWUn4v9kziBf5WzpEvtRXrxd
	wGZ0Hh8dTbZVCBe3Zq/IYZ0O62+PHAhr+dcqDqyqrg8ijETfnFUbF2EbLbfebLr230u+tV32tzF
	FSuw==
X-Gm-Gg: AYBFou0NJ6xurcEseCkEh8X2bRz+GoP9bnJ4FXYOI9AzAExj1jfYLiCwqGmZJC8Uvk2
	iuH9sOCF7QEGlwlVquR5F/7fO5YZgp5Hj6cEJ9OJuU+f4XqSIoc7eGkdyxho3R5uQEeAX/W7tme
	PDTmolZWigaSd6vq1jhKQiyJYqSab75Jd/W5y9Oh0izk8VPxiAbMIHZXx3Y9RC8qWWtqOODGH7R
	YiW84pG9DN3+xmm7/ZuFGwBCFEY/eRFNCmdMxtvohs/Q66znHFLlmS3igioCpSyWIAFpn7wxBaM
	nRTmtvF9UUYsIptVbwAOu6+5o0X99xN6sfh0bGdYhhayBdTY1wm89PpeMcAwn8Z6q0CYtGml1Cj
	ATuZ20s6Ia9GJhTipIeU1AxPwba8=
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396987a91.11.1788378453514;
        Wed, 02 Sep 2026 12:47:33 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396923a91.11.1788378452969;
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
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
Subject: [PATCH v2 1/12] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:01 +0530
Message-ID: <20260902194712.2003414-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXysa2xSk8N74X
 BcPFsvxaGCfxsxuOpxCrYt1WNaY5nSTCw9cbfwjxI8iH73/DL1yYb+sD9fr1djBn4AyXqW8f5ai
 Yk1HAHO01/IvqW551c+6ktdZzW9Sxf+T/ADR+eGacD0gYTZwG412j+BFiWcRZkf7DzH9QeE7m8d
 R0JJ0eB996gEiLjehP7fURN51voLDfig7gZjw5dPMD0/4BKETMd7KVOxO1barA45ix5hGln5hNW
 QeRUU4bOXS2dY6ByQtcf7oyGSl8MKhgjjXhxRtZFf3MRaH5iSllYOwkWkEaGp6WrHpxSWOe3vpF
 pCEcrRRTGJIvsyBFaEm4sLYtgJz65ccw8owdJyEpOPX8qu8dyV2HxkkT53KZu7pryQDKdDLyXKw
 H/gEfsMI9tfsLrSvrWsMIj8Ywu/PhxVVrgqO8TpB6WbS8Rr3FsjWa4WiF+5O3gsI5aUqNCuqIFo
 /ih04i4ZGaWOmVCq7fA==
X-Proofpoint-ORIG-GUID: MyyLP15yB-IAAzybEFJPgApxupiqrLGI
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987d56 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cg4emjn-6EWHYnEhqz4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MyyLP15yB-IAAzybEFJPgApxupiqrLGI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0Z+uCwS8TpX+
 VApc085A8K/2fXbXRck1EdiTvp9a9xNQBuH/UGx1fD5EQwX7PId3VBu4VnyiniJXp5ui+FkyUMF
 wPXDx5PFzoZRYCnc5lkwA9Jo1EjcBPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124734_610661_D7853E52 
X-CRM114-Status: GOOD (  16.78  )
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

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.55.0


