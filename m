Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FCFCD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=uoGvmDZR5UZaUQiWvGrqdEZGCY
	LT9G3WSyKx4Lb0rlFOY61IfjDy6DMx4NQTN459I7SSdFHt4b9Kw1FE4t9xwXdZdCitMqgK+saSDvg
	Jz05qugQkeW8wqfHp+9dkInIZYhCPHk3BIuWl+BaD9UEOPn8oTb+su1vivmG6U4zL/TCPDm1e0bPB
	D6lg02QeZdTJKznzK3SfgFYE1rTku0REQasLcqcObSO3uvr3B6B2KFA4RYDAFKV+p975d7AD0XQrc
	xWfPgFAUZT+ZYMNc11ZVmIa9VFRGbSo7Sp6GAR+DSLMVzF5i9r7G8FQ5dYlcx0hatrM7/5QR/SKlv
	cDa4hmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZi-000000021Hj-3kUF;
	Tue, 26 May 2026 13:12:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZR-0000000212y-16x3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsUv12385430
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=cspD0rS6sTsjkg7u
	bfnpRSKD5iF0h0G7DucdneVgcRKFyG1NcCe56UvgrS0m3zfeUhmkoCx9EiPKsU7o
	0iQ6glcxxD2Z/JS7lRFH6XwLm/xO29Q/FrnWQXJiErOWc0IDwTX+xoLoK0TSIjh2
	hF3uzVEE6j0nsdJYODyPC+WMvUEQW4NAxZLJAPX3lxBk6wQ0HsB1TotzrSy0kuzj
	KkH1koxNG9gKKYk0gbLju5syns5Zk13N9sAb3/T+bHmS+Q4JHbZZmPcKqsWWnm4l
	+m6jlUoR21P2p0dmZSfZh/FGO/4QuJy6J/aOJpQkKFigYLweuxXPvWwpj4R+T2KP
	18DdKg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs4t7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fdb602477so3200077241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801103; x=1780405903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=Y0vpg4TrpRuKk6Ah8JIgO+5ZV+P3+Mo0ORybJaJTLDLXpFVMZZsqtDFXTnO5/gvJWM
         gkC1kAGuTBZlK/dhPI7mYlimVl4dNStcehmEhXXyHl2r3AZ0iaomAr2MYDflr/qGC36w
         vg38Z6w8ubfINzVKRG3y1xQFlb7Bb+lG3b5HH7IwGhu7oA/h6lsMNMM+Rvt57HKQD8Jf
         wshaPGZqPWafY14XA9d0z90T/2ypAo/IzBgNeEkXzsyJcbBTmYi/dO4MAqxJsCmtEUG8
         fetunN5rLZYulNaNLTa7JhHQQ/7QwywIvE7oGmwwkHC3y5UM3XTeLfpr6Kb79zcKe5JM
         AKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801103; x=1780405903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=Wuo8yp4GUnRhZXpwOEs/Dq8/hEnAA8KU1NB83RzgY93mBWsAPfzgbPFQEPLbCulSdG
         TTU6O6zQCYvxqgNWeraRHHEX41/8rgd5vxK2uX180BrzrHFva4adLtHc2GJpcFDJiQfI
         7J11zVj4vAv42RAJrf12Ec9fdNA3hKuSHOwUu9KFbeMk9QF1OvBYfjrO+iwyex7jNWKZ
         SE1cYGaSlvf9bT3y+59zDjcikZjSjcE3h407rJK7qZM4HfZlgXy8LyXrxl/YmuAY26KY
         kw1ussLjuRaaZXeGwtp1UlC0piDIa14IRHlALiuSujUA9x1BjRpUpVeqPe2WxV6OdKUp
         j5pg==
X-Forwarded-Encrypted: i=1; AFNElJ8NG7VU+9bGPzzGCxQfrKVPJr+SMqVYNe7vZ8yqqy0LFRMenq9e3tirBsN7BsWxZAlZCIQE+AFcKkWgFLjvRIVc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+kA4Y4LOgkT/brZL4EnHQIXj6C+HLRSpYTHEphA6c2K7XhTnB
	6Rbhs4u4kAMRsXClT/OMk01X8AHBKv6rpJnNsuaYUfnm2SJKwjXwL93JPOgpiTC5xuDj2Z5bYMo
	kKPz2XuTh9e+KcAIICDtcXcZqhxlACMGjIRTaXKt4hJmep6ceE0tOWg7SVMNgrCp7XHntj2whAT
	IDAQ==
