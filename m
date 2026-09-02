Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67ADC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=; b=gcTnSUbvlJb6/hWWgARicepTAX
	yw7Q5x7d8PpZ1oqKjvKnF5UpOhTyEm0XE4ls4TyrXb5RNPuqO6WRaVtGz1DXanNMkwMZNxfsuTo2u
	/kUayAzvJM5EnM1jJhLlFF5nHKhUpNsicCl57l46jnrOAMHQxOjhNFj4WkQBuW07ud9HvyTAywohk
	tZiuOMlvqC4kzJLajAP/Ml5d4unlkOoh30Oa3ZOJBS8Xr+4IYQI5rDU+KOIG+RsCNC+uQTUqal8Ms
	kxfNiMZ9+biLaH6naS7ex1A1z+5Z8TD/NFpE26UCUIHXxalKIZZv3Y8kruWgG7uHQ5CeAm0To55NH
	bB1RkwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qig-0000000Fiag-29XF;
	Wed, 02 Sep 2026 19:34:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiV-0000000FiRo-1iFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrGEj2373699
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bV9bUhXqj7T
	xIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=; b=MOsPBp4xt1VzCRNrZRrItXHJBMz
	XVTx9cuOEyFDux1gFol6vnj/1L9K68qsg3Q+9ZWsWhlYVxQMGycejHda//PVXU8e
	PwX3EH0jAyqEw0eXeUqpCwfJmRM1fJsz3IFuvKytTOEO1Bc2LOUNvNlzBZHzh7Q/
	q/pcTjrJC6P48nptcUjXUsUT39jtCjxZuHa50I+iCNXki1L7YNv7186I4AGe1Jtp
	D5yrMBTx2j5+d8D5p/dvLArsccJ2pbdEUgWfnVFjKuUSqIW2S3LBUxhzRDc/D0IB
	XCZwfz6lxnGH70n/+x6y94ExcmVWzxIOeLbQn8Zx9XUxfZhO2HwiDoBPP3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a3vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2498731a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377629; x=1788982429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=UcAn9AZWqLRLDSzSBE9e7ukvbpAZXE3z2MeoeOm6g10MXeIkw35DIS77GyLG+lPjAU
         R96d10hBpBGfOlLwB1QqMWAhIJoIP2dlfXa+clX3rfr4lCBVCvqxLcN9aO2ZWSBpKIQq
         ++dtnHErPi1LHslUhlJG1U0oIOMXL9kytspjzGeMptHGLJND4q6+CQCvEuvCgeRfJPCe
         slT4qifBuMfIWa0XY1di3DRuiwWcOVEA1l8m+okUYayw+tqG8N9sY3oK2MOtvZveMSsp
         ADWd7DcIKt18qbcpSsednMRthWml9NPuiQCKOsnSX1DEVTgYnY4CZnndn8P+WJcuExGj
         RJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377629; x=1788982429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=gmOhimjhkIFczkHyZUB7lTarQmHxbWqeb6OAKs7dT2lwXwFYBwEOTxKMGRu8mEzIro
         COr2vU0oNC9X1DD4rYKhiP9OgO2xmEmf8z0tF4mHjrfRGsesl79g8EWTqqsBPcbOAyeb
         QDv+/ouxHRdRp/4XJELl6uDVW07mX3BBuSyFeXGMRxBPWS65ZIkwBfyJqPpfQMwg6X8s
         C2ZQ0Y8HYqDWnexR5qWgTWZcx/c4Byq6jfQvM+a5U2sAi/lUFwLhTkifMi9igc3ti2Ra
         QveoASjjqStIZea54nT/AqSK7HRoAp7HSRCVaJ4klqMlBdRhPkgyzPKtt4oUb4sc5llz
         yBRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxku3DzghIlwHfc10cZ5ilPtyhBTGWI4INGEAF65wT4OQc5CS1cyHEp4Mn1dreA9tV46zxZXRLh4zIvCap4KavA@lists.infradead.org
