Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384AAC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=; b=oYXjSkAINuIDT7BZR/gN9A4zQP
	4Ii25nXJtEBUynIRxxmbLmff96KfQ+5Hp1rpK9Z1Nhw3ZaUCBiUbDeOJJBz7pJDbQ0w3PGEVY1or5
	qqN+mjYcMYqoFQAue9pgI060hh5l5KsFgJhrDpfbNLd4ZGFENq2/YhYxleF3BCVtI9BN5qto1TGlV
	n5sshAzkVhQiGcte/fWwy9XS2y/veV1gTTpQfRUVjM1lI/vmxMy1hNpkZZWkG93lCLncWWN1lfQga
	7bNAzanICJgWH1gyLs1FM4YoSqfE0f4F280YXuwYZ7wXD72+0bUn6WkbboYz24o+pzIZ1zX8Xfh14
	XI3rHKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwL-0000000Fm9e-3yP7;
	Wed, 02 Sep 2026 19:48:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwJ-0000000Fm72-1xvZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrglR2730686
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=32EdoVp2rW7
	rCpiVn+zEPU508NjDuMsP8in1gDPigAw=; b=JtsacYbKfJVs3Ni2QzCap4OTDNG
	/yHIFyKNw9eD8ooS9U6Byunnukn9ZAOAhbm4lVLXMNYCVWrxAAg6S72RE/LfntRI
	L1SJ+w6RfPMXInR9O5xSJOnxT0JzR6K6/QA/rEEyEYKnL43Bi6aEKrmik0Gxd5ak
	7eM4lhgrX/uufETpJNAMsedDd5V4j/dhF4/Cfd1RA978Hos6JzueVdJsdhZ+Tb5x
	+PGSrN/QBLOJOQIY3GJp0cAR+6qZvnTzf/MBhQJYkLA5S05owph0qHYfhi50VnBD
	BhhD3UleXckCepqAoLX5CtdpJka23y+XozayC28DcCW0pLU92wacZcAaKdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2pxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f75c1219so29459815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378485; x=1788983285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=hNvSZHeI88a0laLbg5xrnNWX2HR1qRqaiwT7p4/yDZ1hRzwGl/cZn9go/plk8tzT7I
         poTI2orr8llop29ioG2r0t7OPzt/PS+y5kfwm3Hm0DuwNDeNJGEfRUCYXoWCCJnDGW3p
         GLwfQ4F1arM1wekVisiv2qAuWYzjRJo1I6783jdTVrqLFUsCkKqvqpzmAcsGbSSw/qH7
         xQxLJm24+tKMT6lslhjGDvz/tGlc5J1hiJ17Sm6E6/YRwlAS7qDCjQIEEi63NfwOmwZC
         fvHoNBHy0Y2hpzYBjP9TAU2F2KGXnlGr+qh7Y8Usa37uTlxhcl0FceYeKJFifzjCDXi1
         YOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378485; x=1788983285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=ew+IQbrPBeUcp+Qbd0kqB2VRpKAIrP2QoQs54QMSldoAOJrI+BGlEAZhNJUw+qqZww
         yDcmfcpCP9LfBRzA9y7Cfmbnj2DRGI6NSL1UlpPr8+oPRDdmN5eAfIlmC1+AsWB+2uPS
         nlPwqQZsgeXEVUreUl32TOLJ8NMZbTJiv0Ojq7NvSpeSN6WwSetMDaPEJSA5J7LmAuEX
         +E1iHY8bW+p9fNcC+C4ka8mnRx4SrBI0S1P7uCTaSsN1BK36QOjHUJOw0H3aKi0ta/tD
         5v6oXxe0XB60FvtNUAnLGPi/6YvWzdwEr8EJSvFt1uOq6fASdmy18ecEiNlzklipaSoT
         MTQg==
X-Forwarded-Encrypted: i=1; AKwUvBxBSIx5l224u8uExm/fOQ7Ev25poRRNQOBMsfc86E7slB0OpgjFvG5uiCysJFa0SnYMKgjCDT4VZV9r2Y8JKJPB@lists.infradead.org
X-Gm-Message-State: AFuF++lOC7OuOL1eDOXyVZW3QEHJATUGnNbwDDFPLqDEpbGBlmt+Gtee
	PTM4xaqCv95ow62BGAM3ZUQRtQNq7NV3aFfeUB59O0J7PzEfPFHpgO/r6f6ns79Fy4QBqFQDSLJ
	7I3c5a1o95L3p0FSirQSt91bibCmlpCosaenFbE7uRMAdSRWIytdacSuUEtMtUodg4UJE83l+1D
	TFRw==
X-Gm-Gg: AYBFou0PO1Z+AVs0xv8q5+beaK1lCCP+foMc93uJsQsvOsBVcgot52O5FHjnCS5j24t
	DeOTW17/j9Lhy4cirbJ941hPIjEVoF6pDxSXWy3BvqoJmQm1es/19ljCgBxCk2BczJGarZz+D0t
	2inNgJqJnwrnDZ1u3DImS+cSJezcNxYzwpA/2TWcJX4tab6OpoqzBP9Kvx84kEkxTceLP3vC8mN
	T3wkVUySe8+J1ZxpWwQlvdHqryt/+9UcM48b7MVybnHJ43HLxnYJPYsNPY4PQELDmUs14PeUhdy
	q+h2ifET5muxD39watUZjSr9hgrVY6OTLH/wb7qv4S1k+sPbk3WO53fTbJwMmOljMGG9REcnb0M
	czCh5K9dcL7a4Q+afwMdnffM3zio=
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88330365ad.0.1788378485329;
        Wed, 02 Sep 2026 12:48:05 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88327845ad.0.1788378482601;
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
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
Subject: [PATCH v2 5/12] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:05 +0530
Message-ID: <20260902194712.2003414-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d76 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=iqpFDo2SwQq5gjaSpEAA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: v1NsAQKS7jvv9S76H373155AWN0LWIkR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX9mqKxnV6ypcK
 I4iU82jvnbg30QkWykEVzwKbUDgAYWWsGyWpyd+mybAVXU4PzdmLhZcCvuQU4aTg6S7sDwvJ9Nd
 kB93DQmVY70erL9Pq+C6ABV35KqmhRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX80tZ+jOKonVq
 ijDJ83+zme4Jrrzkb2zw9g5k6O08W/DMM2SRXZKxlOuZ3uWxDnvTofV/cz0NTphvVsxwa6tJj+6
 I3J9U+MTwQ4/gKt9AhvYrS0WI2w1HItJAFPagKdJX9UAbaFGLfXO8DuDmPiCSqeo1BVKVGyImMX
 4nM/hqPDNDWBqBO0XtOnq77ymfrtJybDd7F57v8JhYPvoY0PJHxuY0U39QVocvhGZ6JjNEYA29s
 l0xPLEUiyc/ovK2EMocL4DxtWqG+zAq6MtHaXHiBBfPP5XtprV/eI7IrfYiBkls6ySlbsssyQjQ
 7pH70qyQExJlqgrSwfPSX4NGIcgsLRNz51GW3RTdxfMPmXJ47Ko0zN6SV+AW8L6T0Gy5YKmtNMX
 CBP0K5vZ/XWgJQqy8xqQevXsDu9y16qZRGGCurvrqXCASKGLvGt0TyODuGF6r7L/nkg2CSPGyAP
 gpV3eH4QlFD2yv+FSdg==
X-Proofpoint-ORIG-GUID: v1NsAQKS7jvv9S76H373155AWN0LWIkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124807_618012_8637DAFB 
X-CRM114-Status: GOOD (  18.02  )
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

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.55.0