X-Gm-Gg: Acq92OElmCw88BoYn4JAgE1qax4w3EZ38tH5EiZrRkNP5Nbzt3zbfb197GsfealGt7c
	50WO8ym+c82iYpbaowqs5J56HPtju0ISkRrgMRdjB06lsm7r8A9g+pN5P1ojxJJGA7ZOfOSNbsI
	LB4TVuAOEIXHJkF9QXq0jHghYVxSO4i/cj0U4q322cUqOMyIrhiph343bCnpc8yveX6NuTqUTLg
	C37I/Gc2CqD5og4+kOwlgKvFNQQixXX5K7JkDgWVJL6NTrcFKvgWVJo6RxCfz2GCW0X9bH+uwhM
	xNrs05Su0duwEB3qWDDS9kZEHJS/nzTs4tR/T7uIyKjYAcgY/U3DRaOBLJk+DBNUrI1T3ehquVX
	Mml7w232QjNShJExOwYG+CruVWDcr8L6blw4RvbjygHelVIYxQ4k=
X-Received: by 2002:a67:f0c9:0:b0:6a2:b2a1:f16b with SMTP id ada2fe7eead31-6a2b2eedf2fmr838049137.16.1779801103300;
        Tue, 26 May 2026 06:11:43 -0700 (PDT)
X-Received: by 2002:a67:f0c9:0:b0:6a2:b2a1:f16b with SMTP id ada2fe7eead31-6a2b2eedf2fmr837981137.16.1779801102691;
        Tue, 26 May 2026 06:11:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:11:00 +0200
Subject: [PATCH v19 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-12-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlCDdZs7gUpD6zwuSqo1JfGszglD6fOxI/qdoCA4A3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvyxtIGKA2Vmr0u0AYd8STPeppQGty0OScL8
 8apQe7FnpeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8gAKCRAFnS7L/zaE
 w8m0D/4mgvjO7Uz6sv75n83/rB+J52BwnHz0D5oCdqHB6tP58aeaPBALp4NPIhjYp1WXa2XOZbV
 z6Z1/3qWhI1PW/7xICXkbEPQUw96HDBvKO5hLpECMk+fg2kAx8SWXYV1NgS802BqvBzfAarZdN4
 rTsUu9TU/KvL/rQ+WKevWktlM1IU5+Ap3ptONJbiH21u5xG2LgGj2XsK4mTplzGDjFboFYHwYSn
 w2MMA5EvcUnKPSD6y+aqDh8KJ8rcW8xpORzhh1PYIg7Dmha6dwOVmGS7Lkho6qi6f65tT9ypEcr
 1wELkDhoRJWUrm+sL7R8NiH4hC5pZLRlNoB8IVC1h8rlKaflRbJa0YmLKnGSvgd/A+42qdz+F9r
 O+qO/vh03yWvwvhStIw8IB5/udkss46ucIycYZYaAWnLdFxTbeQNUC+oE4yhVod6zOyswGg7WzH
 UtvOfVk+/Htqtw5izaR9dokS6e9q31ehyBpb89iuKiDgoSz7QFbORavNzL1Yq0rap9Rgtb4LKGJ
 hYzrZzssf3KeMoyp226WK1En3/hffY7I72gyELAm57obdyhduc6GH+3XUxh4o25h4WGhY+NytTq
 aCtYWqkTX180KClZYYVOcaCGF2ycGKJxhL9Fis5S/Nsul4huqMqU7foj7xdrrFyUB3iHv9Eyt7q
 2OPn93Ny9vBZ22Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a159c10 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PvQi3wFyUPD9DQTrhjL-1DgaBNnzpmBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXyl7Ds1+zLr+T
 z2gma42uq6FfwJGLiYMyJqhAijkvtii8EPCbb/wUgQzXOM60QPCtVnLTUCKXdoOphFX5cZbqI2p
 6Csxj3UK7TySEdp8UheNt+TS9zYyrQ2K+xBRKz1kEih3/4RJsSU+MwIrnr1A6dNWR8FaLcHGL31
 Y5WXnCEboobHBToaY/rOV5xicx8uuhBqP9xYhLagaWh01hCxv1y3KYrA1yelLLLICTjJf+sd824
 WxUILjkFnNAiKz0i6zyxOb3TB6EJyJKqFyEUw4ERJqo1p1Og9B9PfA4AtOSc4dE8Ume6FHuermy
 RZOS0ef+ymNpsws5TvVE0HgatyQU23q8YEbi4Q3pv5STDuxnwvzloFRW3ynr4soRwOhimtBXM+l
 jKTF8hHzjDwM/53b6Vl8YSSA36q1rErxxgVteIiuP/CpgeXbIBBC15recewfPLM76JKm31w0aAx
 3eK2ik7hxhcrVsrmkng==
X-Proofpoint-ORIG-GUID: PvQi3wFyUPD9DQTrhjL-1DgaBNnzpmBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061145_427686_4C5E4401 
X-CRM114-Status: GOOD (  20.21  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a0e2eadc3afd5f83e46724c8bc3e3690146b86ba..d7b7a3dda464964afe6a6893bb329d5bd5759dcd 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -255,6 +264,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