X-Gm-Message-State: AFuF++k6zrz7OsgcBbpR3xgIdyGmrZgL0ZUMkLYb2E1FASeGPuZfwex5
	ttOs/1EtVBICzvyalj7BfJ4kGQv14mFyNsw0Mfe4fG8g9PcKhH+XDDyalPFDHKf+2CXO8jkWtlC
	Axw8Gbtrm1WKb6A0iEtGJPMjEwl0gi6sSgI/iWM4bVJ/Ti7nFkhCFIshfTFa63PgRTmi778t5bA
	PX7A==
X-Gm-Gg: AYBFou3IhTtnRb/p/lNC54DS2jm/rqdf+MLdcMz6LHQnSDz8g7I0jjAg/eC1NpBbzwz
	vYpXtPxjNG+HOLBt250xuq/Bw+BeKbEnwLwVJBXnwmzHHOQ5UFdHTfrPR3UpY3WqerufonpsMEv
	yLeTwJog06acZsbRsIOW8DbCELYU3Ve7nHqQbtIRKwe1gJzBP8vtKL2jzrBqeJbSYima86O7Exa
	w4yoRzusUHOXRxK58E+r27Lo2rPen09/0gnJa1n4PEwd+gQhMogqpiNMiYkKx0yus9lQAkR9+a5
	KQdYc5k5GvUdcVT6Pn24j1Oc6frULlvstVd7ee/Aa48+sajWyXzX0Blh8HOvMexvoM/8BI5sFbX
	58tvDe2TxvoO26DSBllc5dr8fh5Q=
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174136a91.14.1788377629416;
        Wed, 02 Sep 2026 12:33:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174076a91.14.1788377628898;
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/5] remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:18 +0530
Message-ID: <20260902193318.1996827-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kOmbxG0li_0UoKz8YxCUIk7E6aUcVyRE
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a987a1e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7v6Lk8RlztZ-GcM17LUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX61LpLprqH7Yy
 mX+5OgRVLCyx46RKh1I1KZ9XlVlOiEtzzM8JnNBibcKXx6t+MRhfdkmF2mLCAJ4G9PRgmZzHXNA
 5kyeT2lqwgnMd4D5QdGkjxB1NVvDQ66OZzzeWH2kiqVuje820aFyUoF0kHv8D3uFKtx2jGoagHg
 l98x0g6qNrQc4IAhr/gmmerLAJfz9co9BIbDaQeTWwxdWK5KhlF62bqjrgU97bv88XANhu2DKXu
 VKWK5BgOdo6SA6wT8GKJ90blG9j2FoKukApqaAdLhZdaYzlDChOhbQ4xQmWluzdNsxmrlGvCAD0
 TttmxtSpNP09BDz65iYIFCuZ/qY0BxdTByE1VtBoq+hCmNdrmpwoxmhs/C1Itz74Bupd32nGQeO
 ZN4DcfwZZ2I29paCkv55HZJVNuPF8FkwUhpIu2RfXIp4UWBCAYV2fWglRx+cxJU4gzDxH5Rh5ZJ
 Sdhyp7NKX/SuAuROC2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxQw5KbztgK10
 Kkq3MmXcYCKzbJsMawfDOy/36IXx/Xfi6T2L5QcDKtP8V4uYM04OCWnVIhUK8C/QFb9yj68yJRM
 RJ8iC8qrt6vDsOxyQ71GmqSWxZjZNjQ=
X-Proofpoint-ORIG-GUID: kOmbxG0li_0UoKz8YxCUIk7E6aUcVyRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123352_165449_41A0CC85 
X-CRM114-Status: GOOD (  16.22  )
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

Replace the hand-rolled devm wrapper (k3_mem_release +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically. Remove the now-unused k3_mem_release
exported symbol.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_common.c | 13 +------------
 drivers/remoteproc/ti_k3_common.h |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..f08b9e373220 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -458,14 +458,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
-void k3_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-EXPORT_SYMBOL_GPL(k3_mem_release);
-
 int k3_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -486,14 +478,11 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	}
 
 	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
 
 	num_rmems--;
 	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..9a58aeb3867c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -112,7 +112,6 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
-void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
-- 
2.55.0


