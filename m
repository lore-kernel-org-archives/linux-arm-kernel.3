Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70106C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=htB3TFii5tZQtEBWoN5pWRAniU
	tALuDufz7DEUbCOBRDTp8MVrTlescyo66XZWQGZjik87S30165FSYVab7vcl0kcVxWiiX1Hbg+Ew8
	A1lobWQgFQdHn9KLYNlj6G2J1EM3DAqVDt4y7e9AUulRtwIY+jNigAxJsqrSoSy/DTFhsA5GxdMWO
	Jwv18/5EZ91PJ+H20h61KbIIk7ZQmVH9LIWGY44kCuf4/7AIm7aqhqb+aArWvtVwPMoNrlO+a/ccZ
	FDvAESFEldLBnCbYAgzF1qU9Rq7OEN8MrWJirzz4Dq/FLOTpZNVrwYpsWQYhie+eIhizmQnGpx4xG
	gSCNXRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwh-0000000FmUj-0gCX;
	Wed, 02 Sep 2026 19:48:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwe-0000000FmRB-0nxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr3OX2209727
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0wX0NGvpX+
	d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=ex/mGCBuQfGUfQ+I3WEvpht4tCf
	6cIPSR21rccSUNeLu9q5onnBeFdg8CG584sGjhoGdssDNxKtLgGQsO3zH3x/hH+U
	6nlBflB1cSTk+1qOicUF3KKKy7voDaY9jgycGYoEYImIn991GMZDHTpQg8761iuV
	GsqR54r9J87D4CivoNelQPGhJmbk/FsWODF4fWn88Jibbpqt0Hj9TBQaGYdQ9a/7
	yMFEBEkTSP4hN6bsQeQS3MQ/enzes0QL0yD+cjarQuSpus+loQpD724LqefxuzhJ
	Ih+0a3dCckghwKcSveSRhAA6+u8Pmszj44iQtybr+grBgcJ4t8cFP1JtWFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso20015145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378506; x=1788983306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=PXHc6nhc+ks1eB1U9idjwnIYqp99W1YyILvC2YMR1iVQ5J+ac5GprR0pRDcApp1Bxn
         equkp/nZb3idRT7yCYejuRf+jO+604Q3YxZD0zyMFfMpQBbh02QDWcVguUkJozVsuved
         NG/3yRwAFIDf7QahNss7Mm3dMMIsiBMUIN6VPggKDhyNBdeQz4CBCgkLveRuzmbZZjvF
         QvwJN9pacu+fmXxK2tnRqjdeD1QAQP+wzHEgNqi1sgx9rCFC18Aw4vfFCMLq6D7Vs5Ki
         sZtqilWWp9tgSUpLefXwswQSCjCSM0Q/b87958KqxC9wYS59yLdAAAQQkC18LEcBV6wc
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378506; x=1788983306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=Qb/alIg3zBdyoUvzjZfk9p/wQ1cMM5nNlrPhjkH5YQcdjlpwTfdQbj5zEQAqrC/IAl
         0prcijL4N1P/zx5yreUCkWClnqMo55wQxh8+2DzrEMRLtVbAyhwd3tuIscKj04E2ZRlu
         p3lgrAWjLsU8JMnNZQz23XbPB2S8PfjG4AKel+4Q30LGGAr6V2Y14T0NFfe88eZaOM0V
         o8Y2LISezrqoIf10RBmqUmjiTTyV3era24Raco+XoR/CqLg5GV9TKwBXKPwbIiWaO/bV
         FhSmBVFROUAx6e5u4zwYc9JkFRrBL3wFRSHAgbz6YCyoArkg5hK3GqamMK6SgAOVt8dL
         QkfA==
X-Forwarded-Encrypted: i=1; AKwUvByrFdGHPJOU6IkriWvv8zIqYj3T3xQVvObxcLanR6Gr1QybTo5c6QXow9hn6mhvZqvSlf2uLukEy6QS5sIhZGy+@lists.infradead.org
X-Gm-Message-State: AFuF++kc4n1pUunzkfgkbIVOUux0vzC/9FAaSonPwqM9LFhXHP5EVfyj
	uGt5axxU5qrJTxiVvxMoeVgY9wzcNjDK1rP7LuSjo519VjCPXGNEmGfYqiOfuB7uLwK+QaJ8EdW
	ln2vEdpzeLLvb5g76oQFjher/EoxVgEWt46Jtrye+Jmr2QeOPgqnF3MSWKGl8cghSp7pb8j/24z
	I42g==
X-Gm-Gg: AYBFou37X6102nDG4jb3Br7l1WTXHVzUrHFVkPG/NZWaMpu6TcWhyUOcj/GZl+gkMv/
	3B+KVwkLckqOtpci6NxU2xj4i0CjoSBrCZF517OSfFzUabYkYo0yn4K/87EbGp7GFbQaIx7+H4W
	3Q4ZNuTJjMPerHVDsh1UiqEeTnp72eOsXAqLX419j5rRTp8dg2Vpb0djfEaE+ZHYnuIPYgJWHyQ
	KxrDi9G54DqzsyfUVojdny4/VkcsilWtsI2UlvT/42oU8xQa5VmJT3N4eznC+mOBEuuhBNmi2TT
	yFX0QvMqK3Ra/C/3WxwiHea7Sx0/Ta8TOD6C8Nr1TBWH68UiQUkF+HELSytRMZiHqLacz2esSqp
	pMjxMJQG6I0bJ6NeB3AJIDn3kV6g=
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103553275ad.20.1788378505329;
        Wed, 02 Sep 2026 12:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103552775ad.20.1788378504916;
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
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
Subject: [PATCH v2 8/12] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:08 +0530
Message-ID: <20260902194712.2003414-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n3t7IOQx-iCxt-lDHrwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ymMriqz_hTpYPvOjUM5xp7HMPT6g53Lh
X-Proofpoint-ORIG-GUID: ymMriqz_hTpYPvOjUM5xp7HMPT6g53Lh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX95xEMQnTzV1o
 m5OTKQ4BVnBg+Mm3mBks6tjnNEGE2GFWjzWgtn1Q7d8+M5Ra+ngLpbgDZ7T2Yz9vMeIQdjhzLYw
 IuIzZPQTDxUamoR80fOyBoUX4W8CvbZHC8+JQ70SkZ98Y9hU4NurYUVqTArPhMdJVYh2PymOfej
 FvJ1nsADYaJq0mq4UCx6FpADotArwdzPxXSEOk9BpSEmFQnrMoZQi95LYqZlwlcz26KuTf+8hWd
 /n4pm62BwoNo4uTh3xiTe8A9mNJbPANPVaNUbaTyA1AOchsyp6HE6BJ85uXVxsKy75EkXc/Z/O/
 ccEkRTAk5w/gSZ9+bpJzCWAyqa1+n0E0uSFVT9+bRMhietP/Fyi819vYa+CYFETdfKcU5G2c876
 2TXTesDxmwpys6OlGQbOipdpShoq1VzQ7SAq/iz5TUeBb9p21oK/sAMBzyeYVCf4MCIKYViaVZ7
 d3/zRxfDM/e48mElTdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwA7+/XnBq9On
 LeN0oL5VpiDeOWwRFtTZ1M7wkTpQMq8fuDJG/x7O19IPzYpBDxVL4FsOXI2fgEZTU5X14ws43Yg
 /nXMdjibsYw5ZDcDDkgWeAB0xPK8PQw=
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
X-CRM114-CacheID: sfid-20260902_124828_356194_DA4BEF04 
X-CRM114-Status: GOOD (  17.63  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.55.0


