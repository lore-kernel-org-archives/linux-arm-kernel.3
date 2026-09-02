Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=; b=J1M3lNJx0ljreLNwmCv8RIZznO
	kRoCMOqbtrn36hDto/6yurxv19eQG0wq7DHu2cqp35DgvFJSPK0xs8OMOr14RQbCfJWyrHHU4vLRd
	38TcUI57hATpeaGMicLjdjcJpaxpkEzwmOLqGPvqIlk0eT8sOLCgGGfazZunymQ5V//oMiEHSlgNa
	c2Cm/68PlNJO7cvrFgg2xzjt5tkyLysyvxVij7I6pC22JIq8R59ndlVqMovPO/OMew7NvarW/vnIn
	ZfB4HLb0BbhG972/zOde7fZTY1Q1ZKpl57gKcDVggtfkRDqC0qM9d3CG09n98gTEn5obccx16XkSA
	VtOF1oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiQ-0000000FiO3-1w0G;
	Wed, 02 Sep 2026 19:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiH-0000000FiKH-3O78
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqqiC1650465
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pky4TI8eRbq
	ns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=; b=RV/Xwt7RZrZ9agEo3mszxkiGeHA
	3DS2rt6X5jRpdKUxHIuRp3P0uHlzAoi0EJCWLBVXH+jR3dU6qaIEoOa3DrhEXnvH
	OC2Zv+5agkA7CJqaqCiPCAcjoP0TKG9kI4eMmlK6AKTrmrpnyYgDVA0w9qh0g5HG
	L9kga+Bpm91fU6dLvwjNNWdKv+jcd2sxlvcNj46sbYNtWorC4pHgJHDR47xx0Es1
	ZeSIIQ9DtPoJNyZ8nwt4A3d9bcFuV8ONE1+vV1hX/F9Y+eJeEXI44QPJfZaSZdcz
	9v38RBzcJIgOGK8n0rHSQ2Pi8P6rFJKE26nqCekVnjhnYbpC6+xAvHmnpfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sm5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1955509a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377616; x=1788982416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=QAOnvbeBLo3dqUipAMeitz/qmgPEm05aPVlbvOCdyADMyIDvQvUCffCYZhvN6RckmT
         OFKyOU3IsK3T/3Npq3jdPOGkrDiPr8H1MPYtJTOyijKWIA3+gQ1KJzeME7pswqzw0vjd
         qZGJY5OJlzOkllLrY7bLXMhOJRmb/N3vsrcXMfl4r8PF05GRkXYHHTim0w5kGKFJHCoP
         HOeui1gGatQRWlyUzXglZGQY6me51tCdOYPFlW9sM8hp4b1BMhpMJSPfHVlWn1pletjw
         iuB09FBuLuDeNNoaS1aZCVyN9NXtb7vuGpJ3AhUFALhBkNZDq2UJi2EPxKskSKOQfB8M
         ueSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377616; x=1788982416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=pwD/h6IyRLTApO3en/BtwFEHa53NWAmXtgdyEHJVfJ7pcWccPvp/4Pbm23ZDrOc9E8
         7PR0esqYGKW3MBlhwEwsKHjZdWWu3Hwn12g9yO+Y7yamm9LZ94O2/lm0GDb8tvXZqIhu
         3aVd+j/0DCOiysTbgGtRexMTMKZHQPTlwEH+m8LvbSYB6YpN+0tbtvTqIrnGF0GfdI6V
         slEMDUz5FvpuCJ400otuT4rXTqRPgWUQrJPW/LKq0fTekgoB9cqJgFs72w0J3K4b+Dpo
         56VVdRD8+R5+wDbzAUSDLX/jP55LK1XnR5YDx4ZqTF0qHir1/BcpmcQweSRSUgX0UVNf
         JjEw==
X-Forwarded-Encrypted: i=1; AKwUvBw6QjbrcJT05lc4yRuJ/BswxHsq3XmbuB6Q6M47oW5yqP7nv1uJve9WCpWg34cwVVqncSfYZz8hJ6KTWATAV2vA@lists.infradead.org
X-Gm-Message-State: AFuF++mkzlOEBB26klImGYfG9jmQUM8NVtAITB/cXBHZ9J/QjPmunEYC
	lfmnc5TQq3NurTBkTppEQA8YJ5glf1OAOKVQctnvwxGOwVJh5/+Qgbcv8mf8Ey1puZU2sg+96pw
	ZG0FGwMousDkVJGdp60K1TovvmQN103N0mkJO2wh9bXCVA2o8/JADjjLZEkrI7CkpcWaZ+lzcYx
	sHrA==
X-Gm-Gg: AYBFou3ia9w07oSlMMOOl9BbN401kecYzeCedtOtX7dhlDcESovXqObzBYWo4GVmFPw
	gjgorNJRwTlVjDHaAGUJm7Sw/PSBdAFZQq94P03eCO3E6BaEFGV2Jxvi2q5G9lPo3aC6VWP+puQ
	ajc7k8ksWozRHyEr/nz3L9gtm+esHl9y+zcnZplJyU/eX94yvN2X89p/NCbP1oooAA85Ka46ZZ8
	BkBi9HGAlotGLccjZm0ljVVl13u7b65K+uhc6gYV9C3EGpye7EnVvGxGaw6kTm650e1EK7NphG/
	OIa5JYrMeGhNs7+TZZ5mRVAZluNuwGr0c226/Hy7PrcXrEGw5mAou0bciCvhNpK3DM8y0zs7Nj3
	BceQ8IO3/VJTSsKSosJ84DqEBpS8=
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083732a91.5.1788377615749;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083683a91.5.1788377615166;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/5] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:14 +0530
Message-ID: <20260902193318.1996827-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+cXzeF/ckiH9
 wWBPGwEqs96sTWqgWXfIv5Mws8b+uvkim/FdhIFJoCAeBTh9bpeDWMtX6uKbhGTykfA+pfpcoSV
 wbqUf29RBeknbPElDzW54HzznaJIcr4JO8KI9AJ2c3jNk09suD//UlvErtIqlggM7XEmhYqhFmC
 gh4RjWFbapKTObSB5GZqmJuXuEVW4pOAQ7TCMxyj7R0JHW6CTAuvDQLelOVWQvMwgE1pYMviy7i
 fbJ1IwhcjKjEWbOsMUBkOkvyRf0vBB464j7goxk2uC0+l8BD48Hvr1h+et9H+SRxn7sZfJtP89K
 ivg/Fy5bBE0ZDyv9S15kENtX4lRQM8m2za5dPcSTMyABkffl3GZt8GxLBrfL/2PUt5fjmPtjx21
 oPMvvQ1jz5kx0fqSdL72KUTdhlau1x1zvaprMGJ4nJzdT87Vd5gb7U3C9yh0zFwnz7Bz1xhtUKf
 1bvqaF1GRmmZeqh+FBA==
X-Proofpoint-ORIG-GUID: NKp8c6G2GYe2UdSbWkx2dCachDieEMuB
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987a10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NKp8c6G2GYe2UdSbWkx2dCachDieEMuB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX5AzKC+V9fSAC
 HynB/8jVlgMHdHf0Pq9HPNhR21uFZ+1IZV1Qm5PjQ5+9Vn7JxOJe6rO7BiAEpa/Mvw4YUlg+BGn
 Hn38TeU8gpNxZqHDa78LKVjDR/ni5RA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123339_313831_F124745C 
X-CRM114-Status: GOOD (  18.28  )
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

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 006fa7b56727..f75a01f9104b 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.55.0


